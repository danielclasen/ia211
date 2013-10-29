<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>
<%@ Import Namespace="VersionR.Helpers" %>
<ul class="nav nav-list">
    <li class="nav-header">Allgemein</li>
    <%: Html.MenuItem("Dashboard", "Index", "Dashboard", "Admin") %>
    <% if (Context.User.IsInRole("Administrator"))
       { %>
    <li class="nav-header">Accountverwaltung</li>
    <%: Html.MenuItem("Benutzer", "List", "User", "Admin")%>
    <%: Html.MenuItem("Benutzer anlegen", "Create", "User", "Admin")%>
    <li class="nav-header">Rechteverwaltung</li>
    <%: Html.MenuItem("Rollen", "List", "Role", "Admin")%>
    <%: Html.MenuItem("Rolle anlegen", "Create", "Role", "Admin")%>
    <% } %>
    <% if (Context.User.IsInRole("Administrator") || Context.User.IsInRole("Supporter"))
       { %>
    <li class="nav-header">Modulverwaltung</li>
    <%: Html.MenuItem("Module", "List", "Module", "Admin")%>
    <%: Html.MenuItem("Modul anlegen", "Create", "Module", "Admin")%>
    <li class="nav-header">Auswertung</li>
    <%: Html.MenuItem("Module nach Downloads", "Index", "Statistic", "Admin")%>
    <% } %>
</ul>