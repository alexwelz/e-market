using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Domain;

namespace Managers
{
    public class BrandManager
    {
       
        public List<Brand> listar()
        {
            List<Brand> list = new List<Brand>();
            DataManager dataManager = new DataManager();

            try
            {

                dataManager.setQuery("SELECT Id, Descripcion FROM MARCAS");
                dataManager.executeRead();
                while (dataManager.Lector.Read())
                {
                    Brand brand = new Brand();
                    brand.Id = (int)dataManager.Lector["Id"];
                    brand.Descripcion = (string)dataManager.Lector["Descripcion"];

                    list.Add(brand);
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

        public void deleteBrand(int ID)
        {

            DataManager data = new DataManager();
            try
            {

                data.setQuery("delete from MARCAS where Id=@ID ");
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

        public void addBrand(List<Brand> brand)
        {
            DataManager dataManager = new DataManager();
            try
            {


                for (int i = 0; i < brand.Count(); i++)
                {

                    dataManager = new DataManager();
                    dataManager.setQuery("INSERT INTO MARCAS (descripcion) values (@Description)");
                    dataManager.setParameter("@Description", brand[i].Descripcion);
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


        public void updateBrand(List<Brand> brand)
        {
            DataManager dataManager = new DataManager();
            try
            {

                for (int i = 0; i < brand.Count(); i++)
                {
                    dataManager = new DataManager();
                    dataManager.setQuery("UPDATE MARCAS set descripcion=@Description  WHERE Id = @Id");
                    dataManager.setParameter("@Description", brand[i].Descripcion);
                    dataManager.setParameter("@Id", brand[i].Id);
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
