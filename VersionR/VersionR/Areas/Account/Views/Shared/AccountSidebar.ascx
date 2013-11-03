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
    <li class="hoverPopUp" data-placement="right" title="Hier könnten aktuell laufende Supportfälle betrachtet werden">
        <a href="">Meine Supportfälle</a></li>
    <li class="hoverPopUp" data-placement="right" title="Hier könnte ein Kunde ein neues Problem melden">
        <a href="">Neuer Supportfall</a></li>
</ul>
<script type="text/javascript">
    $('.hoverPopUp').tooltip();
</script>