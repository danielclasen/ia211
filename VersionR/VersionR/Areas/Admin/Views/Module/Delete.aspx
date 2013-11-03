<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<VersionR.Models.Module>" %>

<%@ Import Namespace="System.Globalization" %>
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
                    <%: Model.PricePerYear.ToString("c", CultureInfo.CreateSpecificCulture("de-DE")) %>
                </td>
                <td>
                    <% try
                       {%>
                    <%: Html.ActionLink(Model.GetLatestVersion().GetVersionString(), "Details", "Version", new { id = Model.GetLatestVersion().VrId}, new {})%>
                    <%}
                       catch (Exception)
                       {%>
                    Noch keine Version hinzugefügt!
                    <%} %>
                </td>
            </tr>
        </tbody>
    </table>
    <h3>
        Abhängigkeiten</h3>
    <div class="alert alert-error">
        <b>Achtung!</b> Das Modul kann erst gelöscht werden, wenn alle Versionen und verknüpften
        Benutzer-Lizenzen manuell gelöscht wurden! Dies dient als Absicherung, da sonst
        ein rekursives Löschen großer Bereiche der Datenbank angestoßen werden könnte.</div>
    <% Html.BeginForm("Delete", "Module", FormMethod.Post, new { @class = "form-horizontal" });%>
    <div class="btn-group">
        <%: Html.ActionLink("Abbrechen", "List", "Module", new {}, new {@class = "btn"}) %>
        <button type="submit" class="btn btn-danger" value="Delete">
            Modul "<%: Model.Name %>" löschen</button>
    </div>
    <% Html.EndForm();%>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PageTitle" runat="server">
    Modulverwaltung
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="PageSubTitle" runat="server">
    Sind Sie sicher, dass Sie das Modul "<%: Model.Name %>" löschen möchten?
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="SidebarContent" runat="server">
    <% Html.RenderPartial("AdminSidebar"); %>
</asp:Content>