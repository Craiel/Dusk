CREATE TABLE [dbo].[Unit]
(
	Id int NOT NULL,
	Name VARCHAR(200) NOT NULL,

    ImageId int NULL,
    RarityId int NOT NULL ,
    
    TypeId int NOT NULL ,
    RaceId int NULL ,
    RoleId int NULL ,
    AttunementId int NULL,

    Attack int NOT NULL DEFAULT 0,
    Defense int NOT NULL DEFAULT 0,
    CONSTRAINT [PK_Unit] PRIMARY KEY ([Id]),
)

GO
CREATE INDEX [IX_Unit_Id] ON [dbo].[Unit] ([Id])


GO
CREATE INDEX [IX_Unit_TypeId] ON [dbo].[Unit] ([TypeId])
