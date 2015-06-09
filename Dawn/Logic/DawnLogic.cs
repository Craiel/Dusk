using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Security.Principal;

using Dusk.Dawn.Models;

namespace Dusk.Dawn.Logic
{
    public class DawnLogic
    {
        private static readonly IDictionary<string, KeyValuePair<string, DateTime>> UserRequestCheck = new Dictionary<string, KeyValuePair<string, DateTime>>();

        private static readonly TimeSpan SpamTimeSpan = TimeSpan.FromMilliseconds(200);

        private static List<LookupItemType> itemTypes = new List<LookupItemType>();
        private static List<LookupRaidTier> raidTiers = new List<LookupRaidTier>();
        private static List<LookupRaidType> raidTypes = new List<LookupRaidType>();
        private static List<LookupRarity> rarities = new List<LookupRarity>();
        private static List<LookupUnitAttunement> unitAttunements = new List<LookupUnitAttunement>();
        private static List<LookupUnitRace> unitRaces = new List<LookupUnitRace>();
        private static List<LookupUnitRole> unitRoles = new List<LookupUnitRole>();
        private static List<LookupUnitType> unitTypes = new List<LookupUnitType>();
        
        // -------------------------------------------------------------------
        // Public
        // -------------------------------------------------------------------
        public static ReadOnlyCollection<LookupItemType> ItemTypes
        {
            get
            {
                return itemTypes.AsReadOnly();
            }
        }

        public static ReadOnlyCollection<LookupRaidTier> RaidTiers
        {
            get
            {
                return raidTiers.AsReadOnly();
            }
        }

        public static ReadOnlyCollection<LookupRaidType> RaidTypes
        {
            get
            {
                return raidTypes.AsReadOnly();
            }
        }

        public static ReadOnlyCollection<LookupRarity> Rarities
        {
            get
            {
                return rarities.AsReadOnly();
            }
        }

        public static ReadOnlyCollection<LookupUnitAttunement> UnitAttunements
        {
            get
            {
                return unitAttunements.AsReadOnly();
            }
        }

        public static ReadOnlyCollection<LookupUnitRace> UnitRaces
        {
            get
            {
                return unitRaces.AsReadOnly();
            }
        }

        public static ReadOnlyCollection<LookupUnitRole> UnitRoles
        {
            get
            {
                return unitRoles.AsReadOnly();
            }
        }

        public static ReadOnlyCollection<LookupUnitType> UnitTypes
        {
            get
            {
                return unitTypes.AsReadOnly();
            }
        }

        public static void ReloadCache()
        {
            using (var context = new LookupDataClassesDataContext())
            {
                itemTypes = context.LookupItemTypes.ToList();
                raidTiers = context.LookupRaidTiers.ToList();
                raidTypes = context.LookupRaidTypes.ToList();
                rarities = context.LookupRarities.ToList();
                unitAttunements = context.LookupUnitAttunements.ToList();
                unitRaces = context.LookupUnitRaces.ToList();
                unitRoles = context.LookupUnitRoles.ToList();
                unitTypes = context.LookupUnitTypes.ToList();
            }
        }

        public static bool DawnCOP(string source, IIdentity identity)
        {
            // Basic argument check
            if (!identity.IsAuthenticated || string.IsNullOrEmpty(source))
            {
                return false;
            }

            // Check if we are getting the same request within 200ms
            if (UserRequestCheck.ContainsKey(identity.Name))
            {
                var pair = UserRequestCheck[identity.Name];
                if (pair.Key == source && (DateTime.Now - pair.Value) < SpamTimeSpan)
                {
                    return false;
                }

                UserRequestCheck.Remove(identity.Name);
            }

            UserRequestCheck.Add(identity.Name, new KeyValuePair<string, DateTime>(source, DateTime.Now));
            return true;
        }
        
        public static User GetUserInformation(IIdentity identity)
        {
            System.Diagnostics.Trace.TraceInformation("[GetUserInformation - {0}]", identity.Name);
            User userData = UpdateUserState(identity);
            if (userData == null)
            {
                return null;
            }

            return userData;
        }

