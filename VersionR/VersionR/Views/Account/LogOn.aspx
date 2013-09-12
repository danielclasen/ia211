<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<VersionR.Models.LogOnModel>" %>

<asp:Content ID="loginTitle" ContentPlaceHolderID="TitleContent" runat="server">
    Anmelden
</asp:Content>

<asp:Content ID="loginContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Anmelden</h2>
    <p>
        Geben Sie Ihren Benutzernamen und Ihr Kennwort ein. <%: Html.ActionLink("Registrieren", "Register") %> (sofern Sie nicht über ein Konto verfügen).
    </p>

    <% using (Html.BeginForm()) { %>
        <%: Html.ValidationSummary(true, "Die Anmeldung war nicht erfolgreich. Korrigieren Sie die Fehler, und wiederholen Sie den Vorgang.") %>
        <div>
            <fieldset>
                <legend>Kontoinformationen</legend>
                
                <div class="editor-label">
                    <%: Html.LabelFor(m => m.UserName) %>
                </div>
                <div class="editor-field">
                    <%: Html.TextBoxFor(m => m.UserName) %>
                    <%: Html.ValidationMessageFor(m => m.UserName) %>
                </div>
                
                <div class="editor-label">
                    <%: Html.LabelFor(m => m.Password) %>
                </div>
                <div class="editor-field">
                    <%: Html.PasswordFor(m => m.Password) %>
                    <%: Html.ValidationMessageFor(m => m.Password) %>
                </div>
                
                <div class="editor-label">
                    <%: Html.CheckBoxFor(m => m.RememberMe) %>
                    <%: Html.LabelFor(m => m.RememberMe) %>
                </div>
                
                <p>
                    <input type="submit" value="Anmelden" />
                </p>
            </fieldset>
        </div>
    <% } %>
</asp:Content>
