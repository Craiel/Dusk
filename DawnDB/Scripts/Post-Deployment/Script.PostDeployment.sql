/*
Post-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.		
 Use SQLCMD syntax to include a file in the post-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the post-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/

/* Lookup data first */
:r .\Defaults\LookupData.sql

/* Now actual game data */
:r .\Defaults\Spell.sql

:r .\Defaults\Item.sql
:r .\Defaults\Item_Spell.sql

:r .\Defaults\Party.sql
:r .\Defaults\Party_Slot.sql

:r .\Defaults\Loot.sql
:r .\Defaults\Loot_Entry.sql

:r .\Defaults\Raid.sql
:r .\Defaults\Raid_TierData.sql
:r .\Defaults\Raid_TierData_Loot.sql

