truncate table Raid_TierData_Loot;
insert into Raid_TierData_Loot (TierDataId, Damage, LootId)
values
/* Squirrel Normal loot tiers */
(100, 100, 101),
(100, 200, 102),
(100, 500, 103),

/* Squirrel Nightmare loot tiers */
(101, 200, 111),
(101, 700, 112),
(101, 1500, 113),
(101, 3000, 114)