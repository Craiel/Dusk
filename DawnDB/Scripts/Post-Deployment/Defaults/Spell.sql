truncate table Spell;
insert into Spell (Id, Text, RarityId, ImageId, Method, Parameter)
values
(10001, 'Increases Energy by {value}', 0, 0, 'SpellAddEnergy', NULL),
(10002, 'Increases Stamina by {value}', 0, 0, 'SpellAddStamina', NULL),
(10003, 'Increases Honor by {value}', 0, 0, 'SpellAddHonor', NULL),
(10004, 'Increases Health by {value}', 0, 0, 'SpellAddHealth', NULL),
(10005, 'Increases Attack by {value}', 0, 0, 'SpellAddAttack', NULL),
(10006, 'Increases Defense by {value}', 0, 0, 'SpellAddDefense', NULL),

(50001, 'PVP Bonus: +{value} Power', 0, 0, 'SpellAddPvpPower', NULL),
(50201, 'PVP Bonus: +{value} Deflect', 0, 0, 'SpellAddPvpDeflect', NULL)

