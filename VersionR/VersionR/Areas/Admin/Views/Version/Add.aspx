<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<VersionR.Areas.Admin.ViewModels.VersionViewModel>" %>

<%@ Import Namespace="VersionR.Helpers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Add
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <% Html.BeginForm("Add", "Version", FormMethod.Post, new { @class = "form-horizontal", enctype = "multipart/form-data" });%>
    <%: Html.ValidationSummary(true) %>
    <div class="control-group">
        <%: Html.BootstrapLabelFor(model => model.Version.Release, "Major Relase-Nr.")%>
        <div class="controls">
            <%: Html.TextBoxFor(model => model.Version.Release, new { required = "required", type = "number", min = "0" })%>
            <%: Html.ValidationMessageFor(model => model.Version.Release)%>
        </div>
    </div>
    <div class="control-group">
        <%: Html.BootstrapLabelFor(model => model.Version.SubRelease, "Minor Release-Nr.")%>
        <div class="controls">
            <%: Html.TextBoxFor(model => model.Version.SubRelease, new { required = "required", type = "number", min = "0" })%>
            <%: Html.ValidationMessageFor(model => model.Version.SubRelease)%>
        </div>
    </div>
    <div class="control-group">
        <%: Html.BootstrapLabelFor(model => model.Version.BuildId, "Build")%>
        <div class="controls">
            <%: Html.TextBoxFor(model => model.Version.BuildId, new { required = "required" })%>
            <%: Html.ValidationMessageFor(model => model.Version.BuildId)%>
        </div>
    </div>
    <div class="control-group">
        <%: Html.BootstrapLabelFor(model => model.Version.Platform, "Plattform")%>
        <div class="controls">
            <%: Html.TextBoxFor(model => model.Version.Platform, new { required = "required" })%>
            <%: Html.ValidationMessageFor(model => model.Version.Platform)%>
        </div>
    </div>
    <div class="control-group">
        <%: Html.BootstrapLabelFor(model => model.Version.Description, "Beschreibung oder Changelog")%>
        <div class="controls">
            <%: Html.TextAreaFor(model => model.Version.Description, new { @class = "texteditor" })%>
            <%: Html.ValidationMessageFor(model => model.Version.Description)%>
        </div>
    </div>
    <div class="control-group">
        <%: Html.BootstrapLabelFor(model => model.ReleaseDate, "Datum der Veröffentlichung")%>
        <div class="controls">
            <%: Html.TextBoxFor(model => model.ReleaseDate, new { type = "text", required = "required", @class = "datepicker" })%>
            <%: Html.ValidationMessageFor(model => model.ReleaseDate)%>
        </div>
    </div>
    <div class="control-group">
        <%: Html.BootstrapLabelFor(model => model.Version.Filename, "Datei/Paket")%>
        <div class="controls">
            <input type="file" name="files" id="file1" data-trigger="fileupload" required="required"
                title="Durchsuchen" />
            <%: Html.ValidationMessageFor(model => model.Version.Filename)%>
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
        <%: Html.ActionLink("Zurück zum Modul", "Details", "Module", new { id = Model.Version.Module.ModId }, new { @class = "btn" })%>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PageTitle" runat="server">
    Versionsverwaltung
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="PageSubTitle" runat="server">
    Neue Version von Modul "<%: Model.Version.Module.Name %>" erstellen.
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="SidebarContent" runat="server">
    <% Html.RenderPartial("AdminSidebar"); %>
</asp:Content>