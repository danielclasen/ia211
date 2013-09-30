using System;
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

        //VersionR.Models.ia211Entities db = new ia211Entities();
        VersionR.Models.VersionR db = new VersionR.Models.VersionR();
        //
        // GET: /Account/

        public ActionResult Index()
        {
            
            var users = from m in db.Users
                         where true
                         select m;

            return View(users.ToList());

            //TODO: Check for Login, return different views
            //return View();
            
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
                db.AddToUsers(newUser);
                db.SaveChanges();

                return RedirectToAction("Index");
            }
            else
            {
                return View(newUser);
            }
        }


    }
}
