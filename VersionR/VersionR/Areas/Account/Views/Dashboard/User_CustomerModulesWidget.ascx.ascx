<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<VersionR.Models.Customer_Modules>>" %>
<%@ Import Namespace="System.Globalization" %>
<% if (Model.Any())
   {%>
<table class="table table-bordered">
    <thead>
        <tr>
            <th>
                Modul
            </th>
            <th>
                Ihre Version
            </th>
            <th>
                Gültig bis
            </th>
        </tr>
    </thead>
    <tbody>
        <% foreach (var item in Model)
           { %>
        <tr>
            <td>
                <%: item.Module.Name %>
            </td>
            <td>
                <% var currentModuleVersionList = item.Module.Versions.OrderByDescending(v => v.Release + v.SubRelease + v.BuildId);
                   var lastDownloadedVersions = item.User.Downloads.Where(
                       d => d.Version.Module.ModId == item.Module.ModId).OrderByDescending(
                           v => v.Version.Release + v.Version.SubRelease + v.Version.BuildId);

                   if (lastDownloadedVersions.Any())
                   {
                       var lastDownloadedUserVersion = lastDownloadedVersions.First().Version;
                %>
                <%
                               if (currentModuleVersionList.Any())
                               {
                                   var currentModuleVersion = currentModuleVersionList.First();
                                   if (currentModuleVersion.Release > lastDownloadedUserVersion.Release ||
                                       currentModuleVersion.SubRelease > lastDownloadedUserVersion.SubRelease)
                                   {%>
                <a class="text-error" href="<%= Url.Action("Download", "Version", new {id = lastDownloadedUserVersion.VrId}) %>">
                    <label class="label label-important" title="Eine neue Haupt-Version ist verfügbar!">
                        <i class="icon-chevron-up"></i>
                    </label>
                    <% }
                                   else if (currentModuleVersion.BuildId != lastDownloadedUserVersion.BuildId)
                                   { %>
                    <a class="text-warning" href="<%= Url.Action("Download", "Version", new {id = lastDownloadedUserVersion.VrId}) %>">
                        <label class="label label-warning" title="Eine neue Zwischen-Version ist verfügbar!">
                            <i class="icon-chevron-up"></i>
                        </label>
                        <% }
                                   else
                                   { %>
                        <a class="text-success" href="<%= Url.Action("Download", "Version", new {id = lastDownloadedUserVersion.VrId}) %>">
                            <label class="label label-success" title="Sie verwenden die aktuellste Version! Erneut herunterladen.">
                                <i class="icon-ok"></i>
                            </label>
                            <% } %>
                            <% }
                               else
                               { %>
                            <a>
                                <% } %>
                                <%: lastDownloadedUserVersion.Release %>.<%: lastDownloadedUserVersion.SubRelease %>.<%: lastDownloadedUserVersion.BuildId %>
                            </a>
                            <% }
                           else
                           { %>
                            <a class="text-error" href="<%= Url.Action("Details", "Module", new {id = item.Module.ModId }) %>">
                                <label class="label label-important" title="Laden Sie jetzt die aktuellste Version herunter!">
                                    <i class="icon-remove"></i>
                                </label>
                                Keine </a>
                            <% } %>
            </td>
            <td>
                <%: item.ExpiryDate.ToString("d", CultureInfo.CreateSpecificCulture("de-DE")) %>
            </td>
        </tr>
        <% } %>
    </tbody>
</table>
<% }
   else
   {%>
<small>Sie haben noch keine Modul-Lizenzen erworben.</small>
<% } %>