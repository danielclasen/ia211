using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.Mvc;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using VersionR;
using VersionR.Areas.Admin.Controllers;

namespace VersionR.Tests.Areas.Admin.Controllers
{
    [TestClass]
    public class HomeControllerTest
    {
        [TestMethod]
        public void Index()
        {
            HomeController controller = new HomeController();

            RedirectToRouteResult result = (RedirectToRouteResult)controller.Index();

            Assert.AreEqual("Index", result.RouteValues["action"]);
            Assert.AreEqual("Dashboard", result.RouteValues["controller"]);
        }
    }
}