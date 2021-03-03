<%@ Control Language="C#" AutoEventWireup="true" CodeFile="SideMenu.ascx.cs" Inherits="UserControls_UC_side_SideMenu " %>
<div>
    <table border="0" cellpadding="0" cellspacing="0" width="100%">
        <tbody>
            <tr>
                <td class="Left">
                </td>
                <td class="Middle">
                    <center>
                        Chapters link chronically</center>
                </td>
                <td class="Right">
                </td>
            </tr>
        </tbody>
    </table>
    <table border="0" cellpadding="0" cellspacing="0" class="telerikMenu sideMenu_Sunset sideMenuBg"
        width="100%">
        <tr>
            <td>
                <div style="height: 410px;">
                    <ul class="rmRootGroup rmVertical">
                        <li class="rmItem rmFirst"><a id="Dashboard" href='<%= ResolveClientUrl("~/Default.aspx") %>'
                            title="Important Points" class="rmLink"><span class="rmText ">
                                <img src='<%= ResolveClientUrl("~/Styles/Images/dashboard.png") %>' class="admImg" />Dashboard</span></a></li>
                        <li class="rmItem rmFirst"><a id="Chapter1" href='<%= ResolveClientUrl("~/Pages/Chapter1.aspx") %>'
                            title="Chapter 1" class="rmLink"><span class="rmText ">
                                <img src='<%= ResolveClientUrl("~/Styles/Images/architecture.png") %>' class="admImg" />Architecture</span></a></li>
                        <li class="rmItem rmFirst"><a id="Chapter2" href='<%= ResolveClientUrl("~/Pages/Chapter2.aspx") %>'
                            title="Chapter 2" class="rmLink"><span class="rmText ">
                                <img src='<%= ResolveClientUrl("~/Styles/Images/uie.png") %>' class="admImg" />UI
                                Elements</span></a></li>
                        <li class="rmItem rmFirst"><a id="Chapter3" href='<%= ResolveClientUrl("~/Pages/Chapter3.aspx") %>'
                            title="Chapter 3" class="rmLink"><span class="rmText ">
                                <img src='<%= ResolveClientUrl("~/Styles/Images/databases.png") %>' class="admImg" />Data
                                Binding</span></a></li>
                        <li class="rmItem rmFirst"><a id="Chapter4" href='<%= ResolveClientUrl("~/Pages/Chapter4.aspx") %>'
                            title="Chapter 4" class="rmLink"><span class="rmText ">
                                <img src='<%= ResolveClientUrl("~/Styles/Images/statem.png") %>' class="admImg" />State
                                Management</span></a></li>
                        <li class="rmItem rmFirst"><a id="Chapter5" href='<%= ResolveClientUrl("~/Pages/Chapter5.aspx") %>'
                            title="Chapter 5" class="rmLink"><span class="rmText ">
                                <img src='<%= ResolveClientUrl("~/Styles/Images/security.png") %>' class="admImg" />Security</span></a></li>
                        <li class="rmItem rmFirst"><a id="Chapter6" href='<%= ResolveClientUrl("~/Pages/Chapter6.aspx") %>'
                            title="Chapter 6" class="rmLink"><span class="rmText ">
                                <img src='<%= ResolveClientUrl("~/Styles/Images/webp.png") %>' class="admImg" />Web
                                Parts </span></a></li>
                        <li class="rmItem rmFirst"><a id="Chapter7" href='<%= ResolveClientUrl("~/Pages/Chapter7.aspx") %>'
                            title="Chapter 7" class="rmLink"><span class="rmText ">
                                <img src='<%= ResolveClientUrl("~/Styles/Images/diagno.png") %>' class="admImg" />Diagnostics
                            </span></a></li>
                        <li class="rmItem rmFirst"><a id="Chapter8" href='<%= ResolveClientUrl("~/Pages/Chapter8.aspx") %>'
                            title="Chapter 8" class="rmLink"><span class="rmText ">
                                <img src='<%= ResolveClientUrl("~/Styles/Images/perf.png") %>' class="admImg" />
                                Performance</span></a></li>
                        <li class="rmItem rmFirst"><a id="Chapter9" href='<%= ResolveClientUrl("~/Pages/Chapter9.aspx") %>'
                            title="Chapter 9" class="rmLink"><span class="rmText ">
                                <img src='<%= ResolveClientUrl("~/Styles/Images/asyn.png") %>' class="admImg" />Asynchrony
                            </span></a></li>
                    </ul>
                </div>
            </td>
        </tr>
    </table>
</div>
