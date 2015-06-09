CREATE TABLE [dbo].[Unit_Spell]
(
	UnitId int NOT NULL, 
	SpellId int NOT NULL,

    Parameter VARCHAR(1000) NULL,
    DisplayText VARCHAR(1000) NULL,
    TriggerText VARCHAR(1000) NULL, 
    CONSTRAINT [AK_Unit_Spell] UNIQUE ([UnitId] , [SpellId]),
)

GO
CREATE INDEX [IX_Unit_Spell_UnitId] ON [dbo].[Unit_Spell] ([UnitId])
