<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<VersionR.Models.Module>" %>

<%@ Import Namespace="System.Globalization" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    DetailsModule
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
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>
                    <%: Model.ModId %>
                </td>
                <td>
                    <%: Model.Name %>
                </td>
                <td>
                    <%: String.Format(CultureInfo.CreateSpecificCulture("de-DE"), "{0:c}", Model.PricePerYear)%>
                </td>
                <td>
                    to be added...
                </td>
            </tr>
        </tbody>
    </table>
    <div class="row-fluid">
        <div class="span6 well well-small">
            <h3>
                Modul-Versionen <a href="<%= Url.Action("Add", "Version", new {id = Model.ModId}) %>"
                    class="btn btn-success pull-right"><i class="icon-plus" title="Hinzufügen"></i>
                </a>
            </h3>
            <% Html.RenderPartial("Module_VersionsList", Model.Versions.OrderByDescending(v => v.Release + v.SubRelease + v.BuildId)); %>
        </div>
        <div class="span6 well well-small">
            <h3>
                Downloads nach Version</h3>
            <% Html.RenderPartial("Modul_Download_VersionDonut", Model.Versions); %>
        </div>
    </div>
    <div class="btn-group">
        <%: Html.ActionLink("Zurück zur Übersicht", "List", new { }, new { @class = "btn" })%>
        <%: Html.ActionLink("Modul bearbeiten", "Edit", new { id = Model.ModId }, new { @class = "btn btn-primary" })%>
        <%: Html.ActionLink("Modul löschen", "Delete", new { id = Model.ModId }, new { @class = "btn btn-danger" })%>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PageTitle" runat="server">
    Modulverwaltung
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="PageSubTitle" runat="server">
    Modul "<%: Model.Name %>".
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="SidebarContent" runat="server">
    <% Html.RenderPartial("AdminSidebar"); %>
</asp:Content>