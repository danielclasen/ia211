

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace VersionR.Areas.Account.Controllers
{
    public class LicenceController : Controller
    {
		
		private readonly VersionR.Models.VersionR _db = new VersionR.Models.VersionR();
		private readonly DAL.Repositories _repos = new DAL.Repositories();

        //
        // GET: /Account/Licence/List
        public ActionResult List()
        {
            var curUser = _db.Users.Single(user => user.EMail.Equals(User.Identity.Name));
            return View(curUser);
        }
    }
}
