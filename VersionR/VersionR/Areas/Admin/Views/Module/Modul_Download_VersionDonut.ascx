<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<VersionR.Models.Version>>" %>
<%
    var sumDownloads = Model.Sum(v => v.Downloads.Count());
%>
<div id="modul-download-version-donut" style="max-height: 400px; display: block;">
</div>
<script type="text/javascript">
    console.debug(<%: sumDownloads %>);
        var DataArray = new Array();
    <%
        foreach (var item in Model)
        {%>
            DataArray.push({ label: '<%: item.Release %>.<%: item.SubRelease %>.<%: item.BuildId %>', value: <%: ((decimal)((decimal)item.Downloads.Count()/(decimal)sumDownloads)).ToString() %> });
     <% } %>

    Morris.Donut({
        element: 'modul-download-version-donut',
        data: DataArray,
        formatter: function (y) { return (y * 100) + "%"; }
    });
</script>