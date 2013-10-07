<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<VersionR.Areas.Admin.ViewModels.EditUserLicenseViewModel>" %>

<%@ Import Namespace="VersionR.Helpers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Edit
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <% Html.BeginForm("Edit", "License", FormMethod.Post, new { @class = "form-horizontal" });%>
    <%: Html.ValidationSummary(true) %>
    <div class="control-group">
        <%: Html.BootstrapLabelFor(model => model.BuyDate, "BuyDate")%>
        <div class="controls">
            <%: Html.TextBoxFor(model => model.BuyDate, new { type = "text", required = "required", @class = "datepicker" })%>
            <%: Html.ValidationMessageFor(model => model.BuyDate)%>
        </div>
    </div>
    <div class="control-group">
        <%: Html.BootstrapLabelFor(model => model.LicenseYears, "LicenseYears")%>
        <div class="controls">
            <%: Html.TextBoxFor(model => model.LicenseYears, new { type = "number", required = "required", min = 1 })%>
            <%: Html.ValidationMessageFor(model => model.LicenseYears)%>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">
            Aktion</label>
        <div class="controls">
            <div class="btn-group">
                <button class="btn" type="reset" value="Reset">
                    Zurücksetzen</button>
                <button type="submit" class="btn btn-primary" value="Edit">
                    Lizenz Speichern</button>
            </div>
            <%: Html.ActionLink("Lizenz Löschen", "Delete", new { id = Model.OrderId }, new { @class = "btn btn-danger" })%>
        </div>
    </div>
    <% Html.EndForm();%>
    <div>
        <%: Html.ActionLink("Zurück zum Benutzer", "Details", "User", new { id = Model.User.UId }, new { @class = "btn" })%>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PageTitle" runat="server">
    Lizenzverwaltung
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="PageSubTitle" runat="server">
    Lizenz für "<%: Model.Module.Name %>" von Benutzer "<%: Model.User.NickName %>"
    bearbeiten.
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="SidebarContent" runat="server">
    <% Html.RenderPartial("AdminSidebar"); %>
</asp:Content>