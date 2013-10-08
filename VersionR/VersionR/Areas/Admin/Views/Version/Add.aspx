<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<VersionR.Models.Version>" %>

<%@ Import Namespace="VersionR.Helpers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Add
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <% Html.BeginForm("Add", "Version", FormMethod.Post, new { @class = "form-horizontal", enctype = "multipart/form-data" });%>
    <%: Html.ValidationSummary(true) %>
    <div class="control-group">
        <%: Html.BootstrapLabelFor(model => model.Release, "Major Relase-Nr.")%>
        <div class="controls">
            <%: Html.TextBoxFor(model => model.Release, new { required = "required", type = "number", min="0"})%>
            <%: Html.ValidationMessageFor(model => model.Release)%>
        </div>
    </div>
    <div class="control-group">
        <%: Html.BootstrapLabelFor(model => model.SubRelease, "Minor Release-Nr.")%>
        <div class="controls">
            <%: Html.TextBoxFor(model => model.SubRelease, new { required = "required", type = "number", min = "0" })%>
            <%: Html.ValidationMessageFor(model => model.SubRelease)%>
        </div>
    </div>
    <div class="control-group">
        <%: Html.BootstrapLabelFor(model => model.BuildId, "Build")%>
        <div class="controls">
            <%: Html.TextBoxFor(model => model.BuildId, new { required = "required" })%>
            <%: Html.ValidationMessageFor(model => model.BuildId)%>
        </div>
    </div>
    <div class="control-group">
        <%: Html.BootstrapLabelFor(model => model.Platform, "Plattform")%>
        <div class="controls">
            <%: Html.TextBoxFor(model => model.Platform, new { required = "required" })%>
            <%: Html.ValidationMessageFor(model => model.Platform)%>
        </div>
    </div>
    <div class="control-group">
        <%: Html.BootstrapLabelFor(model => model.Description, "Beschreibung oder Changelog")%>
        <div class="controls">
            <%: Html.TextAreaFor(model => model.Description/*, new { required = "required" }*/)%>
            <%: Html.ValidationMessageFor(model => model.Description)%>
        </div>
    </div>
    <div class="control-group">
        <%: Html.BootstrapLabelFor(model => model.ReleaseDate, "Datum der Veröffentlichung")%>
        <div class="controls">
            <%: Html.TextBoxFor(model => model.ReleaseDate, new { required = "required" })%>
            <%: Html.ValidationMessageFor(model => model.ReleaseDate)%>
        </div>
    </div>
    <div class="control-group">
        <%: Html.BootstrapLabelFor(model => model.Filename, "Datei/Paket")%>
        <div class="controls">
            <input type="file" name="files" id="file1" data-trigger="fileupload" required="required"
                title="Durchsuchen" />
            <%: Html.ValidationMessageFor(model => model.Filename)%>
        </div>
    </div>
    <div class="control-group">
        <div class="controls">
            <div class="btn-group">
                <button class="btn" type="reset" value="">
                    Zurücksetzen</button>
                <button type="submit" class="btn btn-primary" value="">
                    Version erstellen</button>
            </div>
        </div>
    </div>
    <% Html.EndForm();%>
    <div>
        <%: Html.ActionLink("Zurück zum Modul", "Details", "Module", new { id = Model.Module.ModId }, new { @class = "btn" })%>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PageTitle" runat="server">
    Versionsverwaltung
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="PageSubTitle" runat="server">
    Neue Version von Modul "<%: Model.Module.Name %>" erstellen.
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="SidebarContent" runat="server">
    <% Html.RenderPartial("AdminSidebar"); %>
</asp:Content>