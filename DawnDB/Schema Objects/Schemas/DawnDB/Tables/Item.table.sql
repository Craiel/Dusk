CREATE TABLE [dbo].[Item]
(
    Id int NOT NULL,
    Name VARCHAR(200) NOT NULL,
    TypeId int NOT NULL ,

    Description VARCHAR(1000) NULL,
    ImageId int NULL,
    RarityId int NOT NULL ,

    Attack int NOT NULL DEFAULT 0,
    Defense int NOT NULL DEFAULT 0,
    CONSTRAINT [PK_Item] PRIMARY KEY ([Id])
)

GO
CREATE INDEX [IX_Item_Id] ON [dbo].[Item] ([Id])

GO
CREATE INDEX [IX_Item_TypeId] ON [dbo].[Item] ([TypeId])

GO
CREATE INDEX [IX_Item_Rarity] ON [dbo].[Item] ([RarityId])
