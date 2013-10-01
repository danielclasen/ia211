<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<VersionR.Models.Role>>" %>

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
                    <%: item.Name %>
                </td>
                <td class="span3">
                    <div class="btn-group">
                        <%: Html.ActionLink("Details", "DetailsRole", "Admin", new { id = item.RId }, new { @class = "btn" })%>
                        <%: Html.ActionLink("Bearbeiten", "EditRole", "Admin", new { id = item.RId }, new { @class = "btn" })%>
                        <%: Html.ActionLink("Löschen", "DeleteRole", "Admin", new { id = item.RId }, new { @class = "btn btn-danger" })%>
                    </div>
                </td>
            </tr>
            <% } %>
        </tbody>
    </table>
    <p>
        <%: Html.ActionLink("Neue Rolle anlegen", "CreateRole", "Admin", new { }, new { @class = "btn" })%>
    </p>
</asp:Content>
<asp:Content ID="SidebarContent" ContentPlaceHolderID="SidebarContent" runat="server">
    <% Html.RenderPartial("AdminSidebar"); %>
</asp:Content>