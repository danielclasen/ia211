<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<VersionR.Models.Download>>" %>
<%@ Import Namespace="System.Globalization" %>
<%@ Import Namespace="VersionR.Helpers" %>
<% if (Model.Any())
   {%>
<table class="table table-bordered table-condensed">
    <thead>
        <tr>
            <th>
                Modul
            </th>
            <th>
                Version
            </th>
            <th>
                Heruntergeladen am
            </th>
        </tr>
    </thead>
    <tbody>
        <% foreach (var item in Model)
           { %>
        <tr>
            <td>
                <%: Html.ActionLink(item.Version.Module.Name, "Details", "Module", new { id = item.Version.Module.ModId }, new { })%>
            </td>
            <td>
                <a href="<%= Url.Action("Details", "Version", new {id = item.VrId}) %>" title="Version anzeigen">
                    <%: item.Version.Release %>.<%: item.Version.SubRelease %>.<%: item.Version.BuildId %></a>
            </td>
            <td>
                <%: item.DlDate.ToString("d", CultureInfo.CreateSpecificCulture("de-DE"))%>
            </td>
        </tr>
        <% } %>
    </tbody>
</table>
<% }
   else
   { %>
<small>Noch keine Downloads aufgezeichnet.</small>
<% } %>