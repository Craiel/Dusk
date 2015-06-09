CREATE TABLE [dbo].[User_Raid_Instance]
(
    Id bigint IDENTITY(1,1), 
    RaidId int NOT NULL,
    TierId int NOT NULL,
	OwnerId int NOT NULL,

    SpawnTime DATETIME NOT NULL,
    Health bigint NULL, 
	Finished bit NOT NULL default 0,
    [Public] BIT NOT NULL DEFAULT 0, 
    CONSTRAINT [PK_Raid_Instance] PRIMARY KEY ([Id]),
)

GO
CREATE INDEX [IX_User_Raid_Instance_Id] ON [dbo].[User_Raid_Instance] ([Id])
