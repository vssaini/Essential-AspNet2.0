using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Template_Main : System.Web.UI.MasterPage
{
	protected void Page_Load(object sender, EventArgs e)
	{
		lblDate.Text = DateTime.Now.DayOfWeek + ", " + DateTime.Now.ToString("dd MMMM yyyy") + ",";

		#region Add body's attributes
		// Request.ApplicationPath = /easp		
		if (!Request.Url.ToString().Contains(Request.ApplicationPath + @"/Default.aspx"))
			masterBody.Attributes.Add("onLoad", "startclock(); menuClicked();");

		

		#endregion
	}

	#region Property for modification of control
	public bool ShowPanel
	{
		get
		{
			return pnlSection.Visible;
		}

		set
		{
			pnlSection.Visible = value;
		}
	}
	#endregion
}
