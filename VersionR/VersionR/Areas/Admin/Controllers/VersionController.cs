using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
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
            var model = new Version();
            model.EmId = currentUser.UId;
            model.User = currentUser;
            model.ModId = id;
            model.Module = _db.Modules.Single(m => m.ModId == id);
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
                                         Path.GetFileName(file.FileName));
                        file.SaveAs(filePath);

                        model.Filename = filePath;
                    }
                }

                _db.AddToVersions(model);
                _db.SaveChanges();

                return RedirectToAction("Details", "Module", new { id = id });
            }
            catch (Exception e)
            {
                throw new Exception(e.ToString());
                return View(model);
            }
        }
    }
}