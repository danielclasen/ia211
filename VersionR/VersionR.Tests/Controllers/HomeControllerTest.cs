using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.Mvc;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using VersionR;
using VersionR.Controllers;

namespace VersionR.Tests.Controllers
{
    [TestClass]
    public class HomeControllerTest
    {
        [TestMethod]
        public void Index()
        {
            // Anordnen
            HomeController controller = new HomeController();

            // Aktion ausführen
            ViewResult result = controller.Index() as ViewResult;

            // Bestätigen
            ViewDataDictionary viewData = result.ViewData;
            Assert.AreEqual("Willkommen bei ASP.NET MVC", viewData["Message"]);
        }

        [TestMethod]
        public void About()
        {
            // Anordnen
            HomeController controller = new HomeController();

            // Aktion ausführen
            ViewResult result = controller.About() as ViewResult;

            // Bestätigen
            Assert.IsNotNull(result);
        }
    }
}
