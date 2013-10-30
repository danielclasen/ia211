<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>
<%@ Import Namespace="VersionR.Helpers" %>
<ul class="nav nav-list">
    <li class="nav-header">Allgemein</li>
    <%: Html.MenuItem("Dashboard", "Index", "Dashboard", "Account") %>
    <li class="nav-header">Accountverwaltung</li>
    <%: Html.MenuItem("Kundendaten ändern", "Edit", "User", "Account")%>
    <li class="nav-header">Lizenzverwaltung</li>
    <%: Html.MenuItem("Lizenzen", "List", "Licence", "Account")%>
    <li class="nav-header">Support</li>
    <%: Html.MenuItem("Meine Supportfälle", "List", "Support", "Account")%>
    <%: Html.MenuItem("Neuer Supportfall", "Create", "Support", "Account")%>
</ul>