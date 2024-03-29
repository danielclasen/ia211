﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<VersionR.Models.Role>" %>

<%@ Import Namespace="VersionR.Helpers" %>
<%@ Import Namespace="VersionR.Helpers.BootstrapMvcHelpers" %>
<%@ Import Namespace="VersionR.Helpers.BootstrapMvcHelpers.Enums" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    CreateRole
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PageTitle" runat="server">
    Rechteverwaltung
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="PageSubTitle" runat="server">
    Neue Rolle anlegen
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="SidebarContent" runat="server">
    <% Html.RenderPartial("AdminSidebar"); %>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <% Html.BeginForm("Create", "Role", FormMethod.Post, new { @class = "form-horizontal" }); %>
    <%: Html.ValidationSummary(true) %>
    <div class="control-group">
        <%: Html.BootstrapLabelFor(m => m.Name, "Bezeichnung")%>
        <div class="controls">
            <%: Html.TextBoxFor(model => model.Name) %>
            <%: Html.ValidationMessageFor(model => model.Name) %>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">
            Aktion</label>
        <div class="controls">
            <div class="btn-group">
                <button class="btn" type="reset" value="">
                    Zurücksetzen</button>
                <button type="submit" class="btn btn-primary" value="Create">
                    Rolle anlegen</button>
            </div>
        </div>
    </div>
    <% Html.EndForm(); %>
    <div>
        <% //Html.ActionLink("Zurück zur Übersicht", "List", "Role", new { }, new { @class = "btn" })%>
        <%: Html.Button("Zurück zur Übersicht", "List", "Role") %>
    </div>
</asp:Content>