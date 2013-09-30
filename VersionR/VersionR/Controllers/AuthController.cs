using System;
using System.Collections.Generic;
using System.Diagnostics.CodeAnalysis;
using System.Linq;
using System.Security.Principal;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;
using System.Web.Security;

using VersionR.Services;
using VersionR.Models;

namespace VersionR.Controllers
{
    public class AuthController : Controller
    {

        VersionR.Models.VersionR db = new VersionR.Models.VersionR();

        //
        // GET: /Auth/
        public ActionResult Index()
        {
            return View();
        }


        public IFormsAuthenticationService FormsService { get; set; }
        public IMembershipService MembershipService { get; set; }
        public VersionRRoleProvider AuthorizationService { get; set; }

        protected override void Initialize(RequestContext requestContext)
        {
            if (FormsService == null) { FormsService = new FormsAuthenticationService(); }
            if (MembershipService == null) { MembershipService = new AccountMembershipService(); }
            if (AuthorizationService == null) { AuthorizationService = new VersionRRoleProvider(); }

            base.Initialize(requestContext);
        }

        // **************************************
        // URL: /Auth/LogOn
        // **************************************

        public ActionResult LogOn()
        {
            return View();
        }

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
                    else
                    {
                        return RedirectToAction("Index", "Home");
                    }
                }
                else
                {
                    ModelState.AddModelError("", "Der angegebene Benutzername oder das angegebene Kennwort ist ungültig.");
                }
            }

            // Wurde dieser Punkt erreicht, ist ein Fehler aufgetreten; Formular erneut anzeigen.
            return View(model);
        }

        // **************************************
        // URL: /Auth/LogOff
        // **************************************

        public ActionResult LogOff()
        {
            FormsService.SignOut();

            return RedirectToAction("Index", "Home");
        }


        public ActionResult AccessDenied()
        {
            return View();
        }

    }
}
