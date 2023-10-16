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
            itemList = (List<Item>)Session["ItemList"];
            int itemId = Request.QueryString["id"] != null && int.TryParse(Request.QueryString["id"], out int id) ? id : -1;
            item = itemList.FirstOrDefault(i => i.Id == itemId);
            try
            {
                
                if (item != null && !IsPostBack)
                {
                    lblName.InnerText = item.Name;
                    lblBrand.InnerText = item.Brand.Descripcion;
                    lblDescription.InnerText = item.Description;
                    lblPrice.InnerText = "$" + item.Price.ToString();
                }

                if (item == null)
                {
                    Response.Redirect("~/Error.aspx");
                }

            }
            catch (Exception ex)
            {
                Response.Redirect("~/Error.aspx");
                throw ex ;
            }
            

        }

        protected void btnDetailAddToCart_Click(object sender, EventArgs e)
        {
            int selectedQuantity;
            ShoppingCart currentCart;
            currentCart = (ShoppingCart)Session["Cart"];
            CartManager cManager = new CartManager();

            try
            {
              
                if (selectUnit.SelectedIndex > 0)
                {
                    selectedQuantity = int.Parse(selectUnit.Value);
                }
                else
                {
                    selectedQuantity = 1;
                }
         
                 currentCart = cManager.AddItemToCart(item, currentCart, selectedQuantity);                   
                 Session["Cart"] = currentCart;
                 Response.Redirect("~/Detail.aspx?id=" + item.Id);

            }
            catch (Exception ex)
            {

                throw ex ;
            }
                
           


        }
    }



}