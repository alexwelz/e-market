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
        
        
        protected void btnDeleteFromCart_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            string itemCode = btn.CommandArgument;
            RemoveItemFromCart(itemCode, true);
            repeaterItems.DataSource = currentCart.itemList;
            repeaterItems.DataBind();
            
        }

        protected void btnDash_Click(object sender, EventArgs e)
        {

            Button btn = (Button)sender;
            string itemCode = btn.CommandArgument;
            RemoveItemFromCart(itemCode, false);
            repeaterItems.DataSource = currentCart.itemList;
            repeaterItems.DataBind();
        }

        protected void btnPlus_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            string itemCode = btn.CommandArgument;
            AddItemToCart(itemCode);
            repeaterItems.DataSource = currentCart.itemList;
            repeaterItems.DataBind();
        }

        private void updateLabelCart()
        {
            var masterPage = this.Master;
            var lblHeader = masterPage.FindControl("Label1") as Label;
            if (lblHeader != null)
            {
                lblHeader.Text = currentCart.TotalProducts.ToString();
            }
        }


        private void AddItemToCart(string itemCode)
        {
            try
            {
                for (int i = 0; i < currentCart.itemList.Count(); i++)
                {
                    if (currentCart.itemList[i].item.ItemCode == itemCode)
                    {
                        currentCart.Total = currentCart.Total + currentCart.itemList[i].item.Price;
                        currentCart.TotalProducts = currentCart.TotalProducts + 1;
                        currentCart.itemList[i].Amount = currentCart.itemList[i].Amount + 1;
                        currentCart.itemList[i].SubTotal = currentCart.itemList[i].Amount * currentCart.itemList[i].item.Price;
                        Session["Cart"] = currentCart;
                        repeaterItems.DataSource = currentCart.itemList;
                        repeaterItems.DataBind();
                        break;
                    }
                }

                updateLabelCart();
            }
            catch (Exception ex)
            {
                Response.Redirect("~/Error.aspx");
                throw ex;
            }
            

        }



        private void RemoveItemFromCart(string itemCode, bool all)
        {
            
                for (int i = 0; i < currentCart.itemList.Count(); i++)
                {
                    if (currentCart.itemList[i].item.ItemCode == itemCode)
                    {
                        if (all == true)
                        {
                            currentCart.Total = currentCart.Total - (currentCart.itemList[i].item.Price * currentCart.itemList[i].Amount);
                            currentCart.TotalProducts = currentCart.TotalProducts - currentCart.itemList[i].Amount;
                            currentCart.itemList.RemoveAt(i);
                            Session["Cart"] = currentCart;
                            repeaterItems.DataSource = currentCart.itemList;
                            repeaterItems.DataBind();
                            break;
                        }
                        else
                        {
                            currentCart.Total = currentCart.Total - currentCart.itemList[i].item.Price;
                            currentCart.TotalProducts = currentCart.TotalProducts - 1;
                            currentCart.itemList[i].Amount = currentCart.itemList[i].Amount - 1;
                            currentCart.itemList[i].SubTotal = currentCart.itemList[i].item.Price * currentCart.itemList[i].Amount;
                            if (currentCart.itemList[i].Amount == 0)
                            {
                                currentCart.itemList.RemoveAt(i);
                            }
                            Session["Cart"] = currentCart;
                            repeaterItems.DataSource = currentCart.itemList;
                            repeaterItems.DataBind();
                            break;

                        }
                    }
                }


                updateLabelCart();
                if (currentCart.TotalProducts == 0)
                {
                    Response.Redirect("~/EmptyCart.aspx");
                }
          
            


        }

        protected void orderFinalizePurchase_Click(object sender, EventArgs e)
        {
            Session["Cart"] = currentCart;

        }
    }
}
