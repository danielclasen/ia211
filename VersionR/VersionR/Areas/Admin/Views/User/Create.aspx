<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<VersionR.ViewModels.Admin.CreateUserViewModel>" %>

<%@ Import Namespace="VersionR.Helpers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    CreateUser
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <% Html.BeginForm("Create", "User", FormMethod.Post, new { @class = "form-horizontal" });%>
    <%: Html.ValidationSummary(true) %>
    <div class="control-group">
        <%: Html.BootstrapLabelFor(m => m.User.NickName, "Benutzername")%>
        <div class="controls">
            <%: Html.TextBoxFor(model => model.User.NickName, new { required = "required" })%>
            <%: Html.ValidationMessageFor(model => model.User.NickName)%>
        </div>
    </div>
    <div class="control-group">
        <%: Html.BootstrapLabelFor(model => model.User.Role, "Rolle")%>
        <div class="controls">
            <%: Html.DropDownListFor(model => model.User.RId, Model.Roles, new {required = "required" })%>
            <%: Html.ValidationMessageFor(model => model.User.Role)%>
        </div>
    </div>
    <div class="control-group">
        <%: Html.BootstrapLabelFor(model => model.User.EMail, "E-Mail")%>
        <div class="controls">
            <%: Html.TextBoxFor(model => model.User.EMail, new { type = "email", required = "required" })%>
            <%: Html.ValidationMessageFor(model => model.User.EMail)%>
        </div>
    </div>
    <div class="control-group">
        <%: Html.BootstrapLabelFor(model => model.User.Phone, "Telefon")%>
        <div class="controls">
            <%: Html.TextBoxFor(model => model.User.Phone)%>
            <%: Html.ValidationMessageFor(model => model.User.Phone)%>
        </div>
    </div>
    <div class="control-group">
        <%: Html.BootstrapLabelFor(model => model.User.PwHash, "Passwort")%>
        <div class="controls">
            <%: Html.PasswordFor(model => model.User.PwHash, new { required = "required" })%>
            <%: Html.ValidationMessageFor(model => model.User.PwHash)%>
        </div>
    </div>
    <div class="control-group">
        <div class="controls">
            <div class="btn-group">
                <button class="btn" type="reset" value="">
                    Zurücksetzen</button>
                <button type="submit" class="btn btn-primary" value="">
                    Benutzer anlegen</button>
            </div>
        </div>
    </div>
    <% Html.EndForm();%>
    <div>
        <%: Html.ActionLink("Zurück zur Übersicht", "List", "User", new { }, new { @class = "btn" })%>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PageTitle" runat="server">
    Benutzerkonten-Verwaltung
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="PageSubTitle" runat="server">
    Neuen Benutzer anlegen.
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="SidebarContent" runat="server">
    <% Html.RenderPartial("AdminSidebar"); %>
</asp:Content>