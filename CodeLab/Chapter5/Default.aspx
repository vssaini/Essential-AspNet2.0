<%@ Page Title="" Language="C#" MasterPageFile="~/Template/Main.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="CodeLab.Chapter5.CodeLabChapter5Default" %>

<asp:Content ID="Content2" ContentPlaceHolderID="cphMaster" runat="Server">
    <span class="clHead">Getting Started with Membership </span>
    <p>
        Welcome,
        <asp:LoginName ID="LoginName1" runat="server" />
        &nbsp;
        <asp:LoginStatus ID="LoginStatus1" runat="server" />
    </p>
</asp:Content>
