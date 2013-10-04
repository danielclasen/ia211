﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<VersionR.Models.Module>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Modules
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
                <th>
                </th>
            </tr>
        </thead>
        <tbody>
            <% foreach (var item in Model)
               { %>
            <tr>
                <td>
                    <%: item.ModId %>
                </td>
                <td>
                    <%: Html.ActionLink(item.Name, "DetailsModule", new { id = item.ModId })%>
                </td>
                <td>
                    <%: String.Format("{0:F}", item.PricePerYear) %>
                    €
                </td>
                <td>
                    to be added...
                </td>
                <td class="span3">
                    <div class="btn-group">
                        <%: Html.ActionLink("Details", "DetailsModule", new { id=item.ModId }, new { @class = "btn" })%>
                        <%: Html.ActionLink("Bearbeiten", "EditModule", new { id=item.ModId }, new { @class = "btn" }) %>
                        <%: Html.ActionLink("Löschen", "DeleteModule", new { id=item.ModId }, new { @class = "btn btn-danger" })%>
                    </div>
                </td>
            </tr>
            <% } %>
        </tbody>
    </table>
    <%: Html.ActionLink("Neues Modul anlegen", "CreateModule", ViewContext.RouteData.Values["Controller"].ToString() /*Controller*/, new { }, new { @class = "btn btn-primary" }) %>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PageTitle" runat="server">
    Modulverwaltung
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="PageSubTitle" runat="server">
    Fügen Sie neue Module hinzu oder bearbeiten Sie bestehende.
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="SidebarContent" runat="server">
    <% Html.RenderPartial("AdminSidebar"); %>
</asp:Content>