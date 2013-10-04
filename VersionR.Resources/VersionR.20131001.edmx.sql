
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, and Azure
-- --------------------------------------------------
-- Date Created: 10/01/2013 19:46:20
-- Generated from EDMX file: C:\Users\clase_000\.git-repos\ia211\VersionR\VersionR\Models\VersionR.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [ia211];
GO
IF SCHEMA_ID(N'gr2') IS NULL EXECUTE(N'CREATE SCHEMA [gr2]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[gr2].[FK__Customer___ModId__60924D76]', 'F') IS NOT NULL
    ALTER TABLE [gr2].[Customer_Modules] DROP CONSTRAINT [FK__Customer___ModId__60924D76];
GO
IF OBJECT_ID(N'[gr2].[FK__Customer_M__CmId__5F9E293D]', 'F') IS NOT NULL
    ALTER TABLE [gr2].[Customer_Modules] DROP CONSTRAINT [FK__Customer_M__CmId__5F9E293D];
GO
IF OBJECT_ID(N'[gr2].[FK__Downloads__CmId__627A95E8]', 'F') IS NOT NULL
    ALTER TABLE [gr2].[Downloads] DROP CONSTRAINT [FK__Downloads__CmId__627A95E8];
GO
IF OBJECT_ID(N'[gr2].[FK__Downloads__VrId__618671AF]', 'F') IS NOT NULL
    ALTER TABLE [gr2].[Downloads] DROP CONSTRAINT [FK__Downloads__VrId__618671AF];
GO
IF OBJECT_ID(N'[gr2].[FK__Manuals__VrId__636EBA21]', 'F') IS NOT NULL
    ALTER TABLE [gr2].[Manuals] DROP CONSTRAINT [FK__Manuals__VrId__636EBA21];
GO
IF OBJECT_ID(N'[gr2].[FK__Users__RId__6462DE5A]', 'F') IS NOT NULL
    ALTER TABLE [gr2].[Users] DROP CONSTRAINT [FK__Users__RId__6462DE5A];
GO
IF OBJECT_ID(N'[gr2].[FK__Versions__EmId__5DB5E0CB]', 'F') IS NOT NULL
    ALTER TABLE [gr2].[Versions] DROP CONSTRAINT [FK__Versions__EmId__5DB5E0CB];
GO
IF OBJECT_ID(N'[gr2].[FK__Versions__ModId__5EAA0504]', 'F') IS NOT NULL
    ALTER TABLE [gr2].[Versions] DROP CONSTRAINT [FK__Versions__ModId__5EAA0504];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[gr2].[Customer_Modules]', 'U') IS NOT NULL
    DROP TABLE [gr2].[Customer_Modules];
GO
IF OBJECT_ID(N'[gr2].[Downloads]', 'U') IS NOT NULL
    DROP TABLE [gr2].[Downloads];
GO
IF OBJECT_ID(N'[gr2].[Manuals]', 'U') IS NOT NULL
    DROP TABLE [gr2].[Manuals];
GO
IF OBJECT_ID(N'[gr2].[Modules]', 'U') IS NOT NULL
    DROP TABLE [gr2].[Modules];
GO
IF OBJECT_ID(N'[gr2].[Roles]', 'U') IS NOT NULL
    DROP TABLE [gr2].[Roles];
GO
IF OBJECT_ID(N'[gr2].[Users]', 'U') IS NOT NULL
    DROP TABLE [gr2].[Users];
GO
IF OBJECT_ID(N'[gr2].[Versions]', 'U') IS NOT NULL
    DROP TABLE [gr2].[Versions];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Customer_Modules'
CREATE TABLE [gr2].[Customer_Modules] (
    [OrderId] int IDENTITY(1,1) NOT NULL,
    [CmId] int  NOT NULL,
    [ModId] int  NOT NULL,
    [BuyDate] datetime  NOT NULL,
    [ExpiryDate] datetime  NOT NULL
);
GO

