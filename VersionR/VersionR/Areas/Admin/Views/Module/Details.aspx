<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<VersionR.Models.Module>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    DetailsModule
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table class="table table-bordered">
        <thead>
            <tr>
                <th>
                    ID
                </th>
                <th>
                    Modulname
                </th>
                <th>
                    Jährliche Lizenz-Gebühren
                </th>
                <th>
                    Aktuelle Version
                </th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>
                    <%: Model.ModId %>
                </td>
                <td>
                    <%: Model.Name %>
                </td>
                <td>
                    <%: String.Format("{0:F}", Model.PricePerYear) %>
                    €
                </td>
                <td>
                    to be added...
                </td>
            </tr>
        </tbody>
    </table>
    <div class="btn-group">
        <%: Html.ActionLink("Zurück zur Übersicht", "List", new { }, new { @class = "btn" })%>
        <%: Html.ActionLink("Modul bearbeiten", "Edit", new { id = Model.ModId }, new { @class = "btn btn-primary" })%>
        <%: Html.ActionLink("Modul löschen", "Delete", new { id = Model.ModId }, new { @class = "btn btn-danger" })%>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PageTitle" runat="server">
    Modulverwaltung
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="PageSubTitle" runat="server">
    Modul "<%: Model.Name %>".
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="SidebarContent" runat="server">
    <% Html.RenderPartial("AdminSidebar"); %>
</asp:Content>