using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using VersionR.Models;

namespace VersionR.Controllers
{
    public class AdminController : Controller
    {

        VersionR.Models.VersionR_ia211_local_entities db = new VersionR_ia211_local_entities();

        //
        // GET: /Admin/
        public ActionResult Index()
        {
            
            return View();
        }

        //
        // GET: /Roles/
        public ActionResult Roles()
        {
            var roles = from m in db.Roles
                        where true
                        select m;

            return View(roles.ToList());
        }

        //
        // GET: /Account/Create/
        public ActionResult CreateRole()
        {
            return View();
        }

        [HttpPost]
        public ActionResult CreateRole(Role newRole)
        {

            if (ModelState.IsValid)
            {
                db.AddToRoles(newRole);
                db.SaveChanges();

                return RedirectToAction("Roles");
            }
            else
            {
                return View(newRole);
            }
        }


    }
}
