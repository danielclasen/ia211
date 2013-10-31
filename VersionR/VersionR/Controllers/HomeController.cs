using System.Web.Mvc;
using VersionR.Services;

namespace VersionR.Controllers
{
    [HandleError]
    [DataForMasterPage]
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult About()
        {
            return View();
        }
    }
}