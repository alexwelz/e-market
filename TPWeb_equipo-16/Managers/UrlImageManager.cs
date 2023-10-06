using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Domain;

namespace Managers
{
    public class UrlImageManager
    {


        public List<UrlImage> imagesOfItems(int ID)
        {

            List<UrlImage> list = new List<UrlImage>();
            DataManager dataManager = new DataManager();
            try
            {

                dataManager.setQuery("Select ImagenUrl, Id, IdArticulo from IMAGENES where IdArticulo  =@ID ");
                dataManager.setParameter("@ID", ID);
                dataManager.executeRead();
                while (dataManager.Lector.Read())
                {
                    UrlImage url = new UrlImage();
                    url.Id = (int)dataManager.Lector["Id"];
                    url.Url = (string)dataManager.Lector["ImagenUrl"];
                    url.IdArticulo = (int)dataManager.Lector["IdArticulo"];
                    if(url.Url == null)
                    {
                        url.Url = "https://lh3.googleusercontent.com/drive-viewer/AITFw-wS6RAUNTNl47sUUVoPu5qMvbp08NQ48aWAXQUFn-TsDK8497WjmJavnGyi0sS0Uvknmg17fx6wTY7MQYhYDIIRn551=w1366-h618";
                    }
                    list.Add(url);

                }
                dataManager.closeConection();
                return list;

            }
            catch (Exception ex)
            {
                throw ex;

            }
        }

        public void deleteImage(int ID)
        {

            DataManager data = new DataManager();
            try
            {

                data.setQuery("delete from IMAGENES where IdArticulo  =@ID ");
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

        public void addImage(List<UrlImage> imagesItem)
        {
            DataManager dataManager = new DataManager();
            try
            {   
           

                for (int i = 0; i < imagesItem.Count(); i++)
                {

                    dataManager = new DataManager();
                    dataManager.setQuery("INSERT INTO IMAGENES (IdArticulo, ImagenUrl) values (@IdArt,@Url)");
                    dataManager.setParameter("@IdArt", imagesItem[i].IdArticulo);
                    dataManager.setParameter("@Url", imagesItem[i].Url);
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


        public void updateImage(List<UrlImage> imagesItem)
        {
            DataManager dataManager = new DataManager();
            try
            {

                for (int i = 0; i < imagesItem.Count(); i++)
                {
                    dataManager = new DataManager();
                    dataManager.setQuery("UPDATE IMAGENES set ImagenUrl=@Url  WHERE Id = @Id");
                    dataManager.setParameter("@Url", imagesItem[i].Url);
                    dataManager.setParameter("@Id", imagesItem[i].Id);
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