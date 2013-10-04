<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<VersionR.Models.User>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Index
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="PageTitle" runat="server">
	Benutzerverwaltung
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

        <h2>Kunden</h2>
    <table>
        <tr>
            <th>Kunden Nr.</th>
            <th>Nickname</th>
            <th>E-Mail</th>
            <th>Telefon</th>
            <th>Password-Hash</th>
            <th>Rolle</th>
        </tr>
        <% foreach (var item in Model)
           { %>
        <tr>
            <td><%: item.UId %></td>
            <td><%: item.NickName %></td>
            <td><%: item.EMail %></td>
            <td><%: item.Phone %></td>
            <td><%: item.PwHash %></td>
            <td><%: item.Role.Name %></td>
        </tr>
        <% } %>
    </table>
    <p>
        <%: Html.ActionLink("Create New", "Create") %>
    </p>

</asp:Content>
