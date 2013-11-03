<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>
<ul class="nav nav-list">
    <li class="nav-header hoverPopUp" data-placement="right" title="Hier könnte die Liste nach den entsprechenden Kriterien sortiert werden.">
        Sortierung</li>
    <li class="hoverPopUp active" data-placement="right" title="Sortierung deaktiviert.">
        <a href="#">Nach Alphabet</a></li>
    <li class="hoverPopUp" data-placement="right" title="Sortierung deaktiviert."><a
        href="#">Nach Aktualität</a></li>
    <li class="hoverPopUp" data-placement="right" title="Sortierung deaktiviert."><a
        href="#">Nach Lizenzkosten</a></li>
</ul>
<script type="text/javascript">
    $('.hoverPopUp').tooltip();
</script>