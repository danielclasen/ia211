<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<VersionR.Models.Customer_Modules>>" %>
<%@ Import Namespace="System.Globalization" %>
<% if (Model.Any())
   { %>
<table class="table table-bordered table-condensed">
    <thead>
        <tr>
            <th>
            </th>
            <th>
                Modul
            </th>
            <th>
                Von
            </th>
            <th>
                Bis
            </th>
            <th>
            </th>
        </tr>
    </thead>
    <tbody>
        <% foreach (var moduleLicense in Model)
           { %>
        <tr>
            <td style="text-align: center">
                <% if (moduleLicense.ExpiryDate >= DateTime.Now)
                   {%>
                <i class="icon-circle text-success"></i>
                <% }
                   else
                   {%>
                <abbr title="Abgelaufen">
                    <i class="icon-circle text-error"></i>
                </abbr>
                <% } %>
            </td>
            <td>
                <%: moduleLicense.Module.Name %>
            </td>
            <td>
                <%: moduleLicense.BuyDate.ToString("d", CultureInfo.CreateSpecificCulture("de-DE")) %>
            </td>
            <td>
                <%: moduleLicense.ExpiryDate.ToString("d", CultureInfo.CreateSpecificCulture("de-DE")) %>
            </td>
            <td style="text-align: center;">
                <div class="btn-group">
                    <a href="<%= Url.Action("Edit", "License", new {id = moduleLicense.OrderId}) %>"
                        class="btn"><i class="icon-wrench" title="Bearbeiten"></i></a><a href="<%= Url.Action("Extend", "License", new {id = moduleLicense.OrderId}) %>"
                            class="btn" title="Verlängern"><i class="icon-resize-full"></i></a><a href="<%= Url.Action("Delete", "License", new {id = moduleLicense.OrderId}) %>"
                                class="btn btn-danger" title="Löschen"><i class="icon-trash"></i></a>
                </div>
            </td>
        </tr>
        <% } %>
    </tbody>
</table>
<small><i class="icon-circle text-success"></i>=Gültig, <i class="icon-circle text-error">
</i>=Abgelaufen </small>
<% }
   else
   { %>
<small>Noch keine Modul-Lizenzen hinzugefügt.</small>
<% } %>