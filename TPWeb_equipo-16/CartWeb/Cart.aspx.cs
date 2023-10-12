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
            currentCart = (ShoppingCart)Session["Cart"];
           

            if (currentCart.TotalProducts == 0)
            {
                Response.Redirect("~/EmptyCart.aspx");
            }
           
            

            if (currentCart != null && currentCart.TotalProducts > 0)
            {

               
                List<Item> purchase = new List<Item>();



                foreach (ItemList iList in currentCart.itemList)
                {
                    if (iList.AddedItem.Count() > 0)
                    {
                        purchase.Add(iList.AddedItem[0]);
                    }
                }

               
                repeaterItems.DataSource = purchase; // Asigna los elementos del carrito al Repeater
                repeaterItems.DataBind();
            }
            else
            {
                // El carrito está vacío, puedes mostrar un mensaje o redirigir a otra página
                Response.Redirect("~/EmptyCart.aspx");
            }


        }
    }
}
