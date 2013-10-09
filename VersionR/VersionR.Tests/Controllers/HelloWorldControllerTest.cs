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
    public class HelloWorldControllerTest
	{
		[TestMethod]
		public void Index()
		{
			HelloWorldController controller = new HelloWorldController();
			
			ViewResult result = controller.Index() as ViewResult;
			
			Assert.IsNotNull(result);
		}
		
		[TestMethod]
		public void Welcome(string name = "Test", int num = 1)
		{
			HelloWorldController controller = new HelloWorldController();
			
			ViewResult result = controller.Welcome(name, num) as ViewResult;
			
			ViewDataDictionary viewData = result.ViewData;
			
			Assert.AreEqual("Hello " + name, viewData["Message"]);
			Assert.AreEqual(num, viewData["Num"]);
		}
		
		[TestMethod]
		public void List(string name = "Test", int num = 1)
		{
			HelloWorldController controller = new HelloWorldController();
			
			ViewResult result = controller.List(name, num) as ViewResult;
			
			ViewDataDictionary viewData = result.ViewData;
			
			Assert.AreEqual("Hello " + name, viewData["Message"]);
			Assert.AreEqual(num, viewData["Num"]);
		}
	}
}