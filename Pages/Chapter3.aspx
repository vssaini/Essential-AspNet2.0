<%@ Page Language="C#" AutoEventWireup="true" MaintainScrollPositionOnPostback="true"
    CodeFile="Chapter3.aspx.cs" Inherits="Pages.PagesChapter3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphMaster" runat="Server">
    <div class="pageHeader">
        Data Binding</div>
    Explains datasource and databound controls introduced in ASP.NET 2.0. DataSource
    controls <em>(the first two are rectangular, returning collections of rows of data;
        the last two are hierarchial, returning trees of data connected with parent-child
        relationships)</em> are:
    <ul>
        <li>SqlDataSource </li>
        <li>ObjectDataSource </li>
        <li>XmlDataSource</li>
        <li>SiteMapDataSource</li>
    </ul>
    <div class="pageSubHeader acl Information">
        1. Understanding Data Binding
    </div>
    <div class="subHdrPara">
        When the data source is ready to be read from, the user of the control calls the
        DataBind() method on the control, at which point the control reads in all the data
        from the data source, making a local copy of it. When the page is ultimately rendered,
        the control takes the cached data it retrieved from the data source and renders
        its contents into the response buffer in whatever format the control is built to
        provide.<br />
        <br />
        <img src="../Images/databinding.jpg" alt="Understanding databinding" title="Relationship between a data-bound control, a data source control, and a database" />
    </div>
    <br />
    <div class="pageSubHeader acl Information">
        2. Data Source Controls
    </div>
    <div class="subHdrPara">
        A <strong>data source control</strong> is an abstraction of getting and sending
        of data from and to a data repository (typically a SQL database), and it takes care
        of making the necessary ADO.NET calls to interact with the database.
        <p>
            Rectangular data source controls implement the <strong>IDataSource</strong> interface,
            which has one important method: <strong>GetView()</strong>. This returns a class
            deriving from the abstract base class <strong>DataSourceView</strong>, which provides
            the standard data source operations: Select, Insert, Update, and Delete. All of
            the data sources that ship with ASP.NET 2.0 provide only one view of the data. This
            view can always be retrieved by passing an empty string or null to the GetView method.
        </p>
        <asp:GridView ID="_moviesGridView" runat="server" DataSourceID="_moviesDataSource"
            AutoGenerateColumns="False" DataKeyNames="movie_id" EmptyDataText="There are no data records to display."
            CssClass="grid" Caption="<em>SqlDataSource and GridView</em>" AllowSorting="false">
            <RowStyle HorizontalAlign="Center" />
            <HeaderStyle CssClass="gridheader" />
            <Columns>
                <asp:TemplateField>
                    <InsertItemTemplate>
                        Fuck
                    </InsertItemTemplate>
                </asp:TemplateField>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="true"
                    Visible="true" />
                <asp:BoundField DataField="movie_id" HeaderText="Moview ID" ReadOnly="True" SortExpression="movie_id" />
                <asp:BoundField DataField="title" HeaderText="Title" SortExpression="title" />
                <asp:BoundField DataField="release_date" HeaderText="Release Date" DataFormatString="{0:dd MMMM yyyy}"
                    SortExpression="release_date" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="_moviesDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:conString %>"
            DataSourceMode="DataSet" DeleteCommand="DELETE FROM [movies] WHERE [movie_id] = @movie_id"
            InsertCommand="INSERT INTO [movies] ([title], [release_date]) VALUES (@title, @release_date)"
            ProviderName="<%$ ConnectionStrings:conString.ProviderName %>" SelectCommand="SELECT [movie_id], [title], [release_date] FROM [movies]"
            UpdateCommand="UPDATE [movies] SET [title] = @title, [release_date] = @release_date WHERE [movie_id] = @movie_id">
            <DeleteParameters>
                <asp:Parameter Name="movie_id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="title" Type="String" />
                <asp:Parameter Name="release_date" Type="DateTime" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="title" Type="String" />
                <asp:Parameter Name="release_date" Type="DateTime" />
                <asp:Parameter Name="movie_id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>
    <br />
    <div class="pageSubHeader acl Information">
        3. Data Source Controls, ViewState and ControlState
    </div>
    <div class="subHdrPara">
        As in ASP.NET 1.1, controls always keep a local cache of the data to bridge the
        gap between data binding and rendering. By default, this data will also be stored
        in ViewState.
        <p>
            If you have a button or other postback generating control on a form alongside a
            GridView, and the effect of the button is to modify the underlying database (say
            it adds a new row to the table being displayed by the GridView), you won't see the
            changes made to the database when the page is rendered because the GridView is drawing
            its state from ViewState and not going back to the database. The solution, of course,
            is to disable ViewState on the GridView and force it to retrieve the data again
            with each request.
        </p>
        <p>
            <strong>Control state</strong> is another type of hidden state reserved exclusively
            for controls to maintain their core (behavioral) functionality, whereas <strong>View
                state</strong> is now only to contain state to maintain the control's contents
            (UI). Technically, control state is stored in the same hidden field as view state
            (it is just another leaf node at the end of the view state hierarchy), but if you
            disable view state on a particular control (or on an entire page), the control state
            is still propagated.
        </p>
    </div>
    <div class="pageSubHeader acl Information">
        4. Declarative DataSources without embedded SQL
    </div>
    <div class="subHdrPara">
        <strong>1.</strong> SqlDataSource + Web.config
        <br />
        <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1" AutoGenerateColumns="true"
            DataKeyNames="movie_id" EmptyDataText="There are no data records to display."
            CssClass="grid" AllowSorting="false">
            <RowStyle HorizontalAlign="Center" />
            <HeaderStyle CssClass="gridheader" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:conString %>"
            DeleteCommand="<%$ AppSettings:MoviesDeleteCommand %>" InsertCommand="<%$ AppSettings:MoviesInsertCommand %>"
            SelectCommand="<%$ AppSettings:MoviesSelectCommand %>" UpdateCommand="<%$ AppSettings:MoviesUpdateCommand %>">
            <InsertParameters>
                <asp:Parameter Name="title" Type="String" />
                <asp:Parameter Name="release_date" Type="DateTime" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="title" Type="String" />
                <asp:Parameter Name="release_date" Type="DateTime" />
                <asp:Parameter Name="movie_id" Type="Int32" />
            </UpdateParameters>
            <DeleteParameters>
                <asp:Parameter Name="movie_id" Type="Int32" />
            </DeleteParameters>
        </asp:SqlDataSource>
        <br />
        <strong>2.</strong> SqlDataSource + StoredProcedure - Need to set CommandType for
        each operation to <em>StoredProcedure</em>.
        <br />
        <asp:GridView ID="GridView2" runat="server" DataSourceID="SqlDataSource2" AutoGenerateColumns="true"
            DataKeyNames="movie_id" EmptyDataText="There are no data records to display."
            CssClass="grid" AllowSorting="false">
            <RowStyle HorizontalAlign="Center" />
            <HeaderStyle CssClass="gridheader" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:conString %>"
            DeleteCommand="DeleteMovie" DeleteCommandType="StoredProcedure" InsertCommand="InsertMovie"
            InsertCommandType="StoredProcedure" SelectCommand="GetMovies" SelectCommandType="StoredProcedure"
            UpdateCommand="UpdateMovie" UpdateCommandType="StoredProcedure">
            <InsertParameters>
                <asp:Parameter Name="title" Type="String" />
                <asp:Parameter Name="release_date" Type="DateTime" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="title" Type="String" />
                <asp:Parameter Name="release_date" Type="DateTime" />
                <asp:Parameter Name="movie_id" Type="Int32" />
            </UpdateParameters>
            <DeleteParameters>
                <asp:Parameter Name="movie_id" Type="Int32" />
            </DeleteParameters>
        </asp:SqlDataSource>
    </div>
    <br />
    <div class="pageSubHeader acl Information">
        5. Data Source Parameters
    </div>
    <div class="subHdrPara">
        Search:
        <asp:TextBox ID="_searchTextBox" runat="server" CssClass="grid" />
        <asp:Button ID="_searchButton" runat="server" Text="Search" /><br />
        <br />
        <asp:GridView ID="_moviesGrid" runat="server" AutoGenerateColumns="False" DataKeyNames="movie_id"
            DataSourceID="SqlDataSource3" EmptyDataText="There are no data records to display."
            CssClass="grid">
            <HeaderStyle CssClass="gridheader" />
            <Columns>
                <asp:BoundField DataField="title" HeaderText="Title" />
                <asp:BoundField DataField="release_date" DataFormatString="{0:d}" HeaderText="Release date"
                    HtmlEncode="False" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:conString %>"
            SelectCommand="SELECT [movie_id], [title], [release_date] FROM [movies]" FilterExpression="title LIKE '%{0}%'">
            <FilterParameters>
                <asp:ControlParameter ControlID="_searchTextBox" PropertyName="Text" />
            </FilterParameters>
        </asp:SqlDataSource>
        <br />
        <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" DataKeyNames="movie_id"
            DataSourceID="SqlDataSource4" EmptyDataText="There are no data records to display."
            CssClass="grid" Caption="<em> Master-detail relationship between a GridView and a DataList</em>">
            <HeaderStyle CssClass="gridheader" />
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="movie_id" HeaderText="Movie Id" ReadOnly="True" SortExpression="movie_id"
                    Visible="False" />
                <asp:BoundField DataField="title" HeaderText="Title" SortExpression="title" />
                <asp:BoundField DataField="release_date" DataFormatString="{0:d}" HeaderText="Release date"
                    HtmlEncode="False" SortExpression="release_date" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:conString %>"
            SelectCommand="SELECT [movie_id], [title], [release_date] FROM [movies]"></asp:SqlDataSource>
        <br />
        <asp:DataList ID="_reviewsDataList" runat="server" RepeatColumns="2" RepeatDirection="Horizontal"
            DataKeyField="review_id" DataSourceID="_reviewsDataSource" CssClass="dlist">
            <ItemTemplate>
                <strong>Summary:</strong>
                <asp:Label ID="summaryLabel" runat="server" Text='<%# Eval("summary") %>' /><br />
                <strong>Rating:</strong>
                <asp:Label ID="ratingLabel" runat="server" Text='<%# Eval("rating") %>' /><br />
                <strong>Review:</strong>
                <asp:Label ID="reviewLabel" runat="server" Text='<%# Eval("review") %>' /><br />
                &nbsp;&nbsp;<em>--
                    <asp:Label ID="reviewerLabel" runat="server" Text='<%# Eval("reviewer") %>' /></em><br />
                <br />
            </ItemTemplate>
        </asp:DataList>
        <asp:SqlDataSource ID="_reviewsDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:conString %>"
            SelectCommand="SELECT review_id, movie_id, summary, rating, review,
