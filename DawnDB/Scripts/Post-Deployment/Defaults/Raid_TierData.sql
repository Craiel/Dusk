truncate table Raid_TierData;
insert into Raid_TierData (Id, RaidId, TierId, Health, Attack, Gold, LootId)
values
/* Squirrel */
(100, 10, 10, 1000, 1, 1, NULL),
(101, 10, 20, 3000, 3, 3, NULL),

/* Squirrel Pack */
(201, 20, 10, 10000, 5, 10, NULL),
(202, 20, 20, 50000, 30, 50, NULL)