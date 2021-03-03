<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Chapter5.aspx.cs" Inherits="Pages.PagesChapter5" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphMaster" runat="Server">
    <div class="pageHeader">
        Security</div>
    This chapter:
    <ol>
        <li>Explore the Membership and Role providers in depth. </li>
        <li>Talk about real-world security issues you should consider when configuring them.</li>
        <li>Explore the role of machine keys.</li>
        <li>Cookieless Forms authentication and web.config file encryption.</li></ol>
    <div class="pageSubHeader acl Information">
        Getting Started with Membership
    </div>
    <div class="subHdrPara">
        We have made a CodeLab page that can be accessed by authenticated user only. Anonymous user cannot
        access it. For same we have used Forms authentication in root web.config file. <span
            class="code">&lt;authentication mode="Forms"&gt;<br />
            &lt;forms defaultUrl="CodeLab/Chapter5/Default.aspx" loginUrl="Pages/Login.aspx"/&gt;<br />
            &lt;/authentication&gt;<br />
            ..........<br />
            &lt;location path="CodeLab/Chapter5/Default.aspx"&gt;<br />
            &lt;system.web&gt;<br />
            &lt;authorization&gt;<br />
            &lt;deny users="?"/&gt;<br />
            &lt;/authorization&gt;
            <br />
            &lt;/system.web&gt;<br />
            &lt;/location&gt; </span>For testing please visit: <a href="../CodeLab/Chapter5/Default.aspx">
                Chapter 5:Code Lab Page</a>
    </div>
</asp:Content>
