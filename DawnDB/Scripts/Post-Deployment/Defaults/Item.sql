truncate table Item;
insert into Item 
(Id, Name, Description, TypeId, RarityId, ImageId, Attack, Defense)
values
(0, 'Unknown', NULL, 0, 0, 0, 0, 0),

/* Halloween Masks */
(2001, 'Scylla Mask', NULL, 2, 1, 0, 1, 2),
(2002, 'Countess Serpina Mask 1', NULL, 2, 10, 0, 1, 1),
(2003, 'Countess Serpina Mask 2', NULL, 2, 10, 0, 1, 1),
(2004, 'D''rach Mask', NULL, 2, 10, 0, 1, 1),
(2005, 'Erebus Mask', NULL, 2, 1, 0, 2, 3),
(2006, 'Al-Azab Mask', NULL, 2, 1, 0, 3, 4),
(2007, 'Groblar Mask', NULL, 2, 1, 0, 4, 3),
(2008, 'Tained Erebus Mask', NULL, 2, 1, 0, 4, 4),
(2009, 'Echthros Mask', NULL, 2, 1, 0, 5, 5),
(2010, 'Kang-Gsod Mask', NULL, 2, 1, 0, 5, 5),
(2011, 'Headmaster Grimsly Mask', NULL, 2, 1, 0, 5, 5),
(2012, 'Maraak the Impaler Mask', NULL, 2, 1, 0, 5, 5),
(2013, 'Dirthax Mask', NULL, 2, 1, 0, 5, 5),
(2014, 'Tithrasia Mask', NULL, 2, 1, 0, 5, 5),
(2015, 'Black Moon Mask', NULL, 2, 1, 0, 5, 5),
(2016, 'Varlachleth Mask', NULL, 2, 1, 0, 5, 5),
(2017, 'Nidhogg Mask', NULL, 2, 1, 0, 5, 5),
(2018, 'Mardachus Mask', NULL, 2, 1, 0, 5, 5),
(2019, 'Bloodmane Mask', NULL, 2, 1, 0, 5, 5),
(2020, 'Tisiphone Mask', NULL, 2, 1, 0, 5, 5),
(2021, 'Prince Obyron Mask', NULL, 2, 1, 0, 5, 5),
(2022, 'Tyranthius Mask', NULL, 2, 1, 0, 5, 5),
(2023, 'Ironclad Mask', NULL, 2, 1, 0, 5, 5),
(2024, 'Zombie Mask', NULL, 2, 1, 0, 6, 5),
(2025, 'Bogstench Mask', NULL, 2, 1, 0, 6, 6),


/* Studded Leather Set */
(10001, 'Studded Leather Chest', NULL, 3, 1, 0, 5, 5),
(10002, 'Studded Leather Pants', NULL, 4, 1, 0, 5, 5),
(10003, 'Studded Leather Boots', NULL, 5, 1, 0, 5, 5),
(10004, 'Studded Leather Gloves', NULL, 6, 1, 0, 5, 5),

/* Bronze Set */
(10010, 'Bronze Breastplate', NULL, 3, 1, 0, 6, 14),
(10011, 'Bronze Pants', NULL, 4, 1, 0, 6, 14),
(10012, 'Bronze Boots', NULL, 5, 1, 0, 6, 14),
(10013, 'Bronze Helm', NULL, 2, 1, 0, 6, 14),
(10014, 'Bronze Gloves', NULL, 6, 1, 0, 6, 14),

/* Random Chests */
(300001, 'Farmhand Tunic', NULL, 3, 1, 0, 1, 1),
(300002, 'Silver Breastplate', NULL, 3, 2, 0, 8, 10),

/* Random Legs */
(400001, 'Fairy Pants', NULL, 4, 4, 0, 10, 10),

/* Random Boots */

/* Random Hands */
(600001, 'Brass Gloves', NULL, 6, 1, 0, 1, 1),
(600002, 'Blademaster Handguards', NULL, 6, 3, 0, 7, 11),

/* Random Main Hand */
(700001, 'Dagger', NULL, 7, 1, 0, 1, 0),
(700002, 'Parrying Dagger', NULL, 7, 1, 0, 3, 15),
(700003, 'Axe of the Silent Sentinel', NULL, 7, 3, 0, 6, 14),
(700004, 'Short Spear', NULL, 7, 1, 0, 8, 2),

/* Random Off Hand */
(800001, 'Small Shield', NULL, 8, 1, 0, 1, 0),
(800002, 'Medium Shield', NULL, 8, 1, 0, 5, 15),
(800003, 'Telamon''s Bulwark', NULL, 8, 2, 0, 6, 14),
(800004, 'Merman''s Net', NULL, 8, 4, 0, 7, 16),

/* Random Ring */
(900002, 'Garnet Ring', NULL, 9, 1, 0, 8, 8),
(900003, 'Warning Ring', NULL, 9, 4, 0, 10, 70),

/* Random Mount */
(1000001, 'Plough Horse', NULL, 10, 11, 0, 8, 8)