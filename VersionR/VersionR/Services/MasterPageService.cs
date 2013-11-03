using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using VersionR.Models;
using Version = VersionR.Models.Version;

namespace VersionR.Services
{
    public class DataForMasterPageAttribute : ActionFilterAttribute
    {
        private readonly VersionR.Models.VersionR _db = new VersionR.Models.VersionR();
        private readonly DAL.Repositories _repos = new DAL.Repositories();

        public override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            // Optional: Work only for authenticated users
            if (!filterContext.RequestContext.HttpContext.User.Identity.IsAuthenticated)
                return;

            // Optional: Work only for GET request
            if (filterContext.RequestContext.HttpContext.Request.RequestType != "GET")
                return;

            // Optional: Do not work with AjaxRequests
            if (filterContext.RequestContext.HttpContext.Request.IsAjaxRequest())
                return;

            var currentUser =
                _db.Users.Single(
                    u => u.EMail == filterContext.RequestContext.HttpContext.User.Identity.Name);

            var downloadRepository = _repos.DownloadRepository;
            var moduleRepository = _repos.ModuleRepository;

            var notificationList = new List<UserNotification>();

            foreach (var customerModule in currentUser.Customer_Modules)
            {
                try
                {
                    var currentModule = customerModule.Module;
                    var latestVersion = currentModule.GetLatestVersion();
                    var userVersion = new Version();

                    var userModuleDownloads = currentUser.Downloads.Where(d => d.Version.Module == currentModule)
                        .OrderByDescending(
                            du => du.Version.Release + du.Version.SubRelease + du.Version.BuildId);

                    if (userModuleDownloads.Any())
                    {
                        userVersion = userModuleDownloads.First().Version;
                    }

                    if (latestVersion.IsGreater(userVersion))
                    {
                        notificationList.Add(new UserNotification(new NewVersionNotificationType(),
                                                                  "Die Version " +
                                                                  latestVersion.Release + "." + latestVersion.SubRelease +
                                                                  "." + latestVersion.BuildId
                                                                  + " von " + latestVersion.Module.Name +
                                                                  " ist verfügbar!",
                                                                  latestVersion.VrId));
                    }
                }
                catch (InvalidOperationException e)
                {
                    Console.Out.Write(e.Message);
                }
            }

            filterContext.Controller.TempData["UserNotification"] = notificationList;
            //throw new Exception(notificationList.Count.ToString());
        }
    }

    public interface IUserNotificationType
    {
        string IconClass { get; set; }

        string Action { get; set; }

        string Controller { get; set; }

        string Area { get; set; }
    }

    public class DefaultNotificationType : IUserNotificationType
    {
        public string IconClass { get; set; }

        public string Action { get; set; }

        public string Controller { get; set; }

        public string Area { get; set; }
    }

    public class NewVersionNotificationType : DefaultNotificationType
    {
        public NewVersionNotificationType()
        {
            IconClass = "icon-upload-alt";
            Action = "Version";
            Controller = "Single";
            Area = "Catalog";
        }
    }

    public class UserNotification
    {
        public IUserNotificationType Type { get; set; }

        public string Text { get; set; }

        public int Id { get; set; }

        public UserNotification(IUserNotificationType type, string text, int id = 0)
        {
            Type = type;
            Text = text;
            Id = id;
        }
    }
}