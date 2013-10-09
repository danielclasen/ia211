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
    public class AccountControllerTest
	{
	
		[TestMethod]
		public void Index()
		{
			AccountController controller = new AccountController();
			
			ViewResult result = controller.Index() as ViewResult;
			
			Assert.IsNotNull(result);
		}
		
		[TestMethod]
		public void Create()
		{
			AccountController controller = new AccountController();
			
			ViewResult result = controller.Create() as ViewResult;
			
			ViewDataDictionary viewData = result.ViewData;
			Assert.AreEqual(new SelectList(db.Roles, "RId", "Name"), viewData["roleSelect"]);
		}
		
		[TestMethod]
		public void Create(User newUser)
		{
			AccountController controller = new AccountController();
			
			RedirectToRouteResult result = (RedirectToRouteResult)controller.Create(newUser);
			
			Assert.AreEqual("Index", result.RouteValues["action"]);
		}
	}
}