CREATE VIEW [dbo].[UserRaidView]
	AS SELECT u.UserId, u.RaidInstanceId, r.RaidId, r.TierId, r.OwnerId, u.Damage, r.Health, r.SpawnTime, r.Finished, r.[Public] FROM User_Raid as u, User_Raid_Instance as r where u.RaidInstanceId = r.Id;
