<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<script runat="server">

</script>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Startseite
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: ViewData["Message"] %><asp:Login ID="Login" runat="server" 
            onauthenticate="Login1_Authenticate" Width="314px">
    </asp:Login>
</h2>
</asp:Content>
