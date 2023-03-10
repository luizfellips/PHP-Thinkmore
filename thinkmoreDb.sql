USE [master]
GO
/****** Object:  Database [Thinkmore2Db]    Script Date: 07/03/2023 11:04:33 ******/
CREATE DATABASE [Thinkmore2Db]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Thinkmore2Db', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Thinkmore2Db.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Thinkmore2Db_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Thinkmore2Db_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Thinkmore2Db] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Thinkmore2Db].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Thinkmore2Db] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Thinkmore2Db] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Thinkmore2Db] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Thinkmore2Db] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Thinkmore2Db] SET ARITHABORT OFF 
GO
ALTER DATABASE [Thinkmore2Db] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Thinkmore2Db] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Thinkmore2Db] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Thinkmore2Db] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Thinkmore2Db] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Thinkmore2Db] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Thinkmore2Db] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Thinkmore2Db] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Thinkmore2Db] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Thinkmore2Db] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Thinkmore2Db] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Thinkmore2Db] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Thinkmore2Db] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Thinkmore2Db] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Thinkmore2Db] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Thinkmore2Db] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Thinkmore2Db] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Thinkmore2Db] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Thinkmore2Db] SET  MULTI_USER 
GO
ALTER DATABASE [Thinkmore2Db] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Thinkmore2Db] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Thinkmore2Db] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Thinkmore2Db] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Thinkmore2Db] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Thinkmore2Db] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Thinkmore2Db] SET QUERY_STORE = ON
GO
ALTER DATABASE [Thinkmore2Db] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Thinkmore2Db]
GO
/****** Object:  User [thinkmoreadmin]    Script Date: 07/03/2023 11:04:33 ******/
CREATE USER [thinkmoreadmin] FOR LOGIN [thinkmoreadmin] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [masteruser]    Script Date: 07/03/2023 11:04:33 ******/
CREATE USER [masteruser] FOR LOGIN [masteruser] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Schema [Bank]    Script Date: 07/03/2023 11:04:33 ******/
CREATE SCHEMA [Bank]
GO
/****** Object:  Schema [Person]    Script Date: 07/03/2023 11:04:33 ******/
CREATE SCHEMA [Person]
GO
/****** Object:  Table [Bank].[Balance]    Script Date: 07/03/2023 11:04:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Bank].[Balance](
	[EntityID] [int] NOT NULL,
	[Balance] [decimal](10, 2) NOT NULL,
	[CreditLimit] [decimal](10, 2) NOT NULL,
	[Debt] [decimal](10, 2) NOT NULL,
	[DueDate] [datetime] NULL,
	[ModifiedDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[EntityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Bank].[BankAccount]    Script Date: 07/03/2023 11:04:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Bank].[BankAccount](
	[EntityID] [int] NOT NULL,
	[OwnerName] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[EntityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Bank].[Credentials]    Script Date: 07/03/2023 11:04:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Bank].[Credentials](
	[EntityID] [int] NOT NULL,
	[PasswordHash] [char](73) NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[EntityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Person].[EmailAddress]    Script Date: 07/03/2023 11:04:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Person].[EmailAddress](
	[EntityID] [int] IDENTITY(1,1) NOT NULL,
	[EmailAddress] [nvarchar](50) NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[EntityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Person].[Person]    Script Date: 07/03/2023 11:04:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Person].[Person](
	[EntityID] [int] NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[Gender] [char](2) NULL,
	[ModifiedDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[EntityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Bank].[Balance] ADD  DEFAULT ((0)) FOR [Debt]
GO
ALTER TABLE [Bank].[Balance]  WITH CHECK ADD FOREIGN KEY([EntityID])
REFERENCES [Person].[EmailAddress] ([EntityID])
GO
ALTER TABLE [Bank].[BankAccount]  WITH CHECK ADD FOREIGN KEY([EntityID])
REFERENCES [Person].[EmailAddress] ([EntityID])
GO
ALTER TABLE [Bank].[Credentials]  WITH CHECK ADD FOREIGN KEY([EntityID])
REFERENCES [Person].[EmailAddress] ([EntityID])
GO
ALTER TABLE [Person].[Person]  WITH CHECK ADD FOREIGN KEY([EntityID])
REFERENCES [Person].[EmailAddress] ([EntityID])
GO
/****** Object:  StoredProcedure [dbo].[RegisterTest]    Script Date: 07/03/2023 11:04:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RegisterTest] (
@email nvarchar(50),
@password char(73), 
@firstName varchar(50),
@lastName varchar(50),
@gender char(2),
@modifiedDate datetime
)


as

INSERT INTO Person.EmailAddress values (@email,@modifiedDate);
DECLARE @LastID int;
SET @LastID = SCOPE_IDENTITY();
DECLARE @OwnerName nvarchar(255);
SET @OwnerName = CONCAT(@firstName,' ',@lastName);

INSERT INTO Person.Person values (@LastID, @firstName,@lastName,@gender, @modifiedDate);
INSERT INTO Bank.BankAccount values(@LastID, @OwnerName);
INSERT INTO Bank.Credentials values(@LastID, @password,@modifiedDate);
INSERT INTO Bank.Balance values(@LastID,0,200,0,null,@modifiedDate);

GO
USE [master]
GO
ALTER DATABASE [Thinkmore2Db] SET  READ_WRITE 
GO
