<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<VersionR.Models.User>" %>

<%@ Import Namespace="System.Globalization" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    DetailsUser
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table class="table table-bordered">
        <thead>
            <tr>
                <th>
                    ID
                </th>
                <th>
                    Benutzername
                </th>
                <th>
                    E-Mail
                </th>
                <th>
                    Telefon
                </th>
                <th>
                    Rolle
                </th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>
                    <%: Model.UId %>
                </td>
                <td>
                    <%: Model.NickName %>
                </td>
                <td>
                    <%: Model.EMail %>
                </td>
                <td>
                    <%: Model.Phone %>
                </td>
                <td>
                    <%: Model.Role.Name %>
                </td>
            </tr>
        </tbody>
    </table>
    <div class="row-fluid">
        <div class="span6 well well-small">
            <h3>
                Modul-Lizenzen <a href="<%= Url.Action("Add", "License", new {id = Model.UId}) %>"
                    class="btn btn-success pull-right"><i class="icon-plus" title="Hinzufügen"></i>
                </a>
            </h3>
            <% Html.RenderPartial("Customer_ModulesList", Model.Customer_Modules.OrderBy(cm => cm.Module.Name)); %>
        </div>
        <div class="span6 well well-small">
            <h3>
                Download-Historie</h3>
            <%
                var DownloadList =
                    Model.Downloads.OrderBy(
                        d => d.Version.Module.Name + d.Version.Release + d.Version.SubRelease + d.Version.BuildId); %>
            <% Html.RenderPartial("User_DownloadsList", DownloadList); %>
        </div>
    </div>
    <p>
        //TODO
    </p>
    <div class="btn-group">
        <%: Html.ActionLink("Zurück zur Übersicht", "List", "User", new { }, new { @class = "btn" })%>
        <%: Html.ActionLink("Benutzer bearbeiten", "Edit", "User", new { id=Model.UId }, new { @class = "btn btn-primary" })%>
        <%: Html.ActionLink("Benutzer löschen", "Delete", "User", new { id = Model.UId }, new { @class = "btn btn-danger" })%>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PageTitle" runat="server">
    Benutzerkonten-Verwaltung
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="PageSubTitle" runat="server">
    Benutzer "<%: Model.NickName %>".
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="SidebarContent" runat="server">
    <% Html.RenderPartial("AdminSidebar"); %>
</asp:Content>