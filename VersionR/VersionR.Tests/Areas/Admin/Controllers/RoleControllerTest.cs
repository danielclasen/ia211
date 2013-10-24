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
    public class RoleControllerTest
    {
        [TestMethod]
        public void Index()
        {
            RoleController controller = new RoleController();
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
                RoleController controller = new RoleController();

                controller.List(); // soll Exception werfen
                Assert.Fail(); // fehlgeschlagen, wenn es hierhin kommt
            }
            catch (EntityException ex)
            {
                Assert.IsTrue(ex is EntityException);
            }
        }

        [TestMethod]
        public void Details()
        {
            RoleController controller = new RoleController();
            int id = 0;

            RedirectToRouteResult result = (RedirectToRouteResult)controller.Details(id);

            Assert.AreEqual("List", result.RouteValues["action"]);
        }

        [TestMethod]
        public void Create()
        {
            RoleController controller = new RoleController();
            Role newRole = new Role();

            ViewResult result = controller.Create() as ViewResult;

            Assert.IsNotNull(result);

            try
            {
                controller.Create(newRole);
            }
            catch (EntityException ex)
            {
                Assert.IsTrue(ex is EntityException);
            }
        }

        [TestMethod]
        public void Edit()
        {
            RoleController controller = new RoleController();
            int id = 0;
            FormCollection collection = new FormCollection();

            try
            {
                controller.Edit(id);
            }
            catch (EntityException ex)
            {
                Assert.IsTrue(ex is EntityException);
            }
            finally
            {
                try
                {
                    controller.Edit(id, collection);
                }
                catch (EntityException ex)
                {
                    Assert.IsTrue(ex is EntityException);
                }
            }
        }

        [TestMethod]
        public void Delete()
        {
            RoleController controller = new RoleController();
            int id = 0;
            Role roleToDelete = new Role();

            try
            {
                controller.Delete(id);
            }
            catch (EntityException ex)
            {
                Assert.IsTrue(ex is EntityException);
            }
            finally
            {
                try
                {
                    controller.Delete(id, roleToDelete);
                }
                catch (EntityException ex)
                {
                    Assert.IsTrue(ex is EntityException);
                }
            }
        }
    }
}

