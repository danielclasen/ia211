using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace VersionR.Areas.Admin.Controllers
{
    public class DashboardController : Controller
    {
        private readonly VersionR.Models.VersionR _db = new VersionR.Models.VersionR();

        //
        // GET: /Admin/Dashboard/
        public ActionResult Index()
        {
            return View();
        }
    }
}