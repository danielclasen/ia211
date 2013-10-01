﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<VersionR.Models.User>>" %>
<%@ Import Namespace="VersionR.Helpers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Users
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="PageTitle" runat="server">
Benutzerkonten-Verwaltung
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="PageSubTitle" runat="server">
Fügen Sie neue Benutzer hinzu oder bearbeiten Sie bestehende.
</asp:Content>


<asp:Content ID="Content5" ContentPlaceHolderID="SidebarContent" runat="server">
<% Html.RenderPartial("AdminSidebar"); %>
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <table class="table table-bordered">
    <thead>
        <tr>
            <th>ID</th>
            <th>Nickname</th>
            <th>E-Mail</th>
            <th>Telefon</th>
            <th>Rolle</th>
            <th></th>
        </tr>
    </thead>    
    <tbody>
        <% foreach (var item in Model)
           { %>
        <tr>
            <td><%: item.UId %></td>
            <td><%: item.NickName %></td>
            <td><%: item.EMail %></td>
            <td><%: item.Phone %></td>
            <td><%: item.Role.Name %></td>
            <td class="span3"> 
                <div class="btn-group">
                <%: Html.ActionLink("Bearbeiten", "EditUser", "Admin", new { id = item.UId }, new { @class = "btn" })%>
                <%: Html.ActionLink("Details", "DetailsUser", "Admin", new { id = item.UId }, new { @class = "btn", disabled = "disabled", onclick="return false;" })%>
                <%: Html.ActionLink("Löschen", "DeleteUser", "Admin", new { id = item.UId }, new { @class = "btn btn-danger", disabled = "disabled", onclick = "return false;" })%>
                </div> 
            </td>
        </tr>
        <% } %>
        </tbody>
    </table>
    <p>
        <%: Html.ActionLink("Neuen Benutzer anlegen", "CreateUser", "Admin", new { }, new { @class = "btn" })%> 
    </p>

</asp:Content>


