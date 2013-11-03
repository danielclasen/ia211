<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<PagedList.IPagedList<VersionR.Models.Module>>" %>

<%@ Import Namespace="System.Globalization" %>
<%@ Import Namespace="VersionR.Helpers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Page
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <% foreach (var item in Model)
       { %>
    <div class="media">
        <div class="pull-left">
            <div style="width: 40px; height: 40px; padding: 10px 12px; border: 1px solid #CCCCCC;
                background-color: #efefef; color: #999">
                <i class="icon icon-puzzle-piece icon-3x"></i>
            </div>
        </div>
        <div class="media-body">
            <h4 class="media-heading">
                <%: Html.ActionLink(item.Name,"Module","Single",new {id=item.ModId}, new {}) %>
                <small>
                    <%: item.PricePerYear.ToString("c", CultureInfo.CreateSpecificCulture("de-DE"))%>
                    pro Jahr</small>
                <% if (item.Customer_Modules.Any(cm => cm.User.EMail == User.Identity.Name))
                   {
                       var customerModule = item.Customer_Modules.First(cm => cm.User.EMail == User.Identity.Name); %>
                <a href="<%: Url.Action("Module","Single", new {id=item.ModId}) %>">
                    <label class="label label-success pull-right">
                        <i style="color: white; margin-right: 5px;" class="icon icon-ok"></i>erworben am
                        <%: customerModule.BuyDate.ToString("d", CultureInfo.CreateSpecificCulture("de-DE"))%>
                    </label>
                </a>
                <% } %>
            </h4>
            Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod
            tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero
            eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea
            takimata sanctus est Lorem ipsum dolor sit amet.
        </div>
    </div>
    <hr />
    <% } %>
    <p>
        <% Html.RenderPartial("Pager", Model); %>
    </p>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PageTitle" runat="server">
    Modulkatalog
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="PageSubTitle" runat="server">
    Durchstöbern Sie hier den Katalog aller Software-Module.
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="SidebarContent" runat="server">
    <% Html.RenderPartial("CatalogSidebar"); %>
</asp:Content>