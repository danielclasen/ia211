﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<VersionR.Models.Module>>" %>

<%@ Import Namespace="System.Globalization" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Modules
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table class="table table-bordered">
        <thead>
            <tr>
                <th>
                    ID
                </th>
                <th>
                    Modulname
                </th>
                <th>
                    Jährliche Lizenz-Gebühren
                </th>
                <th>
                    Aktuelle Version
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
                    <%: item.ModId %>
                </td>
                <td>
                    <%: Html.ActionLink(item.Name, "Details", new { id = item.ModId })%>
                </td>
                <td>
                    <%: item.PricePerYear.ToString("c", CultureInfo.CreateSpecificCulture("de-DE"))%>
                </td>
                <td>
                    <% var orderedVersions = item.Versions.OrderByDescending(v => v.Release + v.SubRelease + v.BuildId);
                       if (orderedVersions.Any())
                       {
                           var lastVersion = orderedVersions.First();
                    %>
                    <% if (lastVersion.ReleaseDate.Date > DateTime.Now.Date)
                       { %>
                    <span class="label label-important" title="Ausstehend"><i class="icon-coffee"></i>
                    </span>
                    <% }
                       else
                       { %>
                    <span class="label label-success" title="Veröffentlicht"><i class="icon-ok"></i>
                    </span>
                    <% } %>
                    <a href="<%= Url.Action("Details", "Version", new {id = lastVersion.VrId}) %>" title="Details anzeigen">
                        <%: lastVersion.Release %>.<%: lastVersion.SubRelease %>.<%: lastVersion.BuildId %>
                    </a>
                    <div class="btn-group pull-right">
                        <a href="<%= Url.Action("Download", "Version", new {id = lastVersion.VrId}) %>" class="btn"
                            title="Download"><i class="icon-download-alt"></i></a><a href="<%= Url.Action("Details", "Version", new {id = lastVersion.VrId}) %>"
                                class="btn" title="Details anzeigen"><i class="icon-folder-open"></i></a>
                        <a href="<%= Url.Action("Add", "Version", new {id = item.ModId}) %>" class="btn btn-success"
                            title="Neue Version erstellen"><i class="icon-plus"></i></a>
                    </div>
                    <% }
                       else
                       {%>
                    <small class="text-error">Noch keine Version.</small> <a href="<%= Url.Action("Add", "Version", new {id = item.ModId}) %>"
                        class="btn btn-success pull-right" title="Neue Version erstellen"><i class="icon-plus">
                        </i></a>
                    <%} %>
                </td>
                <td class="span3">
                    <div class="btn-group">
                        <%: Html.ActionLink("Details", "Details", new { id=item.ModId }, new { @class = "btn" })%>
                        <%: Html.ActionLink("Bearbeiten", "Edit", new { id=item.ModId }, new { @class = "btn" }) %>
                        <%: Html.ActionLink("Löschen", "Delete", new { id=item.ModId }, new { @class = "btn btn-danger" })%>
                    </div>
                </td>
            </tr>
            <% } %>
        </tbody>
    </table>
    <%: Html.ActionLink("Neues Modul anlegen", "Create", ViewContext.RouteData.Values["Controller"].ToString() /*Controller*/, new { }, new { @class = "btn btn-primary" }) %>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PageTitle" runat="server">
    Modulverwaltung
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="PageSubTitle" runat="server">
    Fügen Sie neue Module hinzu oder bearbeiten Sie bestehende.
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="SidebarContent" runat="server">
    <% Html.RenderPartial("AdminSidebar"); %>
</asp:Content>