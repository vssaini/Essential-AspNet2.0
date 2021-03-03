using System;
using System.Web.UI.WebControls;

namespace CodeLab.Chapter5
{
    public partial class CodeLabChapter5Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var masterPage = Master;
            if (masterPage == null) return;
            ((HiddenField)masterPage.FindControl("hfMenu")).Value = "Chapter5";
            ((Label)masterPage.FindControl("lblHeader")).Text = "Chapter 5: Security (Code Lab)";
        }
    }
}