using System.Web.Mvc;
using System.Web.Security;

namespace Dusk.Dawn.Controllers
{
    public abstract class BaseController : Controller
    {
        // -------------------------------------------------------------------
        // Protected
        // -------------------------------------------------------------------
        protected RedirectToRouteResult ForceLogout()
        {
            FormsAuthentication.SignOut();
            Session.Clear();
            return this.RedirectToAction("Login", "Account");
        }
    }
}
