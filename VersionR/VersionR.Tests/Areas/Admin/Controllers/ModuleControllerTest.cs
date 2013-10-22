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
    public class ModuleControllerTest
    {
        [TestMethod]
        public void Index()
        {
            ModuleController controller = new ModuleController();
            int id = 0;

            RedirectToRouteResult result = (RedirectToRouteResult)controller.Index(id);

            Assert.AreEqual("List", result.RouteValues["action"]);
        }
    }
}

