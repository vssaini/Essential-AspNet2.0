using System;
using System.Web.UI.WebControls;

namespace CodeLab.Chapter4
{
    public partial class CodeLabChapter4Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Master != null)
            {
                ((HiddenField)Master.FindControl("hfMenu")).Value = "Chapter4";
                ((Label)Master.FindControl("lblHeader")).Text = "Chapter 4: State Management (Code Lab)";
            }

            // Receiving values from source page
            lblPreValue.Text = PreviousPage.textValue;
        }
    }
}