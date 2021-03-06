USE [master]
GO
/****** Object:  Database [Cardealer]    Script Date: 5/16/2022 11:27:55 AM ******/
CREATE DATABASE [Cardealer]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Cardealer', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\Cardealer.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Cardealer_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\Cardealer_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Cardealer] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Cardealer].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Cardealer] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Cardealer] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Cardealer] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Cardealer] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Cardealer] SET ARITHABORT OFF 
GO
ALTER DATABASE [Cardealer] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Cardealer] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Cardealer] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Cardealer] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Cardealer] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Cardealer] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Cardealer] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Cardealer] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Cardealer] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Cardealer] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Cardealer] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Cardealer] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Cardealer] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Cardealer] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Cardealer] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Cardealer] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Cardealer] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Cardealer] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Cardealer] SET  MULTI_USER 
GO
ALTER DATABASE [Cardealer] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Cardealer] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Cardealer] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Cardealer] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Cardealer] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Cardealer] SET QUERY_STORE = OFF
GO
USE [Cardealer]
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [Cardealer]
GO
/****** Object:  User [CardealerAdmin]    Script Date: 5/16/2022 11:27:55 AM ******/
CREATE USER [CardealerAdmin] FOR LOGIN [CardealerAdmin] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [CardealerAdmin]
GO
/****** Object:  Table [dbo].[tblMakeMaster]    Script Date: 5/16/2022 11:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblMakeMaster](
	[MakeId] [bigint] IDENTITY(1,1) NOT NULL,
	[MakeName] [varchar](255) NOT NULL,
	[MakeSequence] [bigint] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[AddedBy] [varchar](50) NOT NULL,
	[UpdatedBy] [varchar](50) NOT NULL,
	[AddedTime] [datetime] NOT NULL,
	[UpdatedTime] [datetime] NOT NULL,
 CONSTRAINT [PK_tblMakeMaster] PRIMARY KEY CLUSTERED 
(
	[MakeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblModelMaster]    Script Date: 5/16/2022 11:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblModelMaster](
	[ModelId] [bigint] IDENTITY(1,1) NOT NULL,
	[MakeId] [bigint] NOT NULL,
	[ModelName] [varchar](255) NOT NULL,
	[ModelSequence] [bigint] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[AddedBy] [varchar](50) NOT NULL,
	[UpdatedBy] [varchar](50) NOT NULL,
	[AddedTime] [datetime] NOT NULL,
	[UpdatedTime] [datetime] NOT NULL,
 CONSTRAINT [PK_tblModelMaster] PRIMARY KEY CLUSTERED 
(
	[ModelId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblVersionMaster]    Script Date: 5/16/2022 11:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblVersionMaster](
	[VersionId] [bigint] IDENTITY(1,1) NOT NULL,
	[ModelId] [bigint] NOT NULL,
	[VersionName] [varchar](255) NOT NULL,
	[VersionSequence] [bigint] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[AddedBy] [varchar](50) NOT NULL,
	[UpdatedBy] [varchar](50) NOT NULL,
	[AddedTime] [datetime] NOT NULL,
	[UpdatedTime] [datetime] NOT NULL,
 CONSTRAINT [PK_tblVersionMaster] PRIMARY KEY CLUSTERED 
(
	[VersionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblPostAds]    Script Date: 5/16/2022 11:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPostAds](
	[AdId] [bigint] IDENTITY(1,1) NOT NULL,
	[MakeId] [bigint] NOT NULL,
	[ModelId] [bigint] NOT NULL,
	[VersionId] [bigint] NOT NULL,
	[VehicleRegNo] [varchar](255) NOT NULL,
	[VehicleColour] [varchar](150) NOT NULL,
	[VehiclePrice] [decimal](18, 2) NOT NULL,
	[NoOfOwners] [bigint] NOT NULL,
	[VehicleYear] [bigint] NOT NULL,
	[FuelType] [bigint] NOT NULL,
	[KmsRun] [decimal](18, 2) NOT NULL,
	[Tax] [varchar](255) NOT NULL,
	[Insurance] [varchar](255) NOT NULL,
	[CarDescription] [varchar](max) NOT NULL,
	[UserType] [bigint] NOT NULL,
	[UserId] [bigint] NOT NULL,
	[VehicleStatus] [bigint] NOT NULL,
	[RejectedReason] [varchar](500) NOT NULL,
	[RegDate] [date] NOT NULL,
	[EngineNo] [varchar](255) NOT NULL,
	[ChassisNo] [varchar](255) NOT NULL,
	[DisplayPrice] [bit] NOT NULL,
	[CustomerDescription] [varchar](max) NOT NULL,
	[AdminDescription] [varchar](max) NOT NULL,
	[DisplayCustomerDescription] [bit] NOT NULL,
	[DisplayAdminDescription] [bit] NOT NULL,
	[CustomerId] [bigint] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[AddedBy] [varchar](50) NOT NULL,
	[UpdatedBy] [varchar](50) NOT NULL,
	[AddedTime] [datetime] NOT NULL,
	[UpdatedTime] [datetime] NOT NULL,
 CONSTRAINT [PK_tblPostAds] PRIMARY KEY CLUSTERED 
(
	[AdId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  View [dbo].[View_PostAds]    Script Date: 5/16/2022 11:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_PostAds]
AS
SELECT        dbo.tblPostAds.AdId, dbo.tblPostAds.MakeId, dbo.tblPostAds.ModelId, dbo.tblPostAds.VersionId, dbo.tblPostAds.VehicleRegNo, dbo.tblPostAds.VehicleColour, dbo.tblPostAds.VehiclePrice, dbo.tblPostAds.NoOfOwners, 
                         dbo.tblPostAds.VehicleYear, dbo.tblPostAds.FuelType, dbo.tblPostAds.KmsRun, dbo.tblPostAds.Tax, dbo.tblPostAds.Insurance, dbo.tblPostAds.CarDescription, dbo.tblPostAds.UserType, dbo.tblPostAds.UserId, 
                         dbo.tblPostAds.VehicleStatus, dbo.tblPostAds.RejectedReason, dbo.tblPostAds.IsDeleted, dbo.tblPostAds.IsActive, dbo.tblPostAds.AddedBy, dbo.tblPostAds.UpdatedBy, dbo.tblPostAds.AddedTime, dbo.tblPostAds.UpdatedTime, 
                         dbo.tblMakeMaster.MakeName, dbo.tblMakeMaster.MakeSequence, dbo.tblMakeMaster.IsDeleted AS MakeIsDeleted, dbo.tblModelMaster.ModelName, dbo.tblModelMaster.ModelSequence, 
                         dbo.tblModelMaster.IsDeleted AS ModelIsDeleted, dbo.tblVersionMaster.VersionName, dbo.tblVersionMaster.VersionSequence, dbo.tblVersionMaster.IsDeleted AS VersionIsDeleted, dbo.tblPostAds.RegDate, 
                         dbo.tblPostAds.EngineNo, dbo.tblPostAds.ChassisNo, dbo.tblPostAds.DisplayPrice, dbo.tblPostAds.CustomerDescription, dbo.tblPostAds.DisplayCustomerDescription, dbo.tblPostAds.AdminDescription, 
                         dbo.tblPostAds.DisplayAdminDescription, dbo.tblPostAds.CustomerId
FROM            dbo.tblModelMaster INNER JOIN
                         dbo.tblMakeMaster ON dbo.tblModelMaster.MakeId = dbo.tblMakeMaster.MakeId INNER JOIN
                         dbo.tblVersionMaster ON dbo.tblModelMaster.ModelId = dbo.tblVersionMaster.ModelId INNER JOIN
                         dbo.tblPostAds ON dbo.tblMakeMaster.MakeId = dbo.tblPostAds.MakeId AND dbo.tblModelMaster.ModelId = dbo.tblPostAds.ModelId AND dbo.tblVersionMaster.VersionId = dbo.tblPostAds.VersionId
WHERE        (dbo.tblMakeMaster.IsDeleted = 0)

GO
/****** Object:  Table [dbo].[tblCustomerMaster]    Script Date: 5/16/2022 11:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCustomerMaster](
	[CustomerId] [bigint] IDENTITY(1,1) NOT NULL,
	[CustomerName] [varchar](255) NOT NULL,
	[MobileNo] [varchar](50) NOT NULL,
	[EmailId] [varchar](255) NOT NULL,
	[CustomerAddress] [varchar](500) NOT NULL,
	[CatId] [bigint] NOT NULL,
	[SourceId] [bigint] NOT NULL,
	[StaffId] [bigint] NOT NULL,
	[JoinDate] [date] NOT NULL,
	[CustomerPhoto] [varchar](500) NOT NULL,
	[IsDisturb] [bit] NOT NULL,
	[CustomerType] [bigint] NOT NULL,
	[Messages] [varchar](500) NOT NULL,
	[PinCode] [varchar](50) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[AddedBy] [varchar](50) NOT NULL,
	[UpdatedBy] [varchar](50) NOT NULL,
	[AddedTime] [datetime] NOT NULL,
	[UpdatedTime] [datetime] NOT NULL,
 CONSTRAINT [PK_tblCustomerMaster] PRIMARY KEY CLUSTERED 
(
	[CustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblCategoryMaster]    Script Date: 5/16/2022 11:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCategoryMaster](
	[CatId] [bigint] IDENTITY(1,1) NOT NULL,
	[CategoryName] [varchar](255) NOT NULL,
	[CategorySequence] [bigint] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[AddedBy] [varchar](50) NOT NULL,
	[UpdatedBy] [varchar](50) NOT NULL,
	[AddedTime] [datetime] NOT NULL,
	[UpdatedTime] [datetime] NOT NULL,
 CONSTRAINT [PK_tblCategoryMaster] PRIMARY KEY CLUSTERED 
(
	[CatId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblSourceMaster]    Script Date: 5/16/2022 11:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblSourceMaster](
	[SourceId] [bigint] IDENTITY(1,1) NOT NULL,
	[SourceName] [varchar](255) NOT NULL,
	[SourceSequence] [bigint] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[AddedBy] [varchar](50) NOT NULL,
	[UpdatedBy] [varchar](50) NOT NULL,
	[AddedTime] [datetime] NOT NULL,
	[UpdatedTime] [datetime] NOT NULL,
 CONSTRAINT [PK_tblSourceMaster] PRIMARY KEY CLUSTERED 
(
	[SourceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[View_CustomerMaster]    Script Date: 5/16/2022 11:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_CustomerMaster]
AS
SELECT        dbo.tblCustomerMaster.CustomerId, dbo.tblCustomerMaster.CustomerName, dbo.tblCustomerMaster.MobileNo, dbo.tblCustomerMaster.EmailId, dbo.tblCustomerMaster.CustomerAddress, 
                         dbo.tblCustomerMaster.CatId, dbo.tblCustomerMaster.SourceId, dbo.tblCustomerMaster.StaffId, dbo.tblCustomerMaster.JoinDate, dbo.tblCustomerMaster.IsDeleted, dbo.tblCustomerMaster.IsActive, 
                         dbo.tblCustomerMaster.AddedBy, dbo.tblCustomerMaster.UpdatedBy, dbo.tblCustomerMaster.AddedTime, dbo.tblCustomerMaster.UpdatedTime, dbo.tblCategoryMaster.CategoryName, 
                         dbo.tblCategoryMaster.CategorySequence, dbo.tblCategoryMaster.IsDeleted AS CategoryIsDeleted, dbo.tblCategoryMaster.IsActive AS CategoryIsActive, dbo.tblSourceMaster.SourceName, 
                         dbo.tblSourceMaster.SourceSequence, dbo.tblSourceMaster.IsDeleted AS SourceIsDeleted, dbo.tblSourceMaster.IsActive AS SourceIsActive, dbo.tblCustomerMaster.CustomerPhoto, 
                         dbo.tblCustomerMaster.IsDisturb, dbo.tblCustomerMaster.CustomerType, dbo.tblCustomerMaster.Messages, dbo.tblCustomerMaster.PinCode
FROM            dbo.tblCategoryMaster INNER JOIN
                         dbo.tblCustomerMaster ON dbo.tblCategoryMaster.CatId = dbo.tblCustomerMaster.CatId INNER JOIN
                         dbo.tblSourceMaster ON dbo.tblCustomerMaster.SourceId = dbo.tblSourceMaster.SourceId
WHERE        (dbo.tblCategoryMaster.IsDeleted = 0) AND (dbo.tblCategoryMaster.IsActive = 1) AND (dbo.tblSourceMaster.IsDeleted = 0) AND (dbo.tblSourceMaster.IsActive = 1)

GO
/****** Object:  Table [dbo].[tblBillDetails]    Script Date: 5/16/2022 11:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblBillDetails](
	[BillId] [bigint] IDENTITY(1,1) NOT NULL,
	[AdId] [bigint] NOT NULL,
	[CustomerId] [bigint] NOT NULL,
	[BillDate] [date] NOT NULL,
	[ReferenceNo] [varchar](255) NOT NULL,
	[BillAmount] [decimal](18, 2) NOT NULL,
	[CommissionOnly] [decimal](18, 2) NOT NULL,
	[Remarks] [varchar](500) NOT NULL,
	[StaffId] [bigint] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[AddedBy] [varchar](50) NOT NULL,
	[UpdatedBy] [varchar](50) NOT NULL,
	[AddedTime] [datetime] NOT NULL,
	[UpdatedTime] [datetime] NOT NULL,
 CONSTRAINT [PK_tblBillDetails] PRIMARY KEY CLUSTERED 
(
	[BillId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[View_BillDetails]    Script Date: 5/16/2022 11:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_BillDetails]
AS
SELECT        dbo.tblBillDetails.BillId, dbo.tblBillDetails.AdId, dbo.tblBillDetails.CustomerId, dbo.tblBillDetails.BillDate, dbo.tblBillDetails.ReferenceNo, dbo.tblBillDetails.BillAmount, dbo.tblBillDetails.CommissionOnly, 
                         dbo.tblBillDetails.Remarks, dbo.tblBillDetails.StaffId AS BillStaffId, dbo.tblBillDetails.IsDeleted, dbo.tblBillDetails.IsActive, dbo.tblBillDetails.AddedBy, dbo.tblBillDetails.UpdatedBy, dbo.tblBillDetails.AddedTime, 
                         dbo.tblBillDetails.UpdatedTime, dbo.View_PostAds.MakeId, dbo.View_PostAds.ModelId, dbo.View_PostAds.VersionId, dbo.View_PostAds.VehicleRegNo AS postVehicleRegNo, dbo.View_PostAds.VehicleColour, 
                         dbo.View_PostAds.VehiclePrice, dbo.View_PostAds.NoOfOwners, dbo.View_PostAds.VehicleYear, dbo.View_PostAds.FuelType, dbo.View_PostAds.KmsRun, dbo.View_PostAds.Tax, dbo.View_PostAds.Insurance, 
                         dbo.View_PostAds.CarDescription, dbo.View_PostAds.UserType, dbo.View_PostAds.UserId, dbo.View_PostAds.VehicleStatus, dbo.View_PostAds.RejectedReason, dbo.View_PostAds.IsDeleted AS AdIsDeleted, 
                         dbo.View_PostAds.MakeName, dbo.View_PostAds.MakeSequence, dbo.View_PostAds.ModelName, dbo.View_PostAds.ModelSequence, dbo.View_PostAds.VersionName, dbo.View_PostAds.VersionSequence, 
                         dbo.View_PostAds.RegDate, dbo.View_PostAds.EngineNo, dbo.View_PostAds.ChassisNo, dbo.View_CustomerMaster.CustomerName, dbo.View_CustomerMaster.MobileNo, dbo.View_CustomerMaster.EmailId, 
                         dbo.View_CustomerMaster.CustomerAddress, dbo.View_CustomerMaster.CatId, dbo.View_CustomerMaster.SourceId, dbo.View_CustomerMaster.StaffId, dbo.View_CustomerMaster.JoinDate, 
                         dbo.View_CustomerMaster.IsDeleted AS CustIsDeleted, dbo.View_CustomerMaster.CategoryName, dbo.View_CustomerMaster.CategorySequence, dbo.View_CustomerMaster.SourceName, 
                         dbo.View_CustomerMaster.SourceSequence, dbo.View_CustomerMaster.CustomerPhoto, dbo.View_CustomerMaster.IsDisturb, dbo.View_CustomerMaster.CustomerType
FROM            dbo.tblBillDetails INNER JOIN
                         dbo.View_PostAds ON dbo.tblBillDetails.AdId = dbo.View_PostAds.AdId LEFT OUTER JOIN
                         dbo.View_CustomerMaster ON dbo.tblBillDetails.CustomerId = dbo.View_CustomerMaster.CustomerId

GO
/****** Object:  Table [dbo].[tblStaffMaster]    Script Date: 5/16/2022 11:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblStaffMaster](
	[StaffId] [bigint] IDENTITY(1,1) NOT NULL,
	[StaffName] [varchar](255) NOT NULL,
	[LoginId] [varchar](255) NOT NULL,
	[LoginPassword] [varchar](255) NOT NULL,
	[FatherName] [varchar](255) NOT NULL,
	[PatnerName] [varchar](255) NOT NULL,
	[ContactNo] [varchar](50) NOT NULL,
	[ContactAddress] [varchar](500) NOT NULL,
	[EmailId] [varchar](255) NOT NULL,
	[DOB] [date] NOT NULL,
	[DOJ] [date] NOT NULL,
	[StaffPic] [varchar](500) NOT NULL,
	[Gender] [bit] NOT NULL,
	[Married] [bit] NOT NULL,
	[RoleId] [bigint] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[AddedBy] [varchar](50) NOT NULL,
	[UpdatedBy] [varchar](50) NOT NULL,
	[AddedTime] [datetime] NOT NULL,
	[UpdatedTime] [datetime] NOT NULL,
 CONSTRAINT [PK_tblStaffMaster] PRIMARY KEY CLUSTERED 
(
	[StaffId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[View_StaffMaster]    Script Date: 5/16/2022 11:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_StaffMaster]
AS
SELECT        StaffId, StaffName, LoginId, LoginPassword, FatherName, PatnerName, ContactNo, ContactAddress, EmailId, DOB, DOJ, StaffPic, Gender, Married, RoleId, IsDeleted, IsActive, AddedBy, UpdatedBy, AddedTime, 
                         UpdatedTime
FROM            dbo.tblStaffMaster

GO
/****** Object:  Table [dbo].[tblStateMaster]    Script Date: 5/16/2022 11:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblStateMaster](
	[StateId] [bigint] IDENTITY(1,1) NOT NULL,
	[StateName] [varchar](255) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[AddedBy] [varchar](50) NOT NULL,
	[UpdatedBy] [varchar](50) NOT NULL,
	[AddedTime] [datetime] NOT NULL,
	[UpdatedTime] [datetime] NOT NULL,
 CONSTRAINT [PK_tblStateMaster] PRIMARY KEY CLUSTERED 
(
	[StateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblDistrictMaster]    Script Date: 5/16/2022 11:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblDistrictMaster](
	[DistrictId] [bigint] IDENTITY(1,1) NOT NULL,
	[StateId] [bigint] NOT NULL,
	[DistrictName] [varchar](255) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[AddedBy] [varchar](50) NOT NULL,
	[UpdatedBy] [varchar](50) NOT NULL,
	[AddedTime] [datetime] NOT NULL,
	[UpdatedTime] [datetime] NOT NULL,
 CONSTRAINT [PK_tblDistrictMaster] PRIMARY KEY CLUSTERED 
(
	[DistrictId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[View_DistrictMaster]    Script Date: 5/16/2022 11:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_DistrictMaster]
AS
SELECT        dbo.tblDistrictMaster.DistrictId, dbo.tblDistrictMaster.StateId, dbo.tblDistrictMaster.DistrictName, dbo.tblDistrictMaster.IsDeleted, dbo.tblDistrictMaster.IsActive, dbo.tblDistrictMaster.AddedBy, dbo.tblDistrictMaster.UpdatedBy, 
                         dbo.tblDistrictMaster.AddedTime, dbo.tblDistrictMaster.UpdatedTime, dbo.tblStateMaster.StateName, dbo.tblStateMaster.IsDeleted AS StateIsDeleted, dbo.tblStateMaster.IsActive AS StateIsActive
FROM            dbo.tblDistrictMaster INNER JOIN
                         dbo.tblStateMaster ON dbo.tblDistrictMaster.StateId = dbo.tblStateMaster.StateId
WHERE        (dbo.tblStateMaster.IsDeleted = 0) AND (dbo.tblStateMaster.IsActive = 1)

GO
/****** Object:  Table [dbo].[tblPaymentMaster]    Script Date: 5/16/2022 11:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPaymentMaster](
	[PayId] [bigint] IDENTITY(1,1) NOT NULL,
	[AdId] [bigint] NOT NULL,
	[CustomerId] [bigint] NOT NULL,
	[BankName] [varchar](500) NOT NULL,
	[IFSCCode] [varchar](255) NOT NULL,
	[PaymentMode] [bigint] NOT NULL,
	[PurchaseAmount] [decimal](18, 2) NOT NULL,
	[PaidAmount] [decimal](18, 2) NOT NULL,
	[ChequeNo] [varchar](255) NOT NULL,
	[ChequeDate] [datetime] NOT NULL,
	[PaymentDate] [datetime] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[AddedBy] [varchar](50) NOT NULL,
	[UpdatedBy] [varchar](50) NOT NULL,
	[AddedTime] [datetime] NOT NULL,
	[UpdatedTime] [datetime] NOT NULL,
 CONSTRAINT [PK_tblPaymentMaster] PRIMARY KEY CLUSTERED 
(
	[PayId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[View_PaymentMaster]    Script Date: 5/16/2022 11:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_PaymentMaster]
AS
SELECT        dbo.tblPaymentMaster.PayId, dbo.tblPaymentMaster.AdId, dbo.tblPaymentMaster.CustomerId, dbo.tblPaymentMaster.BankName, dbo.tblPaymentMaster.IFSCCode, dbo.tblPaymentMaster.PaymentMode, 
                         dbo.tblPaymentMaster.PurchaseAmount, dbo.tblPaymentMaster.PaidAmount, dbo.tblPaymentMaster.IsDeleted, dbo.tblPaymentMaster.IsActive, dbo.tblPaymentMaster.AddedBy, dbo.tblPaymentMaster.UpdatedBy, 
                         dbo.tblPaymentMaster.AddedTime, dbo.tblPaymentMaster.UpdatedTime, dbo.View_PostAds.MakeId, dbo.View_PostAds.ModelId, dbo.View_PostAds.VersionId, dbo.View_PostAds.VehicleRegNo, dbo.View_PostAds.VehicleColour, 
                         dbo.View_PostAds.VehiclePrice, dbo.View_PostAds.NoOfOwners, dbo.View_PostAds.VehicleYear, dbo.View_PostAds.FuelType, dbo.View_PostAds.KmsRun, dbo.View_PostAds.Tax, dbo.View_PostAds.Insurance, 
                         dbo.View_PostAds.CarDescription, dbo.View_PostAds.UserType, dbo.View_PostAds.UserId, dbo.View_PostAds.VehicleStatus, dbo.View_PostAds.RejectedReason, dbo.View_PostAds.IsDeleted AS postAdsIsDeleted, 
                         dbo.View_PostAds.IsActive AS postAdsIsActive, dbo.View_PostAds.MakeName, dbo.View_PostAds.MakeSequence, dbo.View_PostAds.ModelName, dbo.View_PostAds.ModelSequence, dbo.View_PostAds.VersionName, 
                         dbo.View_PostAds.VersionSequence, dbo.View_PostAds.RegDate, dbo.View_PostAds.EngineNo, dbo.View_PostAds.ChassisNo, dbo.View_PostAds.DisplayPrice, dbo.View_PostAds.CustomerDescription, 
                         dbo.View_PostAds.DisplayCustomerDescription, dbo.View_PostAds.AdminDescription, dbo.View_PostAds.DisplayAdminDescription, dbo.tblCustomerMaster.CustomerName, dbo.tblCustomerMaster.MobileNo, 
                         dbo.tblCustomerMaster.EmailId, dbo.tblCustomerMaster.CustomerAddress, dbo.tblCustomerMaster.CatId, dbo.tblCustomerMaster.SourceId, dbo.tblCustomerMaster.StaffId, dbo.tblCustomerMaster.JoinDate, 
                         dbo.tblCustomerMaster.CustomerPhoto, dbo.tblCustomerMaster.IsDisturb, dbo.tblCustomerMaster.CustomerType, dbo.tblCustomerMaster.Messages, dbo.tblCustomerMaster.IsDeleted AS customerIsDeleted, 
                         dbo.tblCustomerMaster.IsActive AS customerIsActive, dbo.tblPaymentMaster.ChequeNo, dbo.tblPaymentMaster.ChequeDate, dbo.tblPaymentMaster.PaymentDate
FROM            dbo.tblPaymentMaster INNER JOIN
                         dbo.View_PostAds ON dbo.tblPaymentMaster.AdId = dbo.View_PostAds.AdId INNER JOIN
                         dbo.tblCustomerMaster ON dbo.tblPaymentMaster.CustomerId = dbo.tblCustomerMaster.CustomerId
WHERE        (dbo.View_PostAds.IsDeleted = 0) AND (dbo.View_PostAds.IsActive = 1) AND (dbo.tblCustomerMaster.IsDeleted = 0) AND (dbo.tblCustomerMaster.IsActive = 1)

GO
/****** Object:  View [dbo].[View_MakeMaster]    Script Date: 5/16/2022 11:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_MakeMaster]
AS
SELECT        MakeId, MakeName, MakeSequence, IsDeleted, IsActive, AddedBy, UpdatedBy, AddedTime, UpdatedTime
FROM            dbo.tblMakeMaster

GO
/****** Object:  View [dbo].[View_ModelMaster]    Script Date: 5/16/2022 11:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_ModelMaster]
AS
SELECT        dbo.tblModelMaster.ModelId, dbo.tblModelMaster.MakeId, dbo.tblModelMaster.ModelName, dbo.tblModelMaster.ModelSequence, dbo.tblModelMaster.IsDeleted, dbo.tblModelMaster.IsActive, dbo.tblModelMaster.AddedBy, 
                         dbo.tblModelMaster.UpdatedBy, dbo.tblModelMaster.AddedTime, dbo.tblModelMaster.UpdatedTime, dbo.tblMakeMaster.MakeName, dbo.tblMakeMaster.MakeSequence, dbo.tblMakeMaster.IsDeleted AS MakeIsDeleted, 
                         dbo.tblMakeMaster.IsActive AS MakeIsActive
FROM            dbo.tblMakeMaster INNER JOIN
                         dbo.tblModelMaster ON dbo.tblMakeMaster.MakeId = dbo.tblModelMaster.MakeId
WHERE        (dbo.tblMakeMaster.IsDeleted = 0) AND (dbo.tblMakeMaster.IsActive = 1)

GO
/****** Object:  View [dbo].[View_VersionMaster]    Script Date: 5/16/2022 11:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_VersionMaster]
AS
SELECT        dbo.tblVersionMaster.ModelId, dbo.tblVersionMaster.VersionName, dbo.tblVersionMaster.VersionSequence, dbo.tblVersionMaster.IsDeleted, dbo.tblVersionMaster.IsActive, dbo.tblVersionMaster.AddedBy, 
                         dbo.tblVersionMaster.UpdatedBy, dbo.tblVersionMaster.AddedTime, dbo.tblVersionMaster.UpdatedTime, dbo.View_ModelMaster.MakeId, dbo.View_ModelMaster.ModelName, dbo.View_ModelMaster.ModelSequence, 
                         dbo.View_ModelMaster.IsDeleted AS ModelIsDeleted, dbo.View_ModelMaster.IsActive AS ModelIsActive, dbo.View_ModelMaster.MakeName, dbo.View_ModelMaster.MakeSequence, dbo.tblVersionMaster.VersionId
FROM            dbo.tblVersionMaster INNER JOIN
                         dbo.View_ModelMaster ON dbo.tblVersionMaster.ModelId = dbo.View_ModelMaster.ModelId
WHERE        (dbo.View_ModelMaster.IsDeleted = 0) AND (dbo.View_ModelMaster.IsActive = 1)

GO
/****** Object:  Table [dbo].[tblDocumentMaster]    Script Date: 5/16/2022 11:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblDocumentMaster](
	[DocumentId] [bigint] IDENTITY(1,1) NOT NULL,
	[DocumentName] [varchar](225) NOT NULL,
	[DocumentSequence] [bigint] NOT NULL,
	[AcceptType] [varchar](225) NOT NULL,
	[IsCheck] [bit] NOT NULL,
	[CheckValue] [varchar](225) NOT NULL,
	[SampleDoc] [varchar](500) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[AddedBy] [varchar](50) NOT NULL,
	[UpdatedBy] [varchar](50) NOT NULL,
	[AddedTime] [datetime] NOT NULL,
	[UpdatedTime] [datetime] NOT NULL,
 CONSTRAINT [PK_tblDocumentMaster] PRIMARY KEY CLUSTERED 
(
	[DocumentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[View_DocumentMaster]    Script Date: 5/16/2022 11:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_DocumentMaster]
AS
SELECT        DocumentId, DocumentName, DocumentSequence, IsDeleted, IsActive, AddedBy, UpdatedBy, AddedTime, UpdatedTime, CheckValue, IsCheck, AcceptType, SampleDoc
FROM            dbo.tblDocumentMaster

GO
/****** Object:  Table [dbo].[tblDocumentDetails]    Script Date: 5/16/2022 11:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblDocumentDetails](
	[DocumentDetId] [bigint] IDENTITY(1,1) NOT NULL,
	[DocumentId] [bigint] NOT NULL,
	[AdId] [bigint] NOT NULL,
	[DocumentPath] [varchar](max) NOT NULL,
	[IsRCBook] [bit] NOT NULL,
	[IsNameTransfer] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[AddedBy] [varchar](50) NOT NULL,
	[UpdatedBy] [varchar](50) NOT NULL,
	[AddedTime] [datetime] NOT NULL,
	[UpdatedTime] [datetime] NOT NULL,
 CONSTRAINT [PK_tblDocumentDetails] PRIMARY KEY CLUSTERED 
(
	[DocumentDetId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  View [dbo].[View_DocumentDetails]    Script Date: 5/16/2022 11:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_DocumentDetails]
AS
SELECT        dbo.tblDocumentDetails.DocumentDetId, dbo.tblDocumentDetails.DocumentId, dbo.tblDocumentDetails.AdId, dbo.tblDocumentDetails.DocumentPath, dbo.tblDocumentDetails.IsRCBook, dbo.tblDocumentDetails.IsNameTransfer, 
                         dbo.tblDocumentDetails.IsDeleted, dbo.tblDocumentDetails.IsActive, dbo.tblDocumentDetails.AddedBy, dbo.tblDocumentDetails.UpdatedBy, dbo.tblDocumentDetails.AddedTime, dbo.tblDocumentDetails.UpdatedTime, 
                         dbo.tblDocumentMaster.DocumentName, dbo.tblDocumentMaster.DocumentSequence, dbo.tblDocumentMaster.IsDeleted AS DocumentMasterIsDeleted, dbo.tblDocumentMaster.IsActive AS DocumentIsActive, 
                         dbo.View_PostAds.MakeId, dbo.View_PostAds.ModelId, dbo.View_PostAds.VersionId, dbo.View_PostAds.VehicleRegNo, dbo.View_PostAds.VehicleColour, dbo.View_PostAds.VehiclePrice, dbo.View_PostAds.NoOfOwners, 
                         dbo.View_PostAds.VehicleYear, dbo.View_PostAds.FuelType, dbo.View_PostAds.KmsRun, dbo.View_PostAds.Tax, dbo.View_PostAds.Insurance, dbo.View_PostAds.CarDescription, dbo.View_PostAds.UserType, 
                         dbo.View_PostAds.UserId, dbo.View_PostAds.VehicleStatus, dbo.View_PostAds.RejectedReason, dbo.View_PostAds.IsDeleted AS AdsIsDeleted, dbo.View_PostAds.IsActive AS AdsIsActive, dbo.View_PostAds.MakeName, 
                         dbo.View_PostAds.MakeSequence, dbo.View_PostAds.ModelName, dbo.View_PostAds.ModelSequence, dbo.View_PostAds.VersionName, dbo.View_PostAds.VersionSequence, dbo.View_PostAds.RegDate, 
                         dbo.View_PostAds.EngineNo, dbo.View_PostAds.ChassisNo, dbo.tblDocumentMaster.AcceptType, dbo.tblDocumentMaster.IsCheck, dbo.tblDocumentMaster.CheckValue, dbo.tblDocumentMaster.SampleDoc
FROM            dbo.tblDocumentDetails INNER JOIN
                         dbo.tblDocumentMaster ON dbo.tblDocumentDetails.DocumentId = dbo.tblDocumentMaster.DocumentId INNER JOIN
                         dbo.View_PostAds ON dbo.tblDocumentDetails.AdId = dbo.View_PostAds.AdId
WHERE        (dbo.tblDocumentMaster.IsDeleted = 0) AND (dbo.tblDocumentMaster.IsActive = 1) AND (dbo.View_PostAds.IsDeleted = 0) AND (dbo.View_PostAds.IsActive = 1)

GO
/****** Object:  Table [dbo].[tblExpenseMaster]    Script Date: 5/16/2022 11:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblExpenseMaster](
	[ExpId] [bigint] IDENTITY(1,1) NOT NULL,
	[ExpName] [varchar](255) NOT NULL,
	[ExpSequenceNo] [bigint] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[AddedBy] [varchar](50) NOT NULL,
	[UpdatedBy] [varchar](50) NOT NULL,
	[AddedTime] [datetime] NOT NULL,
	[UpdatedTime] [datetime] NOT NULL,
 CONSTRAINT [PK_tblExpenseMaster] PRIMARY KEY CLUSTERED 
(
	[ExpId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[View_ExpenseMaster]    Script Date: 5/16/2022 11:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_ExpenseMaster]
AS
SELECT        ExpId, ExpName, ExpSequenceNo, IsDeleted, IsActive, AddedBy, UpdatedBy, AddedTime, UpdatedTime
FROM            dbo.tblExpenseMaster

GO
/****** Object:  Table [dbo].[tblExpenseDetails]    Script Date: 5/16/2022 11:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblExpenseDetails](
	[ExpDetId] [bigint] IDENTITY(1,1) NOT NULL,
	[AdId] [bigint] NOT NULL,
	[CustomerId] [bigint] NOT NULL,
	[ExpDate] [date] NOT NULL,
	[VehicleRegNo] [varchar](255) NOT NULL,
	[ExpId] [bigint] NOT NULL,
	[ExpAmount] [decimal](18, 2) NOT NULL,
	[ExpenseName] [varchar](500) NOT NULL,
	[Remarks] [varchar](max) NOT NULL,
	[StaffId] [bigint] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[AddedBy] [varchar](50) NOT NULL,
	[UpdatedBy] [varchar](50) NOT NULL,
	[AddedTime] [datetime] NOT NULL,
	[UpdatedTime] [datetime] NOT NULL,
 CONSTRAINT [PK_tblExpenseDetails] PRIMARY KEY CLUSTERED 
(
	[ExpDetId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  View [dbo].[View_ExpenseDetails]    Script Date: 5/16/2022 11:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_ExpenseDetails]
AS
SELECT        dbo.tblExpenseDetails.ExpDetId, dbo.tblExpenseDetails.AdId, dbo.tblExpenseDetails.CustomerId, dbo.tblExpenseDetails.ExpDate, dbo.tblExpenseDetails.VehicleRegNo, dbo.tblExpenseDetails.ExpId, 
                         dbo.tblExpenseDetails.ExpAmount, dbo.tblExpenseDetails.IsDeleted, dbo.tblExpenseDetails.IsActive, dbo.tblExpenseDetails.AddedBy, dbo.tblExpenseDetails.UpdatedBy, dbo.tblExpenseDetails.AddedTime, 
                         dbo.tblExpenseDetails.UpdatedTime, dbo.View_ExpenseMaster.ExpName, dbo.View_ExpenseMaster.ExpSequenceNo, dbo.View_ExpenseMaster.IsDeleted AS ExpMasIsdeleted, dbo.View_PostAds.MakeId, 
                         dbo.View_PostAds.ModelId, dbo.View_PostAds.VersionId, dbo.View_PostAds.VehicleRegNo AS Expr1, dbo.View_PostAds.VehicleColour, dbo.View_PostAds.VehiclePrice, dbo.View_PostAds.NoOfOwners, 
                         dbo.View_PostAds.VehicleYear, dbo.View_PostAds.FuelType, dbo.View_PostAds.KmsRun, dbo.View_PostAds.Tax, dbo.View_PostAds.Insurance, dbo.View_PostAds.CarDescription, dbo.View_PostAds.UserType, 
                         dbo.View_PostAds.UserId, dbo.View_PostAds.VehicleStatus, dbo.View_PostAds.RejectedReason, dbo.View_PostAds.IsDeleted AS AdIsDeleted, dbo.View_PostAds.MakeName, dbo.View_PostAds.MakeSequence, 
                         dbo.View_PostAds.ModelName, dbo.View_PostAds.ModelSequence, dbo.View_PostAds.VersionName, dbo.View_PostAds.VersionSequence, dbo.View_PostAds.RegDate, dbo.View_PostAds.EngineNo, 
                         dbo.View_PostAds.ChassisNo, dbo.View_CustomerMaster.CustomerName, dbo.View_CustomerMaster.MobileNo, dbo.View_CustomerMaster.EmailId, dbo.View_CustomerMaster.CustomerAddress, 
                         dbo.View_CustomerMaster.CatId, dbo.View_CustomerMaster.SourceId, dbo.View_CustomerMaster.StaffId, dbo.View_CustomerMaster.JoinDate, dbo.View_CustomerMaster.IsDeleted AS CustIsDeleted, 
                         dbo.View_CustomerMaster.CategoryName, dbo.View_CustomerMaster.CategorySequence, dbo.View_CustomerMaster.SourceName, dbo.View_CustomerMaster.SourceSequence, dbo.View_CustomerMaster.CustomerPhoto, 
                         dbo.View_CustomerMaster.IsDisturb, dbo.View_CustomerMaster.CustomerType, dbo.tblExpenseDetails.ExpenseName, dbo.tblExpenseDetails.Remarks, dbo.tblExpenseDetails.StaffId AS ExpStaffId
FROM            dbo.tblExpenseDetails INNER JOIN
                         dbo.View_ExpenseMaster ON dbo.tblExpenseDetails.ExpId = dbo.View_ExpenseMaster.ExpId INNER JOIN
                         dbo.View_PostAds ON dbo.tblExpenseDetails.AdId = dbo.View_PostAds.AdId LEFT OUTER JOIN
                         dbo.View_CustomerMaster ON dbo.tblExpenseDetails.CustomerId = dbo.View_CustomerMaster.CustomerId
WHERE        (dbo.View_ExpenseMaster.IsDeleted = 0)

GO
/****** Object:  Table [dbo].[tblFuelMaster]    Script Date: 5/16/2022 11:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblFuelMaster](
	[FuelType] [bigint] IDENTITY(1,1) NOT NULL,
	[FuelName] [varchar](255) NOT NULL,
	[FuelSequence] [bigint] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[AddedBy] [varchar](50) NOT NULL,
	[UpdatedBy] [varchar](50) NOT NULL,
	[AddedTime] [datetime] NOT NULL,
	[UpdatedTime] [datetime] NOT NULL,
 CONSTRAINT [PK_tblFuelMaster] PRIMARY KEY CLUSTERED 
(
	[FuelType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[View_FuelMaster]    Script Date: 5/16/2022 11:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_FuelMaster]
AS
SELECT        FuelType, FuelName, FuelSequence, IsDeleted, IsActive, AddedBy, UpdatedBy, AddedTime, UpdatedTime
FROM            dbo.tblFuelMaster

GO
/****** Object:  Table [dbo].[tblAdCarOwnerDetails]    Script Date: 5/16/2022 11:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblAdCarOwnerDetails](
	[OwnerId] [bigint] IDENTITY(1,1) NOT NULL,
	[AdId] [bigint] NOT NULL,
	[OwnerName] [varchar](255) NOT NULL,
	[EmailId] [varchar](150) NOT NULL,
	[ContactNo] [varchar](50) NOT NULL,
	[OwnerAddress] [varchar](500) NOT NULL,
	[StateId] [bigint] NOT NULL,
	[DistrictId] [bigint] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[AddedBy] [varchar](50) NOT NULL,
	[UpdatedBy] [varchar](50) NOT NULL,
	[AddedTime] [datetime] NOT NULL,
	[UpdatedTime] [datetime] NOT NULL,
 CONSTRAINT [PK_tblAdCarOwnerDetails] PRIMARY KEY CLUSTERED 
(
	[OwnerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[View_AdCarOwnerDetails]    Script Date: 5/16/2022 11:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_AdCarOwnerDetails]
AS
SELECT        dbo.tblAdCarOwnerDetails.OwnerId, dbo.tblAdCarOwnerDetails.AdId, dbo.tblAdCarOwnerDetails.OwnerName, dbo.tblAdCarOwnerDetails.EmailId, dbo.tblAdCarOwnerDetails.ContactNo, dbo.tblAdCarOwnerDetails.OwnerAddress, 
                         dbo.tblAdCarOwnerDetails.StateId, dbo.tblAdCarOwnerDetails.DistrictId, dbo.tblAdCarOwnerDetails.IsDeleted, dbo.tblAdCarOwnerDetails.IsActive, dbo.tblAdCarOwnerDetails.AddedBy, dbo.tblAdCarOwnerDetails.UpdatedBy, 
                         dbo.tblAdCarOwnerDetails.AddedTime, dbo.tblAdCarOwnerDetails.UpdatedTime, dbo.View_PostAds.MakeId, dbo.View_PostAds.ModelId, dbo.View_PostAds.VersionId, dbo.View_PostAds.VehicleRegNo, 
                         dbo.View_PostAds.VehicleColour, dbo.View_PostAds.VehiclePrice, dbo.View_PostAds.NoOfOwners, dbo.View_PostAds.VehicleYear, dbo.View_PostAds.FuelType, dbo.View_PostAds.KmsRun, dbo.View_PostAds.Tax, 
                         dbo.View_PostAds.Insurance, dbo.View_PostAds.CarDescription, dbo.View_PostAds.UserType, dbo.View_PostAds.UserId, dbo.View_PostAds.VehicleStatus, dbo.View_PostAds.RejectedReason, 
                         dbo.View_PostAds.IsDeleted AS PostAdIsDeleted, dbo.View_PostAds.IsActive AS PostAdIsActive, dbo.View_PostAds.MakeName, dbo.View_PostAds.MakeSequence, dbo.View_PostAds.MakeIsDeleted, 
                         dbo.View_PostAds.ModelName, dbo.View_PostAds.ModelIsDeleted, dbo.View_PostAds.ModelSequence, dbo.View_PostAds.VersionName, dbo.View_PostAds.VersionSequence, dbo.View_PostAds.VersionIsDeleted
FROM            dbo.tblAdCarOwnerDetails INNER JOIN
                         dbo.View_PostAds ON dbo.tblAdCarOwnerDetails.AdId = dbo.View_PostAds.AdId
WHERE        (dbo.View_PostAds.IsDeleted = 0) AND (dbo.View_PostAds.IsActive = 1)

GO
/****** Object:  Table [dbo].[tblAdCarImages]    Script Date: 5/16/2022 11:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblAdCarImages](
	[AdCarImgId] [bigint] IDENTITY(1,1) NOT NULL,
	[AdId] [bigint] NOT NULL,
	[CarImage] [varchar](500) NOT NULL,
	[IsMainDisplay] [bit] NOT NULL,
	[IsDisplay] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[AddedBy] [varchar](50) NOT NULL,
	[UpdatedBy] [varchar](50) NOT NULL,
	[AddedTime] [datetime] NOT NULL,
	[UpdatedTime] [datetime] NOT NULL,
 CONSTRAINT [PK_tblAdCarImages] PRIMARY KEY CLUSTERED 
(
	[AdCarImgId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[View_AdCarImages]    Script Date: 5/16/2022 11:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_AdCarImages]
AS
SELECT        dbo.tblAdCarImages.AdCarImgId, dbo.tblAdCarImages.AdId, dbo.tblAdCarImages.CarImage, dbo.tblAdCarImages.IsMainDisplay, dbo.tblAdCarImages.IsDisplay, dbo.tblAdCarImages.IsDeleted, dbo.tblAdCarImages.IsActive, 
                         dbo.tblAdCarImages.AddedBy, dbo.tblAdCarImages.UpdatedBy, dbo.tblAdCarImages.AddedTime, dbo.tblAdCarImages.UpdatedTime, dbo.View_PostAds.MakeId, dbo.View_PostAds.ModelId, dbo.View_PostAds.VersionId, 
                         dbo.View_PostAds.VehicleRegNo, dbo.View_PostAds.VehicleColour, dbo.View_PostAds.VehiclePrice, dbo.View_PostAds.NoOfOwners, dbo.View_PostAds.VehicleYear, dbo.View_PostAds.FuelType, dbo.View_PostAds.KmsRun, 
                         dbo.View_PostAds.Tax, dbo.View_PostAds.Insurance, dbo.View_PostAds.CarDescription, dbo.View_PostAds.UserType, dbo.View_PostAds.UserId, dbo.View_PostAds.VehicleStatus, dbo.View_PostAds.RejectedReason, 
                         dbo.View_PostAds.IsDeleted AS PostAdIsDeleted, dbo.View_PostAds.IsActive AS PostAdIsActive, dbo.View_PostAds.MakeName, dbo.View_PostAds.MakeSequence, dbo.View_PostAds.MakeIsDeleted, 
                         dbo.View_PostAds.ModelName, dbo.View_PostAds.ModelSequence, dbo.View_PostAds.ModelIsDeleted, dbo.View_PostAds.VersionName, dbo.View_PostAds.VersionSequence, dbo.View_PostAds.VersionIsDeleted
FROM            dbo.tblAdCarImages INNER JOIN
                         dbo.View_PostAds ON dbo.tblAdCarImages.AdId = dbo.View_PostAds.AdId
WHERE        (dbo.View_PostAds.IsDeleted = 0) AND (dbo.View_PostAds.IsActive = 1)

GO
/****** Object:  Table [dbo].[tblFollowUpStatus]    Script Date: 5/16/2022 11:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblFollowUpStatus](
	[FollowStatusId] [bigint] IDENTITY(1,1) NOT NULL,
	[FollowStatus] [varchar](255) NOT NULL,
	[FollowSequence] [bigint] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[AddedBy] [varchar](50) NOT NULL,
	[UpdatedBy] [varchar](50) NOT NULL,
	[AddedTime] [datetime] NOT NULL,
	[UpdatedTime] [datetime] NULL,
 CONSTRAINT [PK_tblFollowUpStatus] PRIMARY KEY CLUSTERED 
(
	[FollowStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[View_FollowUpStatus]    Script Date: 5/16/2022 11:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_FollowUpStatus]
AS
SELECT        FollowStatusId, FollowStatus, FollowSequence, IsDeleted, IsActive, AddedBy, UpdatedBy, AddedTime, UpdatedTime
FROM            dbo.tblFollowUpStatus

GO
/****** Object:  Table [dbo].[tblAdCarVideos]    Script Date: 5/16/2022 11:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblAdCarVideos](
	[AdCarVideoId] [bigint] IDENTITY(1,1) NOT NULL,
	[AdId] [bigint] NOT NULL,
	[CarVideoPath] [varchar](max) NOT NULL,
	[Is360View] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[AddedBy] [varchar](50) NOT NULL,
	[UpdatedBy] [varchar](50) NOT NULL,
	[AddedTime] [datetime] NOT NULL,
	[UpdatedTime] [datetime] NOT NULL,
 CONSTRAINT [PK_tblAdCarVideos] PRIMARY KEY CLUSTERED 
(
	[AdCarVideoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  View [dbo].[View_AdCarVideos]    Script Date: 5/16/2022 11:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_AdCarVideos]
AS
SELECT        dbo.tblAdCarVideos.AdCarVideoId, dbo.tblAdCarVideos.AdId, dbo.tblAdCarVideos.CarVideoPath, dbo.tblAdCarVideos.Is360View, dbo.tblAdCarVideos.IsDeleted, dbo.tblAdCarVideos.IsActive, dbo.tblAdCarVideos.AddedBy, 
                         dbo.tblAdCarVideos.UpdatedBy, dbo.tblAdCarVideos.AddedTime, dbo.tblAdCarVideos.UpdatedTime, dbo.View_PostAds.MakeId, dbo.View_PostAds.ModelId, dbo.View_PostAds.VersionId, dbo.View_PostAds.VehicleRegNo, 
                         dbo.View_PostAds.VehicleColour, dbo.View_PostAds.VehiclePrice, dbo.View_PostAds.NoOfOwners, dbo.View_PostAds.VehicleYear, dbo.View_PostAds.FuelType, dbo.View_PostAds.KmsRun, dbo.View_PostAds.Tax, 
                         dbo.View_PostAds.Insurance, dbo.View_PostAds.CarDescription, dbo.View_PostAds.UserType, dbo.View_PostAds.UserId, dbo.View_PostAds.VehicleStatus, dbo.View_PostAds.RejectedReason, 
                         dbo.View_PostAds.IsDeleted AS postAdsIsDeleted, dbo.View_PostAds.IsActive AS postAdsIsActive, dbo.View_PostAds.MakeName, dbo.View_PostAds.MakeSequence, dbo.View_PostAds.ModelName, 
                         dbo.View_PostAds.ModelSequence, dbo.View_PostAds.VersionName, dbo.View_PostAds.VersionSequence, dbo.View_PostAds.RegDate, dbo.View_PostAds.EngineNo, dbo.View_PostAds.ChassisNo, 
                         dbo.View_PostAds.DisplayPrice, dbo.View_PostAds.CustomerDescription, dbo.View_PostAds.DisplayCustomerDescription, dbo.View_PostAds.AdminDescription, dbo.View_PostAds.DisplayAdminDescription
FROM            dbo.tblAdCarVideos INNER JOIN
                         dbo.View_PostAds ON dbo.tblAdCarVideos.AdId = dbo.View_PostAds.AdId
WHERE        (dbo.View_PostAds.IsDeleted = 0) AND (dbo.View_PostAds.IsActive = 1)

GO
/****** Object:  Table [dbo].[tblBudgetMaster]    Script Date: 5/16/2022 11:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblBudgetMaster](
	[BudgetId] [bigint] IDENTITY(1,1) NOT NULL,
	[MinValue] [decimal](18, 2) NOT NULL,
	[MaxValue] [decimal](18, 2) NOT NULL,
	[DisplayValue] [varchar](255) NOT NULL,
	[BudgetSequence] [bigint] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[AddedBy] [varchar](50) NOT NULL,
	[UpdatedBy] [varchar](50) NOT NULL,
	[AddedTime] [datetime] NOT NULL,
	[UpdatedTime] [datetime] NOT NULL,
 CONSTRAINT [PK_tblBudgetMaster] PRIMARY KEY CLUSTERED 
(
	[BudgetId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[View_BudgetMaster]    Script Date: 5/16/2022 11:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_BudgetMaster]
AS
SELECT        BudgetId, MinValue, MaxValue, DisplayValue, IsDeleted, IsActive, AddedBy, UpdatedBy, AddedTime, UpdatedTime, BudgetSequence
FROM            dbo.tblBudgetMaster

GO
/****** Object:  Table [dbo].[tblFollowUpDetails]    Script Date: 5/16/2022 11:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblFollowUpDetails](
	[FollowUpId] [bigint] IDENTITY(1,1) NOT NULL,
	[CustomerId] [bigint] NOT NULL,
	[FollowStatusId] [bigint] NOT NULL,
	[FollowTypeId] [bigint] NOT NULL,
	[FollowDate] [datetime] NOT NULL,
	[FollowDescription] [varchar](500) NOT NULL,
	[FollowCallBack] [datetime] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[AddedBy] [varchar](50) NOT NULL,
	[UpdatedBy] [varchar](50) NOT NULL,
	[AddedTime] [datetime] NOT NULL,
	[UpdatedTime] [datetime] NOT NULL,
 CONSTRAINT [PK_tblFollowUpDetails] PRIMARY KEY CLUSTERED 
(
	[FollowUpId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[View_FollowUpDetails]    Script Date: 5/16/2022 11:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_FollowUpDetails]
AS
SELECT        dbo.tblFollowUpDetails.FollowUpId, dbo.tblFollowUpDetails.FollowStatusId, dbo.tblFollowUpDetails.FollowTypeId, dbo.tblFollowUpDetails.FollowDate, dbo.tblFollowUpDetails.FollowDescription, 
                         dbo.tblFollowUpDetails.FollowCallBack, dbo.tblFollowUpDetails.IsDeleted, dbo.tblFollowUpDetails.IsActive, dbo.tblFollowUpDetails.AddedBy, dbo.tblFollowUpDetails.UpdatedBy, dbo.tblFollowUpDetails.AddedTime, 
                         dbo.tblFollowUpDetails.UpdatedTime, dbo.tblFollowUpStatus.FollowStatus, dbo.tblFollowUpStatus.FollowSequence, dbo.tblFollowUpStatus.IsDeleted AS followUpStatusIsDeleted, 
                         dbo.tblFollowUpStatus.IsActive AS followUpStatusIsActive, dbo.tblFollowUpDetails.CustomerId, dbo.View_CustomerMaster.CustomerName, dbo.View_CustomerMaster.MobileNo, dbo.View_CustomerMaster.EmailId, 
                         dbo.View_CustomerMaster.CustomerAddress, dbo.View_CustomerMaster.CatId, dbo.View_CustomerMaster.SourceId, dbo.View_CustomerMaster.StaffId, dbo.View_CustomerMaster.JoinDate, 
                         dbo.View_CustomerMaster.IsDeleted AS CustomerIsDeleted, dbo.View_CustomerMaster.IsActive AS CustomerIsActive, dbo.View_CustomerMaster.CategoryName, dbo.View_CustomerMaster.CategorySequence, 
                         dbo.View_CustomerMaster.SourceName, dbo.View_CustomerMaster.SourceSequence, dbo.View_CustomerMaster.CustomerPhoto, dbo.View_CustomerMaster.IsDisturb, dbo.View_CustomerMaster.CustomerType
FROM            dbo.tblFollowUpDetails INNER JOIN
                         dbo.tblFollowUpStatus ON dbo.tblFollowUpDetails.FollowStatusId = dbo.tblFollowUpStatus.FollowStatusId INNER JOIN
                         dbo.View_CustomerMaster ON dbo.tblFollowUpDetails.CustomerId = dbo.View_CustomerMaster.CustomerId
WHERE        (dbo.tblFollowUpStatus.IsDeleted = 0) AND (dbo.tblFollowUpStatus.IsActive = 1) AND (dbo.View_CustomerMaster.IsDeleted = 0) AND (dbo.View_CustomerMaster.IsActive = 1)

GO
/****** Object:  Table [dbo].[tblPaymentInfo]    Script Date: 5/16/2022 11:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPaymentInfo](
	[PayId] [bigint] IDENTITY(1,1) NOT NULL,
	[AdId] [bigint] NOT NULL,
	[PayDate] [datetime] NOT NULL,
	[BankName] [varchar](500) NOT NULL,
	[PayMode] [bigint] NOT NULL,
	[PayAmount] [decimal](18, 2) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[AddedBy] [varchar](50) NOT NULL,
	[UpdatedBy] [varchar](50) NOT NULL,
	[AddedTime] [datetime] NOT NULL,
	[UpdatedTime] [datetime] NOT NULL,
 CONSTRAINT [PK_tblPaymentInfo] PRIMARY KEY CLUSTERED 
(
	[PayId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[View_PaymentInfo]    Script Date: 5/16/2022 11:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_PaymentInfo]
AS
SELECT        dbo.tblPaymentInfo.PayId, dbo.tblPaymentInfo.AdId, dbo.tblPaymentInfo.PayDate, dbo.tblPaymentInfo.BankName, dbo.tblPaymentInfo.PayMode, dbo.tblPaymentInfo.PayAmount, dbo.tblPaymentInfo.IsDeleted, 
                         dbo.tblPaymentInfo.IsActive, dbo.tblPaymentInfo.AddedBy, dbo.tblPaymentInfo.UpdatedBy, dbo.tblPaymentInfo.AddedTime, dbo.tblPaymentInfo.UpdatedTime, dbo.View_PostAds.MakeId, dbo.View_PostAds.ModelId, 
                         dbo.View_PostAds.VersionId, dbo.View_PostAds.VehicleRegNo, dbo.View_PostAds.VehicleColour, dbo.View_PostAds.VehiclePrice, dbo.View_PostAds.NoOfOwners, dbo.View_PostAds.VehicleYear, dbo.View_PostAds.FuelType, 
                         dbo.View_PostAds.KmsRun, dbo.View_PostAds.Tax, dbo.View_PostAds.Insurance, dbo.View_PostAds.CarDescription, dbo.View_PostAds.UserType, dbo.View_PostAds.UserId, dbo.View_PostAds.VehicleStatus, 
                         dbo.View_PostAds.RejectedReason, dbo.View_PostAds.IsDeleted AS postAdsIsDeleted, dbo.View_PostAds.IsActive AS postAdsIsActive, dbo.View_PostAds.MakeName, dbo.View_PostAds.MakeSequence, 
                         dbo.View_PostAds.ModelName, dbo.View_PostAds.ModelSequence, dbo.View_PostAds.VersionName, dbo.View_PostAds.VersionSequence, dbo.View_PostAds.RegDate, dbo.View_PostAds.EngineNo, 
                         dbo.View_PostAds.ChassisNo, dbo.View_PostAds.DisplayPrice, dbo.View_PostAds.CustomerDescription, dbo.View_PostAds.DisplayCustomerDescription, dbo.View_PostAds.AdminDescription, 
                         dbo.View_PostAds.DisplayAdminDescription
FROM            dbo.tblPaymentInfo INNER JOIN
                         dbo.View_PostAds ON dbo.tblPaymentInfo.AdId = dbo.View_PostAds.AdId
WHERE        (dbo.View_PostAds.IsDeleted = 0) AND (dbo.View_PostAds.IsActive = 1)

GO
/****** Object:  View [dbo].[View_ExpenseDetailsNew]    Script Date: 5/16/2022 11:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_ExpenseDetailsNew]
AS
SELECT        dbo.tblExpenseDetails.ExpDetId, dbo.tblExpenseDetails.AdId, dbo.tblExpenseDetails.CustomerId, dbo.tblExpenseDetails.ExpDate, dbo.tblExpenseDetails.VehicleRegNo, dbo.tblExpenseDetails.ExpId, 
                         dbo.tblExpenseDetails.ExpAmount, dbo.tblExpenseDetails.IsDeleted, dbo.tblExpenseDetails.IsActive, dbo.tblExpenseDetails.AddedBy, dbo.tblExpenseDetails.UpdatedBy, dbo.tblExpenseDetails.AddedTime, 
                         dbo.tblExpenseDetails.UpdatedTime, dbo.View_PostAds.MakeId, dbo.View_PostAds.ModelId, dbo.View_PostAds.VersionId, dbo.View_PostAds.VehicleRegNo AS Expr1, dbo.View_PostAds.VehicleColour, 
                         dbo.View_PostAds.VehiclePrice, dbo.View_PostAds.NoOfOwners, dbo.View_PostAds.VehicleYear, dbo.View_PostAds.FuelType, dbo.View_PostAds.KmsRun, dbo.View_PostAds.Tax, dbo.View_PostAds.Insurance, 
                         dbo.View_PostAds.CarDescription, dbo.View_PostAds.UserType, dbo.View_PostAds.UserId, dbo.View_PostAds.VehicleStatus, dbo.View_PostAds.RejectedReason, dbo.View_PostAds.IsDeleted AS AdIsDeleted, 
                         dbo.View_PostAds.MakeName, dbo.View_PostAds.MakeSequence, dbo.View_PostAds.ModelName, dbo.View_PostAds.ModelSequence, dbo.View_PostAds.VersionName, dbo.View_PostAds.VersionSequence, 
                         dbo.View_PostAds.RegDate, dbo.View_PostAds.EngineNo, dbo.View_PostAds.ChassisNo, dbo.View_CustomerMaster.CustomerName, dbo.View_CustomerMaster.MobileNo, dbo.View_CustomerMaster.EmailId, 
                         dbo.View_CustomerMaster.CustomerAddress, dbo.View_CustomerMaster.CatId, dbo.View_CustomerMaster.SourceId, dbo.View_CustomerMaster.StaffId, dbo.View_CustomerMaster.JoinDate, 
                         dbo.View_CustomerMaster.IsDeleted AS CustIsDeleted, dbo.View_CustomerMaster.CategoryName, dbo.View_CustomerMaster.CategorySequence, dbo.View_CustomerMaster.SourceName, 
                         dbo.View_CustomerMaster.SourceSequence, dbo.View_CustomerMaster.CustomerPhoto, dbo.View_CustomerMaster.IsDisturb, dbo.View_CustomerMaster.CustomerType, dbo.tblExpenseDetails.ExpenseName, 
                         dbo.tblExpenseDetails.Remarks, dbo.tblExpenseDetails.StaffId AS ExpStaffId
FROM            dbo.tblExpenseDetails INNER JOIN
                         dbo.View_PostAds ON dbo.tblExpenseDetails.AdId = dbo.View_PostAds.AdId LEFT OUTER JOIN
                         dbo.View_CustomerMaster ON dbo.tblExpenseDetails.CustomerId = dbo.View_CustomerMaster.CustomerId

GO
/****** Object:  Table [dbo].[tblQuotationDetails]    Script Date: 5/16/2022 11:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblQuotationDetails](
	[QuoteId] [bigint] IDENTITY(1,1) NOT NULL,
	[AdId] [bigint] NOT NULL,
	[CustomerId] [bigint] NOT NULL,
	[PurchaseDate] [date] NOT NULL,
	[ReferenceNo] [varchar](255) NOT NULL,
	[QuoteAmount] [decimal](18, 2) NOT NULL,
	[Remarks] [varchar](500) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[AddedBy] [varchar](50) NOT NULL,
	[UpdatedBy] [varchar](50) NOT NULL,
	[AddedTime] [datetime] NOT NULL,
	[UpdatedTime] [datetime] NOT NULL,
 CONSTRAINT [PK_tblQuotationDetails] PRIMARY KEY CLUSTERED 
(
	[QuoteId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[View_QuotationDetails]    Script Date: 5/16/2022 11:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_QuotationDetails]
AS
SELECT        dbo.tblQuotationDetails.QuoteId, dbo.tblQuotationDetails.AdId, dbo.tblQuotationDetails.CustomerId, dbo.tblQuotationDetails.PurchaseDate, dbo.tblQuotationDetails.ReferenceNo, dbo.tblQuotationDetails.QuoteAmount, 
                         dbo.tblQuotationDetails.Remarks, dbo.tblQuotationDetails.IsDeleted, dbo.tblQuotationDetails.IsActive, dbo.tblQuotationDetails.AddedBy, dbo.tblQuotationDetails.UpdatedBy, dbo.tblQuotationDetails.AddedTime, 
                         dbo.tblQuotationDetails.UpdatedTime, dbo.View_PostAds.MakeId, dbo.View_PostAds.ModelId, dbo.View_PostAds.VersionId, dbo.View_PostAds.VehicleRegNo, dbo.View_PostAds.VehicleColour, dbo.View_PostAds.VehiclePrice, 
                         dbo.View_PostAds.NoOfOwners, dbo.View_PostAds.VehicleYear, dbo.View_PostAds.FuelType, dbo.View_PostAds.KmsRun, dbo.View_PostAds.Tax, dbo.View_PostAds.Insurance, dbo.View_PostAds.CarDescription, 
                         dbo.View_PostAds.UserType, dbo.View_PostAds.UserId, dbo.View_PostAds.VehicleStatus, dbo.View_PostAds.RejectedReason, dbo.View_PostAds.IsDeleted AS PostAdsIsDeleted, dbo.View_PostAds.IsActive AS PostAdsIsActive, 
                         dbo.View_PostAds.MakeName, dbo.View_PostAds.MakeSequence, dbo.View_PostAds.ModelName, dbo.View_PostAds.ModelSequence, dbo.View_PostAds.VersionName, dbo.View_PostAds.VersionSequence, 
                         dbo.View_PostAds.RegDate, dbo.View_PostAds.EngineNo, dbo.View_PostAds.ChassisNo, dbo.View_CustomerMaster.CustomerName, dbo.View_CustomerMaster.MobileNo, dbo.View_CustomerMaster.EmailId, 
                         dbo.View_CustomerMaster.CustomerAddress, dbo.View_CustomerMaster.CatId, dbo.View_CustomerMaster.SourceId, dbo.View_CustomerMaster.StaffId, dbo.View_CustomerMaster.JoinDate, 
                         dbo.View_CustomerMaster.IsDeleted AS CustomerIsDeleted, dbo.View_CustomerMaster.IsActive AS CustomerIsActive, dbo.View_CustomerMaster.CategoryName, dbo.View_CustomerMaster.CategorySequence, 
                         dbo.View_CustomerMaster.SourceName, dbo.View_CustomerMaster.SourceSequence, dbo.View_CustomerMaster.CustomerPhoto, dbo.View_CustomerMaster.IsDisturb, dbo.View_CustomerMaster.CustomerType, 
                         dbo.View_CustomerMaster.Messages
FROM            dbo.tblQuotationDetails INNER JOIN
                         dbo.View_PostAds ON dbo.tblQuotationDetails.AdId = dbo.View_PostAds.AdId LEFT OUTER JOIN
                         dbo.View_CustomerMaster ON dbo.tblQuotationDetails.CustomerId = dbo.View_CustomerMaster.CustomerId
WHERE        (dbo.View_PostAds.IsDeleted = 0) AND (dbo.View_PostAds.IsActive = 1) AND (dbo.View_CustomerMaster.IsDeleted = 0) AND (dbo.View_CustomerMaster.IsActive = 1)

GO
/****** Object:  Table [dbo].[tblPurchaseInfo]    Script Date: 5/16/2022 11:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPurchaseInfo](
	[PurchaseId] [bigint] IDENTITY(1,1) NOT NULL,
	[AdId] [bigint] NOT NULL,
	[PurchaseDate] [date] NOT NULL,
	[BrokerName] [varchar](255) NOT NULL,
	[ContactNo] [varchar](50) NOT NULL,
	[ContactAddress] [varchar](500) NOT NULL,
	[PurchaseAmount] [decimal](18, 2) NOT NULL,
	[Commission] [decimal](18, 2) NOT NULL,
	[TotalAmount] [decimal](18, 2) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[AddedBy] [varchar](50) NOT NULL,
	[UpdatedBy] [varchar](50) NOT NULL,
	[AddedTime] [datetime] NOT NULL,
	[UpdatedTime] [datetime] NOT NULL,
 CONSTRAINT [PK_tblPurchaseInfo] PRIMARY KEY CLUSTERED 
(
	[PurchaseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[View_PurchaseInfo]    Script Date: 5/16/2022 11:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_PurchaseInfo]
AS
SELECT        dbo.tblPurchaseInfo.PurchaseId, dbo.tblPurchaseInfo.AdId, dbo.tblPurchaseInfo.BrokerName, dbo.tblPurchaseInfo.Commission, dbo.tblPurchaseInfo.IsDeleted, dbo.tblPurchaseInfo.IsActive, dbo.tblPurchaseInfo.AddedBy, 
                         dbo.tblPurchaseInfo.UpdatedBy, dbo.tblPurchaseInfo.AddedTime, dbo.tblPurchaseInfo.UpdatedTime, dbo.View_PostAds.MakeId, dbo.View_PostAds.ModelId, dbo.View_PostAds.VersionId, dbo.View_PostAds.VehicleRegNo, 
                         dbo.View_PostAds.VehicleColour, dbo.View_PostAds.VehiclePrice, dbo.View_PostAds.NoOfOwners, dbo.View_PostAds.VehicleYear, dbo.View_PostAds.FuelType, dbo.View_PostAds.KmsRun, dbo.View_PostAds.Tax, 
                         dbo.View_PostAds.Insurance, dbo.View_PostAds.CarDescription, dbo.View_PostAds.UserType, dbo.View_PostAds.UserId, dbo.View_PostAds.VehicleStatus, dbo.View_PostAds.RejectedReason, 
                         dbo.View_PostAds.IsDeleted AS PostAdIsDeleted, dbo.View_PostAds.IsActive AS PostAdIsActive, dbo.View_PostAds.MakeName, dbo.View_PostAds.MakeSequence, dbo.View_PostAds.MakeIsDeleted, 
                         dbo.View_PostAds.ModelName, dbo.View_PostAds.ModelSequence, dbo.View_PostAds.ModelIsDeleted, dbo.View_PostAds.VersionName, dbo.View_PostAds.VersionSequence, dbo.View_PostAds.VersionIsDeleted, 
                         dbo.tblPurchaseInfo.PurchaseDate, dbo.tblPurchaseInfo.ContactNo, dbo.tblPurchaseInfo.ContactAddress, dbo.tblPurchaseInfo.PurchaseAmount, dbo.tblPurchaseInfo.TotalAmount
FROM            dbo.tblPurchaseInfo INNER JOIN
                         dbo.View_PostAds ON dbo.tblPurchaseInfo.AdId = dbo.View_PostAds.AdId
WHERE        (dbo.View_PostAds.IsDeleted = 0) AND (dbo.View_PostAds.IsActive = 1)

GO
/****** Object:  Table [dbo].[tblAdvanceDetails]    Script Date: 5/16/2022 11:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblAdvanceDetails](
	[AdvId] [bigint] IDENTITY(1,1) NOT NULL,
	[AdId] [bigint] NOT NULL,
	[CustomerId] [bigint] NOT NULL,
	[AdvDate] [date] NOT NULL,
	[ReferenceNo] [varchar](255) NOT NULL,
	[AdvAmount] [decimal](18, 2) NOT NULL,
	[FixedPrice] [decimal](18, 2) NOT NULL,
	[ReceivedAmount] [decimal](18, 2) NOT NULL,
	[BalanceAmount] [decimal](18, 2) NOT NULL,
	[Remarks] [varchar](500) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[AddedBy] [varchar](50) NOT NULL,
	[UpdatedBy] [varchar](50) NOT NULL,
	[AddedTime] [datetime] NOT NULL,
	[UpdatedTime] [datetime] NOT NULL,
 CONSTRAINT [PK_tblAdvanceDetails] PRIMARY KEY CLUSTERED 
(
	[AdvId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[View_AdvanceDetails]    Script Date: 5/16/2022 11:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_AdvanceDetails]
AS
SELECT        dbo.tblAdvanceDetails.AdvId, dbo.tblAdvanceDetails.AdId, dbo.tblAdvanceDetails.CustomerId, dbo.tblAdvanceDetails.AdvDate, dbo.tblAdvanceDetails.ReferenceNo, dbo.tblAdvanceDetails.AdvAmount, 
                         dbo.tblAdvanceDetails.FixedPrice, dbo.tblAdvanceDetails.ReceivedAmount, dbo.tblAdvanceDetails.BalanceAmount, dbo.tblAdvanceDetails.Remarks, dbo.tblAdvanceDetails.IsDeleted, dbo.tblAdvanceDetails.IsActive, 
                         dbo.tblAdvanceDetails.AddedBy, dbo.tblAdvanceDetails.UpdatedBy, dbo.tblAdvanceDetails.AddedTime, dbo.tblAdvanceDetails.UpdatedTime, dbo.View_PostAds.MakeId, dbo.View_PostAds.ModelId, dbo.View_PostAds.VersionId, 
                         dbo.View_PostAds.VehicleRegNo, dbo.View_PostAds.VehicleColour, dbo.View_PostAds.VehiclePrice, dbo.View_PostAds.NoOfOwners, dbo.View_PostAds.VehicleYear, dbo.View_PostAds.FuelType, dbo.View_PostAds.KmsRun, 
                         dbo.View_PostAds.Tax, dbo.View_PostAds.Insurance, dbo.View_PostAds.CarDescription, dbo.View_PostAds.UserType, dbo.View_PostAds.UserId, dbo.View_PostAds.VehicleStatus, dbo.View_PostAds.RejectedReason, 
                         dbo.View_PostAds.IsDeleted AS PostAdsIsDeleted, dbo.View_PostAds.IsActive AS PostAdsIsActive, dbo.View_PostAds.MakeName, dbo.View_PostAds.MakeSequence, dbo.View_PostAds.ModelName, 
                         dbo.View_PostAds.ModelSequence, dbo.View_PostAds.VersionName, dbo.View_PostAds.VersionSequence, dbo.View_PostAds.RegDate, dbo.View_PostAds.EngineNo, dbo.View_PostAds.ChassisNo, 
                         dbo.View_CustomerMaster.CustomerName, dbo.View_CustomerMaster.MobileNo, dbo.View_CustomerMaster.EmailId, dbo.View_CustomerMaster.CustomerAddress, dbo.View_CustomerMaster.CatId, 
                         dbo.View_CustomerMaster.SourceId, dbo.View_CustomerMaster.StaffId, dbo.View_CustomerMaster.JoinDate, dbo.View_CustomerMaster.IsDeleted AS CustomerIsDeleted, 
                         dbo.View_CustomerMaster.IsActive AS CustomerIsActive, dbo.View_CustomerMaster.CategoryName, dbo.View_CustomerMaster.CategorySequence, dbo.View_CustomerMaster.SourceName, 
                         dbo.View_CustomerMaster.SourceSequence, dbo.View_CustomerMaster.CustomerPhoto, dbo.View_CustomerMaster.IsDisturb, dbo.View_CustomerMaster.CustomerType, dbo.View_CustomerMaster.Messages
FROM            dbo.tblAdvanceDetails INNER JOIN
                         dbo.View_PostAds ON dbo.tblAdvanceDetails.AdId = dbo.View_PostAds.AdId LEFT OUTER JOIN
                         dbo.View_CustomerMaster ON dbo.tblAdvanceDetails.CustomerId = dbo.View_CustomerMaster.CustomerId
WHERE        (dbo.View_PostAds.IsDeleted = 0) AND (dbo.View_PostAds.IsActive = 1) AND (dbo.View_CustomerMaster.IsDeleted = 0) AND (dbo.View_CustomerMaster.IsActive = 1)

GO
/****** Object:  Table [dbo].[tblInsuranceInfo]    Script Date: 5/16/2022 11:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblInsuranceInfo](
	[InsId] [bigint] IDENTITY(1,1) NOT NULL,
	[AdId] [bigint] NOT NULL,
	[ClaimValue] [varchar](255) NOT NULL,
	[IDV] [decimal](18, 2) NOT NULL,
	[ExpDate] [date] NOT NULL,
	[AddlNotes] [varchar](500) NOT NULL,
	[VehicleRegNo] [varchar](255) NOT NULL,
	[CustomerId] [bigint] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[AddedBy] [varchar](50) NOT NULL,
	[UpdatedBy] [varchar](50) NOT NULL,
	[AddedTime] [datetime] NOT NULL,
	[UpdatedTime] [datetime] NOT NULL,
 CONSTRAINT [PK_tblInsuranceInfo] PRIMARY KEY CLUSTERED 
(
	[InsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[View_InsuranceInfo]    Script Date: 5/16/2022 11:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[View_InsuranceInfo]
AS
SELECT        dbo.tblInsuranceInfo.InsId, dbo.tblInsuranceInfo.AdId, dbo.tblInsuranceInfo.ClaimValue, dbo.tblInsuranceInfo.AddlNotes, dbo.tblInsuranceInfo.ExpDate, 
                         dbo.tblInsuranceInfo.IsDeleted, dbo.tblInsuranceInfo.IsActive, dbo.tblInsuranceInfo.AddedBy, dbo.tblInsuranceInfo.UpdatedBy, dbo.tblInsuranceInfo.AddedTime, 
                         dbo.tblInsuranceInfo.UpdatedTime, isnull(dbo.View_PostAds.MakeId,0) as MakeId,ISNULL(dbo.View_PostAds.ModelId,0) as ModelId, 
						 isnull(dbo.View_PostAds.VersionId,0) as VersionId,  isnull(dbo.View_PostAds.VehicleRegNo, 'NA') as VehicleRegNo,
                          isnull(dbo.View_PostAds.VehicleColour,'NA') AS VehicleColour ,ISNULL(dbo.View_PostAds.VehiclePrice,0) AS VehiclePrice, 
						 ISNULL( dbo.View_PostAds.NoOfOwners,0) AS NoOfOwners ,ISNULL( dbo.View_PostAds.VehicleYear,'0') AS VehicleYear, 
						 ISNULL( dbo.View_PostAds.FuelType,0) AS FUELTYPE, 
                         ISNULL( dbo.View_PostAds.KmsRun,0) AS KMSRUN,
						 ISNULL( dbo.View_PostAds.Tax,0) AS TAX, 
						 ISNULL( dbo.View_PostAds.Insurance,'NA') AS INSURANCE, 
						 ISNULL( dbo.View_PostAds.CarDescription,'NA') AS CarDescription, 
						 ISNULL( dbo.View_PostAds.UserType,0) AS UserType ,
                         ISNULL( dbo.View_PostAds.UserId, 0) AS USERID,
						 ISNULL( dbo.View_PostAds.VehicleStatus,0) AS VehicleStatus,
						 ISNULL(dbo.View_PostAds.RejectedReason,'') AS RejectedReason, ISNULL(dbo.View_PostAds.IsDeleted,0) AS PostAdIsDeleted, 
                          ISNULL(dbo.View_PostAds.IsActive,1) AS PostAdIsActive, ISNULL(dbo.View_PostAds.MakeName,'NA') AS MakeName, 
						  ISNULL(dbo.View_PostAds.MakeSequence,0) AS MakeSequence, ISNULL(dbo.View_PostAds.MakeIsDeleted, 0) AS MakeIsDeleted,
                         ISNULL(dbo.View_PostAds.ModelName,'') AS MODELNAME, ISNULL(dbo.View_PostAds.ModelSequence,0) AS ModelSequence,
						 ISNULL(dbo.View_PostAds.ModelIsDeleted,0) AS ModelIsDeleted, 
						 ISNULL(dbo.View_PostAds.VersionName, 'NA') AS VersionName,
                         ISNULL(dbo.View_PostAds.VersionSequence,0) AS VersionSequence,
						 ISNULL(dbo.View_PostAds.VersionIsDeleted,0) AS VersionIsDeleted, dbo.tblInsuranceInfo.IDV, dbo.tblInsuranceInfo.VehicleRegNo AS InsVehicleRegNo, 
                         dbo.tblInsuranceInfo.CustomerId, ISNULL(dbo.tblCustomerMaster.CustomerName,'NA') AS CustomerName,
						 ISNULL(dbo.tblCustomerMaster.MobileNo,'NA') AS MobileNo, 
						 ISNULL(dbo.tblCustomerMaster.EmailId, 'NA') AS EmailId,
                         ISNULL(dbo.tblCustomerMaster.CustomerAddress,'NA') AS CustomerAddress,
						 ISNULL(dbo.tblCustomerMaster.CatId,0) AS CatId,
						 ISNULL(dbo.tblCustomerMaster.SourceId,0) AS SourceId, ISNULL(dbo.tblCustomerMaster.StaffId,0) AS StaffId, 
                         ISNULL(dbo.tblCustomerMaster.JoinDate,'1/1/1900') AS JoinDate,
						 ISNULL(dbo.tblCustomerMaster.CustomerPhoto,'NA') AS CustomerPhoto,
						 ISNULL(dbo.tblCustomerMaster.IsDisturb,0) AS IsDisturb,
						 ISNULL(dbo.tblCustomerMaster.CustomerType,0) AS CustomerType,
                         ISNULL(dbo.tblCustomerMaster.IsDeleted,0) AS CustomerIsDeleted, ISNULL(dbo.tblCustomerMaster.IsActive,1) AS CustomerIsActive
FROM            dbo.tblInsuranceInfo LEFT OUTER JOIN
                         dbo.View_PostAds ON dbo.tblInsuranceInfo.AdId = dbo.View_PostAds.AdId LEFT OUTER JOIN
                         dbo.tblCustomerMaster ON dbo.tblInsuranceInfo.CustomerId = dbo.tblCustomerMaster.CustomerId

GO
/****** Object:  Table [dbo].[tblPostRequirement]    Script Date: 5/16/2022 11:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPostRequirement](
	[PostId] [bigint] IDENTITY(1,1) NOT NULL,
	[AdId] [bigint] NOT NULL,
	[MakeId] [bigint] NOT NULL,
	[ModelId] [bigint] NOT NULL,
	[VersionId] [bigint] NOT NULL,
	[Amount] [decimal](18, 2) NOT NULL,
	[PostInfo] [varchar](500) NOT NULL,
	[VehicleRegNo] [varchar](255) NOT NULL,
	[VehicleColour] [varchar](150) NOT NULL,
	[VehicleYear] [bigint] NOT NULL,
	[FuelType] [bigint] NOT NULL,
	[PaymentMode] [varchar](255) NOT NULL,
	[ExchangeDetails] [varchar](1000) NOT NULL,
	[IsHotList] [bit] NOT NULL,
	[AttendedBy] [varchar](255) NOT NULL,
	[CustomerId] [bigint] NOT NULL,
	[UserName] [varchar](255) NOT NULL,
	[EmailId] [varchar](50) NOT NULL,
	[ContactNo] [varchar](50) NOT NULL,
	[UserAddress] [varchar](500) NOT NULL,
	[PostStatus] [bigint] NOT NULL,
	[UserType] [bigint] NOT NULL,
	[IsTestDrive] [bit] NOT NULL,
	[CustomerDescription] [varchar](max) NOT NULL,
	[AdminDescription] [varchar](max) NOT NULL,
	[DisplayCustomerDescription] [bit] NOT NULL,
	[DisplayAdminDescription] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[AddedBy] [varchar](50) NOT NULL,
	[UpdatedBy] [varchar](50) NOT NULL,
	[AddedTime] [datetime] NOT NULL,
	[UpdatedTime] [datetime] NOT NULL,
 CONSTRAINT [PK_tblPostRequirement] PRIMARY KEY CLUSTERED 
(
	[PostId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  View [dbo].[View_PostRequirement]    Script Date: 5/16/2022 11:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_PostRequirement]
AS
SELECT        dbo.tblPostRequirement.PostId, dbo.tblPostRequirement.AdId, dbo.tblPostRequirement.MakeId, dbo.tblPostRequirement.ModelId, dbo.tblPostRequirement.VersionId, dbo.tblPostRequirement.Amount, 
                         dbo.tblPostRequirement.PostInfo, dbo.tblPostRequirement.PostStatus, dbo.tblPostRequirement.UserType, dbo.tblPostRequirement.IsDeleted, dbo.tblPostRequirement.IsActive, dbo.tblPostRequirement.AddedBy, 
                         dbo.tblPostRequirement.UpdatedBy, dbo.tblPostRequirement.AddedTime, dbo.tblPostRequirement.UpdatedTime, dbo.tblMakeMaster.MakeName, dbo.tblMakeMaster.MakeSequence, 
                         dbo.tblMakeMaster.IsDeleted AS MakeIsDeleted, dbo.tblMakeMaster.IsActive AS MakeIsActive, dbo.tblModelMaster.ModelName, dbo.tblModelMaster.ModelSequence, 
                         dbo.tblModelMaster.IsDeleted AS ModelIsDeleted, dbo.tblModelMaster.IsActive AS ModelIsActive, dbo.tblVersionMaster.VersionName, dbo.tblVersionMaster.VersionSequence, 
                         dbo.tblVersionMaster.IsDeleted AS VersionIsDeleted, dbo.tblVersionMaster.IsActive AS VersionIsActive, dbo.tblPostRequirement.VehicleRegNo, dbo.tblPostRequirement.VehicleColour, 
                         dbo.tblPostRequirement.VehicleYear, dbo.tblPostRequirement.FuelType, dbo.tblPostRequirement.PaymentMode, dbo.tblPostRequirement.ExchangeDetails, dbo.tblPostRequirement.IsHotList, 
                         dbo.tblPostRequirement.AttendedBy, dbo.tblPostRequirement.CustomerId, dbo.tblPostRequirement.IsTestDrive, dbo.tblFuelMaster.FuelName, dbo.tblPostRequirement.CustomerDescription, 
                         dbo.tblPostRequirement.AdminDescription, dbo.tblPostRequirement.DisplayCustomerDescription, dbo.tblPostRequirement.DisplayAdminDescription, dbo.tblCustomerMaster.CustomerName AS UserName, 
                         dbo.tblCustomerMaster.MobileNo AS ContactNo, dbo.tblCustomerMaster.EmailId, dbo.tblCustomerMaster.CustomerAddress AS UserAddress
FROM            dbo.tblMakeMaster INNER JOIN
                         dbo.tblModelMaster ON dbo.tblMakeMaster.MakeId = dbo.tblModelMaster.MakeId INNER JOIN
                         dbo.tblVersionMaster ON dbo.tblModelMaster.ModelId = dbo.tblVersionMaster.ModelId INNER JOIN
                         dbo.tblPostRequirement ON dbo.tblMakeMaster.MakeId = dbo.tblPostRequirement.MakeId AND dbo.tblModelMaster.ModelId = dbo.tblPostRequirement.ModelId AND 
                         dbo.tblVersionMaster.VersionId = dbo.tblPostRequirement.VersionId INNER JOIN
                         dbo.tblFuelMaster ON dbo.tblPostRequirement.FuelType = dbo.tblFuelMaster.FuelType INNER JOIN
                         dbo.tblCustomerMaster ON dbo.tblPostRequirement.CustomerId = dbo.tblCustomerMaster.CustomerId
WHERE        (dbo.tblMakeMaster.IsDeleted = 0) AND (dbo.tblMakeMaster.IsActive = 1) AND (dbo.tblModelMaster.IsDeleted = 0) AND (dbo.tblModelMaster.IsActive = 1) AND (dbo.tblVersionMaster.IsDeleted = 0) AND 
                         (dbo.tblVersionMaster.IsActive = 1)

GO
/****** Object:  View [dbo].[View_CategoryMaster]    Script Date: 5/16/2022 11:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_CategoryMaster]
AS
SELECT        CatId, CategoryName, CategorySequence, IsDeleted, IsActive, AddedBy, UpdatedBy, AddedTime, UpdatedTime
FROM            dbo.tblCategoryMaster

GO
/****** Object:  View [dbo].[View_SourceMaster]    Script Date: 5/16/2022 11:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_SourceMaster]
AS
SELECT        SourceId, SourceName, SourceSequence, IsDeleted, IsActive, AddedBy, UpdatedBy, AddedTime, UpdatedTime
FROM            dbo.tblSourceMaster

GO
/****** Object:  Table [dbo].[tblInsuranceMaster]    Script Date: 5/16/2022 11:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblInsuranceMaster](
	[InsuranceId] [bigint] IDENTITY(1,1) NOT NULL,
	[CustomerId] [bigint] NOT NULL,
	[ContactName] [varchar](255) NOT NULL,
	[EmailId] [varchar](255) NOT NULL,
	[ContactNo] [varchar](50) NOT NULL,
	[MakeId] [bigint] NOT NULL,
	[ModelId] [bigint] NOT NULL,
	[VersionId] [bigint] NOT NULL,
	[IsInsActive] [bit] NOT NULL,
	[AddlInfo] [varchar](500) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[AddedBy] [varchar](50) NOT NULL,
	[UpdatedBy] [varchar](50) NOT NULL,
	[AddedTime] [datetime] NOT NULL,
	[UpdatedTime] [datetime] NOT NULL,
 CONSTRAINT [PK_tblInsuranceMaster] PRIMARY KEY CLUSTERED 
(
	[InsuranceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[View_InsuranceMaster]    Script Date: 5/16/2022 11:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_InsuranceMaster]
AS
SELECT        dbo.tblInsuranceMaster.InsuranceId, dbo.tblInsuranceMaster.EmailId, dbo.tblInsuranceMaster.ContactNo, dbo.tblInsuranceMaster.MakeId, dbo.tblInsuranceMaster.ModelId, dbo.tblInsuranceMaster.VersionId, 
                         dbo.tblInsuranceMaster.IsInsActive, dbo.tblInsuranceMaster.AddlInfo, dbo.tblInsuranceMaster.IsDeleted, dbo.tblInsuranceMaster.IsActive, dbo.tblInsuranceMaster.AddedBy, dbo.tblInsuranceMaster.UpdatedBy, 
                         dbo.tblInsuranceMaster.AddedTime, dbo.tblInsuranceMaster.UpdatedTime, dbo.tblMakeMaster.MakeName, dbo.tblMakeMaster.MakeSequence, dbo.tblMakeMaster.IsDeleted AS MakeIsDeleted, 
                         dbo.tblMakeMaster.IsActive AS MakeIsActive, dbo.tblModelMaster.ModelName, dbo.tblModelMaster.ModelSequence, dbo.tblModelMaster.IsDeleted AS ModelIsDeleted, dbo.tblModelMaster.IsActive AS ModelIsActive, 
                         dbo.tblVersionMaster.VersionName, dbo.tblVersionMaster.VersionSequence, dbo.tblVersionMaster.IsDeleted AS VersionIsDeleted, dbo.tblVersionMaster.IsActive AS VersionIsActive, dbo.tblInsuranceMaster.ContactName
FROM            dbo.tblModelMaster INNER JOIN
                         dbo.tblMakeMaster ON dbo.tblModelMaster.MakeId = dbo.tblMakeMaster.MakeId INNER JOIN
                         dbo.tblVersionMaster ON dbo.tblModelMaster.ModelId = dbo.tblVersionMaster.ModelId INNER JOIN
                         dbo.tblInsuranceMaster ON dbo.tblMakeMaster.MakeId = dbo.tblInsuranceMaster.MakeId AND dbo.tblModelMaster.ModelId = dbo.tblInsuranceMaster.ModelId AND 
                         dbo.tblVersionMaster.VersionId = dbo.tblInsuranceMaster.VersionId
WHERE        (dbo.tblMakeMaster.IsDeleted = 0) AND (dbo.tblMakeMaster.IsActive = 1) AND (dbo.tblModelMaster.IsDeleted = 0) AND (dbo.tblModelMaster.IsActive = 1) AND (dbo.tblVersionMaster.IsDeleted = 0) AND 
                         (dbo.tblVersionMaster.IsActive = 1)

GO
/****** Object:  Table [dbo].[tblAdminLogin]    Script Date: 5/16/2022 11:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblAdminLogin](
	[AdmId] [bigint] IDENTITY(1001,1) NOT NULL,
	[LoginId] [varchar](255) NOT NULL,
	[LoginName] [varchar](255) NOT NULL,
	[LoginPassword] [varchar](255) NOT NULL,
	[LastLogin] [datetime] NOT NULL,
	[IpAddress] [varchar](500) NOT NULL,
	[FatherName] [varchar](255) NOT NULL,
	[PatnerName] [varchar](255) NOT NULL,
	[ContactNo] [varchar](50) NOT NULL,
	[ContactAddress] [varchar](500) NOT NULL,
	[EmailId] [varchar](255) NOT NULL,
	[DOB] [date] NOT NULL,
	[DOJ] [date] NOT NULL,
	[StaffPic] [varchar](500) NOT NULL,
	[Gender] [bit] NOT NULL,
	[Married] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[AddedBy] [varchar](255) NOT NULL,
	[UpdatedBy] [varchar](255) NOT NULL,
	[AddedTime] [datetime] NOT NULL,
	[UpdatedTime] [datetime] NOT NULL,
 CONSTRAINT [PK_tblAdminLogin] PRIMARY KEY CLUSTERED 
(
	[AdmId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblLoginActivity]    Script Date: 5/16/2022 11:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblLoginActivity](
	[LogActId] [bigint] IDENTITY(1,1) NOT NULL,
	[LoginId] [varchar](255) NOT NULL,
	[LoginName] [varchar](255) NOT NULL,
	[LoginDate] [datetime] NOT NULL,
	[IpAddress] [varchar](100) NOT NULL,
	[LoginBrowser] [varchar](255) NOT NULL,
	[LoginDevice] [varchar](100) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[AddedTime] [datetime] NOT NULL,
	[UpdatedTime] [datetime] NOT NULL,
 CONSTRAINT [PK_tblLoginActivity] PRIMARY KEY CLUSTERED 
(
	[LogActId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblMakeMasterExcel]    Script Date: 5/16/2022 11:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblMakeMasterExcel](
	[MakeId] [bigint] IDENTITY(1,1) NOT NULL,
	[MakeName] [varchar](255) NOT NULL,
	[MakeSequence] [bigint] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[AddedBy] [varchar](50) NOT NULL,
	[UpdatedBy] [varchar](50) NOT NULL,
	[AddedTime] [datetime] NOT NULL,
	[UpdatedTime] [datetime] NOT NULL,
 CONSTRAINT [PK_tblMakeMasterExcel] PRIMARY KEY CLUSTERED 
(
	[MakeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblModelMasterExcel]    Script Date: 5/16/2022 11:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblModelMasterExcel](
	[ModelId] [bigint] IDENTITY(1,1) NOT NULL,
	[MakeId] [bigint] NOT NULL,
	[ModelName] [varchar](255) NOT NULL,
	[ModelSequence] [bigint] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[AddedBy] [varchar](50) NOT NULL,
	[UpdatedBy] [varchar](50) NOT NULL,
	[AddedTime] [datetime] NOT NULL,
	[UpdatedTime] [datetime] NOT NULL,
 CONSTRAINT [PK_tblModelMasterExcel] PRIMARY KEY CLUSTERED 
(
	[ModelId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblRoleMaster]    Script Date: 5/16/2022 11:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRoleMaster](
	[RoleId] [bigint] IDENTITY(1,1) NOT NULL,
	[RoleName] [varchar](255) NOT NULL,
	[RoleSequence] [bigint] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[AddedBy] [varchar](50) NOT NULL,
	[UpdatedBy] [varchar](50) NOT NULL,
	[AddedTime] [datetime] NOT NULL,
	[UpdatedTime] [datetime] NOT NULL,
 CONSTRAINT [PK_tblRoleMaster] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblTest]    Script Date: 5/16/2022 11:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTest](
	[Testid] [bigint] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblVersionMasterExcel]    Script Date: 5/16/2022 11:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblVersionMasterExcel](
	[VersionId] [bigint] IDENTITY(1,1) NOT NULL,
	[ModelId] [bigint] NOT NULL,
	[VersionName] [varchar](255) NOT NULL,
	[VersionSequence] [bigint] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[AddedBy] [varchar](50) NOT NULL,
	[UpdatedBy] [varchar](50) NOT NULL,
	[AddedTime] [datetime] NOT NULL,
	[UpdatedTime] [datetime] NOT NULL,
 CONSTRAINT [PK_tblVersionMasterExcel] PRIMARY KEY CLUSTERED 
(
	[VersionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[tblAdCarImages] ADD  CONSTRAINT [DF_tblAdCarImages_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[tblAdCarImages] ADD  CONSTRAINT [DF_tblAdCarImages_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[tblAdCarImages] ADD  CONSTRAINT [DF_tblAdCarImages_AddedTime]  DEFAULT (getdate()) FOR [AddedTime]
GO
ALTER TABLE [dbo].[tblAdCarImages] ADD  CONSTRAINT [DF_tblAdCarImages_UpdatedTime]  DEFAULT (getdate()) FOR [UpdatedTime]
GO
ALTER TABLE [dbo].[tblAdCarOwnerDetails] ADD  CONSTRAINT [DF_tblAdCarOwnerDetails_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[tblAdCarOwnerDetails] ADD  CONSTRAINT [DF_tblAdCarOwnerDetails_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[tblAdCarOwnerDetails] ADD  CONSTRAINT [DF_tblAdCarOwnerDetails_AddedTime]  DEFAULT (getdate()) FOR [AddedTime]
GO
ALTER TABLE [dbo].[tblAdCarOwnerDetails] ADD  CONSTRAINT [DF_tblAdCarOwnerDetails_UpdatedTime]  DEFAULT (getdate()) FOR [UpdatedTime]
GO
ALTER TABLE [dbo].[tblAdCarVideos] ADD  CONSTRAINT [DF_tblAdCarVideos_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[tblAdCarVideos] ADD  CONSTRAINT [DF_tblAdCarVideos_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[tblAdCarVideos] ADD  CONSTRAINT [DF_tblAdCarVideos_AddedTime]  DEFAULT (getdate()) FOR [AddedTime]
GO
ALTER TABLE [dbo].[tblAdCarVideos] ADD  CONSTRAINT [DF_tblAdCarVideos_UpdatedTime]  DEFAULT (getdate()) FOR [UpdatedTime]
GO
ALTER TABLE [dbo].[tblAdminLogin] ADD  CONSTRAINT [DF_tblAdminLogin_FatherName]  DEFAULT ('') FOR [FatherName]
GO
ALTER TABLE [dbo].[tblAdminLogin] ADD  CONSTRAINT [DF_tblAdminLogin_PatnerName]  DEFAULT ('') FOR [PatnerName]
GO
ALTER TABLE [dbo].[tblAdminLogin] ADD  CONSTRAINT [DF_tblAdminLogin_ContactNo]  DEFAULT ('') FOR [ContactNo]
GO
ALTER TABLE [dbo].[tblAdminLogin] ADD  CONSTRAINT [DF_tblAdminLogin_ContactAddress]  DEFAULT ('') FOR [ContactAddress]
GO
ALTER TABLE [dbo].[tblAdminLogin] ADD  CONSTRAINT [DF_tblAdminLogin_EmailId]  DEFAULT ('') FOR [EmailId]
GO
ALTER TABLE [dbo].[tblAdminLogin] ADD  CONSTRAINT [DF_tblAdminLogin_DOB]  DEFAULT (getdate()) FOR [DOB]
GO
ALTER TABLE [dbo].[tblAdminLogin] ADD  CONSTRAINT [DF_tblAdminLogin_DOJ]  DEFAULT (getdate()) FOR [DOJ]
GO
ALTER TABLE [dbo].[tblAdminLogin] ADD  CONSTRAINT [DF_tblAdminLogin_StaffPic]  DEFAULT ('') FOR [StaffPic]
GO
ALTER TABLE [dbo].[tblAdminLogin] ADD  CONSTRAINT [DF_tblAdminLogin_Gender]  DEFAULT ((1)) FOR [Gender]
GO
ALTER TABLE [dbo].[tblAdminLogin] ADD  CONSTRAINT [DF_tblAdminLogin_Married]  DEFAULT ((1)) FOR [Married]
GO
ALTER TABLE [dbo].[tblAdminLogin] ADD  CONSTRAINT [DF_tblAdminLogin_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[tblAdminLogin] ADD  CONSTRAINT [DF_tblAdminLogin_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[tblAdminLogin] ADD  CONSTRAINT [DF_tblAdminLogin_AddedTime]  DEFAULT (getdate()) FOR [AddedTime]
GO
ALTER TABLE [dbo].[tblAdminLogin] ADD  CONSTRAINT [DF_tblAdminLogin_UpdatedTime]  DEFAULT (getdate()) FOR [UpdatedTime]
GO
ALTER TABLE [dbo].[tblAdvanceDetails] ADD  CONSTRAINT [DF_tblAdvanceDetails_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[tblAdvanceDetails] ADD  CONSTRAINT [DF_tblAdvanceDetails_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[tblAdvanceDetails] ADD  CONSTRAINT [DF_tblAdvanceDetails_AddedTime]  DEFAULT (getdate()) FOR [AddedTime]
GO
ALTER TABLE [dbo].[tblAdvanceDetails] ADD  CONSTRAINT [DF_tblAdvanceDetails_UpdatedTime]  DEFAULT (getdate()) FOR [UpdatedTime]
GO
ALTER TABLE [dbo].[tblBillDetails] ADD  CONSTRAINT [DF_tblBillDetails_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[tblBillDetails] ADD  CONSTRAINT [DF_tblBillDetails_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[tblBillDetails] ADD  CONSTRAINT [DF_tblBillDetails_AddedTime]  DEFAULT (getdate()) FOR [AddedTime]
GO
ALTER TABLE [dbo].[tblBillDetails] ADD  CONSTRAINT [DF_tblBillDetails_UpdatedTime]  DEFAULT (getdate()) FOR [UpdatedTime]
GO
ALTER TABLE [dbo].[tblBudgetMaster] ADD  CONSTRAINT [DF_tblBudgetMaster_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[tblBudgetMaster] ADD  CONSTRAINT [DF_tblBudgetMaster_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[tblBudgetMaster] ADD  CONSTRAINT [DF_tblBudgetMaster_AddedTime]  DEFAULT (getdate()) FOR [AddedTime]
GO
ALTER TABLE [dbo].[tblBudgetMaster] ADD  CONSTRAINT [DF_tblBudgetMaster_UpdatedTime]  DEFAULT (getdate()) FOR [UpdatedTime]
GO
ALTER TABLE [dbo].[tblCategoryMaster] ADD  CONSTRAINT [DF_tblCategoryMaster_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[tblCategoryMaster] ADD  CONSTRAINT [DF_tblCategoryMaster_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[tblCategoryMaster] ADD  CONSTRAINT [DF_tblCategoryMaster_AddedTime]  DEFAULT (getdate()) FOR [AddedTime]
GO
ALTER TABLE [dbo].[tblCategoryMaster] ADD  CONSTRAINT [DF_tblCategoryMaster_UpdatedTime]  DEFAULT (getdate()) FOR [UpdatedTime]
GO
ALTER TABLE [dbo].[tblCustomerMaster] ADD  CONSTRAINT [DF_tblCustomerMaster_CustomerType]  DEFAULT ((0)) FOR [CustomerType]
GO
ALTER TABLE [dbo].[tblCustomerMaster] ADD  CONSTRAINT [DF_tblCustomerMaster_Message]  DEFAULT ('') FOR [Messages]
GO
ALTER TABLE [dbo].[tblCustomerMaster] ADD  CONSTRAINT [DF_tblCustomerMaster_PinCode]  DEFAULT ('') FOR [PinCode]
GO
ALTER TABLE [dbo].[tblCustomerMaster] ADD  CONSTRAINT [DF_tblCustomerMaster_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[tblCustomerMaster] ADD  CONSTRAINT [DF_tblCustomerMaster_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[tblCustomerMaster] ADD  CONSTRAINT [DF_tblCustomerMaster_AddedTime]  DEFAULT (getdate()) FOR [AddedTime]
GO
ALTER TABLE [dbo].[tblCustomerMaster] ADD  CONSTRAINT [DF_tblCustomerMaster_UpdatedTime]  DEFAULT (getdate()) FOR [UpdatedTime]
GO
ALTER TABLE [dbo].[tblDistrictMaster] ADD  CONSTRAINT [DF_tblDistrictMaster_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[tblDistrictMaster] ADD  CONSTRAINT [DF_tblDistrictMaster_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[tblDistrictMaster] ADD  CONSTRAINT [DF_tblDistrictMaster_AddedTime]  DEFAULT (getdate()) FOR [AddedTime]
GO
ALTER TABLE [dbo].[tblDistrictMaster] ADD  CONSTRAINT [DF_tblDistrictMaster_UpdatedTime]  DEFAULT (getdate()) FOR [UpdatedTime]
GO
ALTER TABLE [dbo].[tblDocumentDetails] ADD  CONSTRAINT [DF_tblDocumentDetails_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[tblDocumentDetails] ADD  CONSTRAINT [DF_tblDocumentDetails_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[tblDocumentDetails] ADD  CONSTRAINT [DF_tblDocumentDetails_AddedTime]  DEFAULT (getdate()) FOR [AddedTime]
GO
ALTER TABLE [dbo].[tblDocumentDetails] ADD  CONSTRAINT [DF_tblDocumentDetails_UpdatedTime]  DEFAULT (getdate()) FOR [UpdatedTime]
GO
ALTER TABLE [dbo].[tblDocumentMaster] ADD  CONSTRAINT [DF_tblDocumentMaster_AcceptType]  DEFAULT ('') FOR [AcceptType]
GO
ALTER TABLE [dbo].[tblDocumentMaster] ADD  CONSTRAINT [DF_tblDocumentMaster_IsCheck]  DEFAULT ((0)) FOR [IsCheck]
GO
ALTER TABLE [dbo].[tblDocumentMaster] ADD  CONSTRAINT [DF_tblDocumentMaster_CheckValue]  DEFAULT ('') FOR [CheckValue]
GO
ALTER TABLE [dbo].[tblDocumentMaster] ADD  CONSTRAINT [DF_tblDocumentMaster_SampleDoc]  DEFAULT ('') FOR [SampleDoc]
GO
ALTER TABLE [dbo].[tblDocumentMaster] ADD  CONSTRAINT [DF_tblDocumentMaster_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[tblDocumentMaster] ADD  CONSTRAINT [DF_tblDocumentMaster_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[tblDocumentMaster] ADD  CONSTRAINT [DF_tblDocumentMaster_AddedTime]  DEFAULT (getdate()) FOR [AddedTime]
GO
ALTER TABLE [dbo].[tblDocumentMaster] ADD  CONSTRAINT [DF_tblDocumentMaster_UpdatedTime]  DEFAULT (getdate()) FOR [UpdatedTime]
GO
ALTER TABLE [dbo].[tblExpenseDetails] ADD  CONSTRAINT [DF_tblExpenseDetails_ExpenseName]  DEFAULT ('') FOR [ExpenseName]
GO
ALTER TABLE [dbo].[tblExpenseDetails] ADD  CONSTRAINT [DF_tblExpenseDetails_Remarks]  DEFAULT ('') FOR [Remarks]
GO
ALTER TABLE [dbo].[tblExpenseDetails] ADD  CONSTRAINT [DF_tblExpenseDetails_StaffId]  DEFAULT ((0)) FOR [StaffId]
GO
ALTER TABLE [dbo].[tblExpenseDetails] ADD  CONSTRAINT [DF_tblExpenseDetails_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[tblExpenseDetails] ADD  CONSTRAINT [DF_tblExpenseDetails_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[tblExpenseDetails] ADD  CONSTRAINT [DF_tblExpenseDetails_AddedTime]  DEFAULT (getdate()) FOR [AddedTime]
GO
ALTER TABLE [dbo].[tblExpenseDetails] ADD  CONSTRAINT [DF_tblExpenseDetails_UpdatedTime]  DEFAULT (getdate()) FOR [UpdatedTime]
GO
ALTER TABLE [dbo].[tblExpenseMaster] ADD  CONSTRAINT [DF_tblExpenseMaster_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[tblExpenseMaster] ADD  CONSTRAINT [DF_tblExpenseMaster_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[tblExpenseMaster] ADD  CONSTRAINT [DF_tblExpenseMaster_AddedTime]  DEFAULT (getdate()) FOR [AddedTime]
GO
ALTER TABLE [dbo].[tblExpenseMaster] ADD  CONSTRAINT [DF_tblExpenseMaster_UpdatedTime]  DEFAULT (getdate()) FOR [UpdatedTime]
GO
ALTER TABLE [dbo].[tblFollowUpDetails] ADD  CONSTRAINT [DF_tblFollowUpDetails_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[tblFollowUpDetails] ADD  CONSTRAINT [DF_tblFollowUpDetails_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[tblFollowUpDetails] ADD  CONSTRAINT [DF_tblFollowUpDetails_AddedTime]  DEFAULT (getdate()) FOR [AddedTime]
GO
ALTER TABLE [dbo].[tblFollowUpDetails] ADD  CONSTRAINT [DF_tblFollowUpDetails_UpdatedTime]  DEFAULT (getdate()) FOR [UpdatedTime]
GO
ALTER TABLE [dbo].[tblFollowUpStatus] ADD  CONSTRAINT [DF_tblFollowUpStatus_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[tblFollowUpStatus] ADD  CONSTRAINT [DF_tblFollowUpStatus_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[tblFollowUpStatus] ADD  CONSTRAINT [DF_tblFollowUpStatus_AddedTime]  DEFAULT (getdate()) FOR [AddedTime]
GO
ALTER TABLE [dbo].[tblFollowUpStatus] ADD  CONSTRAINT [DF_tblFollowUpStatus_UpdatedTime]  DEFAULT (getdate()) FOR [UpdatedTime]
GO
ALTER TABLE [dbo].[tblFuelMaster] ADD  CONSTRAINT [DF_tblFuelMaster_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[tblFuelMaster] ADD  CONSTRAINT [DF_tblFuelMaster_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[tblFuelMaster] ADD  CONSTRAINT [DF_tblFuelMaster_AddedTime]  DEFAULT (getdate()) FOR [AddedTime]
GO
ALTER TABLE [dbo].[tblFuelMaster] ADD  CONSTRAINT [DF_tblFuelMaster_UpdatedTime]  DEFAULT (getdate()) FOR [UpdatedTime]
GO
ALTER TABLE [dbo].[tblInsuranceInfo] ADD  CONSTRAINT [DF_tblInsuranceInfo_VehicleRegNo]  DEFAULT ('NA') FOR [VehicleRegNo]
GO
ALTER TABLE [dbo].[tblInsuranceInfo] ADD  CONSTRAINT [DF_tblInsuranceInfo_CustomerId]  DEFAULT ((0)) FOR [CustomerId]
GO
ALTER TABLE [dbo].[tblInsuranceInfo] ADD  CONSTRAINT [DF_tblInsuranceInfo_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[tblInsuranceInfo] ADD  CONSTRAINT [DF_tblInsuranceInfo_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[tblInsuranceInfo] ADD  CONSTRAINT [DF_tblInsuranceInfo_AddedTime]  DEFAULT (getdate()) FOR [AddedTime]
GO
ALTER TABLE [dbo].[tblInsuranceInfo] ADD  CONSTRAINT [DF_tblInsuranceInfo_UpdatedTime]  DEFAULT (getdate()) FOR [UpdatedTime]
GO
ALTER TABLE [dbo].[tblInsuranceMaster] ADD  CONSTRAINT [DF_tblInsuranceMaster_CustomerId]  DEFAULT ((0)) FOR [CustomerId]
GO
ALTER TABLE [dbo].[tblInsuranceMaster] ADD  CONSTRAINT [DF_tblInsuranceMaster_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[tblInsuranceMaster] ADD  CONSTRAINT [DF_tblInsuranceMaster_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[tblInsuranceMaster] ADD  CONSTRAINT [DF_tblInsuranceMaster_AddedTime]  DEFAULT (getdate()) FOR [AddedTime]
GO
ALTER TABLE [dbo].[tblInsuranceMaster] ADD  CONSTRAINT [DF_tblInsuranceMaster_UpdatedTime]  DEFAULT (getdate()) FOR [UpdatedTime]
GO
ALTER TABLE [dbo].[tblLoginActivity] ADD  CONSTRAINT [DF_tblLoginActivity_LoginDate]  DEFAULT (getdate()) FOR [LoginDate]
GO
ALTER TABLE [dbo].[tblLoginActivity] ADD  CONSTRAINT [DF_tblLoginActivity_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[tblLoginActivity] ADD  CONSTRAINT [DF_tblLoginActivity_AddedTime]  DEFAULT (getdate()) FOR [AddedTime]
GO
ALTER TABLE [dbo].[tblLoginActivity] ADD  CONSTRAINT [DF_tblLoginActivity_UpdatedTime]  DEFAULT (getdate()) FOR [UpdatedTime]
GO
ALTER TABLE [dbo].[tblMakeMaster] ADD  CONSTRAINT [DF_tblMakeMaster_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[tblMakeMaster] ADD  CONSTRAINT [DF_tblMakeMaster_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[tblMakeMaster] ADD  CONSTRAINT [DF_tblMakeMaster_AddedTime]  DEFAULT (getdate()) FOR [AddedTime]
GO
ALTER TABLE [dbo].[tblMakeMaster] ADD  CONSTRAINT [DF_tblMakeMaster_UpdatedTime]  DEFAULT (getdate()) FOR [UpdatedTime]
GO
ALTER TABLE [dbo].[tblMakeMasterExcel] ADD  CONSTRAINT [DF_tblMakeMasterExcel_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[tblMakeMasterExcel] ADD  CONSTRAINT [DF_tblMakeMasterExcel_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[tblMakeMasterExcel] ADD  CONSTRAINT [DF_tblMakeMasterExcel_AddedTime]  DEFAULT (getdate()) FOR [AddedTime]
GO
ALTER TABLE [dbo].[tblMakeMasterExcel] ADD  CONSTRAINT [DF_tblMakeMasterExcel_UpdatedTime]  DEFAULT (getdate()) FOR [UpdatedTime]
GO
ALTER TABLE [dbo].[tblModelMaster] ADD  CONSTRAINT [DF_tblModelMaster_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[tblModelMaster] ADD  CONSTRAINT [DF_tblModelMaster_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[tblModelMaster] ADD  CONSTRAINT [DF_tblModelMaster_AddedTime]  DEFAULT (getdate()) FOR [AddedTime]
GO
ALTER TABLE [dbo].[tblModelMaster] ADD  CONSTRAINT [DF_tblModelMaster_UpdatedTime]  DEFAULT (getdate()) FOR [UpdatedTime]
GO
ALTER TABLE [dbo].[tblModelMasterExcel] ADD  CONSTRAINT [DF_tblModelMasterExcel_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[tblModelMasterExcel] ADD  CONSTRAINT [DF_tblModelMasterExcel_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[tblModelMasterExcel] ADD  CONSTRAINT [DF_tblModelMasterExcel_AddedTime]  DEFAULT (getdate()) FOR [AddedTime]
GO
ALTER TABLE [dbo].[tblModelMasterExcel] ADD  CONSTRAINT [DF_tblModelMasterExcel_UpdatedTime]  DEFAULT (getdate()) FOR [UpdatedTime]
GO
ALTER TABLE [dbo].[tblPaymentInfo] ADD  CONSTRAINT [DF_tblPaymentInfo_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[tblPaymentInfo] ADD  CONSTRAINT [DF_tblPaymentInfo_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[tblPaymentInfo] ADD  CONSTRAINT [DF_tblPaymentInfo_AddedTime]  DEFAULT (getdate()) FOR [AddedTime]
GO
ALTER TABLE [dbo].[tblPaymentInfo] ADD  CONSTRAINT [DF_tblPaymentInfo_UpdatedTime]  DEFAULT (getdate()) FOR [UpdatedTime]
GO
ALTER TABLE [dbo].[tblPaymentMaster] ADD  CONSTRAINT [DF_tblPaymentMaster_PaymentDate]  DEFAULT (getdate()) FOR [PaymentDate]
GO
ALTER TABLE [dbo].[tblPaymentMaster] ADD  CONSTRAINT [DF_tblPaymentMaster_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[tblPaymentMaster] ADD  CONSTRAINT [DF_tblPaymentMaster_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[tblPaymentMaster] ADD  CONSTRAINT [DF_tblPaymentMaster_AddedTime]  DEFAULT (getdate()) FOR [AddedTime]
GO
ALTER TABLE [dbo].[tblPaymentMaster] ADD  CONSTRAINT [DF_tblPaymentMaster_UpdatedTime]  DEFAULT (getdate()) FOR [UpdatedTime]
GO
ALTER TABLE [dbo].[tblPostAds] ADD  CONSTRAINT [DF_tblPostAds_DisplayPrice]  DEFAULT ((0)) FOR [DisplayPrice]
GO
ALTER TABLE [dbo].[tblPostAds] ADD  CONSTRAINT [DF_tblPostAds_CustomerDescription]  DEFAULT ('') FOR [CustomerDescription]
GO
ALTER TABLE [dbo].[tblPostAds] ADD  CONSTRAINT [DF_tblPostAds_AdminDescription]  DEFAULT ('') FOR [AdminDescription]
GO
ALTER TABLE [dbo].[tblPostAds] ADD  CONSTRAINT [DF_tblPostAds_DisplayCustomerDescription]  DEFAULT ((1)) FOR [DisplayCustomerDescription]
GO
ALTER TABLE [dbo].[tblPostAds] ADD  CONSTRAINT [DF_tblPostAds_DisplayAdminDescription]  DEFAULT ((0)) FOR [DisplayAdminDescription]
GO
ALTER TABLE [dbo].[tblPostAds] ADD  CONSTRAINT [DF_tblPostAds_CustomerId]  DEFAULT ((0)) FOR [CustomerId]
GO
ALTER TABLE [dbo].[tblPostAds] ADD  CONSTRAINT [DF_tblPostAds_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[tblPostAds] ADD  CONSTRAINT [DF_tblPostAds_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[tblPostAds] ADD  CONSTRAINT [DF_tblPostAds_AddedTime]  DEFAULT (getdate()) FOR [AddedTime]
GO
ALTER TABLE [dbo].[tblPostAds] ADD  CONSTRAINT [DF_tblPostAds_UpdatedTime]  DEFAULT (getdate()) FOR [UpdatedTime]
GO
ALTER TABLE [dbo].[tblPostRequirement] ADD  CONSTRAINT [DF_tblPostRequirement_VehicleRegNo]  DEFAULT ('NA') FOR [VehicleRegNo]
GO
ALTER TABLE [dbo].[tblPostRequirement] ADD  CONSTRAINT [DF_tblPostRequirement_VehicleColour]  DEFAULT ('NA') FOR [VehicleColour]
GO
ALTER TABLE [dbo].[tblPostRequirement] ADD  CONSTRAINT [DF_tblPostRequirement_VehicleYear]  DEFAULT ((0)) FOR [VehicleYear]
GO
ALTER TABLE [dbo].[tblPostRequirement] ADD  CONSTRAINT [DF_tblPostRequirement_FuelType]  DEFAULT ((0)) FOR [FuelType]
GO
ALTER TABLE [dbo].[tblPostRequirement] ADD  CONSTRAINT [DF_tblPostRequirement_PaymentMode]  DEFAULT ('NA') FOR [PaymentMode]
GO
ALTER TABLE [dbo].[tblPostRequirement] ADD  CONSTRAINT [DF_tblPostRequirement_ExchangeDetails]  DEFAULT ('NA') FOR [ExchangeDetails]
GO
ALTER TABLE [dbo].[tblPostRequirement] ADD  CONSTRAINT [DF_tblPostRequirement_IsHotList]  DEFAULT ((0)) FOR [IsHotList]
GO
ALTER TABLE [dbo].[tblPostRequirement] ADD  CONSTRAINT [DF_tblPostRequirement_AttendedBy]  DEFAULT ('NA') FOR [AttendedBy]
GO
ALTER TABLE [dbo].[tblPostRequirement] ADD  CONSTRAINT [DF_tblPostRequirement_CustomerId]  DEFAULT ((0)) FOR [CustomerId]
GO
ALTER TABLE [dbo].[tblPostRequirement] ADD  CONSTRAINT [DF_tblPostRequirement_IsTestDrive]  DEFAULT ((0)) FOR [IsTestDrive]
GO
ALTER TABLE [dbo].[tblPostRequirement] ADD  CONSTRAINT [DF_tblPostRequirement_CustomerDescription]  DEFAULT ('') FOR [CustomerDescription]
GO
ALTER TABLE [dbo].[tblPostRequirement] ADD  CONSTRAINT [DF_tblPostRequirement_AdminDescription]  DEFAULT ('') FOR [AdminDescription]
GO
ALTER TABLE [dbo].[tblPostRequirement] ADD  CONSTRAINT [DF_tblPostRequirement_DisplayCustomerDescription]  DEFAULT ((1)) FOR [DisplayCustomerDescription]
GO
ALTER TABLE [dbo].[tblPostRequirement] ADD  CONSTRAINT [DF_tblPostRequirement_DisplayAdminDescription]  DEFAULT ((0)) FOR [DisplayAdminDescription]
GO
ALTER TABLE [dbo].[tblPostRequirement] ADD  CONSTRAINT [DF_tblPostRequirement_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[tblPostRequirement] ADD  CONSTRAINT [DF_tblPostRequirement_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[tblPostRequirement] ADD  CONSTRAINT [DF_tblPostRequirement_AddedTime]  DEFAULT (getdate()) FOR [AddedTime]
GO
ALTER TABLE [dbo].[tblPostRequirement] ADD  CONSTRAINT [DF_tblPostRequirement_UpdatedTime]  DEFAULT (getdate()) FOR [UpdatedTime]
GO
ALTER TABLE [dbo].[tblPurchaseInfo] ADD  CONSTRAINT [DF_tblPurchaseInfo_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[tblPurchaseInfo] ADD  CONSTRAINT [DF_tblPurchaseInfo_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[tblPurchaseInfo] ADD  CONSTRAINT [DF_tblPurchaseInfo_AddedTime]  DEFAULT (getdate()) FOR [AddedTime]
GO
ALTER TABLE [dbo].[tblPurchaseInfo] ADD  CONSTRAINT [DF_tblPurchaseInfo_UpdatedTime]  DEFAULT (getdate()) FOR [UpdatedTime]
GO
ALTER TABLE [dbo].[tblQuotationDetails] ADD  CONSTRAINT [DF_tblQuotationDetails_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[tblQuotationDetails] ADD  CONSTRAINT [DF_tblQuotationDetails_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[tblQuotationDetails] ADD  CONSTRAINT [DF_tblQuotationDetails_AddedTime]  DEFAULT (getdate()) FOR [AddedTime]
GO
ALTER TABLE [dbo].[tblQuotationDetails] ADD  CONSTRAINT [DF_tblQuotationDetails_UpdatedTime]  DEFAULT (getdate()) FOR [UpdatedTime]
GO
ALTER TABLE [dbo].[tblRoleMaster] ADD  CONSTRAINT [DF_tblRoleMaster_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[tblRoleMaster] ADD  CONSTRAINT [DF_tblRoleMaster_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[tblRoleMaster] ADD  CONSTRAINT [DF_tblRoleMaster_AddedTime]  DEFAULT (getdate()) FOR [AddedTime]
GO
ALTER TABLE [dbo].[tblRoleMaster] ADD  CONSTRAINT [DF_tblRoleMaster_UpdatedTime]  DEFAULT (getdate()) FOR [UpdatedTime]
GO
ALTER TABLE [dbo].[tblSourceMaster] ADD  CONSTRAINT [DF_tblSourceMaster_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[tblSourceMaster] ADD  CONSTRAINT [DF_tblSourceMaster_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[tblSourceMaster] ADD  CONSTRAINT [DF_tblSourceMaster_AddedTime]  DEFAULT (getdate()) FOR [AddedTime]
GO
ALTER TABLE [dbo].[tblSourceMaster] ADD  CONSTRAINT [DF_tblSourceMaster_UpdatedTime]  DEFAULT (getdate()) FOR [UpdatedTime]
GO
ALTER TABLE [dbo].[tblStaffMaster] ADD  CONSTRAINT [DF_tblStaffMaster_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[tblStaffMaster] ADD  CONSTRAINT [DF_tblStaffMaster_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[tblStaffMaster] ADD  CONSTRAINT [DF_tblStaffMaster_AddedTime]  DEFAULT (getdate()) FOR [AddedTime]
GO
ALTER TABLE [dbo].[tblStaffMaster] ADD  CONSTRAINT [DF_tblStaffMaster_UpdatedTime]  DEFAULT (getdate()) FOR [UpdatedTime]
GO
ALTER TABLE [dbo].[tblStateMaster] ADD  CONSTRAINT [DF_tblStateMaster_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[tblStateMaster] ADD  CONSTRAINT [DF_tblStateMaster_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[tblStateMaster] ADD  CONSTRAINT [DF_tblStateMaster_AddedTime]  DEFAULT (getdate()) FOR [AddedTime]
GO
ALTER TABLE [dbo].[tblStateMaster] ADD  CONSTRAINT [DF_tblStateMaster_UpdatedTime]  DEFAULT (getdate()) FOR [UpdatedTime]
GO
ALTER TABLE [dbo].[tblVersionMaster] ADD  CONSTRAINT [DF_tblVersionMaster_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[tblVersionMaster] ADD  CONSTRAINT [DF_tblVersionMaster_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[tblVersionMaster] ADD  CONSTRAINT [DF_tblVersionMaster_AddedTime]  DEFAULT (getdate()) FOR [AddedTime]
GO
ALTER TABLE [dbo].[tblVersionMaster] ADD  CONSTRAINT [DF_tblVersionMaster_UpdatedTime]  DEFAULT (getdate()) FOR [UpdatedTime]
GO
ALTER TABLE [dbo].[tblVersionMasterExcel] ADD  CONSTRAINT [DF_tblVersionMasterExcel_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[tblVersionMasterExcel] ADD  CONSTRAINT [DF_tblVersionMasterExcel_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[tblVersionMasterExcel] ADD  CONSTRAINT [DF_tblVersionMasterExcel_AddedTime]  DEFAULT (getdate()) FOR [AddedTime]
GO
ALTER TABLE [dbo].[tblVersionMasterExcel] ADD  CONSTRAINT [DF_tblVersionMasterExcel_UpdatedTime]  DEFAULT (getdate()) FOR [UpdatedTime]
GO
ALTER TABLE [dbo].[tblCustomerMaster]  WITH CHECK ADD  CONSTRAINT [FK_tblCustomerMaster_tblCategoryMaster] FOREIGN KEY([CatId])
REFERENCES [dbo].[tblCategoryMaster] ([CatId])
GO
ALTER TABLE [dbo].[tblCustomerMaster] CHECK CONSTRAINT [FK_tblCustomerMaster_tblCategoryMaster]
GO
ALTER TABLE [dbo].[tblCustomerMaster]  WITH CHECK ADD  CONSTRAINT [FK_tblCustomerMaster_tblSourceMaster] FOREIGN KEY([SourceId])
REFERENCES [dbo].[tblSourceMaster] ([SourceId])
GO
ALTER TABLE [dbo].[tblCustomerMaster] CHECK CONSTRAINT [FK_tblCustomerMaster_tblSourceMaster]
GO
ALTER TABLE [dbo].[tblDistrictMaster]  WITH CHECK ADD  CONSTRAINT [FK_tblDistrictMaster_tblStateMaster] FOREIGN KEY([StateId])
REFERENCES [dbo].[tblStateMaster] ([StateId])
GO
ALTER TABLE [dbo].[tblDistrictMaster] CHECK CONSTRAINT [FK_tblDistrictMaster_tblStateMaster]
GO
ALTER TABLE [dbo].[tblModelMaster]  WITH NOCHECK ADD  CONSTRAINT [FK_tblModelMaster_tblMakeMaster] FOREIGN KEY([MakeId])
REFERENCES [dbo].[tblMakeMaster] ([MakeId])
GO
ALTER TABLE [dbo].[tblModelMaster] CHECK CONSTRAINT [FK_tblModelMaster_tblMakeMaster]
GO
ALTER TABLE [dbo].[tblModelMasterExcel]  WITH NOCHECK ADD  CONSTRAINT [FK_tblModelMasterExcel_tblMakeMaster] FOREIGN KEY([MakeId])
REFERENCES [dbo].[tblMakeMaster] ([MakeId])
GO
ALTER TABLE [dbo].[tblModelMasterExcel] CHECK CONSTRAINT [FK_tblModelMasterExcel_tblMakeMaster]
GO
ALTER TABLE [dbo].[tblPurchaseInfo]  WITH CHECK ADD  CONSTRAINT [FK_tblPurchaseInfo_tblPostAds] FOREIGN KEY([AdId])
REFERENCES [dbo].[tblPostAds] ([AdId])
GO
ALTER TABLE [dbo].[tblPurchaseInfo] CHECK CONSTRAINT [FK_tblPurchaseInfo_tblPostAds]
GO
ALTER TABLE [dbo].[tblVersionMaster]  WITH NOCHECK ADD  CONSTRAINT [FK_tblVersionMaster_tblModelMaster] FOREIGN KEY([ModelId])
REFERENCES [dbo].[tblModelMaster] ([ModelId])
GO
ALTER TABLE [dbo].[tblVersionMaster] CHECK CONSTRAINT [FK_tblVersionMaster_tblModelMaster]
GO
ALTER TABLE [dbo].[tblVersionMasterExcel]  WITH NOCHECK ADD  CONSTRAINT [FK_tblVersionMasterExcel_tblModelMaster] FOREIGN KEY([ModelId])
REFERENCES [dbo].[tblModelMaster] ([ModelId])
GO
ALTER TABLE [dbo].[tblVersionMasterExcel] CHECK CONSTRAINT [FK_tblVersionMasterExcel_tblModelMaster]
GO
/****** Object:  StoredProcedure [dbo].[usp_Add_AdCarImages]    Script Date: 5/16/2022 11:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Thulasi
-- Create date: 4/9/2021
-- Description:	To List the District Master
-- =============================================
CREATE PROCEDURE [dbo].[usp_Add_AdCarImages]
@AdId	bigint,
@CarImage	varchar(500),
@IsMainDisplay	bit,
@IsDisplay	bit,
@AddedBy varchar(50),
@Result bigint output    

AS
BEGIN

declare @IsNewMainDisplay bit
declare @AdCarImgIdCnt bit
 set @AdCarImgIdCnt = (select COUNT(AdCarImgId) from tblAdCarImages where IsMainDisplay=1  and AdId=@AdId AND IsDeleted=0)  
 if @AdCarImgIdCnt=0
 begin
set  @IsMainDisplay=1
 end

	INSERT INTO tblAdCarImages(AdId,CarImage,IsMainDisplay,IsDisplay,IsDeleted,IsActive,AddedBy,UpdatedBy,AddedTime,UpdatedTime) VALUES(@AdId,@CarImage,@IsMainDisplay,@IsDisplay,0,1,@AddedBy,@AddedBy,GETDATE(),GETDATE())
    set @Result = 1
END

GO
/****** Object:  StoredProcedure [dbo].[usp_Add_AdCarOwnerDetails]    Script Date: 5/16/2022 11:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Thulasi
-- Create date: 4/9/2021
-- Description:	To List the District Master
-- =============================================
CREATE PROCEDURE [dbo].[usp_Add_AdCarOwnerDetails]
@AdId	bigint,
@OwnerName	varchar(255),
@EmailId	varchar(150),
@ContactNo	varchar(50),
@OwnerAddress	varchar(500),
@StateId	bigint,
@DistrictId	bigint,
@AddedBy varchar(50),
@Result bigint output    

AS
BEGIN
	INSERT INTO tblAdCarOwnerDetails(AdId,OwnerName,EmailId,ContactNo,OwnerAddress,StateId,DistrictId,IsDeleted,IsActive,AddedBy,UpdatedBy,AddedTime,UpdatedTime) VALUES(@AdId,@OwnerName,@EmailId,@ContactNo,@OwnerAddress,@StateId,@DistrictId,0,1,@AddedBy,@AddedBy,GETDATE(),GETDATE())
    set @Result = 1
END

GO
/****** Object:  StoredProcedure [dbo].[usp_Add_AdCarVideos]    Script Date: 5/16/2022 11:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Thulasi
-- Create date: 7/13/2021
-- Description:	To List the Ad Car Videos
-- =============================================
CREATE PROCEDURE [dbo].[usp_Add_AdCarVideos]
@AdId	bigint,
@CarVideoPath	varchar(max),
@Is360View	bit,
@AddedBy varchar(50),
@Result bigint output    

AS
BEGIN
	INSERT INTO tblAdCarVideos(AdId,CarVideoPath,Is360View,IsDeleted,IsActive,AddedBy,UpdatedBy,AddedTime,UpdatedTime) VALUES(@AdId,@CarVideoPath,@Is360View,0,1,@AddedBy,@AddedBy,GETDATE(),GETDATE())
    set @Result = 1
END

GO
/****** Object:  StoredProcedure [dbo].[usp_Add_AdvanceDetails]    Script Date: 5/16/2022 11:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		Thulasi
-- Create date: 5/21/2021
-- Description:	To Add the Advance Details
-- =============================================
CREATE PROCEDURE [dbo].[usp_Add_AdvanceDetails]
@AdId bigint,
@CustomerId bigint,
@AdvDate	date,
@ReferenceNo	varchar(255),
@AdvAmount	decimal(18, 2),
@FixedPrice	decimal(18, 2),
@ReceivedAmount	decimal(18, 2),
@BalanceAmount	decimal(18, 2),
@Remarks varchar(500),
@AddedBy varchar(50),
@Result bigint output    

AS
BEGIN
	INSERT INTO tblAdvanceDetails(AdId,CustomerId,AdvDate,ReferenceNo,AdvAmount,FixedPrice,ReceivedAmount,BalanceAmount,Remarks,IsDeleted,IsActive,AddedBy,UpdatedBy,AddedTime,UpdatedTime) VALUES(@AdId,@CustomerId,@AdvDate,@ReferenceNo,@AdvAmount,@FixedPrice,@ReceivedAmount,@BalanceAmount,@Remarks,0,1,@AddedBy,@AddedBy,GETDATE(),GETDATE())
    set @Result = 1
END

GO
/****** Object:  StoredProcedure [dbo].[usp_Add_BillDetails]    Script Date: 5/16/2022 11:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		Thulasi
-- Create date: 5/19/2021
-- Description:	To Add the Bill Details
-- =============================================
CREATE PROCEDURE [dbo].[usp_Add_BillDetails]
@AdId bigint,
@CustomerId bigint,
@BillDate date,
@ReferenceNo varchar(255),
@BillAmount decimal(18, 2),
@CommissionOnly decimal(18, 2),
@Remarks varchar(500),
@StaffId bigint,
@AddedBy varchar(50),
@Result bigint output    

AS
BEGIN
	IF NOT EXISTS(SELECT * FROM  View_BillDetails WHERE AdId=@AdId and Convert(date,BillDate)=Convert(date,@BillDate) AND IsDeleted=0 AND IsActive=1)
	BEGIN
	INSERT INTO tblBillDetails(AdId,CustomerId,BillDate,ReferenceNo,BillAmount,CommissionOnly,Remarks,StaffId,IsDeleted,IsActive,AddedBy,UpdatedBy,AddedTime,UpdatedTime) VALUES(@AdId,@CustomerId,@BillDate,@ReferenceNo,@BillAmount,@CommissionOnly,@Remarks,@StaffId,0,1,@AddedBy,@AddedBy,GETDATE(),GETDATE())
    UPDATE tblPostAds SET VehicleStatus=4,RejectedReason='SOLD OUT' WHERE AdId=@AdId AND IsDeleted=0 AND IsActive=1
	set @Result = 1

	END
	ELSE
	BEGIN
	   set @Result = 0 
	END
END

GO
/****** Object:  StoredProcedure [dbo].[usp_Add_BudgetMaster]    Script Date: 5/16/2022 11:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Dhruv
-- Create date: 4/15/2021
-- Description:	To Add the FollowUp Status
-- =============================================
CREATE PROCEDURE [dbo].[usp_Add_BudgetMaster]
@DisplayValue	 varchar(255),
@MinValue decimal(18,2),
@MaxValue decimal(18,2),
@AddedBy varchar(50),
@Result bigint output    

AS
BEGIN
	IF NOT EXISTS(SELECT * FROM  View_BudgetMaster WHERE DisplayValue=@DisplayValue AND IsDeleted=0 AND IsActive=1)
	BEGIN

	declare @BudgetSequence bigint

	 Set @BudgetSequence = Isnull((Select Max(BudgetSequence)+1 from View_BudgetMaster where IsDeleted=0 and IsActive=1),1)

	INSERT INTO tblBudgetMaster(MinValue,MaxValue,DisplayValue,BudgetSequence,IsDeleted,IsActive,AddedBy,UpdatedBy,AddedTime,UpdatedTime) VALUES(@MinValue,@MaxValue,@DisplayValue,@BudgetSequence,0,1,@AddedBy,@AddedBy,GETDATE(),GETDATE())
    set @Result = 1 
	END
	ELSE
	BEGIN
	   set @Result = 0 
	END
END

GO
/****** Object:  StoredProcedure [dbo].[usp_Add_CategoryMaster]    Script Date: 5/16/2022 11:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Dhruv
-- Create date: 4/15/2021
-- Description:	To Add the Category Master
-- =============================================
CREATE PROCEDURE [dbo].[usp_Add_CategoryMaster]
@CategoryName	 varchar(255),
@AddedBy varchar(50),
@Result bigint output    

AS
BEGIN
	IF NOT EXISTS(SELECT * FROM  View_CategoryMaster WHERE CategoryName=@CategoryName AND IsDeleted=0 AND IsActive=1)
	BEGIN

	declare @CategorySequence bigint

	 Set @CategorySequence = Isnull((Select Max(CategorySequence)+1 from View_CategoryMaster where IsDeleted=0 and IsActive=1),1)

	INSERT INTO tblCategoryMaster(CategoryName,CategorySequence,IsDeleted,IsActive,AddedBy,UpdatedBy,AddedTime,UpdatedTime) VALUES(@CategoryName,@CategorySequence,0,1,@AddedBy,@AddedBy,GETDATE(),GETDATE())
    set @Result = 1 
	END
	ELSE
	BEGIN
	   set @Result = 0 
	END
END

GO
/****** Object:  StoredProcedure [dbo].[usp_Add_CustomerMaster]    Script Date: 5/16/2022 11:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Thulasi
-- Create date: 4/15/2021
-- Description:	To Add the Customer Master
-- =============================================
CREATE PROCEDURE [dbo].[usp_Add_CustomerMaster]
@CustomerName	 varchar(255),
@MobileNo varchar(50),
@EmailId varchar(255),
@CustomerAddress varchar(500),
@CatId bigint,
@SourceId bigint,
@StaffId bigint,
@JoinDate date,
@CustomerPhoto varchar(500),
@IsDisturb bit,
@CustomerType bigint,
@PinCode varchar(50),
@AddedBy varchar(50),
@Result bigint output    

AS
BEGIN
	IF NOT EXISTS(SELECT * FROM  View_CustomerMaster WHERE MobileNo=@MobileNo AND IsDeleted=0 AND IsActive=1)
	BEGIN
	INSERT INTO tblCustomerMaster(CustomerName,MobileNo,EmailId,CustomerAddress,CatId,SourceId,StaffId,JoinDate,CustomerPhoto,IsDisturb,CustomerType,PinCode,IsDeleted,IsActive,AddedBy,UpdatedBy,AddedTime,UpdatedTime) VALUES(@CustomerName,@MobileNo,@EmailId,@CustomerAddress,@CatId,@SourceId,@StaffId,@JoinDate,@CustomerPhoto,@IsDisturb,@CustomerType,@PinCode,0,1,@AddedBy,@AddedBy,GETDATE(),GETDATE())
   -- set @Result = 1 
   set @Result = SCOPE_IDENTITY()   
	END
	ELSE
	BEGIN
	   set @Result = 0 
	END
END

GO
/****** Object:  StoredProcedure [dbo].[usp_Add_DealerInsuranceInfo]    Script Date: 5/16/2022 11:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


  
-- =============================================  
-- Author:  Thulasi  
-- Create date: 4/26/2021  
-- Description: To Add the Insurance Info  
-- =============================================  
CREATE PROCEDURE [dbo].[usp_Add_DealerInsuranceInfo]  
@AdId bigint,  
@ClaimValue varchar(255),  
@IDV decimal(18, 2),  
@ExpDate date,  
@AddlNotes varchar(500),  
@VehicleRegNo varchar(255),
@AddedBy varchar(50),  
@Result bigint output ,
@UserName varchar(255),  
  @ContactNo varchar(50),  
  @EmailId varchar(255),  
  @UserAddress varchar(500),
  @PinCode varchar(50)
AS  
BEGIN  


declare @CustomerId bigint=0  
 IF NOT EXISTS(SELECT * FROM  View_CustomerMaster WHERE MobileNo=@ContactNo AND IsDeleted=0 AND IsActive=1)    
 BEGIN    
 /*Get CategoryId*/  
 declare @CatId bigint  
 set @CatId = (select CatId from tblCategoryMaster where CategoryName='Insurance' AND IsDeleted=0)  
 /*Get SourceId*/  
 declare @SourceId bigint  
 set @SourceId = (select SourceId from tblSourceMaster where SourceName='Others' AND IsDeleted=0)  
 INSERT INTO tblCustomerMaster(CustomerName,MobileNo,EmailId,CustomerAddress,CatId,SourceId,StaffId,JoinDate,CustomerPhoto,IsDisturb,PinCode,IsDeleted,IsActive,AddedBy,UpdatedBy,AddedTime,UpdatedTime) VALUES  
 (@UserName,@ContactNo,@EmailId,@UserAddress,@CatId,@SourceId,0,GETDATE(),'NA',0,@PinCode,0,1,@AddedBy,@AddedBy,GETDATE(),GETDATE())    
 /*SAVE TO CUSTOMER AND GET NEW CUSTOMERID*/  
    set @CustomerId = SCOPE_IDENTITY()   
 END    
 ELSE    
 BEGIN    
 /*GET EXISTING CUSTOMERID*/  
    set @CustomerId = (select CustomerId FROM  View_CustomerMaster WHERE MobileNo=@ContactNo AND IsDeleted=0 AND IsActive=1)   
 END    

 INSERT INTO tblInsuranceInfo(AdId,ClaimValue,IDV,ExpDate,AddlNotes,VehicleRegNo,CustomerId,IsDeleted,IsActive,AddedBy,UpdatedBy,AddedTime,UpdatedTime) VALUES(@AdId,@ClaimValue,@IDV,@ExpDate,@AddlNotes,@VehicleRegNo,@CustomerId,0,1,@AddedBy,@AddedBy,GETDATE(),GETDATE())  
    set @Result = 1  
