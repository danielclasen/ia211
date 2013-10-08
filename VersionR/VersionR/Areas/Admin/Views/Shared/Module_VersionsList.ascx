<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<VersionR.Models.Version>>" %>
<%@ Import Namespace="System.Globalization" %>
<%@ Import Namespace="VersionR.Helpers" %>
<table class="table table-bordered table-condensed">
    <thead>
        <tr>
            <th>
                Version
            </th>
            <th>
                Plattform
            </th>
            <th>
                Release Datum
            </th>
            <th>
                Erstellt von
            </th>
            <th>
            </th>
        </tr>
    </thead>
    <tbody>
        <% foreach (var item in Model)
           { %>
        <tr>
            <td>
                <a href="<%= Url.Action("Details", "Version", new {id = item.VrId}) %>" title="Details anzeigen">
                    <%: item.Release %>.<%: item.SubRelease %>.<%: item.BuildId %>
                </a>
            </td>
            <td>
                <%: item.Platform %>
            </td>
            <td>
                <% if (item.ReleaseDate.Date > DateTime.Now.Date)
                   { %>
                <span class="label label-important" title="Ausstehend"><i class="icon-coffee"></i>
                </span><span class="text-error">
                    <%: item.ReleaseDate.ToString("d", CultureInfo.CreateSpecificCulture("de-DE")) %></span>
                <% }
                   else
                   { %>
                <span class="label label-success" title="Veröffentlicht"><i class="icon-ok"></i>
                </span><span class="text-success">
                    <%: item.ReleaseDate.ToString("d", CultureInfo.CreateSpecificCulture("de-DE")) %></span>
                <% } %>
            </td>
            <td>
                <%: Html.ActionLink(item.User.NickName, "Details", "User", new { id = item.User.UId }, new{})%>
            </td>
            <td style="text-align: center;">
                <div class="btn-group">
                    <a href="/<%: item.Filename %>" class="btn btn-white" title="Download"><i class="icon-download-alt">
                    </i></a><a href="<%= Url.Action("Edit", "Version", new {id = item.VrId}) %>" class="btn btn-white"
                        title="Bearbeiten"><i class="icon-wrench"></i></a><a href="<%= Url.Action("Delete", "Version", new {id = item.VrId}) %>"
                            class="btn btn-danger" title="Löschen"><i class="icon-trash"></i></a>
                </div>
            </td>
        </tr>
        <% } %>
    </tbody>
</table>