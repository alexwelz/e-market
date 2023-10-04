using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Xml.Linq;
using Domain;

namespace Managers
{

    public class ItemManager
    {


        public List<Item> uploadArticlesList(string query)
        {
            List<Item> articles = new List<Item>();
            try
            {
                DataManager dataManager = new DataManager();

                dataManager.setQuery(query);
                dataManager.executeRead();
                while (dataManager.Lector.Read())
                {
                    Item article = new Item();
                    article.Id = (int)dataManager.Lector["Id"];
                    article.Name = (string)dataManager.Lector["Nombre"];
                    article.Description = (string)dataManager.Lector["Descripcion"];
                    article.ItemCode = (string)dataManager.Lector["Codigo"];
                    article.Brand.Descripcion = (string)dataManager.Lector["Marca"];
                    article.Brand.Id = (int)dataManager.Lector["IdMarca"];

                    if (dataManager.Lector.IsDBNull(dataManager.Lector.GetOrdinal("Categoria")))
                    {
                        article.Category.Descripcion = " ";
                    }
                    else
                    {
                        article.Category.Descripcion = (string)dataManager.Lector["Categoria"];
                        article.Category.Id = (int)dataManager.Lector["IdCategoria"];
                    }

                    article.Price = (decimal)dataManager.Lector["Precio"];
                    article.Price = Math.Round(article.Price, 2);
                    articles.Add(article);
                }

                return articles;
            }
            catch (Exception ex)
            {

                throw ex;
            }


        }
        public List<Item> FiltbyName(string palabra)
        {
            return uploadArticlesList("select A.Id As Id,A.Codigo As Codigo,A.Nombre As Nombre ,A.Descripcion As Descripcion ,M.Descripcion Marca, M.Id Marca,C.Descripcion As Categoria, C.Id Categoria ,A.Precio  As Precio FROM  ARTICULOS A left JOIN  MARCAS M on M.Id= A.IdMarca left JOIN CATEGORIAS C on C.Id= A.IdCategoria  WHERE A.Nombre LIKE '%" + palabra + "%'");
        }
        public List<Item> Listacompleta()
        {
            return uploadArticlesList("select A.Id As Id, A.Codigo As Codigo,A.Nombre As Nombre ,A.Descripcion As Descripcion ,M.Descripcion Marca,C.Descripcion As Categoria, C.Id As IdCategoria, M.Id As IdMarca ,A.Precio  As Precio FROM  ARTICULOS A left JOIN  MARCAS M on M.Id= A.IdMarca left JOIN CATEGORIAS C on C.Id= A.IdCategoria");
        }

        public int findId(Item item)
        {
            DataManager dataManager = new DataManager();
            int aux;
            try
            {
                dataManager.setQuery("SELECT Id FROM ARTICULOS WHERE Codigo = @Codigo");
                dataManager.setParameter("@Codigo", item.ItemCode);
                dataManager.executeRead();
                dataManager.Lector.Read();
                aux = (int)dataManager.Lector["Id"];
                dataManager.closeConection();
                return aux;
            }
            catch (Exception ex)
            {

                throw ex;
            }
            finally
            {
                dataManager.closeConection();
            }


        }

        public void add(Item item)
        {
            DataManager dataManager = new DataManager();
            UrlImageManager imageManager = new UrlImageManager();
            int aux;


            try
            {
                dataManager.setQuery("INSERT INTO ARTICULOS (Codigo, Nombre, Descripcion,Precio, IdMarca, IdCategoria) values(@codigo, @nombre, @descripcion, @precio, @idMarca, @idCategoria)");
                dataManager.setParameter("@codigo", item.ItemCode);
                dataManager.setParameter("@nombre", item.Name);
                dataManager.setParameter("@descripcion", item.Description);
                dataManager.setParameter("@precio", item.Price);
                dataManager.setParameter("@idMarca", item.Brand.Id);
                dataManager.setParameter("@idCategoria", item.Category.Id);
                dataManager.executeRead();
                dataManager.closeConection();

                if (item.Images != null && item.Images.Count() > 0)
                {

                    aux = findId(item);
                    for (int i = 0; i < item.Images.Count(); i++)
                    {
                        item.Images[i].IdArticulo = aux;
                    }

                    imageManager.addImage(item.Images);
                }

            }
            catch (Exception ex)
            {

                throw ex;
            }
            finally
            {
                dataManager.closeConection();
            }
        }

