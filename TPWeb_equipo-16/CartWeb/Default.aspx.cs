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
        protected global::System.Web.UI.WebControls.Repeater myRepeater;

        protected void Page_Load(object sender, EventArgs e)
        {
          
            ItemManager iManager = new ItemManager();

            itemList = iManager.spListar();
            myRepeater.DataSource = itemList;
            myRepeater.DataBind();

            currentCart = (ShoppingCart)Session["Cart"];

        }
        protected void btnAddToCart_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            string itemCode = btn.CommandArgument;
            ItemManager iManager = new ItemManager(); 
            Item item = new Item();
            item = iManager.newItemByCode(itemCode);
            currentCart.AddItemToCart(item);
            currentCart.TotalProducts++;
            Session["Cart"] = currentCart;
        }
        protected void myRepeater_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "AddToCart")
            {
                string itemCode = e.CommandArgument.ToString();
                // Lógica para agregar el artículo al carrito aquí
            }
        }
    }
}