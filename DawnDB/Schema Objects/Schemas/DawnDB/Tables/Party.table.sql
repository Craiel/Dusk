﻿CREATE TABLE [dbo].[Party]
(
	Id int NOT NULL, 
	Name VARCHAR(200) NOT NULL, 
    RarityId INT NOT NULL DEFAULT 0,
    CONSTRAINT [PK_Party] PRIMARY KEY ([Id]),
)
