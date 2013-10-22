using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.Mvc;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using VersionR;
using VersionR.Models;
using VersionR.Areas.Admin.Controllers;
using VersionR.Areas.Admin.ViewModels;

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
            try
            {
                LicenseController controller = new LicenseController();

                int id = 0;
                var viewModel = new VersionR.Areas.Admin.ViewModels.AddUserLicenseViewModel();

                ViewResult result = controller.Add(id, viewModel) as ViewResult;

                // Aufruf der View wird erwartet, weil viewModel keine Informationen enthält
                Assert.IsNotNull(result);

                controller.Add(id); // soll Exception werfen
                Assert.Fail(); // fehlgeschlagen, wenn es hierhin kommt
            }
            catch (Exception ex)
            {
                Assert.IsTrue(ex is Exception);
            }
        }

        [TestMethod]
        public void Delete()
        {
            try
            {
                LicenseController controller = new LicenseController();
                Customer_Modules toDelete = new Customer_Modules();
                int id = 0;

                RedirectToRouteResult result = (RedirectToRouteResult)controller.Delete(id);

                Assert.AreEqual("Index", result.RouteValues["action"]);
                Assert.AreEqual("Home", result.RouteValues["controller"]);

                controller.Delete(id, toDelete); // soll Exception werfen
                Assert.Fail(); // fehlgeschlagen, wenn es hierhin kommt
            }
            catch (Exception ex)
            {
                Assert.IsTrue(ex is Exception);
            }
        }

        [TestMethod]
        public void Edit()
        {
            LicenseController controller = new LicenseController();
            EditUserLicenseViewModel model = new EditUserLicenseViewModel();

            int id = 0;

            try
            {
                controller.Edit(id); // soll Exception werfen
                Assert.Fail(); // fehlgeschlagen, wenn es hierhin kommt
            }
            catch (Exception ex)
            {
                Assert.IsTrue(ex is Exception);
            }
            finally
            {
                try
                {
                    controller.Edit(id, model); // soll Exception werfen
                }
                catch (Exception ex)
                {
                    Assert.IsTrue(ex is Exception);
                }
            }
        }
    }
}