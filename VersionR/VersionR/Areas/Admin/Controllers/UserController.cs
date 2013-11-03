using System;
using System.Linq;
using System.Web.Mvc;
using VersionR.Helpers;
using VersionR.Models;
using VersionR.Services;
using VersionR.ViewModels.Admin;

namespace VersionR.Areas.Admin.Controllers
{
    [AuthorizeWithNotify(Roles = "Administrator")]
    public class UserController : Controller
    {
        private readonly Models.VersionR _db = new Models.VersionR();

        //
        // GET: /Admin/User/id
        public ActionResult Index(int id = 0)
        {
            return id != 0 ? RedirectToAction("Details", new { id = id }) : RedirectToAction("List");
        }

        #region User Actions

        #region List

        //
        // GET: /Admin/List
        public ActionResult List()
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
        public ActionResult Details(int id)
        {
            try
            {
                var user = _db.Users.Single(u => u.UId == id);
                return View(user);
            }
            catch (Exception)
            {
                return RedirectToAction("List");
            }
        }

        #endregion Details

        #region Create

        //
        // GET: /Account/Create/
        public ActionResult Create()
        {
            return View(new CreateUserViewModel());
        }

        [HttpPost]
        public ActionResult Create(CreateUserViewModel model)
        {
            if (!ModelState.IsValid || model.User.RId == 0)
            {
                return View(new CreateUserViewModel());
            }
            model.User.PwHash = PasswordService.getMD5Hash(model.User.PwHash);
            _db.AddToUsers(model.User);
            _db.SaveChanges();

            return RedirectToAction("Details", new { id = model.User.UId });
        }

        #endregion Create

        #region Edit

        //
        // GET: /Admin/EditUser/Id
        public ActionResult Edit(int id)
        {
            //TODO check for null try/catch
            var user = _db.Users.FirstOrDefault(u => u.UId == id);
            var roles = from r in _db.Roles select r;
            ViewData["roleSelect"] = new SelectList(roles, "RId", "Name", user.RId);
            return View(user);
        }

        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection, int roleSelect, string newPassword)
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
                return RedirectToAction("List");
            }
            var roles = from r in _db.Roles select r;
            ViewData["roleSelect"] = new SelectList(roles, "RId", "Name", user.RId);
            return View(user);
        }

        #endregion Edit

        #region Delete

        public ActionResult Delete(int id)
        {
            if (id == 1)
            {
                TempData["uihint"] = new UiHint("Fehler!",
                                            "Der Admin-Benutzer kann nicht gelöscht werden!",
                                            new { @class = "alert alert-error" });
                return RedirectToAction("List");
            }

            try
            {
                var user = (from u in _db.Users where u.UId == id select u).Single();
                return View(user);
            }
            catch (Exception)
            {
                return RedirectToAction("List");
            }
        }

        [HttpPost]
        public ActionResult Delete(int id, User userToDelete)
        {
            try
            {
                var user = (from u in _db.Users where u.UId == id select u).Single();
                _db.Users.DeleteObject(user);
                _db.SaveChanges();
                return RedirectToAction("List");
            }
            catch (Exception e)
            {
                ViewData["error"] = e.ToString();
                return RedirectToAction("List");
            }
        }

        #endregion Delete

        #endregion User Actions
    }
}