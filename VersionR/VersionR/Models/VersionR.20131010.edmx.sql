
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, and Azure
-- --------------------------------------------------
-- Date Created: 10/10/2013 08:38:22
-- Generated from EDMX file: D:\Daten\Users\DClasen\Documents\GitHub\ia211\VersionR\VersionR\Models\VersionR.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [VersionR];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
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
CREATE TABLE [dbo].[Customer_Modules] (
    [OrderId] int IDENTITY(1,1) NOT NULL,
    [CmId] int  NOT NULL,
    [ModId] int  NOT NULL,
    [BuyDate] datetime  NOT NULL,
    [ExpiryDate] datetime  NOT NULL
);
GO

-- Creating table 'Downloads'
CREATE TABLE [dbo].[Downloads] (
    [DlId] int IDENTITY(1,1) NOT NULL,
    [DlDate] datetime  NOT NULL,
    [VrId] int  NOT NULL,
    [CmId] int  NOT NULL
);
GO

-- Creating table 'Manuals'
CREATE TABLE [dbo].[Manuals] (
    [MId] int IDENTITY(1,1) NOT NULL,
    [VrId] int  NOT NULL,
    [Title] varchar(100)  NOT NULL,
    [Description] varchar(max)  NULL,
    [Filename] varchar(200)  NOT NULL
);
GO

-- Creating table 'Modules'
CREATE TABLE [dbo].[Modules] (
    [ModId] int IDENTITY(1,1) NOT NULL,
    [Name] varchar(64)  NOT NULL,
    [PricePerYear] decimal(18,2)  NOT NULL
);
GO

-- Creating table 'Roles'
CREATE TABLE [dbo].[Roles] (
    [RId] int IDENTITY(1,1) NOT NULL,
    [Name] varchar(30)  NOT NULL
);
GO

-- Creating table 'Users'
CREATE TABLE [dbo].[Users] (
    [UId] int IDENTITY(1,1) NOT NULL,
    [NickName] varchar(64)  NOT NULL,
    [EMail] varchar(64)  NOT NULL,
    [Phone] varchar(32)  NULL,
    [RId] int  NOT NULL,
    [PwHash] varchar(32)  NOT NULL
);
GO