reviewer FROM reviews WHERE (movie_id = @movie_id)">
            <SelectParameters>
                <asp:ControlParameter ControlID="GridView3" Name="movie_id" PropertyName="SelectedValue"
                    Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
    <br />
    <div class="pageSubHeader acl Information">
        6. New DataBound Controls
    </div>
    <div class="subHdrPara">
        <strong>DetailsView</strong> supports the ability to show, edit, insert, or delete
        a single row at a time, and will automatically generate default controls for displaying
        and updating individual fields based on their type in the underlying data source.
        The DefaultMode property of the control lets you specify which of the three modes
        of operation it should initially display: Edit, Insert, or ReadOnly. You typically
        will include a CommandField that displays hyperlinks to let the user switch between
        the three modes as well (although you can also restrict the user to only using one
        or two modes if you like).
        <br />
        <br />
        <asp:DetailsView ID="_moviesDetailsView" runat="server" AllowPaging="True" AutoGenerateRows="False"
            DataKeyNames="movie_id" DataSourceID="SqlDataSource5" CssClass="grid" DefaultMode="ReadOnly">
            <Fields>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" />
                <asp:BoundField DataField="movie_id" HeaderText="movie_id" InsertVisible="False"
                    ReadOnly="True" Visible="False" />
                <asp:BoundField DataField="title" HeaderText="Title" />
                <asp:BoundField DataField="release_date" DataFormatString="{0:d}" HeaderText="Release date"
                    HtmlEncode="False" />
            </Fields>
        </asp:DetailsView>
        <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:conString %>"
            DeleteCommand="DELETE FROM movies WHERE movie_id = @movie_id" InsertCommand="INSERT INTO movies (title, release_date) VALUES
