using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Domain;
using Managers;

namespace CartWeb
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        public List<Item> itemList { get; set; }
        public ShoppingCart currentCart { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
          
            ItemManager iManager = new ItemManager();

            itemList = iManager.spListar();

            currentCart = (ShoppingCart)Session["Cart"];

        }
        protected void btnAddToCart_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            string commandArgument = btn.CommandArgument;

            int index;

            Item item;
          
            try
            {
                if (int.TryParse(commandArgument, out index))
                {
                    item = itemList[index];
                    currentCart.AddItemToCart(item);
                }
                else
                {
                    // Manejar el caso en el que la conversión no fue exitosa (no era un número entero).
                }
            }
            catch (Exception ex)
            {

                throw ex;
            }
           
            
         
           
            
            currentCart.TotalProducts++;
           
            Session["Cart"] = currentCart;


        }

    }
}