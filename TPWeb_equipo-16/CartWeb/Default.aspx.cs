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

                    HttpWebRequest request = (HttpWebRequest)WebRequest.Create(image.Url);
                    request.Method = "HEAD";
                    try
                    {
                        HttpWebResponse response = (HttpWebResponse)request.GetResponse();
                        if (response.StatusCode != HttpStatusCode.OK)
                        {

                            image.Url = "https://tinyurl.com/3pp9399j";
                        }
                    }
                    catch (WebException ex)
                    {

                        image.Url = "https://tinyurl.com/3pp9399j";
                    }

                }

            }

            return aux;
        }

    }
}