(@title, @release_date)" SelectCommand="SELECT movie_id, title, release_date FROM movies"
            UpdateCommand="UPDATE movies SET title = @title, release_date =
@release_date WHERE movie_id = @movie_id">
            <DeleteParameters>
                <asp:Parameter Name="movie_id" Type="Int32" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="title" Type="String" />
                <asp:Parameter Name="release_date" Type="DateTime" />
                <asp:Parameter Name="movie_id" Type="Int32" />
            </UpdateParameters>
            <InsertParameters>
                <asp:Parameter Name="title" Type="String" />
                <asp:Parameter Name="release_date" Type="DateTime" />
            </InsertParameters>
        </asp:SqlDataSource>
        <p>
            <strong>FormView</strong> is very much like the DetailsView. It renders one row
            at a time and provides the ability to display, edit, insert, and delete rows. The
            difference is that the FormView has no default rendering of fields, but rather relies
            on user-defined templates to render the data and the input controls. The choice
            to use a FormView over a DetailsView usually hinges on how much customization of
            the default rendering of the DetailsView you anticipate. One scenario that almost
            always mandates a FormView is if you want to add validation controls to your input
            controls when the client is updating or inserting a row.</p>
        <asp:FormView ID="_moviesFormView" runat="server" AllowPaging="True" DataKeyNames="movie_id"
            DataSourceID="_moviesDataSource" CssClass="grid">
            <ItemTemplate>
                Title:
                <asp:Label ID="titleLabel" runat="server" Text='<%# Bind("title") %>' /><br />
                Release date:
                <asp:Label ID="release_dateLabel" runat="server" Text='<%# Bind("release_date", "{0:d}") %>' />
                <br />
                <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit"
                    Text="Edit" />
                <asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete"
                    Text="Delete" />
                <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New"
                    Text="New" />
            </ItemTemplate>
            <EditItemTemplate>
                title:
                <asp:TextBox ID="_titleTextBox" runat="server" Text='<%# Bind("title") %>' />
                <asp:RequiredFieldValidator ID="_titleValidator" runat="server" ControlToValidate="_titleTextBox"
                    ErrorMessage="Please enter a title">**
                </asp:RequiredFieldValidator><br />
                release_date:
                <asp:TextBox ID="release_dateTextBox" runat="server" Text='<%# Bind("release_date", "{0:d}") %>' />
                <asp:RequiredFieldValidator ID="_releaseValidator" runat="server" ControlToValidate="release_dateTextBox"
                    ErrorMessage="Please enter a release date">**
                </asp:RequiredFieldValidator>
                <asp:RangeValidator ID="_releaseRangeValidator" runat="server" ControlToValidate="release_dateTextBox"
                    ErrorMessage="Please enter a valid release date (1/1/2006)" MaximumValue="1/1/1600"
                    MinimumValue="1/1/1000" Type="Date">**
                </asp:RangeValidator><br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update"
                    Text="Update" />
                <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                    Text="Cancel" />
            </EditItemTemplate>
            <InsertItemTemplate>
                title:
                <asp:TextBox ID="_titleTextBox" runat="server" Text='<%# Bind("title") %>' />
                <asp:RequiredFieldValidator ID="_titleValidator" runat="server" ControlToValidate="_titleTextBox"
                    ErrorMessage="Please enter a title">**
                </asp:RequiredFieldValidator><br />
                release_date:
                <asp:TextBox ID="release_dateTextBox" runat="server" Text='<%# Bind("release_date", "{0:d}") %>' />
                <asp:RequiredFieldValidator ID="_releaseValidator" runat="server" ControlToValidate="release_dateTextBox"
                    ErrorMessage="Please enter a release date">**
                </asp:RequiredFieldValidator>
                <asp:RangeValidator ID="_releaseRangeValidator" runat="server" ControlToValidate="release_dateTextBox"
                    ErrorMessage="Please enter a valid release date (1/1/2006)" MaximumValue="1/1/2600"
                    MinimumValue="1/1/1000" Type="Date">**
                </asp:RangeValidator><br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                    Text="Insert" />
                <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                    Text="Cancel" />
            </InsertItemTemplate>
        </asp:FormView>
    </div>
    <br />
    <div class="pageSubHeader acl Information">
        7. Declarative Data Binding Techniques
    </div>
    <div class="subHdrPara">
        <strong>1. </strong>Nested Declarative Data Binding
        <br />
        <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:conString %>"
            SelectCommand="SELECT review_id, m.movie_id, summary, rating,
