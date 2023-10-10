
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
        public Cart CartShop { get; set; }
        public List<Item> filterList { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            CartShop = new Cart();
            Session.Add("Cart", CartShop);
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            search(tbFilter.Text);
        }

        protected void search(string text)
        {
            ItemManager iManager = new ItemManager();
            List<Item> aux = iManager.spListar();
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
