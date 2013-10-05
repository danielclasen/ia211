using System;
using System.Linq;
using System.Web.Mvc;
using VersionR.Models;
using VersionR.Services;

namespace VersionR.Areas.Admin.Controllers
{
    [AuthorizeWithNotify(Roles = "Administrator")]
    public class RoleController : Controller
    {
        private readonly Models.VersionR _db = new Models.VersionR();

        //
        // GET: /Admin/Role/
        public ActionResult Index(int id = 0)
        {
            return id != 0 ? RedirectToAction("Details", new {id = id}) : RedirectToAction("List");
        }

        #region Role Actions

        #region List

        //
        // GET: /Admin/Role/List/
        public ActionResult List()
        {
            var roles = _db.Roles.ToList();

            return View(roles);
        }

        #endregion List

        #region Details

        //
        // GET: /Admin/Role/Details/id
        public ActionResult Details(int id)
        {
            try
            {
                var role = _db.Roles.Single(r => r.RId == id);
                return View(role);
            }
            catch (Exception)
            {
                return RedirectToAction("List");
            }
        }

        #endregion Details

        #region Create

        //
        // GET: /Admin/Role/Create/
        public ActionResult Create()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Create(Role newRole)
        {
            if (ModelState.IsValid)
            {
                _db.AddToRoles(newRole);
                _db.SaveChanges();

                return RedirectToAction("List");
            }
            return View(newRole);
        }

        #endregion Create

        #region Edit

        //
        // GET: /Admin/Role/Edit/id
        public ActionResult Edit(int id)
        {
            return View(_db.Roles.FirstOrDefault(r => r.RId == id));
        }

        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            var role = _db.Roles.Single(r => r.RId == id);

            try
            {
                UpdateModel(role);
                _db.SaveChanges();
                return RedirectToAction("List");
            }
            catch (Exception)
            {
                return View(role);
            }
        }

        #endregion Edit

        #region Delete

        //
        // GET: /Admin/Role/Delete/id
        public ActionResult Delete(int id)
        {
            var affectedUsers = _db.Users.Where(u => u.RId == id).ToList();

            ViewData["affectedUsers"] = affectedUsers;

            return View(_db.Roles.Single(r => r.RId == id));
        }

        [HttpPost]
        public ActionResult Delete(int id, Role roleToDelete)
        {
            var role = _db.Roles.FirstOrDefault(r => r.RId == id);

            try
            {
                var affectedUsers = _db.Users.Where(u => u.RId == id).ToList();

                foreach (var user in affectedUsers)
                {
                    _db.Users.DeleteObject(user);
                }
                _db.Roles.DeleteObject(role);
                _db.SaveChanges();
                return RedirectToAction("List");
            }
            catch (Exception e)
            {
                ViewData["error"] = e.ToString();
                return View(role);
            }
        }

        #endregion Delete

        #endregion Role Actions
    }
}