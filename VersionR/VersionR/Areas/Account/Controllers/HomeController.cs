using System.Linq;
using System.Web.Mvc;
using VersionR.Services;

namespace VersionR.Areas.Account.Controllers
{
    [AuthorizeWithNotify]
    [DataForMasterPage]
    public class HomeController : Controller
    {
        //
        // GET: /Account/Home/
        public ActionResult Index()
        {
            return RedirectToAction("Index", "Dashboard");
        }
    }
}