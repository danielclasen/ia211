<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<VersionR.Models.User>" %>

<%@ Import Namespace="VersionR.Helpers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Kundenbereich - VerionR
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row-fluid">
        <div class="span6 well well-small">
            <h3>
                Kundendaten <a href="<%= Url.Action("Edit", "User") %>" class="btn btn-white pull-right"
                    title="Bearbeiten"><i class="icon-wrench"></i></a>
            </h3>
            <% Html.RenderPartial("User_CustomerDataWidget", Model); %>
        </div>
        <div class="span6 well well-small">
            <h3>
                Lizenzübersicht <small>1 bis 5 von 5</small> <a href="<%= Url.Action("List", "Licence") %>"
                    class="btn btn-white pull-right" title="Alle anzeigen"><i class="icon-expand-alt">
                    </i></a>
            </h3>
            <% Html.RenderPartial("User_CustomerModulesWidget.ascx", Model.Customer_Modules); %>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PageTitle" runat="server">
    Kundenbereich
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="PageSubTitle" runat="server">
    Willkommen in Ihrem personalisiertem VersionR,
    <%: Model.NickName %>!
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="SidebarContent" runat="server">
    <% Html.RenderPartial("AccountSidebar"); %>
</asp:Content>