using System;
using System.Diagnostics;
using System.Linq;
using System.Web.Mvc;
using VersionR.Models;
using VersionR.Models.ViewModels.Admin;
using VersionR.Services;

namespace VersionR.Controllers
{
    [AuthorizeWithNotify(Roles = "Administrator")]
    public class AdminController : Controller
    {
        private readonly VersionR.Models.VersionR _db = new VersionR.Models.VersionR();

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
            var users = from m in _db.Users
                        where true
                        select m;

            return View(users.ToList());

            //TODO: Check for Login, return different views
            //return View();
        }

        public ActionResult DetailsUser(int id)
        {
            try
            {
                var user = (from u in _db.Users where u.UId == id select u).Single();
                return View(user);
            }
            catch (Exception)
            {
                return RedirectToAction("Users");
            }
        }

        //
        // GET: /Account/Create/

        public ActionResult CreateUser()
        {
            return View(new CreateUserViewModel());
        }

        [HttpPost]
        public ActionResult CreateUser(CreateUserViewModel model)
        {
            if (!ModelState.IsValid || model.User.RId == 0)
            {
                return View(new CreateUserViewModel());
            }
            else
            {
                model.User.PwHash = PasswordService.getMD5Hash(model.User.PwHash);
                _db.AddToUsers(model.User);
                _db.SaveChanges();

                return RedirectToAction("DetailsUser", new { id = model.User.UId });
            }
        }

        //
        // GET: /Admin/EditUser/Id
        public ActionResult EditUser(int id)
        {
            var user = _db.Users.FirstOrDefault(u => u.UId == id);
            var roles = from r in _db.Roles select r;
            ViewData["roleSelect"] = new SelectList(roles, "RId", "Name", user.RId);
            return View(user);
        }

        [HttpPost]
        public ActionResult EditUser(int id, FormCollection collection, int roleSelect, string newPassword)
        {
            var user = _db.Users.Single(u => u.UId == id);

            if (ModelState.IsValid && roleSelect != 0)
            {
                user.RId = roleSelect;
                if (newPassword.Length > 0 && newPassword != "")
                {
                    user.PwHash = PasswordService.getMD5Hash(newPassword);
                }
                UpdateModel(user);
                _db.SaveChanges();
                return RedirectToAction("Users");
            }
            else
            {
                var roles = from r in _db.Roles select r;
                ViewData["roleSelect"] = new SelectList(roles, "RId", "Name", user.RId);
                return View(user);
            }
        }

        public ActionResult DeleteUser(int id)
        {
            try
            {
                var user = (from u in _db.Users where u.UId == id select u).Single();
                return View(user);
            }
            catch (Exception)
            {
                return RedirectToAction("Users");
            }
        }

        [HttpPost]
        public ActionResult DeleteUser(int id, User userToDelete)
        {
            try
            {
                var user = (from u in _db.Users where u.UId == id select u).Single();
                _db.Users.DeleteObject(user);
                _db.SaveChanges();
                return RedirectToAction("Users");
            }
            catch (Exception e)
            {
                ViewData["error"] = e.ToString();
                return RedirectToAction("Users");
            }
        }

        //
        // GET: /Roles/
        public ActionResult Roles()
        {
            var roles = from m in _db.Roles
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
                var role = _db.Roles.FirstOrDefault(r => r.RId == id);
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
                _db.AddToRoles(newRole);
                _db.SaveChanges();

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
            return View(_db.Roles.FirstOrDefault(R => R.RId == id));
        }

        [HttpPost]
        public ActionResult EditRole(int id, FormCollection collection)
        {
            var role = _db.Roles.Single(r => r.RId == id);

            try
            {
                UpdateModel(role);
                _db.SaveChanges();
                return RedirectToAction("Roles");
            }
            catch (Exception e)
            {
                return View(role);
            }
        }

        //
        // GET: /Account/Edit/editRoleId
        public ActionResult DeleteRole(int id)
        {
            var affectedUsers = from m in _db.Users
                                where m.RId == id
                                select m;

            ViewData["affectedUsers"] = affectedUsers.ToList();

            return View(_db.Roles.FirstOrDefault(R => R.RId == id));
        }

        [HttpPost]
        public ActionResult DeleteRole(int id, Role roleToDelete)
        {
            var role = _db.Roles.FirstOrDefault(r => r.RId == id);

            try
            {
                var affectedUsers = from u in _db.Users
                                    where u.RId == role.RId
                                    select u;

                foreach (var user in affectedUsers)
                {
                    _db.Users.DeleteObject(user);
                }
                _db.Roles.DeleteObject(role);
                _db.SaveChanges();
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