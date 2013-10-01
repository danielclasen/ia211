<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<VersionR.Models.User>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    DeleteUser
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table class="table table-bordered">
        <thead>
            <tr>
                <th>
                    ID
                </th>
                <th>
                    Nickname
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
    <% Html.BeginForm("DeleteUser", "Admin", FormMethod.Post, new { @class = "form-horizontal" }); %>
    <div class="btn-group">
        <%: Html.ActionLink("Abbrechen", "Users", "Admin", new { }, new { @class = "btn" }) %>
        <button type="submit" class="btn btn-danger" value="Delete">
            Benutzer löschen</button>
    </div>
    <% Html.EndForm();%>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PageTitle" runat="server">
    Benutzerkonten-Verwaltung
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="PageSubTitle" runat="server">
    Sind Sie sicher, dass Sie den Benutzer "<%: Model.NickName %>" löschen möchten?
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="SidebarContent" runat="server">
    <% Html.RenderPartial("AdminSidebar"); %>
</asp:Content>