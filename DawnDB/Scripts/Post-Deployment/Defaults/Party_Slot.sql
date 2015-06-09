truncate table Party_Slot;
insert into Party_Slot (PartyId, TypeId, RoleId, RaceId, AttunementId, [Count])
values
/* March I */
(1, 1, NULL, NULL, NULL, 1),
(1, 2, NULL, NULL, NULL, 2),

/* March II */
(2, 1, NULL, NULL, NULL, 2),
(2, 2, NULL, NULL, NULL, 5),

/* Phalanx */
(3, 1, NULL, 3, NULL, 3),
(3, 2, NULL, 3, NULL, 6),

/* Danse Macabre */
(4, 1, NULL, 9, NULL, 3),
(4, 2, NULL, 9, NULL, 7),

/* Shield Wall */
(5, 1, 4, NULL, NULL, 2),
(5, 2, 4, NULL, NULL, 9)