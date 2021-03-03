using System;
using System.Web.UI.WebControls;
using System.Net;

namespace Pages
{
    public partial class PagesChapter4 : System.Web.UI.Page
    {
        string _textField;

        // Public property 
        public string TextValue
        {
            get
            {
                _textField = txtChap4Value.Text;
                return _textField;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            #region Master Setting

            var masterPage = Master;
            if (masterPage != null)
            {
                ((HiddenField)masterPage.FindControl("hfMenu")).Value = "Chapter4";
                ((Label)masterPage.FindControl("lblHeader")).Text = "Chapter 4: State Management";
            }

            #endregion

            #region IsCrossPagePostBack

            // Once new instance of the previous page type is created, ASP.NET then executes the page
            // much like it would if the request had been issued to it. The page is not executed in its
            // entirety, however, since it only needs to restore the state from the POST body, so it runs
            // through its life cycle up to and including the LoadComplete event.
            // And so the below value overrides the public value set.

            if (!IsCrossPagePostBack)
            {
                txtChap4Value.Text = "Warning: IsCrossPagePostBack is dangerous.";

                // Retreive profile information
                //lblProfileSummary.Text = string.Format(
                // "<span style='font:normal 9pt Segoe UI;color:#504f4f;'><b><em><u>Profile information retrieved:</u></em></b><br/>" +
                // "Profile Color: {0}<br />Profile Number: {1}<br/>" +
                // "Profile Status: {2}<br /></span>", Profile.FavoriteColor, Profile.FavoriteNumber, Profile.FavoriteHttpStatusCode);

            }
            #endregion
        }

        #region Wizard Finish Click
        protected void _infoWizard_FinishButtonClick(object sender, WizardNavigationEventArgs e)
        {
            _summaryLabel.Text = string.Format(
                "<span style='font:normal 9pt Segoe UI;color:#0077BB;'><h3>Thank you for submitting your information!</h3>" +
                "Name: {0} {1}<br />Address: {2}<br/>" +
                "{3}, {4}<br />Prefs: {5} {6}<br /></span>",
                _firstNameTextBox.Text,
                _lastNameTextBox.Text, _streetTextBox.Text,
                _cityTextBox.Text, _stateTextBox.Text,
                _colorTextBox.Text, _numberTextBox.Text);
            _infoWizard.Visible = false;
        }
        #endregion

        #region Setting Multiview ActiveViewIndex
        protected void _view1LinkButton_Click(object sender, EventArgs e)
        {
            _infoMultiView.ActiveViewIndex = 0;
        }
        protected void _view2LinkButton_Click(object sender, EventArgs e)
        {
            _infoMultiView.ActiveViewIndex = 1;
        }
        protected void _view3LinkButton_Click(object sender, EventArgs e)
        {
            _infoMultiView.ActiveViewIndex = 2;
        }
        #endregion

        #region Profile Section

        protected void btnSaveProfile_Click(object sender, EventArgs e)
        {
            Profile.FavoriteColor = colorTextBox.Text;
            Profile.FavoriteNumber = int.Parse(numberTextBox.Text);
            Profile.FavoriteHttpStatusCode = (HttpStatusCode)Enum.Parse(typeof(HttpStatusCode), statusCodeTextBox.Text);
        }

        #endregion
    }
}