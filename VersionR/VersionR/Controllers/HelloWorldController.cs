using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace VersionR.Controllers
{
    public class HelloWorldController : Controller
    {
        // 
        // GET: /HelloWorld/ 
        public ActionResult Index()
        {
            return View();
        }

        // 
        // GET: /Welcome/ 
        public ActionResult Welcome(string name, int num = 1)
        {
            ViewData["Message"] = "Hello " + name;
            ViewData["Num"] = num;
            return View();
        }
    }
}
