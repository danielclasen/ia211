using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using VersionR.Helpers;
using VersionR.Models;
using VersionR.Services;
using Version = VersionR.Models.Version;

namespace VersionR.Areas.Account.Controllers
{
    [AuthorizeWithNotify]
    [DataForMasterPage]
    public class VersionController : Controller
    {
        private readonly VersionR.Models.VersionR _db = new VersionR.Models.VersionR();
        private readonly DAL.Repositories _repos = new DAL.Repositories();

        //
        // GET: /Account/Version/
        public ActionResult Index()
        {
            return RedirectToAction("Index", "Home", new { area = "Account" });
        }

        public ActionResult Download(int id)
        {
            try
            {
                var version = _db.Versions.Single(v => v.VrId == id);

                if (version.Module.Customer_Modules.Any(cm => cm.User.EMail == User.Identity.Name))
                {
                    return PerformDownload(version);
                }
                else
                {
                    return RedirectToAction("Index", "Home", new { area = "Account" });
                }
            }
            catch (Exception)
            {
                return HandleError404();
            }
        }

        [NonAction]
        private ActionResult PerformDownload(Version version)
        {
            string pfn = Server.MapPath("~/" + version.Filename);

            if (!System.IO.File.Exists(pfn))
            {
                //throw new ArgumentException("Invalid file name or file not exists!");

                return HandleError404();
            }
            var download = new Download
                               {
                                   DlDate = DateTime.Now,
                                   CmId = _db.Users.Single(u => u.EMail == User.Identity.Name).UId,
                                   VrId = version.VrId
                               };
            _db.AddToDownloads(download);
            _db.SaveChanges();
            return new BinaryContentResult
                       {
                           FileName = Path.GetFileName(@pfn),
                           ContentType = "application/octet-stream",
                           Content = System.IO.File.ReadAllBytes(pfn)
                       };
        }

        public RedirectToRouteResult HandleError404()
        {
            TempData["uihint"] = new UiHint("Fehler!",
                                            "Da ist etwas schief gelaufen oder das Element wurde nicht gefunden!",
                                            new { @class = "alert alert-error" });
            return RedirectToAction("Index", "Home", new { area = "Account" });
        }

        public RedirectToRouteResult HandleError()
        {
            TempData["uihint"] = new UiHint("Fehler!",
                                            "Da ist etwas schief gelaufen!",
                                            new { @class = "alert alert-error" });
            return RedirectToAction("Index", "Home", new { area = "Account" });
        }
    }
}