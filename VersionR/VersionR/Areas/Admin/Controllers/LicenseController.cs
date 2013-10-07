using System;
using System.Globalization;
using System.Linq;
using System.Web.Mvc;
using VersionR.Areas.Admin.ViewModels;
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
            return View();
        }

        public ActionResult Add(int id)
        {
            var viewModel = new AddUserLicenseViewModel {User = _db.Users.Single(u => u.UId == id)};

            return View(viewModel);
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
                return RedirectToAction("Details", "User", new {id = id});
            }
            catch
            {
                return View(model);
            }
        }
    }
}