<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<VersionR.Models.User>" %>

<%@ Import Namespace="VersionR.Helpers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Kundendaten ändern - VersionR
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <% Html.BeginForm("Update", "User", FormMethod.Post, new { @class = "form-horizontal" }); %>
    <div class="control-group">
        <%: Html.BootstrapLabelFor(username => username.NickName, "Benutzername") %>
        <div class="controls">
            <%: Html.TextBoxFor(username => username.NickName, new { required = "required" })%>
            <% Html.ValidationMessageFor(username => username.NickName); %>
        </div>
        <%: Html.BootstrapLabelFor(email => email.EMail, "E-Mail") %>
        <div class="controls">
            <%: Html.TextBoxFor(email => email.EMail, new { required = "required" })%>
            <% Html.ValidationMessageFor(email => email.EMail); %>
        </div>
        <%: Html.BootstrapLabelFor(phone => phone.Phone, "Telefon") %>
        <div class="controls">
            <%: Html.TextBoxFor(phone => phone.Phone, new { required = "required" })%>
            <% Html.ValidationMessageFor(phone => phone.Phone); %>
        </div>
    </div>
    <div class="control-group">
        <div class="controls">
            <div class="btn-group">
                <button type="reset" value="" class="btn" >Abbrechen</button>
                <button type="submit" class="btn btn-primary">Speichern</button>
            </div>
        </div>
    </div>
    <% Html.EndForm(); %>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PageTitle" runat="server">
    Kundendaten ändern
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="PageSubTitle" runat="server">
    Hier können Sie ihre Daten ansehen und ändern.
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="SidebarContent" runat="server">
    <% Html.RenderPartial("AccountSidebar"); %>
</asp:Content>
