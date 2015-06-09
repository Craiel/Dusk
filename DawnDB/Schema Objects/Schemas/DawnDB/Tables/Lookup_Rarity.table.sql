CREATE TABLE [dbo].[Lookup_Rarity]
(
	Id int NOT NULL, 
	Name VARCHAR(200) NOT NULL,

    Color int NULL, 
    CONSTRAINT [PK_Lookup_Rarity] PRIMARY KEY ([Id]),
)
