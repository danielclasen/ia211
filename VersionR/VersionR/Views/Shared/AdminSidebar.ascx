<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>
<%@ Import Namespace="VersionR.Helpers" %>
<ul class="nav nav-list">
            <li class="nav-header">Accountverwaltung</li>
            <%: Html.MenuItem("Benutzer", "Users", "Admin")%>
            <%: Html.MenuItem("Rollen", "Roles", "Admin")%>
</ul>