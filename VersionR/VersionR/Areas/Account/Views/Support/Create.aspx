


<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>


<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Ein Problem melden - VersionR
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

</asp:Content>


<asp:Content ID="Content3" ContentPlaceHolderID="PageTitle" runat="server">
Ein Problem melden
</asp:Content>


<asp:Content ID="Content4" ContentPlaceHolderID="PageSubTitle" runat="server">
Wir helfen ihnen gerne!
</asp:Content>


<asp:Content ID="Content5" ContentPlaceHolderID="SidebarContent" runat="server">
<% Html.RenderPartial("AccountSidebar"); %>
</asp:Content>

