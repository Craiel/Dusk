using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Diagnostics.CodeAnalysis;
using System.Security.Principal;

using Dusk.Dawn.Logic;

namespace Dusk.Dawn.Models
{
    public enum RaidListMode
    {
        New,
        Active,
        Complete,
    }

    public class RaidListModel
    {
        private readonly IList<UserRaidView> raids;

        // -------------------------------------------------------------------
        // Constructor
        // -------------------------------------------------------------------
        public RaidListModel(IIdentity identity, RaidListMode mode)
        {
            switch (mode)
            {
                case RaidListMode.New:
                    {
                        this.raids = DawnLogic.GetNewUserRaids(identity);
                        break;
                    }

                case RaidListMode.Active:
                    {
                        this.raids = DawnLogic.GetActiveUserRaids(identity);
                        break;
                    }

                case RaidListMode.Complete:
                    {
                        this.raids = DawnLogic.GetCompleteUserRaids(identity);
                        break;
                    }

                default:
                    {
                        throw new NotImplementedException("List mode is not implemented: " + mode);
                    }
            }
        }

        // -------------------------------------------------------------------
        // Public
        // -------------------------------------------------------------------
        public ReadOnlyCollection<UserRaidView> Raids
        {
            get
            {
                if (this.raids == null)
                {
                    return null;
                }

                return new ReadOnlyCollection<UserRaidView>(this.raids);
            }
        }

        public ReadOnlyCollection<LookupRaidTier> RaidTiers
        {
            get
            {
                return DawnLogic.RaidTiers;
            }
        }
    }

    [SuppressMessage("StyleCop.CSharp.MaintainabilityRules", "SA1402:FileMayOnlyContainASingleClass", Justification = "Reviewed. Suppression is OK here.")]
    public class RaidUserModel
    {
        private readonly List<Raid> spawnableRaids;

        // -------------------------------------------------------------------
        // Constructor
        // -------------------------------------------------------------------
        public RaidUserModel(IIdentity identity)
        {
            this.spawnableRaids = DawnLogic.GetSpawnableRaids(identity);
        }

        // -------------------------------------------------------------------
        // Public
        // -------------------------------------------------------------------
        public ReadOnlyCollection<Raid> SpawnableRaids
        {
            get
            {
                return this.spawnableRaids.AsReadOnly();
            }
        }

        public ReadOnlyCollection<LookupRaidTier> RaidTiers
        {
            get
            {
                return DawnLogic.RaidTiers;
            }
        }
    }

    public class RaidLootModel
    {
        private readonly IDictionary<Item, int> loot;

        // -------------------------------------------------------------------
        // Constructor
        // -------------------------------------------------------------------
        public RaidLootModel(IDictionary<Item, int> loot)
        {
            this.loot = loot;
        }

        // -------------------------------------------------------------------
        // Public
        // -------------------------------------------------------------------
        public IDictionary<Item, int> Loot
        {
            get
            {
                return this.loot;
            }
        }
    }

    public class RaidCombatModel
    {
        private readonly Raid raidInfo;
        private readonly UserRaidView userView;

        // -------------------------------------------------------------------
        // Constructor
        // -------------------------------------------------------------------
        public RaidCombatModel(Raid raidInfo, UserRaidView userView)
        {
            this.raidInfo = raidInfo;
            this.userView = userView;
        }

        // -------------------------------------------------------------------
        // Public
        // -------------------------------------------------------------------
        public int RaidId
        {
            get
            {
                return this.raidInfo.Id;
            }
        }

        public long InstanceId
        {
            get
            {
                return this.userView.RaidInstanceId;
            }
        }

        public int? ImageId
        {
            get
            {
                return this.raidInfo.ImageId;
            }
        }

        public string Name
        {
            get
            {
                return this.raidInfo.Name;
            }
        }

        public long? Health
        {
            get
            {
                return this.userView.Health;
            }
        }

        public long DamageDone
        {
            get
            {
                return this.userView.Damage;
            }
        }

        public TimeSpan TimeRemaining
        {
            get
            {
                return DateTime.Now - this.userView.SpawnTime;
            }
        }
    }
}
