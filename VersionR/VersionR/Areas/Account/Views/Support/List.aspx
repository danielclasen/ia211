


<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>


<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Support - VersionR
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
</asp:Content>


<asp:Content ID="Content3" ContentPlaceHolderID="PageTitle" runat="server">
Support
</asp:Content>


<asp:Content ID="Content4" ContentPlaceHolderID="PageSubTitle" runat="server">
Ihre aktuelle Supportfälle
</asp:Content>


<asp:Content ID="Content5" ContentPlaceHolderID="SidebarContent" runat="server">
<% Html.RenderPartial("AccountSidebar"); %>
</asp:Content>

