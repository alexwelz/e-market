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

            if (Request.QueryString["Code"] != null)
            {
                addItem();
            }

        }

        private void addItem()
        {

            ItemManager iManager = new ItemManager();
            itemList = iManager.spListar();
            Item item;

            string ItemCode = Request.QueryString["Code"];

            item = iManager.newItemByCode(ItemCode);
            currentCart.AddItemToCart(item);
            Session["Cart"] = currentCart;
        }

    }
}