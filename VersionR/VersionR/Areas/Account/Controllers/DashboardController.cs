using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using VersionR.Services;

namespace VersionR.Areas.Account.Controllers
{
    [AuthorizeWithNotify]
    [DataForMasterPage]
    public class DashboardController : Controller
    {
        private readonly VersionR.Models.VersionR _db = new VersionR.Models.VersionR();
        private readonly DAL.Repositories _repos = new DAL.Repositories();

        //
        // GET: /Account/Dashboard/

        public ActionResult Index()
        {
            var currentUser = _db.Users.Single(u => u.EMail == User.Identity.Name);
            return View(currentUser);
        }
    }
}