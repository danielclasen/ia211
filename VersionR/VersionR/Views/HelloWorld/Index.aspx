<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<%@ Import Namespace="VersionR.Helpers.BootstrapMvcHelpers.Enums" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Index
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        Index</h2>
    <% var navbarRight = new List<VersionR.Helpers.BootstrapMvcHelpers.Shared.MenuItem>();

       if (Context.User.IsInRole("Administrator"))
           navbarRight.Add(Html.MenuItem("Admin", "Index", "Admin"));
       if (Context.User.Identity.IsAuthenticated)
       {
           navbarRight.Add(Html.MenuItem("Logout", "LogOff", "Auth"));
       }
       else
       {
           navbarRight.Add(Html.MenuItem("Login", "LogOn", "Auth"));
       }
    %>
    <%:Html.NavBar(navbarRight, BrandPosition.Start, NavBarDisplay.Normal, NavBarPosition.Top)%>
</asp:Content>