using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using VersionR.Models;
using System.Security.Cryptography;
using System.Text;
using System.Data.Objects;

using VersionR.Services;

namespace VersionR.Controllers
{
    [AuthorizeWithNotify(Roles = "Administrator")]
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
        // GET: /Account/

        public ActionResult Users()
        {

            var users = from m in db.Users
                        where true
                        select m;

            return View(users.ToList());

            //TODO: Check for Login, return different views
            //return View();

        }

        //
        // GET: /Account/Create/

        public ActionResult CreateUser()
        {

            var roles = from r in db.Roles select r;
            ViewData["roleSelect"] = new SelectList(roles, "RId", "Name");

            return View();
        }

        [HttpPost]
        public ActionResult CreateUser(User newUser, int newUserRole)
        {

            if (ModelState.IsValid && newUserRole != 0)
            {
                newUser.RId = newUserRole;
                newUser.PwHash = PasswordService.getMD5Hash(newUser.PwHash);
                db.AddToUsers(newUser);
                db.SaveChanges();

                return RedirectToAction("Users");
            }
            else
            {
                var roles = from r in db.Roles select r;
                ViewData["roleSelect"] = new SelectList(roles, "RId", "Name");
                return View(newUser);
            }
        }


        //
        // GET: /Admin/EditUser/Id
        public ActionResult EditUser(int id)
        {
            var user = db.Users.FirstOrDefault(u => u.UId == id);
            var roles = from r in db.Roles select r;
            ViewData["roleSelect"] = new SelectList(roles, "RId", "Name", user.RId);
            return View(user);
        }

        [HttpPost]
        public ActionResult EditUser(int id, FormCollection collection, int roleSelect, string newPassword)
        {
            var user = db.Users.Single(u => u.UId == id);


            if (ModelState.IsValid && roleSelect != 0)
            {
                user.RId = roleSelect;
                if (newPassword.Length > 0 && newPassword != "")
                {
                    user.PwHash = PasswordService.getMD5Hash(newPassword);
                }
                UpdateModel(user);
                db.SaveChanges();
                return RedirectToAction("Users");
            }
            else
            {
                var roles = from r in db.Roles select r;
                ViewData["roleSelect"] = new SelectList(roles, "RId", "Name", user.RId);
                return View(user);
            }

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
        // GET: /DetailsRole/
        public ActionResult DetailsRole(int id)
        {
            try
            {
                var role = db.Roles.FirstOrDefault(r => r.RId == id);
                return View(role);
            }
            catch (Exception e)
            {
                return RedirectToAction("Roles");
            }

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
        // GET: /Account/Edit/EditRoleId
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


        //
        // GET: /Account/Edit/editRoleId
        public ActionResult DeleteRole(int id)
        {

            var affectedUsers = from m in db.Users
                        where m.RId == id
                        select m;

            ViewData["affectedUsers"] = affectedUsers.ToList();

            return View(db.Roles.FirstOrDefault(R => R.RId == id));
        }

        [HttpPost]
        public ActionResult DeleteRole(int id, Role roleToDelete)
        {

            var role = db.Roles.FirstOrDefault(r => r.RId == id);
            
            try
            {   
               
                var affectedUsers = from u in db.Users
                                    where u.RId == role.RId
                                    select u;

                foreach (var user in affectedUsers){
                    db.Users.DeleteObject(user);
                }                    
                db.Roles.DeleteObject(role);
                db.SaveChanges();
                return RedirectToAction("Roles");
            }
            catch (Exception e)
            {
                ViewData["error"] = e.ToString();
                return View(role);
            }

        }

        
    }
}
