using System;
using System.Linq;
using System.Web.Mvc;
using VersionR.Models;
using VersionR.Services;

namespace VersionR.Areas.Admin.Controllers
{
    [AuthorizeWithNotify(Roles = "Administrator,Supporter")]
    public class ModuleController : Controller
    {
        private readonly VersionR.Models.VersionR _db = new VersionR.Models.VersionR();

        //
        // GET: /Admin/Module/
        public ActionResult Index(int id = 0)
        {
            return id != 0 ? RedirectToAction("Details", new {id = id}) : RedirectToAction("List");
        }

        #region Module Actions

        #region List

        //
        // GET: /Admin/Module/List/
        public ActionResult List()
        {
            return View(_db.Modules.ToList());
        }

        #endregion List

        #region Details

        public ActionResult Details(int id)
        {
            try
            {
                var module = _db.Modules.Single(m => m.ModId == id);
                return View(module);
            }
            catch (Exception)
            {
                return RedirectToAction("List");
            }
        }

        #endregion Details

        #region Create

        //
        // GET: /Admin/CreateModule/
        public ActionResult Create()
        {
            return View(new Module());
        }

        [HttpPost]
        public ActionResult Create(Module model)
        {
            if (!ModelState.IsValid)
            {
                return View(new Module());
            }
            _db.AddToModules(model);
            _db.SaveChanges();

            return RedirectToAction("Details", new {id = model.ModId});
        }

        #endregion Create

        #region Edit

        //
        // GET: /Module/EditModule/id
        public ActionResult Edit(int id)
        {
            try
            {
                var module = _db.Modules.Single(m => m.ModId == id);
                module.PricePerYear = Convert.ToInt32(module.PricePerYear);
                return View(module);
            }
            catch (Exception)
            {
                return RedirectToAction("List");
            }
        }

        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                var module = _db.Modules.Single(m => m.ModId == id);
                if (ModelState.IsValid)
                {
                    UpdateModel(module);
                    _db.SaveChanges();
                    return RedirectToAction("Details", new {id});
                }
                return View(module);
            }
            catch (Exception)
            {
                return RedirectToAction("List");
            }
        }

        #endregion Edit

        #region Delete

        public ActionResult Delete(int id)
        {
            try
            {
                var module = _db.Modules.Single(m => m.ModId == id);
                return View(module);
            }
            catch (Exception)
            {
                return RedirectToAction("List");
            }
        }

        [HttpPost]
        public ActionResult Delete(int id, Module moduleToDelete)
        {
            try
            {
                var module = _db.Modules.Single(m => m.ModId == id);
                _db.Modules.DeleteObject(module);
                _db.SaveChanges();
                return RedirectToAction("List");
            }
            catch (Exception)
            {
                return RedirectToAction("List");
            }
        }

        #endregion Delete

        #endregion Module Actions
    }
}