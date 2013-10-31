using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace VersionR.Areas.Admin.Controllers
{
    public class StatisticController : Controller
    {
        private readonly VersionR.Models.VersionR _db = new VersionR.Models.VersionR();
        private readonly DAL.Repositories _repos = new DAL.Repositories();

        //
        // GET: /Admin/Statistic/
        public ActionResult Index()
        {
            return View(_db.Modules);
        }
    }
}