-- Creating table 'Versions'
CREATE TABLE [dbo].[Versions] (
    [VrId] int IDENTITY(1,1) NOT NULL,
    [SubRelease] tinyint  NOT NULL,
    [BuildId] varchar(32)  NOT NULL,
    [Platform] varchar(50)  NOT NULL,
    [Filename] varchar(200)  NOT NULL,
    [Description] varchar(64)  NULL,
    [ReleaseDate] datetime  NOT NULL,
    [EmId] int  NOT NULL,
    [ModId] int  NOT NULL,
    [Release] tinyint  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [OrderId] in table 'Customer_Modules'
ALTER TABLE [dbo].[Customer_Modules]
ADD CONSTRAINT [PK_Customer_Modules]
    PRIMARY KEY CLUSTERED ([OrderId] ASC);
GO

-- Creating primary key on [DlId] in table 'Downloads'
ALTER TABLE [dbo].[Downloads]
ADD CONSTRAINT [PK_Downloads]
    PRIMARY KEY CLUSTERED ([DlId] ASC);
GO

-- Creating primary key on [MId] in table 'Manuals'
ALTER TABLE [dbo].[Manuals]
ADD CONSTRAINT [PK_Manuals]
    PRIMARY KEY CLUSTERED ([MId] ASC);
GO

-- Creating primary key on [ModId] in table 'Modules'
ALTER TABLE [dbo].[Modules]
ADD CONSTRAINT [PK_Modules]
    PRIMARY KEY CLUSTERED ([ModId] ASC);
GO

-- Creating primary key on [RId] in table 'Roles'
ALTER TABLE [dbo].[Roles]
ADD CONSTRAINT [PK_Roles]
    PRIMARY KEY CLUSTERED ([RId] ASC);
GO

-- Creating primary key on [UId] in table 'Users'
ALTER TABLE [dbo].[Users]
ADD CONSTRAINT [PK_Users]
    PRIMARY KEY CLUSTERED ([UId] ASC);
GO

-- Creating primary key on [VrId] in table 'Versions'
ALTER TABLE [dbo].[Versions]
ADD CONSTRAINT [PK_Versions]
    PRIMARY KEY CLUSTERED ([VrId] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [ModId] in table 'Customer_Modules'
ALTER TABLE [dbo].[Customer_Modules]
ADD CONSTRAINT [FK__Customer___ModId__60924D76]
    FOREIGN KEY ([ModId])
    REFERENCES [dbo].[Modules]
        ([ModId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK__Customer___ModId__60924D76'
CREATE INDEX [IX_FK__Customer___ModId__60924D76]
ON [dbo].[Customer_Modules]
    ([ModId]);
GO

-- Creating foreign key on [CmId] in table 'Customer_Modules'
ALTER TABLE [dbo].[Customer_Modules]
ADD CONSTRAINT [FK__Customer_M__CmId__5F9E293D]
    FOREIGN KEY ([CmId])
    REFERENCES [dbo].[Users]
        ([UId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK__Customer_M__CmId__5F9E293D'
CREATE INDEX [IX_FK__Customer_M__CmId__5F9E293D]
ON [dbo].[Customer_Modules]
    ([CmId]);
GO

-- Creating foreign key on [CmId] in table 'Downloads'
ALTER TABLE [dbo].[Downloads]
ADD CONSTRAINT [FK__Downloads__CmId__627A95E8]
    FOREIGN KEY ([CmId])
    REFERENCES [dbo].[Users]
        ([UId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK__Downloads__CmId__627A95E8'
CREATE INDEX [IX_FK__Downloads__CmId__627A95E8]
ON [dbo].[Downloads]
    ([CmId]);
GO

-- Creating foreign key on [VrId] in table 'Downloads'
ALTER TABLE [dbo].[Downloads]
ADD CONSTRAINT [FK__Downloads__VrId__618671AF]
    FOREIGN KEY ([VrId])
    REFERENCES [dbo].[Versions]
        ([VrId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK__Downloads__VrId__618671AF'
CREATE INDEX [IX_FK__Downloads__VrId__618671AF]
ON [dbo].[Downloads]
    ([VrId]);
GO

-- Creating foreign key on [VrId] in table 'Manuals'
ALTER TABLE [dbo].[Manuals]
ADD CONSTRAINT [FK__Manuals__VrId__636EBA21]
    FOREIGN KEY ([VrId])
    REFERENCES [dbo].[Versions]
        ([VrId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK__Manuals__VrId__636EBA21'
CREATE INDEX [IX_FK__Manuals__VrId__636EBA21]
ON [dbo].[Manuals]
    ([VrId]);
GO

-- Creating foreign key on [ModId] in table 'Versions'
ALTER TABLE [dbo].[Versions]
ADD CONSTRAINT [FK__Versions__ModId__5EAA0504]
    FOREIGN KEY ([ModId])
    REFERENCES [dbo].[Modules]
        ([ModId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK__Versions__ModId__5EAA0504'
CREATE INDEX [IX_FK__Versions__ModId__5EAA0504]
ON [dbo].[Versions]
    ([ModId]);
GO

-- Creating foreign key on [RId] in table 'Users'
ALTER TABLE [dbo].[Users]
ADD CONSTRAINT [FK__Users__RId__6462DE5A]
    FOREIGN KEY ([RId])
    REFERENCES [dbo].[Roles]
        ([RId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK__Users__RId__6462DE5A'
CREATE INDEX [IX_FK__Users__RId__6462DE5A]
ON [dbo].[Users]
    ([RId]);
GO

-- Creating foreign key on [EmId] in table 'Versions'
ALTER TABLE [dbo].[Versions]
ADD CONSTRAINT [FK__Versions__EmId__5DB5E0CB]
    FOREIGN KEY ([EmId])
    REFERENCES [dbo].[Users]
        ([UId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK__Versions__EmId__5DB5E0CB'
CREATE INDEX [IX_FK__Versions__EmId__5DB5E0CB]
ON [dbo].[Versions]
    ([EmId]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------