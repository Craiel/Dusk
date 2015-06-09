CREATE TABLE [dbo].[Raid]
(
    Id int NOT NULL,
    Name VARCHAR(200) NOT NULL,

    ImageId int NULL,

    SpellSlots int NOT NULL DEFAULT 0, 
    Duration TIME NULL, 
    CONSTRAINT [PK_Raid] PRIMARY KEY ([Id]),
)

GO

CREATE INDEX [IX_Raid_Id] ON [dbo].[Raid] ([Id])
