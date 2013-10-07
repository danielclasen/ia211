using System;
using System.Globalization;
using System.Linq;
using System.Web.Mvc;
using VersionR.Areas.Admin.ViewModels;
using VersionR.Helpers;
using VersionR.Models;
using VersionR.ViewModels.Admin;

namespace VersionR.Areas.Admin.Controllers
{
    public class LicenseController : Controller
    {
        private readonly VersionR.Models.VersionR _db = new VersionR.Models.VersionR();

        //
        // GET: /Admin/License/
        public ActionResult Index()
        {
            return RedirectToAction("Index", "Home");
        }

        public ActionResult Add(int id)
        {
            var viewModel = new AddUserLicenseViewModel { User = _db.Users.Single(u => u.UId == id) };
            if (viewModel.PopulateSelectList())
            {
                return View(viewModel);
            }
            TempData["uihint"] = new UiHint("Das geht nicht.",
                                            "Der Benutzer verfügt schon über die Lizenzen aller Module!",
                                            new { @class = "alert alert-error" });
            return RedirectToAction("Details", "User", new { id = id });
        }

        [HttpPost]
        public ActionResult Add(int id, AddUserLicenseViewModel model)
        {
            try
            {
                if (!ModelState.IsValid)
                {
                    return View(model);
                }

                var parsedBuyDate = DateTime.ParseExact(model.BuyDate,
                                                        "d",
                                                        CultureInfo.CreateSpecificCulture("de-DE"));

                var expiryDate = parsedBuyDate.AddYears(model.LicenseYears);

                var customerModules = new Customer_Modules();
                customerModules.BuyDate = parsedBuyDate;
                customerModules.ExpiryDate = expiryDate;
                customerModules.ModId = model.ModId;

                _db.Users.Single(u => u.UId == id).Customer_Modules.Add(customerModules);
                _db.SaveChanges();
                TempData["uihint"] = new UiHint("Erfolg!", "Die Lizenz wurde hinzugefügt!",
                                                new { @class = "alert alert-success" });
                return RedirectToAction("Details", "User", new { id = id });
            }
            catch
            {
                return View(model);
            }
        }

        public ActionResult Delete(int id)
        {
            try
            {
                return View(_db.Customer_Modules.Single(m => m.OrderId == id));
            }
            catch
            {
                return RedirectToAction("Index", "Home");
            }
        }

        [HttpPost]
        public ActionResult Delete(int id, Customer_Modules toDelete)
        {
            var delObject = _db.Customer_Modules.First(c => c.OrderId == id);
            try
            {
                _db.Customer_Modules.DeleteObject(delObject);
                _db.SaveChanges();

                TempData["uihint"] = new UiHint("Erfolg!", "Die Lizenz wurde erfolgreich gelöscht!",
                                            new { @class = "alert alert-success" });
            }
            catch (Exception)
            {
                TempData["uihint"] = new UiHint("Fehler.", "Da ist etwas schief gelaufen. Das sollte nicht so sein!",
                                            new { @class = "alert alert-error" });
            }

            return RedirectToAction("Details", "User", new { id = delObject.CmId });
        }

        public ActionResult Edit(int id)
        {
            var cm = _db.Customer_Modules.Single(c => c.OrderId == id);

            var model = new EditUserLicenseViewModel();

            model.OrderId = id;
            model.CmId = cm.CmId;
            model.User = cm.User;
            model.BuyDate = cm.BuyDate.ToString("d", CultureInfo.CreateSpecificCulture("de-DE"));

            DateTime zeroTime = new DateTime(1, 1, 1);
            TimeSpan span = cm.ExpiryDate - cm.BuyDate;

            model.LicenseYears = (zeroTime + span).Year - 1;
            model.Module = cm.Module;

            return View(model);
        }

        [HttpPost]
        public ActionResult Edit(int id, EditUserLicenseViewModel model)
        {
            try
            {
                var toUpdate = _db.Customer_Modules.Single(c => c.OrderId == id);
                toUpdate.BuyDate = DateTime.ParseExact(model.BuyDate, "d", CultureInfo.CreateSpecificCulture("de-DE"));
                toUpdate.ExpiryDate = toUpdate.BuyDate.AddYears(model.LicenseYears);

                _db.SaveChanges();

                TempData["uihint"] = new UiHint("Erfolg!", "Die Lizenz wurde erfolgreich bearbeitet!",
                                                new { @class = "alert alert-success" });
                return RedirectToAction("Details", "User", new { id = toUpdate.User.UId });
            }
            catch (Exception)
            {
                TempData["uihint"] = new UiHint("Fehler!", "Da ist etwas schief gelaufen!",
                                                new { @class = "alert alert-error" });
                return RedirectToAction("Details", "User", new { id = model.CmId });
            }
        }
    }
}