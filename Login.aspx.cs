using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataLayer.DataHelper;
using EntityLayer;

namespace OnlineBidding
{
    public partial class Login : System.Web.UI.Page
    {
        UserHelper docHelper = new UserHelper();

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSignIn_Click(object sender, EventArgs e)
        {
            EntityLayer.User user = new User();
            user = docHelper.LoginUser(txtUsername.Text, txtPassword.Text);
            if (user != null)
            {
                Session["UserID"] = user.UserID;
                Session["Name"] = user.Name;
                Session["Username"] = user.Username;
                Session["Usertype"] = user.UserType;
                Response.Redirect("Dashboard.aspx");
            }
            else
            {
                Response.Write("<script>alert('Incorrect Credentials.');</script>");
            }
        }

        protected void btnSignUp_Click(object sender, EventArgs e)
        {
            Response.Redirect("Register.aspx");
        }
    }
}