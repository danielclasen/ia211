using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.Mvc;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using VersionR;
using VersionR.Models;
using VersionR.Areas.Admin.Controllers;

namespace VersionR.Tests.Areas.Admin.Controllers
{
    [TestClass]
    public class LicenseControllerTest
    {   
        [TestMethod]
        public void Index()
        {
            LicenseController controller = new LicenseController();

            RedirectToRouteResult result = (RedirectToRouteResult)controller.Index();

            Assert.AreEqual("Index", result.RouteValues["action"]);
            Assert.AreEqual("Home", result.RouteValues["controller"]);
        }

        [TestMethod]
        public void Add()
        {
            LicenseController controller = new LicenseController();

            int id = 0;
            var viewModel = new VersionR.Areas.Admin.ViewModels.AddUserLicenseViewModel();

            ViewResult result = controller.Add(id, viewModel) as ViewResult;

            // Aufruf der View wird erwartet, weil viewModel keine Informationen enthält
            Assert.IsNotNull(result);
        }

        [TestMethod]
        public void Delete()
        {
            LicenseController controller = new LicenseController();
            int id = 0;
            Customer_Modules toDelete = new Customer_Modules();

            RedirectToRouteResult result = (RedirectToRouteResult)controller.Delete(id);

            Assert.AreEqual("Index", result.RouteValues["action"]);
            Assert.AreEqual("Home", result.RouteValues["controller"]);
        }
    }
}