review, reviewer, m.title FROM reviews AS r INNER JOIN movies AS m ON
r.movie_id=m.movie_id " UpdateCommand="UPDATE reviews SET summary = @summary, rating = @rating,
review = @review, reviewer = @reviewer, movie_id=@movie_id WHERE
review_id=@review_id">
            <UpdateParameters>
                <asp:Parameter Name="summary" />
                <asp:Parameter Name="rating" />
                <asp:Parameter Name="review" />
                <asp:Parameter Name="reviewer" />
                <asp:Parameter Name="review_id" />
                <asp:Parameter Name="movie_id" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="_reviewsGrid" runat="server" AllowPaging="True" AutoGenerateColumns="False"
            DataKeyNames="review_id" DataSourceID="SqlDataSource6" CssClass="grid">
            <HeaderStyle CssClass="gridheader" />
            <EditRowStyle CssClass="gridEdit" />
            <Columns>
                <asp:TemplateField HeaderText="Title" SortExpression="Title">
                    <EditItemTemplate>
                        <asp:DropDownList runat="server" ID="_movieTitleDropDown" DataSourceID="SqlDataSource7"
                            DataTextField="title" DataValueField="movie_id" SelectedValue='<%# Bind("movie_id") %>'>
                        </asp:DropDownList>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <%# Eval("title") %>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="review_id" HeaderText="review_id" Visible="False" ReadOnly="True"
                    SortExpression="review_id" />
                <asp:BoundField DataField="rating" HeaderText="Rating" SortExpression="rating" />
                <asp:BoundField DataField="review" HeaderText="Review" SortExpression="review" />
                <asp:BoundField DataField="reviewer" HeaderText="Reviewer" SortExpression="reviewer" />
                <asp:BoundField DataField="summary" HeaderText="Summary" SortExpression="summary" />
                <asp:CommandField ShowEditButton="True" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:conString %>"
            SelectCommand="SELECT movie_id, title FROM movies ORDER BY title" />
        <br />
        <strong>2. </strong>Programatic Parameter Population
        <br />
        <em>Add your own review</em><br />
        <asp:FormView ID="_insertReviewFormView" runat="server" DataSourceID="SqlDataSource8"
            DefaultMode="Insert" CssClass="grid">
            <InsertItemTemplate>
                <table>
                    <tr>
                        <td>
                            Select movie:
                        </td>
                        <td>
                            <asp:DropDownList runat="server" ID="_movieTitleDropDown" DataSourceID="SqlDataSource9"
                                DataTextField="title" DataValueField="movie_id" SelectedValue='<%# Bind("movie_id") %>' />
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Summary:
                        </td>
                        <td>
                            <asp:TextBox ID="summaryTextBox" runat="server" Text='<%# Bind("summary") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Rating:
                        </td>
                        <td>
                            <asp:TextBox ID="ratingTextBox" runat="server" Text='<%# Bind("rating") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Review:
                        </td>
                        <td>
                            <asp:TextBox ID="reviewTextBox" runat="server" TextMode="multiLine" Rows="5" Text='<%# Bind("review") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                                Text="Insert" />
                        </td>
                    </tr>
                </table>
            </InsertItemTemplate>
        </asp:FormView>
        <asp:SqlDataSource ID="SqlDataSource8" runat="server" ConnectionString="<%$ ConnectionStrings:conString %>"
            InsertCommand="INSERT INTO reviews(movie_id, summary, rating,