        public static IList<UserRaidView> GetNewUserRaids(IIdentity identity)
        {
            System.Diagnostics.Trace.TraceInformation("[GetNewUserRaids - {0}]", identity.Name);
            User userData = UpdateUserState(identity);
            if (userData == null)
            {
                return null;
            }

            using (var context = new DataClassesDataContext())
            {
                return (from raid in context.UserRaidViews where raid.UserId == userData.Id select raid).ToList();
            }
        }

        public static IList<UserRaidView> GetActiveUserRaids(IIdentity identity)
        {
            System.Diagnostics.Trace.TraceInformation("[GetActiveUserRaids - {0}]", identity.Name);
            User userData = UpdateUserState(identity);
            if (userData == null)
            {
                return null;
            }

            using (var context = new DataClassesDataContext())
            {
                return (from raid in context.UserRaidViews where raid.UserId == userData.Id && raid.Damage > 0 select raid).ToList();
            }
        }

        public static IList<UserRaidView> GetCompleteUserRaids(IIdentity identity)
        {
            System.Diagnostics.Trace.TraceInformation("[GetCompleteUserRaids - {0}]", identity.Name);
            User userData = UpdateUserState(identity);
            if (userData == null)
            {
                return null;
            }

            using (var context = new DataClassesDataContext())
            {
                return (from raid in context.UserRaidViews where raid.UserId == userData.Id && raid.Finished select raid).ToList();
            }
        }

        public static List<Raid> GetSpawnableRaids(IIdentity identity)
        {
            System.Diagnostics.Trace.TraceInformation("[GetSpawnableRaids - {0}]", identity.Name);
            User userData = UpdateUserState(identity);
            if (userData == null)
            {
                return null;
            }

            // Todo: for now we allow spawning everything, have to check the acquired raids later on
            using (var context = new GameDataClassesDataContext())
            {
                return context.Raids.ToList();
            }
        }

        public static UserRaidView GetUserRaid(IIdentity identity, int raidId)
        {
            System.Diagnostics.Trace.TraceInformation("[GetUserRaid - {0}] {1}", identity.Name, raidId);
            User userData = UpdateUserState(identity);
            if (userData == null)
            {
                return null;
            }

            using (var context = new DataClassesDataContext())
            {
                UserRaidView view =
                    (from raid in context.UserRaidViews
                     where raid.RaidId == raidId && raid.UserId == userData.Id
                     select raid).SingleOrDefault();
                if (view == null)
                {
                    System.Diagnostics.Trace.TraceError("Could not get raid view");
                }

                return view;
            }
        }

        public static long GetNeededExperience(IIdentity identity)
        {
            System.Diagnostics.Trace.TraceInformation("[GetNeededExperience - {0}]", identity.Name);
            User userData = UpdateUserState(identity);
            if (userData == null)
            {
                return -1;
            }

            // Todo:
            return 1;
        }

        public static Raid GetRaidInfo(int id)
        {
            System.Diagnostics.Trace.TraceInformation("[GetRaidInfo] {1}", id);
            using (var context = new GameDataClassesDataContext())
            {
                Raid info = context.Raids.SingleOrDefault(x => x.Id == id);
                if (info == null)
                {
                    System.Diagnostics.Trace.TraceError("Unknown raid id");
                }

                return info;
            }
        }

        public static UserRaid JoinRaid(IIdentity identity, long instanceId)
        {
            System.Diagnostics.Trace.TraceInformation("[JoinRaid - {0}] {1}", identity.Name, instanceId);
            User userData = UpdateUserState(identity);
            if (userData == null)
            {
                return null;
            }

            using (var context = new DataClassesDataContext())
            {
                UserRaidInstance instance = context.UserRaidInstances.FirstOrDefault(x => x.Id == instanceId);
                if (instance == null || instance.Finished)
                {
                    System.Diagnostics.Trace.TraceError("Join failed, no such raid");
                    return null;
                }

                var raid = new UserRaid { RaidInstanceId = instanceId, UserId = userData.Id };
                context.UserRaids.InsertOnSubmit(raid);
                context.SubmitChanges();
                return raid;
            }
        }

