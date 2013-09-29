<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<VersionR.Models.Role>" %>
<%@ Import Namespace="VersionR.Helpers" %>

        <table class="table table-bordered table-condensed">
            <thead>
                <tr>
                    <th>User-ID</th>
                    <th>Benutzername</th>
                    <th>E-Mail</th>
                    <th>Telefon</th>
                </tr>
            </thead>
            <tbody>

       <% foreach (var user in Model.Users)
           { %>
           
               <tr>
                    <td><%: user.UId %></td>
                    <td><%: user.NickName %></td>
                    <td><%: user.EMail %></td>
                    <td><%: user.Phone %></td>
                </tr>
        
        <% } %>
        
            </tbody>
        </table>