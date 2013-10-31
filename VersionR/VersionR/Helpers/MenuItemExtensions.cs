using System;
using System.Web.Mvc;
using System.Web.Mvc.ExpressionUtil;
using System.Web.Mvc.Html;
using System.Web.RegularExpressions;
using System.Web.Routing;

namespace VersionR.Helpers
{
    public static class MenuItemExtensions
    {
        public static MvcHtmlString MenuItem(this HtmlHelper htmlHelper, string text, string action, string controller)
        {
            var li = GenerateLi(htmlHelper, text, action, controller);
            li.InnerHtml = htmlHelper.ActionLink(text, action, controller).ToHtmlString();
            return MvcHtmlString.Create(li.ToString());
        }

        public static MvcHtmlString MenuItem(this HtmlHelper htmlHelper, string text, string action, string controller,
                                             string areaName)
        {
            var routeValues = new { area = areaName };
            var li = GenerateLi(htmlHelper, text, action, controller, areaName);
            string id = text.Replace(" ", "").ToLower() + "MenuItem";
            li.InnerHtml = htmlHelper.ActionLink(text, action, controller, routeValues, new { id=id}).ToHtmlString();
            return MvcHtmlString.Create(li.ToString());
        }

        public static MvcHtmlString MenuItem(this HtmlHelper htmlHelper, string text, string icon, int iconSize, string action, string controller,
                                             string areaName)
        {
            string ret = MenuItem(htmlHelper, text, action, controller, areaName).ToString();

            string[] parts = System.Text.RegularExpressions.Regex.Split(ret, text);

            if (parts != null && parts.Length > 1)
            {
                ret = parts[0];
                ret += string.Format("<i class='icon icon-{0} icon-{1}x'></i> ", icon, iconSize.ToString());
                ret += text;
                ret += parts[1];
            }
            return MvcHtmlString.Create(ret);
        }
        private static TagBuilder GenerateLi(this HtmlHelper htmlHelper, string text, string action, string controller,
                                             string areaName = "")
        {
            var li = new TagBuilder("li");
            var routeData = htmlHelper.ViewContext.RouteData;

            var currentAction = routeData.GetRequiredString("action");
            var currentController = routeData.GetRequiredString("controller");
            var currentArea = routeData.DataTokens["area"] != null ? routeData.DataTokens["area"].ToString() : "";

            if (
                (string.Equals(currentAction, action, StringComparison.OrdinalIgnoreCase) &&
                 string.Equals(currentController, controller, StringComparison.OrdinalIgnoreCase) &&
                 string.Equals(currentArea, areaName, StringComparison.OrdinalIgnoreCase)) ||
                (string.Equals(action, "Index", StringComparison.OrdinalIgnoreCase) &&
                 string.Equals(controller, "Home", StringComparison.OrdinalIgnoreCase) &&
                 string.Equals(currentArea, areaName, StringComparison.OrdinalIgnoreCase) &&
                 !string.Equals(currentArea, "", StringComparison.OrdinalIgnoreCase)))
            {
                li.AddCssClass("active");
            }
            return li;
        }
    }
}