
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 02/21/2020 11:06:53
-- Generated from EDMX file: C:\Users\admin\source\repos\JonniRed\DBTest\Ef6Test\DBTest2\DBTest2\Data\TestDB2.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [TestSongs2.db];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------


-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------


-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'SongsSet'
CREATE TABLE [dbo].[SongsSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Title] nvarchar(max)  NULL,
    [Description] nvarchar(max)  NULL,
    [Artist_Id] int  NOT NULL
);
GO

-- Creating table 'ArtistSet'
CREATE TABLE [dbo].[ArtistSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [Birthday] datetime  NOT NULL
);
GO

-- Creating table 'DistributorSet'
CREATE TABLE [dbo].[DistributorSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [Adress] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'ArtistDistributor'
CREATE TABLE [dbo].[ArtistDistributor] (
    [Artist_Id] int  NOT NULL,
    [Distributor_Id] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'SongsSet'
ALTER TABLE [dbo].[SongsSet]
ADD CONSTRAINT [PK_SongsSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'ArtistSet'
ALTER TABLE [dbo].[ArtistSet]
ADD CONSTRAINT [PK_ArtistSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'DistributorSet'
ALTER TABLE [dbo].[DistributorSet]
ADD CONSTRAINT [PK_DistributorSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Artist_Id], [Distributor_Id] in table 'ArtistDistributor'
ALTER TABLE [dbo].[ArtistDistributor]
ADD CONSTRAINT [PK_ArtistDistributor]
    PRIMARY KEY CLUSTERED ([Artist_Id], [Distributor_Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [Artist_Id] in table 'SongsSet'
ALTER TABLE [dbo].[SongsSet]
ADD CONSTRAINT [FK_ArtistSongs]
    FOREIGN KEY ([Artist_Id])
    REFERENCES [dbo].[ArtistSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ArtistSongs'
CREATE INDEX [IX_FK_ArtistSongs]
ON [dbo].[SongsSet]
    ([Artist_Id]);
GO

-- Creating foreign key on [Artist_Id] in table 'ArtistDistributor'
ALTER TABLE [dbo].[ArtistDistributor]
ADD CONSTRAINT [FK_ArtistDistributor_Artist]
    FOREIGN KEY ([Artist_Id])
    REFERENCES [dbo].[ArtistSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Distributor_Id] in table 'ArtistDistributor'
ALTER TABLE [dbo].[ArtistDistributor]
ADD CONSTRAINT [FK_ArtistDistributor_Distributor]
    FOREIGN KEY ([Distributor_Id])
    REFERENCES [dbo].[DistributorSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ArtistDistributor_Distributor'
CREATE INDEX [IX_FK_ArtistDistributor_Distributor]
ON [dbo].[ArtistDistributor]
    ([Distributor_Id]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------