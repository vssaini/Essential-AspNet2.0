<%@ Page Title="" Language="C#" AutoEventWireup="true" CodeFile="Chapter1.aspx.cs"
    Inherits="Pages.PagesChapter1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphMaster" runat="Server">
    <div class="pageHeader">
        Architecture</div>
    <div class="pageSubHeader acl Information">
        ASP.NET Page's Events
    </div>
    <div class="subHdrPara" align="center">
        <img src="../Images/pagelifecycle.png" alt="Page Events diag." title="Asp.Net Page's Events" />
    </div>
    <br />
    <div class="pageSubHeader acl Information">
        Compilation of code-behind classes
    </div>
    <div class="subHdrPara">
        When Default.aspx page is requested, asp.net generates <strong>three</strong> classes
        during processing of request. In addition to turning your .aspx file into a class
        definition with methods for rendering the page, as it has always done, ASP.NET now
        will also generate a <strong>sibling partial class</strong> for your codebehind
        class that contains <em>protected control member variable declarations</em>.
        <p>
            Your <strong>class (codebehind partial class)</strong> is then compiled together
            with this generated class definition (sibling partial class), merged together, and
            then it becomes the <strong>base class</strong> for the <strong>class generated for
                the .aspx file</strong>. The end result is that you essentially write codebehind
            classes the way you always have, but you no longer have to declare (or let the designer
            declare for you) member variable declarations of server-side controls. This was
            always a somewhat fragile relationship in 1.x, since if you ever accidentally modified
            one of the control declarations so that it no longer matched the ID of the control
            declared on the form, things suddenly stopped working. Now the member variables
            are declared implicitly and will always be correct.</p>
    </div>
    <div class="pageSubHeader acl Information">
        Life Cycle of Page</div>
    <div class="subHdrPara">
        <img src="../Images/page_life.bmp" alt="Asp.Net 2.0 Page life cycle" title="Life cycle of page" /><br />
        <br />
        <strong>Events in life cycle of page explained: </strong>
        <br />
        <ol type="1">
            <li><strong>PreInit -</strong>Fires only the first time the page is loaded. When you
                use a web form and post back to this page again, this event doesn't fire.This event
                occurs only for the Page class and UserControls/MasterPages do not have this method
                to override. Create or recreate dynamic controls. Themes, master pages and control
                skins applied. Read or set profile property values. </li>
            <li><strong>Init -</strong> Raised after all controls has been initialized. Read or
                initialize control properties.</li>
            <li><strong>InitComplete -</strong> Create child controls (if IsPostBack). Control/View
                state loaded (if IsPostBack).</li>
            <li><strong>PreLoad -</strong> Process any postback data. Perform processing on control
                or page before load.</li>
            <li><strong>Load -</strong> Page calls <strong>OnLoad</strong> event method on Page,
                then recursively for each control and child control until the page and all controls
                are loaded. Sever side events fired (if IsPostBack).</li>
            <li><strong>LoadComplete -</strong> Create child controls (if !IsPostBack).</li>
            <li><strong>PreRender -</strong> Each databound control whose DataSourceID property
                is set calls its DataBind method. Use it to make final changes to content of pages.</li>
            <li><strong>PreRenderComplete</strong></li>
            <li><strong>Control/Viewstate saved</strong></li>
            <li><strong>SaveStateComplete</strong></li>
            <li><strong>Render -</strong> Page object calls this method on each control.</li>
            <li><strong>Unload -</strong> This event occurs for each control and then for the page.
                Close control specific database connections. Close open file and database connections.
                Control make further changes to response stream.</li>
        </ol>
    </div>
</asp:Content>
