CREATE TABLE [dbo].[Party_Spell]
(
	PartyId int NOT NULL,
	SpellId int NOT NULL,

    Parameter VARCHAR(1000) NULL,
    DisplayText VARCHAR(1000) NULL,
    TriggerText VARCHAR(1000) NULL, 

    CONSTRAINT [AK_Party_Spell] UNIQUE ( [PartyId] , [SpellId] ),
)

GO
CREATE INDEX [IX_Party_Spell_LegionId] ON [dbo].[Party_Spell] ([PartyId])

