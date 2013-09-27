using System;
using System.Linq;
using System.Web.Mvc;
using VersionR.Models;
using System.Security.Cryptography;
using System.Text;

namespace VersionR.Controllers
{
    public class AccountController : Controller
    {

        //VersionR.Models.ia211Entities db = new ia211Entities();
        VersionR.Models.VersionR_ia211_local_entities db = new VersionR_ia211_local_entities();
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
                newUser.PwHash = getMD5Hash(newUser.PwHash);
                db.AddToUsers(newUser);
                db.SaveChanges();

                return RedirectToAction("Index");
            }
            else
            {
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

    }
}
