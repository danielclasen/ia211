using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Web.Mvc;
using VersionR.Models;
using VersionR.Services;
using VersionR.ViewModels.Admin;

namespace VersionR.Controllers
{
    [AuthorizeWithNotify(Roles = "Administrator")]
    public class AdminController : Controller
    {
        private readonly VersionR.Models.VersionR _db = new VersionR.Models.VersionR();

        #region INDEX

        //
        // GET: /Admin/
        public ActionResult Index()
        {
            return View();
        }

        #endregion INDEX

        #region User Actions

        #region List

        //
        // GET: /Admin/Users
        public ActionResult Users()
        {
            var users = from m in _db.Users
                        where true
                        select m;

            return View(users.ToList());

            //TODO: Check for Login, return different views
            //return View();
        }

        #endregion List

        #region Details

        //
        // GET: /Admin/User/id
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

        #endregion Details

        #region Create

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

                return RedirectToAction("DetailsUser", new {id = model.User.UId});
            }
        }

        #endregion Create

        #region Edit

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

        #endregion Edit

        #region Delete

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

        #endregion Delete

        #endregion User Actions

        #region Role Actions

        #region List

        //
        // GET: /Roles/
        public ActionResult Roles()
        {
            var roles = from m in _db.Roles
                        where true
                        select m;

            return View(roles.ToList());
        }

        #endregion List

        #region Details

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

        #endregion Details

        #region Create

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

        #endregion Create

        #region Edit

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

        #endregion Edit

        #region Delete

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

        #endregion Delete

        #endregion Role Actions

        #region Module Actions

        #region List

        //
        // GET: /Account/
        public ActionResult Modules()
        {
            var roles = from m in _db.Modules select m;
            return View(roles.ToList());

            //TODO: Check for Login, return different views
            //return View();
        }

        #endregion List

        #region Details

        public ActionResult DetailsModule(int id)
        {
            try
            {
                var module = _db.Modules.Single(m => m.ModId == id);
                return View(module);
            }
            catch (Exception)
            {
                return RedirectToAction("Modules");
            }
        }

        #endregion Details

        #region Create

        //
        // GET: /Admin/CreateModule/
        public ActionResult CreateModule()
        {
            return View(new Module());
        }

        [HttpPost]
        public ActionResult CreateModule(Module model)
        {
            if (!ModelState.IsValid)
            {
                return View(new Module());
            }
            else
            {
                _db.AddToModules(model);
                _db.SaveChanges();

                return RedirectToAction("DetailsModule", new {id = model.ModId});
            }
        }

        #endregion Create

        #region Edit

        //
        // GET: /Admin/EditUser/Id
        public ActionResult EditModule(int id)
        {
            try
            {
                var module = _db.Modules.Single(m => m.ModId == id);
                module.PricePerYear = Convert.ToInt32(module.PricePerYear);
                return View(module);
            }
            catch (Exception)
            {
                return RedirectToAction("Modules");
            }
        }

        [HttpPost]
        public ActionResult EditModule(int id, FormCollection collection)
        {
            try
            {
                var module = _db.Modules.Single(m => m.ModId == id);
                if (ModelState.IsValid)
                {
                    UpdateModel(module);
                    _db.SaveChanges();
                    return RedirectToAction("DetailsModule", new {id = id});
                }
                return View(module);
            }
            catch (Exception)
            {
                return RedirectToAction("Modules");
            }
        }

        #endregion Edit

        #region Delete

        public ActionResult DeleteModule(int id)
        {
            try
            {
                var module = _db.Modules.Single(m => m.ModId == id);
                return View(module);
            }
            catch (Exception)
            {
                return RedirectToAction("Modules");
            }
        }

        [HttpPost]
        public ActionResult DeleteModule(int id, Module moduleToDelete)
        {
            try
            {
                var module = _db.Modules.Single(m => m.ModId == id);
                _db.Modules.DeleteObject(module);
                _db.SaveChanges();
                return RedirectToAction("Modules");
            }
            catch (Exception)
            {
                return RedirectToAction("Modules");
            }
        }

        public ActionResult testme()
        {
            return View();
        }

        #endregion Delete

        #endregion Module Actions
    }
}