using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using VersionR.Services;

namespace VersionR.Areas.Catalog.Controllers
{
    [DataForMasterPage]
    public class SingleController : Controller
    {
        private readonly VersionR.Models.VersionR _db = new VersionR.Models.VersionR();
        private readonly DAL.Repositories _repos = new DAL.Repositories();

        //
        // GET: /Catalog/Single/
        public ActionResult Index()
        {
            return RedirectToAction("Index", "List");
        }

        public ActionResult Module(int id)
        {
            try
            {
                return View(_db.Modules.First(m => m.ModId == id));
            }
            catch (Exception)
            {
                return RedirectToAction("Index", "List");
            }
        }

        public ActionResult Version(int id)
        {
            try
            {
                var requestVersion = _db.Versions.First(m => m.VrId == id);
                if (requestVersion.IsNewest())
                    return RedirectToAction("Module", new {id = requestVersion.ModId});
                else
                    return View(requestVersion);
            }
            catch (Exception)
            {
                return RedirectToAction("Index", "List");
            }
        }
    }
}