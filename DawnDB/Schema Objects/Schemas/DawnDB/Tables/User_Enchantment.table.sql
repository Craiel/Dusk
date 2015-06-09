CREATE TABLE [dbo].[User_Enchantment]
(
	Id int IDENTITY(1,1),
	UserId int NOT NULL,
    ItemId int NOT NULL,

    Attack int NOT NULL DEFAULT 0,
    Defense int NOT NULL DEFAULT 0,
    Perception int NOT NULL DEFAULT 0,

    CONSTRAINT [AK_User_Enchantment] UNIQUE ( [UserId] , [ItemId] ), 
	CONSTRAINT [FK_User_Enchantment] FOREIGN KEY ([UserId]) REFERENCES [User]([Id]), 
    CONSTRAINT [PK_User_Enchantment] PRIMARY KEY ([Id]),
)

GO
CREATE INDEX [IX_User_Enchantment] ON [dbo].[User_Enchantment] ([Id])

GO
CREATE INDEX [IX_User_Enchantment_UserId] ON [dbo].[User_Enchantment] ([UserId])

GO
CREATE INDEX [IX_User_Enchantment_ItemId] ON [dbo].[User_Enchantment] ([ItemId])
