CREATE TABLE [dbo].[User_EquipSet]
(
    Id int IDENTITY(1,1),
    UserId int NOT NULL,
    Name VARCHAR(200) NOT NULL,
    CanDelete BIT NOT NULL DEFAULT 1,

    HelmetId int NULL,
    ChestId int NULL,
    LegsId int NULL,
    BootsId int NULL,
    HandsId int NULL,
    MainHandId int NULL,
    OffHandId int NULL,
    RingId int NULL,
    MountId int NULL, 
    CONSTRAINT [PK_User_EquipSet] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_User_EquipSet] FOREIGN KEY ([UserId]) REFERENCES [User]([Id])
)

GO

CREATE INDEX [IX_User_EquipSet] ON [dbo].[User_EquipSet] ([Id])

GO
CREATE INDEX [IX_User_EquipSet_UserId] ON [dbo].[User_EquipSet] ([UserId])
