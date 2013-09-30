<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<VersionR.Models.Role>" %>
<%@ Import Namespace="VersionR.Helpers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	EditRole
</asp:Content>


<asp:Content ID="Content3" ContentPlaceHolderID="PageTitle" runat="server">
Rechteverwaltung
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="PageSubTitle" runat="server">
Hier können Sie die Rolle "<%: Model.Name %>" bearbeiten
</asp:Content>


<asp:Content ID="Content5" ContentPlaceHolderID="SidebarContent" runat="server">
<% Html.RenderPartial("AdminSidebar"); %>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <% Html.BeginForm("EditRole", "Admin", FormMethod.Post, new { @class = "form-horizontal" }); %>
        <%: Html.ValidationSummary(true) %>
        

        <div class="control-group">
            <%: Html.BootstrapLabelFor(m => m.Name, "Bezeichnung")%>
            <div class="controls">
            <%: Html.TextBoxFor(model => model.Name) %>
            <%: Html.ValidationMessageFor(model => model.Name) %>
            </div>
        </div>
                    

            
        
        <div class="control-group">
            <label class="control-label">Aktion</label>
            <div class="controls">
            <div class="btn-group">        
                <button class="btn" type="reset" value="">Zurücksetzen</button>
                <button type="submit" class="btn btn-primary" value="Edit">Rolle speichern</button>
            </div>
            <%: Html.ActionLink("Rolle " + Model.Name + " löschen", "DeleteRole", "Admin", new { id = Model.RId }, new { @class = "btn btn-danger" })%>
            </div>
        </div>



    <% Html.EndForm(); %>

    <%: Html.ActionLink("Zurück zur Übersicht", "Roles", "Admin", new { }, new { @class = "btn" })%> 

</asp:Content>

