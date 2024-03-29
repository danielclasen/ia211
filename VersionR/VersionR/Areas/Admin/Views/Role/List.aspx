﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<VersionR.Models.Role>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Roles
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PageTitle" runat="server">
    Rechteverwaltung
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="PageSubtitle" runat="server">
    Fügen Sie neue Rollen hinzu oder bearbeiten Sie bestehende.
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table class="table table-bordered">
        <thead>
            <tr>
                <th>
                    ID
                </th>
                <th>
                    Bezeichnung
                </th>
                <th>
                </th>
            </tr>
        </thead>
        <tbody>
            <% foreach (var item in Model)
               { %>
            <tr>
                <td>
                    <%: item.RId %>
                </td>
                <td>
                    <%: Html.ActionLink(item.Name, "Details", new { id = item.RId })%>
                </td>
                <td class="span3">
                    <div class="btn-group">
                        <%: Html.ActionLink("Details", "Details", "Role", new { id = item.RId }, new { @class = "btn" })%>
                        <%: Html.ActionLink("Bearbeiten", "Edit", "Role", new { id = item.RId }, new { @class = "btn" })%>
                        <%: Html.ActionLink("Löschen", "Delete", "Role", new { id = item.RId }, new { @class = "btn btn-danger" })%>
                    </div>
                </td>
            </tr>
            <% } %>
        </tbody>
    </table>
    <p>
        <%: Html.ActionLink("Neue Rolle anlegen", "Create", "Role", new { }, new { @class = "btn btn-primary" })%>
    </p>
</asp:Content>
<asp:Content ID="SidebarContent" ContentPlaceHolderID="SidebarContent" runat="server">
    <% Html.RenderPartial("AdminSidebar"); %>
</asp:Content>