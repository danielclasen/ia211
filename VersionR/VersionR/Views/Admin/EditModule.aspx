<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<VersionR.Models.Module>" %>

<%@ Import Namespace="VersionR.Helpers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    EditModule
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <% Html.BeginForm("EditModule", "Admin", FormMethod.Post, new { @class = "form-horizontal" });%>
    <%: Html.ValidationSummary(true) %>
    <div class="control-group">
        <%: Html.BootstrapLabelFor(model => model.Name, "Modulname")%>
        <div class="controls">
            <%: Html.TextBoxFor(model => model.Name, new { required = "required" })%>
            <%: Html.ValidationMessageFor(model => model.Name)%>
        </div>
    </div>
    <div class="control-group">
        <%: Html.BootstrapLabelFor(model => model.PricePerYear, "Jährliche Lizenz-Gebühren")%>
        <div class="controls">
            <%: Html.TextBoxFor(model => model.PricePerYear, new { required = "required", @class = "input-currency", pattern = "€ [1-9][.0-9]*" })%>
            <%: Html.ValidationMessageFor(model => model.PricePerYear)%>
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
                    Speichern</button>
            </div>
            <%: Html.ActionLink("Modul " + Model.Name + " Löschen", "DeleteModule", new { Model.ModId }, new { @class = "btn btn-danger" })%>
        </div>
    </div>
    <% Html.EndForm();%>
    <div>
        <%: Html.ActionLink("Zurück zur Übersicht", "Modules", "Admin", new { }, new { @class = "btn" })%>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PageTitle" runat="server">
    Modulverwaltung
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="PageSubTitle" runat="server">
    Modul "<%: Model.Name %>" bearbeiten.
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="SidebarContent" runat="server">
    <% Html.RenderPartial("AdminSidebar"); %>
</asp:Content>