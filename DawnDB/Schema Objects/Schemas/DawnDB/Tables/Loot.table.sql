CREATE TABLE [dbo].[Loot]
(
	Id int NOT NULL, 
    CONSTRAINT [PK_Loot] PRIMARY KEY ([Id]),
)

GO
CREATE INDEX [IX_Loot_Id] ON [dbo].[Loot] ([Id])

