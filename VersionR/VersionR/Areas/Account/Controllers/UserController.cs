using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using VersionR.Helpers;
using VersionR.Models;
using VersionR.Services;
using Version = VersionR.Models.Version;

namespace VersionR.Areas.Account.Controllers
{
    [AuthorizeWithNotify]
    [DataForMasterPage]
    public class UserController : Controller
    {
        private readonly VersionR.Models.VersionR _db = new VersionR.Models.VersionR();
        private readonly DAL.Repositories _repos = new DAL.Repositories();

        public ActionResult Edit()
        {
            var user = _repos.UserRepository.Get(m => m.EMail.Equals(User.Identity.Name)).First();
            return View(user);
        }

        [HttpPost]
        public ActionResult Update()
        {
            if (ModelState.IsValid)
            {
                VersionR.Models.User user = new User();
                UpdateModel(user);

                //var dbUser = _repos.UserRepository.Get(email => email.EMail == User.Identity.Name).First();

                //dbUser = user;
                //_repos.Save();

                var dbUser = _db.Users.First(email => email.EMail == User.Identity.Name);

                dbUser.EMail = user.EMail;
                dbUser.NickName = user.NickName;
                dbUser.Phone = user.Phone;

                _db.SaveChanges(System.Data.Objects.SaveOptions.DetectChangesBeforeSave);
                TempData["uihint"] = new UiHint("Erfolg!",
                                                "Ihre Daten wurden erfolgreich geändert.",
                                                new {@class = "alert alert-success"});
                return RedirectToAction("Index", "Dashboard");
            }

            TempData["uihint"] = new UiHint("Ooops!",
                                            "Da ist etwas schief gelaufen! Ihre Daten wurden nicht geändert.",
                                            new {@class = "alert alert-error"});
            return RedirectToAction("Edit");
        }
    }
}