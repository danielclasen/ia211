<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<VersionR.Models.User>" %>

<%@ Import Namespace="VersionR.Helpers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    EditUser
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <% Html.BeginForm("EditUser", "Admin", FormMethod.Post, new { @class = "form-horizontal" }); %>
    <%: Html.ValidationSummary(true) %>
    <div class="control-group">
        <%: Html.BootstrapLabelFor(m => m.NickName, "Benutzername")%>
        <div class="controls">
            <%: Html.TextBoxFor(m => m.NickName)%>
            <%: Html.ValidationMessageFor(m => m.NickName)%>
        </div>
    </div>
    <div class="control-group">
        <%: Html.BootstrapLabelFor(m => m.EMail, "E-Mail")%>
        <div class="controls">
            <%: Html.TextBoxFor(m => m.EMail)%>
            <%: Html.ValidationMessageFor(m => m.EMail)%>
        </div>
    </div>
    <div class="control-group">
        <%: Html.BootstrapLabelFor(m => m.Phone, "Telefon")%>
        <div class="controls">
            <%: Html.TextBoxFor(m => m.Phone)%>
            <%: Html.ValidationMessageFor(m => m.Phone)%>
        </div>
    </div>
    <div class="control-group">
        <%: Html.BootstrapLabelFor(model => model.Role, "Rolle")%>
        <div class="controls">
            <%: Html.DropDownList("roleSelect")%>
            <%: Html.ValidationMessageFor(model => model.NickName) %>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">
            Neues Passwort</label>
        <div class="controls">
            <%: Html.Password("newPassword")%>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">
            Aktion</label>
        <div class="controls">
            <div class="btn-group">
                <button class="btn" type="reset" value="">
                    Zurücksetzen</button>
                <button type="submit" class="btn btn-primary" value="Edit">
                    Benutzer speichern</button>
            </div>
            <%: Html.ActionLink("Benutzer " + Model.NickName + " löschen", "DeleteUser", "Admin", new { id = Model.UId }, new { @class = "btn btn-danger" })%>
        </div>
    </div>
    <% Html.EndForm(); %>
    <div>
        <%: Html.ActionLink("Zurück zur Übersicht", "Users", "Admin", new { }, new { @class = "btn" })%>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PageTitle" runat="server">
    Benutzerkonten-Verwaltung
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="PageSubTitle" runat="server">
    Hier können Sie den Benutzer "<%: Model.NickName %>" bearbeiten.
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="SidebarContent" runat="server">
    <% Html.RenderPartial("AdminSidebar"); %>
</asp:Content>