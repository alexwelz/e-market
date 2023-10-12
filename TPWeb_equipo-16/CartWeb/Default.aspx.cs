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
            string itemCode = btn.CommandArgument.ToString();
            ItemManager iManager = new ItemManager();
            List<Item> aux = iManager.spListar();
            Item item = new Item();
           
            for(int i = 0; i < aux.Count(); i++)
            {
                if(aux[i].ItemCode == itemCode)
                {
                   item = aux[i];
                 
                }
            }
    
            currentCart.AddItemToCart(item);
            currentCart.TotalProducts++;
            Session["Cart"] = currentCart;


        }

    }
}