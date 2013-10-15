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
    public class DashboardControllerTest
    {
        [TestMethod]
        public void Index()
        {
            DashboardController controller = new DashboardController();

            ViewResult result = controller.Index() as ViewResult;

            Assert.IsNotNull(result);
        }
    }
}