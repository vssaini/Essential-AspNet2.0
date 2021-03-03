using System;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CodeLab.Chapter2
{
    public partial class CodeLabChapter2Default : Page
    {
        #region Master Pages
        protected void Page_Load(object sender, EventArgs e)
        {
            ((HiddenField)Master.FindControl("hfMenu")).Value = "Chapter2";
            ((Label)Master.FindControl("lblHeader")).Text = "Chapter 2: User Interface Elements (Code Lab)";
        }

        protected void btnShowMasterPanel_Click(object sender, EventArgs e)
        {
            //1. A particular page could then access the master page via 
            // the Master property of the Page class, cast the result
            // to the master page type
            //((ASP.template_main_master)Master).ShowPanel = true;

            //2. By using master directive
            Master.ShowPanel = true;
        }

        #endregion

        #region Themes

        protected void Page_PreInit(object sender, EventArgs e)
        {
            // The below getter causes ITemplate to be instantiated
            // for current placeholder, which in turns make our
            // controls accessible.
            switch (Request.QueryString["theme"])
            {
                case "default":
                    Page.Theme = "default";
                    ddlSelectTheme.SelectedValue = "default";
                    lblInform.Text = "Message - default theme applied successfully!";
                    #region Noteworthy Point
                    // NOTE: The line above throws exception as NullReferenceException
                    /* REASON: Master Page is treated like a control in the Content Pages.
				 * So if a Page has a  Master Page associated with it, then the controls
				 * on the page will not be initialized and would be null in this stage.
				 * Why? 

					The reason being that all controls placed in the Content 
					Page are within a ContentPlaceholder which is a child 
					control of a MasterPage. Now Master Page is merged and 
					treated like a control in the Content Pages. So PreInit() 
					in the Page is the first event to fire but User Controls or 
					MasterPage (which is itself a Usercontrol) do not have any 
					PreInit event . Therefore in the Page_PreInit() method, 
					neither the MasterPage nor any user control has been 
					initialized and only the controls inside the Page class are 
					set to their default values. Only after the Page_PreInit() 
					event the Init() events of other controls fire up.*/
                    #endregion
                    break;

                case "global":
                    Page.Theme = "global";
                    ddlSelectTheme.SelectedValue = "global";
                    break;

                case "sexy":
                    Page.Theme = "sexy";
                    ddlSelectTheme.SelectedValue = "sexy";
                    break;
            }
        }


        protected void ddlSelectTheme_SelectedIndexChanged(object sender, EventArgs e)
        {
            switch (ddlSelectTheme.SelectedItem.Text)
            {
                case "default":
                    Response.Redirect("~/CodeLab/Chapter2/Default.aspx?theme=default");
                    break;

                case "global":
                    Response.Redirect("~/CodeLab/Chapter2/Default.aspx?theme=global");
                    break;

                case "sexy":
                    Response.Redirect("~/CodeLab/Chapter2/Default.aspx?theme=sexy");
                    break;
            }
        }
        #endregion

    }
}