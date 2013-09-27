<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<VersionR.Models.Role>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Roles
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Roles</h2>

    <table>
        <tr>
            <th></th>
            <th>
                RId
            </th>
            <th>
                Name
            </th>
        </tr>

    <% foreach (var item in Model) { %>
    
        <tr>
            <td>
                <%: Html.ActionLink("Edit", "EditRole", new { id=item.RId }) %> |
                <%: Html.ActionLink("Details", "DetailsRole", new { id=item.RId })%> |
                <%: Html.ActionLink("Delete", "DeleteRole", new { id=item.RId })%>
            </td>
            <td>
                <%: item.RId %>
            </td>
            <td>
                <%: item.Name %>
            </td>
        </tr>
    
    <% } %>

    </table>

    <p>
        <%: Html.ActionLink("Create New", "CreateRole") %>
    </p>

</asp:Content>

