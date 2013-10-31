<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<VersionR.Models.Module>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Index
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div id="total-downloads-bar">
    </div>
    <script>

         var DataObject = new Object();
         var ColorArray = new Array();
         var KeyArray = new Array();
         var LabelArray = new Array();

         DataObject["y"] = "Downloads Gesamt";

        <%
            var counter = 0;
            var sortedList = Model.Where(m=>m.GetTotalDownloads()>0).OrderByDescending(m => m.GetTotalDownloads());
        foreach (var item in sortedList)
        {
            counter++;
%>

        DataObject["<%: counter %>"] = "<%: item.GetTotalDownloads().ToString() %>";
        ColorArray.push("#<%: item.GetRgbColor().ToString() %>");
        KeyArray.push("<%: counter.ToString() %>");
        LabelArray.push("<%: item.Name %>");

        <% } %>

        Morris.Bar({
            element: 'total-downloads-bar',
            data: [
                DataObject
            ],
            xkey: 'y',
            ykeys: KeyArray,
            labels: LabelArray,
            hideHover : 'auto',
            barColors : ColorArray
        });
    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PageTitle" runat="server">
    Auswertung
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="PageSubTitle" runat="server">
    Alle Module nach Downloads
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="SidebarContent" runat="server">
    <% Html.RenderPartial("AdminSidebar"); %>
</asp:Content>