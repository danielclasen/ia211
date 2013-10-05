<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<VersionR.Models.Role>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    DeleteRole
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table class="table table-bordered table-condensed">
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
        Betroffene Benutzer</h3>
    <div class="alert alert-error">
        <b>Achtung!</b> Diese Benutzer werden ebenfalls beim Löschen der Rolle entfernt</div>
    <% Html.RenderPartial("RoleAffectedUsers"); %>
    <% Html.BeginForm("Delete", "Role", FormMethod.Post, new { @class = "form-horizontal" }); %>
    <div class="btn-group">
        <%: Html.ActionLink("Abbrechen", "List", "Role", new { }, new { @class = "btn" })%>
        <button type="submit" class="btn btn-danger" value="Delete">
            Rolle löschen</button>
    </div>
    <% Html.EndForm(); %>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PageTitle" runat="server">
    Rechteverwaltung
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="PageSubTitle" runat="server">
    Sind Sie sicher, dass Sie die Rolle "<%: Model.Name %>" mit all ihren Abhängigkeiten
    löschen möchten?
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="SidebarContent" runat="server">
    <% Html.RenderPartial("AdminSidebar"); %>
</asp:Content>