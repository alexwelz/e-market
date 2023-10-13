using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Domain;


namespace CartWeb
{
    public partial class Cart : System.Web.UI.Page

    {
        protected global::System.Web.UI.WebControls.Repeater repeaterItems;
        public ShoppingCart currentCart { get; set; }
    

        /*
        public void addToCurrent(Item item)
        {
            currentCart.AddItemToCart(item);
            Session["Cart"] = currentCart;

        }
        public void deleteToCurrent(Item item)
        {
            currentCart.RemoveItemFromCart(item);
            Session["Cart"] = currentCart;

        }
        */
        protected void Page_Load(object sender, EventArgs e)
        {
            currentCart = (ShoppingCart)Session["Cart"];
           

            if (currentCart.TotalProducts == 0 )
            {
                Response.Redirect("~/EmptyCart.aspx");
            }
            else if(currentCart != null && currentCart.TotalProducts > 0)
            {
                repeaterItems.DataSource = currentCart.itemList; // Asigna los elementos del carrito al Repeater
                repeaterItems.DataBind();

            }
           

        }
    }
}
