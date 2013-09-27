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

        VersionR.Models.VersionR db = new VersionR.Models.VersionR();

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

        //
        // GET: /Account/Edit/editRoleId
        public ActionResult EditRole(int id)
        {
            return View(db.Roles.FirstOrDefault(R => R.RId == id));            
        }

        [HttpPost]
        public ActionResult EditRole(int id, FormCollection collection)
        {
            var role = db.Roles.Single(r => r.RId == id);
            
            try
            {                
                UpdateModel(role);
                db.SaveChanges();                
                return RedirectToAction("Roles");                
            }
            catch(Exception e)
            {
                return View(role);
            }

        }
        
    }
}
