CREATE TABLE [dbo].[Raid_TierData_Loot]
(
	TierDataId int NOT NULL,

    Damage bigint NOT NULL DEFAULT 0,
    LootId int NOT NULL, 
)

GO
CREATE INDEX [IX_Raid_TierData_Loot_TierDataId] ON [dbo].[Raid_TierData_Loot] ([TierDataId])
