<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<VersionR.Models.Module>" %>

<%@ Import Namespace="VersionR.Helpers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    CreateModule
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <% Html.BeginForm("Create", "Module", FormMethod.Post, new { @class = "form-horizontal" });%>
    <%: Html.ValidationSummary(true) %>
    <div class="control-group">
        <%: Html.BootstrapLabelFor(model => model.Name, "Modulname")%>
        <div class="controls">
            <%: Html.TextBoxFor(model => model.Name, new { required = "required" })%>
            <%: Html.ValidationMessageFor(model => model.Name)%>
        </div>
    </div>
    <div class="control-group">
        <%: Html.BootstrapLabelFor(model => model.PricePerYear, "Jährliche Lizenz-Gebühr")%>
        <div class="controls">
            <%: Html.TextBoxFor(model => model.PricePerYear, new { required = "required", @class = "input-currency", pattern = "€ [1-9][.0-9]*" })%>
            <%: Html.ValidationMessageFor(model => model.PricePerYear)%>
        </div>
    </div>
    <div class="control-group">
        <div class="controls">
            <div class="btn-group">
                <button class="btn" type="reset" value="">
                    Zurücksetzen</button>
                <button type="submit" class="btn btn-primary" value="">
                    Modul anlegen</button>
            </div>
        </div>
    </div>
    <% Html.EndForm();%>
    <div>
        <%: Html.ActionLink("Zurück zur Übersicht", "List", "Module", new { }, new { @class = "btn" })%>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PageTitle" runat="server">
    Modulverwaltung
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="PageSubTitle" runat="server">
    Neues Modul anlegen.
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="SidebarContent" runat="server">
    <% Html.RenderPartial("AdminSidebar"); %>
</asp:Content>