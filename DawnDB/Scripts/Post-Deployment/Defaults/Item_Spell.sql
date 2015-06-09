truncate table Item_Spell;
insert into Item_Spell (ItemId, SpellId, Parameter, DisplayText, TriggerText)
values

/* PVP Bonus */
(200002, 50001, '25', NULL, NULL),
(200003, 50001, '25', NULL, NULL),
(800004, 50002, '3', NULL, NULL),

/* Health Boosts */
(800004, 10004, '35', NULL, NULL),
(900002, 10004, '10', NULL, NULL),

/* Defense Boosts */
(1000001, 10006, '2', 'Equine Might: {SpellText}', NULL),

/* Energy Boosts */
(900001, 10001, '8', NULL, NULL),
(400001, 10001, '4', NULL, NULL),

/* Stamina Boosts */
(900003, 10002, '4', '{SpellText}; Danger! Danger!', NULL)