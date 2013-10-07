<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<VersionR.Models.Version>" %>

<%@ Import Namespace="VersionR.Helpers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Add
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        Add</h2>
    <% Html.BeginForm("Add", "Version", FormMethod.Post, new { @class = "form-horizontal", enctype = "multipart/form-data" });%>
    <%: Html.ValidationSummary(true) %>
    <div class="control-group">
        <%: Html.BootstrapLabelFor(model => model.Release, "Relase")%>
        <div class="controls">
            <%: Html.TextBoxFor(model => model.Release/*, new { required = "required" }*/)%>
            <%: Html.ValidationMessageFor(model => model.Release)%>
        </div>
    </div>
    <div class="control-group">
        <%: Html.BootstrapLabelFor(model => model.SubRelease, "SubRelease")%>
        <div class="controls">
            <%: Html.TextBoxFor(model => model.SubRelease/*, new { required = "required" }*/)%>
            <%: Html.ValidationMessageFor(model => model.SubRelease)%>
        </div>
    </div>
    <div class="control-group">
        <%: Html.BootstrapLabelFor(model => model.BuildId, "BuildId")%>
        <div class="controls">
            <%: Html.TextBoxFor(model => model.BuildId/*, new { required = "required" }*/)%>
            <%: Html.ValidationMessageFor(model => model.BuildId)%>
        </div>
    </div>
    <div class="control-group">
        <%: Html.BootstrapLabelFor(model => model.Platform, "Platform")%>
        <div class="controls">
            <%: Html.TextBoxFor(model => model.Platform/*, new { required = "required" }*/)%>
            <%: Html.ValidationMessageFor(model => model.Platform)%>
        </div>
    </div>
    <div class="control-group">
        <%: Html.BootstrapLabelFor(model => model.Filename, "Filename")%>
        <div class="controls">
            <input type="file" name="files" id="file1" size="25" />
            <%: Html.ValidationMessageFor(model => model.Filename)%>
        </div>
    </div>
    <div class="control-group">
        <%: Html.BootstrapLabelFor(model => model.Description, "Description")%>
        <div class="controls">
            <%: Html.TextBoxFor(model => model.Description/*, new { required = "required" }*/)%>
            <%: Html.ValidationMessageFor(model => model.Description)%>
        </div>
    </div>
    <div class="control-group">
        <%: Html.BootstrapLabelFor(model => model.ReleaseDate, "ReleaseDate")%>
        <div class="controls">
            <%: Html.TextBoxFor(model => model.ReleaseDate/*, new { required = "required" }*/)%>
            <%: Html.ValidationMessageFor(model => model.ReleaseDate)%>
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
        <%: Html.ActionLink("Zurück zur Übersicht", "Index", "Version", new { }, new { @class = "btn" })%>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PageTitle" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="PageSubTitle" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="SidebarContent" runat="server">
</asp:Content>