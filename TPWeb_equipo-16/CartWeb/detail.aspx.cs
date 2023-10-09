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
        public Item item { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            ItemManager iManager = new ItemManager();
            itemList = iManager.spListar();


            if (!IsPostBack)
            {
                int itemId = Request.QueryString["id"] != null && int.TryParse(Request.QueryString["id"], out int id) ? id : -1;

                if (itemId != -1)
                {
                    item = itemList.FirstOrDefault(i => i.Id == itemId);

                    if (item != null)
                    {
                        lblName.InnerText = item.Name;
                        lblDescription.InnerText = item.Description;
                        lblPrice.InnerText = "$" + item.Price.ToString();

                    }
                    else
                    {
                        ResolveUrl("~/Default.aspx");
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