END  

GO
/****** Object:  StoredProcedure [dbo].[usp_Add_DocumentDetails]    Script Date: 5/16/2022 11:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Dhruv
-- Create date: 5/20/2021
-- Description:	To Add the Document Details
-- =============================================
CREATE PROCEDURE [dbo].[usp_Add_DocumentDetails]
@DocumentId	bigint,
@AdId	bigint,
@DocumentPath	varchar(MAX),
@IsRCBook	bit,
@IsNameTransfer	bit,
@AddedBy varchar(50),
@Result bigint output    

AS
BEGIN

	INSERT INTO tblDocumentDetails(DocumentId,AdId,DocumentPath,IsRCBook,IsNameTransfer,IsDeleted,IsActive,AddedBy,UpdatedBy,AddedTime,UpdatedTime) VALUES(@DocumentId,@AdId,@DocumentPath,@IsRCBook,@IsNameTransfer,0,1,@AddedBy,@AddedBy,GETDATE(),GETDATE())
    set @Result = 1 
END

GO
/****** Object:  StoredProcedure [dbo].[usp_Add_DocumentMaster]    Script Date: 5/16/2022 11:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Dhruv
-- Create date: 5/20/2021
-- Description:	To Add the Document Master
-- =============================================
CREATE PROCEDURE [dbo].[usp_Add_DocumentMaster]
@DocumentName	 varchar(255),
@AcceptType	varchar(225),
@IsCheck	bit,
@CheckValue	varchar(225),
@SampleDoc	 varchar(500),
@AddedBy varchar(50),
@Result bigint output    

AS
BEGIN
	IF NOT EXISTS(SELECT * FROM  View_DocumentMaster WHERE DocumentName=@DocumentName AND IsDeleted=0 AND IsActive=1)
	BEGIN

	declare @DocumentSequence bigint

	 Set @DocumentSequence = Isnull((Select Max(DocumentName)+1 from View_DocumentMaster where IsDeleted=0 and IsActive=1),1)

	INSERT INTO tblDocumentMaster(DocumentName,DocumentSequence,AcceptType,IsCheck,CheckValue,SampleDoc,IsDeleted,IsActive,AddedBy,UpdatedBy,AddedTime,UpdatedTime) VALUES(@DocumentName,@DocumentSequence,@AcceptType,@IsCheck,@CheckValue,@SampleDoc,0,1,@AddedBy,@AddedBy,GETDATE(),GETDATE())
    set @Result = 1 
	END
	ELSE
	BEGIN
	   set @Result = 0 
	END
END

GO
/****** Object:  StoredProcedure [dbo].[usp_Add_ExpenseDetails]    Script Date: 5/16/2022 11:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Thulasi
-- Create date: 4/28/2021
-- Description:	To Add the Expense Details
-- =============================================
CREATE PROCEDURE [dbo].[usp_Add_ExpenseDetails]
@AdId bigint,
@CustomerId bigint,
@ExpDate date,
@VehicleRegNo varchar(255),
@ExpId bigint,
@ExpAmount decimal(18, 2),
@ExpenseName varchar(500),
@Remarks varchar(max),
@StaffId bigint,
@AddedBy varchar(50),
@Result bigint output    

AS
BEGIN
	INSERT INTO tblExpenseDetails(AdId,CustomerId,ExpDate,VehicleRegNo,ExpId,ExpAmount,ExpenseName,Remarks,StaffId,IsDeleted,IsActive,AddedBy,UpdatedBy,AddedTime,UpdatedTime) VALUES(@AdId,@CustomerId,@ExpDate,@VehicleRegNo,@ExpId,@ExpAmount,@ExpenseName,@Remarks,@StaffId,0,1,@AddedBy,@AddedBy,GETDATE(),GETDATE())
    set @Result = 1
END

GO
/****** Object:  StoredProcedure [dbo].[usp_Add_ExpenseMaster]    Script Date: 5/16/2022 11:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Dhruv
-- Create date: 4/15/2021
-- Description:	To Add the Expense Master
-- =============================================
CREATE PROCEDURE [dbo].[usp_Add_ExpenseMaster]
@ExpName	 varchar(255),
@AddedBy varchar(50),
@Result bigint output    

AS
BEGIN
	IF NOT EXISTS(SELECT * FROM  View_ExpenseMaster WHERE ExpName=@ExpName AND IsDeleted=0 AND IsActive=1)
	BEGIN

	declare @ExpSequenceNo bigint

	 Set @ExpSequenceNo = Isnull((Select Max(ExpSequenceNo)+1 from View_ExpenseMaster where IsDeleted=0 and IsActive=1),1)

	INSERT INTO tblExpenseMaster(ExpName,ExpSequenceNo,IsDeleted,IsActive,AddedBy,UpdatedBy,AddedTime,UpdatedTime) VALUES(@ExpName,@ExpSequenceNo,0,1,@AddedBy,@AddedBy,GETDATE(),GETDATE())
    set @Result = 1 
	END
	ELSE
	BEGIN
	   set @Result = 0 
	END
END

GO
/****** Object:  StoredProcedure [dbo].[usp_Add_FollowUpDetails]    Script Date: 5/16/2022 11:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		Thulasi
-- Create date: 4/28/2021
-- Description:	To Add the FollowUp Details
-- =============================================
CREATE PROCEDURE [dbo].[usp_Add_FollowUpDetails]
@CustomerId bigint,
@FollowStatusId	bigint,
@FollowTypeId	bigint,
@FollowDate	datetime,
@FollowDescription	varchar(500),
@FollowCallBack	datetime,
@AddedBy varchar(50),
@Result bigint output    

AS
BEGIN
	INSERT INTO tblFollowUpDetails(CustomerId,FollowStatusId,FollowTypeId,FollowDate,FollowDescription,FollowCallBack,IsDeleted,IsActive,AddedBy,UpdatedBy,AddedTime,UpdatedTime) VALUES(@CustomerId,@FollowStatusId,@FollowTypeId,@FollowDate,@FollowDescription,@FollowCallBack,0,1,@AddedBy,@AddedBy,GETDATE(),GETDATE())
    set @Result = 1 
END

GO
/****** Object:  StoredProcedure [dbo].[usp_Add_FollowUpStatus]    Script Date: 5/16/2022 11:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Dhruv
-- Create date: 4/15/2021
-- Description:	To Add the FollowUp Status
-- =============================================
CREATE PROCEDURE [dbo].[usp_Add_FollowUpStatus]
@FollowStatus	 varchar(255),
@AddedBy varchar(50),
@Result bigint output    

AS
BEGIN
	IF NOT EXISTS(SELECT * FROM  View_FollowUpStatus WHERE FollowStatus=@FollowStatus AND IsDeleted=0 AND IsActive=1)
	BEGIN

	declare @FollowSequence bigint

	 Set @FollowSequence = Isnull((Select Max(FollowSequence)+1 from View_FollowUpStatus where IsDeleted=0 and IsActive=1),1)

	INSERT INTO tblFollowUpStatus(FollowStatus,FollowSequence,IsDeleted,IsActive,AddedBy,UpdatedBy,AddedTime,UpdatedTime) VALUES(@FollowStatus,@FollowSequence,0,1,@AddedBy,@AddedBy,GETDATE(),GETDATE())
    set @Result = 1 
	END
	ELSE
	BEGIN
	   set @Result = 0 
	END
END

GO
/****** Object:  StoredProcedure [dbo].[usp_Add_FuelMaster]    Script Date: 5/16/2022 11:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Dhruv
-- Create date: 4/15/2021
-- Description:	To Add the Fuel Master
-- =============================================
CREATE PROCEDURE [dbo].[usp_Add_FuelMaster]
@FuelName	 varchar(255),
@AddedBy varchar(50),
@Result bigint output    

AS
BEGIN
	IF NOT EXISTS(SELECT * FROM  View_FuelMaster WHERE FuelName=@FuelName AND IsDeleted=0 AND IsActive=1)
	BEGIN

	declare @FuelSequence bigint

	 Set @FuelSequence = Isnull((Select Max(FuelSequence)+1 from View_FuelMaster where IsDeleted=0 and IsActive=1),1)

	INSERT INTO tblFuelMaster(FuelName,FuelSequence,IsDeleted,IsActive,AddedBy,UpdatedBy,AddedTime,UpdatedTime) VALUES(@FuelName,@FuelSequence,0,1,@AddedBy,@AddedBy,GETDATE(),GETDATE())
    set @Result = 1 
	END
	ELSE
	BEGIN
	   set @Result = 0 
	END
END

GO
/****** Object:  StoredProcedure [dbo].[usp_Add_InsuranceInfo]    Script Date: 5/16/2022 11:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Thulasi
-- Create date: 4/26/2021
-- Description:	To Add the Insurance Info
-- =============================================
CREATE PROCEDURE [dbo].[usp_Add_InsuranceInfo]
@AdId	bigint,
@ClaimValue	varchar(255),
@IDV	decimal(18, 2),
@ExpDate	date,
@AddlNotes	varchar(500),
@VehicleRegNo varchar(255),
@CustomerId bigint,
@AddedBy varchar(50),
@Result bigint output    

AS
BEGIN
	INSERT INTO tblInsuranceInfo(AdId,ClaimValue,IDV,ExpDate,AddlNotes,VehicleRegNo,CustomerId,IsDeleted,IsActive,AddedBy,UpdatedBy,AddedTime,UpdatedTime)
	VALUES(@AdId,@ClaimValue,@IDV,@ExpDate,@AddlNotes,@VehicleRegNo,@CustomerId,0,1,@AddedBy,@AddedBy,GETDATE(),GETDATE())
    set @Result = 1
END

GO
/****** Object:  StoredProcedure [dbo].[usp_Add_InsuranceMaster]    Script Date: 5/16/2022 11:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Thulasi
-- Create date: 4/20/2021
-- Description:	To Add the Insurance Master
-- =============================================
CREATE PROCEDURE [dbo].[usp_Add_InsuranceMaster]
@ContactName	varchar(255),
@EmailId	varchar(255),
@ContactNo	varchar(50),
@MakeId	bigint,
@ModelId	bigint,
@VersionId	bigint,
@IsInsActive	bit,
@AddlInfo	varchar(500),
@AddedBy varchar(50),
@Result bigint output    

AS
BEGIN
	IF NOT EXISTS(SELECT * FROM  View_InsuranceMaster WHERE ContactNo=@ContactNo AND IsDeleted=0 AND IsActive=1)
	BEGIN
	INSERT INTO tblInsuranceMaster(ContactName,EmailId,ContactNo,MakeId,ModelId,VersionId,IsInsActive,AddlInfo,IsDeleted,IsActive,AddedBy,UpdatedBy,AddedTime,UpdatedTime) VALUES(@ContactName,@EmailId,@ContactNo,@MakeId,@ModelId,@VersionId,@IsInsActive,@AddlInfo,0,1,@AddedBy,@AddedBy,GETDATE(),GETDATE())
    set @Result = 1 
	END
	ELSE
	BEGIN
	   set @Result = 0 
	END
END

GO
/****** Object:  StoredProcedure [dbo].[usp_Add_Login_Activity]    Script Date: 5/16/2022 11:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE procedure [dbo].[usp_Add_Login_Activity]

@LoginId varchar(255),
@LoginName varchar(255),
@IpAddress varchar(100),
@LoginBrowser varchar(255),
@LoginDevice varchar(100)

as begin

insert into tblLoginActivity values(@LoginId,@LoginName,getdate(),@IpAddress,@LoginBrowser,@LoginDevice,0,GETDATE(),GETDATE())
	
end

GO
/****** Object:  StoredProcedure [dbo].[usp_Add_MakeMaster]    Script Date: 5/16/2022 11:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Dhruv
-- Create date: 4/15/2021
-- Description:	To Add the Make Master
-- =============================================
CREATE PROCEDURE [dbo].[usp_Add_MakeMaster]
@MakeName	 varchar(255),
@AddedBy varchar(50),
@Result bigint output    

AS
BEGIN
	IF NOT EXISTS(SELECT * FROM  View_MakeMaster WHERE MakeName=@MakeName AND IsDeleted=0 AND IsActive=1)
	BEGIN

	declare @MakeSequence bigint

	 Set @MakeSequence = Isnull((Select Max(MakeSequence)+1 from View_MakeMaster where IsDeleted=0 and IsActive=1),1)

	INSERT INTO tblMakeMaster(MakeName,MakeSequence,IsDeleted,IsActive,AddedBy,UpdatedBy,AddedTime,UpdatedTime) VALUES(@MakeName,@MakeSequence,0,1,@AddedBy,@AddedBy,GETDATE(),GETDATE())
    --set @Result = 1 
	set @Result = SCOPE_IDENTITY()
	END
	ELSE
	--BEGIN
	--   set @Result = 0 
	--END

	BEGIN
	declare @MakeId bigint

	 Set @MakeId = Isnull((Select MakeId from View_MakeMaster where MakeName=@MakeName AND IsDeleted=0 AND IsActive=1),0)
	   set @Result = @MakeId 
	END
END

GO
/****** Object:  StoredProcedure [dbo].[usp_Add_ModelMaster]    Script Date: 5/16/2022 11:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Dhruv
-- Create date: 4/15/2021
-- Description:	To Add the Model Master
-- =============================================
CREATE PROCEDURE [dbo].[usp_Add_ModelMaster]
@MakeId bigint,
@ModelName	 varchar(255),
@AddedBy varchar(50),
@Result bigint output    

AS
BEGIN
	IF NOT EXISTS(SELECT * FROM  View_ModelMaster WHERE ModelName=@ModelName AND IsDeleted=0 AND IsActive=1)
	BEGIN

	declare @ModelSequence bigint

	 Set @ModelSequence = Isnull((Select Max(ModelSequence)+1 from View_ModelMaster where MakeId=@MakeId and IsDeleted=0 and IsActive=1),1)

	INSERT INTO tblModelMaster(MakeId,ModelName,ModelSequence,IsDeleted,IsActive,AddedBy,UpdatedBy,AddedTime,UpdatedTime) VALUES(@MakeId,@ModelName,@ModelSequence,0,1,@AddedBy,@AddedBy,GETDATE(),GETDATE())
    --set @Result = 1 
	 set @Result = SCOPE_IDENTITY()
	END
	ELSE
	--BEGIN
	--   set @Result = 0 
	--END
	BEGIN
	declare @ModelId bigint

	 Set @ModelId = Isnull((Select ModelId from View_ModelMaster where ModelName=@ModelName AND MakeId=@MakeId AND IsDeleted=0 AND IsActive=1),0)
	   set @Result = @ModelId 
	END
END

GO
/****** Object:  StoredProcedure [dbo].[usp_Add_PaymentInfo]    Script Date: 5/16/2022 11:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Thulasi
-- Create date: 6/27/2021
-- Description:	To Add the Payment Info
-- =============================================
CREATE PROCEDURE [dbo].[usp_Add_PaymentInfo]
@AdId	bigint,
@PayDate	datetime,
@BankName	varchar(500),
@PayMode	bigint,
@PayAmount	decimal(18, 2),
@AddedBy varchar(50),
@Result bigint output    

AS
BEGIN
	INSERT INTO tblPaymentInfo(AdId,PayDate,BankName,PayMode,PayAmount,IsDeleted,IsActive,AddedBy,UpdatedBy,AddedTime,UpdatedTime) VALUES(@AdId,@PayDate,@BankName,@PayMode,@PayAmount,0,1,@AddedBy,@AddedBy,GETDATE(),GETDATE())
    set @Result = 1
END

GO
/****** Object:  StoredProcedure [dbo].[usp_Add_PaymentMaster]    Script Date: 5/16/2022 11:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





-- =============================================
-- Author:		Thulasi
-- Create date: 5/21/2021
-- Description:	To Add the Advance Details
-- =============================================
CREATE PROCEDURE [dbo].[usp_Add_PaymentMaster]
@AdId	bigint,
@CustomerId	bigint,
@BankName	varchar(500),
@IFSCCode	varchar(255),
@PaymentMode	bigint,
@PurchaseAmount	decimal(18, 2),
@PaidAmount	decimal(18, 2),
@ChequeNo varchar(255),
@ChequeDate datetime,
@PaymentDate datetime,
@AddedBy varchar(50),
@Result bigint output    

AS
BEGIN
	INSERT INTO tblPaymentMaster(AdId,CustomerId,BankName,IFSCCode,PaymentMode,PurchaseAmount,PaidAmount,ChequeNo,ChequeDate,PaymentDate,IsDeleted,IsActive,AddedBy,UpdatedBy,AddedTime,UpdatedTime) VALUES(@AdId,@CustomerId,@BankName,@IFSCCode,@PaymentMode,@PurchaseAmount,@PaidAmount,@ChequeNo,@ChequeDate,@PaymentDate,0,1,@AddedBy,@AddedBy,GETDATE(),GETDATE())
    set @Result = 1
END

GO
/****** Object:  StoredProcedure [dbo].[usp_Add_PostAds]    Script Date: 5/16/2022 11:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================  
-- Author:  Thulasi  
-- Create date: 4/9/2021  
-- Description: To Create Ads
-- =============================================  
CREATE PROCEDURE [dbo].[usp_Add_PostAds]  
@MakeId bigint,  
@ModelId bigint,  
@VersionId bigint,  
@VehicleRegNo varchar(255),  
@VehicleColour varchar(150),  
@VehiclePrice decimal(18, 2),  
@NoOfOwners bigint,  
@VehicleYear bigint,  
@FuelType bigint,  
@KmsRun decimal(18, 2),  
@Tax varchar(255),  
@Insurance varchar(255),  
@CarDescription varchar(MAX),  
@UserType bigint,  
@UserId bigint,  
@VehicleStatus bigint,  
@RejectedReason varchar(500),  
@RegDate date,  
@EngineNo varchar(255),  
@ChassisNo varchar(255),  
@DisplayPrice	bit,
@CustomerDescription	varchar(MAX)	,
@AdminDescription	varchar(MAX)	,
@DisplayCustomerDescription	bit,
@DisplayAdminDescription	bit,
@CustomerId bigint,
@AddedBy varchar(50),  
@Result bigint output      
  
AS  
BEGIN  
if @VehicleRegNo!=''
begin
if not exists(select adid from tblPostAds where VehicleRegNo=@VehicleRegNo and IsDeleted=0)
begin
 INSERT INTO tblPostAds(MakeId,ModelId,VersionId,VehicleRegNo,VehicleColour,VehiclePrice,NoOfOwners,VehicleYear,FuelType,KmsRun,Tax,Insurance,CarDescription,UserType,UserId,VehicleStatus,RejectedReason,RegDate,EngineNo,ChassisNo,IsDeleted,IsActive,AddedBy
,UpdatedBy,AddedTime,UpdatedTime,DisplayPrice,CustomerDescription,AdminDescription,DisplayCustomerDescription,DisplayAdminDescription,CustomerId) VALUES(@MakeId,@ModelId,@VersionId,@VehicleRegNo,@VehicleColour,@VehiclePrice,@NoOfOwners,@VehicleYear,@FuelType,@KmsRun,@Tax,@Insurance,@CarDescription,@UserType,@UserId,@VehicleStatus,@RejectedReason,@RegDate,@EngineNo,
@ChassisNo,0,1,@AddedBy,@AddedBy,GETDATE(),GETDATE(),@DisplayPrice,@CustomerDescription,@AdminDescription,@DisplayCustomerDescription,@DisplayAdminDescription,@CustomerId)  
    set @Result = SCOPE_IDENTITY()     
END  
else
begin
set @Result=0
end
end
else
begin
INSERT INTO tblPostAds(MakeId,ModelId,VersionId,VehicleRegNo,VehicleColour,VehiclePrice,NoOfOwners,VehicleYear,FuelType,KmsRun,Tax,Insurance,CarDescription,UserType,UserId,VehicleStatus,RejectedReason,RegDate,EngineNo,ChassisNo,IsDeleted,IsActive,AddedBy
,UpdatedBy,AddedTime,UpdatedTime,DisplayPrice,CustomerDescription,AdminDescription,DisplayCustomerDescription,DisplayAdminDescription,CustomerId) VALUES(@MakeId,@ModelId,@VersionId,@VehicleRegNo,@VehicleColour,@VehiclePrice,@NoOfOwners,@VehicleYear,@FuelType,@KmsRun,@Tax,@Insurance,@CarDescription,@UserType,@UserId,@VehicleStatus,@RejectedReason,@RegDate,@EngineNo,
@ChassisNo,0,1,@AddedBy,@AddedBy,GETDATE(),GETDATE(),@DisplayPrice,@CustomerDescription,@AdminDescription,@DisplayCustomerDescription,@DisplayAdminDescription,@CustomerId)  
--INSERT INTO tblPostAds(MakeId,ModelId,VersionId,VehicleRegNo,VehicleColour,VehiclePrice,NoOfOwners,VehicleYear,FuelType,KmsRun,Tax,Insurance,CarDescription,UserType,UserId,VehicleStatus,RejectedReason,RegDate,EngineNo,ChassisNo,IsDeleted,IsActive,AddedBy
--,UpdatedBy,AddedTime,UpdatedTime) VALUES(@MakeId,@ModelId,@VersionId,@VehicleRegNo,@VehicleColour,@VehiclePrice,@NoOfOwners,@VehicleYear,@FuelType,@KmsRun,@Tax,@Insurance,@CarDescription,@UserType,@UserId,@VehicleStatus,@RejectedReason,@RegDate,@EngineNo,
--@ChassisNo,0,1,@AddedBy,@AddedBy,GETDATE(),GETDATE())  
    set @Result = SCOPE_IDENTITY()    
end
end

GO
/****** Object:  StoredProcedure [dbo].[usp_Add_PostRequirement]    Script Date: 5/16/2022 11:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================    
-- Author:  Thulasi    
-- Create date: 4/12/2021    
-- Description: To Add the Post Requirement    
-- =============================================    
CREATE PROCEDURE [dbo].[usp_Add_PostRequirement]    
@AdId bigint,    
@MakeId bigint,    
@ModelId bigint,    
@VersionId bigint,    
@Amount decimal(18,2),    
@PostInfo varchar(500),    
@VehicleRegNo varchar(500),    
@VehicleColour varchar(500),    
@VehicleYear BIGINT,  
@FuelType BIGINT,  
@PaymentMode varchar(500),    
@ExchangeDetails varchar(500),    
@IsHotList BIT,  
@IsTestDrive bit,  
@AttendedBy varchar(500),    
@UserName varchar(255),    
@EmailId varchar(50),    
@ContactNo varchar(50),    
@UserAddress varchar(500),  
@PinCode varchar(50),      
@PostStatus bigint,    
@UserType bigint,    
@CustomerDescription	varchar(MAX)	,
@AdminDescription	varchar(MAX)	,
@DisplayCustomerDescription	bit,
@DisplayAdminDescription	bit,
@AddedBy varchar(50),    
@Result bigint output        
    
AS    
BEGIN    
  if @FuelType=0  
begin  
set @FuelType=5  
end  
declare @CustomerId bigint=0  
 IF NOT EXISTS(SELECT * FROM  View_CustomerMaster WHERE MobileNo=@ContactNo AND IsDeleted=0 AND IsActive=1)    
 BEGIN    
 /*Get CategoryId*/  
 declare @CatId bigint  
 set @CatId = (select CatId from tblCategoryMaster where CategoryName='Dealers' AND IsDeleted=0)  
 /*Get SourceId*/  
 declare @SourceId bigint  
 set @SourceId = (select SourceId from tblSourceMaster where SourceName='Others' AND IsDeleted=0)  
 if @IsTestDrive=0
 begin
		 INSERT INTO tblCustomerMaster(CustomerName,MobileNo,EmailId,CustomerAddress,CatId,SourceId,StaffId,JoinDate,CustomerPhoto,IsDisturb,CustomerType,PinCode,IsDeleted,IsActive,AddedBy,UpdatedBy,AddedTime,UpdatedTime) VALUES  
		 (@UserName,@ContactNo,@EmailId,@UserAddress,@CatId,@SourceId,0,GETDATE(),'NA',0,3,@PinCode,0,1,@AddedBy,@AddedBy,GETDATE(),GETDATE())    
		 /*SAVE TO CUSTOMER AND GET NEW CUSTOMERID*/  
			set @CustomerId = SCOPE_IDENTITY()   
 end
 else
 begin
		 INSERT INTO tblCustomerMaster(CustomerName,MobileNo,EmailId,CustomerAddress,CatId,SourceId,StaffId,JoinDate,CustomerPhoto,IsDisturb,CustomerType,PinCode,IsDeleted,IsActive,AddedBy,UpdatedBy,AddedTime,UpdatedTime,Messages) VALUES  
		 (@UserName,@ContactNo,@EmailId,'',@CatId,@SourceId,0,GETDATE(),'NA',0,3,@PinCode,0,1,@AddedBy,@AddedBy,GETDATE(),GETDATE(),@UserAddress)   
		 /*SAVE TO CUSTOMER AND GET NEW CUSTOMERID*/  
			set @CustomerId = SCOPE_IDENTITY()   
 end
 
 
 
 END    
 ELSE    
 BEGIN    
 /*GET EXISTING CUSTOMERID*/  
    set @CustomerId = (select CustomerId FROM  View_CustomerMaster WHERE MobileNo=@ContactNo AND IsDeleted=0 AND IsActive=1)   
 END    
  
 if @CustomerId!=0  
 begin  
 IF NOT EXISTS(SELECT * FROM tblPostRequirement WHERE CustomerId=@CustomerId AND VehicleRegNo=@VehicleRegNo AND IsDeleted=0)
 BEGIN

 if @AdId!=0
 begin
 if not exists(SELECT * FROM tblPostRequirement WHERE CustomerId=@CustomerId AND AdId=@AdId AND IsDeleted=0)
		 begin
		 -- if adid does not exists make entry
		 INSERT INTO tblPostRequirement(AdId,MakeId,ModelId,VersionId,Amount,PostInfo,VehicleRegNo,VehicleColour,VehicleYear,FuelType,PaymentMode,ExchangeDetails,  
		IsHotList,AttendedBy,CustomerId,UserName,EmailId,ContactNo,UserAddress,PostStatus,  
		UserType,IsTestDrive,IsDeleted,IsActive,AddedBy,UpdatedBy,AddedTime,UpdatedTime,CustomerDescription,AdminDescription,DisplayCustomerDescription,DisplayAdminDescription) VALUES  
		 (@AdId,@MakeId,@ModelId,@VersionId,@Amount,@PostInfo, @VehicleRegNo,@VehicleColour,@VehicleYear,@FuelType,@PaymentMode,@ExchangeDetails,  
		@IsHotList,@AttendedBy,@CustomerId, @UserName,@EmailId,@ContactNo,@UserAddress,@PostStatus,@UserType,@IsTestDrive,0,1,@AddedBy,@AddedBy,GETDATE(),GETDATE(),@CustomerDescription,@AdminDescription,@DisplayCustomerDescription,@DisplayAdminDescription)    
			set @Result = 1 
		 end
 else
 begin
 -- adid exists for same customer already
			 declare @adAmount decimal = isnull((select VehiclePrice from tblPostAds where AdId=@AdId),0)
			 declare @adVehicleRegNo varchar(255)= isnull((select VehicleRegNo from tblPostAds where AdId=@AdId),'0')
			 declare @adFuelType bigint = isnull((select FuelType from tblPostAds where AdId=@AdId),0)
			 declare @adVehicleColour varchar(255)= isnull((select VehicleColour from tblPostAds where AdId=@AdId),'0')
			 declare @adVehicleYear bigint = isnull((select VehicleYear from tblPostAds where AdId=@AdId),0)

		 if @IsTestDrive=1
		 begin
		 --dont update testdrive if booked already
		 update tblPostRequirement set Amount=@adAmount,PostInfo=@PostInfo,VehicleRegNo=@adVehicleRegNo,VehicleColour=@adVehicleColour,VehicleYear=@adVehicleYear,
		 FuelType=@adFuelType,UpdatedTime=GETDATE(),UpdatedBy=@AddedBy where CustomerId=@CustomerId AND AdId=@AdId AND IsDeleted=0
		  set @Result = 2
		 end
		 else
			 begin
			 --Book Test Drive
			 update tblPostRequirement set istestdrive=@IsTestDrive,Amount=@adAmount,PostInfo=@PostInfo,VehicleRegNo=@adVehicleRegNo,VehicleColour=@adVehicleColour,
			 VehicleYear=@adVehicleYear,
			 FuelType=@adFuelType,UpdatedTime=GETDATE(),UpdatedBy=@AddedBy where CustomerId=@CustomerId AND AdId=@AdId AND IsDeleted=0
			  set @Result = 2
			 end
 
		 end
 end
 else
 begin
		 INSERT INTO tblPostRequirement(AdId,MakeId,ModelId,VersionId,Amount,PostInfo,VehicleRegNo,VehicleColour,VehicleYear,FuelType,PaymentMode,ExchangeDetails,  
		IsHotList,AttendedBy,CustomerId,UserName,EmailId,ContactNo,UserAddress,PostStatus,  
		UserType,IsTestDrive,IsDeleted,IsActive,AddedBy,UpdatedBy,AddedTime,UpdatedTime,CustomerDescription,AdminDescription,DisplayCustomerDescription,DisplayAdminDescription) VALUES  
		 (@AdId,@MakeId,@ModelId,@VersionId,@Amount,@PostInfo, @VehicleRegNo,@VehicleColour,@VehicleYear,@FuelType,@PaymentMode,@ExchangeDetails,  
		@IsHotList,@AttendedBy,@CustomerId, @UserName,@EmailId,@ContactNo,@UserAddress,@PostStatus,@UserType,@IsTestDrive,0,1,@AddedBy,@AddedBy,GETDATE(),GETDATE(),@CustomerDescription,@AdminDescription,@DisplayCustomerDescription,@DisplayAdminDescription)    
			set @Result = 1 
	end  
	END
	ELSE
	BEGIN
	if @IsTestDrive=1
		begin
		update tblPostRequirement set IsTestDrive=@IsTestDrive,UpdatedTime=GETDATE(),UpdatedBy=@AddedBy where CustomerId=@CustomerId and VehicleRegNo=@VehicleRegNo AND IsDeleted=0
		set @Result=2
		end
	else
		begin
		set @Result = 10 -- REQUIREMENT EXISTS ALREADY
		end
	END
 end  
 else  
 begin  
 set @Result =0 --Requirement Not Added Customer Id =0  
 end  
  
