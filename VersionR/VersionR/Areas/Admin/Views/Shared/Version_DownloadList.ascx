<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<VersionR.Models.Download>>" %>
<%@ Import Namespace="System.Globalization" %>
<%@ Import Namespace="VersionR.Helpers" %>
<% if (Model.Any())
   { %>
    <table class="table table-bordered table-condensed">
        <thead>
            <tr>
                <th>
                    Datum
                </th>
                <th>
                    Benutzer
                </th>
            </tr>
        </thead>
        <tbody>
            <% foreach (var item in Model)
               { %>
                <tr>
                    <td>
                        <%: item.DlDate.ToString("d", CultureInfo.CreateSpecificCulture("de-DE")) %>
                    </td>
                    <td>
                        <%: Html.ActionLink(item.User.NickName, "Details", "User", new {id = item.User.UId}, new {}) %>
                    </td>
                </tr>
            <% } %>
        </tbody>
    </table>
<% }
   else
   { %>
    <small>Diese Version wurde noch nie heruntergeladen.</small>
<% } %>