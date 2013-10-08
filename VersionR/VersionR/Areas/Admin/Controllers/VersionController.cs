using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;
using VersionR.Helpers;
using VersionR.Models;
using Version = VersionR.Models.Version;

namespace VersionR.Areas.Admin.Controllers
{
    public class VersionController : Controller
    {
        private readonly VersionR.Models.VersionR _db = new VersionR.Models.VersionR();

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
            return View(model);
        }

        //
        // POST: /Admin/Version/Create
        [HttpPost]
        public ActionResult Add(int id, Version model)
        {
            try
            {
                var currentUser = _db.Users.Single(u => u.EMail == User.Identity.Name);

                model.EmId = currentUser.UId;
                model.User = currentUser;
                model.ModId = id;
                model.Module = _db.Modules.Single(m => m.ModId == id);

                foreach (string inputTagName in Request.Files)
                {
                    HttpPostedFileBase file = Request.Files[inputTagName];
                    if (file.ContentLength > 0)
                    {
                        if (!System.IO.Directory.Exists(Server.MapPath(@"~/Uploads/Modules/" + model.Module.Name)))
                        {
                            System.IO.Directory.CreateDirectory(Server.MapPath(@"~/Uploads/Modules/" + model.Module.Name));
                        }

                        string filePath =
                            Path.Combine(HttpContext.Server.MapPath("~/Uploads/Modules/" + model.Module.Name),
                                model.Module.Name + "-" + model.Release + "." + model.SubRelease + "." + model.BuildId +
                                Path.GetExtension(file.FileName).ToLower());
                        file.SaveAs(filePath);

                        model.Filename = "Uploads/Modules/" + model.Module.Name + "/" + model.Module.Name + "-" +
                                         model.Release + "." + model.SubRelease + "." + model.BuildId +
                                         Path.GetExtension(file.FileName).ToLower();
                    }
                }

                _db.AddToVersions(model);
                _db.SaveChanges();

                return RedirectToAction("Details", "Module", new { id = id });
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
                TempData["uihint"] = new UiHint("Fehler!",
                    "Die Version wurde nicht gefunden!",
                    new { @class = "alert alert-error" });
                return RedirectToAction("Index", "Home");
            }
        }

        [HttpPost]
        public ActionResult Delete(int id, Version model)
        {
            try
            {
                var toDelete = _db.Versions.Single(v => v.VrId == id);

                try
                {
                    var deletePath = Path.Combine(HttpContext.Server.MapPath("~/"),
                        toDelete.Filename);
                    var fileDelete = new FileInfo(deletePath);
                    fileDelete.Delete();

                    TempData["uihint"] = new UiHint("Erfolg!",
                        "Die Version wurde erfolgriech gelöscht!",
                        new { @class = "alert alert-success" });
                }
                catch (Exception)
                {
                    TempData["uihint"] = new UiHint("Achtung!",
                        "Die Version wurde erfolgriech gelöscht, allerdings konnte die Versions-Datei nicht gefunden oder gelöscht werden!",
                        new { @class = "alert alert-warning" });
                }

                _db.Versions.DeleteObject(toDelete);
                _db.SaveChanges();

                return RedirectToAction("Details", "Module", new { id = toDelete.ModId });
            }
            catch (Exception)
            {
                TempData["uihint"] = new UiHint("Fehler!",
                    "Da ist etwas schief gelaufen oder die Version wurde nicht gefunden!",
                    new { @class = "alert alert-error" });
                return RedirectToAction("List", "Module");
            }
        }
    }
}