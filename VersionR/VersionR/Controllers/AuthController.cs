using System;
using System.Web.Mvc;
using System.Web.Routing;
using VersionR.Models;
using VersionR.Services;

namespace VersionR.Controllers
{
    public class AuthController : Controller
    {
        /*
                private readonly Models.VersionR _db = new Models.VersionR();
        */

        public VersionRRoleProvider AuthorizationService { get; set; }

        public IFormsAuthenticationService FormsService { get; set; }

        public IMembershipService MembershipService { get; set; }

        public ActionResult AccessDenied()
        {
            return View();
        }

        //
        // GET: /Auth/
        public ActionResult Index()
        {
            return RedirectToAction("Index", "Home");
        }

        public ActionResult LogOff()
        {
            FormsService.SignOut();

            return RedirectToAction("Index", "Home");
        }

        public ActionResult LogOn()
        {
            return View();
        }

        // **************************************
        // URL: /Auth/LogOn
        // **************************************
        [HttpPost]
        public ActionResult LogOn(LogOnModel model, string returnUrl)
        {
            if (ModelState.IsValid)
            {
                if (MembershipService.ValidateUser(model.UserName, model.Password))
                {
                    FormsService.SignIn(model.UserName, model.RememberMe);
                    if (!String.IsNullOrEmpty(returnUrl))
                    {
                        return Redirect(returnUrl);
                    }
                    return RedirectToAction("Index", "Home");
                }
                ModelState.AddModelError("",
                                         "Der angegebene Benutzername oder das angegebene Kennwort ist ungültig.");
            }

            // Wurde dieser Punkt erreicht, ist ein Fehler aufgetreten; Formular erneut anzeigen.
            return View(model);
        }

        protected override void Initialize(RequestContext requestContext)
        {
            if (FormsService == null)
            {
                FormsService = new FormsAuthenticationService();
            }
            if (MembershipService == null)
            {
                MembershipService = new AccountMembershipService();
            }
            if (AuthorizationService == null)
            {
                AuthorizationService = new VersionRRoleProvider();
            }

            base.Initialize(requestContext);
        }

        // **************************************
        // URL: /Auth/LogOff
        // **************************************
    }
}