CREATE TABLE [dbo].[User_Raid]
(
	UserId INT NOT NULL, 
    RaidInstanceId BIGINT NOT NULL, 
	Damage BIGINT NOT NULL DEFAULT 0,
    CONSTRAINT [AK_User_Raid] UNIQUE ( [UserId] , [RaidInstanceId] ),
	CONSTRAINT [FK_User_Raid] FOREIGN KEY ([UserId]) REFERENCES [User]([Id]),
	CONSTRAINT [FK_User_Raid_Instance] FOREIGN KEY ([RaidInstanceId]) REFERENCES [User_Raid_Instance]([Id]), 
    CONSTRAINT [PK_User_Raid] PRIMARY KEY ([UserId], [RaidInstanceId]),
)

GO
CREATE INDEX [IX_User_Raid_UserId] ON [dbo].[User_Raid] ([UserId])

GO
CREATE INDEX [IX_User_Raid_RaidId] ON [dbo].[User_Raid] ([RaidInstanceId])
