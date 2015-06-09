CREATE TABLE [dbo].[Loot_Entry]
(
	LootId int NOT NULL,
	ItemId int NOT NULL,

    AllowMultiple bit NOT NULL default 0,

    Chance float NULL,
)

GO
CREATE INDEX [IX_Loot_Entry_LootId] ON [dbo].[Loot_Entry] ([LootId])
