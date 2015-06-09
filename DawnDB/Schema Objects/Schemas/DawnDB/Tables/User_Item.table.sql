CREATE TABLE [dbo].[User_Item]
(
    UserID int NOT NULL,
    ItemID int NOT NULL,
    Count int NOT NULL , 
    CONSTRAINT [AK_User_Item] UNIQUE ( [UserId], [ItemId] ),
	CONSTRAINT [FK_User_Item_User] FOREIGN KEY ([UserId]) REFERENCES [User]([Id]),
)

GO
CREATE INDEX [IX_User_Item] ON [dbo].[User_Item] ([UserId])

GO
CREATE INDEX [IX_User_Item_ItemId] ON [dbo].[User_Item] ([ItemId])
