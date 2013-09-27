<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<VersionR.Models.Role>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Roles
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="PageTitle" runat="server">
	Rollen-Verwaltung
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="PageSubtitle" runat="server">
	Fügen Sie neue Rollen hinzu oder bearbeiten Sie bestehende.
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table class="table table-bordered">
    <thead>
        <tr>
            <th>
                RId
            </th>
            <th>
                Name
            </th>
            <th></th>
        </tr>
    </thead>
    <tbody>
    <% foreach (var item in Model) { %>
    
        <tr>

            <td>
                <%: item.RId %>
            </td>
            <td>
                <%: item.Name %>
            </td>
            <td>
                <%: Html.ActionLink("Edit", "EditRole", new { id=item.RId }) %> |
                <%: Html.ActionLink("Details", "DetailsRole", new { id=item.RId })%> |
                <%: Html.ActionLink("Delete", "DeleteRole", new { id=item.RId })%>
            </td>
        </tr>
    
    <% } %>
    </tbody>
    </table>

    <p>
        <%: Html.ActionLink("Create New", "CreateRole") %>
    </p>

</asp:Content>

<asp:Content ID="SidebarContent" ContentPlaceHolderID="SidebarContent" runat="server">
          <% Html.RenderPartial("AdminSidebar"); %>
</asp:Content>