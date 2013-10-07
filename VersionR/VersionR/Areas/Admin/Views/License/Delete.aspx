<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<VersionR.Models.Customer_Modules>" %>

<%@ Import Namespace="System.Globalization" %>
<%@ Import Namespace="VersionR.Helpers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Delete
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="alert alert-error">
        <b>Achtung!</b> Sind sie sicher, dass Sie die Lizenz des Benutzers "<%: Model.User.NickName %>"
        für das Modul "<%: Model.Module.Name %>" löschen möchten?
    </div>
    <table class="table table-bordered">
        <thead>
            <tr>
                <th>
                    Lizenz-ID
                </th>
                <th>
                    Benutzer
                </th>
                <th>
                    Modul
                </th>
                <th>
                    Lizenz Start-Datum
                </th>
                <th>
                    Gültig bis
                </th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>
                    <%: Model.OrderId %>
                </td>
                <td>
                    <%: Model.User.NickName %>
                </td>
                <td>
                    <%: Model.Module.Name %>
                </td>
                <td>
                    <%: Model.BuyDate.ToString("d", CultureInfo.CreateSpecificCulture("de-DE"))%>
                </td>
                <td>
                    <%: Model.ExpiryDate.ToString("d", CultureInfo.CreateSpecificCulture("de-DE"))%>
                </td>
            </tr>
        </tbody>
    </table>
    <% Html.BeginForm("Delete", "License", FormMethod.Post, new { @class = "form-horizontal" });%>
    <div class="btn-group">
        <%: Html.ActionLink("Abbrechen", "Details", "User", new { id = Model.CmId }, new { @class = "btn" })%>
        <button type="submit" class="btn btn-danger" value="Delete">
            Lizenz löschen</button>
    </div>
    <% Html.EndForm(); %>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PageTitle" runat="server">
    Lizenzverwaltung
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="PageSubTitle" runat="server">
    Lizenz für "<%: Model.Module.Name %>" von Benutzer "<%: Model.User.NickName %>"
    löschen.
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="SidebarContent" runat="server">
    <% Html.RenderPartial("AdminSidebar"); %>
</asp:Content>