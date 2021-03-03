<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Chapter4.aspx.cs" Inherits="Pages.PagesChapter4"
    MaintainScrollPositionOnPostback="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphMaster" runat="Server">
    <div class="pageHeader">
        State Management</div>
    <div class="pageSubHeader acl Information">
        Cross-Page Posting
    </div>
    <div class="subHdrPara">
        <em>Whenever a postback occurs to server it post back page to itself. ASP.NET uses POST
            data to manage the state of its server-side controls.</em> So When the <strong>PostBackUrl</strong>
        property is set to a different page, the OnClick handler of the button is set to
        call a JavaScript function that changes the default action of the form to the target
        page's URL.
        <p>
            Once you have set up the source page to post to the target page, the next step is
            to build the target page to use the values passed by the source page.A better approach
            is to expose any data from the previous page to the target page by writing public
            property accessors in the codebehind.</p>
        <label>
            Write anything here:</label>&nbsp;
        <asp:TextBox ID="txtChap4Value" runat="server" />&nbsp;
        <asp:Button ID="btnImplementation" runat="server" PostBackUrl="~/CodeLab/Chapter4/Default.aspx"
            Text="Submit" />
        <h4>
            Caveats of Cross-Page Posting</h4>
        <ul>
            <li>Entire contents of the source page is going to be posted to the target page. This
                includes the entire view state field and all input elements on the page. Thereby
                making size of target page much more causing effect on performance.</li>
            <li>Server-side validation will not take place until you access the PreviousPage property
                on the target page. Client-side validation will still happen as usual before the
                page issues the POST, but if you are relying on server-side validation at all, you
                must take care to check the IsValid property of the previous page before accessing
                the data exposed by the PreviousPage property. </li>
        </ul>
        <h4>
            Multi-Source Cross-Page Posting</h4>
        <p>
            If <em>n</em> number of soure pages are targeted to single target page, then in
            that case, the <strong>VirtualPath</strong> way of getting values from previous
            page fails. The solution would be to use <strong>TypeName</strong> with PreviousPageType.
            In that case follow steps:
        </p>
        <ol>
            <li>Declare interface<br />
                <span class="code">public interface IPersonInfo<br />
                    {<br />
                    string Name { get; }<br />
                    int Age { get; }<br />
                    bool Married { get; }<br />
                    } </span>In each of the source pages, we then implement the IPersonInfo on the
                codebehind base class, and our target page can now safely cast the PreviousPage
                to the IPersonInfo type.<br />
                <span class="code">IPersonInfo pi = PreviousPage as IPersonInfo;<br />
                    if (pi != null)
                    <br />
                </span></li>
            <li>Make strong type instead of casting. So for that we can use TypeName but TypeName
                attribute of the PreviousPageType directive requires that the specified type inherit
                from System.Web.UI.Page.<br />
                <span class="code">public abstract class PersonInfoPage : Page, IPersonInfo<br />
                    {<br />
                    public abstract string Name { get; }<br />
                    public abstract int Age { get; }<br />
                    public abstract bool Married { get; }<br />
                    } </span>This technique then requires that each of the source pages you author
                change their base class from Page to this new PersonInfoPage base, and then implement
                the abstract properties to return the appropriate data. Then we can use code as:<br />
                <span class="code">&lt;%@ PreviousPageType TypeName="PersonInfoPage" %&gt; </span>
            </li>
        </ol>
    </div>
    <div class="pageSubHeader acl Information">
        Wizard and Multiview Controls
    </div>
    <div class="subHdrPara">
        <h4>
            Wizard Control</h4>
        <asp:Wizard ID="_infoWizard" runat="server" ActiveStepIndex="0" DisplaySideBar="false"
            OnFinishButtonClick="_infoWizard_FinishButtonClick" CssClass="wizard">
            <WizardSteps>
                <asp:WizardStep ID="_step1" runat="server" Title="Name">
                    <table>
                        <tr>
                            <td>
                                First name:
                            </td>
                            <td>
                                <asp:TextBox ID="_firstNameTextBox" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Last name:
                            </td>
                            <td>
                                <asp:TextBox ID="_lastNameTextBox" runat="server" />
                            </td>
                        </tr>
                    </table>
                </asp:WizardStep>
                <asp:WizardStep ID="_step2" runat="server" Title="Address">
                    <table>
                        <tr>
                            <td>
                                Street:
                            </td>
                            <td>
                                <asp:TextBox ID="_streetTextBox" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                City:
                            </td>
                            <td>
                                <asp:TextBox ID="_cityTextBox" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                State/Province:
                            </td>
                            <td>
                                <asp:TextBox ID="_stateTextBox" runat="server" />
                            </td>
                        </tr>
                    </table>
                </asp:WizardStep>
                <asp:WizardStep ID="_step3" runat="server" Title="Preferences">
                    <table>
                        <tr>
                            <td>
                                Favorite color:
                            </td>
                            <td>
                                <asp:TextBox ID="_colorTextBox" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Favorite number:
                            </td>
                            <td>
                                <asp:TextBox ID="_numberTextBox" runat="server" />
                            </td>
                        </tr>
                    </table>
                </asp:WizardStep>
            </WizardSteps>
        </asp:Wizard>
        <asp:Label ID="_summaryLabel" runat="server" />
        <h4>
            MultiView Control</h4>
        <asp:LinkButton ID="_view1LinkButton" runat="server" OnClick="_view1LinkButton_Click">
                Name</asp:LinkButton>&nbsp;&nbsp;
        <asp:LinkButton ID="_view2LinkButton" runat="server" OnClick="_view2LinkButton_Click">
                Address</asp:LinkButton>&nbsp;&nbsp;
        <asp:LinkButton ID="_view3LinkButton" runat="server" OnClick="_view3LinkButton_Click">
               Preference</asp:LinkButton><br />
        <asp:MultiView ID="_infoMultiView" runat="server" ActiveViewIndex="0">
            <asp:View ID="_view1" runat="server">
                <table>
                    <tr>
                        <td>
                            First name:
                        </td>
                        <td>
                            <asp:TextBox ID="TextBox1" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Last name:
                        </td>
                        <td>
                            <asp:TextBox ID="TextBox2" runat="server" />
                        </td>
                    </tr>
                </table>
            </asp:View>
            <asp:View ID="_view2" runat="server">
                <table>
                    <tr>
                        <td>
                            Street:
                        </td>
                        <td>
                            <asp:TextBox ID="TextBox3" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            City:
                        </td>
                        <td>
                            <asp:TextBox ID="TextBox4" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            State/Province:
                        </td>
                        <td>
                            <asp:TextBox ID="TextBox5" runat="server" />
                        </td>
                    </tr>
                </table>
            </asp:View>
            <asp:View ID="_view3" runat="server">
                <table>
                    <tr>
                        <td>
                            Favorite color:
                        </td>
                        <td>
                            <asp:TextBox ID="TextBox6" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Favorite number:
                        </td>
                        <td>
                            <asp:TextBox ID="TextBox7" runat="server" />
                        </td>
                    </tr>
                </table>
            </asp:View>
        </asp:MultiView>
    </div>
    <br />
    <div class="pageSubHeader acl Information">
        Profile
    </div>
    <div class="subHdrPara">
        Profile provides a simple way of defining database-backed user profile information.
        It is persistent across sessions and is also tied into the Membership provider,
        so authenticated clients have data stored associated with their real identities
        instead of some arbitrary identifier (in case of anonymous id).
        <p>
            Profile is retrieved on demand and written only when modified, so unlike out-of-process
            Session state storage, you only incur a trip to the database when you actually use
            Profile, not implicitly with each request.
        </p>
        <h4>
            Fundamentals</h4>
        <ul>
            <li>Declare properties (to store on behalf of user) under &lt;profile&gt; element:<br />
                <span class="code">&lt;profile enabled="true"&gt;<br />
                    &lt;properties&gt;<br />
                    &lt;add name="FavoriteColor" defaultValue="blue" type="System.String" allowAnonymous="true"
                    serializeAs="String" /&gt;<br />
                    &lt;/profile&gt; </span></li>
            <li>To support anonymous clients, enable anonymous identification by adding the anonymousIdentification
                element with its enabled attribute set to true. This will cause ASP.NET to generate
                a unique identifier (a GUID) to associate with each anonymous user via a persistent
                cookie.<br />
                <span class="code">&lt;anonymousIdentification enabled="true" /&gt; </span>If the
                user is authenticated, the membership identifier for that user will be used directly
                and no additional cookie will be created.</li><li>When ASP.NET compiles your site, it
                    creates a new class that derives from ProfileBase with type-safe accessors to the
                    properties you declared. </li>
            <li>The second thing that happens is ASP.NET adds a property declaration to each generated
                Page class in your site named Profile, which is a type-safe accessor to the current
                Profile class (which is part of the HttpContext), </li>
        </ul>
        <table>
            <tr>
                <td>
                    <table>
                        <tr>
                            <td>
                                <label>
                                    Enter profile color:</label>
                            </td>
                            <td>
                                <asp:TextBox ID="colorTextBox" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>
                                    Enter profile number:</label>
                            </td>
                            <td>
                                <asp:TextBox ID="numberTextBox" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>
                                    Enter profile status::</label>
                            </td>
                            <td>
                                <asp:TextBox ID="statusCodeTextBox" runat="server" />
                            </td>
                        </tr>
                    </table>
                </td>
                <td style="padding-left: 50px">
                    <asp:Label ID="lblProfileSummary" runat="server" />
                </td>
            </tr>
        </table>
        <asp:Button ID="btnSaveProfile" runat="server" Text="Save Profile Info" OnClick="btnSaveProfile_Click" />
        <h4>
            Stroring Profile Data</h4>
        The default Profile provider in ASP.NET 2.0 stores profile data in a local SQL Server
        2005 Express database located in the App_Data directory of your application. But
        it can be changed to some other via connection string: <span class="code">&lt;connectionStrings&gt;<br />
            &lt;remove name="LocalSqlServer" /&gt;<br />
            &lt;add name="LocalSqlServer" connectionString= "Server=.;Database=aspnetdb;trusted_connection=yes"/&gt;<br />
            &lt;/connectionStrings&gt; </span>But before that we need to create database
        using command line parameters: <span class="code">aspnet_regsql -A all -C server=.;database=aspnetdb;trusted_connection=yes
        </span>
        <h4>
            Serialization
        </h4>
        You can control how your properties are serialized by changing the <strong>serializeAs</strong>
        attribute on the add element in web.config. This attribute can be one of four values:
        <ol>
            <li>Binary</li>
            <li>ProviderSpecific <em>(default)</em></li>
            <li>String</li>
            <li>Xml</li></ol>
        ProviderSpecific which might better be called TypeSpecific since the type of the
        object will determine the format of its serialization.
    </div>
</asp:Content>
