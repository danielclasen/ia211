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
    public class ServiceUserControllerTest
    {
        [TestMethod]
        public void Index()
        {
            ServiceUserController controller = new ServiceUserController();

            ViewResult result = controller.Index() as ViewResult;

            Assert.IsNotNull(result);
        }
    }
}