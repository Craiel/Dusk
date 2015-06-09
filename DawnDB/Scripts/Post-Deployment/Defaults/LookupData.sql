truncate table Lookup_ItemType;
insert into Lookup_ItemType (Id, Name)
values
(10, 'Crafting'),
(20, 'Head'),
(30, 'Chest'),
(40, 'Legs'),
(50, 'Boots'),
(60, 'Hands'),
(70, 'Belt'),
(80, 'MainHand'),
(90, 'OffHand'),
(100, 'Ring1'),
(101, 'Ring2'),
(110, 'Neck'),
(120, 'Vehicle'),
(130, 'Enchantment'),
(140, 'Passive'),
(150, 'Consumable'),
(160, 'Spell')

truncate table Lookup_RaidTier;
insert into Lookup_RaidTier (Id, Name)
values
(10, 'Normal'),
(20, 'Nightmare')

truncate table Lookup_RaidType;
insert into Lookup_RaidType (Id, Name)
values
(10, 'Solo'),
(20, 'Small'),
(30, 'Medium'),
(40, 'Large'),
(50, 'Event'),
(60, 'Guild')

truncate table Lookup_Rarity;
insert into Lookup_Rarity (Id, Name, Color)
values
(10, 'Normal', NULL),
(20, 'Grade 1', NULL),
(30, 'Grade 2', NULL),
(40, 'Grade 3', NULL),
(100, 'Grade S', NULL),
(110, 'Grade E', NULL)

truncate table Lookup_UnitAttunement;
insert into Lookup_UnitAttunement(Id, Name)
Values
(10, 'Fire'),
(20, 'Water'),
(31, 'Darkness'),
(32, 'Light'),
(40, 'Nature')

truncate table Lookup_UnitRace;
insert into Lookup_UnitRace (Id, Name)
Values
(10, 'Angelic'),
(20, 'Cyborg'),
(30, 'Dragonkin'),
(40, 'Elf'),
(50, 'Goblin'),
(60, 'Gnome'),
(70, 'Human'),
(80, 'Undead')

truncate table Lookup_UnitRole;
insert into Lookup_UnitRole (Id, Name)
Values
(1, 'Melee'),
(2, 'Ranged'),
(3, 'Healer'),
(4, 'Tank'),
(5, 'Support')

truncate table Lookup_UnitType;
insert into Lookup_UnitType (Id, Name)
Values
(1, 'Player'),
(2, 'Commander'),
(3, 'Troop'),
(4, 'Guardian')