-- Creating table 'Downloads'
CREATE TABLE [gr2].[Downloads] (
    [DlId] int IDENTITY(1,1) NOT NULL,
    [DlDate] datetime  NOT NULL,
    [VrId] int  NOT NULL,
    [CmId] int  NOT NULL
);
GO

-- Creating table 'Manuals'
CREATE TABLE [gr2].[Manuals] (
    [MId] int IDENTITY(1,1) NOT NULL,
    [VrId] int  NOT NULL,
    [Title] varchar(100)  NOT NULL,
    [Description] varchar(max)  NULL,
    [Filename] varchar(200)  NOT NULL
);
GO

-- Creating table 'Modules'
CREATE TABLE [gr2].[Modules] (
    [ModId] int IDENTITY(1,1) NOT NULL,
    [Name] varchar(64)  NOT NULL,
    [PricePerYear] decimal(18,2)  NOT NULL
);
GO

-- Creating table 'Roles'
CREATE TABLE [gr2].[Roles] (
    [RId] int IDENTITY(1,1) NOT NULL,
    [Name] varchar(30)  NOT NULL
);
GO

-- Creating table 'Users'
CREATE TABLE [gr2].[Users] (
    [UId] int IDENTITY(1,1) NOT NULL,
    [NickName] varchar(64)  NOT NULL,
    [EMail] varchar(64)  NOT NULL,
    [Phone] varchar(32)  NULL,
    [RId] int  NOT NULL,
    [PwHash] varchar(32)  NOT NULL
);
GO

