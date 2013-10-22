using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using VersionR.Helpers;
using VersionR.Services;

namespace VersionR.Controllers
{
    public class HelloWorldController : Controller
    {
        private readonly VersionR.Models.VersionR _db = new VersionR.Models.VersionR();
        private readonly DAL.Repositories _repos = new DAL.Repositories();

        //
        // GET: /HelloWorld/
        public ActionResult Index()
        {
            return View();
        }

        //
        // GET: /Welcome/
        public ActionResult Welcome(string name, int num = 1)
        {
            ViewData["Message"] = "Hello " + name;
            ViewData["Num"] = num;
            return View();
        }

        //
        // GET: /Welcome/
        public ActionResult List(string name, int num = 1)
        {
            ViewData["Message"] = "Hello " + name;
            ViewData["Num"] = num;
            return View();
        }

        public ActionResult Email()
        {
            var testUser = _repos.UserRepository.GetByID(1);
            var testModule = testUser.Customer_Modules.First().Module;
            var testVersion = testModule.Versions.First();
            var em = new EmailMessage
                         {
                             Subject = "test message",
                             Template = new NewVersionEmailTemplate(testUser, testModule, testVersion),
                             From = "noreply@versionr.com",
                             To = "mail@danielclasen.de"
                         };
            if (new EmailService().SendMessage(em,
                                               "ia211-relay@danielclasen.de",
                                               "Rc[ln.Pj!sC3bpGT",
                                               "smtp.1und1.de",
                                               25,
                                               false))
            {
                TempData["uihint"] = new UiHint("Erfolg!",
                                                "Die E-Mail wurde erfolgreich versendet!",
                                                new {@class = "alert alert-success"});
            }
            else
            {
                TempData["uihint"] = new UiHint("Da ist etwas schief gelaufen!",
                                                "Die E-Mail konnte nicht gesendet werden!",
                                                new {@class = "alert alert-error"});
            }
            return RedirectToAction("Index", "Home");
        }
    }
}