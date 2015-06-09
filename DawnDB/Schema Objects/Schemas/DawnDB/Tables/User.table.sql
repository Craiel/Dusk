CREATE TABLE [dbo].[User]
(
    Id int IDENTITY(1,1),

    /* Basic Stats */
    Name VARCHAR(200) NOT NULL,
    Level int NOT NULL DEFAULT 1,
    Experience BIGINT NOT NULL DEFAULT 0,
    [Credits] BIGINT NOT NULL DEFAULT 0,

    Attack int NOT NULL DEFAULT 0,
    Defense int NOT NULL DEFAULT 0,
    HP int NOT NULL DEFAULT 0,
	HPMax int NOT NULL DEFAULT 0,

    Leadership int NOT NULL DEFAULT 0,
	LeadershipMax int NOT NULL DEFAULT 0,

    /* User State */
    ActiveEquipmentSetId int NULL,
    NewUser BIT NOT NULL DEFAULT 1,

    [StatPoints] INT NOT NULL DEFAULT 0, 

    CONSTRAINT [PK_User] PRIMARY KEY ([Id]),
    CONSTRAINT [AK_User_Name] UNIQUE ([Name]),
    CONSTRAINT [FK_User_ActiveEquipSet] FOREIGN KEY ([ActiveEquipmentSetId]) REFERENCES [User_EquipSet]([Id]), 
    CONSTRAINT [CK_User_HP] CHECK (HP <= HPMax),
	CONSTRAINT [CK_User_Leadership] CHECK (Leadership <= LeadershipMax),
)

GO
CREATE INDEX [IX_User] ON [dbo].[User] ([Id])

GO
CREATE INDEX [IX_User_Level] ON [dbo].[User] ([Level])
