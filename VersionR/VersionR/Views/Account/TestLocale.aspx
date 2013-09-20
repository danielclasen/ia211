<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<VersionR.ModelsLocale.Kunden>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	TestLocale
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
        </tr>
        <% foreach (var item in Model)
           { %>
        <tr>
            <td><%: item.KNr %></td>
            <td><%: item.NickName %></td>
            <td><%: item.Email %></td>
            <td><%: item.Telefon %></td>
            <td><%: item.PwHash %></td>
        </tr>
        <% } %>
    </table>
    <p>
        <%: Html.ActionLink("Create New", "Create") %>
    </p>

</asp:Content>
