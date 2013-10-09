using System.Web.Mvc;
using VersionR.Services;

namespace VersionR.Areas.Admin.Controllers
{
    [AuthorizeWithNotify(Roles = "Administrator,Supporter")]
    public class HomeController : Controller
    {
        private readonly VersionR.Models.VersionR _db = new VersionR.Models.VersionR();

        //
        // GET: /Admin/Home/
        public ActionResult Index()
        {
            return RedirectToAction("Index", "Dashboard");
        }
    }
}