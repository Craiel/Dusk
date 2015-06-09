CREATE TABLE [dbo].[Party_Slot]
(
	PartyId int NOT NULL,
	
    TypeId int NOT NULL ,
    RaceId int NULL ,
    RoleId int NULL ,
    AttunementId int NULL, 
    Count INT NOT NULL DEFAULT 1, 
    CONSTRAINT [CK_Party_Slot_Count] CHECK ([Count]>0),
)

GO
CREATE INDEX [IX_Party_Slot_LegionId] ON [dbo].[Party_Slot] ([PartyId])
