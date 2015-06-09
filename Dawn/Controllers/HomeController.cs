using System.Web.Mvc;

using Dusk.Dawn.Logic;
using Dusk.Dawn.Models;

namespace Dusk.Dawn.Controllers
{
    public class HomeController : BaseController
    {
        // -------------------------------------------------------------------
        // Public
        // -------------------------------------------------------------------
        public ActionResult Index()
        {
            ViewBag.Message = "Home";

            HomeModel model = this.GetModel();
            if (model == null)
            {
                return this.ForceLogout();
            }

            return this.View(model);
        }

        public ActionResult Raid()
        {
            if (!DawnLogic.DawnCOP("Home|Raid", User.Identity))
            {
                return this.ForceLogout();
            }

            ViewBag.Message = "Raid";

            HomeModel model = this.GetModel();
            if (model == null)
            {
                return this.ForceLogout();
            }

            return this.View(model);
        }

        public ActionResult Party()
        {
            if (!DawnLogic.DawnCOP("Home|Party", User.Identity))
            {
                return this.ForceLogout();
            }

            ViewBag.Message = "Party";

            HomeModel model = this.GetModel();
            if (model == null)
            {
                return this.ForceLogout();
            }

            return this.View(model);
        }

        public ActionResult Inventory()
        {
            if (!DawnLogic.DawnCOP("Home|Inventory", User.Identity))
            {
                return this.ForceLogout();
            }

            ViewBag.Message = "Inventory";
            
            HomeModel model = this.GetModel();
            if (model == null)
            {
                return this.ForceLogout();
            }

            return this.View(model);
        }

        // -------------------------------------------------------------------
        // Private
        // -------------------------------------------------------------------
        private HomeModel GetModel()
        {
            User userData = DawnLogic.GetUserInformation(User.Identity);
            if (userData == null)
            {
                return null;
            }

            return new HomeModel(userData);
        }
    }
}
