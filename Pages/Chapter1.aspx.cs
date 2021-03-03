using System;
using System.Web.UI.WebControls;

namespace Pages
{
    public partial class PagesChapter1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Master == null) return;
            ((HiddenField)Master.FindControl("hfMenu")).Value = "Chapter1";
            ((Label)Master.FindControl("lblHeader")).Text = "Chapter 1: Architecture";
        }
    }
}