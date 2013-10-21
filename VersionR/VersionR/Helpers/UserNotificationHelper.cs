using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Policy;
using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.Html;
using System.Web.Routing;
using VersionR.Services;

namespace VersionR.Helpers
{
    public static class UserNotificationHelper
    {
        public static MvcHtmlString UserNotification(this HtmlHelper htmlHelper,
                                                     IEnumerable<UserNotification> userNotificationList)
        {
            try
            {
                var userNotifications = userNotificationList as List<UserNotification> ?? userNotificationList.ToList();
                if (userNotifications.Any())
                {
                    var urlHelper = new UrlHelper(htmlHelper.ViewContext.RequestContext);
                    var drawer = BuildNavbarItem(userNotifications.Count());
                    string toggle =
                        "<a id='notification-drop' href='#' class='dropdown-toggle' data-toggle='dropdown'>" +
                        "<span class='badge badge-important'>" +
                        userNotifications.Count +
                        "</span>" +
                        "</a>";
                    var menu = new TagBuilder("ul");
                    menu.AddCssClass("dropdown-menu fade in");
                    menu.Attributes.Add(new KeyValuePair<string, string>("aria-labelledby", "notification-drop"));
                    menu.Attributes.Add(new KeyValuePair<string, string>("role", "menu"));

                    foreach (var userNotification in userNotifications)
                    {
                        var entry = new TagBuilder("li");
                        var entryIcon = "<i class='" + userNotification.Type.IconClass + "'></i> ";
                        var entryLink = "<a href='" +
                                        urlHelper.Action(userNotification.Type.Action,
                                                         userNotification.Type.Controller,
                                                         new
                                                             {
                                                                 id = userNotification.Id
                                                             }) + "' >" + entryIcon +
                                        userNotification.Text +
                                        "</a>";
                        entry.InnerHtml = entryLink;
                        menu.InnerHtml += entry;
                    }

                    drawer.InnerHtml = toggle + menu;

                    return MvcHtmlString.Create(drawer.ToString());
                }
                else
                {
                    return MvcHtmlString.Create(string.Empty);
                }
            }
            catch (Exception)
            {
                return MvcHtmlString.Create(string.Empty);
            }
        }

        private static TagBuilder BuildNavbarItem(int count)
        {
            var drawer = new TagBuilder("li");
            drawer.AddCssClass("dropdown droponhover");
            return drawer;
        }
    }
}