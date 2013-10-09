<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<VersionR.Models.Download>>" %>
<%@ Import Namespace="System.Globalization" %>
<div id="version-download-graph" style="max-height: 200px;">
</div>
<script type="text/javascript">
    var VersionDownloadGraphData = new Array();
    <% var groupedList = Model.GroupBy(d => d.DlDate.Date).Select(g=> new {Id = g.Key, Count = g.Count()}).ToList();
        foreach (var item in groupedList)
        {%>
            VersionDownloadGraphData.push({ y: '<%: item.Id.Date.ToUniversalTime().ToString("o",CultureInfo.CreateSpecificCulture("de-DE")) %>', x: <%: item.Count %> });
     <% } %>

    Morris.Line({
        element: 'version-download-graph',
        data: VersionDownloadGraphData,
        xkey: 'y',
        ykeys: ['x'],
        labels: ['Downloads'],
        xLabelFormat:function(x) {
           var date = new Date(x);
           return date.getDate()+"."+date.getMonth()+"."+date.getFullYear();
        },
        dateFormat: function (x) {
            var date = new Date(x);
            return date.getDate()+"."+date.getMonth()+"."+date.getFullYear();
        }
    });
</script>