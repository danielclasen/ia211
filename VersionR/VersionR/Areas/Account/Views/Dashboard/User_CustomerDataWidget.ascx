<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<VersionR.Models.User>" %>
<%@ Import Namespace="VersionR.Helpers" %>
<table class="table table-bordered table-condensed">
    <thead>
        <tr>
            <th>
                Kunden-Nr.
            </th>
            <th>
                Benutzername
            </th>
            <th>
                E-Mail Adresse
            </th>
            <th>
                Telefon
            </th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>
                <%: Model.UId %>
            </td>
            <td>
                <%: Model.NickName %>
            </td>
            <td>
                <%: Model.EMail %>
            </td>
            <td>
                <%: Model.Phone %>
            </td>
        </tr>
    </tbody>
</table>