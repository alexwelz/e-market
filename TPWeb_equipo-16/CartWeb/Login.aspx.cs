using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CartWeb
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void liveAlertBtn_Click(object sender, EventArgs e)
        {
            string userName = theUser.Text;
            string password = thePassword.Text;
            Session["UserName"] = userName;
            Session["Password"] = password;
            var masterPage = this.Master;
            var lblHeader = (Label)masterPage.FindControl("currentUser");
            lblHeader.Text = (string)Session["UserName"];
            
                Response.Redirect("Login.aspx");
            
        }
        protected void btnRedirect_Click(object sender, EventArgs e)
        {

            Response.Redirect("Default.aspx");
        }
        protected void retryLogtBtn_Click(object sender, EventArgs e)
        {
            Session.Remove("UserName");
            Session.Remove("Password");
        }
        

    }
}