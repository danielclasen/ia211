using System;
using System.Collections.Generic;
using System.Data;
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
    public class ModuleControllerTest
    {
        [TestMethod]
        public void Index()
        {
            ModuleController controller = new ModuleController();
            int id = 0;

            RedirectToRouteResult result = (RedirectToRouteResult)controller.Index(id);

            Assert.AreEqual("List", result.RouteValues["action"]);

            id = 1;

            result = (RedirectToRouteResult)controller.Index(id);

            Assert.AreEqual("Details", result.RouteValues["action"]);
        }

        [TestMethod]
        public void List()
        {
            try
            {
                ModuleController controller = new ModuleController();

                controller.List(); // soll Exception werfen

                Assert.Fail(); // fehlgeschlagen, wenn es hierhin kommt
            }
            catch(EntityException ex)
            {
                Assert.IsTrue(ex is EntityException);
            }
        }

        [TestMethod]
        public void Details()
        {
            ModuleController controller = new ModuleController();
            int id = 0;

            RedirectToRouteResult result = (RedirectToRouteResult)controller.Details(id);

            Assert.AreEqual("List", result.RouteValues["action"]);
        }

        [TestMethod]
        public void Create()
        {
            ModuleController controller = new ModuleController();
            Module model = new Module();

            ViewResult result = controller.Create() as ViewResult;

            Assert.IsNotNull(result);

            try
            {
                controller.Create(model); // soll Exception werfen
                Assert.Fail(); // fehlgeschlagen, wenn es hierhin kommt
            }
            catch(EntityException ex)
            {
                Assert.IsTrue(ex is EntityException);
            }
        }

        [TestMethod]
        public void Edit()
        {
            ModuleController controller = new ModuleController();
            int id = 0;
            VersionR.Models.Version model = new VersionR.Models.Version();

            RedirectToRouteResult result = (RedirectToRouteResult)controller.Edit(id);

            Assert.AreEqual("List", result.RouteValues["action"]);

            result = (RedirectToRouteResult)controller.Edit(id, model);

            Assert.AreEqual("List", result.RouteValues["action"]);
        }

        [TestMethod]
        public void Delete()
        {
            ModuleController controller = new ModuleController();
            int id = 0;
            Module moduleToDelete = new Module();

            RedirectToRouteResult result = (RedirectToRouteResult)controller.Delete(id);

            Assert.AreEqual("List", result.RouteValues["action"]);

            result = (RedirectToRouteResult)controller.Delete(id, moduleToDelete);

            Assert.AreEqual("List", result.RouteValues["action"]);
        }
    }
}

