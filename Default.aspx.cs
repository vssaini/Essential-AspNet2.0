using System;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

public partial class Default : System.Web.UI.Page
{
	protected void Page_Load(object sender, EventArgs e)
	{
        #region Add method to master's body

        var masterPage = Master;
        if (masterPage != null)
	    {
	        ((HiddenField)masterPage.FindControl("hfMenu")).Value = "Dashboard";
	        
	        var body = masterPage.FindControl("masterBody") as HtmlGenericControl;
	        if (body != null) body.Attributes.Add("onLoad", "startclock(); menuClicked(); changeAuthorBg();");
	    }
	    
		#endregion

		#region Change Author Background on each new request
		var check = Convert.ToBoolean(Application["Check"]);
		if (check)
		{
			txtCheck.Text = "false";
			Application["Check"] = false;
		}
		else
		{
			txtCheck.Text = "true";
			Application["Check"] = true;
		}
		#endregion
	}
}