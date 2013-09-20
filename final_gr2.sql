USE [ia211]
GO

CREATE TABLE [gr2].[Mitarbeiter](
	[MNr] [int] IDENTITY(1,1) NOT NULL,
	[NickName] [varchar](64) NOT NULL,
	[EMail] [varchar](64) NOT NULL,
	[PwHash] [varchar](32) NOT NULL,
	PRIMARY KEY (MNr)
)

GO

CREATE TABLE [gr2].[Module](
	[ModNr] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](64) NOT NULL,
	[JahresPreis] [decimal](2) NOT NULL,
	PRIMARY KEY (ModNr)
)

GO

CREATE TABLE [gr2].[Versionen](
	[VrNr] [int] IDENTITY(1,1) NOT NULL,
	[Relase] [tinyint] NOT NULL,
	[SubRelease] [tinyint] NOT NULL,
	[BuildNr] [varchar](32) NOT NULL,
	[Plattform] [varchar](50) NOT NULL,
	[DateiName] [varchar](200) NOT NULL,
	[Beschreibung] [varchar](64) NULL,
	[ErscheinungsDatum] [date] NOT NULL,
	[MNr] [int] NOT NULL,
	[ModNr] [int] NOT NULL
	PRIMARY KEY (VrNr)
)

GO

CREATE TABLE [gr2].[Kunden](
	[KNr] [int] IDENTITY(1,1) NOT NULL,
	[NickName] [varchar](32) NOT NULL,
	[Email] [varchar](64) NOT NULL,
	[Telefon] [varchar](32),
	[PwHash] [varchar](32) NOT NULL,
	PRIMARY KEY (KNr)
)

GO

CREATE TABLE [gr2].[Kunden_Module](
	[AuftragNr] [int] IDENTITY(1,1) NOT NULL,
	[KNr] [int] NOT NULL,
	[ModNr] [int] NOT NULL,
	[KaufDatum] [date] NOT NULL,
	[EndDatum] [date] NOT NULL,
	PRIMARY KEY (AuftragNr)
)

GO

CREATE TABLE [gr2].[Downloads](
	[DlNr] [int] IDENTITY(1,1) NOT NULL,
	[DlDatum] [date] NOT NULL,
	[VrNr] [int] NOT NULL,
	[KNr] [int] NOT NULL,
	PRIMARY KEY (DlNr)
)

GO

CREATE TABLE [gr2].[Anleitungen](
	[AlNr] [int] IDENTITY(1,1) NOT NULL,
	[VrNr] [int] NOT NULL,
	[Titel] [varchar](100) NOT NULL,
	[Beschreibung] [varchar](max) NULL,
	[dateiName] [varchar](200) NOT NULL,
	PRIMARY KEY (AlNr)
)

GO

ALTER TABLE gr2.Versionen
ADD FOREIGN KEY (MNr) REFERENCES gr2.Mitarbeiter(MNr)

GO

ALTER TABLE gr2.Versionen
ADD FOREIGN KEY (ModNr) REFERENCES gr2.Module(ModNr)

GO

ALTER TABLE gr2.Kunden_Module
ADD FOREIGN KEY (KNr) REFERENCES gr2.Kunden(KNr)

GO

ALTER TABLE gr2.Kunden_Module
ADD FOREIGN KEY (ModNr) REFERENCES gr2.Module(ModNr)

GO

ALTER TABLE gr2.Downloads
ADD FOREIGN KEY (KNr) REFERENCES gr2.Kunden(KNr)

Go

ALTER TABLE gr2.Downloads
ADD FOREIGN KEY (VrNr) REFERENCES gr2.Versionen(VrNr)

GO

ALTER TABLE gr2.Anleitungen
ADD FOREIGN KEY (VrNr) REFERENCES gr2.Versionen(VrNr)