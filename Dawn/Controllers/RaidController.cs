using System.Web.Mvc;

using Dusk.Dawn.Logic;
using Dusk.Dawn.Models;

namespace Dusk.Dawn.Controllers
{
    public class RaidController : BaseController
    {
        // -------------------------------------------------------------------
        // Public
        // -------------------------------------------------------------------
        public ActionResult ListNew()
        {
            if (!DawnLogic.DawnCOP("Raid|ListNew", User.Identity))
            {
                return this.ForceLogout();
            }

            return this.PartialView("RaidList", new RaidListModel(User.Identity, RaidListMode.New));
        }

        public ActionResult ListActive()
        {
            if (!DawnLogic.DawnCOP("Raid|ListActive", User.Identity))
            {
                return this.ForceLogout();
            }

            return this.PartialView("RaidList", new RaidListModel(User.Identity, RaidListMode.Active));
        }

        public ActionResult ListComplete()
        {
            if (!DawnLogic.DawnCOP("Raid|ListComplete", User.Identity))
            {
                return this.ForceLogout();
            }

            return this.PartialView("RaidList", new RaidListModel(User.Identity, RaidListMode.Complete));
        }

        public ActionResult ListSpawn()
        {
            if (!DawnLogic.DawnCOP("Raid|ListSpawn", User.Identity))
            {
                return this.ForceLogout();
            }

            return this.PartialView("SpawnRaid", new RaidUserModel(User.Identity));
        }

        public ActionResult Spawn(int id, int tier)
        {
            if (!DawnLogic.DawnCOP("Raid|Spawn", User.Identity))
            {
                return this.ForceLogout();
            }

            // Todo Test
            UserRaid raidData = DawnLogic.SpawnRaid(User.Identity, id, tier);
            if (raidData == null)
            {
                // The spawn failed
                this.ForceLogout();
            }

            return this.RedirectToAction("Raid", "Home");
        }

        public ActionResult Enter(int id)
        {
            if (!DawnLogic.DawnCOP("Raid|Enter", User.Identity))
            {
                return this.ForceLogout();
            }

            UserRaidView raidView = DawnLogic.GetUserRaid(User.Identity, id);
            if (raidView == null)
            {
                this.ForceLogout();
            }

            Raid raidInfo = DawnLogic.GetRaidInfo(raidView.RaidId);
            if (raidInfo == null)
            {
                this.ForceLogout();
            }

            return this.PartialView("RaidCombat", new RaidCombatModel(raidInfo, raidView));
        }

        public ActionResult Leave(int id)
        {
            if (!DawnLogic.DawnCOP("Raid|Leave", User.Identity))
            {
                return this.ForceLogout();
            }

            DawnLogic.LeaveRaid(User.Identity, id);
            return this.View();
        }

        public ActionResult Loot(int id)
        {
            if (!DawnLogic.DawnCOP("Raid|Loot", User.Identity))
            {
                return this.ForceLogout();
            }

            // Todo
            return this.PartialView("RaidLoot", new RaidLootModel(null));
        }
    }
}
