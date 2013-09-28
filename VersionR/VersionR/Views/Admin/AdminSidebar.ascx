<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>
<%@ Import Namespace="VersionR.Helpers" %>
<ul class="nav nav-list">
            <li class="nav-header">Allgemein</li>
            <%: Html.MenuItem("Dashboard", "Index", "Admin")%>
            <li class="nav-header">Accountverwaltung</li>
            <%: Html.MenuItem("Benutzer", "Users", "Admin")%>
            <%: Html.MenuItem("Benutzer anlegen", "CreateUser", "Admin")%>
            <li class="nav-header">Rechteverwaltung</li>
            <%: Html.MenuItem("Rollen", "Roles", "Admin")%>
            <%: Html.MenuItem("Rolle anlegen", "CreateRole", "Admin")%>
</ul>