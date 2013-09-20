using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Data.Entity;
using VersionR.Models;

namespace VersionR.Controllers
{
    public class AccountController : Controller
    {

        VersionR.Models.ia211Entities db = new ia211Entities();
        //
        // GET: /Account/

        public ActionResult Index()
        {
            
            var kunden = from m in db.Kundens 
                         where true
                         select m;

            return View(kunden.ToList());

            //TODO: Check for Login, return different views
            //return View();
            
        }

        //
        // GET: /Account/Details/

        public ActionResult Details()
        {
            //TODO: Check for Login, return different views
            return View();

        }

    }
}