        public static bool LeaveRaid(IIdentity identity, long instanceId)
        {
            System.Diagnostics.Trace.TraceInformation("[LeaveRaid - {0}] {1}", identity.Name, instanceId);
            User userData = UpdateUserState(identity);
            if (userData == null)
            {
                return false;
            }

            using (var context = new DataClassesDataContext())
            {
                UserRaidView instance = context.UserRaidViews.FirstOrDefault(x => x.RaidInstanceId == instanceId);
                if (instance == null)
                {
                    System.Diagnostics.Trace.TraceError("Leave raid called with invalid instance id");
                    return false;
                }

                // If we did damage leaving is not valid
                if (instance.Damage > 0)
                {
                    System.Diagnostics.Trace.TraceWarning("Leave raid attempted on damaged raid");
                    return true;
                }

                var raid = context.UserRaids.FirstOrDefault(x => x.RaidInstanceId == instanceId && x.UserId == userData.Id);
                if (raid == null)
                {
                    System.Diagnostics.Trace.TraceError("Leave raid could not find the instance connection");
                    return false;
                }

                context.UserRaids.DeleteOnSubmit(raid);
                context.SubmitChanges();
                return true;
            }
        }

        public static UserRaid SpawnRaid(IIdentity identity, int id, int tier)
        {
            System.Diagnostics.Trace.TraceInformation("[SpawnRaid - {0}] {1}, {2}", identity.Name, id, tier);
            User userData = UpdateUserState(identity);
            if (userData == null)
            {
                return null;
            }

            using (var userContext = new DataClassesDataContext())
            {
                using (var context = new GameDataClassesDataContext())
                {
                    Raid raidData = context.Raids.SingleOrDefault(x => x.Id == id);
                    if (raidData == null)
                    {
                        return null;
                    }
                    
                    RaidTierData raidTierData = context.RaidTierDatas.SingleOrDefault(x => x.TierId == tier && x.RaidId == id);
                    if (raidTierData == null)
                    {
                        return null;
                    }

                    var raidInstance = new UserRaidInstance
                        {
                            OwnerId = userData.Id,
                            RaidId = raidData.Id,
                            Finished = false,
                            Health = raidTierData.Health,
                            SpawnTime = DateTime.Now,
                            TierId = tier
                        };
                    userContext.UserRaidInstances.InsertOnSubmit(raidInstance);
                    userContext.SubmitChanges();

                    var raid = new UserRaid { RaidInstanceId = raidInstance.Id, UserId = userData.Id };
                    userContext.UserRaids.InsertOnSubmit(raid);
                    userContext.SubmitChanges();
                    return raid;
                }
            }
        }

        // -------------------------------------------------------------------
        // Private
        // -------------------------------------------------------------------
        private static User UpdateUserState(IIdentity identity)
        {
            System.Diagnostics.Trace.TraceInformation("[UpdateUserState - {0}]", identity.Name);
            if (!identity.IsAuthenticated)
            {
                System.Diagnostics.Trace.TraceError("Identity was not authenticated");
                return null;
            }

            User userData;
            using (var context = new DataClassesDataContext())
            {
                userData = (from user in context.Users where user.Name == identity.Name select user).SingleOrDefault();
            }

            if (userData == null)
            {
                System.Diagnostics.Trace.TraceError("User data not found");
                return null;
            }

            if (!UpdateUserRaids(userData))
            {
                System.Diagnostics.Trace.TraceError("User raids could not be updated");
                return null;
            }

            return userData;
        }

        private static bool UpdateUserRaids(User userData)
        {
            System.Diagnostics.Trace.TraceInformation("[UpdateUserRaids - {0}]", userData.Name);
            using (var context = new DataClassesDataContext())
            {
                IList<UserRaidView> expiredRaids = new List<UserRaidView>();
                IList<UserRaidView> raids = (from raid in context.UserRaidViews where raid.UserId == userData.Id select raid).ToList();

                // Check for raids that ran out and we did not do anything with in time
                foreach (UserRaidView raid in raids)
                {
                    Raid info = GetRaidInfo(raid.RaidId);
                    if ((DateTime.Now - raid.SpawnTime) > info.Duration && raid.Damage <= 0 && raid.OwnerId != userData.Id)
                    {
                        expiredRaids.Add(raid);
                    }
                }

                foreach (UserRaidView raid in expiredRaids)
                {
                    UserRaid raidEntry = userData.UserRaids.Single(x => x.RaidInstanceId == raid.RaidInstanceId);
                    userData.UserRaids.Remove(raidEntry);
                    raids.Remove(raid);
                }

                context.SubmitChanges();
                return true;
            }
        }
    }
}