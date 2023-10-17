
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Optimization;
using Domain;
using Managers;

namespace CartWeb
{
    public partial class Site : System.Web.UI.MasterPage
    {
        public ShoppingCart CartShop { get; set; }
        public List<Item> filterList { get; set; }
        
        public string totalProductsCart { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack && Session["Cart"] == null)
            {
                CartShop = new ShoppingCart();
                Session.Add("Cart", CartShop);

            }
            else
            {
                CartShop = (ShoppingCart)Session["Cart"];

            }

            if ((string)Session["UserName"] != null)
            {
                if ((string)Session["UserName"] == "Maxi" && (string)Session["Password"] == "Programa")
                {
                    Label2.Text = "Maxi Programa";
                }
            }
              

            Label1.Text = CartShop.TotalProducts.ToString();
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            if (tbFilter.Text != "")
            {
                search(tbFilter.Text);
            }
        }

        protected void search(string text)
        {           
            List<Item> aux = (List<Item>)Session["ItemList"];
            filterList = aux.FindAll(x => x.Name.ToUpper().Contains(text.ToUpper()) ||
            x.Brand.Descripcion.ToUpper().Contains(text.ToUpper()) ||
            x.Category.Descripcion.ToUpper().Contains(text.ToUpper()));
            Session.Add("filteredItems", filterList);
            if (!string.Equals(Request.Url.AbsolutePath, "/Default.aspx", StringComparison.OrdinalIgnoreCase))
            {
                Response.Redirect($"Default.aspx");
            }


        }
        
    }
}
