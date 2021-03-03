<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="CodeLab.Chapter2.MasterPageDynamically.Default"
    MasterPageFile="~/CodeLab/Chapter2/MasterPageDynamically/MasterPage.master" %>

<asp:Content runat="Server" ContentPlaceHolderID="contentPlaceHolder1">
    <asp:Panel ID="panel1" runat="server" BackColor="#00C000" Height="248px" Width="936px">
        <ul style="color: White; font-family: Calibri">
            <li>This is the .aspx page using MasterPageFile dynamically(at run time).</li><li>By the help of property <u>Page.MasterPageFile="~/Your_MasterPage.master"</u> one can set
                MasterPageFile dynamically.</li><li>BUT it is worthy to mention that you should use this property in <i>Page_PreInit()</i>
                event handler.</li><li>WHY? Because during this phase pages(<u>Default.aspx and Default.aspx.cs & MasterPage.master</u>)are merged in single page as they are partial class's pages.</li><li>Well! Still you need to include MasterPageFile="" in @Page directive so that rest
                of the part of the page can be included in asp:Content tag.</li><li>I have included two MasterPage(s) that are changed randomly by the help of <u>Random</u>
                class's Next() method.</li><li>Any doubt,queries or need clarification feel free to contact me! </li>
            <li>All &copy; Vikram Singh Saini. Copy strictly allowed for educational purpose only.</li><li>Leave your feedback and comments at vs00saini@yahoo.co.in.</li></ul>
    </asp:Panel>
</asp:Content>
