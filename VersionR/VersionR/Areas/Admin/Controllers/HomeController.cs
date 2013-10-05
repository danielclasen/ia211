using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace VersionR.Areas.Admin.Controllers
{
    public class HomeController : Controller
    {
        private readonly VersionR.Models.VersionR _db = new VersionR.Models.VersionR();

        //
        // GET: /Admin/Home/
        public ActionResult Index()
        {
            return RedirectToAction("Index", "Dashboard");
        }
    }
}