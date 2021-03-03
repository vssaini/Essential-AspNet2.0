using System;

namespace CodeLab.Chapter2.MasterPageDynamically
{
    public partial class Default : System.Web.UI.Page
    {
        static bool _isPostBack;
        protected void Page_Load(object sender, EventArgs e)
        {
            var rnd = new Random();
            int number = rnd.Next(6);
            switch (number)
            {
                case 5:
                case 3:
                case 1:
                    _isPostBack = false;
                    break;
                case 6:
                case 4:
                case 2:
                    _isPostBack = true;
                    break;
            }

        }

        protected void Page_PreInit(object sender, EventArgs e)
        {
            Page.MasterPageFile = _isPostBack ? "~/CodeLab/Chapter2/MasterPageDynamically/SecMasterPage.Master" : "~/CodeLab/Chapter2/MasterPageDynamically/MasterPage.Master";
        }
    }
}
