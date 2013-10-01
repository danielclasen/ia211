<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<VersionR.Models.Role>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    DetailsRole
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
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>
                    <%: Model.RId %>
                </td>
                <td>
                    <%: Model.Name %>
                </td>
            </tr>
        </tbody>
    </table>
    <h3>
        Benutzer mit der Rolle "<%: Model.Name %>"</h3>
    <% Html.RenderPartial("RoleAffectedUsers"); %>
    <div class="btn-group">
        <%: Html.ActionLink("Zurück zur Übersicht", "Roles", "Admin", new { }, new { @class = "btn" })%>
        <%: Html.ActionLink("Rolle " + Model.Name + " Bearbeiten", "EditRole", "Admin", new { id=Model.RId }, new { @class = "btn btn-primary" })%>
        <%: Html.ActionLink("Rolle " + Model.Name + " Löschen", "DeleteRole", "Admin", new { id = Model.RId }, new { @class = "btn btn-danger" })%>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PageTitle" runat="server">
    Rechteverwaltung
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="PageSubTitle" runat="server">
    Rolle "<%: Model.Name %>"
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="SidebarContent" runat="server">
    <% Html.RenderPartial("AdminSidebar"); %>
</asp:Content>