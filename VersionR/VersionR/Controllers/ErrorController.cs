

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace VersionR.Controllers
{
    public class ErrorController : Controller
    {

        private readonly VersionR.Models.VersionR _db = new VersionR.Models.VersionR();
        private readonly DAL.Repositories _repos = new DAL.Repositories();

        //
        // GET: /Error/
        public ActionResult Index(string aspxerrorpath)
        {
            ViewData["aspxerrorpath"] = Request.QueryString["aspxerrorpath"].ToString();

            return View();
        }


    }
}
