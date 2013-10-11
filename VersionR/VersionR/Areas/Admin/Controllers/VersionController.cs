using System;
using System.Collections.Generic;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;
using VersionR.Areas.Admin.ViewModels;
using VersionR.DAL;
using VersionR.Helpers;
using VersionR.Models;
using VersionR.Services;
using Version = VersionR.Models.Version;

namespace VersionR.Areas.Admin.Controllers
{
    [AuthorizeWithNotify(Roles = "Administrator,Supporter")]
    public class VersionController : Controller
    {
        private readonly VersionR.Models.VersionR _db = new VersionR.Models.VersionR();
        private DAL.Repositories _repos = new DAL.Repositories();

        //
        // GET: /Admin/Version/
        public ActionResult Index()
        {
            return View();
        }

        //
        // GET: /Admin/Version/Create
        public ActionResult Add(int id)
        {
            var currentUser = _db.Users.Single(u => u.EMail == User.Identity.Name);
            var currentModule = _db.Modules.Single(m => m.ModId == id);

            var model = new Version();
            model.EmId = currentUser.UId;
            model.User = currentUser;
            model.ModId = id;
            model.Module = currentModule;

            try
            {
                var lastVersion =
                    currentModule.Versions.OrderByDescending(v => v.Release + v.SubRelease + v.BuildId).First();
                model.Release = lastVersion.Release;
                model.SubRelease = lastVersion.SubRelease;
                model.BuildId = lastVersion.BuildId;
            }
            catch (Exception)
            {
                model.Release = 0;
                model.SubRelease = 0;
                model.BuildId = "1";
            }

            model.ReleaseDate = DateTime.Now;

            var viewModel = new VersionViewModel
            {
                Version = model,
                ReleaseDate =
                    model.ReleaseDate.ToString("d", CultureInfo.CreateSpecificCulture("de-DE"))
            };

            return View(viewModel);
        }

        //
        // POST: /Admin/Version/Create
        [HttpPost]
        public ActionResult Add(int id, VersionViewModel model)
        {
            try
            {
                var currentUser = _db.Users.Single(u => u.EMail == User.Identity.Name);

                model.Version.EmId = currentUser.UId;
                model.Version.User = currentUser;
                model.Version.ModId = id;
                model.Version.Module = _db.Modules.Single(m => m.ModId == id);
                model.Version.ReleaseDate = DateTime.ParseExact(model.ReleaseDate, "d",
                    CultureInfo.CreateSpecificCulture("de-DE"));

                foreach (string inputTagName in Request.Files)
                {
                    HttpPostedFileBase file = Request.Files[inputTagName];
                    if (file.ContentLength > 0)
                    {
                        if (
                            !System.IO.Directory.Exists(Server.MapPath(@"~/Uploads/Modules/" + model.Version.Module.Name)))
                        {
                            System.IO.Directory.CreateDirectory(
                                Server.MapPath(@"~/Uploads/Modules/" + model.Version.Module.Name));
                        }

                        string filePath =
                            Path.Combine(HttpContext.Server.MapPath("~/Uploads/Modules/" + model.Version.Module.Name),
                                model.Version.Module.Name + "-" + model.Version.Release + "." +
                                model.Version.SubRelease + "." +
                                model.Version.BuildId +
                                Path.GetExtension(file.FileName).ToLower());
                        file.SaveAs(filePath);

                        model.Version.Filename = "Uploads/Modules/" + model.Version.Module.Name + "/" +
                                                 model.Version.Module.Name + "-" +
                                                 model.Version.Release + "." + model.Version.SubRelease + "." +
                                                 model.Version.BuildId +
                                                 Path.GetExtension(file.FileName).ToLower();
                    }
                }

                _db.AddToVersions(model.Version);
                _db.SaveChanges();

                return RedirectToAction("Details", "Module", new {id = id});
            }
            catch (Exception e)
            {
                return View(model);
            }
        }

        public ActionResult Delete(int id)
        {
            try
            {
                return View(_db.Versions.Single(v => v.VrId == id));
            }
            catch (Exception)
            {
                return this.HandleError404();
            }
        }

        [HttpPost]
        public ActionResult Delete(int id, Version model)
        {
            //            try
            //            {
            var toDelete = _repos.VersionRepoistory.GetByID(id); //_db.Versions.Single(v => v.VrId == id);

            var deletePath = Path.Combine(HttpContext.Server.MapPath("~/"),
                toDelete.Filename);

            _repos.VersionRepoistory.Delete(toDelete, deletePath);
            TempData["uihint"] = new UiHint("Erfolg!",
                "Die Version wurde erfolgriech gelöscht!",
                new {@class = "alert alert-success"});
            _repos.Save();

            return RedirectToAction("Details", "Module", new {id = toDelete.ModId});
            //            }
            //            catch (Exception)
            //            {
            //                return this.HandleError404();
            //            }
        }

        public ActionResult Details(int id)
        {
            try
            {
                var version = _db.Versions.Single(v => v.VrId == id);
                var viewModel = new VersionViewModel();
                viewModel.Version = version;
                viewModel.ReleaseDate = version.ReleaseDate.ToString("d", CultureInfo.CreateSpecificCulture("de-DE"));
                return View(viewModel);
            }
            catch (Exception)
            {
                return this.HandleError404();
            }
        }

        public ActionResult Download(int id)
        {
            try
            {
                var version = _db.Versions.Single(v => v.VrId == id);
                return this.performDownload(version);
            }
            catch (Exception)
            {
                return this.HandleError404();
            }
        }

        [NonAction]
        private ActionResult performDownload(Version version)
        {
            string pfn = Server.MapPath("~/" + version.Filename);

            if (!System.IO.File.Exists(pfn))
            {
                //throw new ArgumentException("Invalid file name or file not exists!");

                return this.HandleError404();
            }
            else
            {
                var download = new Download()
                {
                    DlDate = DateTime.Now,
                    CmId = _db.Users.Single(u => u.EMail == User.Identity.Name).UId,
                    VrId = version.VrId
                };
                _db.AddToDownloads(download);
                _db.SaveChanges();
                return new BinaryContentResult()
                {
                    FileName = Path.GetFileName(@pfn),
                    ContentType = "application/octet-stream",
                    Content = System.IO.File.ReadAllBytes(pfn)
                };
            }
        }

        public RedirectToRouteResult HandleError404()
        {
            TempData["uihint"] = new UiHint("Fehler!",
                "Da ist etwas schief gelaufen oder das Element wurde nicht gefunden!",
                new {@class = "alert alert-error"});
            return RedirectToAction("List", "Module");
        }

        public RedirectToRouteResult HandleError()
        {
            TempData["uihint"] = new UiHint("Fehler!",
                "Da ist etwas schief gelaufen!",
                new {@class = "alert alert-error"});
            return RedirectToAction("List", "Module");
        }
    }
}