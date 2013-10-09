<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<VersionR.Models.Module>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    DetailsModule
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table class="table table-bordered">
        <thead>
            <tr>
                <th>
                    ID
                </th>
                <th>
                    Modulname
                </th>
                <th>
                    Jährliche Lizenz-Gebühren
                </th>
                <th>
                    Aktuelle Version
                </th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>
                    <%: Model.ModId %>
                </td>
                <td>
                    <%: Model.Name %>
                </td>
                <td>
                    <%: String.Format("{0:F}", Model.PricePerYear) %>
                    €
                </td>
                <td>
                    to be added...
                </td>
            </tr>
        </tbody>
    </table>
    <div class="row-fluid">
        <div class="span6 well well-small">
            <h3>
                Modul-Versionen <a href="<%= Url.Action("Add", "Version", new {id = Model.ModId}) %>"
                    class="btn btn-success pull-right"><i class="icon-plus" title="Hinzufügen"></i>
                </a>
            </h3>
            <% Html.RenderPartial("Module_VersionsList", Model.Versions.OrderByDescending(v => v.Release + v.SubRelease + v.BuildId)); %>
        </div>
        <div class="span6 well well-small">
            <h3>
                Downloads nach Version</h3>
            <div id="donut-dl-version" style="width: 200px; height: 200px; display: block;">
            </div>
            <script>
                Morris.Donut({
                    element: 'donut-dl-version',
                    data: [
                            { label: "1.0.441-alpha", value: 12 },
                            { label: "2.0.441-nightly", value: 38 },
                            { label: "4.0.661 RC1", value: 50 }
                          ],
                    formatter: function (y) { return y + "%" }
                });
            </script>
        </div>
    </div>
    <div class="btn-group">
        <%: Html.ActionLink("Zurück zur Übersicht", "List", new { }, new { @class = "btn" })%>
        <%: Html.ActionLink("Modul bearbeiten", "Edit", new { id = Model.ModId }, new { @class = "btn btn-primary" })%>
        <%: Html.ActionLink("Modul löschen", "Delete", new { id = Model.ModId }, new { @class = "btn btn-danger" })%>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PageTitle" runat="server">
    Modulverwaltung
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="PageSubTitle" runat="server">
    Modul "<%: Model.Name %>".
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="SidebarContent" runat="server">
    <% Html.RenderPartial("AdminSidebar"); %>
</asp:Content>