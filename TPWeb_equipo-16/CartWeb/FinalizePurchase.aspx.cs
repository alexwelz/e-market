using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Domain;


namespace CartWeb
{
    public partial class FinalizePurchase : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {


        }
        public string descriptionTextBlock()
        {
            ShoppingCart current = (ShoppingCart)Session["Cart"];
            List<List<string>> orderDescription = new List<List<string>>();

            foreach (var cartItem in current.itemList)
            {
                var itemDescription = new List<string>
        {
            cartItem.item.Name,
            cartItem.item.Brand.Descripcion,
            cartItem.Amount.ToString(),
            "Unit price : $" + cartItem.item.Price.ToString(),
            "Price per quantity :$" + (cartItem.item.Price * cartItem.Amount).ToString()
        };
                orderDescription.Add(itemDescription);
            }

            string formattedText = string.Empty;

            foreach (List<string> innerList in orderDescription)
            {
                formattedText += "Product :\r\n";
                foreach (string item in innerList)
                {
                    formattedText += "\t" + item + "\r\n";
                }
                formattedText += "\r\n";
            }

            formattedText += "Total : $" + current.Total.ToString();
            return formattedText;
        }
    }
}

