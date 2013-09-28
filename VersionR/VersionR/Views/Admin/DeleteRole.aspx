<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<VersionR.Models.Role>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	DeleteRole
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">


       <table class="table table-bordered table-condensed">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Bezeichnung</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td><%: Model.RId %></td>
                    <td><%: Model.Name %></td>
                </tr>
            </tbody>
        </table>

        <h3>Betroffene Benutzer</h3><small>Diese Benutzer werden ebenfalls beim Löschen der Rolle entfernt.</small>

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



    <% Html.BeginForm("DeleteRole", "Admin", FormMethod.Post, new { @class = "form-horizontal" }); %>
        <div class="control-group">
            <label class="control-label">Aktion</label>
            <div class="controls">     
                <div class="btn-group">
                    <%: Html.ActionLink("Abbrechen", "Roles", "Admin", new { }, new { @class = "btn" })%> 
                    <button type="submit" class="btn btn-danger" value="Delete">Rolle lsöchen</button>
                </div>               
            </div>
        </div>
    <% Html.EndForm(); %>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="PageTitle" runat="server">
Rolle Löschen
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="PageSubTitle" runat="server">
Sind Sie sicher, dass Sie die Rolle "<%: Model.Name %>" mit all ihren Abhängigkeiten löschen möchten?
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="SidebarContent" runat="server">
<% Html.RenderPartial("AdminSidebar"); %>
</asp:Content>

