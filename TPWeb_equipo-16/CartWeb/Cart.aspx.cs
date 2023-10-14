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
        public void RemoveItemFromCart(string itemCode)
        {
            for (int i = 0; i < currentCart.itemList.Count(); i++)
            {
                if (currentCart.itemList[i].item.ItemCode == itemCode)
                {

                    currentCart.Total = currentCart.Total -(currentCart.itemList[i].item.Price * currentCart.itemList[i].Amount);
                    currentCart.TotalProducts = currentCart.TotalProducts - currentCart.itemList[i].Amount;
                    currentCart.itemList.RemoveAt(i);
                    Session["Cart"] = currentCart;
                    repeaterItems.DataSource = currentCart.itemList;
                    repeaterItems.DataBind();
                }
            }
            var masterPage = this.Master;
            var lblHeader = masterPage.FindControl("Label1") as Label;
            if (lblHeader != null)
            {
                lblHeader.Text = currentCart.TotalProducts.ToString();
            }
            else
            {
                int zero = 0;
                lblHeader.Text = zero.ToString(); 
            }


        }
        public void ModifyItemFromCart(string itemCode)
        {
        }
        protected void btnDeleteFromCart_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            string itemCode = btn.CommandArgument;
            RemoveItemFromCart(itemCode);
            repeaterItems.DataSource = currentCart.itemList;
            repeaterItems.DataBind();
        }

        protected void btnModify_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            string itemCode = btn.CommandArgument;
            ModifyItemFromCart(itemCode);
            repeaterItems.DataSource = currentCart.itemList;
            repeaterItems.DataBind();
        }
    }
}
