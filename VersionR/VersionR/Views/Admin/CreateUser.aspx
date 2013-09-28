<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<VersionR.Models.User>" %>
<%@ Import Namespace="VersionR.Helpers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	CreateUser
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <% Html.BeginForm("CreateUser", "Admin", FormMethod.Post, new { @class="form-horizontal" });%>
    <%: Html.ValidationSummary(true) %>

        
        <div class="control-group">
            <%: Html.BootstrapLabelFor(m => m.NickName, "Benutzername")%>
            <div class="controls">
            <%: Html.TextBoxFor(model => model.NickName) %>
            <%: Html.ValidationMessageFor(model => model.NickName) %>
            </div>
        </div>


        <div class="control-group">
            <%: Html.BootstrapLabelFor(model => model.Role, "Rolle")%>
            <div class="controls">
            <%: Html.DropDownList("newUserRole", (SelectList)ViewData["roleSelect"])%>
            <%: Html.ValidationMessageFor(model => model.NickName) %>
            </div>
        </div>


        <div class="control-group">
            <%: Html.BootstrapLabelFor(model => model.EMail, "E-Mail")%>
            <div class="controls">
            <%: Html.TextBoxFor(model => model.EMail) %>
            <%: Html.ValidationMessageFor(model => model.EMail) %>
            </div>
        </div>


        <div class="control-group">
            <%: Html.BootstrapLabelFor(model => model.Phone, "Telefon")%>
            <div class="controls">
            <%: Html.TextBoxFor(model => model.Phone) %>
            <%: Html.ValidationMessageFor(model => model.Phone) %>
            </div>
        </div>

        <div class="control-group">
            <%: Html.BootstrapLabelFor(model => model.PwHash, "Passwort")%>
            <div class="controls">
            <%: Html.PasswordFor(model => model.PwHash) %>
            <%: Html.ValidationMessageFor(model => model.PwHash) %>

            </div>           
        </div>

        <div class="control-group">
        
            <div class="controls">
             <input type="submit" class="btn" value="Benutzer anlegen" />
            </div>

        </div>

            


    <% Html.EndForm();%>
    <div>
        <%: Html.ActionLink("Back to List", "Users") %>
    </div>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="PageTitle" runat="server">
Benutzerkonten-Verwaltung
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="PageSubTitle" runat="server">
Neuen Benutzer anlegen
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="SidebarContent" runat="server">
<% Html.RenderPartial("AdminSidebar"); %>
</asp:Content>

