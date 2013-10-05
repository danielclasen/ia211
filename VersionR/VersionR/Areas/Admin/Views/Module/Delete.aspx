<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<VersionR.Models.Module>" %>

<%@ Import Namespace="VersionR.Helpers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    DeleteModule
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
    <h3>
        Abhängigkeiten</h3>
    <div class="alert alert-error">
        <b>Achtung!</b> -- Hier Abhängigkeiten einfügen</div>
    to be added...
    <% Html.BeginForm("Delete", "Module", FormMethod.Post, new { @class = "form-horizontal" });%>
    <div class="btn-group">
        <%: Html.ActionLink("Abbrechen", "List", "Module", new { }, new { @class = "btn" })%>
        <button type="submit" class="btn btn-danger" value="Delete">
            Modul "<%: Model.Name %>" löschen</button>
    </div>
    <% Html.EndForm(); %>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PageTitle" runat="server">
    Modulverwaltung
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="PageSubTitle" runat="server">
    Sind Sie sicher, dass Sie das Modul "<%: Model.Name %>" mit all seinen Abhängigkeiten
    löschen möchten?
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="SidebarContent" runat="server">
    <% Html.RenderPartial("AdminSidebar"); %>
</asp:Content>