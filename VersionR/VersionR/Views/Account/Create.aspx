<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<VersionR.ModelsLocale.Kunden>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Create
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        Create</h2>
    <% using (Html.BeginForm()) {%>
    <%: Html.ValidationSummary(true) %>
    <fieldset>
        <legend>Fields</legend>
        <div class="editor-label">
            <%: Html.LabelFor(model => model.NickName) %>
        </div>
        <div class="editor-field">
            <%: Html.TextBoxFor(model => model.NickName) %>
            <%: Html.ValidationMessageFor(model => model.NickName) %>
        </div>
        <div class="editor-label">
            <%: Html.LabelFor(model => model.Email) %>
        </div>
        <div class="editor-field">
            <%: Html.TextBoxFor(model => model.Email) %>
            <%: Html.ValidationMessageFor(model => model.Email) %>
        </div>
        <div class="editor-label">
            <%: Html.LabelFor(model => model.Telefon) %>
        </div>
        <div class="editor-field">
            <%: Html.TextBoxFor(model => model.Telefon) %>
            <%: Html.ValidationMessageFor(model => model.Telefon) %>
        </div>
        <div class="editor-label">
            Passwort
        </div>
        <div class="editor-field">
            <%--<input id="PwHash" name="PwHash" type="password" />--%>
            <%: Html.PasswordFor(model => model.PwHash) %>
            <%: Html.ValidationMessageFor(model => model.PwHash) %>
        </div>
        <p>
            <input type="submit" value="Create" />
        </p>
    </fieldset>
    <% } %>
    <div>
        <%: Html.ActionLink("Back to List", "Index") %>
    </div>
</asp:Content>
