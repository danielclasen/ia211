﻿using System;
using System.Linq;
using System.Web.Mvc;
using VersionR.Models;
using System.Security.Cryptography;
using System.Text;

using VersionR.Services;

namespace VersionR.Controllers
{
    [Authorize]
    public class AccountController : Controller
    {

        
        VersionR.Models.VersionR db = new VersionR.Models.VersionR();
        DAL.Repositories repos = new DAL.Repositories();

        //
        // GET: /Account/

        public ActionResult Index()
        {
            
            //var users = from m in db.Users
            //             where true
            //             select m;

            var users = repos.UserRepoistory.Get();
            /*
             * TODO Codebeispiel!
             * Beispiel für ein Filter z.B. für select Anweisungen o.ä.
                var users = repos.UserRepoistory.Get(filter: f => f.NickName.StartsWith("test"));
             * */
            return View(users.ToList());            
        }

        //
        // GET: /Account/Create/

        public ActionResult Create()
        {

            ViewData["roleSelect"] = new SelectList(db.Roles, "RId", "Name");

            return View();
        }
        
        [HttpPost]
        public ActionResult Create(User newUser)
        {

            if (ModelState.IsValid)
            {
                newUser.PwHash = PasswordService.getMD5Hash(newUser.PwHash);
                repos.UserRepoistory.Insert(newUser);
                repos.Save();

                return RedirectToAction("Index");
            }
            else
            {
                return View(newUser);
            }
        }


    }
}
