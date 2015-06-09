CREATE TABLE [dbo].[Spell]
(
	Id int NOT NULL,
    Text VARCHAR(1000) NULL,
    Method VARCHAR(200) NOT NULL,
    Parameter VARCHAR(1000) NULL,

    ImageId int NULL,
    RarityId int NOT NULL , 
    CONSTRAINT [PK_Spell] PRIMARY KEY ([Id]),
)

GO

CREATE INDEX [IX_Spell_Id] ON [dbo].[Spell] ([Id])
