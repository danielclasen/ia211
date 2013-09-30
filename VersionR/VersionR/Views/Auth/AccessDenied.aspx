<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	AccessDenied
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    Na, na, na! Jetzt aber ganz schnell <%: Html.ActionLink("Zurück!", "Index", "Home")%> 

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="PageTitle" runat="server">
Kein Zugriff!
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="PageSubTitle" runat="server">
Dies sind nicht die Seiten, die Ihr sucht.
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="SidebarContent" runat="server">
</asp:Content>
