CREATE TABLE [dbo].[User_Enchantment_Spell]
(
	UserEnchantmentId int NOT NULL,
	SpellId int NOT NULL, 

	CONSTRAINT [FK_User_Enchantment_Spell] FOREIGN KEY ([UserEnchantmentId]) REFERENCES [User_Enchantment]([Id]),
)

GO
CREATE INDEX [IX_User_Enchantment_Spell_UserEnchantmentId] ON [dbo].[User_Enchantment_Spell] ([UserEnchantmentId])