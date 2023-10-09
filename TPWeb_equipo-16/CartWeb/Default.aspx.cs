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
        public List<Brand> brandsList { get; set; }
        public List<Category> categorysList { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            ItemManager iManager = new ItemManager();
            BrandManager bManager = new BrandManager();
            CategoryManager cManager = new CategoryManager();
            brandsList = bManager.listar();
            categorysList = cManager.listar();

            if (!IsPostBack)
            {

                itemList = iManager.spListar();
                

            }


        }

        
    }
}