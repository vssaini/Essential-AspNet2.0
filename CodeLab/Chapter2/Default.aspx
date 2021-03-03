<%@ Page Title="" Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs"
    Inherits="CodeLab.Chapter2.CodeLabChapter2Default" StylesheetTheme="default" %>

<%@ MasterType VirtualPath="~/Template/Main.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cphMaster" runat="Server">
    <em>Note - Do not forget to check web.config file of this directory.</em>
    <p>
        <strong>1. </strong>Working with master pages pages in the directory.&nbsp;
        <asp:Button ID="btnShowMasterPanel" runat="server" Text="Show Master Panel in Header"
            CssClass="rbDecorated rbPrimary" OnClick="btnShowMasterPanel_Click" />
    </p>
    <p>
        <strong>2. </strong>Working with Themes<br />
        <asp:Label ID="lblMsg" runat="server" AssociatedControlID="ddlSelectTheme">Select the theme:</asp:Label>&nbsp;<asp:DropDownList
            ID="ddlSelectTheme" runat="server" AutoPostBack="True" Font-Names="Colaborate-Regular"
            OnSelectedIndexChanged="ddlSelectTheme_SelectedIndexChanged">
            <asp:ListItem>Select Theme</asp:ListItem>
            <asp:ListItem Text="default" />
            <asp:ListItem Text="global" />
            <asp:ListItem Text="sexy" />
        </asp:DropDownList>
        <br />
        <asp:Label ID="lblInform" runat="Server" />
    </p>
    <p>
        <strong>3. </strong>Navigation controls<br />
        <asp:SiteMapDataSource ID="_siteMapDataSource" runat="server" />
        <asp:TreeView ID="_mainTree" runat="server" DataSourceID="_siteMapDataSource"/>
        <br />
        <asp:Menu ID="_mainMenu" runat="server" DataSourceID="_siteMapDataSource" Orientation="Horizontal" />
    </p>
    <p>
        <strong>4. </strong>Control Adapters<br />
        <asp:BulletedList ID="_bulletedList" runat="server">
            <asp:ListItem Value="1">Item 1</asp:ListItem>
            <asp:ListItem Value="2">Item 2</asp:ListItem>
            <asp:ListItem Value="3">Item 3</asp:ListItem>
            <asp:ListItem Value="4">Item 4</asp:ListItem>
        </asp:BulletedList>
    </p>
</asp:Content>
