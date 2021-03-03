using System;
using System.Web.UI.WebControls;
using System.Collections;
using System.Data;
using System.Data.Common;

namespace Pages
{
    public partial class PagesChapter3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var masterPage = Master;
            if (masterPage == null) return;
            ((HiddenField)masterPage.FindControl("hfMenu")).Value = "Chapter3";
            ((Label)masterPage.FindControl("lblHeader")).Text = "Chapter 3: Data Binding";

            #region Programatically using SqlDataSource - I
            /* This example, while NOT something you would probably do in practice,
		 * should give you a good idea of how data-bound controls interact with
		 * their associated data source controls.
		 * */

            //DataSourceSelectArguments dssa = new DataSourceSelectArguments();
            //if (((IDataSource)_moviesDataSource).GetView("").CanSort)
            //    dssa.SortExpression = "release_date DESC";

            //ShowDSResults(_moviesDS.Select(dssa));
            #endregion
        }

        #region Programatically using SqlDataSource - II
        protected void ShowDsResults(IEnumerable e)
        {
            var idx = e.GetEnumerator();
            while (idx.MoveNext())
            {
                if (idx.Current is DataRowView) // DataSet used
                {
                    var drv = (DataRowView)idx.Current;
                    Response.Output.Write("{0} {1} {2}<br />", drv[0], drv[1], drv[2]);
                }
                else if (idx.Current is DbDataRecord) // IDataReader used
                {
                    var dr = (DbDataRecord)idx.Current;
                    Response.Output.Write("{0} {1} {2}<br />", dr[0], dr[1], dr[2]);
                }
            }
        }
        #endregion

        #region Event handler for programmatically populating the @reviewer parameter
        // the events of interest are Inserting, Selecting, Updating, and Deleting,
        // which are all called before the actual SQL call is made
        protected void SqlDataSource8_Inserting(object sender, SqlDataSourceCommandEventArgs e)
        {
            e.Command.Parameters["@reviewer"].Value =
                User.Identity.IsAuthenticated ? User.Identity.Name : "Anonymous";
        }

        #endregion

    }
}