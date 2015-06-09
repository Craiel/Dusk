CREATE TABLE [dbo].[User_Raid_Instance_Spell]
(
    InstanceId BIGINT NOT NULL,
    SpellId int NOT NULL,
    UserId int NOT NULL, 

    CONSTRAINT [PK_Raid_Instance_Spell] PRIMARY KEY ([InstanceId]), 
    CONSTRAINT [AK_Raid_Instance_Spell] UNIQUE ( [InstanceId] , [SpellId] ), 
    CONSTRAINT [AK_Raid_Instance_Spell_User] UNIQUE ( [InstanceId] , [UserId] ),
	CONSTRAINT [FK_Raid_Instance_Spell] FOREIGN KEY ([InstanceId]) REFERENCES [User_Raid_Instance]([Id]),
)

GO
CREATE INDEX [IX_User_Raid_Instance_Spell_InstanceId] ON [dbo].[User_Raid_Instance_Spell] ([InstanceId])

GO
CREATE INDEX [IX_User_Raid_Instance_Spell_UserId] ON [dbo].[User_Raid_Instance_Spell] ([UserId])
