using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using VersionR.Models;
using System.Security.Cryptography;
using System.Text;
using System.Data.Objects;

namespace VersionR.Controllers
{
    public class AdminController : Controller
    {

        VersionR.Models.VersionR db = new VersionR.Models.VersionR();

        //
        // GET: /Admin/
        public ActionResult Index()
        {
            
            return View();
        }

       

        //
        // GET: /Account/

        public ActionResult Users()
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

        public ActionResult CreateUser()
        {

            var roles = from r in db.Roles select r;
            ViewData["roleSelect"] = new SelectList(roles, "RId", "Name");

            return View();
        }

        [HttpPost]
        public ActionResult CreateUser(User newUser, int newUserRole)
        {

            if (ModelState.IsValid && newUserRole != 0)
            {
                newUser.RId = newUserRole;
                newUser.PwHash = getMD5Hash(newUser.PwHash);
                db.AddToUsers(newUser);
                db.SaveChanges();

                return RedirectToAction("Users");
            }
            else
            {
                var roles = from r in db.Roles select r;
                ViewData["roleSelect"] = new SelectList(roles, "RId", "Name");
                return View(newUser);
            }
        }

        /// <summary>
        /// Gibt einen MD5 Hash als String zurück
        /// </summary>
        /// <param name="TextToHash">string der Gehasht werden soll.</param>
        /// <returns>Hash als string.</returns>
        public static string getMD5Hash(string TextToHash)
        {
            //Prüfen ob Daten übergeben wurden.
            if ((TextToHash == null) || (TextToHash.Length == 0))
            {
                throw new FormatException("Password empty!");
            }

            //MD5 Hash aus dem String berechnen. Dazu muss der string in ein Byte[]
            //zerlegt werden. Danach muss das Resultat wieder zurück in ein string.
            MD5 md5 = new MD5CryptoServiceProvider();
            byte[] textToHash = Encoding.Default.GetBytes(TextToHash);
            byte[] result = md5.ComputeHash(textToHash);

            string ret = System.BitConverter.ToString(result);
            return ret.Replace("-", "");
        }




        //
        // GET: /Roles/
        public ActionResult Roles()
        {
            var roles = from m in db.Roles
                        where true
                        select m;

            return View(roles.ToList());
        }

        //
        // GET: /DetailsRole/
        public ActionResult DetailsRole(int id)
        {
            try
            {
                var role = db.Roles.FirstOrDefault(r => r.RId == id);
                return View(role);
            }
            catch (Exception e)
            {
                return RedirectToAction("Roles");
            }

        }

        //
        // GET: /Account/Create/
        public ActionResult CreateRole()
        {
            return View();
        }

        [HttpPost]
        public ActionResult CreateRole(Role newRole)
        {

            if (ModelState.IsValid)
            {
                db.AddToRoles(newRole);
                db.SaveChanges();

                return RedirectToAction("Roles");
            }
            else
            {
                return View(newRole);
            }
        }

        //
        // GET: /Account/Edit/editRoleId
        public ActionResult EditRole(int id)
        {
            return View(db.Roles.FirstOrDefault(R => R.RId == id));            
        }

        [HttpPost]
        public ActionResult EditRole(int id, FormCollection collection)
        {
            var role = db.Roles.Single(r => r.RId == id);
            
            try
            {                
                UpdateModel(role);
                db.SaveChanges();                
                return RedirectToAction("Roles");                
            }
            catch(Exception e)
            {
                return View(role);
            }

        }


        //
        // GET: /Account/Edit/editRoleId
        public ActionResult DeleteRole(int id)
        {

            var affectedUsers = from m in db.Users
                        where m.RId == id
                        select m;

            ViewData["affectedUsers"] = affectedUsers.ToList();

            return View(db.Roles.FirstOrDefault(R => R.RId == id));
        }

        [HttpPost]
        public ActionResult DeleteRole(int id, Role roleToDelete)
        {

            var role = db.Roles.FirstOrDefault(r => r.RId == id);
            
            try
            {   
               
                var affectedUsers = from u in db.Users
                                    where u.RId == role.RId
                                    select u;

                foreach (var user in affectedUsers){
                    db.Users.DeleteObject(user);
                }                    
                db.Roles.DeleteObject(role);
                db.SaveChanges();
                return RedirectToAction("Roles");
            }
            catch (Exception e)
            {
                ViewData["error"] = e.ToString();
                return View(role);
            }

        }

        
    }
}
