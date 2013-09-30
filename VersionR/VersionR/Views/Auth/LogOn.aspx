<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<VersionR.Models.LogOnModel>" %>
<%@ Import Namespace="VersionR.Helpers" %>
<asp:Content ID="loginTitle" ContentPlaceHolderID="TitleContent" runat="server">
    Anmelden
</asp:Content>

<asp:Content ID="loginContent" ContentPlaceHolderID="MainContent" runat="server">


    <% Html.BeginForm("LogOn", "Auth", FormMethod.Post, new { @class="form-horizontal" });%>
        <%: Html.ValidationSummary(true, "Die Anmeldung war nicht erfolgreich. Korrigieren Sie die Fehler, und wiederholen Sie den Vorgang.", new { @class = "alert alert-error" })%>
        <div>


        <div class="control-group">
            <%: Html.BootstrapLabelFor(m => m.UserName, "E-Mail")%>
            <div class="controls">
            <%: Html.TextBoxFor(m => m.UserName) %>
            <%: Html.ValidationMessageFor(m => m.UserName)%>
            </div>
        </div>

        <div class="control-group">
            <%: Html.BootstrapLabelFor(m => m.Password, "Passwort")%>
            <div class="controls">
            <%: Html.PasswordFor(m => m.Password) %>
            <%: Html.ValidationMessageFor(m => m.Password)%>
            </div>
        </div>

        <div class="control-group">
            <%: Html.BootstrapLabelFor(m => m.RememberMe, "Login merken")%>
            <div class="controls">
            <%: Html.CheckBoxFor(m => m.RememberMe)%>
            <%: Html.ValidationMessageFor(m => m.RememberMe)%>
            </div>
        </div>

        <div class="control-group">
            
            <div class="controls">
            <div class="btn-group">
            <button class="btn" type="reset" value="">Zurücksetzen</button>
            <button type="submit" class="btn btn-primary" value="Login">Login</button>
            </div>

            </div>

        </div>

        </div>
    <% Html.EndForm(); %>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="PageTitle" runat="server">
Login
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="PageSubTitle" runat="server">
 Geben Sie bitte Ihre E-Mail Adresse und Ihr Kennwort ein.
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="SidebarContent" runat="server">
</asp:Content>
