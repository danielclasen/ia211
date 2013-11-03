<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<VersionR.Models.Version>>" %>
<%@ Import Namespace="System.Globalization" %>
<%@ Import Namespace="VersionR.Helpers" %>
<ul class="nav nav-list">
    <li class="nav-header">Versionshistorie</li>
    <%
        var sortedList = Model.OrderByDescending(v => v.Release + v.SubRelease + v.BuildId);
        foreach (var item in sortedList)
        {%>
    <% if (item.IsNewest())
       {%>
    <%: Html.MenuItem(item.GetVersionString() + " (" + item.ReleaseDate.ToString("d", CultureInfo.CreateSpecificCulture("de-DE"))+")", "Module", "Single", "Catalog", item.ModId)%>
    <% }
       else
       {%>
    <%: Html.MenuItem(item.GetVersionString() + " (" + item.ReleaseDate.ToString("d", CultureInfo.CreateSpecificCulture("de-DE"))+")", "Version", "Single", "Catalog", item.VrId)%>
    <% } %>
    <% } %>
</ul>