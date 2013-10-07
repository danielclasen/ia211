<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<VersionR.Areas.Admin.ViewModels.AddUserLicenseViewModel>" %>

<%@ Import Namespace="VersionR.Helpers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Add
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <% Html.BeginForm("Add", ViewContext.RouteData.Values["Controller"].ToString() /*Controller*/, FormMethod.Post, new { @class = "form-horizontal" });%>
    <%: Html.ValidationSummary(true) %>
    <div class="control-group">
        <%: Html.BootstrapLabelFor(model => model.Modules, "Modul")%>
        <div class="controls">
            <%: Html.DropDownListFor(model => model.ModId, Model.Modules, new {required = "required" })%>
            <%: Html.ValidationMessageFor(model => model.ModId)%>
        </div>
    </div>
    <div class="control-group">
        <%: Html.BootstrapLabelFor(model => model.BuyDate, "Lizenz Start-Datum")%>
        <div class="controls">
            <%: Html.TextBoxFor(model => model.BuyDate, new { type = "text", required = "required", @class = "datepicker" })%>
            <%: Html.ValidationMessageFor(model => model.BuyDate)%>
        </div>
    </div>
    <div class="control-group">
        <%: Html.BootstrapLabelFor(model => model.LicenseYears, "Gültigkeit in Jahren")%>
        <div class="controls">
            <%: Html.TextBoxFor(model => model.LicenseYears, new { type = "number", required = "required", min = 1 })%>
            <%: Html.ValidationMessageFor(model => model.LicenseYears)%>
        </div>
    </div>
    <div class="control-group">
        <div class="controls">
            <div class="btn-group">
                <button class="btn" type="reset" value="">
                    Zurücksetzen</button>
                <button type="submit" class="btn btn-primary" value="">
                    Lizenz hinzufügen</button>
            </div>
        </div>
    </div>
    <% Html.EndForm();%>
    <div>
        <%: Html.ActionLink("Zurück zur Übersicht", "Details", "User", new { id = Model.User.UId }, new { @class = "btn" })%>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PageTitle" runat="server">
    Lizenzverwaltung
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="PageSubTitle" runat="server">
    Neue Lizenz zum Benutzer "<%: Model.User.NickName %>" hinzufügen.
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="SidebarContent" runat="server">
    <% Html.RenderPartial("AdminSidebar"); %>
</asp:Content>