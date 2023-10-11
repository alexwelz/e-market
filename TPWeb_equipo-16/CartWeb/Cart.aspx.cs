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
        public Domain.ShoppingCart currentCart { get; set; }
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
        protected void Page_Load(object sender, EventArgs e)
        {
            ShoppingCart cart = (ShoppingCart)Session["Cart"];

            if (cart.TotalProducts!=0 && !IsPostBack)
            {
               
            }
            else
            {
                Response.Redirect("~/EmptyCart.aspx");
            }

            if (currentCart != null )
            {
                // Obtiene el carrito de la sesión
                var aux = (Domain.ShoppingCart)Session["Cart"];
                currentCart.itemList = aux.itemList;
                currentCart.Total = aux.Total;
                currentCart.TotalProducts = aux.TotalProducts;


            }
            else
            {

            }
            

            
           


        }
    }
}
