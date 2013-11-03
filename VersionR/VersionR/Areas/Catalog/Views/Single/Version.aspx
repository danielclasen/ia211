<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<VersionR.Models.Version>" %>

<%@ Import Namespace="System.Globalization" %>
<%@ Import Namespace="VersionR.Helpers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Module
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table class="table table-bordered">
        <thead>
            <tr>
                <th>
                    Bezeichnung
                </th>
                <th>
                    Lizenzgebühren pro Jahr
                </th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>
                    <%: Model.Module.Name %>
                </td>
                <td>
                    <%:  Model.Module.PricePerYear.ToString("c", CultureInfo.CreateSpecificCulture("de-DE"))%>
                </td>
            </tr>
        </tbody>
    </table>
    <h2>
        Beschreibung</h2>
    <p style="text-align: justify">
        Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod
        tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero
        eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea
        takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur
        sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna
        aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et
        ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor
        sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy
        eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua.<br />
        <br />
        At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren,
        no sea takimata sanctus est Lorem ipsum dolor sit amet. Duis autem vel eum iriure
        dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore
        eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui
        blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi.<br />
        Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh
        euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad
        minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip
        ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate
        velit esse molestie consequat, vel illum dolore.
    </p>
    <h3>
        Alte Version
        <%: Model.GetVersionString() %>
    </h3>
    <h5>
        Erschienen am: <small>
            <%: Model.ReleaseDate.ToString("d", CultureInfo.CreateSpecificCulture("de-DE"))%></small>
        Platform: <small>
            <%: Model.Platform%></small>
    </h5>
    <h5>
        Beschreibung / Changelog:</h5>
    <p>
        <%: Model.Description%>
    </p>
    <div class="btn-group">
        <%: Html.ActionLink("Zurück zum Modulkatalog", "Index", new { }, new { @class = "btn" })%>
        <% if (Model.Module.Customer_Modules.All(cm => cm.User.EMail != User.Identity.Name))
           {%>
        <a href="#" class="btn btn-success disabled hoverPopUp" data-placement="right" title="Kaufen deaktiviert.">
            Lizenz erwerben</a>
        <% }
           else
           { %>
        <a href="<%= Url.Action("Download", "Version", new {id = Model.VrId, area="Account"}) %>"
            class="btn btn-success" title="Download"><i class="icon-download-alt"></i>&nbsp;Aktuelle
            Version
            <%:Model.GetVersionString()%>
            herunterladen!</a>
        <% } %>
    </div>
    <script type="text/javascript">
        $('.hoverPopUp').tooltip();
    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PageTitle" runat="server">
    Details des Moduls "<%: Model.Module.Name%>" in Version
    <%: Model.GetVersionString() %>.
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="PageSubTitle" runat="server">
    Sehen Sie hier alle Informationen zu dem Software-Modul ein.
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="SidebarContent" runat="server">
    <% Html.RenderPartial("VersionSidebar", Model.Module.Versions); %>
</asp:Content>