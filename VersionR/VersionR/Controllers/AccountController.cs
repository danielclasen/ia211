using System;
using System.Linq;
using System.Web.Mvc;
using VersionR.ModelsLocale;
using System.Security.Cryptography;
using System.Text;

namespace VersionR.Controllers
{
    public class AccountController : Controller
    {

        //VersionR.Models.ia211Entities db = new ia211Entities();
        VersionR.ModelsLocale.LocaleVersionREntities db = new ModelsLocale.LocaleVersionREntities();
        //
        // GET: /Account/

        public ActionResult Index()
        {
            
            var kunden = from m in db.Kunden
                         where true
                         select m;

            return View(kunden.ToList());

            //TODO: Check for Login, return different views
            //return View();
            
        }

        //
        // GET: /Account/Create/

        public ActionResult Create()
        {
            return View();
        }
        
        [HttpPost]
        public ActionResult Create(Kunden newKunde)
        {

            if (ModelState.IsValid)
            {
                newKunde.PwHash = getMD5Hash(newKunde.PwHash);
                db.AddToKunden(newKunde);
                db.SaveChanges();

                return RedirectToAction("Index");
            }
            else
            {
                return View(newKunde);
            }
        }

        //
        // GET: /Account/TestLocale/

        public ActionResult TestLocale()
        {
            VersionR.ModelsLocale.LocaleVersionREntities ent = new ModelsLocale.LocaleVersionREntities();

            var kundenList = from k in ent.Kunden
                             select k;

            return View(kundenList.ToList());
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
