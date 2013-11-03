using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PagedList;
using VersionR.Services;

namespace VersionR.Areas.Catalog.Controllers
{
    [DataForMasterPage]
    public class ListController : Controller
    {
        private readonly VersionR.Models.VersionR _db = new VersionR.Models.VersionR();
        private readonly DAL.Repositories _repos = new DAL.Repositories();

        //
        // GET: /Catalog/List/
        public ActionResult Index()
        {
            return RedirectToAction("Page", new { id = 1 });
        }

        public ActionResult Page(int id = 1)
        {
            const int resultsPerPage = 5;

            var moduleList = _db.Modules.OrderBy(m => m.Name).ToList().ToPagedList(id, resultsPerPage);

            return View(moduleList);
        }
    }
}