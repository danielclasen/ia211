using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace VersionR.Areas.Catalog.Controllers
{
    public class HomeController : Controller
    {
        private readonly VersionR.Models.VersionR _db = new VersionR.Models.VersionR();
        private readonly DAL.Repositories _repos = new DAL.Repositories();

        //
        // GET: /Catalog/Home/
        public ActionResult Index()
        {
            return RedirectToAction("Page", "List", new {id = 1});
        }
    }
}