CREATE TABLE [dbo].[Item_Spell]
(
	ItemId int NOT NULL, 
	SpellId int NOT NULL,

    Parameter VARCHAR(1000) NULL,
    DisplayText VARCHAR(1000) NULL,
    TriggerText VARCHAR(1000) NULL, 

    CONSTRAINT [AK_Item_Spell] UNIQUE ( [ItemId] , [SpellId] )
)

GO
CREATE INDEX [IX_Item_Spell_ItemId] ON [dbo].[Item_Spell] ([ItemId])

