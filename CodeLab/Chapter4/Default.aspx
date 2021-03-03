<%@ Page Title="" Language="C#" MasterPageFile="~/Template/Main.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="CodeLab.Chapter4.CodeLabChapter4Default" %>

<%@ PreviousPageType VirtualPath="~/Pages/Chapter4.aspx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cphMaster" runat="Server">
    <span class="clHead">Implementation of PostBackUrl </span>
    <p>
        When you set the PostBackUrl property of a button to a different page, it does two
        things.</p>
    <ol>
        <li>First, it sets the client-side OnClick handler for that button to point to a JavaScript
            method called <strong>WebForm_DoPostBackWithOptions</strong>, which will programmatically
            set the form's action to the target page. </li>
        <li>Second, it causes the page to render an additional hidden field, __PREVIOUSPAGE,
            which contains the path of the source page in an encrypted string along with an
            accompanying message authentication code for validating the string.</li>
    </ol>
    <p>
        Setting the action dynamically like this enables you to have multiple buttons on
        a page that all potentially post to different pages and keeps the architecture flexible.
        Storing the path of the previous page in a hidden field means that no matter where
        you send the POST request, the target page will be able to determine where the request
        came from, and will know which class to instantiate to parse the body of the message.</p>
    <span class="clHead">Implementation of PreviousPage</span>
    <ul>
        <li>Once the POST request is issued to the target page, the path of the previous page
            is read and decrypted from the __PREVIOUSPAGE hidden field and cached.</li>
        <li>If you never actually access the PreviousPage property, it will never create the
            class and ask it to parse the body of the request. The first time you do access
            the PreviousPage property in the target page, ASP.NET allocates a new instance of
            the previous page type, as determined by the cached path to the previous page extracted
            from the __PREVIOUSPAGE hidden field.</li>
        <li>Once it is created, it then executes the page much like it would if the request
            had been issued to it. The page is not executed in its entirety, however, since
            it only needs to restore the state from the POST body, so it runs through its life
            cycle up to and including the LoadComplete event. </li>
        <li>The Response and Trace objects of the previous page instance are also set to null
            during this execution since there should be no output associated with the process.
            It is important to keep in mind that the preceding page will be created and asked
            to run through LoadComplete. </li>
        <li>If you have any code that generates side effects, you should make an effort to exclude
            that code from running when the page is executed during a cross-page postback. You
            can check to see whether you are being executed for real or for the purpose of evaluating
            the POST body of a cross-page post by checking the IsCrossPagePostBack property.</li>
    </ul>
    <span class="clHead">Receiving source page values</span><br />
    <label>
        Value received from source page's textbox:</label>&nbsp;<asp:Label ID="lblPreValue"
            runat="server" ForeColor="DarkRed"/>
</asp:Content>
