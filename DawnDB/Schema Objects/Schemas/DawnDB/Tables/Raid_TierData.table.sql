CREATE TABLE [dbo].[Raid_TierData]
(
    Id int NOT NULL,
    RaidId int NOT NULL,
    TierId int NOT NULL,

    LootId int NULL,

    Health bigint NULL,
    Attack int NOT NULL DEFAULT 0,

    Gold int NOT NULL DEFAULT 0, 
    CONSTRAINT [PK_Raid_TierData] PRIMARY KEY ([Id]), 
    CONSTRAINT [AK_Raid_TierData_Tier] UNIQUE ( [RaidId] , [TierId] ),
)

GO
CREATE INDEX [IX_Raid_TierData_RaidId] ON [dbo].[Raid_TierData] ([RaidId])

GO
CREATE INDEX [IX_Raid_TierData_TierId] ON [dbo].[Raid_TierData] ([TierId])
