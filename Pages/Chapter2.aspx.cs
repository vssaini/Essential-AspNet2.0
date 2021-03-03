using System;
using System.Web.UI.WebControls;

namespace Pages
{
    public partial class PagesChapter2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var masterPage = this.Master;
            if (masterPage == null) return;
            ((HiddenField)masterPage.FindControl("hfMenu")).Value = "Chapter2";
            ((Label)masterPage.FindControl("lblHeader")).Text = "Chapter 2: User Interface Elements";
        }
    }
}