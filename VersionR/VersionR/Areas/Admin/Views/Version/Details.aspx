<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<VersionR.Areas.Admin.ViewModels.VersionViewModel>" %>

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
                    ID
                </th>
                <th>
                    Major Release-Nr.
                </th>
                <th>
                    Minor Release-Nr.
                </th>
                <th>
                    Build
                </th>
                <th>
                    Plattform
                </th>
                <th>
                    Datum der Veröffentlichung
                </th>
                <th>
                    Erstellt von
                </th>
                <th>
                    Modul
                </th>
                <th>
                </th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>
                    <%: Model.Version.VrId %>
                </td>
                <td>
                    <%: Model.Version.Release%>
                </td>
                <td>
                    <%: Model.Version.SubRelease%>
                </td>
                <td>
                    <%: Model.Version.BuildId%>
                </td>
                <td>
                    <%: Model.Version.Platform%>
                </td>
                <td>
                    <% if (Model.Version.ReleaseDate.Date > DateTime.Now.Date)
                       { %>
                    <span class="label label-important" title="Ausstehend"><i class="icon-coffee"></i>
                    </span><span class="text-error">
                        <%: Model.ReleaseDate %></span>
                    <% }
                       else
                       { %>
                    <span class="label label-success" title="Veröffentlicht"><i class="icon-ok"></i>
                    </span><span class="text-success">
                        <%: Model.ReleaseDate %></span>
                    <% } %>
                </td>
                <td>
                    <%: Html.ActionLink(Model.Version.User.NickName, "Details", "User", new { id = Model.Version.User.UId }, new{})%>
                </td>
                <td>
                    <%: Html.ActionLink(Model.Version.Module.Name, "Details", "Module", new { id = Model.Version.Module.ModId }, new{})%>
                </td>
                <td class="span2">
                    <a href="<%= Url.Action("Download", "Version", new {id = Model.Version.VrId}) %>"
                        class="btn btn-success" title="Download"><i class="icon-download-alt"></i>&nbsp;Download</a>
                </td>
            </tr>
        </tbody>
    </table>
    <div class="row-fluid">
        <div class="span6 well well-small">
            <h3>
                Beschreibung / Changelog
            </h3>
            <%: Model.Version.Description %>
        </div>
        <div class="span6 well well-small">
            <h3>
                Downloads-Historie
            </h3>
            <% Html.RenderPartial("Version_DownloadList", Model.Version.Downloads.OrderByDescending(d => d.DlDate)); %>
        </div>
    </div>
    <div class="btn-group">
        <%: Html.ActionLink("Zurück zum Modul", "Details", "Module", new { id=Model.Version.Module.ModId }, new { @class = "btn" })%>
        <%: Html.ActionLink("Löschen", "Delete", new { id = Model.Version.VrId }, new { @class = "btn btn-danger" })%>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PageTitle" runat="server">
    Versionsverwaltung
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="PageSubTitle" runat="server">
    Version "<%: Model.Version.Release%>.<%: Model.Version.SubRelease%>.<%: Model.Version.BuildId%>"
    von Modul "<%: Model.Version.Module.Name %>".
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="SidebarContent" runat="server">
    <% Html.RenderPartial("AdminSidebar"); %>
</asp:Content>