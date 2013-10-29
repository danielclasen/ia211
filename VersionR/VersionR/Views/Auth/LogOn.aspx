<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<VersionR.Models.LogOnModel>" %>

<%@ Import Namespace="VersionR.Helpers" %>
<asp:Content ID="loginTitle" ContentPlaceHolderID="TitleContent" runat="server">
    Anmelden
</asp:Content>
<asp:Content ID="loginContent" ContentPlaceHolderID="MainContent" runat="server">
    <% Html.BeginForm("LogOn", "Auth", FormMethod.Post, new { @class = "form-horizontal" });%>
    <%: Html.ValidationSummary(true, "Die Anmeldung war nicht erfolgreich. Korrigieren Sie die Fehler, und wiederholen Sie den Vorgang.", new { @class = "alert alert-error" })%>
    <div>
        <div class="controls">
            <div class="control-group">
                <h4>
                    Schnellanmeldung</h4>
                <div class="btn-group">
                    <button class="btn btn-warning" type="button" value="" onclick="quickLogin('admin');">
                        Admin</button>
                    <button class="btn btn-info" type="button" value="" onclick="quickLogin('supporter');">
                        Supporter</button>
                    <button class="btn btn-success" type="button" value="" onclick="quickLogin('customer');">
                        Kunde</button>
                </div>
            </div>
        </div>
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
                    <button class="btn" type="reset" value="">
                        Zurücksetzen</button>
                    <button type="submit" class="btn btn-primary" id="loginBtn" value="Login">
                        Login</button>
                </div>
            </div>
        </div>
    </div>
    <% Html.EndForm(); %>
    <script type="text/javascript">
        function quickLogin(userVal) {
            var user = document.getElementById('UserName');
            var pw = document.getElementById('Password');

            switch (userVal) {
                case 'admin':
                    user.value = "admin@versionr.com";
                    pw.value = "admin";
                    break;
                case 'supporter':
                    user.value = "support@versionr.com";
                    pw.value = "support";
                    break;
                case 'customer':
                    user.value = "customer@versionr.com";
                    pw.value = "customer";
                    break;
                default:
                    return;
                    break;
            }
            document.forms[0].submit();
        }
    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PageTitle" runat="server">
    Login
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="PageSubTitle" runat="server">
    Geben Sie bitte Ihre E-Mail Adresse und Ihr Kennwort ein.
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="SidebarContent" runat="server">
</asp:Content>
