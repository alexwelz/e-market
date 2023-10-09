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
            itemList = iManager.spListar();
            brandsList = bManager.listar();
            categorysList = cManager.listar();


        }

        protected void ddlField_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (IsPostBack)
            {


                string opcion = ddlField.SelectedItem.ToString();
                if (opcion == "Precio")
                {

                    ddlCriterion.Items.Clear();
                    ddlCriterion.Items.Add("Greater than");
                    ddlCriterion.Items.Add("Less than");
                    ddlCriterion.Items.Add("Equal to");
                    ddlCriterion.DataBind();
                }

                else
                {
                    ddlCriterion.Items.Clear();

                    ddlCriterion.Items.Add("Starts with");
                    ddlCriterion.Items.Add("Ends with");
                    ddlCriterion.Items.Add("Contains");
                    ddlCriterion.DataBind();
                }

            }
        }
    }
}