<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<VersionR.Models.Version>" %>

<%@ Import Namespace="System.Globalization" %>
<%@ Import Namespace="VersionR.Helpers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Delete
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="alert alert-error">
        <b>Achtung!</b> Sind sie sicher, dass Sie die Version "<%: Model.Release %>.<%: Model.SubRelease %>.<%: Model.BuildId %>"
        des Moduls "<%: Model.Module.Name %>" löschen möchten?
    </div>
    <table class="table table-bordered">
        <thead>
            <tr>
                <th>
                    ID
                </th>
                <th>
                    Version
                </th>
                <th>
                    Plattform
                </th>
                <th>
                    Beschreibung
                </th>
                <th>
                    Release Datum
                </th>
                <th>
                    Erstellt von
                </th>
                <th>
                    Modul
                </th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>
                    <%: Model.VrId %>
                </td>
                <td>
                    <%: Model.Release %>.<%: Model.SubRelease %>.<%: Model.BuildId %>
                </td>
                <td>
                    <%: Model.Platform %>
                </td>
                <td>
                    <%: Model.Description %>
                </td>
                <td>
                    <%: Model.ReleaseDate.ToString("d", CultureInfo.CreateSpecificCulture("de-DE"))%>
                </td>
                <td>
                    <%: Html.ActionLink(Model.User.NickName, "Details", "User", new { id = Model.User.UId }, new{})%>
                </td>
                <td>
                    <%: Html.ActionLink(Model.Module.Name, "Details", "Module", new { id = Model.Module.ModId }, new{})%>
                </td>
            </tr>
        </tbody>
    </table>
    <% Html.BeginForm("Delete", "Version", FormMethod.Post, new { @class = "form-horizontal" });%>
    <div class="btn-group">
        <%: Html.ActionLink("Abbrechen", "Details", "Version", new { id = Model.VrId }, new { @class = "btn" })%>
        <button type="submit" class="btn btn-danger" value="Delete">
            Version löschen</button>
    </div>
    <% Html.EndForm(); %>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PageTitle" runat="server">
    Versionsverwaltung
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="PageSubTitle" runat="server">
    Version "<%: Model.Release %>.<%: Model.SubRelease %>.<%: Model.BuildId %>" vom
    Modul "<%: Model.Module.Name %>" löschen.
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="SidebarContent" runat="server">
    <% Html.RenderPartial("AdminSidebar"); %>
</asp:Content>