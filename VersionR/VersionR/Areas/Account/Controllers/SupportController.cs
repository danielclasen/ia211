using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace VersionR.Areas.Account.Controllers
{
    public class SupportController : Controller
    {
        private readonly VersionR.Models.VersionR _db = new VersionR.Models.VersionR();
        private readonly DAL.Repositories _repos = new DAL.Repositories();

        //
        // GET: /Account/Support/List
        public ActionResult List()
        {
            return View();
        }

        //
        // GET: /Account/Support/Create
        public ActionResult Create()
        {
            return View();
        }
    }
}