using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Domain;

namespace Managers
{
    public class CategoryManager
    {
        public List<Category> listar()
        {
            List<Category> list = new List<Category>();
            DataManager dataManager = new DataManager();

            try
            {

                dataManager.setQuery("SELECT Id, Descripcion FROM CATEGORIAS");
                dataManager.executeRead();
                while (dataManager.Lector.Read())
                {
                    Category category= new Category();
                    category.Id = (int)dataManager.Lector["Id"];
                    category.Descripcion = (string)dataManager.Lector["Descripcion"];

                    list.Add(category);
                }

                return list;
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


        public void deleteCategory(int ID)
        {

            DataManager data = new DataManager();
            try
            {

                data.setQuery("delete from CATEGORIAS where Id=@ID ");
                data.setParameter("@ID", ID);
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

        public void addCategory(List<Category> categoria)
        {
            DataManager dataManager = new DataManager();
            try
            {


                for (int i = 0; i < categoria.Count(); i++)
                {

                    dataManager = new DataManager();
                    dataManager.setQuery("INSERT INTO CATEGORIAS (descripcion) values (@Description)");
                    dataManager.setParameter("@Description", categoria[i].Descripcion);
                    dataManager.executeRead();
                    dataManager.closeConection();
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


        public void updateCategory(List<Category> category)
        {
            DataManager dataManager = new DataManager();
            try
            {

                for (int i = 0; i < category.Count(); i++)
                {
                    dataManager = new DataManager();
                    dataManager.setQuery("UPDATE CATEGORIAS set descripcion=@Description  WHERE Id = @Id");
                    dataManager.setParameter("@Description", category[i].Descripcion);
                    dataManager.setParameter("@Id", category[i].Id);
                    dataManager.executeRead();
                    dataManager.closeConection();
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
    }
}
