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
    public class UserLicensesControllerTest
    {
        [TestMethod]
        public void Index()
        {
            UserLicensesController controller = new UserLicensesController();

            ViewResult result = controller.Index() as ViewResult;

            Assert.IsNotNull(result);
        }
    }
}