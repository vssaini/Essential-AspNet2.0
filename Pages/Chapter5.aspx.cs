using System;
using System.Web.UI.WebControls;

namespace Pages
{
    public partial class PagesChapter5 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var masterPage = Master;
            if (masterPage == null) return;
            ((HiddenField)masterPage.FindControl("hfMenu")).Value = "Chapter5";
            ((Label)masterPage.FindControl("lblHeader")).Text = "Chapter 5: Security";
        }
    }
}