        public void delete(string Codigo)
        {
            DataManager data = new DataManager();
            try
            {

                data.setQuery("delete from ARTICULOS where Codigo = @Codigo");
                data.setParameter("@Codigo", Codigo);
                data.executeRead();

            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                data.closeConection();
            }
        }

        public void edit(Item item)
        {
            DataManager dataManager = new DataManager();
            UrlImageManager imageManager = new UrlImageManager();
            
            try
            {

                dataManager.setQuery("UPDATE ARTICULOS set Codigo = @codigo, Nombre = @nombre , Descripcion = @descripcion,Precio = @precio, IdMarca = @idMarca, IdCategoria = @idCategoria WHERE Id = @id");
                dataManager.setParameter("@codigo", item.ItemCode);
                dataManager.setParameter("@nombre", item.Name);
                dataManager.setParameter("@descripcion", item.Description);
                dataManager.setParameter("@precio", item.Price);
                dataManager.setParameter("@idMarca", item.Brand.Id);
                dataManager.setParameter("@idCategoria", item.Category.Id);
                dataManager.setParameter("@id", item.Id);
                dataManager.executeRead();
          
            }
            catch (Exception)
            {

                throw;
            }
            finally
            {

                dataManager.closeConection();
            }


        }
        public List<Item> filtedBy(string field, string criterion, string filter)
        {
            List<Item> list = new List<Item>();
            DataManager dataManager = new DataManager();
            try
            {
                string consulta = "select A.Id As Id,A.Codigo As Codigo,A.Nombre As Nombre ,A.Descripcion As Descripcion ,M.Descripcion As Marca, C.Descripcion As Categoria, A.Precio As Precio FROM  ARTICULOS A left JOIN  MARCAS M on M.Id = A.IdMarca left JOIN CATEGORIAS C on C.Id = A.IdCategoria  WHERE ";

                if (field == "Codigo")
                {

                    string filterType;

                    switch (criterion)
                    {

                        case "Comienza con":
                            filterType = "'" + filter + "%' ";
                            break;
                        case "Termina con":
                            filterType = " '%" + filter + "'";
                            break;
                        default:
                            filterType = "'%" + filter + "%'";
                            break;
                    }
                    consulta += "A.Codigo like" + filterType;

                }

                else if (field == "Precio")
                {
                    string logicOperand;
                    switch (criterion)
                    {
                        case "Greater than":
                            logicOperand = ">";
                            break;
                        case "Less than":
                            logicOperand = "<";
                            break;
                        default:
                            logicOperand = "=";
                            break;
                    }
                    consulta += "A.Precio " + logicOperand + filter;

                }
                else if (field == "Nombre")
                {
                    string filterType;

                    switch (criterion)
                    {

                        case "Starts with":
                            filterType = "'" + filter + "%' ";
                            break;
                        case "Ends with":
                            filterType = " '%" + filter + "'";
                            break;
                        default:
                            filterType = "'%" + filter + "%'";
                            break;
                    }
                    consulta += "A.Nombre like" + filterType;
                }

                else
                {
                    string filterType;
                    switch (criterion)
                    {
                        case "Starts with":
                            filterType = "'" + filter + "%' ";
                            break;
                        case "Ends with":
                            filterType = " '%" + filter + "'";
                            break;
                        default:
                            filterType = "'%" + filter + "%'";
                            break;
                    }
                    consulta += " A.Descripcion like" + filterType;

                }

                dataManager.setQuery(consulta);
                dataManager.executeRead();
                while (dataManager.Lector.Read())
                {
                    Item article = new Item();
                    article.Id = (int)dataManager.Lector["Id"];
                    article.Name = (string)dataManager.Lector["Nombre"];
                    article.Description = (string)dataManager.Lector["Descripcion"];
                    article.ItemCode = (string)dataManager.Lector["Codigo"];
                    article.Brand.Descripcion = (string)dataManager.Lector["Marca"];
                    article.Brand.Id = (int)dataManager.Lector["Id"];

                    if (dataManager.Lector.IsDBNull(dataManager.Lector.GetOrdinal("Categoria")))
                    {
                        article.Category.Descripcion = " ";
                    }
                    else
                    {
                        article.Category.Descripcion = (string)dataManager.Lector["Categoria"];
                        article.Category.Id = (int)dataManager.Lector["Id"];
                    }



                    article.Price = (decimal)dataManager.Lector["Precio"];
                    article.Price = Math.Round(article.Price, 2);
                    list.Add(article);
                }

                return list;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}