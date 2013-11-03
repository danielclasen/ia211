<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<script runat="server">

    protected void Login1_Authenticate(object sender, AuthenticateEventArgs e)
    {

    }
</script>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Startseite
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <%--Log in--%>
    <div class="span6 well well-small" id="logininfoContent">
        <h3>
            Anmeldung
        </h3>
        <div class="alert alert-success">
            Login befindet sich auf der rechten Seite der Kopfzeile.</div>
        <div class="alert alert-info">
            Drei QuickLogin-Buttons im Anmeldebildschirm, sollen ein schnelleres Einloggen ermöglichen.</div>
        <table class="table table-bordered table-condensed">
            <thead>
                <tr>
                    <th>
                        Benutzer
                    </th>
                    <th>
                        Benutzername
                    </th>
                    <th>
                        Passwort
                    </th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>
                        Adminuser
                    </td>
                    <td>
                        admin@versionr.com
                    </td>
                    <td>
                        admin
                    </td>
                </tr>
                <tr>
                    <td>
                        Supportuser
                    </td>
                    <td>
                        support@versionr.com
                    </td>
                    <td>
                        support
                    </td>
                </tr>
                <tr>
                    <td>
                        Kundenuser
                    </td>
                    <td>
                        customer@versionr.com
                    </td>
                    <td>
                        customer
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
    <%--Kundenbereich--%>
    <div class="span6 well well-small" id="customerContent" style="display: none;">
        <h3>
            Kundenbereich</h3>
        <div class="alert alert-success">
            Zugriff über "Mein VersionR" in der Kopfzeile Menuführung über das Menu am linken
            Rand.
        </div>
        <div class="alert alert-info">
            Im Kundenbereich erscheint an der Kopfzeile ein Benachrichtigungsfeld. Dort wird
            der Kunde über Updates für seine gekauften Module informiert.</div>
        <%--<br />&nbsp;<br />--%>
        <table class="table table-bordered table-condensed">
            <thead>
                <tr>
                    <th>
                        Bereich
                    </th>
                    <th>
                        Erklärung
                    </th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>
                        Dashboard
                    </td>
                    <td>
                        Auf der linken Tabelle, kann der Kunde kann hier seine seine Daten betrachten und
                        bearbeiten.<br />
                        <br />
                        Auf der rechten Tabelle, kann der Kunde seine gekauften Lizenzen sehen. Es weden
                        ebenfalls alle dazu gehörigen Module angezeigt, die letzte heruntergeladene Version,
                        ein Hinweis, ob diese die aktuellste Version ist und das Ablaufdatum der Lizenz.
                    </td>
                </tr>
                <tr>
                    <td>
                        Kundendaten ändern
                    </td>
                    <td>
                        Ermöglicht das Ändern der eigenen Kundendaten. Dieser Bereich ist über dem Menüpunkt
                        ereichbar oder über das Bearbeiten-Symbol an der Tabelle Kundendaten im Dashboard.
                    </td>
                </tr>
                <tr>
                    <td>
                        Lizenzen
                    </td>
                    <td>
                        Zeigt eine Liste aller Lizenzen des aktuell eingelogten Benutzers an. Es können
                        Startzeit und Endzeit, sowie Informationen bezüglich des Verknüpften Moduls entnommen
                        werden.
                    </td>
                </tr>
                <tr>
                    <td>
                        Meine Supportfälle
                    </td>
                    <td>
                        -nicht implementiert-
                    </td>
                </tr>
                <tr>
                    <td>
                        Neuer Supportfall
                    </td>
                    <td>
                        -nicht implementiert-
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
    <%--Admin--%>
    <div class="span6 well well-small" id="adminContent" style="display: none;">
        <h3>
            Adminbereich</h3>
        <div class="alert alert-success">
            Zugriff über "Administration" im rechten Bereich der Kopfzeile</div>
        <table class="table table-bordered table-condensed">
            <thead>
                <tr>
                    <th>
                        Bereich
                    </th>
                    <th>
                        Erklärung
                    </th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>
                        Dashboard
                    </td>
                    <td>
                        -nicht implementiert-
                    </td>
                </tr>
                <tr>
                    <td>
                        Benutzer
                    </td>
                    <td>
                        Zeigt alle Benutzer, diese können dort auch bearbeitet werden
                    </td>
                </tr>
                <tr>
                    <td>
                        Benutzer anlegen
                    </td>
                    <td>
                        Legt einen neuen Benutzer an
                    </td>
                </tr>
                <tr>
                    <td>
                        Rollen
                    </td>
                    <td>
                        Zeigt alle Rollen, diese können dort auch bearbeitet werden
                    </td>
                </tr>
                <tr>
                    <td>
                        Rollen anlegen
                    </td>
                    <td>
                        Legt neue Rollen an
                    </td>
                </tr>
                <tr>
                    <td>
                        Module
                    </td>
                    <td>
                        Zeigt alle Module, diese können dort auch bearbeitet werden
                    </td>
                </tr>
                <tr>
                    <td>
                        Module anlegen
                    </td>
                    <td>
                        Legt Module an
                    </td>
                </tr>
                <tr>
                    <td>
                        Module nach Downloads
                    </td>
                    <td>
                        Statistik über die Downloads pro Modul
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
    <%--Support--%>
    <div class="span6 well well-small" id="supportContent" style="display: none;">
        <h3>
            Supportbeich</h3>
        <div class="alert alert-warning">
            Der Supporterbereich ist ein limitierter Adminbereich, welcher für die Abwicklung
            von Supportfällen dient. Die Navigationspunkte unter "Modulverwaltung" und "Auswertung"
            sind dem regulärem Adminbereich entnommen.<br />
        </div>
    </div>
    <%-- Besonderes --%>
    <div class="span6 well well-small" id="importantContent" style="display: none;">
        <h3>
            Bitte beachten!</h3>
        <div class="alert alert-error">
            Folgende Puntke:
            <ul>
                <li>Die Möglichkeit Lizenzen zu kaufen (in Modulkatalog)</li>
                <li>Der Supportbereich (in Mein VersionR)</li>
                <li>Das Dashboard (in Administration)</li>
            </ul>
            konnten leider von uns nicht mehr intensiv behandelt werden.<br />
            Zum Aufzeigen der Erweiterungsmöglichkeiten haben wir allerdings etwaige Buttons,
            Menüpunkte, Unterseiten aber nicht entfernt, sondern <strong>ohne besondere Funktion
                bestehen lassen!</strong> Dies wird aber auch über ein PopUp oder ein Hilfstext
            an den entsprechenden Stellen vermerkt.
        </div>
        <h3>
            Bekannte Probleme</h3>
        <ul>
            <li>Dashboard im Administrator-Bereich fehlt.</li>
            <li>Beim Anlegen einer neuen Modul-Version (Admin) kommt es zu Fehlern, wenn die Beschreibung
                länger ist als 64 Zeichen.</li>
            <li>Beim Anlegen einer neuen Modul-Version (Admin), welche erst in der Zukunft veröffentlicht
                wird, erfolgt kein automatisierter Mail-Versand.</li>
            <li>Bezeichnungen, Hilfe-Texte, Link-Beschriftungen sowie Fehlermeldungen sind innerhalb
                der Datenbank nicht einheitlich</li>
            <li>Die Benachrichtigungsanzeige stellt manchmal Benachrichtigungen dar, welche erst
                in Zukunft gültig sind (Nicht reproduzierbar).</li>
            <li>Die dargestellten Diagramme im Administrations-Bereich sinsd nicht immer sinnvoll.
                Sie sollen nur die Möglichkeiten symbolisieren.</li>
            <li>Ursprünglich war geplant, dass bei jeder Version nach Bedarf ein neues Handbuch
                eingeplegt werden kann. Dieses Feature wurde aufgrund fehlender Zeit und ausreichender
                Planung verworfen. Den Lösungsansatz kann man im ER-Modell der Datenbank nachvollziehen.
            </li>
        </ul>
    </div>
    <%-- Info --%>
    <div class="span6 well well-small" id="infoContent" style="display: none;">
        <h3>
            Quellenangaben/ Verwendete Ressourcen</h3>
        <ul>
            <li><a target="_blank" href="http://getbootstrap.com/2.3.2">Bootstrap 2.3.2</a> • Layout-Bibliothek
                mit Javascript, und CSS</li>
            <li><a target="_blank" href="http://www.asp.net/mvc/tutorials/older-versions/getting-started-with-mvc/getting-started-with-mvc-part1">
                ASP.NET</a> • Dokumentationsseiten zur Informationsbeschaffung</li>
            <li><a target="_blank" href="http://fontawesome.io/3.2.1/">Fontawesome 3.2.1</a> • CSS-Bibliothek,
                welche mittels vektorisierten Schriftarten Icons und Symbole hochauflösend darstellt.</li>
            <li><a target="_blank" href="http://www.oesmith.co.uk/morris.js/">Morris.js v0.4.2</a>
                • JS-Bibliothek zur Generierung von Diagrammen (SVG)</li>
            <li><a target="_blank" href="http://raphaeljs.com/">Raphaël.js 2.1.2</a> • JS-Bibliothek,
                die von morris.js benötigt wird, um dynamische SVGs erstellen zu können</li>
        </ul>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PageTitle" runat="server">
    Herzlich Willkommen!
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="PageSubTitle" runat="server">
    Diese Kurzanleitung wird Ihnen die Bedienung von VersionR näher bringen.
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="SidebarContent" runat="server">
    <ul class="nav nav-tabs nav-stacked" id="sideList">
        <li class="active" id="logininfo" onclick="navClicked(this.id);"><a href="#">Anmeldung</a>
        </li>
        <li id="important" onclick="navClicked(this.id);"><a href="#">Wichtig!</a> </li>
        <li id="customer" onclick="navClicked(this.id);"><a href="#">Kundenbereich</a> </li>
        <li id="admin" onclick="navClicked(this.id);"><a href="#">Adminbereich</a> </li>
        <li id="support" onclick="navClicked(this.id);"><a href="#">Supportbereich</a> </li>
        <li id="info" onclick="navClicked(this.id);"><a href="#">Quellenangaben</a> </li>
    </ul>
    <script type="text/javascript">
        var activeNav = document.getElementById('sideList').children[0].id;

        function navClicked(clickedEl) {
            //set nav status
            document.getElementById(activeNav).classList.remove('active');
            document.getElementById(clickedEl).classList.add('active');

            //switch content-visibility
            document.getElementById(activeNav + 'Content').style.display = "none";
            document.getElementById(clickedEl + 'Content').style.display = "block";

            activeNav = clickedEl;
        }
    </script>
</asp:Content>