-- Creating table 'Versions'
CREATE TABLE [gr2].[Versions] (
    [VrId] int IDENTITY(1,1) NOT NULL,
    [Relase] tinyint  NOT NULL,
    [SubRelease] tinyint  NOT NULL,
    [BuildId] varchar(32)  NOT NULL,
    [Platform] varchar(50)  NOT NULL,
    [Filename] varchar(200)  NOT NULL,
    [Description] varchar(64)  NULL,
    [ReleaseDate] datetime  NOT NULL,
    [EmId] int  NOT NULL,
    [ModId] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [OrderId] in table 'Customer_Modules'
ALTER TABLE [gr2].[Customer_Modules]
ADD CONSTRAINT [PK_Customer_Modules]
    PRIMARY KEY CLUSTERED ([OrderId] ASC);
GO

-- Creating primary key on [DlId] in table 'Downloads'
ALTER TABLE [gr2].[Downloads]
ADD CONSTRAINT [PK_Downloads]
    PRIMARY KEY CLUSTERED ([DlId] ASC);
GO

-- Creating primary key on [MId] in table 'Manuals'
ALTER TABLE [gr2].[Manuals]
ADD CONSTRAINT [PK_Manuals]
    PRIMARY KEY CLUSTERED ([MId] ASC);
GO

-- Creating primary key on [ModId] in table 'Modules'
ALTER TABLE [gr2].[Modules]
ADD CONSTRAINT [PK_Modules]
    PRIMARY KEY CLUSTERED ([ModId] ASC);
GO

-- Creating primary key on [RId] in table 'Roles'
ALTER TABLE [gr2].[Roles]
ADD CONSTRAINT [PK_Roles]
    PRIMARY KEY CLUSTERED ([RId] ASC);
GO

-- Creating primary key on [UId] in table 'Users'
ALTER TABLE [gr2].[Users]
ADD CONSTRAINT [PK_Users]
    PRIMARY KEY CLUSTERED ([UId] ASC);
GO

-- Creating primary key on [VrId] in table 'Versions'
ALTER TABLE [gr2].[Versions]
ADD CONSTRAINT [PK_Versions]
    PRIMARY KEY CLUSTERED ([VrId] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [ModId] in table 'Customer_Modules'
ALTER TABLE [gr2].[Customer_Modules]
ADD CONSTRAINT [FK__Customer___ModId__60924D76]
    FOREIGN KEY ([ModId])
    REFERENCES [gr2].[Modules]
        ([ModId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK__Customer___ModId__60924D76'
CREATE INDEX [IX_FK__Customer___ModId__60924D76]
ON [gr2].[Customer_Modules]
    ([ModId]);
GO

-- Creating foreign key on [CmId] in table 'Customer_Modules'
ALTER TABLE [gr2].[Customer_Modules]
ADD CONSTRAINT [FK__Customer_M__CmId__5F9E293D]
    FOREIGN KEY ([CmId])
    REFERENCES [gr2].[Users]
        ([UId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK__Customer_M__CmId__5F9E293D'
CREATE INDEX [IX_FK__Customer_M__CmId__5F9E293D]
ON [gr2].[Customer_Modules]
    ([CmId]);
GO

-- Creating foreign key on [CmId] in table 'Downloads'
ALTER TABLE [gr2].[Downloads]
ADD CONSTRAINT [FK__Downloads__CmId__627A95E8]
    FOREIGN KEY ([CmId])
    REFERENCES [gr2].[Users]
        ([UId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK__Downloads__CmId__627A95E8'
CREATE INDEX [IX_FK__Downloads__CmId__627A95E8]
ON [gr2].[Downloads]
    ([CmId]);
GO

-- Creating foreign key on [VrId] in table 'Downloads'
ALTER TABLE [gr2].[Downloads]
ADD CONSTRAINT [FK__Downloads__VrId__618671AF]
    FOREIGN KEY ([VrId])
    REFERENCES [gr2].[Versions]
        ([VrId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK__Downloads__VrId__618671AF'
CREATE INDEX [IX_FK__Downloads__VrId__618671AF]
ON [gr2].[Downloads]
    ([VrId]);
GO

-- Creating foreign key on [VrId] in table 'Manuals'
ALTER TABLE [gr2].[Manuals]
ADD CONSTRAINT [FK__Manuals__VrId__636EBA21]
    FOREIGN KEY ([VrId])
    REFERENCES [gr2].[Versions]
        ([VrId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK__Manuals__VrId__636EBA21'
CREATE INDEX [IX_FK__Manuals__VrId__636EBA21]
ON [gr2].[Manuals]
    ([VrId]);
GO

-- Creating foreign key on [ModId] in table 'Versions'
ALTER TABLE [gr2].[Versions]
ADD CONSTRAINT [FK__Versions__ModId__5EAA0504]
    FOREIGN KEY ([ModId])
    REFERENCES [gr2].[Modules]
        ([ModId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK__Versions__ModId__5EAA0504'
CREATE INDEX [IX_FK__Versions__ModId__5EAA0504]
ON [gr2].[Versions]
    ([ModId]);
GO

-- Creating foreign key on [RId] in table 'Users'
ALTER TABLE [gr2].[Users]
ADD CONSTRAINT [FK__Users__RId__6462DE5A]
    FOREIGN KEY ([RId])
    REFERENCES [gr2].[Roles]
        ([RId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK__Users__RId__6462DE5A'
CREATE INDEX [IX_FK__Users__RId__6462DE5A]
ON [gr2].[Users]
    ([RId]);
GO

-- Creating foreign key on [EmId] in table 'Versions'
ALTER TABLE [gr2].[Versions]
ADD CONSTRAINT [FK__Versions__EmId__5DB5E0CB]
    FOREIGN KEY ([EmId])
    REFERENCES [gr2].[Users]
        ([UId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK__Versions__EmId__5DB5E0CB'
CREATE INDEX [IX_FK__Versions__EmId__5DB5E0CB]
ON [gr2].[Versions]
    ([EmId]);
GO


-- --------------------------------------------------
-- Insert data
-- --------------------------------------------------


--Insert role

INSERT INTO [gr2].[Roles]
VALUES ('Administrator'),('Supporter'),('Customer')


--Insert user
INSERT INTO [gr2].[Users]
VALUES ('admin','admin@versionr.com','123',1,'21232f297a57a5a743894a0e4a801fc3')



-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------