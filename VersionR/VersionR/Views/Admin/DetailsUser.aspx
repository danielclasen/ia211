<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<VersionR.Models.User>" %>

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
    <h3>
        Downloads
    </h3>
    <p>
        //TODO
    </p>
    <div class="btn-group">
        <%: Html.ActionLink("Zurück zur Übersicht", "Users", "Admin", new { }, new { @class = "btn" })%>
        <%: Html.ActionLink("Benutzer " + Model.NickName + " Bearbeiten", "EditUser", "Admin", new { id=Model.UId }, new { @class = "btn btn-primary" })%>
        <%: Html.ActionLink("Benutzer " + Model.NickName + " Löschen", "DeleteUser", "Admin", new { id = Model.UId }, new { @class = "btn btn-danger" })%>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PageTitle" runat="server">
    Benutzerkonten-Verwaltung
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="PageSubTitle" runat="server">
    Benutzer "<%: Model.NickName %>"
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="SidebarContent" runat="server">
    <% Html.RenderPartial("AdminSidebar"); %>
</asp:Content>