END 

GO
/****** Object:  StoredProcedure [dbo].[usp_Add_PostRequirement_Dealer]    Script Date: 5/16/2022 11:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================  
-- Author:  Thulasi  
-- Create date: 4/12/2021  
-- Description: To Add the Post Requirement  
-- =============================================  
CREATE PROCEDURE [dbo].[usp_Add_PostRequirement_Dealer]  
@AdId bigint,  
@MakeId bigint,  
@ModelId bigint,  
@VersionId bigint,  
@Amount decimal(18,2),  
@PostInfo varchar(500),  
@VehicleRegNo varchar(500),  
@VehicleColour varchar(500),  
@VehicleYear BIGINT,
@FuelType BIGINT,
@PaymentMode varchar(500),  
@ExchangeDetails varchar(500),  
@IsHotList BIT,
@IsTestDrive bit,
@AttendedBy varchar(500),  
@CustomerId bigint,
@PostStatus bigint,  
@UserType bigint,  
@CustomerDescription	varchar(MAX)	,
@AdminDescription	varchar(MAX)	,
@DisplayCustomerDescription	bit,
@DisplayAdminDescription	bit,
@AddedBy varchar(50),  
@Result bigint output      
  
AS  
BEGIN  
if @FuelType=0  
begin  
set @FuelType=5  
end  

IF @AdId!=0
BEGIN
if not exists(SELECT * FROM tblPostRequirement WHERE CustomerId=@CustomerId AND AdId=@AdId AND IsDeleted=0)
begin
		 INSERT INTO tblPostRequirement(AdId,MakeId,ModelId,VersionId,Amount,PostInfo,VehicleRegNo,VehicleColour,VehicleYear,FuelType,PaymentMode,ExchangeDetails,
		IsHotList,AttendedBy,CustomerId,UserName,EmailId,ContactNo,UserAddress,PostStatus,
		UserType,IsTestDrive,IsDeleted,IsActive,AddedBy,UpdatedBy,AddedTime,UpdatedTime,CustomerDescription,AdminDescription,DisplayCustomerDescription,DisplayAdminDescription) VALUES
		 (@AdId,@MakeId,@ModelId,@VersionId,@Amount,@PostInfo, @VehicleRegNo,@VehicleColour,@VehicleYear,@FuelType,@PaymentMode,@ExchangeDetails,
		@IsHotList,@AttendedBy,@CustomerId, '','','','',@PostStatus,@UserType,@IsTestDrive,0,1,@AddedBy,@AddedBy,GETDATE(),GETDATE(),@CustomerDescription,@AdminDescription,@DisplayCustomerDescription,@DisplayAdminDescription)  
			set @Result = 1  
	end
	else
	begin
		 declare @adAmount decimal = isnull((select VehiclePrice from tblPostAds where AdId=@AdId),0)
		 declare @adVehicleRegNo varchar(255)= isnull((select VehicleRegNo from tblPostAds where AdId=@AdId),'0')
		 declare @adFuelType bigint = isnull((select FuelType from tblPostAds where AdId=@AdId),0)
		 declare @adVehicleColour varchar(255)= isnull((select VehicleColour from tblPostAds where AdId=@AdId),'0')
		 declare @adVehicleYear bigint = isnull((select VehicleYear from tblPostAds where AdId=@AdId),0)
	
 begin
 --dont update testdrive if booked already
	 update tblPostRequirement set Amount=@adAmount,PostInfo=@PostInfo,VehicleRegNo=@adVehicleRegNo,VehicleColour=@adVehicleColour,VehicleYear=@adVehicleYear,
	 FuelType=@adFuelType,UpdatedTime=GETDATE(),UpdatedBy=@AddedBy where CustomerId=@CustomerId AND AdId=@AdId AND IsDeleted=0
	  set @Result = 2
 end
 
	end
	END
	ELSE
	BEGIN
	INSERT INTO tblPostRequirement(AdId,MakeId,ModelId,VersionId,Amount,PostInfo,VehicleRegNo,VehicleColour,VehicleYear,FuelType,PaymentMode,ExchangeDetails,
		IsHotList,AttendedBy,CustomerId,UserName,EmailId,ContactNo,UserAddress,PostStatus,
		UserType,IsTestDrive,IsDeleted,IsActive,AddedBy,UpdatedBy,AddedTime,UpdatedTime,CustomerDescription,AdminDescription,DisplayCustomerDescription,DisplayAdminDescription) VALUES
		 (@AdId,@MakeId,@ModelId,@VersionId,@Amount,@PostInfo, @VehicleRegNo,@VehicleColour,@VehicleYear,@FuelType,@PaymentMode,@ExchangeDetails,
		@IsHotList,@AttendedBy,@CustomerId, '','','','',@PostStatus,@UserType,@IsTestDrive,0,1,@AddedBy,@AddedBy,GETDATE(),GETDATE(),@CustomerDescription,@AdminDescription,@DisplayCustomerDescription,@DisplayAdminDescription)  
			set @Result = 1  
	END
END  


GO
/****** Object:  StoredProcedure [dbo].[usp_Add_PostRequirement_Dealer_1dec2021_old]    Script Date: 5/16/2022 11:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================  
-- Author:  Thulasi  
-- Create date: 4/12/2021  
-- Description: To Add the Post Requirement  
-- =============================================  
CREATE PROCEDURE [dbo].[usp_Add_PostRequirement_Dealer_1dec2021_old]  
@AdId bigint,  
@MakeId bigint,  
@ModelId bigint,  
@VersionId bigint,  
@Amount decimal(18,2),  
@PostInfo varchar(500),  
@VehicleRegNo varchar(500),  
@VehicleColour varchar(500),  
@VehicleYear BIGINT,
@FuelType BIGINT,
@PaymentMode varchar(500),  
@ExchangeDetails varchar(500),  
@IsHotList BIT,
@IsTestDrive bit,
@AttendedBy varchar(500),  
@CustomerId bigint,
@PostStatus bigint,  
@UserType bigint,  
@CustomerDescription	varchar(MAX)	,
@AdminDescription	varchar(MAX)	,
@DisplayCustomerDescription	bit,
@DisplayAdminDescription	bit,
@AddedBy varchar(50),  
@Result bigint output      
  
AS  
BEGIN  
if @FuelType=0  
begin  
set @FuelType=5  
end  
 INSERT INTO tblPostRequirement(AdId,MakeId,ModelId,VersionId,Amount,PostInfo,VehicleRegNo,VehicleColour,VehicleYear,FuelType,PaymentMode,ExchangeDetails,
IsHotList,AttendedBy,CustomerId,UserName,EmailId,ContactNo,UserAddress,PostStatus,
UserType,IsTestDrive,IsDeleted,IsActive,AddedBy,UpdatedBy,AddedTime,UpdatedTime,CustomerDescription,AdminDescription,DisplayCustomerDescription,DisplayAdminDescription) VALUES
 (@AdId,@MakeId,@ModelId,@VersionId,@Amount,@PostInfo, @VehicleRegNo,@VehicleColour,@VehicleYear,@FuelType,@PaymentMode,@ExchangeDetails,
@IsHotList,@AttendedBy,@CustomerId, '','','','',@PostStatus,@UserType,@IsTestDrive,0,1,@AddedBy,@AddedBy,GETDATE(),GETDATE(),@CustomerDescription,@AdminDescription,@DisplayCustomerDescription,@DisplayAdminDescription)  
    set @Result = 1  
	

END  


GO
/****** Object:  StoredProcedure [dbo].[usp_Add_PostRequirement_test]    Script Date: 5/16/2022 11:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================    
-- Author:  Thulasi    
-- Create date: 4/12/2021    
-- Description: To Add the Post Requirement    
-- =============================================    
create PROCEDURE [dbo].[usp_Add_PostRequirement_test]    
@AdId bigint,    
@MakeId bigint,    
@ModelId bigint,    
@VersionId bigint,    
@Amount decimal(18,2),    
@PostInfo varchar(500),    
@VehicleRegNo varchar(500),    
@VehicleColour varchar(500),    
@VehicleYear BIGINT,  
@FuelType BIGINT,  
@PaymentMode varchar(500),    
@ExchangeDetails varchar(500),    
@IsHotList BIT,  
@IsTestDrive bit,  
@AttendedBy varchar(500),    
@UserName varchar(255),    
@EmailId varchar(50),    
@ContactNo varchar(50),    
@UserAddress varchar(500),    
@PostStatus bigint,    
@UserType bigint,    
@CustomerDescription	varchar(MAX)	,
@AdminDescription	varchar(MAX)	,
@DisplayCustomerDescription	bit,
@DisplayAdminDescription	bit,
@AddedBy varchar(50),    
@Result bigint output        
    
AS    
BEGIN    
  if @FuelType=0  
begin  
set @FuelType=5  
end  
declare @CustomerId bigint=0  
 IF NOT EXISTS(SELECT * FROM  View_CustomerMaster WHERE MobileNo=@ContactNo AND IsDeleted=0 AND IsActive=1)    
 BEGIN    
 /*Get CategoryId*/  
 declare @CatId bigint  
 set @CatId = (select CatId from tblCategoryMaster where CategoryName='Dealers' AND IsDeleted=0)  
 /*Get SourceId*/  
 declare @SourceId bigint  
 set @SourceId = (select SourceId from tblSourceMaster where SourceName='Others' AND IsDeleted=0)  
 if @IsTestDrive=0
 begin
 INSERT INTO tblCustomerMaster(CustomerName,MobileNo,EmailId,CustomerAddress,CatId,SourceId,StaffId,JoinDate,CustomerPhoto,IsDisturb,CustomerType,IsDeleted,IsActive,AddedBy,UpdatedBy,AddedTime,UpdatedTime) VALUES  
 (@UserName,@ContactNo,@EmailId,@UserAddress,@CatId,@SourceId,0,GETDATE(),'NA',0,3,0,1,@AddedBy,@AddedBy,GETDATE(),GETDATE())    
 /*SAVE TO CUSTOMER AND GET NEW CUSTOMERID*/  
    set @CustomerId = SCOPE_IDENTITY()   
 end
 else
 begin
 INSERT INTO tblCustomerMaster(CustomerName,MobileNo,EmailId,CustomerAddress,CatId,SourceId,StaffId,JoinDate,CustomerPhoto,IsDisturb,CustomerType,IsDeleted,IsActive,AddedBy,UpdatedBy,AddedTime,UpdatedTime,Messages) VALUES  
 (@UserName,@ContactNo,@EmailId,'',@CatId,@SourceId,0,GETDATE(),'NA',0,3,0,1,@AddedBy,@AddedBy,GETDATE(),GETDATE(),@UserAddress)   
 /*SAVE TO CUSTOMER AND GET NEW CUSTOMERID*/  
    set @CustomerId = SCOPE_IDENTITY()   
 end
 
 
 
 END    
 ELSE    
 BEGIN    
 /*GET EXISTING CUSTOMERID*/  
    set @CustomerId = (select CustomerId FROM  View_CustomerMaster WHERE MobileNo=@ContactNo AND IsDeleted=0 AND IsActive=1)   
 END    
  
 if @CustomerId!=0  
 begin  
 IF NOT EXISTS(SELECT * FROM tblPostRequirement WHERE CustomerId=@CustomerId AND VehicleRegNo=@VehicleRegNo AND IsDeleted=0)
 BEGIN

 if @AdId!=0
 begin
 if not exists(SELECT * FROM tblPostRequirement WHERE CustomerId=@CustomerId AND AdId=@AdId AND IsDeleted=0)
 begin
 -- if adid does not exists make entry
 INSERT INTO tblPostRequirement(AdId,MakeId,ModelId,VersionId,Amount,PostInfo,VehicleRegNo,VehicleColour,VehicleYear,FuelType,PaymentMode,ExchangeDetails,  
IsHotList,AttendedBy,CustomerId,UserName,EmailId,ContactNo,UserAddress,PostStatus,  
UserType,IsTestDrive,IsDeleted,IsActive,AddedBy,UpdatedBy,AddedTime,UpdatedTime,CustomerDescription,AdminDescription,DisplayCustomerDescription,DisplayAdminDescription) VALUES  
 (@AdId,@MakeId,@ModelId,@VersionId,@Amount,@PostInfo, @VehicleRegNo,@VehicleColour,@VehicleYear,@FuelType,@PaymentMode,@ExchangeDetails,  
@IsHotList,@AttendedBy,@CustomerId, @UserName,@EmailId,@ContactNo,@UserAddress,@PostStatus,@UserType,@IsTestDrive,0,1,@AddedBy,@AddedBy,GETDATE(),GETDATE(),@CustomerDescription,@AdminDescription,@DisplayCustomerDescription,@DisplayAdminDescription)    
    set @Result = 1 
 end
 else
 begin
 -- adid exists for same customer already
 declare @adAmount decimal = isnull((select VehiclePrice from tblPostAds where AdId=@AdId),0)
 declare @adVehicleRegNo varchar(255)= isnull((select VehicleRegNo from tblPostAds where AdId=@AdId),'0')
 declare @adFuelType bigint = isnull((select FuelType from tblPostAds where AdId=@AdId),0)
 declare @adVehicleColour varchar(255)= isnull((select VehicleColour from tblPostAds where AdId=@AdId),'0')
 declare @adVehicleYear bigint = isnull((select VehicleYear from tblPostAds where AdId=@AdId),0)
 if @IsTestDrive=1
 begin
 --dont update testdrive if booked already
 update tblPostRequirement set Amount=@adAmount,PostInfo=@PostInfo,VehicleRegNo=@adVehicleRegNo,VehicleColour=@adVehicleColour,VehicleYear=@adVehicleYear,
 FuelType=@adFuelType,UpdatedTime=GETDATE(),UpdatedBy=@AddedBy where CustomerId=@CustomerId AND AdId=@AdId AND IsDeleted=0
  set @Result = 2
 end
 else
 begin
 --Book Test Drive
 update tblPostRequirement set istestdrive=@IsTestDrive,Amount=@adAmount,PostInfo=@PostInfo,VehicleRegNo=@adVehicleRegNo,VehicleColour=@adVehicleColour,
 VehicleYear=@adVehicleYear,
 FuelType=@adFuelType,UpdatedTime=GETDATE(),UpdatedBy=@AddedBy where CustomerId=@CustomerId AND AdId=@AdId AND IsDeleted=0
  set @Result = 2
 end
 
 end
 end
 else
 begin
 INSERT INTO tblPostRequirement(AdId,MakeId,ModelId,VersionId,Amount,PostInfo,VehicleRegNo,VehicleColour,VehicleYear,FuelType,PaymentMode,ExchangeDetails,  
IsHotList,AttendedBy,CustomerId,UserName,EmailId,ContactNo,UserAddress,PostStatus,  
UserType,IsTestDrive,IsDeleted,IsActive,AddedBy,UpdatedBy,AddedTime,UpdatedTime,CustomerDescription,AdminDescription,DisplayCustomerDescription,DisplayAdminDescription) VALUES  
 (@AdId,@MakeId,@ModelId,@VersionId,@Amount,@PostInfo, @VehicleRegNo,@VehicleColour,@VehicleYear,@FuelType,@PaymentMode,@ExchangeDetails,  
@IsHotList,@AttendedBy,@CustomerId, @UserName,@EmailId,@ContactNo,@UserAddress,@PostStatus,@UserType,@IsTestDrive,0,1,@AddedBy,@AddedBy,GETDATE(),GETDATE(),@CustomerDescription,@AdminDescription,@DisplayCustomerDescription,@DisplayAdminDescription)    
    set @Result = 1 
	end  
	END
	ELSE
	BEGIN
	set @Result = 10 -- REQUIREMENT EXISTS ALREADY
	END
 end  
 else  
 begin  
 set @Result =0 --Requirement Not Added Customer Id =0  
 end  
  
