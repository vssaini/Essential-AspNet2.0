<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Chapter2.aspx.cs" Inherits="Pages.PagesChapter2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphMaster" runat="Server">
    <div class="pageHeader">
        User Interface Elements</div>
    <p>
        ASP.NET 2.0 INTRODUCES SEVERAL FEATURES that make it easier to build compelling,
        unified user interfaces. In this chapter we look at the three primary new user interface
        elements of ASP.NET 2.0: master pages, themes and skins, and navigation controls.</p>
    <div class="pageSubHeader acl Information">
        Implementation of Master & Content pages
    </div>
    <div class="subHdrPara">
        The templates defined by master pages are injected into the generated control hierarchy
        for the requested page. This injection happens just before the Page class' Init
        event; this way, all of the controls will be in place prior to Init, when it is
        common to perform programmatic manipulation of controls. The actual merging of the
        master page's control hierarchy and the page's control hierarchy is performed as
        follows:
        <ol type="a">
            <li>The top-level control of the master page (which will be named the same as the file
                containing the master page) will be inserted as the root control in the new page
                hierarchy. </li>
            <li>The contents of each Content control in the page is then injected as a collection
                of child controls underneath the corresponding ContentPlaceHolder control.</li>
        </ol>
    </div>
    <div class="pageSubHeader acl Information">
        Working with Master pages
    </div>
    <div class="subHdrPara">
        <strong>1. </strong>To access or change contents of master pages, it is generally
        better to build logic into your master page to manipulate the controls and to <strong>
            expose that logic as methods or properties on the master page.</strong> A particular
        page could then access the master page via the Master property of the Page class,
        cast the result to the master page type. Check link: <a href="../CodeLab/Chapter2/Default.aspx">
            Accessing master page's control</a>
        <p>
            <strong>2. </strong>Casting can be eliminated by using the <strong>MasterType</strong>
            directive in the content page. Adding a MasterType directive causes ASP.NET to generate
            a typesafe version of the Page class' Master property that is strongly typed to
            the master page referenced in the VirtualPath attribute.</p>
        <p>
            <strong>3. </strong>You might find it useful to create multiple master pages that
            could be applied to a page based on some criterion (like a user preference stored
            in profile or the request's time of day). In this case you couldn't use the VirtualPath
            attribute, as the cast would fail if the master page changed. Instead, you could
            create a <strong>base class</strong> that inherits from MasterPage, add the necessary
            properties and methods to that base class, and then have all of your master pages
            inherit from that common master page base class. Your pages would then use the <strong>
                TypeName</strong> attribute in their MasterType directive to gain strongly typed
            access to the common base class.</p>
        <p>
            <strong>4. </strong>Changing master page at runtime - By using public <strong>MasterPageFile</strong>
            property in <strong><em>Page_PreInit</em></strong> event handler method. Check link:
            <a target="_blank" href="../CodeLab/Chapter2/MasterPageDynamically/Default.aspx">Master
                page at runtime</a></p>
        <p>
            <strong>5. </strong>Set master pages for all pages - By setting pages element's
            attribute <strong>masterPageFile</strong>. The Master Page is applied only to content
            pages. If a page does not contain any Content controls—it is a normal ASP.NET page—then
            the Master Page is ignored.</p>
    </div>
    <div class="pageSubHeader acl Information">
        Using device filters to declaratively select a master page
    </div>
    <div class="subHdrPara">
        It is useful to create alternate master pages based on the <strong>user agent string
            (browser type)</strong> sent by the client. If you want to leverage some browser-specific
        features in your master page, it may make sense to create multiple versions of the
        master page for the variations across browser types. ASP.NET 2.0 supports device
        filters to do this declaratively, which are <strong>prefix strings</strong> that
        you can apply to the <em>MasterPageFile</em> attribute to indicate which browser
        type should map to which master page. Prefix strings map to <strong>.browser</strong>
        files that have regular expressions defined to determine which browser is being
        used to access the site from the user agent string. You can include other device
        filter strings by adding additional .browser files to your local App_Browsers directory.
        Keep in mind that, each master page must have the same set of ContentPlaceHolder
        controls for this technique to work properly. See code snippet:
        <br />
        <div class="code">
            &lt;%@ Page Language="C#" MasterPageFile="~/SiteTemplate.master" ie:MasterPageFile="~/IESiteTemplate.master"
            mozilla:MasterPageFile="~/FirefoxSiteTemplate.master" %&gt; &lt;!-- ... --&gt;</div>
    </div>
    <div class="pageSubHeader acl Information">
        Themes and Skins
    </div>
    <div class="subHdrPara">
        <ol class="li_nospace">
            <li>A theme is a collection of user interface elements, like stylesheets, images, and
                skins, consolidated into a single directory, which can then be applied to an individual
                page across all pages in a site.</li>
            <li><strong>Technically</strong>, a theme is a subdirectory beneath a site's top level
                App_Themes directory. The name of each subdirectory becomes a theme available for
                applications within the site.</li>
            <li>Every page with theme applied will have a link added to its &lt;head&gt; element
                for each .css file in the theme.</li>
            <li>References to files contained in subdirectories are implicitly prefixed with the
                full virtual path to the subdirectory containing the resource, so they are valid
                from any page in the site.</li>
            <li>Both .css files as well as .skin files must be placed at the top level of a theme
                directory to take effect.</li>
            <li>Skin files are conceptually like cascading stylesheets for ASP.NET server-side controls.
                A .skin file consists of a collection of control declarations with properties (can't
                include an ID attribute). The properties defined by each control will be applied
                to all instances of that control on pages to which the enclosing theme is applied.</li>
            <li>You can also define multiple skins for a single control in a .skin file if you use
                the <strong>SkinID</strong> attribute. It can be used to create an alternate appearance
                for a particular control and have controls select the skin by using the same SkinID
                attribute when declared on a page.</li>
        </ol>
    </div>
    <div class="pageSubHeader acl Information">
        Working with themes
    </div>
    <div class="subHdrPara">
        <ul class="li_nospace">
            <li>Attributes defined in the theme override attributes defined locally, and in general
                the two sets of attributes are merged when <strong>Theme</strong> attribute is used
                in @Page directive.</li>
            <li>Applying theme with attribute <strong>StyleSheetTheme</strong> in Page directive
                will not override local values, and is so named because it behaves more like CSS
                stylesheets.</li>
            <li>To set theme for all pages at one place: Just set <strong>theme</strong> attribute
                of <em>pages</em> element in web.config unless if it is modified by Theme attribute
                in Pages property or in code at runtime.</li>
            <li><strong>Changing theme at runtime:</strong> Theme can be changed at runtime for
                single page in Page_PreInit event handler by Page.Theme property. Check link: <a
                    href="../CodeLab/Chapter2/Default.aspx">Theme at runtime</a>. For applying themes
                to all pages , <strong>one way</strong> is to create a common base Page-derived
                class that all of your pages inherit from and set the theme in the PreInit handler
                of that class. <strong>Another way</strong> is to trap the PreRequestHandlerExecute
                event in your HttpApplication class and add a handler to the PreInit event to set
                the theme there. See code:
                <div class="code">
                    &lt;%--File: Global.asax--%&gt;
                    <br />
                    &lt;%@ Application Language="C#" %&gt;<br />
                    &lt;script runat="server"&gt;<br />
                    void Application_PreRequestHandlerExecute(object src, EventArgs e)
                    <br />
                    {<br />
                    Page p = this.Context.Handler as Page;
                    <br />
                    if (p != null)<br />
                    {
                    <br />
                    p.PreInit += new EventHandler(page_PreInit);<br />
                    }<br />
                    }
                    <br />
                    void page_PreInit(object sender, EventArgs e)<br />
                    {<br />
                    // Note that you could retrieve the theme from
                    <br />
                    // anywhere at this point (most likely Profile as shown here).
                    <br />
                    Page p = this.Context.Handler as Page;
                    <br />
                    if (p != null)
                    <br />
                    {<br />
                    p.Theme = (string)Context.Profile["theme"];<br />
                    }<br />
                    }<br />
                    &lt;/script&gt;
                </div>
            </li>
        </ul>
    </div>
    <div class="pageSubHeader acl Information">
        Navigational controls
    </div>
    <div class="subHdrPara">
        Navigational controls the <strong>TreeView</strong>, <strong>Menu</strong>, and
        <strong>SiteMapPath</strong> are typically populated by an XML file named web.sitemap
        placed in the root of your application.
        <p>
            Each of these controls relies indirectly on the presence of a class called <strong>SiteMapProvider</strong>,
            which is an abstract class defining methods for retrieving the navigation information
            for a site, as well as indicating which node in the navigation information is currently
            active based on the URL the client has requested. The default SiteMapProvider implementation
            is the XmlSiteMapProvider, which looks for the web.sitemap file in the root of the
            application for its navigation information.</p>
    </div>
    <div class="pageSubHeader acl Information">
        Control Adapters
    </div>
    <div class="subHdrPara">
        <ul>
            <li>A control adapter allows you to plug-into any ASP.NET server control and override,
                modify and/or tweak the rendering output logic of that control. <strong>O</strong>r
                alternate way to specify renderings of controls.</li>
            <li>Architecture of control adapter: Internally, when a control is rendering, the Control
                base class will first check to see if there is a control adapter currently associated
                with the control. If there is, it will invoke the Render method of the adapter;
                if not, it calls the standard Render method of the control.<br />
                <img src="../Images/adapter_arch.gif" alt="ArchitectureDiag" title="Control Adapter working" /></li>
            <li>Control adapters are designed to provide alternate renderings for different clients,
                you specify control adapter mappings in a .browser file, which is where associations
                between User Agent strings and browser capabilities are defined. Check .browser
                file at <strong>%SYSTEM%\Microsoft.NET\Framework\v2.0.50727\Config\Browsers</strong>
                directory. </li>
            <li>To create your own control adapter, you start by creating a new class that inherits
                from the ControlAdapter base class, or more commonly one of its derivatives, <strong>
                    WebControlAdapter</strong> if the control is Webcontrol.</li>
            <li>Next we associate this adapter class with the control in .browser file. refID attribute
                specify for which browser should the adapter class is invoked. <em>Default</em>
                is value for all browsers.
                <div class="code">
                    &lt;!-- File: MyAdapters.browser --&gt;<br />
                    &lt;browsers&gt;<br />
                    &nbsp;&lt;browser refID="Default"&gt;<br />
                    &nbsp;&nbsp;&lt;controlAdapters&gt;<br />
                    &nbsp;&nbsp;&nbsp;&lt;adapter controlType="System.Web.UI.WebControls.BulletedList"<br />
                    &nbsp;&nbsp;&nbsp;adapterType= "EssentialAspDotNet2.UIElements.BulletedListControlAdapter"
                    /&gt;<br />
                    &nbsp;&nbsp;&lt;/controlAdapters&gt;<br />
                    &nbsp;&lt;/browser&gt;<br />
                    &lt;/browsers&gt;
                </div>
                Other refID values shown below:<br />
                <img src="../Images/refID_values.bmp" alt="refID" />
            </li>
        </ul>
    </div>
</asp:Content>
