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
        <div class="alert alert-info">Login befindet sich auf der rechten Seite der Kopfzeile</div>
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
   <div class="span6 well well-small" id="customerContent" style="display:none;">
   <h3>Kundenbereich</h3>
        <div class="alert alert-info">Zugriff &uuml;ber "Mein VersionR" in der Kopfzeile
        Menuführung über das Menu am linken Rand.</div>
        <%--<br />&nbsp;<br />--%>
<table class="table table-bordered table-condensed">
            <thead>
                <tr>
                    <th>
                        Bereich
                    </th>
                    <th>
                        Erkl&auml;rung
                    </th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>
                        Dashboard
                    </td>
                    <td>
                        zeigt &Uuml;bersicht &uuml;ber Kundendaten und Lizenzen
                    </td>
                </tr>
                <tr>
                    <td>
                        Kundendaten &auml;ndern
                    </td>
                    <td>
                        erm&ouml;glicht das &Auml;ndern der eigenen Kundendaten
                    </td>
                </tr>
                <tr>
                    <td>
                        Lizenzen
                    </td>
                    <td>
                        ...
                    </td>
                </tr>
                <tr>
                    <td>
                        Meine Supportf&auml;lle
                    </td>
                    <td>
                        ...
                    </td>
                </tr>
                <tr>
                    <td>
                        Neuer Supportfall
                    </td>
                    <td>
                        ...
                    </td>
                </tr>
            </tbody>
        </table>
    </div>

    <%--Admin--%>
    <div class="span6 well well-small" id="adminContent" style="display:none;">
        <h3>Adminbereich</h3>
        <div class="alert alert-info">Zugriff &uuml;ber "Admin" im rechten Bereich der Kopfzeile<br />&nbsp;</div>
        <table class="table table-bordered table-condensed">
            <thead>
                <tr>
                    <th>
                        Bereich
                    </th>
                    <th>
                        Erkl&auml;rung
                    </th>
                </tr>
            </thead>

            <tbody>
                <tr>
                    <td>
                        Dashboard
                    </td>
                    <td>
                        ...
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
                        Zeigt alle Rollen, diese k&ouml;nnen dort auch bearbeitet werden
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
                        ...
                    </td>
                </tr>
            </tbody>
        </table>
    </div>

    <%--Support--%>
    <div class="span6 well well-small" id="supportContent" style="display:none;">
        <h3>Supportbeich</h3>
        <div class="alert alert-info">Zugriff (auch über "Admin) und die Menuführung wie im Adminbereich geregelt</div>
        Der Supporterbereich ist ein abgespeckter Adminbereich.<br />
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="PageTitle" runat="server">
    VersionR
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="PageSubTitle" runat="server">
    Kurzanleitung
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="SidebarContent" runat="server">
    <ul class="nav nav-tabs nav-stacked" id="sideList">
        <li class="active" id="logininfo" onclick="navClicked(this.id);">
            <a href="#">Anmeldung</a>
        </li>
        <li id="customer" onclick="navClicked(this.id);">
            <a href="#">Kundenbereich</a>
        </li>
        <li id="admin" onclick="navClicked(this.id);">
            <a href="#">Adminbereich</a>
        </li>
        <li id="support" onclick="navClicked(this.id);">
            <a href="#">Supportbereich</a>
        </li>
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