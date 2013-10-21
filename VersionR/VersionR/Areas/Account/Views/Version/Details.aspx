<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<VersionR.Models.Version>" %>

<%@ Import Namespace="System.Globalization" %>
<%@ Import Namespace="VersionR.Helpers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Details
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table class="table table-bordered">
        <thead>
            <tr>
                <th>
                    Version
                </th>
                <th>
                    Modul
                </th>
                <th>
                    Plattform
                </th>
                <th>
                    Erschienen am
                </th>
                <th>
                </th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>
                    <%: Model.Release %>.<%: Model.SubRelease %>.<%: Model.BuildId %>
                </td>
                <td>
                    <%: Model.Module.Name %>
                </td>
                <td>
                    <%: Model.Platform %>
                </td>
                <td>
                    <%: Model.ReleaseDate.ToString("d", CultureInfo.CreateSpecificCulture("de-DE"))%>
                </td>
                <td class="span3">
                    <a href="<%= Url.Action("Download", "Version", new {id = Model.VrId}) %>" class="btn btn-success"
                        title="Download"><i class="icon-download-alt"></i>&nbsp;Download</a>
                </td>
            </tr>
        </tbody>
    </table>
    <h3>
        Beschreibung/ Changelog</h3>
    <p>
        <%: Model.Description %></p>
    <%: Html.ActionLink("Zurück zum Modul", "Index", new { }, new { @class = "btn" })%>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PageTitle" runat="server">
    Kundenbereich
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="PageSubTitle" runat="server">
    Version
    <%: Model.Module.Name %><%: Model.Release %>.<%: Model.SubRelease %>.<%: Model.BuildId %>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="SidebarContent" runat="server">
    <% Html.RenderPartial("AccountSidebar"); %>
</asp:Content>