END 

GO
/****** Object:  StoredProcedure [dbo].[usp_Add_PurchaseInfo]    Script Date: 5/16/2022 11:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Thulasi
-- Create date: 4/26/2021
-- Description:	To Add the Purchase Info
-- =============================================
CREATE PROCEDURE [dbo].[usp_Add_PurchaseInfo]
@AdId	bigint,
@PurchaseDate	date,
@BrokerName	varchar(255),
@ContactNo	varchar(50),
@ContactAddress	varchar(500),
@PurchaseAmount	decimal(18, 2),
@Commission	decimal(18, 2),
@TotalAmount	decimal(18, 2),
@AddedBy varchar(50),
@Result bigint output    

AS
BEGIN
	INSERT INTO tblPurchaseInfo(AdId,PurchaseDate,BrokerName,ContactNo,ContactAddress,PurchaseAmount,Commission,TotalAmount,IsDeleted,IsActive,AddedBy,UpdatedBy,AddedTime,UpdatedTime) VALUES(@AdId,@PurchaseDate,@BrokerName,@ContactNo,@ContactAddress,@PurchaseAmount,@Commission,@TotalAmount,0,1,@AddedBy,@AddedBy,GETDATE(),GETDATE())
    set @Result = 1
END

GO
/****** Object:  StoredProcedure [dbo].[usp_Add_QuotationDetails]    Script Date: 5/16/2022 11:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		Thulasi
-- Create date: 5/21/2021
-- Description:	To Add the Advance Details
-- =============================================
CREATE PROCEDURE [dbo].[usp_Add_QuotationDetails]
@AdId bigint,
@CustomerId bigint,
@PurchaseDate	date,
@ReferenceNo	varchar(255),
@QuoteAmount	decimal(18, 2),
@Remarks varchar(500),
@AddedBy varchar(50),
@Result bigint output    

AS
BEGIN
	INSERT INTO tblQuotationDetails(AdId,CustomerId,PurchaseDate,ReferenceNo,QuoteAmount,Remarks,IsDeleted,IsActive,AddedBy,UpdatedBy,AddedTime,UpdatedTime) VALUES(@AdId,@CustomerId,@PurchaseDate,@ReferenceNo,@QuoteAmount,@Remarks,0,1,@AddedBy,@AddedBy,GETDATE(),GETDATE())
    set @Result = 1
END

GO
/****** Object:  StoredProcedure [dbo].[usp_Add_SourceMaster]    Script Date: 5/16/2022 11:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Dhruv
-- Create date: 4/15/2021
-- Description:	To Add the Source Master
-- =============================================
CREATE PROCEDURE [dbo].[usp_Add_SourceMaster]
@SourceName	 varchar(255),
@AddedBy varchar(50),
@Result bigint output    

AS
BEGIN
	IF NOT EXISTS(SELECT * FROM  View_SourceMaster WHERE SourceName=@SourceName AND IsDeleted=0 AND IsActive=1)
	BEGIN

	declare @SourceSequence bigint

	 Set @SourceSequence = Isnull((Select Max(SourceSequence)+1 from View_SourceMaster where IsDeleted=0 and IsActive=1),1)

	INSERT INTO tblSourceMaster(SourceName,SourceSequence,IsDeleted,IsActive,AddedBy,UpdatedBy,AddedTime,UpdatedTime) VALUES(@SourceName,@SourceSequence,0,1,@AddedBy,@AddedBy,GETDATE(),GETDATE())
    set @Result = 1 
	END
	ELSE
	BEGIN
	   set @Result = 0 
	END
END

GO
/****** Object:  StoredProcedure [dbo].[usp_Add_StaffMaster]    Script Date: 5/16/2022 11:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		Thulasi
-- Create date: 4/15/2021
-- Description:	To Add the Staff Master
-- =============================================
CREATE PROCEDURE [dbo].[usp_Add_StaffMaster]
@StaffName	varchar(255),
@LoginId	varchar(255),
@LoginPassword	varchar(255),
@FatherName	varchar(255),
@PatnerName	varchar(255),
@ContactNo	varchar(50),
@ContactAddress	varchar(500),
@EmailId	varchar(255),
@DOB date,
@DOJ	date,
@StaffPic	varchar(500),
@Gender	bit,
@Married	bit,
@RoleId	bigint,
@AddedBy varchar(50),
@Result bigint output    

AS
BEGIN
	IF NOT EXISTS(SELECT * FROM  View_StaffMaster WHERE StaffName=@StaffName AND IsDeleted=0 AND IsActive=1)
	BEGIN
	INSERT INTO tblStaffMaster(StaffName,LoginId,LoginPassword,FatherName,PatnerName,ContactNo,ContactAddress,EmailId,DOB,DOJ,StaffPic,Gender,Married,RoleId,IsDeleted,IsActive,AddedBy,UpdatedBy,AddedTime,UpdatedTime) VALUES(@StaffName,@LoginId,@LoginPassword,@FatherName,@PatnerName,@ContactNo,@ContactAddress,@EmailId,@DOB,@DOJ,@StaffPic,@Gender,@Married,@RoleId,0,1,@AddedBy,@AddedBy,GETDATE(),GETDATE())
    set @Result = 1 
	END
	ELSE
	BEGIN
	   set @Result = 0 
	END
END

GO
/****** Object:  StoredProcedure [dbo].[usp_Add_VersionMaster]    Script Date: 5/16/2022 11:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Dhruv
-- Create date: 4/15/2021
-- Description:	To Add the Version Master
-- =============================================
CREATE PROCEDURE [dbo].[usp_Add_VersionMaster]
@ModelId bigint,
@VersionName	 varchar(255),
@AddedBy varchar(50),
@Result bigint output    

AS
BEGIN
	IF NOT EXISTS(SELECT * FROM  View_VersionMaster WHERE ModelId=@ModelId and VersionName=@VersionName AND IsDeleted=0 AND IsActive=1)
	BEGIN

	declare @VersionSequence bigint

	 Set @VersionSequence = Isnull((Select Max(VersionSequence)+1 from View_VersionMaster where ModelId=@ModelId and IsDeleted=0 and IsActive=1),1)

	INSERT INTO tblVersionMaster(ModelId,VersionName,VersionSequence,IsDeleted,IsActive,AddedBy,UpdatedBy,AddedTime,UpdatedTime) VALUES(@ModelId,@VersionName,@VersionSequence,0,1,@AddedBy,@AddedBy,GETDATE(),GETDATE())
    set @Result = 1 
	END
	ELSE
	BEGIN
	   set @Result = 0 
	END
END

GO
/****** Object:  StoredProcedure [dbo].[usp_Authorize_Ads]    Script Date: 5/16/2022 11:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Thulasi
-- Create date: 4/9/2021
-- Description:	To Authorize Ads
-- =============================================
CREATE PROCEDURE [dbo].[usp_Authorize_Ads]
@AdId bigint,
@VehicleStatus bigint,
@UpdatedBy varchar(50),
@Result bigint output    

AS
BEGIN
	UPDATE tblPostAds SET VehicleStatus=@VehicleStatus,UpdatedBy=@UpdatedBy,UpdatedTime=GETDATE() WHERE AdId=@AdId AND IsDeleted=0 AND IsActive=1
    set @Result = 2
END

GO
/****** Object:  StoredProcedure [dbo].[usp_Delete_AdCarImages]    Script Date: 5/16/2022 11:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		Thulasi
-- Create date: 4/15/2021
-- Description:	To Delete the AdCar Images
-- =============================================
CREATE PROCEDURE [dbo].[usp_Delete_AdCarImages]
@AdCarImgId	bigint,
@AdId	bigint,
@UpdatedBy varchar(50),
@Result bigint output    

AS
BEGIN
	UPDATE tblAdCarImages SET IsDeleted=1,UpdatedBy=@UpdatedBy,UpdatedTime=GETDATE() WHERE AdCarImgId=@AdCarImgId AND AdId=@AdId  AND IsDeleted=0 AND IsActive=1
    set @Result = 3
END

GO
/****** Object:  StoredProcedure [dbo].[usp_Delete_AdCarVideos]    Script Date: 5/16/2022 11:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		Thulasi
-- Create date: 4/15/2021
-- Description:	To Delete the Staff Master
-- =============================================
CREATE PROCEDURE [dbo].[usp_Delete_AdCarVideos]
@AdCarVideoId	bigint,
@AdId	bigint,
@UpdatedBy varchar(50),
@Result bigint output    

AS
BEGIN
	UPDATE tblAdCarVideos SET IsDeleted=1,UpdatedBy=@UpdatedBy,UpdatedTime=GETDATE() WHERE AdCarVideoId=@AdCarVideoId AND AdId=@AdId AND IsDeleted=0 AND IsActive=1
    set @Result = 3
END

GO
/****** Object:  StoredProcedure [dbo].[usp_Delete_AdvanceDetails]    Script Date: 5/16/2022 11:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






-- =============================================
-- Author:		Thulasi
-- Create date: 5/21/2021
-- Description:	To Delete the Advance Details
-- =============================================
CREATE PROCEDURE [dbo].[usp_Delete_AdvanceDetails]
@AdvId bigint,
@UpdatedBy varchar(50),
@Result bigint output    

AS
BEGIN
	UPDATE tblAdvanceDetails SET IsDeleted=1,UpdatedBy=@UpdatedBy,UpdatedTime=GETDATE() WHERE AdvId=@AdvId AND IsDeleted=0 AND IsActive=1
    set @Result = 3
END

GO
/****** Object:  StoredProcedure [dbo].[usp_Delete_BillDetails]    Script Date: 5/16/2022 11:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





-- =============================================
-- Author:		Thulasi
-- Create date: 5/19/2021
-- Description:	To Delete the Expense Details
-- =============================================
CREATE PROCEDURE [dbo].[usp_Delete_BillDetails]
@BillId bigint,
@UpdatedBy varchar(50),
@Result bigint output    

AS
BEGIN
	UPDATE tblBillDetails SET IsDeleted=1,UpdatedBy=@UpdatedBy,UpdatedTime=GETDATE() WHERE BillId=@BillId AND IsDeleted=0 AND IsActive=1
    set @Result = 3
END

GO
/****** Object:  StoredProcedure [dbo].[usp_Delete_BudgetMaster]    Script Date: 5/16/2022 11:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		Dhruv
-- Create date: 4/15/2021
-- Description:	To Edit the FollowUp Status
-- =============================================
CREATE PROCEDURE [dbo].[usp_Delete_BudgetMaster]
@BudgetId bigint,
@UpdatedBy varchar(50),
@Result bigint output    

AS
BEGIN
	UPDATE tblBudgetMaster SET IsDeleted=1,UpdatedBy=@UpdatedBy,UpdatedTime=GETDATE() WHERE BudgetId=@BudgetId AND IsDeleted=0 AND IsActive=1
    set @Result = 3
END

GO
/****** Object:  StoredProcedure [dbo].[usp_Delete_CategoryMaster]    Script Date: 5/16/2022 11:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		Dhruv
-- Create date: 4/15/2021
-- Description:	To Edit the Category Master
-- =============================================
CREATE PROCEDURE [dbo].[usp_Delete_CategoryMaster]
@CatId bigint,
@UpdatedBy varchar(50),
@Result bigint output    

AS
BEGIN
	UPDATE tblCategoryMaster SET IsDeleted=1,UpdatedBy=@UpdatedBy,UpdatedTime=GETDATE() WHERE CatId=@CatId AND IsDeleted=0 AND IsActive=1
    set @Result = 3
END

GO
/****** Object:  StoredProcedure [dbo].[usp_Delete_CustomerMaster]    Script Date: 5/16/2022 11:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Thulasi
-- Create date: 4/15/2021
-- Description:	To Delete the Customer Master
-- =============================================
CREATE PROCEDURE [dbo].[usp_Delete_CustomerMaster]
@CustomerId bigint,
@UpdatedBy varchar(50),
@Result bigint output    

AS
BEGIN
	UPDATE tblCustomerMaster SET IsDeleted=1,UpdatedBy=@UpdatedBy,UpdatedTime=GETDATE() WHERE CustomerId=@CustomerId AND IsDeleted=0 AND IsActive=1
    set @Result = 3
END

GO
/****** Object:  StoredProcedure [dbo].[usp_Delete_DocumentDetails]    Script Date: 5/16/2022 11:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		Dhruv
-- Create date: 5/20/2021
-- Description:	To Edit the Document Details
-- =============================================
CREATE PROCEDURE [dbo].[usp_Delete_DocumentDetails]
@DocumentDetId bigint,
@UpdatedBy varchar(50),
@Result bigint output    

AS
BEGIN
	UPDATE tblDocumentDetails SET IsDeleted=1,UpdatedBy=@UpdatedBy,UpdatedTime=GETDATE() WHERE DocumentDetId=@DocumentDetId AND IsDeleted=0 AND IsActive=1
    set @Result = 3
END

GO
/****** Object:  StoredProcedure [dbo].[usp_Delete_DocumentMaster]    Script Date: 5/16/2022 11:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		Dhruv
-- Create date: 5/20/2021
-- Description:	To Edit the Document Master
-- =============================================
CREATE PROCEDURE [dbo].[usp_Delete_DocumentMaster]
@DocumentId bigint,
@UpdatedBy varchar(50),
@Result bigint output    

AS
BEGIN
	UPDATE tblDocumentMaster SET IsDeleted=1,UpdatedBy=@UpdatedBy,UpdatedTime=GETDATE() WHERE DocumentId=@DocumentId AND IsDeleted=0 AND IsActive=1
    set @Result = 3
END

GO
/****** Object:  StoredProcedure [dbo].[usp_Delete_ExpenseDetails]    Script Date: 5/16/2022 11:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		Thulasi
-- Create date: 4/28/2021
-- Description:	To Delete the Expense Details
-- =============================================
CREATE PROCEDURE [dbo].[usp_Delete_ExpenseDetails]
@ExpDetId bigint,
@UpdatedBy varchar(50),
@Result bigint output    

AS
BEGIN
	UPDATE tblExpenseDetails SET IsDeleted=1,UpdatedBy=@UpdatedBy,UpdatedTime=GETDATE() WHERE ExpDetId=@ExpDetId AND IsDeleted=0 AND IsActive=1
    set @Result = 3
END

GO
/****** Object:  StoredProcedure [dbo].[usp_Delete_ExpenseMaster]    Script Date: 5/16/2022 11:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		Dhruv
-- Create date: 4/15/2021
-- Description:	To Edit the Expense Master
-- =============================================
CREATE PROCEDURE [dbo].[usp_Delete_ExpenseMaster]
@ExpId bigint,
@UpdatedBy varchar(50),
@Result bigint output    

AS
BEGIN
	UPDATE tblExpenseMaster SET IsDeleted=1,UpdatedBy=@UpdatedBy,UpdatedTime=GETDATE() WHERE ExpId=@ExpId AND IsDeleted=0 AND IsActive=1
    set @Result = 3
END

GO
/****** Object:  StoredProcedure [dbo].[usp_Delete_FollowUpDetails]    Script Date: 5/16/2022 11:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		Thulasi
-- Create date: 4/28/2021
-- Description:	To Edit the FollowUp Details
-- =============================================
CREATE PROCEDURE [dbo].[usp_Delete_FollowUpDetails]
@FollowUpId	bigint,
@UpdatedBy varchar(50),
@Result bigint output    

AS
BEGIN
	UPDATE tblFollowUpDetails SET IsDeleted=1,UpdatedBy=@UpdatedBy,UpdatedTime=GETDATE() WHERE FollowUpId=@FollowUpId AND IsDeleted=0 AND IsActive=1
    set @Result = 3
END

GO
/****** Object:  StoredProcedure [dbo].[usp_Delete_FollowUpStatus]    Script Date: 5/16/2022 11:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		Dhruv
-- Create date: 4/15/2021
-- Description:	To Edit the FollowUp Status
-- =============================================
CREATE PROCEDURE [dbo].[usp_Delete_FollowUpStatus]
@FollowStatusId bigint,
@UpdatedBy varchar(50),
@Result bigint output    

AS
BEGIN
	UPDATE tblFollowUpStatus SET IsDeleted=1,UpdatedBy=@UpdatedBy,UpdatedTime=GETDATE() WHERE FollowStatusId=@FollowStatusId AND IsDeleted=0 AND IsActive=1
    set @Result = 3
END

GO
/****** Object:  StoredProcedure [dbo].[usp_Delete_FuelMaster]    Script Date: 5/16/2022 11:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		Dhruv
-- Create date: 4/15/2021
-- Description:	To Edit the Fuel Master
-- =============================================
CREATE PROCEDURE [dbo].[usp_Delete_FuelMaster]
@FuelType bigint,
@UpdatedBy varchar(50),
@Result bigint output    

AS
BEGIN
	UPDATE tblFuelMaster SET IsDeleted=1,UpdatedBy=@UpdatedBy,UpdatedTime=GETDATE() WHERE FuelType=@FuelType AND IsDeleted=0 AND IsActive=1
    set @Result = 3
END

GO
/****** Object:  StoredProcedure [dbo].[usp_Delete_InsuranceInfo]    Script Date: 5/16/2022 11:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		Thulasi
-- Create date: 4/26/2021
-- Description:	To Delete the Insurance Info
-- =============================================
CREATE PROCEDURE [dbo].[usp_Delete_InsuranceInfo]
@InsId bigint,
@UpdatedBy varchar(50),
@Result bigint output    

AS
BEGIN
	UPDATE tblInsuranceInfo SET IsDeleted=1,UpdatedBy=@UpdatedBy,UpdatedTime=GETDATE() WHERE InsId=@InsId AND IsDeleted=0 AND IsActive=1
    set @Result = 3
END

GO
/****** Object:  StoredProcedure [dbo].[usp_Delete_InsuranceMaster]    Script Date: 5/16/2022 11:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		Thulasi
-- Create date: 4/15/2021
-- Description:	To Delete the Customer Master
-- =============================================
CREATE PROCEDURE [dbo].[usp_Delete_InsuranceMaster]
@InsuranceId bigint,
@UpdatedBy varchar(50),
@Result bigint output    

AS
BEGIN
	UPDATE tblInsuranceMaster SET IsDeleted=1,UpdatedBy=@UpdatedBy,UpdatedTime=GETDATE() WHERE InsuranceId=@InsuranceId AND IsDeleted=0 AND IsActive=1
    set @Result = 3
END

GO
/****** Object:  StoredProcedure [dbo].[usp_Delete_MakeMaster]    Script Date: 5/16/2022 11:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		Dhruv
-- Create date: 4/15/2021
-- Description:	To Edit the Make Master
-- =============================================
CREATE PROCEDURE [dbo].[usp_Delete_MakeMaster]
@MakeId bigint,
@UpdatedBy varchar(50),
@Result bigint output    

AS
BEGIN
	UPDATE tblMakeMaster SET IsDeleted=1,UpdatedBy=@UpdatedBy,UpdatedTime=GETDATE() WHERE MakeId=@MakeId AND IsDeleted=0 AND IsActive=1
    set @Result = 3
END

GO
/****** Object:  StoredProcedure [dbo].[usp_Delete_ModelMaster]    Script Date: 5/16/2022 11:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		Dhruv
-- Create date: 4/15/2021
-- Description:	To Edit the Model Master
-- =============================================
CREATE PROCEDURE [dbo].[usp_Delete_ModelMaster]
@ModelId bigint,
@UpdatedBy varchar(50),
@Result bigint output    

AS
BEGIN
	UPDATE tblModelMaster SET IsDeleted=1,UpdatedBy=@UpdatedBy,UpdatedTime=GETDATE() WHERE ModelId=@ModelId AND IsDeleted=0 AND IsActive=1
    set @Result = 3
END

GO
/****** Object:  StoredProcedure [dbo].[usp_Delete_PaymentInfo]    Script Date: 5/16/2022 11:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		Thulasi
-- Create date: 4/15/2021
-- Description:	To Delete the Payment Info
-- =============================================
CREATE PROCEDURE [dbo].[usp_Delete_PaymentInfo]
@PayId	bigint,
@AdId	bigint,
@UpdatedBy varchar(50),
@Result bigint output    

AS
BEGIN
	UPDATE tblPaymentInfo SET IsDeleted=1,UpdatedBy=@UpdatedBy,UpdatedTime=GETDATE() WHERE PayId=@PayId AND AdId=@AdId AND IsDeleted=0 AND IsActive=1
    set @Result = 3
END

GO
/****** Object:  StoredProcedure [dbo].[usp_Delete_PaymentMaster]    Script Date: 5/16/2022 11:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO







-- =============================================
-- Author:		Thulasi
-- Create date: 5/21/2021
-- Description:	To Delete the Expense Details
-- =============================================
CREATE PROCEDURE [dbo].[usp_Delete_PaymentMaster]
@PayId bigint,
@UpdatedBy varchar(50),
@Result bigint output    

AS
BEGIN
	UPDATE tblPaymentMaster SET IsDeleted=1,UpdatedBy=@UpdatedBy,UpdatedTime=GETDATE() WHERE PayId=@PayId AND IsDeleted=0 AND IsActive=1
    set @Result = 3
END

GO
/****** Object:  StoredProcedure [dbo].[usp_Delete_PostRequirement]    Script Date: 5/16/2022 11:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Thulasi
-- Create date: 4/15/2021
-- Description:	To Delete the Post Requirement
-- =============================================
CREATE PROCEDURE [dbo].[usp_Delete_PostRequirement]
@PostId bigint,
@UpdatedBy varchar(50),
@Result bigint output    

AS
BEGIN
	UPDATE tblPostRequirement SET IsDeleted=1,UpdatedBy=@UpdatedBy,UpdatedTime=GETDATE() WHERE PostId=@PostId AND IsDeleted=0 AND IsActive=1
    set @Result = 3
END

GO
/****** Object:  StoredProcedure [dbo].[usp_Delete_QuotationDetails]    Script Date: 5/16/2022 11:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






-- =============================================
-- Author:		Thulasi
-- Create date: 5/21/2021
-- Description:	To Delete the Expense Details
-- =============================================
CREATE PROCEDURE [dbo].[usp_Delete_QuotationDetails]
@QuoteId bigint,
@UpdatedBy varchar(50),
@Result bigint output    

AS
BEGIN
	UPDATE tblQuotationDetails SET IsDeleted=1,UpdatedBy=@UpdatedBy,UpdatedTime=GETDATE() WHERE QuoteId=@QuoteId AND IsDeleted=0 AND IsActive=1
    set @Result = 3
END

GO
/****** Object:  StoredProcedure [dbo].[usp_Delete_SourceMaster]    Script Date: 5/16/2022 11:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		Dhruv
-- Create date: 4/15/2021
-- Description:	To Edit the Source Master
-- =============================================
CREATE PROCEDURE [dbo].[usp_Delete_SourceMaster]
@SourceId bigint,
@UpdatedBy varchar(50),
@Result bigint output    

AS
BEGIN
	UPDATE tblSourceMaster SET IsDeleted=1,UpdatedBy=@UpdatedBy,UpdatedTime=GETDATE() WHERE SourceId=@SourceId AND IsDeleted=0 AND IsActive=1
    set @Result = 3
END

GO
/****** Object:  StoredProcedure [dbo].[usp_Delete_StaffMaster]    Script Date: 5/16/2022 11:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Thulasi
-- Create date: 4/15/2021
-- Description:	To Edit the Staff Master
-- =============================================
CREATE PROCEDURE [dbo].[usp_Delete_StaffMaster]
@StaffId	bigint,
@UpdatedBy varchar(50),
@Result bigint output    

AS
BEGIN
	UPDATE tblStaffMaster SET IsDeleted=1,UpdatedBy=@UpdatedBy,UpdatedTime=GETDATE() WHERE StaffId=@StaffId  AND IsDeleted=0 AND IsActive=1
    set @Result = 3
END

GO
/****** Object:  StoredProcedure [dbo].[usp_Delete_VersionMaster]    Script Date: 5/16/2022 11:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		Dhruv
-- Create date: 4/15/2021
-- Description:	To Edit the Version Master
-- =============================================
CREATE PROCEDURE [dbo].[usp_Delete_VersionMaster]
@VersionId bigint,
@UpdatedBy varchar(50),
@Result bigint output    

AS
BEGIN
	UPDATE tblVersionMaster SET IsDeleted=1,UpdatedBy=@UpdatedBy,UpdatedTime=GETDATE() WHERE VersionId=@VersionId AND IsDeleted=0 AND IsActive=1
    set @Result = 3
END

GO
/****** Object:  StoredProcedure [dbo].[usp_Edit_AdCarOwnerDetails]    Script Date: 5/16/2022 11:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Thulasi
-- Create date: 4/14/2021
-- Description:	To Edit the Car Owner Details
-- =============================================
CREATE PROCEDURE [dbo].[usp_Edit_AdCarOwnerDetails]
@OwnerId	bigint,
@AdId	bigint,
@OwnerName	varchar(255),
@EmailId	varchar(150),
@ContactNo	varchar(50),
@OwnerAddress	varchar(500),
@StateId	bigint,
@DistrictId	bigint,
@UpdatedBy varchar(50),
@Result bigint output    

AS
BEGIN
	UPDATE tblAdCarOwnerDetails SET OwnerName=@OwnerName,EmailId=@EmailId,ContactNo=@ContactNo,OwnerAddress=@OwnerAddress,StateId=@StateId,DistrictId=@DistrictId,UpdatedBy=@UpdatedBy,UpdatedTime=GETDATE() WHERE AdId=@AdId AND OwnerId=@OwnerId AND IsDeleted=0 AND IsActive=1
    set @Result = 2
END

GO
/****** Object:  StoredProcedure [dbo].[usp_Edit_AdvanceDetails]    Script Date: 5/16/2022 11:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		Thulasi
-- Create date: 5/21/2021
-- Description:	To Update the Advance Details
-- =============================================
CREATE PROCEDURE [dbo].[usp_Edit_AdvanceDetails]
@AdvId bigint,
@AdId bigint,
@CustomerId bigint,
@AdvDate	date,
@ReferenceNo	varchar(255),
@AdvAmount	decimal(18, 2),
@FixedPrice	decimal(18, 2),
@ReceivedAmount	decimal(18, 2),
@BalanceAmount	decimal(18, 2),
@Remarks varchar(500),
@UpdatedBy varchar(50),
@Result bigint output    

AS
BEGIN
	UPDATE tblAdvanceDetails SET AdvDate=@AdvDate,ReferenceNo=@ReferenceNo,AdvAmount=@AdvAmount,FixedPrice=@FixedPrice,ReceivedAmount=@ReceivedAmount,BalanceAmount=@BalanceAmount,Remarks=@Remarks,UpdatedBy=@UpdatedBy,UpdatedTime=GETDATE() WHERE AdvId=@AdvId AND IsDeleted=0 AND IsActive=1
    set @Result = 2
END

GO
/****** Object:  StoredProcedure [dbo].[usp_Edit_BillDetails]    Script Date: 5/16/2022 11:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		Thulasi
-- Create date: 5/19/2021
-- Description:	To Update the Bill Details
-- =============================================
CREATE PROCEDURE [dbo].[usp_Edit_BillDetails]
@BillId bigint,
@AdId bigint,
@CustomerId bigint,
@BillDate date,
@BillAmount decimal(18, 2),
@CommissionOnly decimal(18, 2),
@Remarks varchar(500),
@UpdatedBy varchar(50),
@Result bigint output    

AS
BEGIN
	UPDATE tblBillDetails SET BillDate=@BillDate,BillAmount=@BillAmount,CommissionOnly=@CommissionOnly,Remarks=@Remarks,UpdatedBy=@UpdatedBy,UpdatedTime=GETDATE() WHERE BillId=@BillId AND IsDeleted=0 AND IsActive=1
    set @Result = 2
END

GO
/****** Object:  StoredProcedure [dbo].[usp_Edit_BudgetMaster]    Script Date: 5/16/2022 11:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		Dhruv
-- Create date: 4/15/2021
-- Description:	To Edit the FollowUp Status
-- =============================================
CREATE PROCEDURE [dbo].[usp_Edit_BudgetMaster]
@BudgetId bigint,
@DisplayValue	 varchar(255),
@MinValue decimal(18,2),
@MaxValue decimal(18,2),
@BudgetSequence bigint,
@UpdatedBy varchar(50),
@Result bigint output    

AS
BEGIN
	IF NOT EXISTS(SELECT * FROM  View_BudgetMaster WHERE BudgetId!=@BudgetId AND DisplayValue=@DisplayValue AND IsDeleted=0 AND IsActive=1)
	BEGIN
	UPDATE tblBudgetMaster SET MinValue=@MinValue,MaxValue=@MaxValue,DisplayValue=@DisplayValue,BudgetSequence=@BudgetSequence,UpdatedBy=@UpdatedBy,UpdatedTime=GETDATE() WHERE BudgetId=@BudgetId AND IsDeleted=0 AND IsActive=1
    set @Result = 2
	END
	ELSE
	BEGIN
	   set @Result = 0 
	END
END

GO
/****** Object:  StoredProcedure [dbo].[usp_Edit_CategoryMaster]    Script Date: 5/16/2022 11:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		Dhruv
-- Create date: 4/15/2021
-- Description:	To Edit the Category Master
-- =============================================
CREATE PROCEDURE [dbo].[usp_Edit_CategoryMaster]
@CatId bigint,
@CategoryName	 varchar(255),
@CategorySequence bigint,
@UpdatedBy varchar(50),
@Result bigint output    

AS
BEGIN
	IF NOT EXISTS(SELECT * FROM  View_CategoryMaster WHERE CatId!=@CatId AND CategoryName=@CategoryName AND IsDeleted=0 AND IsActive=1)
	BEGIN
	UPDATE tblCategoryMaster SET CategoryName=@CategoryName,CategorySequence=@CategorySequence,UpdatedBy=@UpdatedBy,UpdatedTime=GETDATE() WHERE CatId=@CatId AND IsDeleted=0 AND IsActive=1
    set @Result = 2
	END
	ELSE
	BEGIN
	   set @Result = 0 
	END
END

GO
/****** Object:  StoredProcedure [dbo].[usp_Edit_CustomerMaster]    Script Date: 5/16/2022 11:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Thulasi
-- Create date: 4/15/2021
-- Description:	To Edit the Customer Master
-- =============================================
CREATE PROCEDURE [dbo].[usp_Edit_CustomerMaster]
@CustomerId bigint,
@CustomerName	 varchar(255),
@MobileNo varchar(50),
@EmailId varchar(255),
@CustomerAddress varchar(500),
@CatId bigint,
@SourceId bigint,
@StaffId bigint,
@JoinDate date,
@CustomerPhoto varchar(500),
@IsDisturb bit,
@CustomerType bigint,
@PinCode varchar(50),
@UpdatedBy varchar(50),
@Result bigint output    

AS
BEGIN
	IF NOT EXISTS(SELECT * FROM  View_CustomerMaster WHERE CustomerId!=@CustomerId AND MobileNo=@MobileNo AND IsDeleted=0 AND IsActive=1)
	BEGIN
	UPDATE tblCustomerMaster SET CustomerName=@CustomerName,MobileNo=@MobileNo,EmailId=@EmailId,CustomerAddress=@CustomerAddress,CatId=@CatId,SourceId=@SourceId,StaffId=@StaffId,JoinDate=@JoinDate,CustomerPhoto=@CustomerPhoto,IsDisturb=@IsDisturb,CustomerType=@CustomerType,PinCode=@PinCode,UpdatedBy=@UpdatedBy,UpdatedTime=GETDATE() WHERE CustomerId=@CustomerId AND IsDeleted=0 AND IsActive=1
    set @Result = 2
	END
	ELSE
	BEGIN
	   set @Result = 0 
	END
END

GO
/****** Object:  StoredProcedure [dbo].[usp_Edit_CustomerPostRequirement]    Script Date: 5/16/2022 11:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Thulasi
-- Create date: 4/15/2021
-- Description:	To Edit the Post Requirement
-- =============================================
CREATE PROCEDURE [dbo].[usp_Edit_CustomerPostRequirement]
@PostId bigint,
@AdId	bigint,
@MakeId	bigint,
@ModelId	bigint,
@VersionId	bigint,
@Amount	decimal(18,2),
@PostInfo	varchar(500),
@PostStatus	bigint,
@UserType bigint,
@UpdatedBy varchar(50),
@CustomerId bigint  ,
@CustomerDescription	varchar(MAX)	,
@DisplayCustomerDescription	bit,
@Result bigint output    

AS
BEGIN
	UPDATE tblPostRequirement SET AdId=@AdId,MakeId=@MakeId,ModelId=@ModelId,VersionId=@VersionId,Amount=@Amount,PostInfo=@PostInfo,
	PostStatus=@PostStatus,UserType=@UserType,
CustomerDescription=@CustomerDescription,DisplayCustomerDescription=@DisplayCustomerDescription,CustomerId=@CustomerId,	UpdatedBy=@UpdatedBy,UpdatedTime=GETDATE() WHERE PostId=@PostId AND IsDeleted=0 AND IsActive=1

    set @Result = 2
END

GO
/****** Object:  StoredProcedure [dbo].[usp_Edit_DocumentMaster]    Script Date: 5/16/2022 11:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		Dhruv
-- Create date: 5/20/2021
-- Description:	To Edit the Document Master
-- =============================================
CREATE PROCEDURE [dbo].[usp_Edit_DocumentMaster]
@DocumentId bigint,
@DocumentName	 varchar(255),
@DocumentSequence bigint,
@AcceptType	varchar(225),
@IsCheck	bit,
@CheckValue	varchar(225),
@SampleDoc	 varchar(500),
@UpdatedBy varchar(50),
@Result bigint output    

AS
BEGIN
	IF NOT EXISTS(SELECT * FROM  View_DocumentMaster WHERE DocumentId!=@DocumentId AND DocumentName=@DocumentName AND IsDeleted=0 AND IsActive=1)
	BEGIN
	UPDATE tblDocumentMaster SET DocumentName=@DocumentName,DocumentSequence=@DocumentSequence,AcceptType=@AcceptType,IsCheck=@IsCheck,CheckValue=@CheckValue,SampleDoc=@SampleDoc,UpdatedBy=@UpdatedBy,UpdatedTime=GETDATE() WHERE DocumentId=@DocumentId AND IsDeleted=0 AND IsActive=1
    set @Result = 2
	END
	ELSE
	BEGIN
	   set @Result = 0 
	END
END

GO
/****** Object:  StoredProcedure [dbo].[usp_Edit_ExpenseDetails]    Script Date: 5/16/2022 11:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Thulasi
-- Create date: 4/28/2021
-- Description:	To Add the Expense Details
-- =============================================
CREATE PROCEDURE [dbo].[usp_Edit_ExpenseDetails]
@ExpDetId bigint,
@AdId bigint,
@CustomerId bigint,
@ExpDate date,
@VehicleRegNo varchar(255),
@ExpId bigint,
@ExpAmount decimal(18, 2),
@ExpenseName varchar(500),
@Remarks varchar(max),
@StaffId bigint,
@UpdatedBy varchar(50),
@Result bigint output    

AS
BEGIN
	UPDATE tblExpenseDetails SET ExpDate=@ExpDate,VehicleRegNo=@VehicleRegNo,ExpId=@ExpId,ExpAmount=@ExpAmount,ExpenseName=@ExpenseName,Remarks=@Remarks,StaffId=@StaffId,UpdatedBy=@UpdatedBy,UpdatedTime=GETDATE() WHERE ExpDetId=@ExpDetId AND IsDeleted=0 AND IsActive=1
    set @Result = 2
END

GO
/****** Object:  StoredProcedure [dbo].[usp_Edit_ExpenseMaster]    Script Date: 5/16/2022 11:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		Dhruv
-- Create date: 4/15/2021
-- Description:	To Edit the Expense Master
-- =============================================
CREATE PROCEDURE [dbo].[usp_Edit_ExpenseMaster]
@ExpId bigint,
@ExpName	 varchar(255),
@ExpSequenceNo bigint,
@UpdatedBy varchar(50),
@Result bigint output    

AS
BEGIN
	IF NOT EXISTS(SELECT * FROM  View_ExpenseMaster WHERE ExpId!=@ExpId AND ExpName=@ExpName AND IsDeleted=0 AND IsActive=1)
	BEGIN
	UPDATE tblExpenseMaster SET ExpName=@ExpName,ExpSequenceNo=@ExpSequenceNo,UpdatedBy=@UpdatedBy,UpdatedTime=GETDATE() WHERE ExpId=@ExpId AND IsDeleted=0 AND IsActive=1
    set @Result = 2
	END
	ELSE
	BEGIN
	   set @Result = 0 
	END
END

GO
/****** Object:  StoredProcedure [dbo].[usp_Edit_FollowUpDetails]    Script Date: 5/16/2022 11:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		Thulasi
-- Create date: 4/28/2021
-- Description:	To Edit the FollowUp Details
-- =============================================
CREATE PROCEDURE [dbo].[usp_Edit_FollowUpDetails]
@FollowUpId	bigint,
@CustomerId bigint,
@FollowStatusId	bigint,
@FollowTypeId	bigint,
@FollowDate	datetime,
@FollowDescription	varchar(500),
@FollowCallBack	datetime,
@UpdatedBy varchar(50),
@Result bigint output    

AS
BEGIN
	UPDATE tblFollowUpDetails SET CustomerId=@CustomerId,FollowStatusId=@FollowStatusId,FollowTypeId=@FollowTypeId,FollowDate=@FollowDate,FollowDescription=@FollowDescription,FollowCallBack=@FollowCallBack,UpdatedBy=@UpdatedBy,UpdatedTime=GETDATE() WHERE FollowUpId=@FollowUpId AND IsDeleted=0 AND IsActive=1
    set @Result = 2 
END

GO
/****** Object:  StoredProcedure [dbo].[usp_Edit_FollowUpStatus]    Script Date: 5/16/2022 11:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		Dhruv
-- Create date: 4/15/2021
-- Description:	To Edit the FollowUp Status
-- =============================================
CREATE PROCEDURE [dbo].[usp_Edit_FollowUpStatus]
@FollowStatusId bigint,
@FollowStatus	 varchar(255),
@FollowSequence bigint,
@UpdatedBy varchar(50),
@Result bigint output    

AS
BEGIN
	IF NOT EXISTS(SELECT * FROM  View_FollowUpStatus WHERE FollowStatusId!=@FollowStatusId AND FollowStatus=@FollowStatus AND IsDeleted=0 AND IsActive=1)
	BEGIN
	UPDATE tblFollowUpStatus SET FollowStatus=@FollowStatus,FollowSequence=@FollowSequence,UpdatedBy=@UpdatedBy,UpdatedTime=GETDATE() WHERE FollowStatusId=@FollowStatusId AND IsDeleted=0 AND IsActive=1
    set @Result = 2
	END
	ELSE
	BEGIN
	   set @Result = 0 
	END
END

GO
/****** Object:  StoredProcedure [dbo].[usp_Edit_FuelMaster]    Script Date: 5/16/2022 11:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		Dhruv
-- Create date: 4/15/2021
-- Description:	To Edit the Fuel Master
-- =============================================
CREATE PROCEDURE [dbo].[usp_Edit_FuelMaster]
@FuelType bigint,
@FuelName	 varchar(255),
@FuelSequence bigint,
@UpdatedBy varchar(50),
@Result bigint output    

AS
BEGIN
	IF NOT EXISTS(SELECT * FROM  View_FuelMaster WHERE FuelType!=@FuelType AND FuelName=@FuelName AND IsDeleted=0 AND IsActive=1)
	BEGIN
	UPDATE tblFuelMaster SET FuelName=@FuelName,FuelSequence=@FuelSequence,UpdatedBy=@UpdatedBy,UpdatedTime=GETDATE() WHERE FuelType=@FuelType AND IsDeleted=0 AND IsActive=1
    set @Result = 2
	END
	ELSE
	BEGIN
	   set @Result = 0 
	END
END

GO
/****** Object:  StoredProcedure [dbo].[usp_Edit_InsuranceInfo]    Script Date: 5/16/2022 11:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Thulasi
-- Create date: 4/26/2021
-- Description:	To Add the Insurance Info
-- =============================================
CREATE PROCEDURE [dbo].[usp_Edit_InsuranceInfo]
@InsId bigint,
@AdId	bigint,
@ClaimValue	varchar(255),
@IDV	decimal(18, 2),
@ExpDate	date,
@AddlNotes	varchar(500),
@CustomerId bigint,
@VehicleRegNo varchar(255),
@UpdatedBy varchar(50),
@Result bigint output    

AS
BEGIN
	UPDATE tblInsuranceInfo SET ClaimValue=@ClaimValue,IDV=@IDV,ExpDate=@ExpDate,AddlNotes=@AddlNotes,CustomerId=@CustomerId,VehicleRegNo=@VehicleRegNo,UpdatedBy=@UpdatedBy,UpdatedTime=GETDATE() WHERE InsId=@InsId AND AdId=@AdId AND IsDeleted=0 AND IsActive=1
    set @Result = 2
END

GO
/****** Object:  StoredProcedure [dbo].[usp_Edit_InsuranceMaster]    Script Date: 5/16/2022 11:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		Thulasi
-- Create date: 4/20/2021
-- Description:	To Edit the Insurance Master
-- =============================================
CREATE PROCEDURE [dbo].[usp_Edit_InsuranceMaster]
@InsuranceId bigint,
@ContactName	varchar(255),
@EmailId	varchar(255),
@ContactNo	varchar(50),
@MakeId	bigint,
@ModelId	bigint,
@VersionId	bigint,
@IsInsActive	bit,
@AddlInfo	varchar(500),
@UpdatedBy varchar(50),
@Result bigint output    

AS
BEGIN
	IF NOT EXISTS(SELECT * FROM  View_InsuranceMaster WHERE InsuranceId!=@InsuranceId AND ContactNo=@ContactNo AND IsDeleted=0 AND IsActive=1)
	BEGIN
	UPDATE tblInsuranceMaster SET ContactName=@ContactName,ContactNo=@ContactNo,EmailId=@EmailId,MakeId=@MakeId,ModelId=@ModelId,VersionId=@VersionId,UpdatedBy=@UpdatedBy,UpdatedTime=GETDATE() WHERE InsuranceId=@InsuranceId AND IsDeleted=0 AND IsActive=1
    set @Result = 2
	END
	ELSE
	BEGIN
	   set @Result = 0 
	END
END

GO
/****** Object:  StoredProcedure [dbo].[usp_Edit_MakeMaster]    Script Date: 5/16/2022 11:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		Dhruv
-- Create date: 4/15/2021
-- Description:	To Edit the Make Master
-- =============================================
CREATE PROCEDURE [dbo].[usp_Edit_MakeMaster]
@MakeId bigint,
@MakeName	 varchar(255),
@MakeSequence bigint,
@UpdatedBy varchar(50),
@Result bigint output    

AS
BEGIN
	IF NOT EXISTS(SELECT * FROM  View_MakeMaster WHERE MakeId!=@MakeId AND MakeName=@MakeName AND IsDeleted=0 AND IsActive=1)
	BEGIN
	UPDATE tblMakeMaster SET MakeName=@MakeName,MakeSequence=@MakeSequence,UpdatedBy=@UpdatedBy,UpdatedTime=GETDATE() WHERE MakeId=@MakeId AND IsDeleted=0 AND IsActive=1
    set @Result = 2
	END
	ELSE
	BEGIN
	   set @Result = 0 
	END
END

GO
/****** Object:  StoredProcedure [dbo].[usp_Edit_ModelMaster]    Script Date: 5/16/2022 11:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		Dhruv
-- Create date: 4/15/2021
-- Description:	To Edit the Model Master
-- =============================================
CREATE PROCEDURE [dbo].[usp_Edit_ModelMaster]
@ModelId bigint,
@ModelName	 varchar(255),
@ModelSequence bigint,
@UpdatedBy varchar(50),
@Result bigint output    

AS
BEGIN
	IF NOT EXISTS(SELECT * FROM  View_ModelMaster WHERE ModelId!=@ModelId AND ModelName=@ModelName AND IsDeleted=0 AND IsActive=1)
	BEGIN
	UPDATE tblModelMaster SET ModelName=@ModelName,ModelSequence=@ModelSequence,UpdatedBy=@UpdatedBy,UpdatedTime=GETDATE() WHERE ModelId=@ModelId AND IsDeleted=0 AND IsActive=1
    set @Result = 2
	END
	ELSE
	BEGIN
	   set @Result = 0 
	END
END

GO
/****** Object:  StoredProcedure [dbo].[usp_Edit_PaymentInfo]    Script Date: 5/16/2022 11:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		Thulasi
-- Create date: 6/27/2021
-- Description:	To Edit the Payment Info
-- =============================================
CREATE PROCEDURE [dbo].[usp_Edit_PaymentInfo]
@PayId bigint,
@AdId	bigint,
@PayDate	datetime,
@BankName	varchar(500),
@PayMode	bigint,
@PayAmount	decimal(18, 2),
@UpdatedBy varchar(50),
@Result bigint output    

AS
BEGIN
	UPDATE tblPaymentInfo SET PayDate=@PayDate,BankName=@BankName,PayMode=@PayMode,PayAmount=@PayAmount,UpdatedBy=@UpdatedBy,UpdatedTime=GETDATE() WHERE PayId=@PayId AND AdId=@AdId AND IsDeleted=0 AND IsActive=1
    set @Result = 2
END

GO
/****** Object:  StoredProcedure [dbo].[usp_Edit_PaymentMaster]    Script Date: 5/16/2022 11:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





-- =============================================
-- Author:		Thulasi
-- Create date: 5/21/2021
-- Description:	To Update the Advance Details
-- =============================================
CREATE PROCEDURE [dbo].[usp_Edit_PaymentMaster]
@PayId	bigint,
@AdId	bigint,
@CustomerId 	bigint,
@BankName	varchar(500),
@IFSCCode	varchar(255),
@PaymentMode	bigint,
@PurchaseAmount	decimal(18, 2),
@PaidAmount	decimal(18, 2),
@ChequeNo varchar(255),
@ChequeDate datetime,
@PaymentDate datetime,
@UpdatedBy varchar(50),
@Result bigint output    

AS
BEGIN
	UPDATE tblPaymentMaster SET BankName=@BankName,IFSCCode=@IFSCCode,PaymentMode=@PaymentMode,PurchaseAmount=@PurchaseAmount,PaidAmount=@PaidAmount,ChequeNo=@ChequeNo,ChequeDate=@ChequeDate,PaymentDate=@PaymentDate,UpdatedBy=@UpdatedBy,UpdatedTime=GETDATE() WHERE PayId=@PayId AND IsDeleted=0 AND IsActive=1
    set @Result = 2
END

GO
/****** Object:  StoredProcedure [dbo].[usp_Edit_PostAds]    Script Date: 5/16/2022 11:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Thulasi
-- Create date: 4/9/2021
-- Description:	To List the District Master
-- =============================================
CREATE PROCEDURE [dbo].[usp_Edit_PostAds]
@AdId bigint,
@MakeId	bigint,
@ModelId	bigint,
@VersionId	bigint,
@VehicleRegNo	varchar(255),
@VehicleColour	varchar(150),
@VehiclePrice	decimal(18, 2),
@NoOfOwners	bigint,
@VehicleYear	bigint,
@FuelType	bigint,
@KmsRun	decimal(18, 2),
@Tax	varchar(255),
@Insurance	varchar(255),
@CarDescription	varchar(MAX),
@UserType	bigint,
@VehicleStatus bigint,
@RejectedReason varchar(500),
@RegDate date,
@EngineNo varchar(255),
@ChassisNo varchar(255),
@DisplayPrice	bit,
@CustomerDescription	varchar(MAX)	,
@AdminDescription	varchar(MAX)	,
@DisplayCustomerDescription	bit,
@DisplayAdminDescription	bit,
@CustomerId bigint,
@UpdatedBy varchar(50),
@Result bigint output    

AS
BEGIN
	Update tblPostAds set MakeId=@MakeId,ModelId=@ModelId,VersionId=@VersionId,
VehicleRegNo=@VehicleRegNo,VehicleColour=@VehicleColour,VehiclePrice=@VehiclePrice,
NoOfOwners=@NoOfOwners,VehicleYear=@VehicleYear,FuelType=@FuelType,KmsRun=@KmsRun,
Tax=@Tax,Insurance=@Insurance,CarDescription=@CarDescription,UserType=@UserType,VehicleStatus=@VehicleStatus,RejectedReason=@RejectedReason,RegDate=@RegDate,
EngineNo=@EngineNo,ChassisNo=@ChassisNo,DisplayPrice=@DisplayPrice,CustomerDescription=@CustomerDescription,AdminDescription=@AdminDescription,DisplayCustomerDescription=@DisplayCustomerDescription,DisplayAdminDescription=@DisplayAdminDescription,CustomerId=@CustomerId,
  UpdatedBy=@UpdatedBy, UpdatedTime=GETDATE() where AdId=@AdId and IsDeleted=0
  set @Result=2
END

GO
/****** Object:  StoredProcedure [dbo].[usp_Edit_PostRequirement]    Script Date: 5/16/2022 11:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Thulasi
-- Create date: 4/15/2021
-- Description:	To Edit the Post Requirement
-- =============================================
CREATE PROCEDURE [dbo].[usp_Edit_PostRequirement]
@PostId bigint,
@AdId	bigint,
@MakeId	bigint,
@ModelId	bigint,
@VersionId	bigint,
@Amount	decimal(18,2),
@PostInfo	varchar(500),
--@UserName	varchar(255),
--@EmailId	varchar(50),
--@ContactNo	varchar(50),
--@UserAddress	varchar(500),
@PostStatus	bigint,
@UserType bigint,
@UpdatedBy varchar(50),
@VehicleRegNo varchar (255) ,
@VehicleColour varchar (150) ,
@VehicleYear bigint  ,
@FuelType bigint  ,
@PaymentMode varchar (255) ,
@ExchangeDetails varchar (1000) ,
@IsHotList bit  ,
@AttendedBy varchar (255) ,
@CustomerId bigint  ,
@CustomerDescription	varchar(MAX)	,
@AdminDescription	varchar(MAX)	,
@DisplayCustomerDescription	bit,
@DisplayAdminDescription	bit,
@Result bigint output    

AS
BEGIN
	UPDATE tblPostRequirement SET AdId=@AdId,MakeId=@MakeId,ModelId=@ModelId,VersionId=@VersionId,Amount=@Amount,PostInfo=@PostInfo,
	--UserName=@UserName,EmailId=@EmailId,ContactNo=@ContactNo,UserAddress=@UserAddress,
	PostStatus=@PostStatus,UserType=@UserType,
	VehicleRegNo=@VehicleRegNo,
VehicleColour=@VehicleColour,
VehicleYear=@VehicleYear,
FuelType=@FuelType,
PaymentMode=@PaymentMode,
ExchangeDetails=@ExchangeDetails,
IsHotList=@IsHotList,CustomerDescription=@CustomerDescription,AdminDescription=@AdminDescription,DisplayCustomerDescription=@DisplayCustomerDescription,DisplayAdminDescription=@DisplayAdminDescription,
AttendedBy=@AttendedBy,
	UpdatedBy=@UpdatedBy,UpdatedTime=GETDATE() WHERE PostId=@PostId AND IsDeleted=0 AND IsActive=1

    set @Result = 2
END

GO
/****** Object:  StoredProcedure [dbo].[usp_Edit_PurchaseInfo]    Script Date: 5/16/2022 11:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Thulasi
-- Create date: 4/26/2021
-- Description:	To Edit the Purchase Info
-- =============================================
CREATE PROCEDURE [dbo].[usp_Edit_PurchaseInfo]
@PurchaseId bigint,
@AdId	bigint,
@PurchaseDate	date,
@BrokerName	varchar(255),
@ContactNo	varchar(50),
@ContactAddress	varchar(500),
@PurchaseAmount	decimal(18, 2),
@Commission	decimal(18, 2),
@TotalAmount	decimal(18, 2),
@UpdatedBy varchar(50),
@Result bigint output    

AS
BEGIN
	UPDATE tblPurchaseInfo SET PurchaseDate=@PurchaseDate,BrokerName=@BrokerName,ContactNo=@ContactNo,ContactAddress=@ContactAddress,PurchaseAmount=@PurchaseAmount,Commission=@Commission,TotalAmount=@TotalAmount,UpdatedBy=@UpdatedBy,UpdatedTime=GETDATE() WHERE PurchaseId=@PurchaseId AND AdId=@AdId AND IsDeleted=0 AND IsActive=1
    set @Result = 2
END

GO
/****** Object:  StoredProcedure [dbo].[usp_Edit_QuotationDetails]    Script Date: 5/16/2022 11:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		Thulasi
-- Create date: 5/21/2021
-- Description:	To Update the Advance Details
-- =============================================
CREATE PROCEDURE [dbo].[usp_Edit_QuotationDetails]
@QuoteId bigint,
@AdId bigint,
@CustomerId bigint,
@PurchaseDate	date,
@ReferenceNo	varchar(255),
@QuoteAmount	decimal(18, 2),
@Remarks varchar(500),
@UpdatedBy varchar(50),
@Result bigint output    

AS
BEGIN
	UPDATE tblQuotationDetails SET PurchaseDate=@PurchaseDate,ReferenceNo=@ReferenceNo,QuoteAmount=@QuoteAmount,Remarks=@Remarks,UpdatedBy=@UpdatedBy,UpdatedTime=GETDATE() WHERE QuoteId=@QuoteId AND IsDeleted=0 AND IsActive=1
    set @Result = 2
END

GO
/****** Object:  StoredProcedure [dbo].[usp_Edit_SourceMaster]    Script Date: 5/16/2022 11:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		Dhruv
-- Create date: 4/15/2021
-- Description:	To Edit the Source Master
-- =============================================
CREATE PROCEDURE [dbo].[usp_Edit_SourceMaster]
@SourceId bigint,
@SourceName	 varchar(255),
@SourceSequence bigint,
@UpdatedBy varchar(50),
@Result bigint output    

AS
BEGIN
	IF NOT EXISTS(SELECT * FROM  View_SourceMaster WHERE SourceId!=@SourceId AND SourceName=@SourceName AND IsDeleted=0 AND IsActive=1)
	BEGIN
	UPDATE tblSourceMaster SET SourceName=@SourceName,SourceSequence=@SourceSequence,UpdatedBy=@UpdatedBy,UpdatedTime=GETDATE() WHERE SourceId=@SourceId AND IsDeleted=0 AND IsActive=1
    set @Result = 2
	END
	ELSE
	BEGIN
	   set @Result = 0 
	END
END

GO
/****** Object:  StoredProcedure [dbo].[usp_Edit_StaffMaster]    Script Date: 5/16/2022 11:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Thulasi
-- Create date: 4/15/2021
-- Description:	To Edit the Staff Master
-- =============================================
CREATE PROCEDURE [dbo].[usp_Edit_StaffMaster]
@StaffId	bigint,
@StaffName	varchar(255),
@LoginId	varchar(255),
@LoginPassword	varchar(255),
@FatherName	varchar(255),
@PatnerName	varchar(255),
@ContactNo	varchar(50),
@ContactAddress	varchar(500),
@EmailId	varchar(255),
@DOB date,
@DOJ	date,
@StaffPic	varchar(500),
@Gender	bit,
@Married	bit,
@RoleId	bigint,
@UpdatedBy varchar(50),
@Result bigint output    

AS
BEGIN
	IF NOT EXISTS(SELECT * FROM  View_StaffMaster WHERE StaffId!=@StaffId and StaffName=@StaffName AND IsDeleted=0 AND IsActive=1)
	BEGIN
	UPDATE tblStaffMaster SET StaffName=@StaffName,LoginId=@LoginId,LoginPassword=@LoginPassword,FatherName=@FatherName,PatnerName=@PatnerName,ContactNo=@ContactNo,ContactAddress=@ContactAddress,EmailId=@EmailId,DOB=@DOB,DOJ=@DOJ,StaffPic=@StaffPic,Gender=@Gender,Married=@Married,RoleId=@RoleId,UpdatedBy=@UpdatedBy,UpdatedTime=GETDATE() WHERE StaffId=@StaffId  AND IsDeleted=0 AND IsActive=1
    set @Result = 2
	END
	ELSE
	BEGIN
	   set @Result = 0 
	END
END

GO
/****** Object:  StoredProcedure [dbo].[usp_Edit_VersionMaster]    Script Date: 5/16/2022 11:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		Dhruv
-- Create date: 4/15/2021
-- Description:	To Edit the Version Master
-- =============================================
CREATE PROCEDURE [dbo].[usp_Edit_VersionMaster]
@VersionId bigint,
@VersionName	 varchar(255),
@VersionSequence bigint,
@UpdatedBy varchar(50),
@Result bigint output    

AS
BEGIN
	IF NOT EXISTS(SELECT * FROM  View_VersionMaster WHERE VersionId!=@VersionId AND VersionName=@VersionName AND IsDeleted=0 AND IsActive=1)
	BEGIN
	UPDATE tblVersionMaster SET VersionName=@VersionName,VersionSequence=@VersionSequence,UpdatedBy=@UpdatedBy,UpdatedTime=GETDATE() WHERE VersionId=@VersionId AND IsDeleted=0 AND IsActive=1
    set @Result = 2
	END
	ELSE
	BEGIN
	   set @Result = 0 
	END
END

GO
/****** Object:  StoredProcedure [dbo].[usp_List_AdCarImages]    Script Date: 5/16/2022 11:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		Thulasi
-- Create date: 4/10/2021
-- Description:	To List the AdCar Owner Details
-- =============================================
CREATE PROCEDURE [dbo].[usp_List_AdCarImages]
	@AdCarImgId bigint,
	@AdId bigint,
	@MakeId bigint,
	@ModelId bigint,
	@VersionId bigint,
	@UserId bigint,
	@FuelType bigint,  
 @FromYear bigint,
 @ToYear bigint,
 @VehicleStatus bigint,  
 @StartDate date,  
 @EndDate date,
  @MinPrice decimal(18,2),
 @MaxPrice decimal(18,2)
AS
BEGIN
	Declare @SQLQuery AS NVarchar(4000)
    Declare @ParamDefinition AS NVarchar(2000) 

Set @SQLQuery = ' select * from View_AdCarImages where IsDeleted=0 and IsActive=1' 

IF @AdCarImgId!=0
	BEGIN
	    Set @SQLQuery =  @SQLQuery +  '   and AdCarImgId=@AdCarImgId      ' 
	END

	IF @AdId!=0
	BEGIN
	    Set @SQLQuery =  @SQLQuery +  '   and AdId=@AdId      ' 
	END

	IF @ModelId!=0
	BEGIN
	    Set @SQLQuery =  @SQLQuery +  '   and ModelId=@ModelId      ' 
	END

	IF @MakeId!=0
	BEGIN
	    Set @SQLQuery =  @SQLQuery +  '   and MakeId=@MakeId      ' 
	END

	IF @VersionId!=0
	BEGIN
	    Set @SQLQuery =  @SQLQuery +  '   and VersionId=@VersionId      ' 
	END

	IF @UserId!=0
	BEGIN
	    Set @SQLQuery =  @SQLQuery +  '   and UserId=@UserId      ' 
	END

	 
IF @FuelType!=0  
BEGIN  
 Set @SQLQuery =  @SQLQuery +  '   and FuelType=@FuelType      '   
END  
  
IF @VehicleStatus!=0  
BEGIN  
 Set @SQLQuery =  @SQLQuery +  '   and VehicleStatus=@VehicleStatus      '   
END  
  
  IF @FromYear!=0 and @ToYear !=0
 BEGIN        
     Set @SQLQuery =  @SQLQuery +  '   and VehicleYear between @FromYear and @ToYear      '         
 END  

IF @StartDate!='1/1/1900' and @EndDate !='1/1/1900'      
 BEGIN        
     Set @SQLQuery =  @SQLQuery +  '   and Convert(date,AddedTime) between @StartDate and @EndDate      '         
 END    

  IF @MinPrice!=0 and @MaxPrice !=0
 BEGIN        
     Set @SQLQuery =  @SQLQuery +  '   and VehiclePrice between @MinPrice and @MaxPrice      '         
 END  

	SET @SQLQuery= @SQLQuery + 'order by  AdCarImgId'

Set @ParamDefinition =      '@AdCarImgId bigint,@AdId bigint,@MakeId bigint,	@ModelId bigint,
	@VersionId bigint,	@UserId bigint,@FuelType bigint,  
 @FromYear bigint,
 @ToYear bigint,
 @VehicleStatus bigint,  
 @StartDate date,  
 @EndDate date, @MinPrice decimal(18,2), @MaxPrice decimal(18,2)'  

Execute sp_executesql  @SQLQuery,@ParamDefinition,@AdCarImgId,@AdId,@MakeId,@ModelId,@VersionId,@UserId,@FuelType,  
 @FromYear,
 @ToYear,
 @VehicleStatus,  
 @StartDate,  
 @EndDate ,@MinPrice,@MaxPrice
END

GO
/****** Object:  StoredProcedure [dbo].[usp_List_AdCarOwnerDetails]    Script Date: 5/16/2022 11:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Thulasi
-- Create date: 4/10/2021
-- Description:	To List the AdCar Owner Details
-- =============================================
CREATE PROCEDURE [dbo].[usp_List_AdCarOwnerDetails]
	@OwnerId bigint,
	@AdId bigint,
	@MakeId bigint,
	@ModelId bigint,
	@VersionId bigint,
	@UserId bigint
AS
BEGIN
	Declare @SQLQuery AS NVarchar(4000)
    Declare @ParamDefinition AS NVarchar(2000) 

Set @SQLQuery = ' select * from View_AdCarOwnerDetails where IsDeleted=0 and IsActive=1' 

IF @OwnerId!=0
	BEGIN
	    Set @SQLQuery =  @SQLQuery +  '   and @OwnerId=@OwnerId      ' 
	END

	IF @AdId!=0
	BEGIN
	    Set @SQLQuery =  @SQLQuery +  '   and AdId=@AdId      ' 
	END

	IF @ModelId!=0
	BEGIN
	    Set @SQLQuery =  @SQLQuery +  '   and ModelId=@ModelId      ' 
	END

	IF @MakeId!=0
	BEGIN
	    Set @SQLQuery =  @SQLQuery +  '   and MakeId=@MakeId      ' 
	END

	IF @VersionId!=0
	BEGIN
	    Set @SQLQuery =  @SQLQuery +  '   and VersionId=@VersionId      ' 
	END

	IF @UserId!=0
	BEGIN
	    Set @SQLQuery =  @SQLQuery +  '   and UserId=@UserId      ' 
	END

	SET @SQLQuery= @SQLQuery + 'order by  OwnerId'

Set @ParamDefinition =      '@OwnerId bigint,@AdId bigint,@MakeId bigint,	@ModelId bigint,
	@VersionId bigint,	@UserId bigint'

Execute sp_executesql  @SQLQuery,@ParamDefinition,@OwnerId,@AdId,@MakeId,	@ModelId,@VersionId,@UserId 
END

GO
/****** Object:  StoredProcedure [dbo].[usp_List_AdCarVideos]    Script Date: 5/16/2022 11:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		Thulasi
-- Create date: 7/13/2021
-- Description:	To List the AdCar Videos
-- =============================================
CREATE PROCEDURE [dbo].[usp_List_AdCarVideos]
	@AdCarVideoId bigint,
	@AdId bigint,
	@MakeId bigint,
	@ModelId bigint,
	@VersionId bigint,
	@UserId bigint,
	@FuelType bigint,  
 @FromYear bigint,
 @ToYear bigint,
 @VehicleStatus bigint,  
 @StartDate date,  
 @EndDate date,
  @MinPrice decimal(18,2),
 @MaxPrice decimal(18,2)
AS
BEGIN
	Declare @SQLQuery AS NVarchar(4000)
    Declare @ParamDefinition AS NVarchar(2000) 

Set @SQLQuery = ' select * from View_AdCarVideos where IsDeleted=0 and IsActive=1' 

IF @AdCarVideoId!=0
	BEGIN
	    Set @SQLQuery =  @SQLQuery +  '   and AdCarVideoId=@AdCarVideoId      ' 
	END

	IF @AdId!=0
	BEGIN
	    Set @SQLQuery =  @SQLQuery +  '   and AdId=@AdId      ' 
	END

	IF @ModelId!=0
	BEGIN
	    Set @SQLQuery =  @SQLQuery +  '   and ModelId=@ModelId      ' 
	END

	IF @MakeId!=0
	BEGIN
	    Set @SQLQuery =  @SQLQuery +  '   and MakeId=@MakeId      ' 
	END

	IF @VersionId!=0
	BEGIN
	    Set @SQLQuery =  @SQLQuery +  '   and VersionId=@VersionId      ' 
	END

	IF @UserId!=0
	BEGIN
	    Set @SQLQuery =  @SQLQuery +  '   and UserId=@UserId      ' 
	END

	 
IF @FuelType!=0  
BEGIN  
 Set @SQLQuery =  @SQLQuery +  '   and FuelType=@FuelType      '   
END  
  
IF @VehicleStatus!=0  
BEGIN  
 Set @SQLQuery =  @SQLQuery +  '   and VehicleStatus=@VehicleStatus      '   
END  
  
  IF @FromYear!=0 and @ToYear !=0
 BEGIN        
     Set @SQLQuery =  @SQLQuery +  '   and VehicleYear between @FromYear and @ToYear      '         
 END  

IF @StartDate!='1/1/1900' and @EndDate !='1/1/1900'      
 BEGIN        
     Set @SQLQuery =  @SQLQuery +  '   and Convert(date,AddedTime) between @StartDate and @EndDate      '         
 END    

  IF @MinPrice!=0 and @MaxPrice !=0
 BEGIN        
     Set @SQLQuery =  @SQLQuery +  '   and VehiclePrice between @MinPrice and @MaxPrice      '         
 END  

	SET @SQLQuery= @SQLQuery + 'order by  AdCarVideoId'

Set @ParamDefinition =      '@AdCarVideoId bigint,@AdId bigint,@MakeId bigint,	@ModelId bigint,
	@VersionId bigint,	@UserId bigint,@FuelType bigint,  
 @FromYear bigint,
 @ToYear bigint,
 @VehicleStatus bigint,  
 @StartDate date,  
 @EndDate date, @MinPrice decimal(18,2), @MaxPrice decimal(18,2)'  

Execute sp_executesql  @SQLQuery,@ParamDefinition,@AdCarVideoId,@AdId,@MakeId,@ModelId,@VersionId,@UserId,@FuelType,  
 @FromYear,
 @ToYear,
 @VehicleStatus,  
 @StartDate,  
 @EndDate ,@MinPrice,@MaxPrice
END

GO
/****** Object:  StoredProcedure [dbo].[usp_List_AdvanceDetails]    Script Date: 5/16/2022 11:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


  
  
  
  
-- =============================================  
-- Author:  Thulasi  
-- Create date: 5/21/2021
-- Description: To List the Advance Details  
-- =============================================  
CREATE PROCEDURE [dbo].[usp_List_AdvanceDetails]  
 @AdvId bigint,  
 @AdId bigint,  
 @CustomerId bigint,  
 @StartDate date,  
 @EndDate date  
AS  
BEGIN  
 Declare @SQLQuery AS NVarchar(4000)  
    Declare @ParamDefinition AS NVarchar(2000)   
  
Set @SQLQuery = ' select * from View_AdvanceDetails where IsDeleted=0 and IsActive=1'   
  
IF @AdvId!=0  
 BEGIN  
     Set @SQLQuery =  @SQLQuery +  '   and AdvId=@AdvId      '   
 END  
  
 IF @AdId!=0  
 BEGIN  
     Set @SQLQuery =  @SQLQuery +  '   and AdId=@AdId      '   
 END  
  
 IF @CustomerId!=0  
 BEGIN  
     Set @SQLQuery =  @SQLQuery +  '   and CustomerId=@CustomerId      '   
 END  
  

   
 IF @StartDate!='1/1/1900' AND @EndDate!='1/1/1900'  
 BEGIN  
     Set @SQLQuery =  @SQLQuery +  '   and (CONVERT(DATE,AdvDate) BETWEEN @StartDate AND @EndDate)    '   
 END  
  
 SET @SQLQuery= @SQLQuery + 'order by  AdvId'  
  
Set @ParamDefinition =      '@AdvId bigint,@AdId bigint,@CustomerId bigint, @StartDate date,@EndDate date'  
  
Execute sp_executesql  @SQLQuery,@ParamDefinition,@AdvId,@AdId,@CustomerId,@StartDate,@EndDate  
END  

GO
/****** Object:  StoredProcedure [dbo].[usp_List_BillDetails]    Script Date: 5/16/2022 11:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

  
  
  
  
-- =============================================  
-- Author:  Thulasi  
-- Create date: 5/19/2021
-- Description: To List the Bill Details  
-- =============================================  
CREATE PROCEDURE [dbo].[usp_List_BillDetails]  
 @BillId bigint,  
 @AdId bigint,  
 @CustomerId bigint,  
 @StartDate date,  
 @EndDate date  
AS  
BEGIN  
 Declare @SQLQuery AS NVarchar(4000)  
    Declare @ParamDefinition AS NVarchar(2000)   
  
Set @SQLQuery = ' select * from View_BillDetails where IsDeleted=0 and IsActive=1'   
  
IF @BillId!=0  
 BEGIN  
     Set @SQLQuery =  @SQLQuery +  '   and BillId=@BillId      '   
 END  
  
 IF @AdId!=0  
 BEGIN  
     Set @SQLQuery =  @SQLQuery +  '   and AdId=@AdId      '   
 END  
  
 IF @CustomerId!=0  
 BEGIN  
     Set @SQLQuery =  @SQLQuery +  '   and CustomerId=@CustomerId      '   
 END  
  

   
 IF @StartDate!='1/1/1900' AND @EndDate!='1/1/1900'  
 BEGIN  
     Set @SQLQuery =  @SQLQuery +  '   and (CONVERT(DATE,BillDate) BETWEEN @StartDate AND @EndDate)    '   
 END  
  
 SET @SQLQuery= @SQLQuery + 'order by  BillId'  
  
Set @ParamDefinition =      '@BillId bigint,@AdId bigint,@CustomerId bigint, @StartDate date,@EndDate date'  
  
Execute sp_executesql  @SQLQuery,@ParamDefinition,@BillId,@AdId,@CustomerId,@StartDate,@EndDate  
END  

GO
/****** Object:  StoredProcedure [dbo].[usp_List_BudgetMaster]    Script Date: 5/16/2022 11:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Dhruv
-- Create date: 4/7/2021
-- Description:	To List the District Master
-- =============================================
CREATE PROCEDURE [dbo].[usp_List_BudgetMaster]
	@BudgetId bigint
AS
BEGIN
	Declare @SQLQuery AS NVarchar(4000)
    Declare @ParamDefinition AS NVarchar(2000) 

Set @SQLQuery = ' select * from View_BudgetMaster where IsDeleted=0 and IsActive=1' 

IF @BudgetId!=0
BEGIN
	Set @SQLQuery =  @SQLQuery +  '   and BudgetId=@BudgetId      ' 
END


SET @SQLQuery= @SQLQuery + 'order by  BudgetSequence'

Set @ParamDefinition =      '@BudgetId bigint'

Execute sp_executesql  @SQLQuery,@ParamDefinition,@BudgetId
END

GO
/****** Object:  StoredProcedure [dbo].[usp_List_CategoryMaster]    Script Date: 5/16/2022 11:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Dhruv
-- Create date: 4/15/2021
-- Description:	To List the Category Master
-- =============================================
CREATE PROCEDURE [dbo].[usp_List_CategoryMaster]
	@CatId bigint
AS
BEGIN
	Declare @SQLQuery AS NVarchar(4000)
    Declare @ParamDefinition AS NVarchar(2000) 

Set @SQLQuery = ' select * from View_CategoryMaster where IsDeleted=0 and IsActive=1' 

IF @CatId!=0
	BEGIN
	    Set @SQLQuery =  @SQLQuery +  '   and CatId=@CatId      ' 
	END


	SET @SQLQuery= @SQLQuery + 'order by  CategorySequence'

Set @ParamDefinition =      '@CatId bigint'

Execute sp_executesql  @SQLQuery,@ParamDefinition,@CatId
END

GO
/****** Object:  StoredProcedure [dbo].[usp_List_CustomerMaster]    Script Date: 5/16/2022 11:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

  
  
-- =============================================  
-- Author:  Dhruv  
-- Create date: 4/15/2021  
-- Description: To List the Customer Master
-- =============================================  
CREATE PROCEDURE [dbo].[usp_List_CustomerMaster]  
 @CustomerId bigint,  
 @Keyword varchar(500),  
 @CatId bigint,  
 @SourceId bigint,  
 @StaffId bigint,  
 @FromDate date,  
 @ToDate date,
 @CustomerType bigint
AS  
BEGIN  
 Declare @SQLQuery AS NVarchar(4000)  
    Declare @ParamDefinition AS NVarchar(2000)   
  
Set @SQLQuery = ' select * from View_CustomerMaster where IsDeleted=0 and IsActive=1'   
  
IF @CustomerId!=0  
BEGIN  
 Set @SQLQuery =  @SQLQuery +  '   and CustomerId=@CustomerId      '   
END  

IF @Keyword!=''
BEGIN  
 Set @SQLQuery =  @SQLQuery +  '   and (MobileNo LIKE @Keyword OR CustomerName LIKE @Keyword OR CustomerAddress LIKE @Keyword)  '   
END  
  
IF @CatId!=0  
BEGIN  
 Set @SQLQuery =  @SQLQuery +  '   and CatId=@CatId      '   
END  
  
IF @SourceId!=0  
BEGIN  
 Set @SQLQuery =  @SQLQuery +  '   and SourceId=@SourceId      '   
END  
  
IF @StaffId!=0  
BEGIN  
 Set @SQLQuery =  @SQLQuery +  '   and StaffId=@StaffId      '   
END  
 
  
IF @FromDate!='1/1/1900' and @ToDate !='1/1/1900'      
 BEGIN        
     Set @SQLQuery =  @SQLQuery +  '   and Convert(date,JoinDate) between @FromDate and @ToDate      '         
 END    

 IF @CustomerType!=0  
BEGIN  
 Set @SQLQuery =  @SQLQuery +  '   and CustomerType=@CustomerType      '   
END 
  
SET @SQLQuery= @SQLQuery + 'order by  CustomerId desc'  
  
Set @ParamDefinition =      ' @CustomerId bigint,@Keyword varchar(500),@CatId bigint,@SourceId bigint,@StaffId bigint,@FromDate date,@ToDate date,@CustomerType bigint'  
  
Execute sp_executesql  @SQLQuery,@ParamDefinition,@CustomerId,@Keyword,@CatId,@SourceId,@StaffId,@FromDate,@ToDate,@CustomerType
END  

GO
/****** Object:  StoredProcedure [dbo].[usp_List_DistrictMaster]    Script Date: 5/16/2022 11:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Dhruv
-- Create date: 4/9/2021
-- Description:	To List the District Master
-- =============================================
CREATE PROCEDURE [dbo].[usp_List_DistrictMaster]
	@StateId bigint,
	@DistrictId bigint
AS
BEGIN
	Declare @SQLQuery AS NVarchar(4000)
    Declare @ParamDefinition AS NVarchar(2000) 

Set @SQLQuery = ' select * from View_DistrictMaster where IsDeleted=0 and IsActive=1' 

IF @StateId!=0
	BEGIN
	    Set @SQLQuery =  @SQLQuery +  '   and StateId=@StateId      ' 
	END

	IF @DistrictId!=0
	BEGIN
	    Set @SQLQuery =  @SQLQuery +  '   and DistrictId=@DistrictId      ' 
	END

	SET @SQLQuery= @SQLQuery + 'order by  DistrictId'

Set @ParamDefinition =      '@StateId bigint,@DistrictId bigint'

Execute sp_executesql  @SQLQuery,@ParamDefinition,@StateId,@DistrictId
END

GO
/****** Object:  StoredProcedure [dbo].[usp_List_DocumentDetails]    Script Date: 5/16/2022 11:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Dhruv
-- Create date: 5/20/2021
-- Description:	To List the Document Details
-- =============================================
CREATE PROCEDURE [dbo].[usp_List_DocumentDetails]
	@DocumentDetId	bigint,
	@DocumentId	bigint,
	@AdId	bigint

AS
BEGIN
	Declare @SQLQuery AS NVarchar(4000)
    Declare @ParamDefinition AS NVarchar(2000) 

Set @SQLQuery = ' select * from View_DocumentDetails where IsDeleted=0 and IsActive=1' 

IF @DocumentDetId!=0
	BEGIN
	    Set @SQLQuery =  @SQLQuery +  '   and DocumentDetId=@DocumentDetId      ' 
	END

	IF @DocumentId!=0
	BEGIN
	    Set @SQLQuery =  @SQLQuery +  '   and DocumentId=@DocumentId      ' 
	END

	IF @AdId!=0
	BEGIN
	    Set @SQLQuery =  @SQLQuery +  '   and AdId=@AdId      ' 
	END


	SET @SQLQuery= @SQLQuery + 'order by  DocumentDetId desc'

Set @ParamDefinition =      '@DocumentDetId	bigint,@DocumentId	bigint,@AdId	 bigint'

Execute sp_executesql  @SQLQuery,@ParamDefinition,@DocumentDetId,@DocumentId,@AdId
END

GO
/****** Object:  StoredProcedure [dbo].[usp_List_DocumentMaster]    Script Date: 5/16/2022 11:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Dhruv
-- Create date: 5/20/2021
-- Description:	To List the Document Master
-- =============================================
CREATE PROCEDURE [dbo].[usp_List_DocumentMaster]
	@DocumentId bigint
AS
BEGIN
	Declare @SQLQuery AS NVarchar(4000)
    Declare @ParamDefinition AS NVarchar(2000) 

Set @SQLQuery = ' select * from View_DocumentMaster where IsDeleted=0 and IsActive=1' 

IF @DocumentId!=0
	BEGIN
	    Set @SQLQuery =  @SQLQuery +  '   and DocumentId=@DocumentId      ' 
	END


	SET @SQLQuery= @SQLQuery + 'order by  DocumentSequence'

Set @ParamDefinition =      '@DocumentId bigint'

Execute sp_executesql  @SQLQuery,@ParamDefinition,@DocumentId
END

GO
/****** Object:  StoredProcedure [dbo].[usp_List_ExpenseDetails]    Script Date: 5/16/2022 11:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  
  
  
  
-- =============================================  
-- Author:  Thulasi  
-- Create date: 4/28/2021  
-- Description: To List the Expense Details  
-- =============================================  
CREATE PROCEDURE [dbo].[usp_List_ExpenseDetails]  
 @ExpDetId bigint,  
 @AdId bigint,  
 @CustomerId bigint,  
 @ExpId bigint,  
 @Keyword varchar(500),  
 @StartDate date,  
 @EndDate date  
AS  
BEGIN  
 Declare @SQLQuery AS NVarchar(4000)  
    Declare @ParamDefinition AS NVarchar(2000)   
  
Set @SQLQuery = ' select * from View_ExpenseDetails where IsDeleted=0 and IsActive=1'   
  
IF @ExpDetId!=0  
 BEGIN  
     Set @SQLQuery =  @SQLQuery +  '   and ExpDetId=@ExpDetId      '   
 END  
  
 IF @AdId!=0  
 BEGIN  
     Set @SQLQuery =  @SQLQuery +  '   and AdId=@AdId      '   
 END  
  
 IF @CustomerId!=0  
 BEGIN  
     Set @SQLQuery =  @SQLQuery +  '   and CustomerId=@CustomerId      '   
 END  
  
 IF @ExpId!=0  
 BEGIN  
     Set @SQLQuery =  @SQLQuery +  '   and ExpId=@ExpId      '   
 END  
   
 IF @Keyword!=''  
 BEGIN    
  Set @SQLQuery =  @SQLQuery +  '   and (VehicleRegNo LIKE @Keyword)  '     
 END   
  
 IF @StartDate!='1/1/1900' AND @EndDate!='1/1/1900'  
 BEGIN  
     Set @SQLQuery =  @SQLQuery +  '   and (CONVERT(DATE,ExpDate) BETWEEN @StartDate AND @EndDate)    '   
 END  
  
 SET @SQLQuery= @SQLQuery + 'order by  ExpDetId'  
  
Set @ParamDefinition =      '@ExpDetId bigint,@AdId bigint,@CustomerId bigint,@ExpId bigint, @StartDate date,@EndDate date'  
  
Execute sp_executesql  @SQLQuery,@ParamDefinition,@ExpDetId,@AdId,@CustomerId,@ExpId,@StartDate,@EndDate  
END  

GO
/****** Object:  StoredProcedure [dbo].[usp_List_ExpenseDetailsNew]    Script Date: 5/16/2022 11:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

    
    
    
    
-- =============================================    
-- Author:  Thulasi    
-- Create date: 4/28/2021    
-- Description: To List the Expense Details    
-- =============================================    
CREATE PROCEDURE [dbo].[usp_List_ExpenseDetailsNew]    
 @ExpDetId bigint,    
 @AdId bigint,    
 @CustomerId bigint,    
 @ExpId bigint,    
 @Keyword varchar(500),    
 @StartDate date,    
 @EndDate date    
AS    
BEGIN    
 Declare @SQLQuery AS NVarchar(4000)    
    Declare @ParamDefinition AS NVarchar(2000)     
    
Set @SQLQuery = ' select * from View_ExpenseDetailsNew where IsDeleted=0 and IsActive=1'     
    
IF @ExpDetId!=0    
 BEGIN    
     Set @SQLQuery =  @SQLQuery +  '   and ExpDetId=@ExpDetId      '     
 END    
    
 IF @AdId!=0    
 BEGIN    
     Set @SQLQuery =  @SQLQuery +  '   and AdId=@AdId      '     
 END    
    
 IF @CustomerId!=0    
 BEGIN    
     Set @SQLQuery =  @SQLQuery +  '   and CustomerId=@CustomerId      '     
 END    
    
 IF @ExpId!=0    
 BEGIN    
     Set @SQLQuery =  @SQLQuery +  '   and ExpId=@ExpId      '     
 END    
     
 IF @Keyword!=''    
 BEGIN      
 set @Keyword='%'+@Keyword+'%'
  Set @SQLQuery =  @SQLQuery +  '   and (VehicleRegNo LIKE @Keyword) or (ExpenseName LIKE @Keyword) '       
 END     
    
 IF @StartDate!='1/1/1900' AND @EndDate!='1/1/1900'    
 BEGIN    
     Set @SQLQuery =  @SQLQuery +  '   and (CONVERT(DATE,ExpDate) BETWEEN @StartDate AND @EndDate)    '     
 END    
    
 SET @SQLQuery= @SQLQuery + 'order by  ExpDetId'    
    
Set @ParamDefinition =      '@ExpDetId bigint,@AdId bigint,@CustomerId bigint,@ExpId bigint, @StartDate date,@EndDate date,@Keyword varchar(500)'    
    
Execute sp_executesql  @SQLQuery,@ParamDefinition,@ExpDetId,@AdId,@CustomerId,@ExpId,@StartDate,@EndDate,@Keyword
END 

GO
/****** Object:  StoredProcedure [dbo].[usp_List_ExpenseMaster]    Script Date: 5/16/2022 11:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		Dhruv
-- Create date: 4/28/2021
-- Description:	To List the Expense Master
-- =============================================
CREATE PROCEDURE [dbo].[usp_List_ExpenseMaster]
	@ExpId bigint
AS
BEGIN
	Declare @SQLQuery AS NVarchar(4000)
    Declare @ParamDefinition AS NVarchar(2000) 

Set @SQLQuery = ' select * from View_ExpenseMaster where IsDeleted=0 and IsActive=1' 

IF @ExpId!=0
BEGIN
	Set @SQLQuery =  @SQLQuery +  '   and ExpId=@ExpId      ' 
END


SET @SQLQuery= @SQLQuery + 'order by  ExpSequenceNo'

Set @ParamDefinition =      '@ExpId bigint'

Execute sp_executesql  @SQLQuery,@ParamDefinition,@ExpId
END

GO
/****** Object:  StoredProcedure [dbo].[usp_List_FollowUpDetails]    Script Date: 5/16/2022 11:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



  
  
-- =============================================  
-- Author:  Dhruv  
-- Create date: 4/28/2021  
-- Description: To List the FollowUp Details
-- =============================================  
CREATE PROCEDURE [dbo].[usp_List_FollowUpDetails]  
@FollowUpId bigint, 
@CustomerId bigint, 
@FollowStatusId	bigint,
@FollowTypeId	bigint

AS  
BEGIN  
 Declare @SQLQuery AS NVarchar(4000)  
    Declare @ParamDefinition AS NVarchar(2000)   
  
Set @SQLQuery = ' select * from View_FollowUpDetails where IsDeleted=0 and IsActive=1'   
    
IF @FollowUpId!=0  
BEGIN  
 Set @SQLQuery =  @SQLQuery +  '   and FollowUpId=@FollowUpId      '   
END  
  
IF @FollowStatusId!=0  
BEGIN  
 Set @SQLQuery =  @SQLQuery +  '   and FollowStatusId=@FollowStatusId      '   
END  
  
IF @FollowTypeId!=0  
BEGIN  
 Set @SQLQuery =  @SQLQuery +  '   and FollowTypeId=@FollowTypeId      '   
END  

IF @CustomerId!=0  
BEGIN  
 Set @SQLQuery =  @SQLQuery +  '   and CustomerId=@CustomerId      '   
END  

  
SET @SQLQuery= @SQLQuery + 'order by  FollowUpId desc'  
  
Set @ParamDefinition =      '@FollowUpId bigint,@CustomerId bigint,@FollowStatusId	bigint,@FollowTypeId	bigint'  
  
Execute sp_executesql  @SQLQuery,@ParamDefinition,@FollowUpId,@CustomerId,@FollowStatusId,@FollowTypeId
END  

GO
/****** Object:  StoredProcedure [dbo].[usp_List_FollowUpDetails_WithDate]    Script Date: 5/16/2022 11:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


  
  
  
    
    
-- =============================================    
-- Author:  Dhruv    
-- Create date: 4/28/2021    
-- Description: To List the FollowUp Details  
-- =============================================    
CREATE PROCEDURE [dbo].[usp_List_FollowUpDetails_WithDate]    
@FollowUpId bigint,   
@CustomerId bigint,   
@FollowStatusId bigint,  
@FollowTypeId bigint,
@FromDate date,
@ToDate date
  
AS    
BEGIN    
 Declare @SQLQuery AS NVarchar(4000)    
    Declare @ParamDefinition AS NVarchar(2000)     
    
Set @SQLQuery = ' select * from View_FollowUpDetails where IsDeleted=0 and IsActive=1'     
      
IF @FollowUpId!=0    
BEGIN    
 Set @SQLQuery =  @SQLQuery +  '   and FollowUpId=@FollowUpId      '     
END    
    
IF @FollowStatusId!=0    
BEGIN    
 Set @SQLQuery =  @SQLQuery +  '   and FollowStatusId=@FollowStatusId      '     
END    
    
IF @FollowTypeId!=0    
BEGIN    
 Set @SQLQuery =  @SQLQuery +  '   and FollowTypeId=@FollowTypeId      '     
END    
  
IF @CustomerId!=0    
BEGIN    
 Set @SQLQuery =  @SQLQuery +  '   and CustomerId=@CustomerId      '     
END    
  IF @FromDate!='1/1/1900' and @ToDate!='1/1/1900'
BEGIN    
 Set @SQLQuery =  @SQLQuery +  '   and FollowDate between   @FromDate and @ToDate     '     
END  
    
SET @SQLQuery= @SQLQuery + 'order by  FollowUpId desc'    
    
Set @ParamDefinition =      '@FollowUpId bigint,@CustomerId bigint,@FollowStatusId bigint,@FollowTypeId bigint,@FromDate date,@ToDate date'    
    
Execute sp_executesql  @SQLQuery,@ParamDefinition,@FollowUpId,@CustomerId,@FollowStatusId,@FollowTypeId,@FromDate,@ToDate
END    

GO
/****** Object:  StoredProcedure [dbo].[usp_List_FollowUpStatus]    Script Date: 5/16/2022 11:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



  
  
-- =============================================  
-- Author:  Dhruv  
-- Create date: 4/29/2021  
-- Description: To List the FollowUp Status
-- =============================================  
CREATE PROCEDURE [dbo].[usp_List_FollowUpStatus]  
@FollowStatusId bigint
AS  
BEGIN  
 Declare @SQLQuery AS NVarchar(4000)  
    Declare @ParamDefinition AS NVarchar(2000)   
  
Set @SQLQuery = ' select * from View_FollowUpStatus where IsDeleted=0 and IsActive=1'   
  
IF @FollowStatusId!=0  
BEGIN  
 Set @SQLQuery =  @SQLQuery +  '   and FollowStatusId=@FollowStatusId      '   
END  

  
SET @SQLQuery= @SQLQuery + 'order by  FollowSequence desc'  
  
Set @ParamDefinition =      ' @FollowStatusId bigint'  
  
Execute sp_executesql  @SQLQuery,@ParamDefinition,@FollowStatusId
END  

GO
/****** Object:  StoredProcedure [dbo].[usp_List_FuelMaster]    Script Date: 5/16/2022 11:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		Dhruv
-- Create date: 4/26/2021
-- Description:	To List the Fuel Master
-- =============================================
CREATE PROCEDURE [dbo].[usp_List_FuelMaster]
	@FuelType bigint
AS
BEGIN
	Declare @SQLQuery AS NVarchar(4000)
    Declare @ParamDefinition AS NVarchar(2000) 

Set @SQLQuery = ' select * from View_FuelMaster where IsDeleted=0 and IsActive=1' 

IF @FuelType!=0
	BEGIN
	    Set @SQLQuery =  @SQLQuery +  '   and FuelType=@FuelType      ' 
	END


	SET @SQLQuery= @SQLQuery + 'order by  FuelSequence'

Set @ParamDefinition =      '@FuelType bigint'

Execute sp_executesql  @SQLQuery,@ParamDefinition,@FuelType
END

GO
/****** Object:  StoredProcedure [dbo].[usp_List_InsuranceInfo]    Script Date: 5/16/2022 11:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		Thulasi
-- Create date: 4/26/2021
-- Description:	To List the Insurance Info
-- =============================================
CREATE PROCEDURE [dbo].[usp_List_InsuranceInfo]
	@InsId bigint,
	@AdId bigint,
	@MakeId bigint,
	@ModelId bigint,
	@VersionId bigint,
	@FuelType bigint,
	@UserId bigint,
	@UserType bigint,
	@VehicleStatus bigint,
	@StartDate date,
	@EndDate date
AS
BEGIN
	Declare @SQLQuery AS NVarchar(4000)
    Declare @ParamDefinition AS NVarchar(2000) 

Set @SQLQuery = ' select * from View_InsuranceInfo where IsDeleted=0 and IsActive=1' 

IF @InsId!=0
	BEGIN
	    Set @SQLQuery =  @SQLQuery +  '   and InsId=@InsId      ' 
	END

	IF @AdId!=0
	BEGIN
	    Set @SQLQuery =  @SQLQuery +  '   and AdId=@AdId      ' 
	END

	IF @ModelId!=0
	BEGIN
	    Set @SQLQuery =  @SQLQuery +  '   and ModelId=@ModelId      ' 
	END

	IF @MakeId!=0
	BEGIN
	    Set @SQLQuery =  @SQLQuery +  '   and MakeId=@MakeId      ' 
	END

	IF @VersionId!=0
	BEGIN
	    Set @SQLQuery =  @SQLQuery +  '   and VersionId=@VersionId      ' 
	END

	IF @FuelType!=0
	BEGIN
	    Set @SQLQuery =  @SQLQuery +  '   and FuelType=@FuelType      ' 
	END

	IF @UserId!=0
	BEGIN
	    Set @SQLQuery =  @SQLQuery +  '   and UserId=@UserId      ' 
	END

	IF @UserType!=0
	BEGIN
	    Set @SQLQuery =  @SQLQuery +  '   and UserType=@UserType      ' 
	END

	IF @VehicleStatus!=0
	BEGIN
	    Set @SQLQuery =  @SQLQuery +  '   and VehicleStatus=@VehicleStatus      ' 
	END

	IF @StartDate!='1/1/1900' AND @EndDate!='1/1/1900'
	BEGIN
	    Set @SQLQuery =  @SQLQuery +  '   and (CONVERT(DATE,ExpDate) BETWEEN @StartDate AND   @EndDate)    ' 
	END

	SET @SQLQuery= @SQLQuery + 'order by  InsId'

Set @ParamDefinition =      '@InsId bigint,@AdId bigint,@MakeId bigint,@ModelId bigint,@VersionId bigint,@FuelType bigint,@UserId bigint,	@UserType bigint,@VehicleStatus bigint,	@StartDate date,@EndDate date'

Execute sp_executesql  @SQLQuery,@ParamDefinition,@InsId,@AdId,@MakeId,@ModelId,@VersionId,@FuelType,@UserId,@UserType,@VehicleStatus,@StartDate,@EndDate
--print @SQLQuery
END

GO
/****** Object:  StoredProcedure [dbo].[usp_List_InsuranceMaster]    Script Date: 5/16/2022 11:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


  
  
-- =============================================  
-- Author:  Dhruv  
-- Create date: 4/20/2021  
-- Description: To List the Insurance Master
-- =============================================  
CREATE PROCEDURE [dbo].[usp_List_InsuranceMaster]  
@InsuranceId bigint,  
 @Keyword varchar(500),  
 @MakeId bigint,  
 @ModelId bigint,  
 @VersionId bigint
AS  
BEGIN  
 Declare @SQLQuery AS NVarchar(4000)  
    Declare @ParamDefinition AS NVarchar(2000)   
  
Set @SQLQuery = ' select * from View_InsuranceMaster where IsDeleted=0 and IsActive=1'   
  
IF @InsuranceId!=0  
BEGIN  
 Set @SQLQuery =  @SQLQuery +  '   and InsuranceId=@InsuranceId      '   
END  

IF @Keyword!=''
BEGIN  
 Set @SQLQuery =  @SQLQuery +  '   and (ContactNo LIKE @Keyword OR ContactName LIKE @Keyword OR EmailId LIKE @Keyword)  '   
END  
  
IF @MakeId!=0  
BEGIN  
 Set @SQLQuery =  @SQLQuery +  '   and MakeId=@MakeId      '   
END  
  
IF @ModelId!=0  
BEGIN  
 Set @SQLQuery =  @SQLQuery +  '   and ModelId=@ModelId      '   
END  
  
IF @VersionId!=0  
BEGIN  
 Set @SQLQuery =  @SQLQuery +  '   and VersionId=@VersionId      '   
END  

  
SET @SQLQuery= @SQLQuery + 'order by  InsuranceId desc'  
  
Set @ParamDefinition =      ' @InsuranceId bigint,@Keyword varchar(500),@MakeId bigint,@ModelId bigint,@VersionId bigint'  
  
Execute sp_executesql  @SQLQuery,@ParamDefinition,@InsuranceId,@Keyword,@MakeId,@ModelId,@VersionId
END  

GO
/****** Object:  StoredProcedure [dbo].[usp_List_MakeMaster]    Script Date: 5/16/2022 11:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Dhruv
-- Create date: 4/7/2021
-- Description:	To List the District Master
-- =============================================
CREATE PROCEDURE [dbo].[usp_List_MakeMaster]
	@MakeId bigint
AS
BEGIN
	Declare @SQLQuery AS NVarchar(4000)
    Declare @ParamDefinition AS NVarchar(2000) 

Set @SQLQuery = ' select * from View_MakeMaster where IsDeleted=0 and IsActive=1' 

IF @MakeId!=0
	BEGIN
	    Set @SQLQuery =  @SQLQuery +  '   and MakeId=@MakeId      ' 
	END


	SET @SQLQuery= @SQLQuery + 'order by  MakeSequence'

Set @ParamDefinition =      '@MakeId bigint'

Execute sp_executesql  @SQLQuery,@ParamDefinition,@MakeId
END

GO
/****** Object:  StoredProcedure [dbo].[usp_List_ModelMaster]    Script Date: 5/16/2022 11:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Dhruv
-- Create date: 4/7/2021
-- Description:	To List the District Master
-- =============================================
CREATE PROCEDURE [dbo].[usp_List_ModelMaster]
	@ModelId bigint,
	@MakeId bigint
AS
BEGIN
	Declare @SQLQuery AS NVarchar(4000)
    Declare @ParamDefinition AS NVarchar(2000) 

Set @SQLQuery = ' select * from View_ModelMaster where IsDeleted=0 and IsActive=1' 

IF @ModelId!=0
	BEGIN
	    Set @SQLQuery =  @SQLQuery +  '   and ModelId=@ModelId      ' 
	END

	IF @MakeId!=0
	BEGIN
	    Set @SQLQuery =  @SQLQuery +  '   and MakeId=@MakeId      ' 
	END


	SET @SQLQuery= @SQLQuery + 'order by  ModelSequence'

Set @ParamDefinition =      '@ModelId bigint,@MakeId bigint'

Execute sp_executesql  @SQLQuery,@ParamDefinition,@ModelId,@MakeId
END

GO
/****** Object:  StoredProcedure [dbo].[usp_List_PaymentInfo]    Script Date: 5/16/2022 11:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		Thulasi
-- Create date: 6/27/2021
-- Description:	To List the Payment Info
-- =============================================
CREATE PROCEDURE [dbo].[usp_List_PaymentInfo]
	@PayId bigint,
	@AdId bigint,
	@MakeId bigint,
	@ModelId bigint,
	@VersionId bigint,
	@FuelType bigint,
	@UserId bigint,
	@UserType bigint,
	@VehicleStatus bigint,
	@StartDate date,
	@EndDate date
AS
BEGIN
	Declare @SQLQuery AS NVarchar(4000)
    Declare @ParamDefinition AS NVarchar(2000) 

Set @SQLQuery = ' select * from View_PaymentInfo where IsDeleted=0 and IsActive=1' 

IF @PayId!=0
	BEGIN
	    Set @SQLQuery =  @SQLQuery +  '   and PayId=@PayId      ' 
	END

	IF @AdId!=0
	BEGIN
	    Set @SQLQuery =  @SQLQuery +  '   and AdId=@AdId      ' 
	END

	IF @ModelId!=0
	BEGIN
	    Set @SQLQuery =  @SQLQuery +  '   and ModelId=@ModelId      ' 
	END

	IF @MakeId!=0
	BEGIN
	    Set @SQLQuery =  @SQLQuery +  '   and MakeId=@MakeId      ' 
	END

	IF @VersionId!=0
	BEGIN
	    Set @SQLQuery =  @SQLQuery +  '   and VersionId=@VersionId      ' 
	END

	IF @FuelType!=0
	BEGIN
	    Set @SQLQuery =  @SQLQuery +  '   and FuelType=@FuelType      ' 
	END

	IF @UserId!=0
	BEGIN
	    Set @SQLQuery =  @SQLQuery +  '   and UserId=@UserId      ' 
	END

	IF @UserType!=0
	BEGIN
	    Set @SQLQuery =  @SQLQuery +  '   and UserType=@UserType      ' 
	END

	IF @VehicleStatus!=0
	BEGIN
	    Set @SQLQuery =  @SQLQuery +  '   and VehicleStatus=@VehicleStatus      ' 
	END

	IF @StartDate!='1/1/1900' AND @EndDate='1/1/1900'
	BEGIN
	    Set @SQLQuery =  @SQLQuery +  '   and (CONVERT(DATE,PurchaseDate) BETWEEN @StartDate AND   @EndDate)    ' 
	END

	SET @SQLQuery= @SQLQuery + 'order by  PayId'

Set @ParamDefinition =      '@PayId bigint,@AdId bigint,@MakeId bigint,@ModelId bigint,@VersionId bigint,@FuelType bigint,@UserId bigint,	@UserType bigint,@VehicleStatus bigint,	@StartDate date,@EndDate date'

Execute sp_executesql  @SQLQuery,@ParamDefinition,@PayId,@AdId,@MakeId,@ModelId,@VersionId,@FuelType,@UserId,@UserType,@VehicleStatus,@StartDate,@EndDate
END

GO
/****** Object:  StoredProcedure [dbo].[usp_List_PaymentMaster]    Script Date: 5/16/2022 11:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



  
  
  
  
-- =============================================  
-- Author:  Thulasi  
-- Create date: 5/21/2021
-- Description: To List the Advance Details  
-- =============================================  
CREATE PROCEDURE [dbo].[usp_List_PaymentMaster]  
@PayId	bigint,
@AdId	bigint,
@CustomerId	bigint

AS  
BEGIN  
 Declare @SQLQuery AS NVarchar(4000)  
    Declare @ParamDefinition AS NVarchar(2000)   
  
Set @SQLQuery = ' select * from View_PaymentMaster where IsDeleted=0 and IsActive=1'   
  
 IF @PayId!=0  
 BEGIN  
     Set @SQLQuery =  @SQLQuery +  '   and PayId=@PayId      '   
 END  

IF @AdId!=0  
 BEGIN  
     Set @SQLQuery =  @SQLQuery +  '   and AdId=@AdId      '   
 END  
  
 IF @CustomerId!=0  
 BEGIN  
     Set @SQLQuery =  @SQLQuery +  '   and CustomerId=@CustomerId      '   
 END  
  
 SET @SQLQuery= @SQLQuery + 'order by  PayId desc'  
  
Set @ParamDefinition =      '@PayId	bigint,@AdId	bigint,@CustomerId	bigint,
'  
  
Execute sp_executesql  @SQLQuery,@ParamDefinition,@PayId,@AdId,@CustomerId
END  

GO
/****** Object:  StoredProcedure [dbo].[usp_List_PostAds]    Script Date: 5/16/2022 11:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  
    
    
-- =============================================    
-- Author:  Dhruv    
-- Create date: 4/9/2021    
-- Description: To List the Posted Ads    
-- =============================================    
CREATE PROCEDURE [dbo].[usp_List_PostAds]    
@AdId bigint,    
    @MakeId bigint,    
 @ModelId bigint,    
 @VersionId bigint,    
 @FuelType bigint,    
 @FromYear bigint,  
 @ToYear bigint,  
 @VehicleStatus bigint,    
 @StartDate date,    
 @EndDate date,  
 @MinPrice decimal(18,2),  
 @MaxPrice decimal(18,2),
 @CustomerId bigint
AS    
BEGIN    
 Declare @SQLQuery AS NVarchar(4000)    
    Declare @ParamDefinition AS NVarchar(2000)     
    
Set @SQLQuery = ' select * from View_PostAds where IsDeleted=0 and IsActive=1'     
  
 IF @AdId!=0    
BEGIN    
 Set @SQLQuery =  @SQLQuery +  '   and AdId=@AdId      '     
END    
  
IF @MakeId!=0    
BEGIN    
 Set @SQLQuery =  @SQLQuery +  '   and MakeId=@MakeId      '     
END    
    
IF @ModelId!=0    
BEGIN    
 Set @SQLQuery =  @SQLQuery +  '   and ModelId=@ModelId      '     
END    
    
IF @VersionId!=0    
BEGIN    
 Set @SQLQuery =  @SQLQuery +  '   and VersionId=@VersionId      '     
END    
    
IF @FuelType!=0    
BEGIN    
 Set @SQLQuery =  @SQLQuery +  '   and FuelType=@FuelType      '     
END    
    
IF @VehicleStatus!=0    
BEGIN    
 Set @SQLQuery =  @SQLQuery +  '   and VehicleStatus=@VehicleStatus      '     
END    
    
  IF @FromYear!=0 and @ToYear !=0  
 BEGIN          
     Set @SQLQuery =  @SQLQuery +  '   and VehicleYear between @FromYear and @ToYear      '           
 END    
  
   IF @MinPrice!=0 or @MaxPrice !=0  
 BEGIN          
     Set @SQLQuery =  @SQLQuery +  '   and VehiclePrice between @MinPrice and @MaxPrice      '           
 END    
  
IF @StartDate!='1/1/1900' and @EndDate !='1/1/1900'        
 BEGIN          
     Set @SQLQuery =  @SQLQuery +  '   and Convert(date,AddedTime) between @StartDate and @EndDate      '           
 END   
 
 IF @CustomerId!=0    
BEGIN    
 Set @SQLQuery =  @SQLQuery +  '   and CustomerId=@CustomerId      '     
END   
 
    
SET @SQLQuery= @SQLQuery + 'order by  AdId desc'    
    
Set @ParamDefinition =      '@AdId bigint,@MakeId bigint, @ModelId bigint, @VersionId bigint, @FuelType bigint, @FromYear bigint,  
 @ToYear bigint, @VehicleStatus bigint, @StartDate date, @EndDate date, @MinPrice decimal(18,2), @MaxPrice decimal(18,2),@CustomerId bigint'    

Execute sp_executesql  @SQLQuery,@ParamDefinition,@AdId,@MakeId,@ModelId,@VersionId,@FuelType, @FromYear, @ToYear,@VehicleStatus,@StartDate,@EndDate,@MinPrice,@MaxPrice,@CustomerId  
END    

GO
/****** Object:  StoredProcedure [dbo].[usp_List_PostRequirement]    Script Date: 5/16/2022 11:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

  
    
    
-- =============================================    
-- Author:  Dhruv    
-- Create date: 4/13/2021    
-- Description: To List the Posted Ads    
-- =============================================    
CREATE PROCEDURE [dbo].[usp_List_PostRequirement]    
@PostId bigint,    
 @MakeId bigint,    
 @ModelId bigint,    
 @VersionId bigint,  
 @Keyword varchar(500),  
 @FromDate date,    
 @ToDate date    
AS    
BEGIN    
 Declare @SQLQuery AS NVarchar(4000)    
    Declare @ParamDefinition AS NVarchar(2000)     
    
Set @SQLQuery = ' select * from View_PostRequirement where IsDeleted=0 and IsActive=1'     
    
  IF @PostId!=0    
BEGIN    
 Set @SQLQuery =  @SQLQuery +  '   and PostId=@PostId      '     
END    
  
IF @MakeId!=0    
BEGIN    
 Set @SQLQuery =  @SQLQuery +  '   and MakeId=@MakeId      '     
END    
    
IF @ModelId!=0    
BEGIN    
 Set @SQLQuery =  @SQLQuery +  '   and ModelId=@ModelId      '     
END    
    
IF @VersionId!=0    
BEGIN    
 Set @SQLQuery =  @SQLQuery +  '   and VersionId=@VersionId      '     
END   
  
IF @Keyword!=''  
BEGIN    
 Set @SQLQuery =  @SQLQuery +  '   and (ContactNo LIKE @Keyword OR UserName LIKE @Keyword OR UserAddress LIKE @Keyword)  '     
END   
  
IF @FromDate!='1/1/1900' and @ToDate !='1/1/1900'        
 BEGIN          
     Set @SQLQuery =  @SQLQuery +  '   and Convert(date,AddedTime) between @FromDate and @ToDate      '           
 END      
    
SET @SQLQuery= @SQLQuery + 'order by  PostId desc'    
    
Set @ParamDefinition =      '@PostId bigint,@MakeId bigint, @ModelId bigint, @VersionId bigint,@Keyword varchar(500),@FromDate date,@ToDate date'    
    
Execute sp_executesql  @SQLQuery,@ParamDefinition,@PostId,@MakeId,@ModelId,@VersionId,@Keyword,@FromDate,@ToDate  
END    

GO
/****** Object:  StoredProcedure [dbo].[usp_List_PurchaseInfo]    Script Date: 5/16/2022 11:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		Thulasi
-- Create date: 4/26/2021
-- Description:	To List the Purchase Info
-- =============================================
CREATE PROCEDURE [dbo].[usp_List_PurchaseInfo]
	@PurchaseId bigint,
	@AdId bigint,
	@MakeId bigint,
	@ModelId bigint,
	@VersionId bigint,
	@FuelType bigint,
	@UserId bigint,
	@UserType bigint,
	@VehicleStatus bigint,
	@StartDate date,
	@EndDate date
AS
BEGIN
	Declare @SQLQuery AS NVarchar(4000)
    Declare @ParamDefinition AS NVarchar(2000) 

Set @SQLQuery = ' select * from View_PurchaseInfo where IsDeleted=0 and IsActive=1' 

IF @PurchaseId!=0
	BEGIN
	    Set @SQLQuery =  @SQLQuery +  '   and PurchaseId=@PurchaseId      ' 
	END

	IF @AdId!=0
	BEGIN
	    Set @SQLQuery =  @SQLQuery +  '   and AdId=@AdId      ' 
	END

	IF @ModelId!=0
	BEGIN
	    Set @SQLQuery =  @SQLQuery +  '   and ModelId=@ModelId      ' 
	END

	IF @MakeId!=0
	BEGIN
	    Set @SQLQuery =  @SQLQuery +  '   and MakeId=@MakeId      ' 
	END

	IF @VersionId!=0
	BEGIN
	    Set @SQLQuery =  @SQLQuery +  '   and VersionId=@VersionId      ' 
	END

	IF @FuelType!=0
	BEGIN
	    Set @SQLQuery =  @SQLQuery +  '   and FuelType=@FuelType      ' 
	END

	IF @UserId!=0
	BEGIN
	    Set @SQLQuery =  @SQLQuery +  '   and UserId=@UserId      ' 
	END

	IF @UserType!=0
	BEGIN
	    Set @SQLQuery =  @SQLQuery +  '   and UserType=@UserType      ' 
	END

	IF @VehicleStatus!=0
	BEGIN
	    Set @SQLQuery =  @SQLQuery +  '   and VehicleStatus=@VehicleStatus      ' 
	END

	IF @StartDate!='1/1/1900' AND @EndDate='1/1/1900'
	BEGIN
	    Set @SQLQuery =  @SQLQuery +  '   and (CONVERT(DATE,PurchaseDate) BETWEEN @StartDate AND   @EndDate)    ' 
	END

	SET @SQLQuery= @SQLQuery + 'order by  PurchaseId'

Set @ParamDefinition =      '@PurchaseId bigint,@AdId bigint,@MakeId bigint,@ModelId bigint,@VersionId bigint,@FuelType bigint,@UserId bigint,	@UserType bigint,@VehicleStatus bigint,	@StartDate date,@EndDate date'

Execute sp_executesql  @SQLQuery,@ParamDefinition,@PurchaseId,@AdId,@MakeId,@ModelId,@VersionId,@FuelType,@UserId,@UserType,@VehicleStatus,@StartDate,@EndDate
END

GO
/****** Object:  StoredProcedure [dbo].[usp_List_QuotationDetails]    Script Date: 5/16/2022 11:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


  
  
  
  
-- =============================================  
-- Author:  Thulasi  
-- Create date: 5/21/2021
-- Description: To List the Advance Details  
-- =============================================  
CREATE PROCEDURE [dbo].[usp_List_QuotationDetails]  
@QuoteId bigint,  
@AdId bigint,   
 @CustomerId bigint,  
 @StartDate date,  
 @EndDate date  
AS  
BEGIN  
 Declare @SQLQuery AS NVarchar(4000)  
    Declare @ParamDefinition AS NVarchar(2000)   
  
Set @SQLQuery = ' select * from View_QuotationDetails where IsDeleted=0 and IsActive=1'   
  
IF @AdId!=0  
 BEGIN  
     Set @SQLQuery =  @SQLQuery +  '   and AdId=@AdId      '   
 END  
  
 IF @QuoteId!=0  
 BEGIN  
     Set @SQLQuery =  @SQLQuery +  '   and QuoteId=@QuoteId      '   
 END  
  
 IF @CustomerId!=0  
 BEGIN  
     Set @SQLQuery =  @SQLQuery +  '   and CustomerId=@CustomerId      '   
 END  
  

   
 IF @StartDate!='1/1/1900' AND @EndDate!='1/1/1900'  
 BEGIN  
     Set @SQLQuery =  @SQLQuery +  '   and (CONVERT(DATE,PurchaseDate) BETWEEN @StartDate AND @EndDate)    '   
 END  
  
 SET @SQLQuery= @SQLQuery + 'order by  QuoteId'  
  
Set @ParamDefinition =      '@AdId bigint,@QuoteId bigint,@CustomerId bigint, @StartDate date,@EndDate date'  
  
Execute sp_executesql  @SQLQuery,@ParamDefinition,@AdId,@QuoteId,@CustomerId,@StartDate,@EndDate  
END  

GO
/****** Object:  StoredProcedure [dbo].[usp_List_SourceMaster]    Script Date: 5/16/2022 11:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Dhruv
-- Create date: 4/15/2021
-- Description:	To List the Source Master
-- =============================================
CREATE PROCEDURE [dbo].[usp_List_SourceMaster]
	@SourceId bigint
AS
BEGIN
	Declare @SQLQuery AS NVarchar(4000)
    Declare @ParamDefinition AS NVarchar(2000) 

Set @SQLQuery = ' select * from View_SourceMaster where IsDeleted=0 and IsActive=1' 

IF @SourceId!=0
	BEGIN
	    Set @SQLQuery =  @SQLQuery +  '   and SourceId=@SourceId      ' 
	END


	SET @SQLQuery= @SQLQuery + 'order by  SourceSequence'

Set @ParamDefinition =      '@SourceId bigint'

Execute sp_executesql  @SQLQuery,@ParamDefinition,@SourceId
END

GO
/****** Object:  StoredProcedure [dbo].[usp_List_StaffMaster]    Script Date: 5/16/2022 11:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

  
  
-- =============================================  
-- Author:  Dhruv  
-- Create date: 4/28/2021  
-- Description: To List the Staff Master
-- =============================================  
CREATE PROCEDURE [dbo].[usp_List_StaffMaster]  
@StaffId bigint,  
 @RoleId bigint,
 @Keyword varchar(500)
AS  
BEGIN  
 Declare @SQLQuery AS NVarchar(4000)  
    Declare @ParamDefinition AS NVarchar(2000)   
  
Set @SQLQuery = ' select * from View_StaffMaster where IsDeleted=0 and IsActive=1'   
  
  IF @StaffId!=0  
BEGIN  
 Set @SQLQuery =  @SQLQuery +  '   and StaffId=@StaffId      '   
END  

IF @RoleId!=0  
BEGIN  
 Set @SQLQuery =  @SQLQuery +  '   and RoleId=@RoleId      '   
END  

IF @Keyword!=''
BEGIN  
 Set @SQLQuery =  @SQLQuery +  '   and (StaffName LIKE @Keyword)  '   
END 
  
SET @SQLQuery= @SQLQuery + 'order by  StaffId'  
  
Set @ParamDefinition =      '@StaffId bigint,@RoleId bigint,@Keyword varchar(500)'  
  
Execute sp_executesql  @SQLQuery,@ParamDefinition,@StaffId,@RoleId,@Keyword
END  

GO
/****** Object:  StoredProcedure [dbo].[usp_List_StateMaster]    Script Date: 5/16/2022 11:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Dhruv
-- Create date: 4/9/2021
-- Description:	To List the State Master
-- =============================================
CREATE PROCEDURE [dbo].[usp_List_StateMaster]
	@StateId bigint
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	IF @StateId!=0
	BEGIN
  SELECT * FROM tblStateMaster WHERE StateId=@StateId AND IsDeleted=0
  END

  ELSE
  BEGIN
  SELECT * FROM tblStateMaster WHERE IsDeleted=0
  END
END

GO
/****** Object:  StoredProcedure [dbo].[usp_List_VersionMaster]    Script Date: 5/16/2022 11:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Dhruv
-- Create date: 4/7/2021
-- Description:	To List the District Master
-- =============================================
CREATE PROCEDURE [dbo].[usp_List_VersionMaster]
	@VersionId bigint,
	@ModelId bigint,
	@MakeId bigint
AS
BEGIN
	Declare @SQLQuery AS NVarchar(4000)
    Declare @ParamDefinition AS NVarchar(2000) 

Set @SQLQuery = ' select * from View_VersionMaster where IsDeleted=0 and IsActive=1' 

IF @VersionId!=0
	BEGIN
	    Set @SQLQuery =  @SQLQuery +  '   and VersionId=@VersionId      ' 
	END

	IF @ModelId!=0
	BEGIN
	    Set @SQLQuery =  @SQLQuery +  '   and ModelId=@ModelId      ' 
	END

	IF @MakeId!=0
	BEGIN
	    Set @SQLQuery =  @SQLQuery +  '   and MakeId=@MakeId      ' 
	END


	SET @SQLQuery= @SQLQuery + 'order by  VersionSequence'

Set @ParamDefinition =      '@VersionId bigint,@ModelId bigint,@MakeId bigint'

Execute sp_executesql  @SQLQuery,@ParamDefinition,@VersionId,@ModelId,@MakeId
END

GO
/****** Object:  StoredProcedure [dbo].[usp_ListAdminLogin]    Script Date: 5/16/2022 11:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		Dhruv
-- Create date: 4/5/2021
-- Description:	To List the Admin LOGIN
-- =============================================
CREATE PROCEDURE [dbo].[usp_ListAdminLogin]
	-- Add the parameters for the stored procedure here
	@AdmId bigint
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Select * from tblAdminLogin where AdmId=@AdmId and IsDeleted=0
END

GO
/****** Object:  StoredProcedure [dbo].[usp_ValidateAdminLogin]    Script Date: 5/16/2022 11:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Dhruv
-- Create date: 4/5/2021
-- Description:	To Validate the Admin LOGIN
-- =============================================
CREATE PROCEDURE [dbo].[usp_ValidateAdminLogin]
	-- Add the parameters for the stored procedure here
	@LoginId varchar(50),
	@LoginPassword varchar(50)
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Select AdmId,LoginId,LoginName,LoginPassword,LastLogin,IpAddress,IsActive from tblAdminLogin where LoginId=@LoginId and LoginPassword COLLATE Latin1_general_CS_AS =@LoginPassword
END

GO
/****** Object:  StoredProcedure [dbo].[usp_ValidateCustomerLogin]    Script Date: 5/16/2022 11:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		Dhruv
-- Create date: 4/5/2021
-- Description:	To Validate the Admin LOGIN
-- =============================================
CREATE PROCEDURE [dbo].[usp_ValidateCustomerLogin]
	-- Add the parameters for the stored procedure here
	@MobileNo varchar(50)
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Select * from View_CustomerMaster where MobileNo=@MobileNo and IsDeleted=0 and IsActive=1
END

GO
/****** Object:  StoredProcedure [dbo].[usp_ValidateStaffLogin]    Script Date: 5/16/2022 11:27:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		Thulasi
-- Create date: 4/5/2021
-- Description:	To Validate the Staff LOGIN
-- =============================================
CREATE PROCEDURE [dbo].[usp_ValidateStaffLogin]
	-- Add the parameters for the stored procedure here
	@LoginId varchar(50),
	@LoginPassword varchar(50)
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Select StaffId,StaffName,LoginId,LoginPassword,StaffPic,IsActive,RoleId from tblStaffMaster where LoginId=@LoginId and LoginPassword COLLATE Latin1_general_CS_AS =@LoginPassword
END

GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "tblAdCarImages"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 207
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 7
         End
         Begin Table = "View_PostAds"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 136
               Right = 418
            End
            DisplayFlags = 280
            TopColumn = 29
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_AdCarImages'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_AdCarImages'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "tblAdCarOwnerDetails"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 10
         End
         Begin Table = "View_PostAds"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 136
               Right = 418
            End
            DisplayFlags = 280
            TopColumn = 29
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_AdCarOwnerDetails'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_AdCarOwnerDetails'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "tblAdCarVideos"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 6
         End
         Begin Table = "View_PostAds"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 136
               Right = 485
            End
            DisplayFlags = 280
            TopColumn = 37
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_AdCarVideos'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_AdCarVideos'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "tblAdvanceDetails"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 218
            End
            DisplayFlags = 280
            TopColumn = 12
         End
         Begin Table = "View_CustomerMaster"
            Begin Extent = 
               Top = 20
               Left = 918
               Bottom = 150
               Right = 1106
            End
            DisplayFlags = 280
            TopColumn = 23
         End
         Begin Table = "View_PostAds"
            Begin Extent = 
               Top = 4
               Left = 354
               Bottom = 134
               Right = 533
            End
            DisplayFlags = 280
            TopColumn = 32
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_AdvanceDetails'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_AdvanceDetails'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "tblBillDetails"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 219
            End
            DisplayFlags = 280
            TopColumn = 9
         End
         Begin Table = "View_PostAds"
            Begin Extent = 
               Top = 7
               Left = 604
               Bottom = 137
               Right = 783
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "View_CustomerMaster"
            Begin Extent = 
               Top = 96
               Left = 807
               Bottom = 226
               Right = 995
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_BillDetails'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_BillDetails'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "tblBudgetMaster"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 3
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_BudgetMaster'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_BudgetMaster'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "tblCategoryMaster"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 226
            End
            DisplayFlags = 280
            TopColumn = 5
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_CategoryMaster'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_CategoryMaster'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "tblCategoryMaster"
            Begin Extent = 
               Top = 6
               Left = 249
               Bottom = 136
               Right = 437
            End
            DisplayFlags = 280
            TopColumn = 5
         End
         Begin Table = "tblCustomerMaster"
            Begin Extent = 
               Top = 57
               Left = 20
               Bottom = 187
               Right = 203
            End
            DisplayFlags = 280
            TopColumn = 12
         End
         Begin Table = "tblSourceMaster"
            Begin Extent = 
               Top = 6
               Left = 485
               Bottom = 136
               Right = 661
            End
            DisplayFlags = 280
            TopColumn = 1
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_CustomerMaster'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_CustomerMaster'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "tblDistrictMaster"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 5
         End
         Begin Table = "tblStateMaster"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 136
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 4
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_DistrictMaster'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_DistrictMaster'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "tblDocumentDetails"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 211
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblDocumentMaster"
            Begin Extent = 
               Top = 6
               Left = 249
               Bottom = 136
               Right = 445
            End
            DisplayFlags = 280
            TopColumn = 3
         End
         Begin Table = "View_PostAds"
            Begin Extent = 
               Top = 6
               Left = 483
               Bottom = 136
               Right = 662
            End
            DisplayFlags = 280
            TopColumn = 32
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_DocumentDetails'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_DocumentDetails'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "tblDocumentMaster"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 234
            End
            DisplayFlags = 280
            TopColumn = 3
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_DocumentMaster'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_DocumentMaster'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "tblExpenseDetails"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 200
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 6
         End
         Begin Table = "View_ExpenseMaster"
            Begin Extent = 
               Top = 121
               Left = 303
               Bottom = 251
               Right = 478
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "View_PostAds"
            Begin Extent = 
               Top = 101
               Left = 539
               Bottom = 231
               Right = 718
            End
            DisplayFlags = 280
            TopColumn = 32
         End
         Begin Table = "View_CustomerMaster"
            Begin Extent = 
               Top = 21
               Left = 789
               Bottom = 151
               Right = 977
            End
            DisplayFlags = 280
            TopColumn = 22
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_ExpenseDetails'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_ExpenseDetails'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "tblExpenseDetails"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 200
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 6
         End
         Begin Table = "View_PostAds"
            Begin Extent = 
               Top = 101
               Left = 539
               Bottom = 231
               Right = 718
            End
            DisplayFlags = 280
            TopColumn = 32
         End
         Begin Table = "View_CustomerMaster"
            Begin Extent = 
               Top = 21
               Left = 789
               Bottom = 151
               Right = 977
            End
            DisplayFlags = 280
            TopColumn = 22
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_ExpenseDetailsNew'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_ExpenseDetailsNew'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "tblExpenseMaster"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 213
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_ExpenseMaster'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_ExpenseMaster'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "tblFollowUpStatus"
            Begin Extent = 
               Top = 6
               Left = 260
               Bottom = 136
               Right = 435
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblFollowUpDetails"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 222
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "View_CustomerMaster"
            Begin Extent = 
               Top = 6
               Left = 473
               Bottom = 136
               Right = 661
            End
            DisplayFlags = 280
            TopColumn = 22
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_FollowUpDetails'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_FollowUpDetails'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "tblFollowUpStatus"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 213
            End
            DisplayFlags = 280
            TopColumn = 5
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_FollowUpStatus'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_FollowUpStatus'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "tblFuelMaster"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 5
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_FuelMaster'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_FuelMaster'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[27] 4[31] 2[24] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "tblInsuranceInfo"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 5
         End
         Begin Table = "View_PostAds"
            Begin Extent = 
               Top = 169
               Left = 286
               Bottom = 299
               Right = 465
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblCustomerMaster"
            Begin Extent = 
               Top = 6
               Left = 463
               Bottom = 136
               Right = 646
            End
            DisplayFlags = 280
            TopColumn = 14
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_InsuranceInfo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_InsuranceInfo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "tblModelMaster"
            Begin Extent = 
               Top = 6
               Left = 454
               Bottom = 136
               Right = 628
            End
            DisplayFlags = 280
            TopColumn = 2
         End
         Begin Table = "tblMakeMaster"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 159
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblVersionMaster"
            Begin Extent = 
               Top = 6
               Left = 666
               Bottom = 136
               Right = 845
            End
            DisplayFlags = 280
            TopColumn = 3
         End
         Begin Table = "tblInsuranceMaster"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_InsuranceMaster'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_InsuranceMaster'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "tblMakeMaster"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 5
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_MakeMaster'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_MakeMaster'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "tblMakeMaster"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 2
         End
         Begin Table = "tblModelMaster"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 136
               Right = 420
            End
            DisplayFlags = 280
            TopColumn = 6
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_ModelMaster'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_ModelMaster'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "tblPaymentInfo"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 8
         End
         Begin Table = "View_PostAds"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 136
               Right = 485
            End
            DisplayFlags = 280
            TopColumn = 37
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_PaymentInfo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_PaymentInfo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "tblPaymentMaster"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 219
            End
            DisplayFlags = 280
            TopColumn = 8
         End
         Begin Table = "View_PostAds"
            Begin Extent = 
               Top = 6
               Left = 257
               Bottom = 136
               Right = 496
            End
            DisplayFlags = 280
            TopColumn = 37
         End
         Begin Table = "tblCustomerMaster"
            Begin Extent = 
               Top = 6
               Left = 534
               Bottom = 136
               Right = 717
            End
            DisplayFlags = 280
            TopColumn = 15
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_PaymentMaster'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_PaymentMaster'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "tblModelMaster"
            Begin Extent = 
               Top = 133
               Left = 467
               Bottom = 263
               Right = 641
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "tblMakeMaster"
            Begin Extent = 
               Top = 127
               Left = 256
               Bottom = 318
               Right = 426
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "tblVersionMaster"
            Begin Extent = 
               Top = 6
               Left = 668
               Bottom = 136
               Right = 847
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "tblPostAds"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 195
               Right = 210
            End
            DisplayFlags = 280
            TopColumn = 20
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 3990
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_PostAds'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_PostAds'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = -21
      End
      Begin Tables = 
         Begin Table = "tblMakeMaster"
            Begin Extent = 
               Top = 5
               Left = 243
               Bottom = 135
               Right = 413
            End
            DisplayFlags = 280
            TopColumn = 5
         End
         Begin Table = "tblModelMaster"
            Begin Extent = 
               Top = 19
               Left = 448
               Bottom = 149
               Right = 622
            End
            DisplayFlags = 280
            TopColumn = 2
         End
         Begin Table = "tblVersionMaster"
            Begin Extent = 
               Top = 43
               Left = 655
               Bottom = 173
               Right = 834
            End
            DisplayFlags = 280
            TopColumn = 2
         End
         Begin Table = "tblPostRequirement"
            Begin Extent = 
               Top = 19
               Left = 43
               Bottom = 178
               Right = 209
            End
            DisplayFlags = 280
            TopColumn = 15
         End
         Begin Table = "tblFuelMaster"
            Begin Extent = 
               Top = 6
               Left = 872
               Bottom = 136
               Right = 1042
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblCustomerMaster"
            Begin Extent = 
               Top = 138
               Left = 247
               Bottom = 268
               Right = 430
            End
            DisplayFlags = 280
            TopColumn = 8
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin Column' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_PostRequirement'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'Widths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_PostRequirement'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_PostRequirement'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "tblPurchaseInfo"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 219
            End
            DisplayFlags = 280
            TopColumn = 11
         End
         Begin Table = "View_PostAds"
            Begin Extent = 
               Top = 6
               Left = 257
               Bottom = 136
               Right = 436
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_PurchaseInfo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_PurchaseInfo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[56] 4[19] 2[7] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "tblQuotationDetails"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 9
         End
         Begin Table = "View_CustomerMaster"
            Begin Extent = 
               Top = 127
               Left = 629
               Bottom = 257
               Right = 817
            End
            DisplayFlags = 280
            TopColumn = 23
         End
         Begin Table = "View_PostAds"
            Begin Extent = 
               Top = 0
               Left = 444
               Bottom = 130
               Right = 623
            End
            DisplayFlags = 280
            TopColumn = 32
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_QuotationDetails'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_QuotationDetails'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "tblSourceMaster"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 214
            End
            DisplayFlags = 280
            TopColumn = 5
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_SourceMaster'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_SourceMaster'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "tblStaffMaster"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 136
               Right = 419
            End
            DisplayFlags = 280
            TopColumn = 17
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_StaffMaster'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_StaffMaster'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "tblVersionMaster"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 217
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "View_ModelMaster"
            Begin Extent = 
               Top = 6
               Left = 255
               Bottom = 136
               Right = 429
            End
            DisplayFlags = 280
            TopColumn = 10
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_VersionMaster'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_VersionMaster'
GO
USE [master]
GO
ALTER DATABASE [Cardealer] SET  READ_WRITE 
GO
