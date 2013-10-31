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
            li.InnerHtml = htmlHelper.ActionLink(text, action, controller, routeValues, new { }).ToHtmlString();
            return MvcHtmlString.Create(li.ToString());
        }

        private static TagBuilder GenerateLi(this HtmlHelper htmlHelper, string text, string action, string controller,
                                             string areaName = "")
        {
            var li = new TagBuilder("li");
            var routeData = htmlHelper.ViewContext.RouteData;
            var currentAction = routeData.GetRequiredString("action");
            var currentController = routeData.GetRequiredString("controller");
            var currentArea = routeData.DataTokens["area"] != null ? routeData.DataTokens["area"].ToString() : "";
            if ((string.Equals(currentAction, action, StringComparison.OrdinalIgnoreCase) &&
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