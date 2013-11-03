<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<PagedList.IPagedList<VersionR.Models.Module>>" %>
<div class="pagination">
    <ul>
        <% if (Model.HasPreviousPage)
           { %>
        <li>
            <%: Html.ActionLink("Vorherige Seite","Page",new {area = "Catalog", id=Model.PageNumber-1}) %></li>
        <% }
           else
           { %>
        <li class="disabled"><a href="#">Vorherige Seite</a></li>
        <% } %>
        <li><a href="#">Seite
            <%: Model.PageNumber %>
            von
            <%: Model.PageCount %></a></li>
        <% if (Model.HasNextPage)
           { %>
        <li>
            <li>
                <%: Html.ActionLink("Nächste Seite","Page",new {area = "Catalog", id=Model.PageNumber+1}) %>
            </li>
            <% }
           else
           { %>
            <li class="disabled"><a href="#">Nächste Seite</a></li>
            <% } %>
    </ul>
</div>