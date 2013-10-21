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
    <div class="span6 well well-small">
        <h3>
            Anmeldedaten
        </h3>
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
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PageTitle" runat="server">
    VersionR
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="PageSubTitle" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="SidebarContent" runat="server">
    <ul class="nav nav-tabs nav-stacked">
        <li class="active" id="firstNav"><a href="">eins</a> </li>
        <li id="scndNav"><a href="">zwei</a> </li>
    </ul>
</asp:Content>
