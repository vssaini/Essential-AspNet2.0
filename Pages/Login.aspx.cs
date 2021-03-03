using System;
using System.Web.UI.WebControls;
using System.Web.Security;

namespace Pages
{
    public partial class CodeLabChapter5Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var masterPage = Master;
            if (masterPage != null)
            {
                ((HiddenField)masterPage.FindControl("hfMenu")).Value = "Chapter5";
                ((Label)masterPage.FindControl("lblHeader")).Text = "Chapter 5: Security (Code Lab)";
            }

            Page.SetFocus(loginAdmin.FindControl("UserName"));
            Page.Form.DefaultButton = loginAdmin.FindControl("LoginButton").UniqueID;
        }

        protected void loginAdmin_Authenticate(object sender, AuthenticateEventArgs e)
        {
            e.Authenticated = Membership.ValidateUser(loginAdmin.UserName, loginAdmin.Password);
        }
    }
}