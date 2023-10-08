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
    public partial class detail : System.Web.UI.Page
    {

        public List<Item> itemList { get; set; }
        public int item { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            ItemManager iManager = new ItemManager();
            itemList = iManager.spListar();


            if (!IsPostBack)
            {
                int itemId = Request.QueryString["id"] != null && int.TryParse(Request.QueryString["id"], out int id) ? id : -1;

                if (itemId != -1)
                {
                    Domain.Item item = itemList.FirstOrDefault(i => i.Id == itemId);

                    if (item != null)
                    {
                        lblName.Text = item.Name;
                        lblDescription.Text = item.Description;
                        lblPrice.Text = "$" + item.Price.ToString();

                    }
                    else
                    {
                        //The article no its valid
                    }
                }
                else
                {
                    //The id no its valid
                }
            }
            else
            {

            }


        }
    }



}