using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Domain;
using Managers;
using System.Net;

namespace CartWeb
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        public List<Item> itemList { get; set; }
        public ShoppingCart currentCart { get; set; }


        protected void Page_Load(object sender, EventArgs e)
        {
       
                if (Session["ItemList"] == null)
                {
                    ItemManager iManager = new ItemManager();
                    itemList = iManager.Listacompleta();
                    itemList = urlValidation(itemList);
                    Session["ItemList"] = itemList;
                }
                else
                {

                    itemList = (List<Item>)Session["ItemList"];
                }
           

            currentCart = (ShoppingCart)Session["Cart"];

            if (Request.QueryString["Code"] != null)
            {
                addItem();
            }
            if ((string)Session["UserName"] != "Maxi" || (string)Session["Password"] != "Programa")
            {
                Session.Remove("UserName");
                Session.Remove("Password");
            }

        }


        private void addItem()
        {

            try
            {
                CartManager cManager = new CartManager();
                itemList = (List<Item>)Session["ItemList"];
                Item item;
                string ItemCode = Request.QueryString["Code"];
                item = cManager.findItem(ItemCode,itemList);
                Session["Cart"] = cManager.AddItemToCart(item,currentCart,1);
               
            }
            catch (Exception ex)
            {
                 Response.Redirect("~/Error.aspx");
                throw ex;
            }
           
        }

        public List<Item> urlValidation(List<Item> aux)
        {
            foreach (Item item in aux)
            {
                foreach (UrlImage image in item.Images)
                {

                                 
                    try
                    {
                        if (image.Url != "EmptyImage")
                        {
                            HttpWebRequest request = (HttpWebRequest)WebRequest.Create(image.Url);
                            HttpWebResponse response = (HttpWebResponse)request.GetResponse();
                            if (response.StatusCode != HttpStatusCode.OK)
                            {

                                image.Url = "FailedLoad";
                            }
                        }
                    }
                    catch (WebException )
                    {

                        image.Url = "FailedLoad";
                      
                    }

                }

            }

            return aux;
        }

    }
}