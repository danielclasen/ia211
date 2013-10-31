using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using VersionR.Services;

namespace VersionR.Controllers
{
    [DataForMasterPage]
    public class ErrorController : Controller
    {
        private readonly VersionR.Models.VersionR _db = new VersionR.Models.VersionR();
        private readonly DAL.Repositories _repos = new DAL.Repositories();

        //
        // GET: /Error/
        public ActionResult Index(string aspxerrorpath, int code = 0)
        {
            switch (code)
            {
                case 404:
                    ViewData["errorTitle"] = "Seite nicht gefunden!";
                    ViewData["errorText"] = String.Format("Die Seite '{0}' wurde nicht gefunden!", aspxerrorpath);
                    break;

                case 403:
                    ViewData["errorTitle"] = "STOP!";
                    ViewData["errorText"] = String.Format("Der Zugriff auf '{0}' wurde nicht gewährt!", aspxerrorpath);
                    break;

                default:
                    ViewData["errorTitle"] = "Es ist ein Fehler passiert!";
                    ViewData["errorText"] = "Unbekannter Fehler aufgetreten!";
                    break;
            }

            return View();
        }

        //
        // GET: /Error/C404
        public ActionResult C404(string aspxerrorpath)
        {
            Response.Redirect("~/Error?code=404&aspxerrorpath=" + aspxerrorpath);
            return View();
        }

        //
        // GET: /Error/C403
        public ActionResult C403(string aspxerrorpath)
        {
            Response.Redirect("~/Error?code=403&aspxerrorpath=" + aspxerrorpath);
            return View();
        }
    }
}