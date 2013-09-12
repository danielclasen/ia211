<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>
<%
    if (Request.IsAuthenticated) {
%>
        Willkommen <b><%: Page.User.Identity.Name %></b>!
        [ <%: Html.ActionLink("Abmelden", "LogOff", "Account") %> ]
<%
    }
    else {
%> 
        [ <%: Html.ActionLink("Anmelden", "LogOn", "Account") %> ]
<%
    }
%>
