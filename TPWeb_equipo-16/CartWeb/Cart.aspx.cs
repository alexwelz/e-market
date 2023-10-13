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
        protected void Page_Load(object sender, EventArgs e)
        {
            currentCart = (ShoppingCart)Session["Cart"];
           

            if (currentCart.TotalProducts == 0 )
            {
                Response.Redirect("~/EmptyCart.aspx");
            }
            else if(currentCart != null && currentCart.TotalProducts > 0)
            {
                repeaterItems.DataSource = currentCart.itemList; 
                repeaterItems.DataBind();

            }
           

        }
    }
}
