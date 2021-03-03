<%@ Page Title="" Language="C#" AutoEventWireup="true" MasterPageFile="~/Template/Main.master" CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphMaster" runat="Server">
    <asp:TextBox ID="txtCheck" runat="server" CssClass="check" />
    <div class="pageHeader">
        Essential Asp.Net 2.0</div>
    <img src="Images/ean.bmp" alt="About Essential Asp.Net 2.0" />
    <div class="divBorder">
        <div id="divFritz" class="fritz">
            <p class="paraPadding">
                <strong>Fritz Onion</strong> is a cofounder of <a href="http://www.pluralsight.com"
                    target="_blank">Pluralsight</a>, a Microsoft .NET training provider. He is the
                author of Pluralsight's ASP.NET curriculum, and he teaches course offerings around
                the world. The author of the highly acclaimed book Essential ASP.NET with Examples
                in C# (Addison-Wesley) and a columnist for MSDN Magazine, he is also a regular speaker
                at industry conferences, including TechEd, VSLive!, and PDC. Fritz received his
                B.A. from Harvard University and his M.S. from the University of California, Irvine.
            </p>
        </div>
    </div>
    <div class="divBorder">
        <div id="divKeith" class="keith">
            <p class="paraPadding">
                <strong>Keith Brown</strong> is a cofounder of Pluralsight, where he focuses on
                application security. A contributing editor for MSDN Magazine, he writes the Security
                Briefs column. He is the author of the landmark book Programming Windows Security
                (Addison-Wesley) & The .NET Developer's Guide to Windows Security (Addison-Wesley).
                Keith spends most of his time researching security techniques and technologies,
                and he has spent close to a decade teaching and developing course material for professional
                software developers.
            </p>
        </div>
    </div>
</asp:Content>
