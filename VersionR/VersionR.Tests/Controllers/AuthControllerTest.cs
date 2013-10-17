using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.Mvc;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using VersionR;
using VersionR.Controllers;
using VersionR.Models;

namespace VersionR.Tests.Controllers
{
    [TestClass]
    public class AuthControllerTest
    {
        [TestMethod]
        public void Index()
        {
            AuthController controller = new AuthController();

            RedirectToRouteResult result = (RedirectToRouteResult)controller.Index();

            Assert.AreEqual("Index", result.RouteValues["action"]);
            Assert.AreEqual("Home", result.RouteValues["controller"]);
        }

                [TestMethod]
                public void LogOn()
                {
                    AuthController controller = new AuthController();

                    ViewResult result = controller.LogOn() as ViewResult;

                    Assert.IsNotNull(result);
                }

                [TestMethod]
                public void LogOn(LogOnModel model, string returnUrl)
                {
                    AuthController controller = new AuthController();

                    ActionResult result = controller.LogOn(model, returnUrl);

                    Assert.IsNull(result);
                }

        /*[TestMethod]
        public void LogOff()
        {
            AuthController controller = new AuthController();

            RedirectToRouteResult result = (RedirectToRouteResult)controller.LogOff();

            Assert.AreEqual("Index", result.RouteValues["action"]);
            Assert.AreEqual("Home", result.RouteValues["controller"]);
        }*/
    }
}