review, reviewer) VALUES (@movie_id, @summary, @rating, @review,
@reviewer)" OnInserting="SqlDataSource8_Inserting">
            <InsertParameters>
                <asp:Parameter Name="movie_id" />
                <asp:Parameter Name="summary" />
                <asp:Parameter Name="rating" />
                <asp:Parameter Name="review" />
                <asp:Parameter Name="reviewer" />
            </InsertParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource9" runat="server" ConnectionString="<%$ ConnectionStrings:conString %>"
            SelectCommand="SELECT [movie_id], [title] FROM [movies] ORDER BY title" />
    </div>
    <br />
    <div class="pageSubHeader acl Information">
        8. Binding Hierarchical Data Sources to the TreeView Control
    </div>
    <div class="subHdrPara">
        What makes <strong>XmlDataSource</strong> even more compelling is the fact that
        two new data-binding expressions have been added that can be used when binding to
        a hierarchical data source: <em>XPath</em> and <em>XPathSelect</em>. The XPath data-binding
        evaluation syntax gives you the ability to declaratively add XPath expressions to
        be evaluated from the current XmlNode that is being enumerated in a control template,
        as it is bound to a hierarchical data source. The XPathSelect expression can be
        used to perform subselections, which can be useful to perform nested bindings.<br />
        <%-- 
        <asp:XmlDataSource ID="rssDataSource" runat="server" DataFile="http://blog.pluralsight.com/"
            XPath="/rss/channel/item" />
        <asp:DataList ID="rssDataList" runat="server" DataSourceID="rssDataSource" CssClass="dlist"
            Caption="XmlDataSource + XPath">
            <ItemTemplate>
                <b>
                    <%# XPath("pubDate")%>
                    -
                    <%# XPath("title") %></b>
                <br />
                <%# XPath("description") %>
            </ItemTemplate>
        </asp:DataList>--%><br />
        <em>TreeView and XmlDataSource</em>
        <asp:TreeView ID="_bookTreeView" runat="server" DataSourceID="_bookstoreDataSource"
            ShowLines="True" CssClass="treeView">
            <NodeStyle CssClass="node" />
            <HoverNodeStyle CssClass="nodeHover" />
            <LeafNodeStyle CssClass="leafNode" />
            <DataBindings>
                <asp:TreeNodeBinding DataMember="book" ImageUrl="~/Images/treeview/book.png" TextField="Title" />
                <asp:TreeNodeBinding DataMember="chapter" ImageUrl="~/Images/treeview/txt.png" TextField="name" />
                <asp:TreeNodeBinding DataMember="genre" ImageUrl="~/Images/treeview/folder.gif" Text="."
                    TextField="name" />
            </DataBindings>
        </asp:TreeView>
        <asp:XmlDataSource ID="_bookstoreDataSource" runat="server" DataFile="~/App_Data/Bookstore.xml" />
        <br />
        <em>DataList + XPathSelect + XPath + XmlDataSource</em>
        <asp:DataList ID="_bookDataList" runat="server" DataSourceID="_bookDataSource" CssClass="dlist"
            RepeatColumns="2" RepeatDirection="Vertical">
            <ItemTemplate>
                <span class="title">Title:
                    <%# Eval("Title") %></span><br />
                <asp:DataList runat="server" ID="_nestedDataList" DataSource='<%# XPathSelect("chapter") %>'>
                    <ItemTemplate>
                        Chapter:
                        <%# XPath("@num") %>&nbsp;-&nbsp;
                        <%# XPath("@name") %><br />
                        <%# XPath(".") %>
                    </ItemTemplate>
                </asp:DataList>
            </ItemTemplate>
        </asp:DataList>
        <asp:XmlDataSource ID="_bookDataSource" runat="server" XPath="/Bookstore/genre/book"
            DataFile="~/App_Data/Bookstore.xml" />
    </div>
    <br />
    <div class="pageSubHeader acl Information">
        9. ObjectDataSource : Binding to objects
    </div>
    <div class="subHdrPara">
        <strong>ObjectDataSource's</strong> sole purpose is to act as a bridge between data-bound
        controls and a set of classes providing data. Instead of a connection string, the
        ObjectDataSource control is initialized with a type name as the primary object to
        create, as well as method names for performing select, insert, update, and delete
        operations. At runtime, the ObjectDataSource will create an instance of the type
        (if the methods are nonstatic), and using reflection, will invoke the select, update,
        insert, and/or delete methods as needed in response to control interaction. It is
        possible to enable sorting, paging, and filtering on an object data source as well,
        by writing methods with parameters for specifying sort expressions, filter expressions,
        and methods for performing paging.
        <asp:BulletedList ID="_simpleBulletedList" runat="server" DataSourceID="_simpleObjectDataSource" />
        <asp:ObjectDataSource ID="_simpleObjectDataSource" runat="server" SelectMethod="GetItems"
            TypeName="ObjectDataSourceClass" />
        <asp:GridView ID="GridView4" runat="server" AllowPaging="True" AutoGenerateColumns="False"
            DataSourceID="_moviesObjectDataSource" DataKeyNames="MovieId" CssClass="grid"
            Caption="<em>GridView + ObjectDataSource + Select, Insert, Update and Delete Methods</em>">
            <HeaderStyle CssClass="gridheader" />
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="ReleaseDate" DataFormatString="{0:d}" HeaderText="ReleaseDate"
                    HtmlEncode="False" SortExpression="ReleaseDate" />
                <asp:BoundField DataField="MovieId" HeaderText="MovieId" SortExpression="MovieId"
                    Visible="False" />
                <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
            </Columns>
        </asp:GridView>
        <asp:ObjectDataSource ID="_moviesObjectDataSource" runat="server" TypeName="MovieReviewsData"
            DataObjectTypeName="Movie" DeleteMethod="InsertMovie" InsertMethod="InsertMovie"
            SelectMethod="GetMovies" UpdateMethod="UpdateMovie" />
    </div>
    <asp:GridView ID="products" runat="server">
        <Columns>
            <asp:TemplateField>
                <ItemTemplate>
                    <div style="border: 1px solid black">
                        <div class="leftCol">
                            <asp:Image ID="prodImage" runat="server" />
                        </div>
                        <div class="rightCol">
                            <asp:Label ID="lblProdName" runat="server" />
                            <asp:Label ID="lblDetails" runat="server" />
                            <asp:Button ID="btnBuy" runat="server" Text="buy"/>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
</asp:Content>
