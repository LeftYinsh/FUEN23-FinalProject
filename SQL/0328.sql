USE [master]
GO
/****** Object:  Database [FinalProject]    Script Date: 3/28/2023 10:31:13 PM ******/
CREATE DATABASE [FinalProject]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FinalProject', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\FinalProject.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'FinalProject_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\FinalProject_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [FinalProject] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FinalProject].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FinalProject] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FinalProject] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FinalProject] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FinalProject] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FinalProject] SET ARITHABORT OFF 
GO
ALTER DATABASE [FinalProject] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [FinalProject] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FinalProject] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FinalProject] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FinalProject] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FinalProject] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FinalProject] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FinalProject] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FinalProject] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FinalProject] SET  DISABLE_BROKER 
GO
ALTER DATABASE [FinalProject] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FinalProject] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FinalProject] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FinalProject] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FinalProject] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FinalProject] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FinalProject] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FinalProject] SET RECOVERY FULL 
GO
ALTER DATABASE [FinalProject] SET  MULTI_USER 
GO
ALTER DATABASE [FinalProject] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FinalProject] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FinalProject] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FinalProject] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [FinalProject] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [FinalProject] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'FinalProject', N'ON'
GO
ALTER DATABASE [FinalProject] SET QUERY_STORE = OFF
GO
USE [FinalProject]
GO
/****** Object:  Table [dbo].[tCoupon]    Script Date: 3/28/2023 10:31:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tCoupon](
	[fSID] [int] IDENTITY(1,1) NOT NULL,
	[fCode] [nvarchar](10) NOT NULL,
	[fStartDate] [smalldatetime] NOT NULL,
	[fEndDate] [smalldatetime] NOT NULL,
	[fRatio] [tinyint] NOT NULL,
	[fAvailableTimes] [int] NOT NULL,
	[fUsedTimes] [int] NOT NULL,
 CONSTRAINT [PK_tCoupon_1] PRIMARY KEY CLUSTERED 
(
	[fCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tCustomer]    Script Date: 3/28/2023 10:31:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tCustomer](
	[fID] [int] IDENTITY(1,1) NOT NULL,
	[fLastName] [nvarchar](20) NOT NULL,
	[fFirstName] [nvarchar](20) NOT NULL,
	[fGender] [tinyint] NOT NULL,
	[fTel] [nvarchar](20) NOT NULL,
	[fMobile] [nvarchar](20) NOT NULL,
	[fEmail] [nvarchar](50) NOT NULL,
	[fPassword] [nvarchar](20) NOT NULL,
	[fBirthDate] [smalldatetime] NOT NULL,
	[fPoint] [int] NOT NULL,
	[fBlackList] [bit] NOT NULL,
	[fRemark] [nvarchar](255) NULL,
	[fCreationDate] [smalldatetime] NOT NULL,
	[fLastUpdateDate] [smalldatetime] NOT NULL,
 CONSTRAINT [PK_tCustomer] PRIMARY KEY CLUSTERED 
(
	[fID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tCustomerOrderSheet]    Script Date: 3/28/2023 10:31:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tCustomerOrderSheet](
	[fID] [int] IDENTITY(1,1) NOT NULL,
	[fCustomerID] [int] NOT NULL,
	[fCouponCode] [nvarchar](10) NULL,
	[fCreationDate] [smalldatetime] NOT NULL,
	[fCheckedDate] [smalldatetime] NULL,
	[fOrderSheetCancel] [bit] NOT NULL,
 CONSTRAINT [PK_tOrderSheet] PRIMARY KEY CLUSTERED 
(
	[fID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tGender]    Script Date: 3/28/2023 10:31:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tGender](
	[fID] [tinyint] NOT NULL,
	[fDescription] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_tGender] PRIMARY KEY CLUSTERED 
(
	[fID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tManager]    Script Date: 3/28/2023 10:31:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tManager](
	[fSID] [int] IDENTITY(1,1) NOT NULL,
	[fAccount] [nvarchar](20) NOT NULL,
	[fPassword] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_tManager_1] PRIMARY KEY CLUSTERED 
(
	[fAccount] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tOrderDetail]    Script Date: 3/28/2023 10:31:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tOrderDetail](
	[fID] [int] IDENTITY(1,1) NOT NULL,
	[fCustomerOrderSheetID] [int] NOT NULL,
	[fProductID] [int] NOT NULL,
	[fPurchaseQuantity] [int] NOT NULL,
	[fTravelDate] [smalldatetime] NOT NULL,
 CONSTRAINT [PK_tOrderDetail] PRIMARY KEY CLUSTERED 
(
	[fID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tPeriod]    Script Date: 3/28/2023 10:31:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tPeriod](
	[fID] [tinyint] NOT NULL,
	[fDescription] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_tPeriod] PRIMARY KEY CLUSTERED 
(
	[fID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tProduct]    Script Date: 3/28/2023 10:31:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tProduct](
	[fID] [int] IDENTITY(1,1) NOT NULL,
	[fName] [nvarchar](50) NOT NULL,
	[fPeriodID] [tinyint] NOT NULL,
	[fCost] [money] NOT NULL,
	[fPrice] [money] NOT NULL,
	[fStocks] [int] NOT NULL,
	[fDescription] [nvarchar](255) NOT NULL,
	[fImagePath] [nvarchar](255) NOT NULL,
	[fMinParticipants] [tinyint] NOT NULL,
	[fMaxParticipants] [tinyint] NOT NULL,
	[fAssemblyPoint] [nvarchar](100) NOT NULL,
	[fStartDate] [smalldatetime] NOT NULL,
	[fEndDate] [smalldatetime] NOT NULL,
	[fProviderID] [int] NOT NULL,
	[fRemoved] [bit] NOT NULL,
	[fRemark] [nvarchar](255) NULL,
	[fCreationDate] [smalldatetime] NOT NULL,
	[fLastUpdateDate] [smalldatetime] NOT NULL,
 CONSTRAINT [PK_tProduct] PRIMARY KEY CLUSTERED 
(
	[fID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tProductReport]    Script Date: 3/28/2023 10:31:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tProductReport](
	[fID] [int] IDENTITY(1,1) NOT NULL,
	[fOrderDetailID] [int] NOT NULL,
	[fReportContent] [nvarchar](500) NOT NULL,
	[fCreationDate] [smalldatetime] NOT NULL,
	[fProductID] [int] NOT NULL,
 CONSTRAINT [PK_tProductReport] PRIMARY KEY CLUSTERED 
(
	[fID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tProductReview]    Script Date: 3/28/2023 10:31:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tProductReview](
	[fID] [int] IDENTITY(1,1) NOT NULL,
	[fOrderDetailID] [int] NOT NULL,
	[fReviewContent] [nvarchar](500) NOT NULL,
	[fScore] [tinyint] NOT NULL,
	[fCreationDate] [smalldatetime] NOT NULL,
	[fProductID] [int] NOT NULL,
 CONSTRAINT [PK_tProductReview] PRIMARY KEY CLUSTERED 
(
	[fID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tProductsTag]    Script Date: 3/28/2023 10:31:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tProductsTag](
	[fSID] [int] IDENTITY(1,1) NOT NULL,
	[fProductID] [int] NOT NULL,
	[fTagID] [int] NOT NULL,
 CONSTRAINT [PK_tProductsTag] PRIMARY KEY CLUSTERED 
(
	[fSID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tProvider]    Script Date: 3/28/2023 10:31:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tProvider](
	[fID] [int] IDENTITY(1,1) NOT NULL,
	[fCompanyName] [nvarchar](50) NOT NULL,
	[fPassword] [nvarchar](20) NOT NULL,
	[fTaxID] [nchar](8) NOT NULL,
	[fFax] [nvarchar](20) NULL,
	[fOwnerName] [nvarchar](40) NOT NULL,
	[fOwnerTel] [nvarchar](20) NOT NULL,
	[fOwnerMobile] [nvarchar](20) NOT NULL,
	[fOwnerEmail] [nvarchar](50) NOT NULL,
	[fContactName] [nvarchar](40) NOT NULL,
	[fContactTel] [nvarchar](20) NOT NULL,
	[fContactMobile] [nvarchar](20) NOT NULL,
	[fContactEmail] [nvarchar](50) NOT NULL,
	[fAddress] [nvarchar](50) NOT NULL,
	[fBankName] [nvarchar](50) NOT NULL,
	[fBankDivisionName] [nvarchar](50) NOT NULL,
	[fBankAccountNumber] [nvarchar](50) NOT NULL,
	[fBankAccountName] [nvarchar](50) NOT NULL,
	[fBlackList] [bit] NOT NULL,
	[fRemark] [nvarchar](255) NULL,
	[fCreationDate] [smalldatetime] NOT NULL,
	[fLastUpdateDate] [smalldatetime] NOT NULL,
 CONSTRAINT [PK_tProvider] PRIMARY KEY CLUSTERED 
(
	[fID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tPurchaseOrderSheet]    Script Date: 3/28/2023 10:31:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tPurchaseOrderSheet](
	[fID] [int] IDENTITY(1,1) NOT NULL,
	[fOrderDetailID] [int] NOT NULL,
	[fCreationDate] [smalldatetime] NOT NULL,
 CONSTRAINT [PK_tPurchaseOrderSheet] PRIMARY KEY CLUSTERED 
(
	[fID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tShoppingCart]    Script Date: 3/28/2023 10:31:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tShoppingCart](
	[fSID] [int] IDENTITY(1,1) NOT NULL,
	[fCustomerID] [int] NOT NULL,
	[fProductID] [int] NOT NULL,
	[fPurchaseQuantity] [int] NOT NULL,
	[fTravelDate] [smalldatetime] NOT NULL,
 CONSTRAINT [PK_tShoppingCart] PRIMARY KEY CLUSTERED 
(
	[fSID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tTag]    Script Date: 3/28/2023 10:31:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tTag](
	[fID] [int] NOT NULL,
	[fDescription] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tTag] PRIMARY KEY CLUSTERED 
(
	[fID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tCoupon] ON 

INSERT [dbo].[tCoupon] ([fSID], [fCode], [fStartDate], [fEndDate], [fRatio], [fAvailableTimes], [fUsedTimes]) VALUES (1, N'triplook23', CAST(N'2023-01-01T00:00:00' AS SmallDateTime), CAST(N'2023-03-31T00:00:00' AS SmallDateTime), 90, 30, 17)
INSERT [dbo].[tCoupon] ([fSID], [fCode], [fStartDate], [fEndDate], [fRatio], [fAvailableTimes], [fUsedTimes]) VALUES (11, N'triplook50', CAST(N'2022-02-02T00:00:00' AS SmallDateTime), CAST(N'2022-02-03T00:00:00' AS SmallDateTime), 50, 1, 1)
INSERT [dbo].[tCoupon] ([fSID], [fCode], [fStartDate], [fEndDate], [fRatio], [fAvailableTimes], [fUsedTimes]) VALUES (2, N'triplook55', CAST(N'2023-01-01T00:00:00' AS SmallDateTime), CAST(N'2023-12-31T00:00:00' AS SmallDateTime), 95, 100, 27)
INSERT [dbo].[tCoupon] ([fSID], [fCode], [fStartDate], [fEndDate], [fRatio], [fAvailableTimes], [fUsedTimes]) VALUES (10, N'triplook60', CAST(N'2022-02-02T00:00:00' AS SmallDateTime), CAST(N'2022-02-03T00:00:00' AS SmallDateTime), 60, 5, 5)
INSERT [dbo].[tCoupon] ([fSID], [fCode], [fStartDate], [fEndDate], [fRatio], [fAvailableTimes], [fUsedTimes]) VALUES (5, N'triplook64', CAST(N'2023-01-01T00:00:00' AS SmallDateTime), CAST(N'2023-03-31T00:00:00' AS SmallDateTime), 80, 10, 6)
INSERT [dbo].[tCoupon] ([fSID], [fCode], [fStartDate], [fEndDate], [fRatio], [fAvailableTimes], [fUsedTimes]) VALUES (9, N'triplook66', CAST(N'2022-02-02T00:00:00' AS SmallDateTime), CAST(N'2022-02-03T00:00:00' AS SmallDateTime), 80, 10, 10)
INSERT [dbo].[tCoupon] ([fSID], [fCode], [fStartDate], [fEndDate], [fRatio], [fAvailableTimes], [fUsedTimes]) VALUES (6, N'triplook77', CAST(N'2022-09-01T00:00:00' AS SmallDateTime), CAST(N'2022-12-31T00:00:00' AS SmallDateTime), 90, 500, 249)
INSERT [dbo].[tCoupon] ([fSID], [fCode], [fStartDate], [fEndDate], [fRatio], [fAvailableTimes], [fUsedTimes]) VALUES (4, N'triplook84', CAST(N'2022-09-01T00:00:00' AS SmallDateTime), CAST(N'2022-12-31T00:00:00' AS SmallDateTime), 95, 1000, 967)
INSERT [dbo].[tCoupon] ([fSID], [fCode], [fStartDate], [fEndDate], [fRatio], [fAvailableTimes], [fUsedTimes]) VALUES (8, N'triplook99', CAST(N'2022-02-02T00:00:00' AS SmallDateTime), CAST(N'2022-02-03T00:00:00' AS SmallDateTime), 75, 5, 5)
SET IDENTITY_INSERT [dbo].[tCoupon] OFF
GO
SET IDENTITY_INSERT [dbo].[tCustomer] ON 

INSERT [dbo].[tCustomer] ([fID], [fLastName], [fFirstName], [fGender], [fTel], [fMobile], [fEmail], [fPassword], [fBirthDate], [fPoint], [fBlackList], [fRemark], [fCreationDate], [fLastUpdateDate]) VALUES (1, N'陳', N'晗運', 1, N'025522866', N'0934532944', N'sam@gmail.com', N'FHvZXq8V', CAST(N'1998-05-06T00:00:00' AS SmallDateTime), 100, 0, NULL, CAST(N'2023-01-04T00:00:00' AS SmallDateTime), CAST(N'2023-01-30T00:00:00' AS SmallDateTime))
INSERT [dbo].[tCustomer] ([fID], [fLastName], [fFirstName], [fGender], [fTel], [fMobile], [fEmail], [fPassword], [fBirthDate], [fPoint], [fBlackList], [fRemark], [fCreationDate], [fLastUpdateDate]) VALUES (3, N'黃', N'宇容', 2, N'052793704', N'0913644811', N'lin@yahoo.com', N'cqSJa8MB', CAST(N'1997-04-21T00:00:00' AS SmallDateTime), 0, 0, NULL, CAST(N'2023-01-03T00:00:00' AS SmallDateTime), CAST(N'2023-01-27T00:00:00' AS SmallDateTime))
INSERT [dbo].[tCustomer] ([fID], [fLastName], [fFirstName], [fGender], [fTel], [fMobile], [fEmail], [fPassword], [fBirthDate], [fPoint], [fBlackList], [fRemark], [fCreationDate], [fLastUpdateDate]) VALUES (4, N'林', N'勁易', 1, N'032714065', N'0961958500', N'jacob5041@hotmail.com', N'f75mLASz', CAST(N'1999-06-09T00:00:00' AS SmallDateTime), 50, 1, N'未付錢', CAST(N'2022-04-15T00:00:00' AS SmallDateTime), CAST(N'2023-01-13T00:00:00' AS SmallDateTime))
INSERT [dbo].[tCustomer] ([fID], [fLastName], [fFirstName], [fGender], [fTel], [fMobile], [fEmail], [fPassword], [fBirthDate], [fPoint], [fBlackList], [fRemark], [fCreationDate], [fLastUpdateDate]) VALUES (6, N'潘', N'諄驥', 1, N'052484487', N'0938747385', N'clyde5853@hotmail.com', N'9ZTZL8Ku', CAST(N'1998-01-17T00:00:00' AS SmallDateTime), 0, 0, NULL, CAST(N'2022-11-18T00:00:00' AS SmallDateTime), CAST(N'2022-11-18T00:00:00' AS SmallDateTime))
INSERT [dbo].[tCustomer] ([fID], [fLastName], [fFirstName], [fGender], [fTel], [fMobile], [fEmail], [fPassword], [fBirthDate], [fPoint], [fBlackList], [fRemark], [fCreationDate], [fLastUpdateDate]) VALUES (8, N'梁', N'梁菡', 2, N'048323917', N'0988841028', N'janet9932@yahoo.com', N'aTa6rd8G', CAST(N'2008-05-23T00:00:00' AS SmallDateTime), 0, 0, NULL, CAST(N'2022-06-17T00:00:00' AS SmallDateTime), CAST(N'2022-06-17T00:00:00' AS SmallDateTime))
INSERT [dbo].[tCustomer] ([fID], [fLastName], [fFirstName], [fGender], [fTel], [fMobile], [fEmail], [fPassword], [fBirthDate], [fPoint], [fBlackList], [fRemark], [fCreationDate], [fLastUpdateDate]) VALUES (9, N'王', N'王妹', 2, N'045407677', N'0911952856', N'carey4566@gmail.com', N'MRc44A27', CAST(N'1961-12-06T00:00:00' AS SmallDateTime), 150, 0, NULL, CAST(N'2022-08-19T00:00:00' AS SmallDateTime), CAST(N'2022-11-05T00:00:00' AS SmallDateTime))
INSERT [dbo].[tCustomer] ([fID], [fLastName], [fFirstName], [fGender], [fTel], [fMobile], [fEmail], [fPassword], [fBirthDate], [fPoint], [fBlackList], [fRemark], [fCreationDate], [fLastUpdateDate]) VALUES (10, N'何', N'星淑', 2, N'022319421', N'0953261827', N'janice1852@yahoo.com', N'qU2xTS56', CAST(N'1976-01-01T00:00:00' AS SmallDateTime), 300, 0, NULL, CAST(N'2022-06-01T00:00:00' AS SmallDateTime), CAST(N'2022-09-18T00:00:00' AS SmallDateTime))
INSERT [dbo].[tCustomer] ([fID], [fLastName], [fFirstName], [fGender], [fTel], [fMobile], [fEmail], [fPassword], [fBirthDate], [fPoint], [fBlackList], [fRemark], [fCreationDate], [fLastUpdateDate]) VALUES (11, N'卓', N'偉德', 1, N'066220364', N'0921392838', N'mickey5655@gmail.com', N'5hpJ873k', CAST(N'1992-02-27T00:00:00' AS SmallDateTime), 0, 0, NULL, CAST(N'2022-03-07T00:00:00' AS SmallDateTime), CAST(N'2022-04-18T00:00:00' AS SmallDateTime))
INSERT [dbo].[tCustomer] ([fID], [fLastName], [fFirstName], [fGender], [fTel], [fMobile], [fEmail], [fPassword], [fBirthDate], [fPoint], [fBlackList], [fRemark], [fCreationDate], [fLastUpdateDate]) VALUES (12, N'黃', N'千湘', 2, N'022743020', N'0934412241', N'margaret9353@gmail.com', N'9Mdu67vW', CAST(N'1972-11-28T00:00:00' AS SmallDateTime), 500, 0, NULL, CAST(N'2023-01-05T00:00:00' AS SmallDateTime), CAST(N'2023-01-07T00:00:00' AS SmallDateTime))
INSERT [dbo].[tCustomer] ([fID], [fLastName], [fFirstName], [fGender], [fTel], [fMobile], [fEmail], [fPassword], [fBirthDate], [fPoint], [fBlackList], [fRemark], [fCreationDate], [fLastUpdateDate]) VALUES (13, N'馬', N'磊禧', 1, N'049392922', N'0934532944', N'harmon9568@gmail.com', N'FHvZXq8V', CAST(N'2018-12-01T00:00:00' AS SmallDateTime), 0, 0, NULL, CAST(N'2022-09-17T00:00:00' AS SmallDateTime), CAST(N'2022-12-16T00:00:00' AS SmallDateTime))
SET IDENTITY_INSERT [dbo].[tCustomer] OFF
GO
SET IDENTITY_INSERT [dbo].[tCustomerOrderSheet] ON 

INSERT [dbo].[tCustomerOrderSheet] ([fID], [fCustomerID], [fCouponCode], [fCreationDate], [fCheckedDate], [fOrderSheetCancel]) VALUES (1, 1, N'triplook23', CAST(N'2023-01-31T00:00:00' AS SmallDateTime), CAST(N'2023-01-31T00:00:00' AS SmallDateTime), 0)
INSERT [dbo].[tCustomerOrderSheet] ([fID], [fCustomerID], [fCouponCode], [fCreationDate], [fCheckedDate], [fOrderSheetCancel]) VALUES (2, 4, NULL, CAST(N'2022-12-25T00:00:00' AS SmallDateTime), CAST(N'2022-12-31T00:00:00' AS SmallDateTime), 0)
INSERT [dbo].[tCustomerOrderSheet] ([fID], [fCustomerID], [fCouponCode], [fCreationDate], [fCheckedDate], [fOrderSheetCancel]) VALUES (3, 3, N'triplook55', CAST(N'2023-01-15T00:00:00' AS SmallDateTime), CAST(N'2023-02-03T06:45:00' AS SmallDateTime), 0)
INSERT [dbo].[tCustomerOrderSheet] ([fID], [fCustomerID], [fCouponCode], [fCreationDate], [fCheckedDate], [fOrderSheetCancel]) VALUES (5, 6, N'triplook64', CAST(N'2023-01-02T00:00:00' AS SmallDateTime), CAST(N'2023-01-19T00:00:00' AS SmallDateTime), 0)
INSERT [dbo].[tCustomerOrderSheet] ([fID], [fCustomerID], [fCouponCode], [fCreationDate], [fCheckedDate], [fOrderSheetCancel]) VALUES (6, 8, N'triplook64', CAST(N'2023-01-04T00:00:00' AS SmallDateTime), CAST(N'2023-01-09T00:00:00' AS SmallDateTime), 1)
INSERT [dbo].[tCustomerOrderSheet] ([fID], [fCustomerID], [fCouponCode], [fCreationDate], [fCheckedDate], [fOrderSheetCancel]) VALUES (7, 9, NULL, CAST(N'2023-01-05T00:00:00' AS SmallDateTime), CAST(N'2023-01-05T00:00:00' AS SmallDateTime), 0)
INSERT [dbo].[tCustomerOrderSheet] ([fID], [fCustomerID], [fCouponCode], [fCreationDate], [fCheckedDate], [fOrderSheetCancel]) VALUES (8, 10, N'triplook66', CAST(N'2023-01-15T00:00:00' AS SmallDateTime), NULL, 0)
INSERT [dbo].[tCustomerOrderSheet] ([fID], [fCustomerID], [fCouponCode], [fCreationDate], [fCheckedDate], [fOrderSheetCancel]) VALUES (9, 11, N'triplook77', CAST(N'2023-02-01T00:00:00' AS SmallDateTime), NULL, 1)
INSERT [dbo].[tCustomerOrderSheet] ([fID], [fCustomerID], [fCouponCode], [fCreationDate], [fCheckedDate], [fOrderSheetCancel]) VALUES (10, 12, NULL, CAST(N'2023-02-02T00:00:00' AS SmallDateTime), NULL, 0)
INSERT [dbo].[tCustomerOrderSheet] ([fID], [fCustomerID], [fCouponCode], [fCreationDate], [fCheckedDate], [fOrderSheetCancel]) VALUES (11, 13, N'triplook77', CAST(N'2023-02-02T00:00:00' AS SmallDateTime), NULL, 0)
INSERT [dbo].[tCustomerOrderSheet] ([fID], [fCustomerID], [fCouponCode], [fCreationDate], [fCheckedDate], [fOrderSheetCancel]) VALUES (12, 8, NULL, CAST(N'2023-03-02T00:00:00' AS SmallDateTime), NULL, 0)
INSERT [dbo].[tCustomerOrderSheet] ([fID], [fCustomerID], [fCouponCode], [fCreationDate], [fCheckedDate], [fOrderSheetCancel]) VALUES (13, 8, NULL, CAST(N'2023-03-02T00:00:00' AS SmallDateTime), NULL, 0)
INSERT [dbo].[tCustomerOrderSheet] ([fID], [fCustomerID], [fCouponCode], [fCreationDate], [fCheckedDate], [fOrderSheetCancel]) VALUES (14, 8, NULL, CAST(N'2023-03-02T00:00:00' AS SmallDateTime), NULL, 0)
SET IDENTITY_INSERT [dbo].[tCustomerOrderSheet] OFF
GO
INSERT [dbo].[tGender] ([fID], [fDescription]) VALUES (0, N'未指定')
INSERT [dbo].[tGender] ([fID], [fDescription]) VALUES (1, N'男性')
INSERT [dbo].[tGender] ([fID], [fDescription]) VALUES (2, N'女性')
GO
SET IDENTITY_INSERT [dbo].[tManager] ON 

INSERT [dbo].[tManager] ([fSID], [fAccount], [fPassword]) VALUES (1, N'Admin', N'Admin')
SET IDENTITY_INSERT [dbo].[tManager] OFF
GO
SET IDENTITY_INSERT [dbo].[tOrderDetail] ON 

INSERT [dbo].[tOrderDetail] ([fID], [fCustomerOrderSheetID], [fProductID], [fPurchaseQuantity], [fTravelDate]) VALUES (1, 1, 1, 1, CAST(N'2022-02-18T00:00:00' AS SmallDateTime))
INSERT [dbo].[tOrderDetail] ([fID], [fCustomerOrderSheetID], [fProductID], [fPurchaseQuantity], [fTravelDate]) VALUES (2, 2, 3, 5, CAST(N'2023-01-06T00:00:00' AS SmallDateTime))
INSERT [dbo].[tOrderDetail] ([fID], [fCustomerOrderSheetID], [fProductID], [fPurchaseQuantity], [fTravelDate]) VALUES (3, 3, 5, 1, CAST(N'2023-01-06T00:00:00' AS SmallDateTime))
INSERT [dbo].[tOrderDetail] ([fID], [fCustomerOrderSheetID], [fProductID], [fPurchaseQuantity], [fTravelDate]) VALUES (4, 5, 8, 2, CAST(N'2023-01-06T00:00:00' AS SmallDateTime))
INSERT [dbo].[tOrderDetail] ([fID], [fCustomerOrderSheetID], [fProductID], [fPurchaseQuantity], [fTravelDate]) VALUES (5, 6, 10, 2, CAST(N'2022-07-16T00:00:00' AS SmallDateTime))
INSERT [dbo].[tOrderDetail] ([fID], [fCustomerOrderSheetID], [fProductID], [fPurchaseQuantity], [fTravelDate]) VALUES (6, 7, 12, 1, CAST(N'2022-11-23T00:00:00' AS SmallDateTime))
INSERT [dbo].[tOrderDetail] ([fID], [fCustomerOrderSheetID], [fProductID], [fPurchaseQuantity], [fTravelDate]) VALUES (7, 8, 13, 3, CAST(N'2022-10-27T00:00:00' AS SmallDateTime))
INSERT [dbo].[tOrderDetail] ([fID], [fCustomerOrderSheetID], [fProductID], [fPurchaseQuantity], [fTravelDate]) VALUES (8, 9, 15, 1, CAST(N'2023-02-16T00:00:00' AS SmallDateTime))
INSERT [dbo].[tOrderDetail] ([fID], [fCustomerOrderSheetID], [fProductID], [fPurchaseQuantity], [fTravelDate]) VALUES (9, 10, 16, 3, CAST(N'2023-01-06T00:00:00' AS SmallDateTime))
INSERT [dbo].[tOrderDetail] ([fID], [fCustomerOrderSheetID], [fProductID], [fPurchaseQuantity], [fTravelDate]) VALUES (10, 11, 17, 7, CAST(N'2023-03-15T00:00:00' AS SmallDateTime))
INSERT [dbo].[tOrderDetail] ([fID], [fCustomerOrderSheetID], [fProductID], [fPurchaseQuantity], [fTravelDate]) VALUES (11, 12, 1, 3, CAST(N'2023-04-16T00:00:00' AS SmallDateTime))
INSERT [dbo].[tOrderDetail] ([fID], [fCustomerOrderSheetID], [fProductID], [fPurchaseQuantity], [fTravelDate]) VALUES (12, 13, 15, 4, CAST(N'2023-03-15T00:00:00' AS SmallDateTime))
INSERT [dbo].[tOrderDetail] ([fID], [fCustomerOrderSheetID], [fProductID], [fPurchaseQuantity], [fTravelDate]) VALUES (13, 14, 18, 1, CAST(N'2023-04-25T00:00:00' AS SmallDateTime))
INSERT [dbo].[tOrderDetail] ([fID], [fCustomerOrderSheetID], [fProductID], [fPurchaseQuantity], [fTravelDate]) VALUES (14, 1, 3, 1, CAST(N'2022-02-18T00:00:00' AS SmallDateTime))
INSERT [dbo].[tOrderDetail] ([fID], [fCustomerOrderSheetID], [fProductID], [fPurchaseQuantity], [fTravelDate]) VALUES (15, 2, 15, 5, CAST(N'2023-01-06T00:00:00' AS SmallDateTime))
INSERT [dbo].[tOrderDetail] ([fID], [fCustomerOrderSheetID], [fProductID], [fPurchaseQuantity], [fTravelDate]) VALUES (16, 12, 27, 3, CAST(N'2023-04-16T00:00:00' AS SmallDateTime))
INSERT [dbo].[tOrderDetail] ([fID], [fCustomerOrderSheetID], [fProductID], [fPurchaseQuantity], [fTravelDate]) VALUES (17, 12, 85, 3, CAST(N'2023-04-16T00:00:00' AS SmallDateTime))
INSERT [dbo].[tOrderDetail] ([fID], [fCustomerOrderSheetID], [fProductID], [fPurchaseQuantity], [fTravelDate]) VALUES (18, 14, 139, 1, CAST(N'2023-04-25T00:00:00' AS SmallDateTime))
INSERT [dbo].[tOrderDetail] ([fID], [fCustomerOrderSheetID], [fProductID], [fPurchaseQuantity], [fTravelDate]) VALUES (19, 14, 157, 1, CAST(N'2023-04-25T00:00:00' AS SmallDateTime))
SET IDENTITY_INSERT [dbo].[tOrderDetail] OFF
GO
INSERT [dbo].[tPeriod] ([fID], [fDescription]) VALUES (0, N'未指定')
INSERT [dbo].[tPeriod] ([fID], [fDescription]) VALUES (1, N'早上')
INSERT [dbo].[tPeriod] ([fID], [fDescription]) VALUES (2, N'下午')
INSERT [dbo].[tPeriod] ([fID], [fDescription]) VALUES (3, N'晚上')
GO
SET IDENTITY_INSERT [dbo].[tProduct] ON 

INSERT [dbo].[tProduct] ([fID], [fName], [fPeriodID], [fCost], [fPrice], [fStocks], [fDescription], [fImagePath], [fMinParticipants], [fMaxParticipants], [fAssemblyPoint], [fStartDate], [fEndDate], [fProviderID], [fRemoved], [fRemark], [fCreationDate], [fLastUpdateDate]) VALUES (1, N'四大月老廟參拜半日遊', 1, 250.0000, 520.0000, 25, N'全新方案一人成行，1人包團一試就靈，2-3人包團就試試吧！4人以上我愛你！
千里姻緣一線牽，月老樂成好姻緣！帶你一次參拜台南四大必拜月老廟
大觀音亭闊嘴月老—祈良緣，能言善道，舌燦蓮花，說媒本事技高一籌
重慶寺醋矸月老—保復合，可化爭吵為和諧，有勸情人合和、夫妻恩愛的神奇功效
大天后宮緣粉月老—求搓合，可塗抹「緣粉」在眉毛四周（夫妻宮），有助旺桃花，使有緣人接近
祀典武廟拐杖月老—斬桃花，在月老宮廟前申訴個人案件，神明都會協助處理', N'四大月老廟參拜半日遊.jpg', 1, 4, N'大觀音亭', CAST(N'2020-09-08T00:00:00' AS SmallDateTime), CAST(N'2023-12-01T00:00:00' AS SmallDateTime), 2, 0, N'0 - 3 歲兒童可免費 參加此活動
4 歲以上兒童與成人同價
0 - 12 歲兒童需由付費成人陪同
戶外活動請自備遮陽防曬用品以及水分補充
全程皆以走讀方式進行請考量自身行動能力與體能負荷
戶外活動請自備遮陽防曬用品以及水分補充
如遇天候不佳本公司保有出團（併團與否）之權利
行程包含大量步行及階梯攀爬，請確保有足夠體力參加', CAST(N'2020-06-15T00:00:00' AS SmallDateTime), CAST(N'2023-01-10T00:00:00' AS SmallDateTime))
INSERT [dbo].[tProduct] ([fID], [fName], [fPeriodID], [fCost], [fPrice], [fStocks], [fDescription], [fImagePath], [fMinParticipants], [fMaxParticipants], [fAssemblyPoint], [fStartDate], [fEndDate], [fProviderID], [fRemoved], [fRemark], [fCreationDate], [fLastUpdateDate]) VALUES (3, N'漁光船影單車行＆Adosi 銀戀銀戒指手作體驗｜林默娘公園．德陽艦', 2, 1500.0000, 2200.0000, 15, N'行程包含近期安門安平景點，觀光密度高度集中
全台唯一擁有仿古王船與古董軍艦的港區
1.5小時自行車小旅行，提供每人一輛自行車
導覽尋幽後，再前往具日式古宅情懷的銀戀Adosi安平本館，參加純銀手工戒指DIY', N'漁光船影單車行.jpg', 2, 10, N'奇美博物館', CAST(N'2021-05-19T00:00:00' AS SmallDateTime), CAST(N'2023-12-01T00:00:00' AS SmallDateTime), 6, 0, NULL, CAST(N'2021-01-01T00:00:00' AS SmallDateTime), CAST(N'2023-01-30T00:00:00' AS SmallDateTime))
INSERT [dbo].[tProduct] ([fID], [fName], [fPeriodID], [fCost], [fPrice], [fStocks], [fDescription], [fImagePath], [fMinParticipants], [fMaxParticipants], [fAssemblyPoint], [fStartDate], [fEndDate], [fProviderID], [fRemoved], [fRemark], [fCreationDate], [fLastUpdateDate]) VALUES (5, N'四草綠色隧道', 1, 150.0000, 250.0000, 25, N'請至四草大眾廟服務台掃描憑證列印船票
坐擁全台種類數量之冠的紅樹林濕地生態，四草綠色隧道，有著「台版亞馬遜河」的美譽！
搭觀光漁筏悠遊四草綠色隧道，一窺天使之吻、綠色之眼的獨特仙境', N'綠色隧道.jpg', 1, 10, N'綠色隧道', CAST(N'2021-01-01T00:00:00' AS SmallDateTime), CAST(N'2023-12-31T00:00:00' AS SmallDateTime), 8, 0, NULL, CAST(N'2021-01-01T00:00:00' AS SmallDateTime), CAST(N'2022-12-06T00:00:00' AS SmallDateTime))
INSERT [dbo].[tProduct] ([fID], [fName], [fPeriodID], [fCost], [fPrice], [fStocks], [fDescription], [fImagePath], [fMinParticipants], [fMaxParticipants], [fAssemblyPoint], [fStartDate], [fEndDate], [fProviderID], [fRemoved], [fRemark], [fCreationDate], [fLastUpdateDate]) VALUES (8, N'左鎮化石園區', 1, 50.0000, 150.0000, 200, N'全台唯一的化石主題園區！擁有超過4,600件館藏，也是本土化石館藏最多的博物館
設有自然史教育館、故事館、化石館、生命演化館、探索館等5座展館及戶外廣場，化石迷絕不能錯過
園區內可體驗趣味知性的多媒體互動裝置，寓教於樂，適合親子同遊', N'左鎮化石園區.jpg', 1, 20, N'左鎮化石園區', CAST(N'2021-08-31T00:00:00' AS SmallDateTime), CAST(N'2023-12-31T00:00:00' AS SmallDateTime), 10, 0, NULL, CAST(N'2021-08-31T00:00:00' AS SmallDateTime), CAST(N'2023-01-05T00:00:00' AS SmallDateTime))
INSERT [dbo].[tProduct] ([fID], [fName], [fPeriodID], [fCost], [fPrice], [fStocks], [fDescription], [fImagePath], [fMinParticipants], [fMaxParticipants], [fAssemblyPoint], [fStartDate], [fEndDate], [fProviderID], [fRemoved], [fRemark], [fCreationDate], [fLastUpdateDate]) VALUES (10, N'四大月老廟參拜半日遊', 2, 250.0000, 520.0000, 25, N'全新方案一人成行，1人包團一試就靈，2-3人包團就試試吧！4人以上我愛你！
千里姻緣一線牽，月老樂成好姻緣！帶你一次參拜台南四大必拜月老廟
大觀音亭闊嘴月老—祈良緣，能言善道，舌燦蓮花，說媒本事技高一籌
重慶寺醋矸月老—保復合，可化爭吵為和諧，有勸情人合和、夫妻恩愛的神奇功效
大天后宮緣粉月老—求搓合，可塗抹「緣粉」在眉毛四周（夫妻宮），有助旺桃花，使有緣人接近
祀典武廟拐杖月老—斬桃花，在月老宮廟前申訴個人案件，神明都會協助處理', N'四大月老廟參拜半日遊.jpg', 1, 4, N'大觀音亭', CAST(N'2020-09-08T00:00:00' AS SmallDateTime), CAST(N'2023-12-01T00:00:00' AS SmallDateTime), 2, 0, N'0 - 3 歲兒童可免費 參加此活動
4 歲以上兒童與成人同價
0 - 12 歲兒童需由付費成人陪同
戶外活動請自備遮陽防曬用品以及水分補充
全程皆以走讀方式進行請考量自身行動能力與體能負荷
戶外活動請自備遮陽防曬用品以及水分補充
如遇天候不佳本公司保有出團（併團與否）之權利
行程包含大量步行及階梯攀爬，請確保有足夠體力參加', CAST(N'2020-06-15T00:00:00' AS SmallDateTime), CAST(N'2023-01-10T00:00:00' AS SmallDateTime))
INSERT [dbo].[tProduct] ([fID], [fName], [fPeriodID], [fCost], [fPrice], [fStocks], [fDescription], [fImagePath], [fMinParticipants], [fMaxParticipants], [fAssemblyPoint], [fStartDate], [fEndDate], [fProviderID], [fRemoved], [fRemark], [fCreationDate], [fLastUpdateDate]) VALUES (12, N'漁光船影單車行＆Adosi 銀戀銀戒指手作體驗｜林默娘公園．德陽艦', 1, 150.0000, 2200.0000, 15, N'行程包含近期安門安平景點，觀光密度高度集中
全台唯一擁有仿古王船與古董軍艦的港區
1.5小時自行車小旅行，提供每人一輛自行車
導覽尋幽後，再前往具日式古宅情懷的銀戀Adosi安平本館，參加純銀手工戒指DIY', N'漁光船影單車行.jpg', 2, 4, N'奇美博物館', CAST(N'2021-05-19T00:00:00' AS SmallDateTime), CAST(N'2023-12-01T00:00:00' AS SmallDateTime), 6, 0, NULL, CAST(N'2021-01-01T00:00:00' AS SmallDateTime), CAST(N'2023-01-30T00:00:00' AS SmallDateTime))
INSERT [dbo].[tProduct] ([fID], [fName], [fPeriodID], [fCost], [fPrice], [fStocks], [fDescription], [fImagePath], [fMinParticipants], [fMaxParticipants], [fAssemblyPoint], [fStartDate], [fEndDate], [fProviderID], [fRemoved], [fRemark], [fCreationDate], [fLastUpdateDate]) VALUES (13, N'四草綠色隧道', 2, 150.0000, 250.0000, 25, N'請至四草大眾廟服務台掃描憑證列印船票
坐擁全台種類數量之冠的紅樹林濕地生態，四草綠色隧道，有著「台版亞馬遜河」的美譽！
搭觀光漁筏悠遊四草綠色隧道，一窺天使之吻、綠色之眼的獨特仙境', N'綠色隧道.jpg', 1, 10, N'綠色隧道', CAST(N'2021-01-01T00:00:00' AS SmallDateTime), CAST(N'2023-12-31T00:00:00' AS SmallDateTime), 8, 0, NULL, CAST(N'2021-01-01T00:00:00' AS SmallDateTime), CAST(N'2022-12-06T00:00:00' AS SmallDateTime))
INSERT [dbo].[tProduct] ([fID], [fName], [fPeriodID], [fCost], [fPrice], [fStocks], [fDescription], [fImagePath], [fMinParticipants], [fMaxParticipants], [fAssemblyPoint], [fStartDate], [fEndDate], [fProviderID], [fRemoved], [fRemark], [fCreationDate], [fLastUpdateDate]) VALUES (15, N'四草綠色隧道', 3, 150.0000, 250.0000, 25, N'請至四草大眾廟服務台掃描憑證列印船票
坐擁全台種類數量之冠的紅樹林濕地生態，四草綠色隧道，有著「台版亞馬遜河」的美譽！
搭觀光漁筏悠遊四草綠色隧道，一窺天使之吻、綠色之眼的獨特仙境', N'綠色隧道.jpg', 1, 10, N'綠色隧道', CAST(N'2021-01-01T00:00:00' AS SmallDateTime), CAST(N'2023-12-31T00:00:00' AS SmallDateTime), 8, 0, NULL, CAST(N'2021-01-01T00:00:00' AS SmallDateTime), CAST(N'2022-12-06T00:00:00' AS SmallDateTime))
INSERT [dbo].[tProduct] ([fID], [fName], [fPeriodID], [fCost], [fPrice], [fStocks], [fDescription], [fImagePath], [fMinParticipants], [fMaxParticipants], [fAssemblyPoint], [fStartDate], [fEndDate], [fProviderID], [fRemoved], [fRemark], [fCreationDate], [fLastUpdateDate]) VALUES (16, N'南瀛天文館', 2, 185.0000, 500.0000, 50, N'來到南瀛天文館，跳脫時空限制，感受宇宙星空的震撼，啟發學習天文科學的興趣
天文展示館配合地勢及自然條件設計，以「月亮」為象徵意象
採用數位球幕3D的星象劇場，運用全世界最新技術，提供觀眾一個真實而撼動人心的模擬星空
天文教育館透過生動、活潑而豐富的天文主題，結合熱門天文主題特展，啟發民眾對天文科學的喜愛', N'南瀛天文館.jpg', 1, 20, N'南瀛天文館', CAST(N'2020-01-01T00:00:00' AS SmallDateTime), CAST(N'2023-12-31T00:00:00' AS SmallDateTime), 13, 0, NULL, CAST(N'2021-06-17T00:00:00' AS SmallDateTime), CAST(N'2023-01-02T00:00:00' AS SmallDateTime))
INSERT [dbo].[tProduct] ([fID], [fName], [fPeriodID], [fCost], [fPrice], [fStocks], [fDescription], [fImagePath], [fMinParticipants], [fMaxParticipants], [fAssemblyPoint], [fStartDate], [fEndDate], [fProviderID], [fRemoved], [fRemark], [fCreationDate], [fLastUpdateDate]) VALUES (17, N'南瀛天文館', 3, 185.0000, 500.0000, 50, N'來到南瀛天文館，跳脫時空限制，感受宇宙星空的震撼，啟發學習天文科學的興趣
天文展示館配合地勢及自然條件設計，以「月亮」為象徵意象
採用數位球幕3D的星象劇場，運用全世界最新技術，提供觀眾一個真實而撼動人心的模擬星空
天文教育館透過生動、活潑而豐富的天文主題，結合熱門天文主題特展，啟發民眾對天文科學的喜愛', N'南瀛天文館.jpg', 1, 20, N'南瀛天文館', CAST(N'2020-01-01T00:00:00' AS SmallDateTime), CAST(N'2023-12-31T00:00:00' AS SmallDateTime), 13, 0, NULL, CAST(N'2021-06-17T00:00:00' AS SmallDateTime), CAST(N'2023-01-02T00:00:00' AS SmallDateTime))
INSERT [dbo].[tProduct] ([fID], [fName], [fPeriodID], [fCost], [fPrice], [fStocks], [fDescription], [fImagePath], [fMinParticipants], [fMaxParticipants], [fAssemblyPoint], [fStartDate], [fEndDate], [fProviderID], [fRemoved], [fRemark], [fCreationDate], [fLastUpdateDate]) VALUES (18, N'南瀛天文館', 1, 185.0000, 500.0000, 50, N'來到南瀛天文館，跳脫時空限制，感受宇宙星空的震撼，啟發學習天文科學的興趣
天文展示館配合地勢及自然條件設計，以「月亮」為象徵意象
採用數位球幕3D的星象劇場，運用全世界最新技術，提供觀眾一個真實而撼動人心的模擬星空
天文教育館透過生動、活潑而豐富的天文主題，結合熱門天文主題特展，啟發民眾對天文科學的喜愛', N'南瀛天文館.jpg', 1, 20, N'南瀛天文館', CAST(N'2020-01-01T00:00:00' AS SmallDateTime), CAST(N'2023-12-31T00:00:00' AS SmallDateTime), 13, 0, NULL, CAST(N'2021-06-17T00:00:00' AS SmallDateTime), CAST(N'2023-01-02T00:00:00' AS SmallDateTime))
INSERT [dbo].[tProduct] ([fID], [fName], [fPeriodID], [fCost], [fPrice], [fStocks], [fDescription], [fImagePath], [fMinParticipants], [fMaxParticipants], [fAssemblyPoint], [fStartDate], [fEndDate], [fProviderID], [fRemoved], [fRemark], [fCreationDate], [fLastUpdateDate]) VALUES (19, N'安平古堡', 1, 350.0000, 700.0000, 200, N'17世紀初荷蘭人以軍商結合的隊伍，於1624年占領今日安平，並建熱蘭遮城為其防禦要塞，全部工程完成於1634年。1662年鄭成功取荷蘭城後，改稱安平鎮，改內城為內府，臺人因此稱其為王城。清領時代，因台江陸浮失卻其重要性，加上清兵破壞熱蘭遮城建億載金城，故日漸荒廢。日治後重建，二戰後乃稱「安平古堡」。目前真正的荷蘭時期遺跡僅存古堡前方外城南城垣的磚牆。老榕盤根，無限滄桑，見證著近400年來的台江的歷史。', N'安平古堡.jpg', 1, 20, N'708台灣台南市安平區西門里', CAST(N'2020-01-01T00:00:00' AS SmallDateTime), CAST(N'2023-12-31T00:00:00' AS SmallDateTime), 11, 0, NULL, CAST(N'2021-06-17T00:00:00' AS SmallDateTime), CAST(N'2023-01-02T00:00:00' AS SmallDateTime))
INSERT [dbo].[tProduct] ([fID], [fName], [fPeriodID], [fCost], [fPrice], [fStocks], [fDescription], [fImagePath], [fMinParticipants], [fMaxParticipants], [fAssemblyPoint], [fStartDate], [fEndDate], [fProviderID], [fRemoved], [fRemark], [fCreationDate], [fLastUpdateDate]) VALUES (20, N'安平古堡', 2, 350.0000, 700.0000, 200, N'17世紀初荷蘭人以軍商結合的隊伍，於1624年占領今日安平，並建熱蘭遮城為其防禦要塞，全部工程完成於1634年。1662年鄭成功取荷蘭城後，改稱安平鎮，改內城為內府，臺人因此稱其為王城。清領時代，因台江陸浮失卻其重要性，加上清兵破壞熱蘭遮城建億載金城，故日漸荒廢。日治後重建，二戰後乃稱「安平古堡」。目前真正的荷蘭時期遺跡僅存古堡前方外城南城垣的磚牆。老榕盤根，無限滄桑，見證著近400年來的台江的歷史。', N'安平古堡.jpg', 1, 20, N'708台灣台南市安平區西門里', CAST(N'2020-01-01T00:00:00' AS SmallDateTime), CAST(N'2023-12-31T00:00:00' AS SmallDateTime), 11, 0, NULL, CAST(N'2021-06-17T00:00:00' AS SmallDateTime), CAST(N'2023-01-02T00:00:00' AS SmallDateTime))
INSERT [dbo].[tProduct] ([fID], [fName], [fPeriodID], [fCost], [fPrice], [fStocks], [fDescription], [fImagePath], [fMinParticipants], [fMaxParticipants], [fAssemblyPoint], [fStartDate], [fEndDate], [fProviderID], [fRemoved], [fRemark], [fCreationDate], [fLastUpdateDate]) VALUES (21, N'井仔腳瓦盤鹽田', 1, 350.0000, 700.0000, 200, N'「井仔腳瓦盤鹽田」是北門的第一座鹽田，也是現存最古老的瓦盤鹽田遺址，原為清領時期的瀨東鹽場，1818年遷此至今未再移位，而且清一色為瓦盤鹽田，呈現出馬賽克拼貼般的美麗藝術，後因人工成本過高的原因，於2002年結束了長達338年的曬鹽業，使原來遍布此處的鹽田荒廢了一段時間，後來為延續鹽業文化而將鹽場復育，現已成為台南濱海最具特色的景點。', N'井仔腳瓦盤鹽田.jpg', 1, 20, N'Unnamed Road, 北門區台南市台灣 727', CAST(N'2020-01-01T00:00:00' AS SmallDateTime), CAST(N'2023-12-31T00:00:00' AS SmallDateTime), 13, 0, NULL, CAST(N'2021-06-17T00:00:00' AS SmallDateTime), CAST(N'2023-01-02T00:00:00' AS SmallDateTime))
INSERT [dbo].[tProduct] ([fID], [fName], [fPeriodID], [fCost], [fPrice], [fStocks], [fDescription], [fImagePath], [fMinParticipants], [fMaxParticipants], [fAssemblyPoint], [fStartDate], [fEndDate], [fProviderID], [fRemoved], [fRemark], [fCreationDate], [fLastUpdateDate]) VALUES (22, N'井仔腳瓦盤鹽田', 2, 350.0000, 700.0000, 200, N'「井仔腳瓦盤鹽田」是北門的第一座鹽田，也是現存最古老的瓦盤鹽田遺址，原為清領時期的瀨東鹽場，1818年遷此至今未再移位，而且清一色為瓦盤鹽田，呈現出馬賽克拼貼般的美麗藝術，後因人工成本過高的原因，於2002年結束了長達338年的曬鹽業，使原來遍布此處的鹽田荒廢了一段時間，後來為延續鹽業文化而將鹽場復育，現已成為台南濱海最具特色的景點。', N'井仔腳瓦盤鹽田.jpg', 1, 20, N'Unnamed Road, 北門區台南市台灣 727', CAST(N'2020-01-01T00:00:00' AS SmallDateTime), CAST(N'2023-12-31T00:00:00' AS SmallDateTime), 13, 0, NULL, CAST(N'2021-06-17T00:00:00' AS SmallDateTime), CAST(N'2023-01-02T00:00:00' AS SmallDateTime))
INSERT [dbo].[tProduct] ([fID], [fName], [fPeriodID], [fCost], [fPrice], [fStocks], [fDescription], [fImagePath], [fMinParticipants], [fMaxParticipants], [fAssemblyPoint], [fStartDate], [fEndDate], [fProviderID], [fRemoved], [fRemark], [fCreationDate], [fLastUpdateDate]) VALUES (23, N'神農街', 1, 350.0000, 700.0000, 200, N'從清朝時代起就是台南五條港區域的重要河港入口，當時的商賈都從這條街上進出台南，是當時最熱鬧的的區域，歷史有趣的地方又來了，經過百年演變，原本的河港現在成為都市裡的道路。', N'神農街.jpg', 1, 20, N'700台南市中西區神農街80號', CAST(N'2020-01-01T00:00:00' AS SmallDateTime), CAST(N'2023-12-31T00:00:00' AS SmallDateTime), 14, 0, NULL, CAST(N'2021-06-17T00:00:00' AS SmallDateTime), CAST(N'2023-01-02T00:00:00' AS SmallDateTime))
INSERT [dbo].[tProduct] ([fID], [fName], [fPeriodID], [fCost], [fPrice], [fStocks], [fDescription], [fImagePath], [fMinParticipants], [fMaxParticipants], [fAssemblyPoint], [fStartDate], [fEndDate], [fProviderID], [fRemoved], [fRemark], [fCreationDate], [fLastUpdateDate]) VALUES (24, N'神農街', 2, 350.0000, 700.0000, 200, N'從清朝時代起就是台南五條港區域的重要河港入口，當時的商賈都從這條街上進出台南，是當時最熱鬧的的區域，歷史有趣的地方又來了，經過百年演變，原本的河港現在成為都市裡的道路。', N'神農街.jpg', 1, 20, N'700台南市中西區神農街80號', CAST(N'2020-01-01T00:00:00' AS SmallDateTime), CAST(N'2023-12-31T00:00:00' AS SmallDateTime), 14, 0, NULL, CAST(N'2021-06-17T00:00:00' AS SmallDateTime), CAST(N'2023-01-02T00:00:00' AS SmallDateTime))
INSERT [dbo].[tProduct] ([fID], [fName], [fPeriodID], [fCost], [fPrice], [fStocks], [fDescription], [fImagePath], [fMinParticipants], [fMaxParticipants], [fAssemblyPoint], [fStartDate], [fEndDate], [fProviderID], [fRemoved], [fRemark], [fCreationDate], [fLastUpdateDate]) VALUES (25, N'神農街', 3, 350.0000, 700.0000, 200, N'從清朝時代起就是台南五條港區域的重要河港入口，當時的商賈都從這條街上進出台南，是當時最熱鬧的的區域，歷史有趣的地方又來了，經過百年演變，原本的河港現在成為都市裡的道路。', N'神農街.jpg', 1, 20, N'700台南市中西區神農街80號', CAST(N'2020-01-01T00:00:00' AS SmallDateTime), CAST(N'2023-12-31T00:00:00' AS SmallDateTime), 14, 0, NULL, CAST(N'2021-06-17T00:00:00' AS SmallDateTime), CAST(N'2023-01-02T00:00:00' AS SmallDateTime))
INSERT [dbo].[tProduct] ([fID], [fName], [fPeriodID], [fCost], [fPrice], [fStocks], [fDescription], [fImagePath], [fMinParticipants], [fMaxParticipants], [fAssemblyPoint], [fStartDate], [fEndDate], [fProviderID], [fRemoved], [fRemark], [fCreationDate], [fLastUpdateDate]) VALUES (26, N'安平樹屋', 1, 350.0000, 700.0000, 200, N'樹屋位於德記洋行後面，原是德記洋行的倉庫，大約建於十九世紀末及日治初期，此處曾做為「大日本鹽業株式會社」出張所倉庫，現況規模即為日本人增建。', N'安平樹屋.jpg', 1, 20, N'708台南市安平區海頭里', CAST(N'2020-01-01T00:00:00' AS SmallDateTime), CAST(N'2023-12-31T00:00:00' AS SmallDateTime), 2, 0, NULL, CAST(N'2021-06-17T00:00:00' AS SmallDateTime), CAST(N'2023-01-02T00:00:00' AS SmallDateTime))
INSERT [dbo].[tProduct] ([fID], [fName], [fPeriodID], [fCost], [fPrice], [fStocks], [fDescription], [fImagePath], [fMinParticipants], [fMaxParticipants], [fAssemblyPoint], [fStartDate], [fEndDate], [fProviderID], [fRemoved], [fRemark], [fCreationDate], [fLastUpdateDate]) VALUES (27, N'安平樹屋', 2, 350.0000, 700.0000, 200, N'樹屋位於德記洋行後面，原是德記洋行的倉庫，大約建於十九世紀末及日治初期，此處曾做為「大日本鹽業株式會社」出張所倉庫，現況規模即為日本人增建。', N'安平樹屋.jpg', 1, 20, N'708台南市安平區海頭里', CAST(N'2020-01-01T00:00:00' AS SmallDateTime), CAST(N'2023-12-31T00:00:00' AS SmallDateTime), 2, 0, NULL, CAST(N'2021-06-17T00:00:00' AS SmallDateTime), CAST(N'2023-01-02T00:00:00' AS SmallDateTime))
INSERT [dbo].[tProduct] ([fID], [fName], [fPeriodID], [fCost], [fPrice], [fStocks], [fDescription], [fImagePath], [fMinParticipants], [fMaxParticipants], [fAssemblyPoint], [fStartDate], [fEndDate], [fProviderID], [fRemoved], [fRemark], [fCreationDate], [fLastUpdateDate]) VALUES (28, N'安平樹屋', 3, 350.0000, 700.0000, 200, N'樹屋位於德記洋行後面，原是德記洋行的倉庫，大約建於十九世紀末及日治初期，此處曾做為「大日本鹽業株式會社」出張所倉庫，現況規模即為日本人增建。', N'安平樹屋.jpg', 1, 20, N'708台南市安平區海頭里', CAST(N'2020-01-01T00:00:00' AS SmallDateTime), CAST(N'2023-12-31T00:00:00' AS SmallDateTime), 2, 0, NULL, CAST(N'2021-06-17T00:00:00' AS SmallDateTime), CAST(N'2023-01-02T00:00:00' AS SmallDateTime))
INSERT [dbo].[tProduct] ([fID], [fName], [fPeriodID], [fCost], [fPrice], [fStocks], [fDescription], [fImagePath], [fMinParticipants], [fMaxParticipants], [fAssemblyPoint], [fStartDate], [fEndDate], [fProviderID], [fRemoved], [fRemark], [fCreationDate], [fLastUpdateDate]) VALUES (29, N'正統鹿耳門聖母廟', 1, 350.0000, 700.0000, 200, N'為土城地區的信仰中心，每位來到這裡的遊客都會被廣大的廟宇建築所震撼，整座廟宇仿造北京紫禁城的宮殿建築氣勢恢宏，享有遠東第一大廟的美譽。廟前廣場一左一右站立著兩位巨大的神將－順風耳與千里眼，在藍天白雲下搭配後方壯麗的廟宇，像神明降臨人間一樣的威武。
', N'正統鹿耳門聖母廟.jpg', 1, 20, N'709台南市安南區城安路160號', CAST(N'2020-01-01T00:00:00' AS SmallDateTime), CAST(N'2023-12-31T00:00:00' AS SmallDateTime), 6, 0, NULL, CAST(N'2021-06-17T00:00:00' AS SmallDateTime), CAST(N'2023-01-02T00:00:00' AS SmallDateTime))
INSERT [dbo].[tProduct] ([fID], [fName], [fPeriodID], [fCost], [fPrice], [fStocks], [fDescription], [fImagePath], [fMinParticipants], [fMaxParticipants], [fAssemblyPoint], [fStartDate], [fEndDate], [fProviderID], [fRemoved], [fRemark], [fCreationDate], [fLastUpdateDate]) VALUES (30, N'正統鹿耳門聖母廟', 2, 350.0000, 700.0000, 200, N'為土城地區的信仰中心，每位來到這裡的遊客都會被廣大的廟宇建築所震撼，整座廟宇仿造北京紫禁城的宮殿建築氣勢恢宏，享有遠東第一大廟的美譽。廟前廣場一左一右站立著兩位巨大的神將－順風耳與千里眼，在藍天白雲下搭配後方壯麗的廟宇，像神明降臨人間一樣的威武。
', N'正統鹿耳門聖母廟.jpg', 1, 20, N'709台南市安南區城安路160號', CAST(N'2020-01-01T00:00:00' AS SmallDateTime), CAST(N'2023-12-31T00:00:00' AS SmallDateTime), 6, 0, NULL, CAST(N'2021-06-17T00:00:00' AS SmallDateTime), CAST(N'2023-01-02T00:00:00' AS SmallDateTime))
INSERT [dbo].[tProduct] ([fID], [fName], [fPeriodID], [fCost], [fPrice], [fStocks], [fDescription], [fImagePath], [fMinParticipants], [fMaxParticipants], [fAssemblyPoint], [fStartDate], [fEndDate], [fProviderID], [fRemoved], [fRemark], [fCreationDate], [fLastUpdateDate]) VALUES (31, N'正統鹿耳門聖母廟', 3, 350.0000, 700.0000, 200, N'為土城地區的信仰中心，每位來到這裡的遊客都會被廣大的廟宇建築所震撼，整座廟宇仿造北京紫禁城的宮殿建築氣勢恢宏，享有遠東第一大廟的美譽。廟前廣場一左一右站立著兩位巨大的神將－順風耳與千里眼，在藍天白雲下搭配後方壯麗的廟宇，像神明降臨人間一樣的威武。
', N'正統鹿耳門聖母廟.jpg', 1, 20, N'709台南市安南區城安路160號', CAST(N'2020-01-01T00:00:00' AS SmallDateTime), CAST(N'2023-12-31T00:00:00' AS SmallDateTime), 6, 0, NULL, CAST(N'2021-06-17T00:00:00' AS SmallDateTime), CAST(N'2023-01-02T00:00:00' AS SmallDateTime))
INSERT [dbo].[tProduct] ([fID], [fName], [fPeriodID], [fCost], [fPrice], [fStocks], [fDescription], [fImagePath], [fMinParticipants], [fMaxParticipants], [fAssemblyPoint], [fStartDate], [fEndDate], [fProviderID], [fRemoved], [fRemark], [fCreationDate], [fLastUpdateDate]) VALUES (32, N'知事官邸生活館', 1, 350.0000, 700.0000, 200, N'創建之初係計畫作為首長官邸「臺南縣知事官邸」，當時之縣知事為今井艮一。1901年11月廢縣置廳，臺南廳的首長官邸由此官邸搬遷至附近的「臺南廳長官舍」。此一時期原知事官邸建築係由臺南廳代管，其「日本造（和館）」部分曾借予陸軍使用，而曾轉用為「旅團長官邸」；洋館部分曾作為「臺南廳廳員之讀書俱樂部」…等用途，但其最主要名稱與定位，則為總督至臺南巡視時之「總督臺南官邸」與皇族至臺南巡視時之「御泊所（行館）」。此一階段開始，兼有總督官邸與皇族行館之功能，包括日本閑院宮戴仁親王夫婦等皇族訪問臺南時宿泊的行館皆設於此。', N'知事官邸生活館.jpg', 1, 20, N'701台南市東區前鋒路92號', CAST(N'2020-01-01T00:00:00' AS SmallDateTime), CAST(N'2023-12-31T00:00:00' AS SmallDateTime), 8, 0, NULL, CAST(N'2021-06-17T00:00:00' AS SmallDateTime), CAST(N'2023-01-02T00:00:00' AS SmallDateTime))
INSERT [dbo].[tProduct] ([fID], [fName], [fPeriodID], [fCost], [fPrice], [fStocks], [fDescription], [fImagePath], [fMinParticipants], [fMaxParticipants], [fAssemblyPoint], [fStartDate], [fEndDate], [fProviderID], [fRemoved], [fRemark], [fCreationDate], [fLastUpdateDate]) VALUES (33, N'知事官邸生活館', 2, 350.0000, 700.0000, 200, N'創建之初係計畫作為首長官邸「臺南縣知事官邸」，當時之縣知事為今井艮一。1901年11月廢縣置廳，臺南廳的首長官邸由此官邸搬遷至附近的「臺南廳長官舍」。此一時期原知事官邸建築係由臺南廳代管，其「日本造（和館）」部分曾借予陸軍使用，而曾轉用為「旅團長官邸」；洋館部分曾作為「臺南廳廳員之讀書俱樂部」…等用途，但其最主要名稱與定位，則為總督至臺南巡視時之「總督臺南官邸」與皇族至臺南巡視時之「御泊所（行館）」。此一階段開始，兼有總督官邸與皇族行館之功能，包括日本閑院宮戴仁親王夫婦等皇族訪問臺南時宿泊的行館皆設於此。', N'知事官邸生活館.jpg', 1, 20, N'701台南市東區前鋒路92號', CAST(N'2020-01-01T00:00:00' AS SmallDateTime), CAST(N'2023-12-31T00:00:00' AS SmallDateTime), 8, 0, NULL, CAST(N'2021-06-17T00:00:00' AS SmallDateTime), CAST(N'2023-01-02T00:00:00' AS SmallDateTime))
INSERT [dbo].[tProduct] ([fID], [fName], [fPeriodID], [fCost], [fPrice], [fStocks], [fDescription], [fImagePath], [fMinParticipants], [fMaxParticipants], [fAssemblyPoint], [fStartDate], [fEndDate], [fProviderID], [fRemoved], [fRemark], [fCreationDate], [fLastUpdateDate]) VALUES (35, N'大坑休閒農場', 1, 350.0000, 700.0000, 200, N'大坑休閒農場是一處由傳統農畜轉變成休閒型態的農場，一家三代長居在此，進到農場就可感受到親切的人情味，群山環抱，佔地非常廣大，是前往觀看二寮日出雲海時不可錯過的地點。除保留原有農村景物外，沿著周邊山勢開闢了安全的健走登山步道，還有運動休閒的活動設施，走累肚子餓的話還有農場的獨門鋼管雞等各項山珍料理美味可以補充體力。', N'大坑休閒農場.jpg', 1, 20, N'712台南市新化區82', CAST(N'2020-01-01T00:00:00' AS SmallDateTime), CAST(N'2023-12-31T00:00:00' AS SmallDateTime), 10, 0, NULL, CAST(N'1900-01-20T00:00:00' AS SmallDateTime), CAST(N'1902-10-09T00:00:00' AS SmallDateTime))
INSERT [dbo].[tProduct] ([fID], [fName], [fPeriodID], [fCost], [fPrice], [fStocks], [fDescription], [fImagePath], [fMinParticipants], [fMaxParticipants], [fAssemblyPoint], [fStartDate], [fEndDate], [fProviderID], [fRemoved], [fRemark], [fCreationDate], [fLastUpdateDate]) VALUES (36, N'大坑休閒農場', 2, 350.0000, 700.0000, 200, N'大坑休閒農場是一處由傳統農畜轉變成休閒型態的農場，一家三代長居在此，進到農場就可感受到親切的人情味，群山環抱，佔地非常廣大，是前往觀看二寮日出雲海時不可錯過的地點。除保留原有農村景物外，沿著周邊山勢開闢了安全的健走登山步道，還有運動休閒的活動設施，走累肚子餓的話還有農場的獨門鋼管雞等各項山珍料理美味可以補充體力。', N'大坑休閒農場.jpg', 1, 20, N'712台南市新化區82', CAST(N'2020-01-01T00:00:00' AS SmallDateTime), CAST(N'2023-12-31T00:00:00' AS SmallDateTime), 10, 0, NULL, CAST(N'1900-01-20T00:00:00' AS SmallDateTime), CAST(N'1902-10-09T00:00:00' AS SmallDateTime))
INSERT [dbo].[tProduct] ([fID], [fName], [fPeriodID], [fCost], [fPrice], [fStocks], [fDescription], [fImagePath], [fMinParticipants], [fMaxParticipants], [fAssemblyPoint], [fStartDate], [fEndDate], [fProviderID], [fRemoved], [fRemark], [fCreationDate], [fLastUpdateDate]) VALUES (37, N'五條港文化園區
', 1, 350.0000, 700.0000, 200, N'五條港文化園區可說是台南中西區歷史紋理最為豐富的一處園區，在清朝中葉台江逐漸淤積，但仍有五條河道可由海邊通往府城，五個河港周邊的區域便成了繁忙的商業中心，也就是現今台南市中心中西區的雛型，五個河港由北到南分別為新港墘港、佛頭港、南勢港、南河港、安海港，範圍大約是成功路以南、新美街以西、南至中正路左右，以現在的地景來看已經絲毫看不出當時河港的模樣。', N'五條港文化園區
.jpg', 1, 20, N'700台南市中西區民族路三段134號', CAST(N'2020-01-01T00:00:00' AS SmallDateTime), CAST(N'2023-12-31T00:00:00' AS SmallDateTime), 11, 0, NULL, CAST(N'1900-01-20T00:00:00' AS SmallDateTime), CAST(N'1902-10-09T00:00:00' AS SmallDateTime))
INSERT [dbo].[tProduct] ([fID], [fName], [fPeriodID], [fCost], [fPrice], [fStocks], [fDescription], [fImagePath], [fMinParticipants], [fMaxParticipants], [fAssemblyPoint], [fStartDate], [fEndDate], [fProviderID], [fRemoved], [fRemark], [fCreationDate], [fLastUpdateDate]) VALUES (38, N'五條港文化園區
', 2, 350.0000, 700.0000, 200, N'五條港文化園區可說是台南中西區歷史紋理最為豐富的一處園區，在清朝中葉台江逐漸淤積，但仍有五條河道可由海邊通往府城，五個河港周邊的區域便成了繁忙的商業中心，也就是現今台南市中心中西區的雛型，五個河港由北到南分別為新港墘港、佛頭港、南勢港、南河港、安海港，範圍大約是成功路以南、新美街以西、南至中正路左右，以現在的地景來看已經絲毫看不出當時河港的模樣。', N'五條港文化園區
.jpg', 1, 20, N'700台南市中西區民族路三段134號', CAST(N'2020-01-01T00:00:00' AS SmallDateTime), CAST(N'2023-12-31T00:00:00' AS SmallDateTime), 11, 0, NULL, CAST(N'1900-01-20T00:00:00' AS SmallDateTime), CAST(N'1902-10-09T00:00:00' AS SmallDateTime))
INSERT [dbo].[tProduct] ([fID], [fName], [fPeriodID], [fCost], [fPrice], [fStocks], [fDescription], [fImagePath], [fMinParticipants], [fMaxParticipants], [fAssemblyPoint], [fStartDate], [fEndDate], [fProviderID], [fRemoved], [fRemark], [fCreationDate], [fLastUpdateDate]) VALUES (39, N'五條港文化園區
', 3, 350.0000, 700.0000, 200, N'五條港文化園區可說是台南中西區歷史紋理最為豐富的一處園區，在清朝中葉台江逐漸淤積，但仍有五條河道可由海邊通往府城，五個河港周邊的區域便成了繁忙的商業中心，也就是現今台南市中心中西區的雛型，五個河港由北到南分別為新港墘港、佛頭港、南勢港、南河港、安海港，範圍大約是成功路以南、新美街以西、南至中正路左右，以現在的地景來看已經絲毫看不出當時河港的模樣。', N'五條港文化園區
.jpg', 1, 20, N'700台南市中西區民族路三段134號', CAST(N'2020-01-01T00:00:00' AS SmallDateTime), CAST(N'2023-12-31T00:00:00' AS SmallDateTime), 11, 0, NULL, CAST(N'1900-01-20T00:00:00' AS SmallDateTime), CAST(N'1902-10-09T00:00:00' AS SmallDateTime))
INSERT [dbo].[tProduct] ([fID], [fName], [fPeriodID], [fCost], [fPrice], [fStocks], [fDescription], [fImagePath], [fMinParticipants], [fMaxParticipants], [fAssemblyPoint], [fStartDate], [fEndDate], [fProviderID], [fRemoved], [fRemark], [fCreationDate], [fLastUpdateDate]) VALUES (40, N'台糖烏樹林園區', 1, 350.0000, 700.0000, 200, N'烏樹林糖廠位於台南市後壁區烏樹林，建於1910年，目前已不製糖，但其仍保有原有的糖鐵系統，更有台糖五分車動態展示。隨著製糖工業的沒落，運送甘蔗的小火車也跟著響起熄燈號停駛，原本擔任白河、東山兩地往來於新營間樞紐位置的烏樹林車站，自1979年烏樹林輸運旅客的營業線停駛後，車站也跟著關起大門。2002年底烏樹林車站在多方人士協助下，以嶄新的鐵道文化面貌在眾人面前亮相。', N'台糖烏樹林園區.jpg', 1, 20, N'731台南市後壁區', CAST(N'2020-01-01T00:00:00' AS SmallDateTime), CAST(N'2023-12-31T00:00:00' AS SmallDateTime), 12, 0, NULL, CAST(N'1900-01-20T00:00:00' AS SmallDateTime), CAST(N'1902-10-09T00:00:00' AS SmallDateTime))
INSERT [dbo].[tProduct] ([fID], [fName], [fPeriodID], [fCost], [fPrice], [fStocks], [fDescription], [fImagePath], [fMinParticipants], [fMaxParticipants], [fAssemblyPoint], [fStartDate], [fEndDate], [fProviderID], [fRemoved], [fRemark], [fCreationDate], [fLastUpdateDate]) VALUES (41, N'台糖烏樹林園區', 2, 350.0000, 700.0000, 200, N'烏樹林糖廠位於台南市後壁區烏樹林，建於1910年，目前已不製糖，但其仍保有原有的糖鐵系統，更有台糖五分車動態展示。隨著製糖工業的沒落，運送甘蔗的小火車也跟著響起熄燈號停駛，原本擔任白河、東山兩地往來於新營間樞紐位置的烏樹林車站，自1979年烏樹林輸運旅客的營業線停駛後，車站也跟著關起大門。2002年底烏樹林車站在多方人士協助下，以嶄新的鐵道文化面貌在眾人面前亮相。', N'台糖烏樹林園區.jpg', 1, 20, N'731台南市後壁區', CAST(N'2020-01-01T00:00:00' AS SmallDateTime), CAST(N'2023-12-31T00:00:00' AS SmallDateTime), 12, 0, NULL, CAST(N'1900-01-20T00:00:00' AS SmallDateTime), CAST(N'1902-10-09T00:00:00' AS SmallDateTime))
INSERT [dbo].[tProduct] ([fID], [fName], [fPeriodID], [fCost], [fPrice], [fStocks], [fDescription], [fImagePath], [fMinParticipants], [fMaxParticipants], [fAssemblyPoint], [fStartDate], [fEndDate], [fProviderID], [fRemoved], [fRemark], [fCreationDate], [fLastUpdateDate]) VALUES (42, N'七股潟湖
', 1, 350.0000, 700.0000, 200, N'當地俗稱「內海仔」，是300多年前的台江內海遺跡，面積約1600公頃，搭乘竹筏遊潟湖是體驗七股潟湖的最好方式，有多個船家可以選擇，沿途滿是蚵棚、定置魚網，與悠哉乘著小舟的釣客，可飽覽豐富的潟湖生態，潟湖周邊的紅樹林，滿是白鷺鷥與招潮蟹，另外還有一種很特別的水鳥鸕鶿，雖然身為水鳥，但因為羽毛不防水，所以每下水抓一次魚都要在蚵棚上曬太陽，等候羽毛晾乾才能進行下一次的獵捕，是很有趣的生態行為。', N'七股潟湖
.jpg', 1, 20, N'724台南市七股區', CAST(N'2020-01-01T00:00:00' AS SmallDateTime), CAST(N'2023-12-31T00:00:00' AS SmallDateTime), 13, 0, NULL, CAST(N'1900-01-20T00:00:00' AS SmallDateTime), CAST(N'1902-10-09T00:00:00' AS SmallDateTime))
INSERT [dbo].[tProduct] ([fID], [fName], [fPeriodID], [fCost], [fPrice], [fStocks], [fDescription], [fImagePath], [fMinParticipants], [fMaxParticipants], [fAssemblyPoint], [fStartDate], [fEndDate], [fProviderID], [fRemoved], [fRemark], [fCreationDate], [fLastUpdateDate]) VALUES (43, N'七股潟湖
', 2, 350.0000, 700.0000, 200, N'當地俗稱「內海仔」，是300多年前的台江內海遺跡，面積約1600公頃，搭乘竹筏遊潟湖是體驗七股潟湖的最好方式，有多個船家可以選擇，沿途滿是蚵棚、定置魚網，與悠哉乘著小舟的釣客，可飽覽豐富的潟湖生態，潟湖周邊的紅樹林，滿是白鷺鷥與招潮蟹，另外還有一種很特別的水鳥鸕鶿，雖然身為水鳥，但因為羽毛不防水，所以每下水抓一次魚都要在蚵棚上曬太陽，等候羽毛晾乾才能進行下一次的獵捕，是很有趣的生態行為。', N'七股潟湖
.jpg', 1, 20, N'724台南市七股區', CAST(N'2020-01-01T00:00:00' AS SmallDateTime), CAST(N'2023-12-31T00:00:00' AS SmallDateTime), 13, 0, NULL, CAST(N'1900-01-20T00:00:00' AS SmallDateTime), CAST(N'1902-10-09T00:00:00' AS SmallDateTime))
INSERT [dbo].[tProduct] ([fID], [fName], [fPeriodID], [fCost], [fPrice], [fStocks], [fDescription], [fImagePath], [fMinParticipants], [fMaxParticipants], [fAssemblyPoint], [fStartDate], [fEndDate], [fProviderID], [fRemoved], [fRemark], [fCreationDate], [fLastUpdateDate]) VALUES (44, N'七股潟湖
', 3, 350.0000, 700.0000, 200, N'當地俗稱「內海仔」，是300多年前的台江內海遺跡，面積約1600公頃，搭乘竹筏遊潟湖是體驗七股潟湖的最好方式，有多個船家可以選擇，沿途滿是蚵棚、定置魚網，與悠哉乘著小舟的釣客，可飽覽豐富的潟湖生態，潟湖周邊的紅樹林，滿是白鷺鷥與招潮蟹，另外還有一種很特別的水鳥鸕鶿，雖然身為水鳥，但因為羽毛不防水，所以每下水抓一次魚都要在蚵棚上曬太陽，等候羽毛晾乾才能進行下一次的獵捕，是很有趣的生態行為。', N'七股潟湖
.jpg', 1, 20, N'724台南市七股區', CAST(N'2020-01-01T00:00:00' AS SmallDateTime), CAST(N'2023-12-31T00:00:00' AS SmallDateTime), 13, 0, NULL, CAST(N'1900-01-20T00:00:00' AS SmallDateTime), CAST(N'1902-10-09T00:00:00' AS SmallDateTime))
INSERT [dbo].[tProduct] ([fID], [fName], [fPeriodID], [fCost], [fPrice], [fStocks], [fDescription], [fImagePath], [fMinParticipants], [fMaxParticipants], [fAssemblyPoint], [fStartDate], [fEndDate], [fProviderID], [fRemoved], [fRemark], [fCreationDate], [fLastUpdateDate]) VALUES (45, N'關子嶺大凍山步道&雞籠山', 1, 350.0000, 700.0000, 200, N'大凍山海拔1241公尺，山峰雄偉壯麗，為台南的最高峰，也是台灣的小百岳之一。步道沿途可見低海拔闊葉林，林相生態豐富，溫暖潮濕的氣候使林木生長茂盛，更提供動物良好的棲息環境。', N'關子嶺大凍山步道&雞籠山.jpg', 1, 20, N'732台南市白河區', CAST(N'2020-01-01T00:00:00' AS SmallDateTime), CAST(N'2023-12-31T00:00:00' AS SmallDateTime), 14, 0, NULL, CAST(N'1900-01-20T00:00:00' AS SmallDateTime), CAST(N'1902-10-09T00:00:00' AS SmallDateTime))
INSERT [dbo].[tProduct] ([fID], [fName], [fPeriodID], [fCost], [fPrice], [fStocks], [fDescription], [fImagePath], [fMinParticipants], [fMaxParticipants], [fAssemblyPoint], [fStartDate], [fEndDate], [fProviderID], [fRemoved], [fRemark], [fCreationDate], [fLastUpdateDate]) VALUES (46, N'關子嶺大凍山步道&雞籠山', 2, 350.0000, 700.0000, 200, N'大凍山海拔1241公尺，山峰雄偉壯麗，為台南的最高峰，也是台灣的小百岳之一。步道沿途可見低海拔闊葉林，林相生態豐富，溫暖潮濕的氣候使林木生長茂盛，更提供動物良好的棲息環境。', N'關子嶺大凍山步道&雞籠山.jpg', 1, 20, N'732台南市白河區', CAST(N'2020-01-01T00:00:00' AS SmallDateTime), CAST(N'2023-12-31T00:00:00' AS SmallDateTime), 14, 0, NULL, CAST(N'1900-01-20T00:00:00' AS SmallDateTime), CAST(N'1902-10-09T00:00:00' AS SmallDateTime))
INSERT [dbo].[tProduct] ([fID], [fName], [fPeriodID], [fCost], [fPrice], [fStocks], [fDescription], [fImagePath], [fMinParticipants], [fMaxParticipants], [fAssemblyPoint], [fStartDate], [fEndDate], [fProviderID], [fRemoved], [fRemark], [fCreationDate], [fLastUpdateDate]) VALUES (47, N'關子嶺大凍山步道&雞籠山', 3, 350.0000, 700.0000, 200, N'大凍山海拔1241公尺，山峰雄偉壯麗，為台南的最高峰，也是台灣的小百岳之一。步道沿途可見低海拔闊葉林，林相生態豐富，溫暖潮濕的氣候使林木生長茂盛，更提供動物良好的棲息環境。', N'關子嶺大凍山步道&雞籠山.jpg', 1, 20, N'732台南市白河區', CAST(N'2020-01-01T00:00:00' AS SmallDateTime), CAST(N'2023-12-31T00:00:00' AS SmallDateTime), 14, 0, NULL, CAST(N'1900-01-20T00:00:00' AS SmallDateTime), CAST(N'1902-10-09T00:00:00' AS SmallDateTime))
INSERT [dbo].[tProduct] ([fID], [fName], [fPeriodID], [fCost], [fPrice], [fStocks], [fDescription], [fImagePath], [fMinParticipants], [fMaxParticipants], [fAssemblyPoint], [fStartDate], [fEndDate], [fProviderID], [fRemoved], [fRemark], [fCreationDate], [fLastUpdateDate]) VALUES (48, N'頑皮世界野生動物園', 1, 350.0000, 700.0000, 200, N'頑皮世界是台南目前唯一的動物園，也是台南相當老字號的動物園，照顧動物的用心及經營的理念都頗受遊客們支持喜愛，從踏入園區就可以感受到與動物的親近感，大門口的金剛鸚鵡搖頭晃腦的歡迎著你，動物園裡超人氣的明星水豚、長頸鹿、企鵝、藪貓、狐獴等也都有機會可以近距離的觀賞，是一處以生態教育為理念的專業動物園，過往的動物表演雖然已走入歷史，但園方現在傳達的動物友善及生命教育宣導卻更深入遊客的心中。', N'頑皮世界野生動物園.jpg', 1, 20, N'726台南市學甲區75-25', CAST(N'2020-01-01T00:00:00' AS SmallDateTime), CAST(N'2023-12-31T00:00:00' AS SmallDateTime), 2, 0, NULL, CAST(N'1900-01-20T00:00:00' AS SmallDateTime), CAST(N'1902-10-09T00:00:00' AS SmallDateTime))
INSERT [dbo].[tProduct] ([fID], [fName], [fPeriodID], [fCost], [fPrice], [fStocks], [fDescription], [fImagePath], [fMinParticipants], [fMaxParticipants], [fAssemblyPoint], [fStartDate], [fEndDate], [fProviderID], [fRemoved], [fRemark], [fCreationDate], [fLastUpdateDate]) VALUES (49, N'頑皮世界野生動物園', 2, 350.0000, 700.0000, 200, N'頑皮世界是台南目前唯一的動物園，也是台南相當老字號的動物園，照顧動物的用心及經營的理念都頗受遊客們支持喜愛，從踏入園區就可以感受到與動物的親近感，大門口的金剛鸚鵡搖頭晃腦的歡迎著你，動物園裡超人氣的明星水豚、長頸鹿、企鵝、藪貓、狐獴等也都有機會可以近距離的觀賞，是一處以生態教育為理念的專業動物園，過往的動物表演雖然已走入歷史，但園方現在傳達的動物友善及生命教育宣導卻更深入遊客的心中。', N'頑皮世界野生動物園.jpg', 1, 20, N'726台南市學甲區75-25', CAST(N'2020-01-01T00:00:00' AS SmallDateTime), CAST(N'2023-12-31T00:00:00' AS SmallDateTime), 2, 0, NULL, CAST(N'1900-01-20T00:00:00' AS SmallDateTime), CAST(N'1902-10-09T00:00:00' AS SmallDateTime))
INSERT [dbo].[tProduct] ([fID], [fName], [fPeriodID], [fCost], [fPrice], [fStocks], [fDescription], [fImagePath], [fMinParticipants], [fMaxParticipants], [fAssemblyPoint], [fStartDate], [fEndDate], [fProviderID], [fRemoved], [fRemark], [fCreationDate], [fLastUpdateDate]) VALUES (83, N'石斛蘭瀑布
', 1, 350.0000, 700.0000, 200, N'位於白河區洪氏溪洲部落的石斛蘭瀑布景觀，是由當地居民吳先生投入蘭花種植，將天宮石斛蘭種在家中的老龍眼樹上，因為多株栽種一起，石斛蘭在4月花期同步開花時，萬朵群花盛開呈現有如瀑布傾瀉而下的壯觀景象。', N'石斛蘭瀑布
.jpg', 1, 20, N'732台南市白河區汴頭里', CAST(N'2020-01-01T00:00:00' AS SmallDateTime), CAST(N'2023-12-31T00:00:00' AS SmallDateTime), 6, 0, NULL, CAST(N'1900-01-20T00:00:00' AS SmallDateTime), CAST(N'1902-10-09T00:00:00' AS SmallDateTime))
INSERT [dbo].[tProduct] ([fID], [fName], [fPeriodID], [fCost], [fPrice], [fStocks], [fDescription], [fImagePath], [fMinParticipants], [fMaxParticipants], [fAssemblyPoint], [fStartDate], [fEndDate], [fProviderID], [fRemoved], [fRemark], [fCreationDate], [fLastUpdateDate]) VALUES (84, N'石斛蘭瀑布
', 2, 350.0000, 700.0000, 200, N'位於白河區洪氏溪洲部落的石斛蘭瀑布景觀，是由當地居民吳先生投入蘭花種植，將天宮石斛蘭種在家中的老龍眼樹上，因為多株栽種一起，石斛蘭在4月花期同步開花時，萬朵群花盛開呈現有如瀑布傾瀉而下的壯觀景象。', N'石斛蘭瀑布
.jpg', 1, 20, N'732台南市白河區汴頭里', CAST(N'2020-01-01T00:00:00' AS SmallDateTime), CAST(N'2023-12-31T00:00:00' AS SmallDateTime), 6, 0, NULL, CAST(N'1900-01-20T00:00:00' AS SmallDateTime), CAST(N'1902-10-09T00:00:00' AS SmallDateTime))
INSERT [dbo].[tProduct] ([fID], [fName], [fPeriodID], [fCost], [fPrice], [fStocks], [fDescription], [fImagePath], [fMinParticipants], [fMaxParticipants], [fAssemblyPoint], [fStartDate], [fEndDate], [fProviderID], [fRemoved], [fRemark], [fCreationDate], [fLastUpdateDate]) VALUES (85, N'石斛蘭瀑布
', 3, 350.0000, 700.0000, 200, N'位於白河區洪氏溪洲部落的石斛蘭瀑布景觀，是由當地居民吳先生投入蘭花種植，將天宮石斛蘭種在家中的老龍眼樹上，因為多株栽種一起，石斛蘭在4月花期同步開花時，萬朵群花盛開呈現有如瀑布傾瀉而下的壯觀景象。', N'石斛蘭瀑布
.jpg', 1, 20, N'732台南市白河區汴頭里', CAST(N'2020-01-01T00:00:00' AS SmallDateTime), CAST(N'2023-12-31T00:00:00' AS SmallDateTime), 6, 0, NULL, CAST(N'1900-01-20T00:00:00' AS SmallDateTime), CAST(N'1902-10-09T00:00:00' AS SmallDateTime))
INSERT [dbo].[tProduct] ([fID], [fName], [fPeriodID], [fCost], [fPrice], [fStocks], [fDescription], [fImagePath], [fMinParticipants], [fMaxParticipants], [fAssemblyPoint], [fStartDate], [fEndDate], [fProviderID], [fRemoved], [fRemark], [fCreationDate], [fLastUpdateDate]) VALUES (86, N'曾文水庫', 1, 350.0000, 700.0000, 200, N'有著全台最大水庫的美譽的曾文水庫是臺南市環境教育設施場所，青山綠水有如歐洲風情的景致讓不少遊客一來再來，大壩高聳的氣勢，曾文之眼的耀眼，觀景台上放眼望去有如瑞士湖畔的絕美景觀，是其魅力所在，此處也是許多人共同的青春回憶，規劃完善的露營區域，加上可享受烤肉樂趣的場域，以及青年活動中心的舒適住宿，是大專院校舉辦活動的熱門地點。', N'曾文水庫.jpg', 1, 20, N'715台南市楠西區曾庫公路', CAST(N'2020-01-01T00:00:00' AS SmallDateTime), CAST(N'2023-12-31T00:00:00' AS SmallDateTime), 8, 0, NULL, CAST(N'1900-01-20T00:00:00' AS SmallDateTime), CAST(N'1902-10-09T00:00:00' AS SmallDateTime))
INSERT [dbo].[tProduct] ([fID], [fName], [fPeriodID], [fCost], [fPrice], [fStocks], [fDescription], [fImagePath], [fMinParticipants], [fMaxParticipants], [fAssemblyPoint], [fStartDate], [fEndDate], [fProviderID], [fRemoved], [fRemark], [fCreationDate], [fLastUpdateDate]) VALUES (87, N'曾文水庫', 2, 350.0000, 700.0000, 200, N'有著全台最大水庫的美譽的曾文水庫是臺南市環境教育設施場所，青山綠水有如歐洲風情的景致讓不少遊客一來再來，大壩高聳的氣勢，曾文之眼的耀眼，觀景台上放眼望去有如瑞士湖畔的絕美景觀，是其魅力所在，此處也是許多人共同的青春回憶，規劃完善的露營區域，加上可享受烤肉樂趣的場域，以及青年活動中心的舒適住宿，是大專院校舉辦活動的熱門地點。', N'曾文水庫.jpg', 1, 20, N'715台南市楠西區曾庫公路', CAST(N'2020-01-01T00:00:00' AS SmallDateTime), CAST(N'2023-12-31T00:00:00' AS SmallDateTime), 8, 0, NULL, CAST(N'1900-01-20T00:00:00' AS SmallDateTime), CAST(N'1902-10-09T00:00:00' AS SmallDateTime))
INSERT [dbo].[tProduct] ([fID], [fName], [fPeriodID], [fCost], [fPrice], [fStocks], [fDescription], [fImagePath], [fMinParticipants], [fMaxParticipants], [fAssemblyPoint], [fStartDate], [fEndDate], [fProviderID], [fRemoved], [fRemark], [fCreationDate], [fLastUpdateDate]) VALUES (88, N'台南山上花園水道博物館
', 1, 350.0000, 700.0000, 200, N'孩童的歡鬧聲隨著水花飛濺此起彼落，這是一幅背景為翠綠大地的畫布，灑滿金燦陽光、盛滿五彩鮮花。走進這座花園深處，紅磚色的屋房現身，頂著灰黑色的斜瓦，敞開大門迎接來客，體會過世外的繽紛歡樂，再安靜地閱讀斑駁的水道歷史痕跡。', N'台南山上花園水道博物館
.jpg', 1, 20, N'743台南市山上區16號里山上', CAST(N'2020-01-01T00:00:00' AS SmallDateTime), CAST(N'2023-12-31T00:00:00' AS SmallDateTime), 10, 0, NULL, CAST(N'1900-01-20T00:00:00' AS SmallDateTime), CAST(N'1902-10-09T00:00:00' AS SmallDateTime))
INSERT [dbo].[tProduct] ([fID], [fName], [fPeriodID], [fCost], [fPrice], [fStocks], [fDescription], [fImagePath], [fMinParticipants], [fMaxParticipants], [fAssemblyPoint], [fStartDate], [fEndDate], [fProviderID], [fRemoved], [fRemark], [fCreationDate], [fLastUpdateDate]) VALUES (89, N'台南山上花園水道博物館
', 2, 350.0000, 700.0000, 200, N'孩童的歡鬧聲隨著水花飛濺此起彼落，這是一幅背景為翠綠大地的畫布，灑滿金燦陽光、盛滿五彩鮮花。走進這座花園深處，紅磚色的屋房現身，頂著灰黑色的斜瓦，敞開大門迎接來客，體會過世外的繽紛歡樂，再安靜地閱讀斑駁的水道歷史痕跡。', N'台南山上花園水道博物館
.jpg', 1, 20, N'743台南市山上區16號里山上', CAST(N'2020-01-01T00:00:00' AS SmallDateTime), CAST(N'2023-12-31T00:00:00' AS SmallDateTime), 10, 0, NULL, CAST(N'1900-01-20T00:00:00' AS SmallDateTime), CAST(N'1902-10-09T00:00:00' AS SmallDateTime))
INSERT [dbo].[tProduct] ([fID], [fName], [fPeriodID], [fCost], [fPrice], [fStocks], [fDescription], [fImagePath], [fMinParticipants], [fMaxParticipants], [fAssemblyPoint], [fStartDate], [fEndDate], [fProviderID], [fRemoved], [fRemark], [fCreationDate], [fLastUpdateDate]) VALUES (90, N'老塘湖藝術村
', 1, 350.0000, 700.0000, 200, N'由抽象畫派藝術家匡進福（匡乙）親手打造的「老塘湖藝術村」，以各種廢棄老建材打造，前後創作30餘年，在此可見到台灣早期農村生活、閩式建築和蒙古塞外等不同風格的創作品，是具狂野特色的藝術園區。', N'老塘湖藝術村
.jpg', 1, 20, N'726台南市學甲區豐和里美豐49-26號', CAST(N'2020-01-01T00:00:00' AS SmallDateTime), CAST(N'2023-12-31T00:00:00' AS SmallDateTime), 11, 0, NULL, CAST(N'1900-01-20T00:00:00' AS SmallDateTime), CAST(N'1902-10-09T00:00:00' AS SmallDateTime))
INSERT [dbo].[tProduct] ([fID], [fName], [fPeriodID], [fCost], [fPrice], [fStocks], [fDescription], [fImagePath], [fMinParticipants], [fMaxParticipants], [fAssemblyPoint], [fStartDate], [fEndDate], [fProviderID], [fRemoved], [fRemark], [fCreationDate], [fLastUpdateDate]) VALUES (91, N'老塘湖藝術村
', 2, 350.0000, 700.0000, 200, N'由抽象畫派藝術家匡進福（匡乙）親手打造的「老塘湖藝術村」，以各種廢棄老建材打造，前後創作30餘年，在此可見到台灣早期農村生活、閩式建築和蒙古塞外等不同風格的創作品，是具狂野特色的藝術園區。', N'老塘湖藝術村
.jpg', 1, 20, N'726台南市學甲區豐和里美豐49-26號', CAST(N'2020-01-01T00:00:00' AS SmallDateTime), CAST(N'2023-12-31T00:00:00' AS SmallDateTime), 11, 0, NULL, CAST(N'1900-01-20T00:00:00' AS SmallDateTime), CAST(N'1902-10-09T00:00:00' AS SmallDateTime))
INSERT [dbo].[tProduct] ([fID], [fName], [fPeriodID], [fCost], [fPrice], [fStocks], [fDescription], [fImagePath], [fMinParticipants], [fMaxParticipants], [fAssemblyPoint], [fStartDate], [fEndDate], [fProviderID], [fRemoved], [fRemark], [fCreationDate], [fLastUpdateDate]) VALUES (92, N'赤山龍湖巖
', 1, 350.0000, 700.0000, 200, N'位在半山，被大片的湖泊所環繞，六甲赤山龍湖巖是台灣最早的佛門名剎之一，由於地處偏遠，周圍無商業區、住宅區，更少有觀光客的打擾，因此保有佛寺清淨的氛圍。適合來此點燃清香，藉由幽靜的環境讓心情沈澱，並欣賞寺廟的裝飾藝術。', N'赤山龍湖巖
.jpg', 1, 20, N'734台南市六甲區', CAST(N'2020-01-01T00:00:00' AS SmallDateTime), CAST(N'2023-12-31T00:00:00' AS SmallDateTime), 12, 0, NULL, CAST(N'1900-01-20T00:00:00' AS SmallDateTime), CAST(N'1902-10-09T00:00:00' AS SmallDateTime))
INSERT [dbo].[tProduct] ([fID], [fName], [fPeriodID], [fCost], [fPrice], [fStocks], [fDescription], [fImagePath], [fMinParticipants], [fMaxParticipants], [fAssemblyPoint], [fStartDate], [fEndDate], [fProviderID], [fRemoved], [fRemark], [fCreationDate], [fLastUpdateDate]) VALUES (93, N'赤山龍湖巖
', 2, 350.0000, 700.0000, 200, N'位在半山，被大片的湖泊所環繞，六甲赤山龍湖巖是台灣最早的佛門名剎之一，由於地處偏遠，周圍無商業區、住宅區，更少有觀光客的打擾，因此保有佛寺清淨的氛圍。適合來此點燃清香，藉由幽靜的環境讓心情沈澱，並欣賞寺廟的裝飾藝術。', N'赤山龍湖巖
.jpg', 1, 20, N'734台南市六甲區', CAST(N'2020-01-01T00:00:00' AS SmallDateTime), CAST(N'2023-12-31T00:00:00' AS SmallDateTime), 12, 0, NULL, CAST(N'1900-01-20T00:00:00' AS SmallDateTime), CAST(N'1902-10-09T00:00:00' AS SmallDateTime))
INSERT [dbo].[tProduct] ([fID], [fName], [fPeriodID], [fCost], [fPrice], [fStocks], [fDescription], [fImagePath], [fMinParticipants], [fMaxParticipants], [fAssemblyPoint], [fStartDate], [fEndDate], [fProviderID], [fRemoved], [fRemark], [fCreationDate], [fLastUpdateDate]) VALUES (94, N'淺草新天地
', 1, 350.0000, 700.0000, 200, N'每到假日經過正興街國華街一帶絕對是熱鬧非凡，位於其中的淺草新天地更成了年輕族群的文創市集集散地，淺草新天地的由來是在1933年時，日本人在西門市場周圍興建店舖，稱為「淺草商場」。然而在西門市場改建後，為了振興商圈及吸引年輕族群，規劃了西門淺草二手市集計畫，搭配各種行銷活動，成功的聚集了人氣，也讓周邊商圈更為活絡，假日時除了滿滿創意的二手市集群聚以外，還有街頭藝人的表演，淺草新天地成為西門市場現今不可或缺的的特有文化，持續為市場注入創意與熱力。', N'淺草新天地
.jpg', 1, 20, N'700台南市中西區國華街三段24-40', CAST(N'2020-01-01T00:00:00' AS SmallDateTime), CAST(N'2023-12-31T00:00:00' AS SmallDateTime), 13, 0, NULL, CAST(N'1900-01-20T00:00:00' AS SmallDateTime), CAST(N'1902-10-09T00:00:00' AS SmallDateTime))
INSERT [dbo].[tProduct] ([fID], [fName], [fPeriodID], [fCost], [fPrice], [fStocks], [fDescription], [fImagePath], [fMinParticipants], [fMaxParticipants], [fAssemblyPoint], [fStartDate], [fEndDate], [fProviderID], [fRemoved], [fRemark], [fCreationDate], [fLastUpdateDate]) VALUES (95, N'淺草新天地
', 2, 350.0000, 700.0000, 200, N'每到假日經過正興街國華街一帶絕對是熱鬧非凡，位於其中的淺草新天地更成了年輕族群的文創市集集散地，淺草新天地的由來是在1933年時，日本人在西門市場周圍興建店舖，稱為「淺草商場」。然而在西門市場改建後，為了振興商圈及吸引年輕族群，規劃了西門淺草二手市集計畫，搭配各種行銷活動，成功的聚集了人氣，也讓周邊商圈更為活絡，假日時除了滿滿創意的二手市集群聚以外，還有街頭藝人的表演，淺草新天地成為西門市場現今不可或缺的的特有文化，持續為市場注入創意與熱力。', N'淺草新天地
.jpg', 1, 20, N'700台南市中西區國華街三段24-40', CAST(N'2020-01-01T00:00:00' AS SmallDateTime), CAST(N'2023-12-31T00:00:00' AS SmallDateTime), 13, 0, NULL, CAST(N'1900-01-20T00:00:00' AS SmallDateTime), CAST(N'1902-10-09T00:00:00' AS SmallDateTime))
INSERT [dbo].[tProduct] ([fID], [fName], [fPeriodID], [fCost], [fPrice], [fStocks], [fDescription], [fImagePath], [fMinParticipants], [fMaxParticipants], [fAssemblyPoint], [fStartDate], [fEndDate], [fProviderID], [fRemoved], [fRemark], [fCreationDate], [fLastUpdateDate]) VALUES (96, N'淺草新天地
', 3, 350.0000, 700.0000, 200, N'每到假日經過正興街國華街一帶絕對是熱鬧非凡，位於其中的淺草新天地更成了年輕族群的文創市集集散地，淺草新天地的由來是在1933年時，日本人在西門市場周圍興建店舖，稱為「淺草商場」。然而在西門市場改建後，為了振興商圈及吸引年輕族群，規劃了西門淺草二手市集計畫，搭配各種行銷活動，成功的聚集了人氣，也讓周邊商圈更為活絡，假日時除了滿滿創意的二手市集群聚以外，還有街頭藝人的表演，淺草新天地成為西門市場現今不可或缺的的特有文化，持續為市場注入創意與熱力。', N'淺草新天地
.jpg', 1, 20, N'700台南市中西區國華街三段24-40', CAST(N'2020-01-01T00:00:00' AS SmallDateTime), CAST(N'2023-12-31T00:00:00' AS SmallDateTime), 13, 0, NULL, CAST(N'1900-01-20T00:00:00' AS SmallDateTime), CAST(N'1902-10-09T00:00:00' AS SmallDateTime))
INSERT [dbo].[tProduct] ([fID], [fName], [fPeriodID], [fCost], [fPrice], [fStocks], [fDescription], [fImagePath], [fMinParticipants], [fMaxParticipants], [fAssemblyPoint], [fStartDate], [fEndDate], [fProviderID], [fRemoved], [fRemark], [fCreationDate], [fLastUpdateDate]) VALUES (97, N'八老爺牧場
', 1, 350.0000, 700.0000, 200, N'八翁里在柳營人口中俗稱八老爺，一直都是台灣相當重要的牛乳產地，隨著第一代酪農的凋零，也因為產業的轉變讓位於八老爺內的酪農戶逐漸減少，其中有些變化轉型成了觀光牧場，八老爺牧場就是其中之一，牧場已不再以生產為主，取而代之的是餐廳及乳製品的販售，戶外綠草如茵的牧場中乳牛並不多，少數幾隻乳牛主要只是讓遊客體驗擠牛奶及餵乳牛吃草的樂趣，牧場中其他的都是可愛且親人的動物，比方驢子或是駱馬、兔子、羊等等溫和的動物，動物們在農場的照料下非常健康活潑，而且親人，來過的遊客都因為能與這些動物短暫的親密相處而受到療癒。', N'八老爺牧場
.jpg', 1, 20, N'736台南市柳營區八翁里93-139號', CAST(N'2020-01-01T00:00:00' AS SmallDateTime), CAST(N'2023-12-31T00:00:00' AS SmallDateTime), 14, 0, NULL, CAST(N'1900-01-20T00:00:00' AS SmallDateTime), CAST(N'1902-10-09T00:00:00' AS SmallDateTime))
INSERT [dbo].[tProduct] ([fID], [fName], [fPeriodID], [fCost], [fPrice], [fStocks], [fDescription], [fImagePath], [fMinParticipants], [fMaxParticipants], [fAssemblyPoint], [fStartDate], [fEndDate], [fProviderID], [fRemoved], [fRemark], [fCreationDate], [fLastUpdateDate]) VALUES (98, N'八老爺牧場
', 2, 350.0000, 700.0000, 200, N'八翁里在柳營人口中俗稱八老爺，一直都是台灣相當重要的牛乳產地，隨著第一代酪農的凋零，也因為產業的轉變讓位於八老爺內的酪農戶逐漸減少，其中有些變化轉型成了觀光牧場，八老爺牧場就是其中之一，牧場已不再以生產為主，取而代之的是餐廳及乳製品的販售，戶外綠草如茵的牧場中乳牛並不多，少數幾隻乳牛主要只是讓遊客體驗擠牛奶及餵乳牛吃草的樂趣，牧場中其他的都是可愛且親人的動物，比方驢子或是駱馬、兔子、羊等等溫和的動物，動物們在農場的照料下非常健康活潑，而且親人，來過的遊客都因為能與這些動物短暫的親密相處而受到療癒。', N'八老爺牧場
.jpg', 1, 20, N'736台南市柳營區八翁里93-139號', CAST(N'2020-01-01T00:00:00' AS SmallDateTime), CAST(N'2023-12-31T00:00:00' AS SmallDateTime), 14, 0, NULL, CAST(N'1900-01-20T00:00:00' AS SmallDateTime), CAST(N'1902-10-09T00:00:00' AS SmallDateTime))
INSERT [dbo].[tProduct] ([fID], [fName], [fPeriodID], [fCost], [fPrice], [fStocks], [fDescription], [fImagePath], [fMinParticipants], [fMaxParticipants], [fAssemblyPoint], [fStartDate], [fEndDate], [fProviderID], [fRemoved], [fRemark], [fCreationDate], [fLastUpdateDate]) VALUES (99, N'國立臺灣史前文化博物館南科考古館', 1, 350.0000, 700.0000, 200, N'始自1995年的機緣，開挖出此地五千年的古文明。行政院國家科學委員會委託中研院及史前館進行調查、發掘，至今已發現58處以上遺址，埋存的史前文化最早距今約5,000年，最晚約300多年前，是目前臺灣遺址密度分布最高、文化層序最完整且挖掘面積最大的地區。為了保存、研究並展示因開發所進行的搶救發掘成果，經多方共同努力下，最終完成了國立臺灣史前文化博物館南科考古館佔地約2.42公頃、樓地板面積1萬9千平方米的建館計畫。', N'國立臺灣史前文化博物館南科考古館.jpg', 1, 20, N'744台南市新市區南科三路10號', CAST(N'2020-01-01T00:00:00' AS SmallDateTime), CAST(N'2023-12-31T00:00:00' AS SmallDateTime), 2, 0, NULL, CAST(N'1900-01-20T00:00:00' AS SmallDateTime), CAST(N'1902-10-09T00:00:00' AS SmallDateTime))
INSERT [dbo].[tProduct] ([fID], [fName], [fPeriodID], [fCost], [fPrice], [fStocks], [fDescription], [fImagePath], [fMinParticipants], [fMaxParticipants], [fAssemblyPoint], [fStartDate], [fEndDate], [fProviderID], [fRemoved], [fRemark], [fCreationDate], [fLastUpdateDate]) VALUES (100, N'國立臺灣史前文化博物館南科考古館', 2, 350.0000, 700.0000, 200, N'始自1995年的機緣，開挖出此地五千年的古文明。行政院國家科學委員會委託中研院及史前館進行調查、發掘，至今已發現58處以上遺址，埋存的史前文化最早距今約5,000年，最晚約300多年前，是目前臺灣遺址密度分布最高、文化層序最完整且挖掘面積最大的地區。為了保存、研究並展示因開發所進行的搶救發掘成果，經多方共同努力下，最終完成了國立臺灣史前文化博物館南科考古館佔地約2.42公頃、樓地板面積1萬9千平方米的建館計畫。', N'國立臺灣史前文化博物館南科考古館.jpg', 1, 20, N'744台南市新市區南科三路10號', CAST(N'2020-01-01T00:00:00' AS SmallDateTime), CAST(N'2023-12-31T00:00:00' AS SmallDateTime), 2, 0, NULL, CAST(N'1900-01-20T00:00:00' AS SmallDateTime), CAST(N'1902-10-09T00:00:00' AS SmallDateTime))
INSERT [dbo].[tProduct] ([fID], [fName], [fPeriodID], [fCost], [fPrice], [fStocks], [fDescription], [fImagePath], [fMinParticipants], [fMaxParticipants], [fAssemblyPoint], [fStartDate], [fEndDate], [fProviderID], [fRemoved], [fRemark], [fCreationDate], [fLastUpdateDate]) VALUES (101, N'青鯤鯓青山漁港', 1, 350.0000, 700.0000, 200, N'大台南地區海線有7座漁港，其中位在兩大已轉型觀光遊憩功能的安平、將軍漁港間的青山漁港，是座小而美的漁港，現仍保留濃厚的傳統漁村原味，尤其是每天下午漁船返港時，小小的魚市場總擠滿來自各地的海鮮饕客，而青山漁港能讓遊客直接參與魚貨競價交易，是很好的漁港旅遊體驗樂趣。除漁村景觀外，青山漁港附近還有蚵嗲、火燒蝦、魚柳、古早味冰品等在地特色點心，就算不參與海鮮競標，在漁港附近品嚐小吃，也能飽餐一頓。', N'青鯤鯓青山漁港.jpg', 1, 20, N'725台南市將軍區南26鄉道101號', CAST(N'2020-01-01T00:00:00' AS SmallDateTime), CAST(N'2023-12-31T00:00:00' AS SmallDateTime), 2, 0, NULL, CAST(N'1900-01-20T00:00:00' AS SmallDateTime), CAST(N'1902-10-09T00:00:00' AS SmallDateTime))
INSERT [dbo].[tProduct] ([fID], [fName], [fPeriodID], [fCost], [fPrice], [fStocks], [fDescription], [fImagePath], [fMinParticipants], [fMaxParticipants], [fAssemblyPoint], [fStartDate], [fEndDate], [fProviderID], [fRemoved], [fRemark], [fCreationDate], [fLastUpdateDate]) VALUES (102, N'青鯤鯓青山漁港', 2, 350.0000, 700.0000, 200, N'大台南地區海線有7座漁港，其中位在兩大已轉型觀光遊憩功能的安平、將軍漁港間的青山漁港，是座小而美的漁港，現仍保留濃厚的傳統漁村原味，尤其是每天下午漁船返港時，小小的魚市場總擠滿來自各地的海鮮饕客，而青山漁港能讓遊客直接參與魚貨競價交易，是很好的漁港旅遊體驗樂趣。除漁村景觀外，青山漁港附近還有蚵嗲、火燒蝦、魚柳、古早味冰品等在地特色點心，就算不參與海鮮競標，在漁港附近品嚐小吃，也能飽餐一頓。', N'青鯤鯓青山漁港.jpg', 1, 20, N'725台南市將軍區南26鄉道101號', CAST(N'2020-01-01T00:00:00' AS SmallDateTime), CAST(N'2023-12-31T00:00:00' AS SmallDateTime), 2, 0, NULL, CAST(N'1900-01-20T00:00:00' AS SmallDateTime), CAST(N'1902-10-09T00:00:00' AS SmallDateTime))
INSERT [dbo].[tProduct] ([fID], [fName], [fPeriodID], [fCost], [fPrice], [fStocks], [fDescription], [fImagePath], [fMinParticipants], [fMaxParticipants], [fAssemblyPoint], [fStartDate], [fEndDate], [fProviderID], [fRemoved], [fRemark], [fCreationDate], [fLastUpdateDate]) VALUES (103, N'赤崁文化園區
', 1, 350.0000, 700.0000, 200, N'西元一六二四年，荷蘭人在安平築熱蘭遮城後，因腹地的關係，他們選擇台江對岸的赤崁（當時台南稱平埔族人赤崁社的所在地）另築一座政經中心－普羅民遮城（今赤崁樓）。並發展出赤崁街與普羅民遮街，為府城繁華的商業史揭開序幕。

赤崁文化園區範圍，以赤崁樓為最大地標建築，範圍大約是新美街以東，成功路以南至民權路左右的區塊，新美街一帶正是十七世紀台南海岸線的位置，園區內赤崁樓、祀典大天后宮、祀典武廟等國定古蹟矗立，回味荷蘭、鄭氏、清領跨跨越時空的歷史軌跡。', N'赤崁文化園區
.jpg', 1, 20, N'No.180, Sec. 1, Jiankang Rd., West Central Dist., Tainan City 700, Taiwan, (R.O.C, 中西區台南市70052', CAST(N'2020-01-01T00:00:00' AS SmallDateTime), CAST(N'2023-12-31T00:00:00' AS SmallDateTime), 2, 0, NULL, CAST(N'1900-01-20T00:00:00' AS SmallDateTime), CAST(N'1902-10-09T00:00:00' AS SmallDateTime))
INSERT [dbo].[tProduct] ([fID], [fName], [fPeriodID], [fCost], [fPrice], [fStocks], [fDescription], [fImagePath], [fMinParticipants], [fMaxParticipants], [fAssemblyPoint], [fStartDate], [fEndDate], [fProviderID], [fRemoved], [fRemark], [fCreationDate], [fLastUpdateDate]) VALUES (104, N'赤崁文化園區
', 2, 350.0000, 700.0000, 200, N'西元一六二四年，荷蘭人在安平築熱蘭遮城後，因腹地的關係，他們選擇台江對岸的赤崁（當時台南稱平埔族人赤崁社的所在地）另築一座政經中心－普羅民遮城（今赤崁樓）。並發展出赤崁街與普羅民遮街，為府城繁華的商業史揭開序幕。

赤崁文化園區範圍，以赤崁樓為最大地標建築，範圍大約是新美街以東，成功路以南至民權路左右的區塊，新美街一帶正是十七世紀台南海岸線的位置，園區內赤崁樓、祀典大天后宮、祀典武廟等國定古蹟矗立，回味荷蘭、鄭氏、清領跨跨越時空的歷史軌跡。', N'赤崁文化園區
.jpg', 1, 20, N'No.180, Sec. 1, Jiankang Rd., West Central Dist., Tainan City 700, Taiwan, (R.O.C, 中西區台南市70052', CAST(N'2020-01-01T00:00:00' AS SmallDateTime), CAST(N'2023-12-31T00:00:00' AS SmallDateTime), 2, 0, NULL, CAST(N'1900-01-20T00:00:00' AS SmallDateTime), CAST(N'1902-10-09T00:00:00' AS SmallDateTime))
INSERT [dbo].[tProduct] ([fID], [fName], [fPeriodID], [fCost], [fPrice], [fStocks], [fDescription], [fImagePath], [fMinParticipants], [fMaxParticipants], [fAssemblyPoint], [fStartDate], [fEndDate], [fProviderID], [fRemoved], [fRemark], [fCreationDate], [fLastUpdateDate]) VALUES (105, N'赤崁文化園區
', 3, 350.0000, 700.0000, 200, N'西元一六二四年，荷蘭人在安平築熱蘭遮城後，因腹地的關係，他們選擇台江對岸的赤崁（當時台南稱平埔族人赤崁社的所在地）另築一座政經中心－普羅民遮城（今赤崁樓）。並發展出赤崁街與普羅民遮街，為府城繁華的商業史揭開序幕。

赤崁文化園區範圍，以赤崁樓為最大地標建築，範圍大約是新美街以東，成功路以南至民權路左右的區塊，新美街一帶正是十七世紀台南海岸線的位置，園區內赤崁樓、祀典大天后宮、祀典武廟等國定古蹟矗立，回味荷蘭、鄭氏、清領跨跨越時空的歷史軌跡。', N'赤崁文化園區
.jpg', 1, 20, N'No.180, Sec. 1, Jiankang Rd., West Central Dist., Tainan City 700, Taiwan, (R.O.C, 中西區台南市70052', CAST(N'2020-01-01T00:00:00' AS SmallDateTime), CAST(N'2023-12-31T00:00:00' AS SmallDateTime), 2, 0, NULL, CAST(N'1900-01-20T00:00:00' AS SmallDateTime), CAST(N'1902-10-09T00:00:00' AS SmallDateTime))
INSERT [dbo].[tProduct] ([fID], [fName], [fPeriodID], [fCost], [fPrice], [fStocks], [fDescription], [fImagePath], [fMinParticipants], [fMaxParticipants], [fAssemblyPoint], [fStartDate], [fEndDate], [fProviderID], [fRemoved], [fRemark], [fCreationDate], [fLastUpdateDate]) VALUES (106, N'臺灣府城大南門
', 1, 350.0000, 700.0000, 200, N'目前原臺南市區內現存的城門有「悅兌門」、「大東門」、「大南門」、「小西門」，當中臺灣府城的大南門又稱「寧南門」，位於臺南市中西區南門路的南門公園內，鄰近孔廟、位於孔廟正南方，出城向南行有五妃廟，大南門目前是直轄市定古蹟。', N'臺灣府城大南門
.jpg', 1, 20, N'No.180, Sec. 1, Jiankang Rd., West Central Dist., Tainan City 700, Taiwan, (R.O.C, 中西區台南市70052', CAST(N'2020-01-01T00:00:00' AS SmallDateTime), CAST(N'2023-12-31T00:00:00' AS SmallDateTime), 2, 0, NULL, CAST(N'1900-01-20T00:00:00' AS SmallDateTime), CAST(N'1902-10-09T00:00:00' AS SmallDateTime))
INSERT [dbo].[tProduct] ([fID], [fName], [fPeriodID], [fCost], [fPrice], [fStocks], [fDescription], [fImagePath], [fMinParticipants], [fMaxParticipants], [fAssemblyPoint], [fStartDate], [fEndDate], [fProviderID], [fRemoved], [fRemark], [fCreationDate], [fLastUpdateDate]) VALUES (107, N'臺灣府城大南門
', 2, 350.0000, 700.0000, 200, N'目前原臺南市區內現存的城門有「悅兌門」、「大東門」、「大南門」、「小西門」，當中臺灣府城的大南門又稱「寧南門」，位於臺南市中西區南門路的南門公園內，鄰近孔廟、位於孔廟正南方，出城向南行有五妃廟，大南門目前是直轄市定古蹟。', N'臺灣府城大南門
.jpg', 1, 20, N'No.180, Sec. 1, Jiankang Rd., West Central Dist., Tainan City 700, Taiwan, (R.O.C, 中西區台南市70052', CAST(N'2020-01-01T00:00:00' AS SmallDateTime), CAST(N'2023-12-31T00:00:00' AS SmallDateTime), 2, 0, NULL, CAST(N'1900-01-20T00:00:00' AS SmallDateTime), CAST(N'1902-10-09T00:00:00' AS SmallDateTime))
INSERT [dbo].[tProduct] ([fID], [fName], [fPeriodID], [fCost], [fPrice], [fStocks], [fDescription], [fImagePath], [fMinParticipants], [fMaxParticipants], [fAssemblyPoint], [fStartDate], [fEndDate], [fProviderID], [fRemoved], [fRemark], [fCreationDate], [fLastUpdateDate]) VALUES (108, N'臺灣府城大南門
', 3, 350.0000, 700.0000, 200, N'目前原臺南市區內現存的城門有「悅兌門」、「大東門」、「大南門」、「小西門」，當中臺灣府城的大南門又稱「寧南門」，位於臺南市中西區南門路的南門公園內，鄰近孔廟、位於孔廟正南方，出城向南行有五妃廟，大南門目前是直轄市定古蹟。', N'臺灣府城大南門
.jpg', 1, 20, N'No.180, Sec. 1, Jiankang Rd., West Central Dist., Tainan City 700, Taiwan, (R.O.C, 中西區台南市70052', CAST(N'2020-01-01T00:00:00' AS SmallDateTime), CAST(N'2023-12-31T00:00:00' AS SmallDateTime), 2, 0, NULL, CAST(N'1900-01-20T00:00:00' AS SmallDateTime), CAST(N'1902-10-09T00:00:00' AS SmallDateTime))
INSERT [dbo].[tProduct] ([fID], [fName], [fPeriodID], [fCost], [fPrice], [fStocks], [fDescription], [fImagePath], [fMinParticipants], [fMaxParticipants], [fAssemblyPoint], [fStartDate], [fEndDate], [fProviderID], [fRemoved], [fRemark], [fCreationDate], [fLastUpdateDate]) VALUES (109, N'黑面琵鷺生態展示館', 1, 350.0000, 700.0000, 200, N'在通往黑面琵鷺保護區的廣闊魚塭之中，會見到一棟造型非常特殊的房屋，優雅的座落於水面上，這是台南第一座「水上屋」，也是臺南市重要的環境教育設施場所，更是七股黑面琵鷺保護區的重要據點。', N'黑面琵鷺生態展示館.jpg', 1, 20, N'724台南市七股區海埔堤防', CAST(N'2020-01-01T00:00:00' AS SmallDateTime), CAST(N'2023-12-31T00:00:00' AS SmallDateTime), 2, 0, NULL, CAST(N'1900-01-20T00:00:00' AS SmallDateTime), CAST(N'1902-10-09T00:00:00' AS SmallDateTime))
INSERT [dbo].[tProduct] ([fID], [fName], [fPeriodID], [fCost], [fPrice], [fStocks], [fDescription], [fImagePath], [fMinParticipants], [fMaxParticipants], [fAssemblyPoint], [fStartDate], [fEndDate], [fProviderID], [fRemoved], [fRemark], [fCreationDate], [fLastUpdateDate]) VALUES (110, N'黑面琵鷺生態展示館', 2, 350.0000, 700.0000, 200, N'在通往黑面琵鷺保護區的廣闊魚塭之中，會見到一棟造型非常特殊的房屋，優雅的座落於水面上，這是台南第一座「水上屋」，也是臺南市重要的環境教育設施場所，更是七股黑面琵鷺保護區的重要據點。', N'黑面琵鷺生態展示館.jpg', 1, 20, N'724台南市七股區海埔堤防', CAST(N'2020-01-01T00:00:00' AS SmallDateTime), CAST(N'2023-12-31T00:00:00' AS SmallDateTime), 2, 0, NULL, CAST(N'1900-01-20T00:00:00' AS SmallDateTime), CAST(N'1902-10-09T00:00:00' AS SmallDateTime))
INSERT [dbo].[tProduct] ([fID], [fName], [fPeriodID], [fCost], [fPrice], [fStocks], [fDescription], [fImagePath], [fMinParticipants], [fMaxParticipants], [fAssemblyPoint], [fStartDate], [fEndDate], [fProviderID], [fRemoved], [fRemark], [fCreationDate], [fLastUpdateDate]) VALUES (111, N'原臺南愛國婦人會館
', 1, 350.0000, 700.0000, 200, N'日本愛國婦人會是日本二次大戰時主要的婦女團體，成員多由具有社會地位和高階教育的婦人組成，其宗旨為關心地方建設、從事社會服務，本部位於台北，此處為南支部，會館建於1920年位置就在現今相當知名的莉莉水果冰旁邊，為典型的和洋式建築，分為北棟與南棟，北棟為會館部分，南棟則為宿舍區域。', N'原臺南愛國婦人會館
.jpg', 1, 20, N'700台南市中西區182縣道220-230', CAST(N'2020-01-01T00:00:00' AS SmallDateTime), CAST(N'2023-12-31T00:00:00' AS SmallDateTime), 2, 0, NULL, CAST(N'1900-01-20T00:00:00' AS SmallDateTime), CAST(N'1902-10-09T00:00:00' AS SmallDateTime))
INSERT [dbo].[tProduct] ([fID], [fName], [fPeriodID], [fCost], [fPrice], [fStocks], [fDescription], [fImagePath], [fMinParticipants], [fMaxParticipants], [fAssemblyPoint], [fStartDate], [fEndDate], [fProviderID], [fRemoved], [fRemark], [fCreationDate], [fLastUpdateDate]) VALUES (112, N'原臺南愛國婦人會館
', 2, 350.0000, 700.0000, 200, N'日本愛國婦人會是日本二次大戰時主要的婦女團體，成員多由具有社會地位和高階教育的婦人組成，其宗旨為關心地方建設、從事社會服務，本部位於台北，此處為南支部，會館建於1920年位置就在現今相當知名的莉莉水果冰旁邊，為典型的和洋式建築，分為北棟與南棟，北棟為會館部分，南棟則為宿舍區域。', N'原臺南愛國婦人會館
.jpg', 1, 20, N'700台南市中西區182縣道220-230', CAST(N'2020-01-01T00:00:00' AS SmallDateTime), CAST(N'2023-12-31T00:00:00' AS SmallDateTime), 2, 0, NULL, CAST(N'1900-01-20T00:00:00' AS SmallDateTime), CAST(N'1902-10-09T00:00:00' AS SmallDateTime))
INSERT [dbo].[tProduct] ([fID], [fName], [fPeriodID], [fCost], [fPrice], [fStocks], [fDescription], [fImagePath], [fMinParticipants], [fMaxParticipants], [fAssemblyPoint], [fStartDate], [fEndDate], [fProviderID], [fRemoved], [fRemark], [fCreationDate], [fLastUpdateDate]) VALUES (113, N'四草大眾廟
', 1, 350.0000, 700.0000, 200, N'四草大眾廟主祀「鎮海元帥」，名為陳酉，驍勇善戰，為清朝台人最高武官，卻受奸臣所害鬱結而吞金投海，其遺體卻立於海上，飄流到台江北汕尾島(四草大眾廟現址)的海灘前，乾隆皇帝諡封其為鎮海大元帥，坐鎮大眾廟，故又稱大眾爺，為台灣人成神第一人。大眾廟建廟迄今已三百餘年，為安南區四草的信仰中心，也為台江增添一份雄厚古風之氣。', N'四草大眾廟
.jpg', 1, 20, N'709台南市安南區顯草街一段501巷', CAST(N'2020-01-01T00:00:00' AS SmallDateTime), CAST(N'2023-12-31T00:00:00' AS SmallDateTime), 2, 0, NULL, CAST(N'1900-01-20T00:00:00' AS SmallDateTime), CAST(N'1902-10-09T00:00:00' AS SmallDateTime))
INSERT [dbo].[tProduct] ([fID], [fName], [fPeriodID], [fCost], [fPrice], [fStocks], [fDescription], [fImagePath], [fMinParticipants], [fMaxParticipants], [fAssemblyPoint], [fStartDate], [fEndDate], [fProviderID], [fRemoved], [fRemark], [fCreationDate], [fLastUpdateDate]) VALUES (114, N'四草大眾廟
', 2, 350.0000, 700.0000, 200, N'四草大眾廟主祀「鎮海元帥」，名為陳酉，驍勇善戰，為清朝台人最高武官，卻受奸臣所害鬱結而吞金投海，其遺體卻立於海上，飄流到台江北汕尾島(四草大眾廟現址)的海灘前，乾隆皇帝諡封其為鎮海大元帥，坐鎮大眾廟，故又稱大眾爺，為台灣人成神第一人。大眾廟建廟迄今已三百餘年，為安南區四草的信仰中心，也為台江增添一份雄厚古風之氣。', N'四草大眾廟
.jpg', 1, 20, N'709台南市安南區顯草街一段501巷', CAST(N'2020-01-01T00:00:00' AS SmallDateTime), CAST(N'2023-12-31T00:00:00' AS SmallDateTime), 2, 0, NULL, CAST(N'1900-01-20T00:00:00' AS SmallDateTime), CAST(N'1902-10-09T00:00:00' AS SmallDateTime))
INSERT [dbo].[tProduct] ([fID], [fName], [fPeriodID], [fCost], [fPrice], [fStocks], [fDescription], [fImagePath], [fMinParticipants], [fMaxParticipants], [fAssemblyPoint], [fStartDate], [fEndDate], [fProviderID], [fRemoved], [fRemark], [fCreationDate], [fLastUpdateDate]) VALUES (115, N'四草大眾廟
', 3, 350.0000, 700.0000, 200, N'四草大眾廟主祀「鎮海元帥」，名為陳酉，驍勇善戰，為清朝台人最高武官，卻受奸臣所害鬱結而吞金投海，其遺體卻立於海上，飄流到台江北汕尾島(四草大眾廟現址)的海灘前，乾隆皇帝諡封其為鎮海大元帥，坐鎮大眾廟，故又稱大眾爺，為台灣人成神第一人。大眾廟建廟迄今已三百餘年，為安南區四草的信仰中心，也為台江增添一份雄厚古風之氣。', N'四草大眾廟
.jpg', 1, 20, N'709台南市安南區顯草街一段501巷', CAST(N'2020-01-01T00:00:00' AS SmallDateTime), CAST(N'2023-12-31T00:00:00' AS SmallDateTime), 2, 0, NULL, CAST(N'1900-01-20T00:00:00' AS SmallDateTime), CAST(N'1902-10-09T00:00:00' AS SmallDateTime))
INSERT [dbo].[tProduct] ([fID], [fName], [fPeriodID], [fCost], [fPrice], [fStocks], [fDescription], [fImagePath], [fMinParticipants], [fMaxParticipants], [fAssemblyPoint], [fStartDate], [fEndDate], [fProviderID], [fRemoved], [fRemark], [fCreationDate], [fLastUpdateDate]) VALUES (116, N'蓮花公園
', 1, 350.0000, 700.0000, 200, N'白河的蓮花田散佈在白河區域各處，如果想一次看好看滿，首推蓮花公園，公園內步道等設施完善，停車場、化妝室都有，對遊客來說非常方便。廣大的蓮花田更像是一大片蓮海般壯觀，每當風吹起，整片蓮花田隨之起伏飄逸，真的有如海浪般一波一波柔和的律動著，最佳的賞蓮海處就是蓮池中央的涼亭，坐在裡面享受被蓮花包圍的雅趣，一朵一朵的蓮花彷彿近在眼前，加上遠方的藍天白雲與綠意盎然的樹林，可說是賞蓮的VIP座位。', N'蓮花公園
.jpg', 1, 20, N'732台南市白河區詔安里', CAST(N'2020-01-01T00:00:00' AS SmallDateTime), CAST(N'2023-12-31T00:00:00' AS SmallDateTime), 2, 0, NULL, CAST(N'1900-01-20T00:00:00' AS SmallDateTime), CAST(N'1902-10-09T00:00:00' AS SmallDateTime))
INSERT [dbo].[tProduct] ([fID], [fName], [fPeriodID], [fCost], [fPrice], [fStocks], [fDescription], [fImagePath], [fMinParticipants], [fMaxParticipants], [fAssemblyPoint], [fStartDate], [fEndDate], [fProviderID], [fRemoved], [fRemark], [fCreationDate], [fLastUpdateDate]) VALUES (117, N'蓮花公園
', 2, 350.0000, 700.0000, 200, N'白河的蓮花田散佈在白河區域各處，如果想一次看好看滿，首推蓮花公園，公園內步道等設施完善，停車場、化妝室都有，對遊客來說非常方便。廣大的蓮花田更像是一大片蓮海般壯觀，每當風吹起，整片蓮花田隨之起伏飄逸，真的有如海浪般一波一波柔和的律動著，最佳的賞蓮海處就是蓮池中央的涼亭，坐在裡面享受被蓮花包圍的雅趣，一朵一朵的蓮花彷彿近在眼前，加上遠方的藍天白雲與綠意盎然的樹林，可說是賞蓮的VIP座位。', N'蓮花公園
.jpg', 1, 20, N'732台南市白河區詔安里', CAST(N'2020-01-01T00:00:00' AS SmallDateTime), CAST(N'2023-12-31T00:00:00' AS SmallDateTime), 2, 0, NULL, CAST(N'1900-01-20T00:00:00' AS SmallDateTime), CAST(N'1902-10-09T00:00:00' AS SmallDateTime))
INSERT [dbo].[tProduct] ([fID], [fName], [fPeriodID], [fCost], [fPrice], [fStocks], [fDescription], [fImagePath], [fMinParticipants], [fMaxParticipants], [fAssemblyPoint], [fStartDate], [fEndDate], [fProviderID], [fRemoved], [fRemark], [fCreationDate], [fLastUpdateDate]) VALUES (118, N'蓮花公園
', 3, 350.0000, 700.0000, 200, N'白河的蓮花田散佈在白河區域各處，如果想一次看好看滿，首推蓮花公園，公園內步道等設施完善，停車場、化妝室都有，對遊客來說非常方便。廣大的蓮花田更像是一大片蓮海般壯觀，每當風吹起，整片蓮花田隨之起伏飄逸，真的有如海浪般一波一波柔和的律動著，最佳的賞蓮海處就是蓮池中央的涼亭，坐在裡面享受被蓮花包圍的雅趣，一朵一朵的蓮花彷彿近在眼前，加上遠方的藍天白雲與綠意盎然的樹林，可說是賞蓮的VIP座位。', N'蓮花公園
.jpg', 1, 20, N'732台南市白河區詔安里', CAST(N'2020-01-01T00:00:00' AS SmallDateTime), CAST(N'2023-12-31T00:00:00' AS SmallDateTime), 2, 0, NULL, CAST(N'1900-01-20T00:00:00' AS SmallDateTime), CAST(N'1902-10-09T00:00:00' AS SmallDateTime))
INSERT [dbo].[tProduct] ([fID], [fName], [fPeriodID], [fCost], [fPrice], [fStocks], [fDescription], [fImagePath], [fMinParticipants], [fMaxParticipants], [fAssemblyPoint], [fStartDate], [fEndDate], [fProviderID], [fRemoved], [fRemark], [fCreationDate], [fLastUpdateDate]) VALUES (119, N'南元休閒農場
', 1, 350.0000, 700.0000, 200, N'南元農場位於柳營與六甲的交界處，是當地非常受到歡迎的農場，同時也是寵物友善農場，多樣化的設施及景觀讓這個老字號的農場歷久不衰，美麗的湖上木屋群是南元農場最具代表性的一景，而新穎現代化的旅館大樓也讓遊客有了多樣化的住宿選擇。', N'南元休閒農場
.jpg', 1, 20, N'736台南市柳營區果毅里', CAST(N'2020-01-01T00:00:00' AS SmallDateTime), CAST(N'2023-12-31T00:00:00' AS SmallDateTime), 6, 0, NULL, CAST(N'1900-01-20T00:00:00' AS SmallDateTime), CAST(N'1902-10-09T00:00:00' AS SmallDateTime))
INSERT [dbo].[tProduct] ([fID], [fName], [fPeriodID], [fCost], [fPrice], [fStocks], [fDescription], [fImagePath], [fMinParticipants], [fMaxParticipants], [fAssemblyPoint], [fStartDate], [fEndDate], [fProviderID], [fRemoved], [fRemark], [fCreationDate], [fLastUpdateDate]) VALUES (120, N'南元休閒農場
', 2, 350.0000, 700.0000, 200, N'南元農場位於柳營與六甲的交界處，是當地非常受到歡迎的農場，同時也是寵物友善農場，多樣化的設施及景觀讓這個老字號的農場歷久不衰，美麗的湖上木屋群是南元農場最具代表性的一景，而新穎現代化的旅館大樓也讓遊客有了多樣化的住宿選擇。', N'南元休閒農場
.jpg', 1, 20, N'736台南市柳營區果毅里', CAST(N'2020-01-01T00:00:00' AS SmallDateTime), CAST(N'2023-12-31T00:00:00' AS SmallDateTime), 6, 0, NULL, CAST(N'1900-01-20T00:00:00' AS SmallDateTime), CAST(N'1902-10-09T00:00:00' AS SmallDateTime))
INSERT [dbo].[tProduct] ([fID], [fName], [fPeriodID], [fCost], [fPrice], [fStocks], [fDescription], [fImagePath], [fMinParticipants], [fMaxParticipants], [fAssemblyPoint], [fStartDate], [fEndDate], [fProviderID], [fRemoved], [fRemark], [fCreationDate], [fLastUpdateDate]) VALUES (121, N'南元休閒農場
', 3, 350.0000, 700.0000, 200, N'南元農場位於柳營與六甲的交界處，是當地非常受到歡迎的農場，同時也是寵物友善農場，多樣化的設施及景觀讓這個老字號的農場歷久不衰，美麗的湖上木屋群是南元農場最具代表性的一景，而新穎現代化的旅館大樓也讓遊客有了多樣化的住宿選擇。', N'南元休閒農場
.jpg', 1, 20, N'736台南市柳營區果毅里', CAST(N'2020-01-01T00:00:00' AS SmallDateTime), CAST(N'2023-12-31T00:00:00' AS SmallDateTime), 6, 0, NULL, CAST(N'1900-01-20T00:00:00' AS SmallDateTime), CAST(N'1902-10-09T00:00:00' AS SmallDateTime))
INSERT [dbo].[tProduct] ([fID], [fName], [fPeriodID], [fCost], [fPrice], [fStocks], [fDescription], [fImagePath], [fMinParticipants], [fMaxParticipants], [fAssemblyPoint], [fStartDate], [fEndDate], [fProviderID], [fRemoved], [fRemark], [fCreationDate], [fLastUpdateDate]) VALUES (122, N'鹿陶洋江家古厝
', 1, 350.0000, 700.0000, 200, N'在台3線開車奔馳而過絕對不能忽略這裡，因為拍攝電影總舖師而爆紅的經典場景，江家古厝是保存非常完整的聚落，祠堂公廳的中軸四進三院，子孫居住的左右廂房左六右七象徵13條龍，最外圍就是雞舍豬寮等。', N'鹿陶洋江家古厝
.jpg', 1, 20, N'715台南市楠西區鹿田里鹿陶洋', CAST(N'2020-01-01T00:00:00' AS SmallDateTime), CAST(N'2023-12-31T00:00:00' AS SmallDateTime), 6, 0, NULL, CAST(N'1900-01-20T00:00:00' AS SmallDateTime), CAST(N'1902-10-09T00:00:00' AS SmallDateTime))
INSERT [dbo].[tProduct] ([fID], [fName], [fPeriodID], [fCost], [fPrice], [fStocks], [fDescription], [fImagePath], [fMinParticipants], [fMaxParticipants], [fAssemblyPoint], [fStartDate], [fEndDate], [fProviderID], [fRemoved], [fRemark], [fCreationDate], [fLastUpdateDate]) VALUES (123, N'鹿陶洋江家古厝
', 2, 350.0000, 700.0000, 200, N'在台3線開車奔馳而過絕對不能忽略這裡，因為拍攝電影總舖師而爆紅的經典場景，江家古厝是保存非常完整的聚落，祠堂公廳的中軸四進三院，子孫居住的左右廂房左六右七象徵13條龍，最外圍就是雞舍豬寮等。', N'鹿陶洋江家古厝
.jpg', 1, 20, N'715台南市楠西區鹿田里鹿陶洋', CAST(N'2020-01-01T00:00:00' AS SmallDateTime), CAST(N'2023-12-31T00:00:00' AS SmallDateTime), 6, 0, NULL, CAST(N'1900-01-20T00:00:00' AS SmallDateTime), CAST(N'1902-10-09T00:00:00' AS SmallDateTime))
INSERT [dbo].[tProduct] ([fID], [fName], [fPeriodID], [fCost], [fPrice], [fStocks], [fDescription], [fImagePath], [fMinParticipants], [fMaxParticipants], [fAssemblyPoint], [fStartDate], [fEndDate], [fProviderID], [fRemoved], [fRemark], [fCreationDate], [fLastUpdateDate]) VALUES (124, N'鹿陶洋江家古厝
', 3, 350.0000, 700.0000, 200, N'在台3線開車奔馳而過絕對不能忽略這裡，因為拍攝電影總舖師而爆紅的經典場景，江家古厝是保存非常完整的聚落，祠堂公廳的中軸四進三院，子孫居住的左右廂房左六右七象徵13條龍，最外圍就是雞舍豬寮等。', N'鹿陶洋江家古厝
.jpg', 1, 20, N'715台南市楠西區鹿田里鹿陶洋', CAST(N'2020-01-01T00:00:00' AS SmallDateTime), CAST(N'2023-12-31T00:00:00' AS SmallDateTime), 6, 0, NULL, CAST(N'1900-01-20T00:00:00' AS SmallDateTime), CAST(N'1902-10-09T00:00:00' AS SmallDateTime))
INSERT [dbo].[tProduct] ([fID], [fName], [fPeriodID], [fCost], [fPrice], [fStocks], [fDescription], [fImagePath], [fMinParticipants], [fMaxParticipants], [fAssemblyPoint], [fStartDate], [fEndDate], [fProviderID], [fRemoved], [fRemark], [fCreationDate], [fLastUpdateDate]) VALUES (125, N'仙湖農場
', 1, 350.0000, 700.0000, 200, N'沿著175公路往六甲方向沿路就會看到仙湖農場的指標，蜿蜒的山路中處處可見路邊的青皮椪柑，農場中間的瞭望台，是仙湖農場的大地標，從遠處望去真的像極了花東的農場。', N'仙湖農場
.jpg', 1, 20, N'733台南市東山區南勢里', CAST(N'2020-01-01T00:00:00' AS SmallDateTime), CAST(N'2023-12-31T00:00:00' AS SmallDateTime), 6, 0, NULL, CAST(N'1900-01-20T00:00:00' AS SmallDateTime), CAST(N'1902-10-09T00:00:00' AS SmallDateTime))
INSERT [dbo].[tProduct] ([fID], [fName], [fPeriodID], [fCost], [fPrice], [fStocks], [fDescription], [fImagePath], [fMinParticipants], [fMaxParticipants], [fAssemblyPoint], [fStartDate], [fEndDate], [fProviderID], [fRemoved], [fRemark], [fCreationDate], [fLastUpdateDate]) VALUES (126, N'仙湖農場
', 2, 350.0000, 700.0000, 200, N'沿著175公路往六甲方向沿路就會看到仙湖農場的指標，蜿蜒的山路中處處可見路邊的青皮椪柑，農場中間的瞭望台，是仙湖農場的大地標，從遠處望去真的像極了花東的農場。', N'仙湖農場
.jpg', 1, 20, N'733台南市東山區南勢里', CAST(N'2020-01-01T00:00:00' AS SmallDateTime), CAST(N'2023-12-31T00:00:00' AS SmallDateTime), 6, 0, NULL, CAST(N'1900-01-20T00:00:00' AS SmallDateTime), CAST(N'1902-10-09T00:00:00' AS SmallDateTime))
INSERT [dbo].[tProduct] ([fID], [fName], [fPeriodID], [fCost], [fPrice], [fStocks], [fDescription], [fImagePath], [fMinParticipants], [fMaxParticipants], [fAssemblyPoint], [fStartDate], [fEndDate], [fProviderID], [fRemoved], [fRemark], [fCreationDate], [fLastUpdateDate]) VALUES (127, N'成大榕園
', 1, 350.0000, 700.0000, 200, N'成大的榕樹一直都是台南的形象代表之一，傳說為1923年日本裕仁太子（即昭和天皇）巡視台灣時親手種植，時至今日，榕樹有如慈祥的老校友一樣每日屹立看守著成大校園，迎接來自各地的新生，也目送許多完成學業的畢業生，每到畢業季時總是有不少學生在此合影留念，離情依依。', N'成大榕園
.jpg', 1, 20, N'701台南市東區大學路1號成功大學光復校區', CAST(N'2020-01-01T00:00:00' AS SmallDateTime), CAST(N'2023-12-31T00:00:00' AS SmallDateTime), 6, 0, NULL, CAST(N'1900-01-20T00:00:00' AS SmallDateTime), CAST(N'1902-10-09T00:00:00' AS SmallDateTime))
INSERT [dbo].[tProduct] ([fID], [fName], [fPeriodID], [fCost], [fPrice], [fStocks], [fDescription], [fImagePath], [fMinParticipants], [fMaxParticipants], [fAssemblyPoint], [fStartDate], [fEndDate], [fProviderID], [fRemoved], [fRemark], [fCreationDate], [fLastUpdateDate]) VALUES (128, N'成大榕園
', 2, 350.0000, 700.0000, 200, N'成大的榕樹一直都是台南的形象代表之一，傳說為1923年日本裕仁太子（即昭和天皇）巡視台灣時親手種植，時至今日，榕樹有如慈祥的老校友一樣每日屹立看守著成大校園，迎接來自各地的新生，也目送許多完成學業的畢業生，每到畢業季時總是有不少學生在此合影留念，離情依依。', N'成大榕園
.jpg', 1, 20, N'701台南市東區大學路1號成功大學光復校區', CAST(N'2020-01-01T00:00:00' AS SmallDateTime), CAST(N'2023-12-31T00:00:00' AS SmallDateTime), 6, 0, NULL, CAST(N'1900-01-20T00:00:00' AS SmallDateTime), CAST(N'1902-10-09T00:00:00' AS SmallDateTime))
INSERT [dbo].[tProduct] ([fID], [fName], [fPeriodID], [fCost], [fPrice], [fStocks], [fDescription], [fImagePath], [fMinParticipants], [fMaxParticipants], [fAssemblyPoint], [fStartDate], [fEndDate], [fProviderID], [fRemoved], [fRemark], [fCreationDate], [fLastUpdateDate]) VALUES (129, N'成大榕園
', 3, 350.0000, 700.0000, 200, N'成大的榕樹一直都是台南的形象代表之一，傳說為1923年日本裕仁太子（即昭和天皇）巡視台灣時親手種植，時至今日，榕樹有如慈祥的老校友一樣每日屹立看守著成大校園，迎接來自各地的新生，也目送許多完成學業的畢業生，每到畢業季時總是有不少學生在此合影留念，離情依依。', N'成大榕園
.jpg', 1, 20, N'701台南市東區大學路1號成功大學光復校區', CAST(N'2020-01-01T00:00:00' AS SmallDateTime), CAST(N'2023-12-31T00:00:00' AS SmallDateTime), 6, 0, NULL, CAST(N'1900-01-20T00:00:00' AS SmallDateTime), CAST(N'1902-10-09T00:00:00' AS SmallDateTime))
INSERT [dbo].[tProduct] ([fID], [fName], [fPeriodID], [fCost], [fPrice], [fStocks], [fDescription], [fImagePath], [fMinParticipants], [fMaxParticipants], [fAssemblyPoint], [fStartDate], [fEndDate], [fProviderID], [fRemoved], [fRemark], [fCreationDate], [fLastUpdateDate]) VALUES (130, N'乳牛的家
', 1, 350.0000, 700.0000, 200, N'位於牛奶故鄉柳營的酪農區內，原本是酪農戶，近年轉型為觀光牧場與餐廳，是許多父母假日遛小孩的好去處。園區內設施完善，可以近距離與溫馴的動物們接觸，舉凡拿牧草餵羊，或是拿著奶瓶餵小乳牛喝牛奶，又或是體驗徒手擠牛奶的新鮮感，都讓大人小孩流連忘返。', N'乳牛的家
.jpg', 1, 20, N'736台南市柳營區八翁里', CAST(N'2020-01-01T00:00:00' AS SmallDateTime), CAST(N'2023-12-31T00:00:00' AS SmallDateTime), 6, 0, NULL, CAST(N'1900-01-20T00:00:00' AS SmallDateTime), CAST(N'1902-10-09T00:00:00' AS SmallDateTime))
INSERT [dbo].[tProduct] ([fID], [fName], [fPeriodID], [fCost], [fPrice], [fStocks], [fDescription], [fImagePath], [fMinParticipants], [fMaxParticipants], [fAssemblyPoint], [fStartDate], [fEndDate], [fProviderID], [fRemoved], [fRemark], [fCreationDate], [fLastUpdateDate]) VALUES (131, N'乳牛的家
', 2, 350.0000, 700.0000, 200, N'位於牛奶故鄉柳營的酪農區內，原本是酪農戶，近年轉型為觀光牧場與餐廳，是許多父母假日遛小孩的好去處。園區內設施完善，可以近距離與溫馴的動物們接觸，舉凡拿牧草餵羊，或是拿著奶瓶餵小乳牛喝牛奶，又或是體驗徒手擠牛奶的新鮮感，都讓大人小孩流連忘返。', N'乳牛的家
.jpg', 1, 20, N'736台南市柳營區八翁里', CAST(N'2020-01-01T00:00:00' AS SmallDateTime), CAST(N'2023-12-31T00:00:00' AS SmallDateTime), 6, 0, NULL, CAST(N'1900-01-20T00:00:00' AS SmallDateTime), CAST(N'1902-10-09T00:00:00' AS SmallDateTime))
INSERT [dbo].[tProduct] ([fID], [fName], [fPeriodID], [fCost], [fPrice], [fStocks], [fDescription], [fImagePath], [fMinParticipants], [fMaxParticipants], [fAssemblyPoint], [fStartDate], [fEndDate], [fProviderID], [fRemoved], [fRemark], [fCreationDate], [fLastUpdateDate]) VALUES (132, N'台南文化創意產業園區', 1, 350.0000, 700.0000, 200, N'走出台南火車站後右轉，就會見到一棟非常美麗的紅色建築在藍天底下，後方襯托著高聳的香格里拉飯店大樓，成為台南新舊融合的最佳代表景觀。此處原為台灣總督府專賣局台南支局台南出張所，整修過後成為台南文化創意產業園區，讓嚴肅的古蹟建築變身成遊客民眾的好去處。出張所本體為古色古香的展場，常有不同展覽展出，也是產業媒合及藝文人才互動交流平台，不定時舉辦各種主題講座，也讓許多親子檔常到園區裡看火車吃點心、參與DIY手作課程，度過親子時光，是一個實踐生活美學與慢活態度的絕佳場域。', N'台南文化創意產業園區.jpg', 1, 20, N'704台南市北區台20線16號', CAST(N'2020-01-01T00:00:00' AS SmallDateTime), CAST(N'2023-12-31T00:00:00' AS SmallDateTime), 6, 0, NULL, CAST(N'1900-01-20T00:00:00' AS SmallDateTime), CAST(N'1902-10-09T00:00:00' AS SmallDateTime))
INSERT [dbo].[tProduct] ([fID], [fName], [fPeriodID], [fCost], [fPrice], [fStocks], [fDescription], [fImagePath], [fMinParticipants], [fMaxParticipants], [fAssemblyPoint], [fStartDate], [fEndDate], [fProviderID], [fRemoved], [fRemark], [fCreationDate], [fLastUpdateDate]) VALUES (133, N'台南文化創意產業園區', 2, 350.0000, 700.0000, 200, N'走出台南火車站後右轉，就會見到一棟非常美麗的紅色建築在藍天底下，後方襯托著高聳的香格里拉飯店大樓，成為台南新舊融合的最佳代表景觀。此處原為台灣總督府專賣局台南支局台南出張所，整修過後成為台南文化創意產業園區，讓嚴肅的古蹟建築變身成遊客民眾的好去處。出張所本體為古色古香的展場，常有不同展覽展出，也是產業媒合及藝文人才互動交流平台，不定時舉辦各種主題講座，也讓許多親子檔常到園區裡看火車吃點心、參與DIY手作課程，度過親子時光，是一個實踐生活美學與慢活態度的絕佳場域。', N'台南文化創意產業園區.jpg', 1, 20, N'704台南市北區台20線16號', CAST(N'2020-01-01T00:00:00' AS SmallDateTime), CAST(N'2023-12-31T00:00:00' AS SmallDateTime), 6, 0, NULL, CAST(N'1900-01-20T00:00:00' AS SmallDateTime), CAST(N'1902-10-09T00:00:00' AS SmallDateTime))
INSERT [dbo].[tProduct] ([fID], [fName], [fPeriodID], [fCost], [fPrice], [fStocks], [fDescription], [fImagePath], [fMinParticipants], [fMaxParticipants], [fAssemblyPoint], [fStartDate], [fEndDate], [fProviderID], [fRemoved], [fRemark], [fCreationDate], [fLastUpdateDate]) VALUES (134, N'台南文化創意產業園區', 3, 350.0000, 700.0000, 200, N'走出台南火車站後右轉，就會見到一棟非常美麗的紅色建築在藍天底下，後方襯托著高聳的香格里拉飯店大樓，成為台南新舊融合的最佳代表景觀。此處原為台灣總督府專賣局台南支局台南出張所，整修過後成為台南文化創意產業園區，讓嚴肅的古蹟建築變身成遊客民眾的好去處。出張所本體為古色古香的展場，常有不同展覽展出，也是產業媒合及藝文人才互動交流平台，不定時舉辦各種主題講座，也讓許多親子檔常到園區裡看火車吃點心、參與DIY手作課程，度過親子時光，是一個實踐生活美學與慢活態度的絕佳場域。', N'台南文化創意產業園區.jpg', 1, 20, N'704台南市北區台20線16號', CAST(N'2020-01-01T00:00:00' AS SmallDateTime), CAST(N'2023-12-31T00:00:00' AS SmallDateTime), 6, 0, NULL, CAST(N'1900-01-20T00:00:00' AS SmallDateTime), CAST(N'1902-10-09T00:00:00' AS SmallDateTime))
INSERT [dbo].[tProduct] ([fID], [fName], [fPeriodID], [fCost], [fPrice], [fStocks], [fDescription], [fImagePath], [fMinParticipants], [fMaxParticipants], [fAssemblyPoint], [fStartDate], [fEndDate], [fProviderID], [fRemoved], [fRemark], [fCreationDate], [fLastUpdateDate]) VALUES (135, N'玉井虎頭山', 1, 350.0000, 700.0000, 200, N'虎頭山位在玉井竹圍里境，因山勢酷似虎頭而得名，山標高239公尺。是玉井區域內非常有名的咖啡賞景勝地，山頂的幾間咖啡館每到假日總是一位難求，每家咖啡館都各有特色，所擁有的景觀條件也都不相同，各個角度都有不同的美，但唯一相同的是都位於玉井市區的至高處，白天可以眺望山中小鎮的景致，夜晚則是可以欣賞玉井的精緻夜景，是許多年輕族群喜愛的浪漫約會處。', N'玉井虎頭山.jpg', 1, 20, N'714台南市玉井區竹圍里', CAST(N'2020-01-01T00:00:00' AS SmallDateTime), CAST(N'2023-12-31T00:00:00' AS SmallDateTime), 6, 0, NULL, CAST(N'1900-01-20T00:00:00' AS SmallDateTime), CAST(N'1902-10-09T00:00:00' AS SmallDateTime))
INSERT [dbo].[tProduct] ([fID], [fName], [fPeriodID], [fCost], [fPrice], [fStocks], [fDescription], [fImagePath], [fMinParticipants], [fMaxParticipants], [fAssemblyPoint], [fStartDate], [fEndDate], [fProviderID], [fRemoved], [fRemark], [fCreationDate], [fLastUpdateDate]) VALUES (136, N'玉井虎頭山', 2, 350.0000, 700.0000, 200, N'虎頭山位在玉井竹圍里境，因山勢酷似虎頭而得名，山標高239公尺。是玉井區域內非常有名的咖啡賞景勝地，山頂的幾間咖啡館每到假日總是一位難求，每家咖啡館都各有特色，所擁有的景觀條件也都不相同，各個角度都有不同的美，但唯一相同的是都位於玉井市區的至高處，白天可以眺望山中小鎮的景致，夜晚則是可以欣賞玉井的精緻夜景，是許多年輕族群喜愛的浪漫約會處。', N'玉井虎頭山.jpg', 1, 20, N'714台南市玉井區竹圍里', CAST(N'2020-01-01T00:00:00' AS SmallDateTime), CAST(N'2023-12-31T00:00:00' AS SmallDateTime), 6, 0, NULL, CAST(N'1900-01-20T00:00:00' AS SmallDateTime), CAST(N'1902-10-09T00:00:00' AS SmallDateTime))
INSERT [dbo].[tProduct] ([fID], [fName], [fPeriodID], [fCost], [fPrice], [fStocks], [fDescription], [fImagePath], [fMinParticipants], [fMaxParticipants], [fAssemblyPoint], [fStartDate], [fEndDate], [fProviderID], [fRemoved], [fRemark], [fCreationDate], [fLastUpdateDate]) VALUES (137, N'玉井虎頭山', 3, 350.0000, 700.0000, 200, N'虎頭山位在玉井竹圍里境，因山勢酷似虎頭而得名，山標高239公尺。是玉井區域內非常有名的咖啡賞景勝地，山頂的幾間咖啡館每到假日總是一位難求，每家咖啡館都各有特色，所擁有的景觀條件也都不相同，各個角度都有不同的美，但唯一相同的是都位於玉井市區的至高處，白天可以眺望山中小鎮的景致，夜晚則是可以欣賞玉井的精緻夜景，是許多年輕族群喜愛的浪漫約會處。', N'玉井虎頭山.jpg', 1, 20, N'714台南市玉井區竹圍里', CAST(N'2020-01-01T00:00:00' AS SmallDateTime), CAST(N'2023-12-31T00:00:00' AS SmallDateTime), 6, 0, NULL, CAST(N'1900-01-20T00:00:00' AS SmallDateTime), CAST(N'1902-10-09T00:00:00' AS SmallDateTime))
INSERT [dbo].[tProduct] ([fID], [fName], [fPeriodID], [fCost], [fPrice], [fStocks], [fDescription], [fImagePath], [fMinParticipants], [fMaxParticipants], [fAssemblyPoint], [fStartDate], [fEndDate], [fProviderID], [fRemoved], [fRemark], [fCreationDate], [fLastUpdateDate]) VALUES (138, N'七股觀海樓', 1, 350.0000, 700.0000, 200, N'在台南的海邊，很多景色都是季節限定的珍貴大景，夏季午後雷陣雨後通常是最美最夢幻的時刻，觀海樓就是很多攝影人捕捉太陽餘暉不同色溫變化的好地方，天空清澈時，天空會有漸層色的變化，在日落的短短1小時裡，就會有很多很多的顏色變化，不管看幾次都不會覺得膩，如果加上雲層的遮掩或是折射，更能看見耶穌光般的光束在潟湖上華麗的展開，夏季七股絕對不能錯過的日落景點。夏季傍晚是觀海樓Z字型蚵棚最佳的拍攝時段，前往觀海樓的路上路燈較少，晚上離開時請盡量小心慢行。', N'七股觀海樓.jpg', 1, 20, N'724台南市七股區', CAST(N'2020-01-01T00:00:00' AS SmallDateTime), CAST(N'2023-12-31T00:00:00' AS SmallDateTime), 8, 0, NULL, CAST(N'1900-01-20T00:00:00' AS SmallDateTime), CAST(N'1902-10-09T00:00:00' AS SmallDateTime))
INSERT [dbo].[tProduct] ([fID], [fName], [fPeriodID], [fCost], [fPrice], [fStocks], [fDescription], [fImagePath], [fMinParticipants], [fMaxParticipants], [fAssemblyPoint], [fStartDate], [fEndDate], [fProviderID], [fRemoved], [fRemark], [fCreationDate], [fLastUpdateDate]) VALUES (139, N'七股觀海樓', 2, 350.0000, 700.0000, 200, N'在台南的海邊，很多景色都是季節限定的珍貴大景，夏季午後雷陣雨後通常是最美最夢幻的時刻，觀海樓就是很多攝影人捕捉太陽餘暉不同色溫變化的好地方，天空清澈時，天空會有漸層色的變化，在日落的短短1小時裡，就會有很多很多的顏色變化，不管看幾次都不會覺得膩，如果加上雲層的遮掩或是折射，更能看見耶穌光般的光束在潟湖上華麗的展開，夏季七股絕對不能錯過的日落景點。夏季傍晚是觀海樓Z字型蚵棚最佳的拍攝時段，前往觀海樓的路上路燈較少，晚上離開時請盡量小心慢行。', N'七股觀海樓.jpg', 1, 20, N'724台南市七股區', CAST(N'2020-01-01T00:00:00' AS SmallDateTime), CAST(N'2023-12-31T00:00:00' AS SmallDateTime), 8, 0, NULL, CAST(N'1900-01-20T00:00:00' AS SmallDateTime), CAST(N'1902-10-09T00:00:00' AS SmallDateTime))
INSERT [dbo].[tProduct] ([fID], [fName], [fPeriodID], [fCost], [fPrice], [fStocks], [fDescription], [fImagePath], [fMinParticipants], [fMaxParticipants], [fAssemblyPoint], [fStartDate], [fEndDate], [fProviderID], [fRemoved], [fRemark], [fCreationDate], [fLastUpdateDate]) VALUES (140, N'七股觀海樓', 3, 350.0000, 700.0000, 200, N'在台南的海邊，很多景色都是季節限定的珍貴大景，夏季午後雷陣雨後通常是最美最夢幻的時刻，觀海樓就是很多攝影人捕捉太陽餘暉不同色溫變化的好地方，天空清澈時，天空會有漸層色的變化，在日落的短短1小時裡，就會有很多很多的顏色變化，不管看幾次都不會覺得膩，如果加上雲層的遮掩或是折射，更能看見耶穌光般的光束在潟湖上華麗的展開，夏季七股絕對不能錯過的日落景點。夏季傍晚是觀海樓Z字型蚵棚最佳的拍攝時段，前往觀海樓的路上路燈較少，晚上離開時請盡量小心慢行。', N'七股觀海樓.jpg', 1, 20, N'724台南市七股區', CAST(N'2020-01-01T00:00:00' AS SmallDateTime), CAST(N'2023-12-31T00:00:00' AS SmallDateTime), 8, 0, NULL, CAST(N'1900-01-20T00:00:00' AS SmallDateTime), CAST(N'1902-10-09T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[tProduct] ([fID], [fName], [fPeriodID], [fCost], [fPrice], [fStocks], [fDescription], [fImagePath], [fMinParticipants], [fMaxParticipants], [fAssemblyPoint], [fStartDate], [fEndDate], [fProviderID], [fRemoved], [fRemark], [fCreationDate], [fLastUpdateDate]) VALUES (141, N'迎曦湖', 1, 350.0000, 700.0000, 200, N'還沒到迎曦湖，就被凌空起伏宛如雲霄飛車軌道的巨大黃色絲帶吸引。這道南科為迎接訪客打造的超大型鋼構公共藝術雕塑「舞彩迎賓」，長400公尺、寬33公尺、高12公尺。', N'迎曦湖.jpg', 1, 20, N'744台南市新市區迎曦湖', CAST(N'2020-01-01T00:00:00' AS SmallDateTime), CAST(N'2023-12-31T00:00:00' AS SmallDateTime), 8, 0, NULL, CAST(N'1900-01-20T00:00:00' AS SmallDateTime), CAST(N'1902-10-09T00:00:00' AS SmallDateTime))
INSERT [dbo].[tProduct] ([fID], [fName], [fPeriodID], [fCost], [fPrice], [fStocks], [fDescription], [fImagePath], [fMinParticipants], [fMaxParticipants], [fAssemblyPoint], [fStartDate], [fEndDate], [fProviderID], [fRemoved], [fRemark], [fCreationDate], [fLastUpdateDate]) VALUES (142, N'迎曦湖', 2, 350.0000, 700.0000, 200, N'還沒到迎曦湖，就被凌空起伏宛如雲霄飛車軌道的巨大黃色絲帶吸引。這道南科為迎接訪客打造的超大型鋼構公共藝術雕塑「舞彩迎賓」，長400公尺、寬33公尺、高12公尺。', N'迎曦湖.jpg', 1, 20, N'744台南市新市區迎曦湖', CAST(N'2020-01-01T00:00:00' AS SmallDateTime), CAST(N'2023-12-31T00:00:00' AS SmallDateTime), 8, 0, NULL, CAST(N'1900-01-20T00:00:00' AS SmallDateTime), CAST(N'1902-10-09T00:00:00' AS SmallDateTime))
INSERT [dbo].[tProduct] ([fID], [fName], [fPeriodID], [fCost], [fPrice], [fStocks], [fDescription], [fImagePath], [fMinParticipants], [fMaxParticipants], [fAssemblyPoint], [fStartDate], [fEndDate], [fProviderID], [fRemoved], [fRemark], [fCreationDate], [fLastUpdateDate]) VALUES (143, N'迎曦湖', 3, 350.0000, 700.0000, 200, N'還沒到迎曦湖，就被凌空起伏宛如雲霄飛車軌道的巨大黃色絲帶吸引。這道南科為迎接訪客打造的超大型鋼構公共藝術雕塑「舞彩迎賓」，長400公尺、寬33公尺、高12公尺。', N'迎曦湖.jpg', 1, 20, N'744台南市新市區迎曦湖', CAST(N'2020-01-01T00:00:00' AS SmallDateTime), CAST(N'2023-12-31T00:00:00' AS SmallDateTime), 8, 0, NULL, CAST(N'1900-01-20T00:00:00' AS SmallDateTime), CAST(N'1902-10-09T00:00:00' AS SmallDateTime))
INSERT [dbo].[tProduct] ([fID], [fName], [fPeriodID], [fCost], [fPrice], [fStocks], [fDescription], [fImagePath], [fMinParticipants], [fMaxParticipants], [fAssemblyPoint], [fStartDate], [fEndDate], [fProviderID], [fRemoved], [fRemark], [fCreationDate], [fLastUpdateDate]) VALUES (144, N'臺灣首廟天壇「天公廟」', 1, 350.0000, 700.0000, 200, N'臺灣首廟天壇的創建歷史，根據傳說，可以追溯到鄭氏時期的永曆15年，為鄭成功來臺後築壇祭告天地之所，此後一直由民宅輪流祭祀，直到清咸豐4年（1854）才正式建廟。廟內主祀玉皇上帝，為道教信仰中神格最高的神明，而正殿前的「一字匾」，為享譽府城的四大名匾之一，值得一看。', N'臺灣首廟天壇「天公廟」.jpg', 1, 20, N'702台南市南區國民路165巷39號', CAST(N'2020-01-01T00:00:00' AS SmallDateTime), CAST(N'2023-12-31T00:00:00' AS SmallDateTime), 8, 0, NULL, CAST(N'1900-01-20T00:00:00' AS SmallDateTime), CAST(N'1902-10-09T00:00:00' AS SmallDateTime))
INSERT [dbo].[tProduct] ([fID], [fName], [fPeriodID], [fCost], [fPrice], [fStocks], [fDescription], [fImagePath], [fMinParticipants], [fMaxParticipants], [fAssemblyPoint], [fStartDate], [fEndDate], [fProviderID], [fRemoved], [fRemark], [fCreationDate], [fLastUpdateDate]) VALUES (145, N'臺灣首廟天壇「天公廟」', 2, 350.0000, 700.0000, 200, N'臺灣首廟天壇的創建歷史，根據傳說，可以追溯到鄭氏時期的永曆15年，為鄭成功來臺後築壇祭告天地之所，此後一直由民宅輪流祭祀，直到清咸豐4年（1854）才正式建廟。廟內主祀玉皇上帝，為道教信仰中神格最高的神明，而正殿前的「一字匾」，為享譽府城的四大名匾之一，值得一看。', N'臺灣首廟天壇「天公廟」.jpg', 1, 20, N'702台南市南區國民路165巷39號', CAST(N'2020-01-01T00:00:00' AS SmallDateTime), CAST(N'2023-12-31T00:00:00' AS SmallDateTime), 8, 0, NULL, CAST(N'1900-01-20T00:00:00' AS SmallDateTime), CAST(N'1902-10-09T00:00:00' AS SmallDateTime))
INSERT [dbo].[tProduct] ([fID], [fName], [fPeriodID], [fCost], [fPrice], [fStocks], [fDescription], [fImagePath], [fMinParticipants], [fMaxParticipants], [fAssemblyPoint], [fStartDate], [fEndDate], [fProviderID], [fRemoved], [fRemark], [fCreationDate], [fLastUpdateDate]) VALUES (146, N'臺灣首廟天壇「天公廟」', 3, 350.0000, 700.0000, 200, N'臺灣首廟天壇的創建歷史，根據傳說，可以追溯到鄭氏時期的永曆15年，為鄭成功來臺後築壇祭告天地之所，此後一直由民宅輪流祭祀，直到清咸豐4年（1854）才正式建廟。廟內主祀玉皇上帝，為道教信仰中神格最高的神明，而正殿前的「一字匾」，為享譽府城的四大名匾之一，值得一看。', N'臺灣首廟天壇「天公廟」.jpg', 1, 20, N'702台南市南區國民路165巷39號', CAST(N'2020-01-01T00:00:00' AS SmallDateTime), CAST(N'2023-12-31T00:00:00' AS SmallDateTime), 8, 0, NULL, CAST(N'1900-01-20T00:00:00' AS SmallDateTime), CAST(N'1902-10-09T00:00:00' AS SmallDateTime))
INSERT [dbo].[tProduct] ([fID], [fName], [fPeriodID], [fCost], [fPrice], [fStocks], [fDescription], [fImagePath], [fMinParticipants], [fMaxParticipants], [fAssemblyPoint], [fStartDate], [fEndDate], [fProviderID], [fRemoved], [fRemark], [fCreationDate], [fLastUpdateDate]) VALUES (147, N'府東創意森林園區', 1, 350.0000, 700.0000, 200, N'原臺南州立農事試驗場宿舍群大約在西元1923年建立，經典日式木造建築與格局，宛如漫步「京都」，現已成為台南東區非常知名的旅遊景點，現已修復的四棟建築物已分別委外經營。', N'府東創意森林園區.jpg', 1, 20, N'701台南市東區府東街21巷20號', CAST(N'2020-01-01T00:00:00' AS SmallDateTime), CAST(N'2023-12-31T00:00:00' AS SmallDateTime), 8, 0, NULL, CAST(N'1900-01-20T00:00:00' AS SmallDateTime), CAST(N'1902-10-09T00:00:00' AS SmallDateTime))
INSERT [dbo].[tProduct] ([fID], [fName], [fPeriodID], [fCost], [fPrice], [fStocks], [fDescription], [fImagePath], [fMinParticipants], [fMaxParticipants], [fAssemblyPoint], [fStartDate], [fEndDate], [fProviderID], [fRemoved], [fRemark], [fCreationDate], [fLastUpdateDate]) VALUES (148, N'府東創意森林園區', 2, 350.0000, 700.0000, 200, N'原臺南州立農事試驗場宿舍群大約在西元1923年建立，經典日式木造建築與格局，宛如漫步「京都」，現已成為台南東區非常知名的旅遊景點，現已修復的四棟建築物已分別委外經營。', N'府東創意森林園區.jpg', 1, 20, N'701台南市東區府東街21巷20號', CAST(N'2020-01-01T00:00:00' AS SmallDateTime), CAST(N'2023-12-31T00:00:00' AS SmallDateTime), 8, 0, NULL, CAST(N'1900-01-20T00:00:00' AS SmallDateTime), CAST(N'1902-10-09T00:00:00' AS SmallDateTime))
INSERT [dbo].[tProduct] ([fID], [fName], [fPeriodID], [fCost], [fPrice], [fStocks], [fDescription], [fImagePath], [fMinParticipants], [fMaxParticipants], [fAssemblyPoint], [fStartDate], [fEndDate], [fProviderID], [fRemoved], [fRemark], [fCreationDate], [fLastUpdateDate]) VALUES (149, N'鹽水天主聖神堂', 1, 350.0000, 700.0000, 200, N'鹽水除了蜂炮和燈節，還有一個隱藏版的景點，便是中西風格合併的「天主聖神堂」。 有著屋瓦、斜屋頂、紅色樑柱，濃濃的傳統廟宇建築風格，走進一看，內部的裝飾則會讓初次造訪者感到滿滿的衝擊。寬敞的空間、祭壇、兩旁的木頭長椅，和其他教堂無異，但一根根紅色的楹柱，以不同的字體寫著書法對聯，甚至連台灣廟宇常見的「白菜葉」柱頭、木雕雀替都一起出現。', N'鹽水天主聖神堂.jpg', 1, 20, N'737台南市鹽水區西門路19號', CAST(N'2020-01-01T00:00:00' AS SmallDateTime), CAST(N'2023-12-31T00:00:00' AS SmallDateTime), 8, 0, NULL, CAST(N'1900-01-20T00:00:00' AS SmallDateTime), CAST(N'1902-10-09T00:00:00' AS SmallDateTime))
INSERT [dbo].[tProduct] ([fID], [fName], [fPeriodID], [fCost], [fPrice], [fStocks], [fDescription], [fImagePath], [fMinParticipants], [fMaxParticipants], [fAssemblyPoint], [fStartDate], [fEndDate], [fProviderID], [fRemoved], [fRemark], [fCreationDate], [fLastUpdateDate]) VALUES (150, N'鹽水天主聖神堂', 2, 350.0000, 700.0000, 200, N'鹽水除了蜂炮和燈節，還有一個隱藏版的景點，便是中西風格合併的「天主聖神堂」。 有著屋瓦、斜屋頂、紅色樑柱，濃濃的傳統廟宇建築風格，走進一看，內部的裝飾則會讓初次造訪者感到滿滿的衝擊。寬敞的空間、祭壇、兩旁的木頭長椅，和其他教堂無異，但一根根紅色的楹柱，以不同的字體寫著書法對聯，甚至連台灣廟宇常見的「白菜葉」柱頭、木雕雀替都一起出現。', N'鹽水天主聖神堂.jpg', 1, 20, N'737台南市鹽水區西門路19號', CAST(N'2020-01-01T00:00:00' AS SmallDateTime), CAST(N'2023-12-31T00:00:00' AS SmallDateTime), 8, 0, NULL, CAST(N'1900-01-20T00:00:00' AS SmallDateTime), CAST(N'1902-10-09T00:00:00' AS SmallDateTime))
INSERT [dbo].[tProduct] ([fID], [fName], [fPeriodID], [fCost], [fPrice], [fStocks], [fDescription], [fImagePath], [fMinParticipants], [fMaxParticipants], [fAssemblyPoint], [fStartDate], [fEndDate], [fProviderID], [fRemoved], [fRemark], [fCreationDate], [fLastUpdateDate]) VALUES (151, N'中央氣象局臺灣南區氣象中心', 1, 350.0000, 700.0000, 200, N'景點介紹
現代氣象科技展示場與原台南測候所結合成為氣象展示場，不僅還原了古蹟之美更蘊含了世代交替的文化傳承，參觀者可見證一百多年來氣象進步的軌跡，亦可瞭解自然科學的奧妙，為臺南市環境教育設施場所之一。', N'中央氣象局臺灣南區氣象中心.jpg', 1, 20, N'700台南市中西區', CAST(N'2020-01-01T00:00:00' AS SmallDateTime), CAST(N'2023-12-31T00:00:00' AS SmallDateTime), 10, 0, NULL, CAST(N'1900-01-20T00:00:00' AS SmallDateTime), CAST(N'1902-10-09T00:00:00' AS SmallDateTime))
INSERT [dbo].[tProduct] ([fID], [fName], [fPeriodID], [fCost], [fPrice], [fStocks], [fDescription], [fImagePath], [fMinParticipants], [fMaxParticipants], [fAssemblyPoint], [fStartDate], [fEndDate], [fProviderID], [fRemoved], [fRemark], [fCreationDate], [fLastUpdateDate]) VALUES (152, N'中央氣象局臺灣南區氣象中心', 2, 350.0000, 700.0000, 200, N'景點介紹
現代氣象科技展示場與原台南測候所結合成為氣象展示場，不僅還原了古蹟之美更蘊含了世代交替的文化傳承，參觀者可見證一百多年來氣象進步的軌跡，亦可瞭解自然科學的奧妙，為臺南市環境教育設施場所之一。', N'中央氣象局臺灣南區氣象中心.jpg', 1, 20, N'700台南市中西區', CAST(N'2020-01-01T00:00:00' AS SmallDateTime), CAST(N'2023-12-31T00:00:00' AS SmallDateTime), 10, 0, NULL, CAST(N'1900-01-20T00:00:00' AS SmallDateTime), CAST(N'1902-10-09T00:00:00' AS SmallDateTime))
INSERT [dbo].[tProduct] ([fID], [fName], [fPeriodID], [fCost], [fPrice], [fStocks], [fDescription], [fImagePath], [fMinParticipants], [fMaxParticipants], [fAssemblyPoint], [fStartDate], [fEndDate], [fProviderID], [fRemoved], [fRemark], [fCreationDate], [fLastUpdateDate]) VALUES (153, N'蕭壠文化園區', 1, 350.0000, 700.0000, 200, N'蕭壠糖廠又名佳里糖廠， 1905年成立， 1908年開始製糖，是日治時期「明治製糖株式會社」在台灣設立的第一個新式糖廠，1998年因糖業沒落關閉，後來閒置空間再利用，蕭壠文化園區在2003年成立，以藝文基地的面貌再臨。', N'蕭壠文化園區.jpg', 1, 20, N'722台南市佳里區六安里', CAST(N'2020-01-01T00:00:00' AS SmallDateTime), CAST(N'2023-12-31T00:00:00' AS SmallDateTime), 10, 0, NULL, CAST(N'1900-01-20T00:00:00' AS SmallDateTime), CAST(N'1902-10-09T00:00:00' AS SmallDateTime))
INSERT [dbo].[tProduct] ([fID], [fName], [fPeriodID], [fCost], [fPrice], [fStocks], [fDescription], [fImagePath], [fMinParticipants], [fMaxParticipants], [fAssemblyPoint], [fStartDate], [fEndDate], [fProviderID], [fRemoved], [fRemark], [fCreationDate], [fLastUpdateDate]) VALUES (154, N'蕭壠文化園區', 2, 350.0000, 700.0000, 200, N'蕭壠糖廠又名佳里糖廠， 1905年成立， 1908年開始製糖，是日治時期「明治製糖株式會社」在台灣設立的第一個新式糖廠，1998年因糖業沒落關閉，後來閒置空間再利用，蕭壠文化園區在2003年成立，以藝文基地的面貌再臨。', N'蕭壠文化園區.jpg', 1, 20, N'722台南市佳里區六安里', CAST(N'2020-01-01T00:00:00' AS SmallDateTime), CAST(N'2023-12-31T00:00:00' AS SmallDateTime), 10, 0, NULL, CAST(N'1900-01-20T00:00:00' AS SmallDateTime), CAST(N'1902-10-09T00:00:00' AS SmallDateTime))
INSERT [dbo].[tProduct] ([fID], [fName], [fPeriodID], [fCost], [fPrice], [fStocks], [fDescription], [fImagePath], [fMinParticipants], [fMaxParticipants], [fAssemblyPoint], [fStartDate], [fEndDate], [fProviderID], [fRemoved], [fRemark], [fCreationDate], [fLastUpdateDate]) VALUES (155, N'關廟山西宮', 1, 350.0000, 700.0000, 200, N'講到鳳梨、竹筍、關廟麵，物產的豐富，使得關廟的知名度遠高於許多鄉鎮，但很少人知道的是，「關廟」之名的由來，來自地區的大廟「山西宮」主祀「關聖帝君」，而有了關廟之名。 相傳創建於鄭氏時期，至今已超過三百多年歷史，現在的山西宮歷經修建，是四層樓高的宏大廟宇，廟埕前接壤著關廟菜市場，而廟宇市場間的道路則聚集了各式在地小吃，拜拜、買菜、吃東西，一應俱全。', N'關廟山西宮.jpg', 1, 20, N'718台南市關廟區武聖路33號', CAST(N'2020-01-01T00:00:00' AS SmallDateTime), CAST(N'2023-12-31T00:00:00' AS SmallDateTime), 10, 0, NULL, CAST(N'1900-01-20T00:00:00' AS SmallDateTime), CAST(N'1902-10-09T00:00:00' AS SmallDateTime))
INSERT [dbo].[tProduct] ([fID], [fName], [fPeriodID], [fCost], [fPrice], [fStocks], [fDescription], [fImagePath], [fMinParticipants], [fMaxParticipants], [fAssemblyPoint], [fStartDate], [fEndDate], [fProviderID], [fRemoved], [fRemark], [fCreationDate], [fLastUpdateDate]) VALUES (156, N'關廟山西宮', 2, 350.0000, 700.0000, 200, N'講到鳳梨、竹筍、關廟麵，物產的豐富，使得關廟的知名度遠高於許多鄉鎮，但很少人知道的是，「關廟」之名的由來，來自地區的大廟「山西宮」主祀「關聖帝君」，而有了關廟之名。 相傳創建於鄭氏時期，至今已超過三百多年歷史，現在的山西宮歷經修建，是四層樓高的宏大廟宇，廟埕前接壤著關廟菜市場，而廟宇市場間的道路則聚集了各式在地小吃，拜拜、買菜、吃東西，一應俱全。', N'關廟山西宮.jpg', 1, 20, N'718台南市關廟區武聖路33號', CAST(N'2020-01-01T00:00:00' AS SmallDateTime), CAST(N'2023-12-31T00:00:00' AS SmallDateTime), 10, 0, NULL, CAST(N'1900-01-20T00:00:00' AS SmallDateTime), CAST(N'1902-10-09T00:00:00' AS SmallDateTime))
INSERT [dbo].[tProduct] ([fID], [fName], [fPeriodID], [fCost], [fPrice], [fStocks], [fDescription], [fImagePath], [fMinParticipants], [fMaxParticipants], [fAssemblyPoint], [fStartDate], [fEndDate], [fProviderID], [fRemoved], [fRemark], [fCreationDate], [fLastUpdateDate]) VALUES (157, N'關廟山西宮', 3, 350.0000, 700.0000, 200, N'講到鳳梨、竹筍、關廟麵，物產的豐富，使得關廟的知名度遠高於許多鄉鎮，但很少人知道的是，「關廟」之名的由來，來自地區的大廟「山西宮」主祀「關聖帝君」，而有了關廟之名。 相傳創建於鄭氏時期，至今已超過三百多年歷史，現在的山西宮歷經修建，是四層樓高的宏大廟宇，廟埕前接壤著關廟菜市場，而廟宇市場間的道路則聚集了各式在地小吃，拜拜、買菜、吃東西，一應俱全。', N'關廟山西宮.jpg', 1, 20, N'718台南市關廟區武聖路33號', CAST(N'2020-01-01T00:00:00' AS SmallDateTime), CAST(N'2023-12-31T00:00:00' AS SmallDateTime), 10, 0, NULL, CAST(N'1900-01-20T00:00:00' AS SmallDateTime), CAST(N'1902-10-09T00:00:00' AS SmallDateTime))
INSERT [dbo].[tProduct] ([fID], [fName], [fPeriodID], [fCost], [fPrice], [fStocks], [fDescription], [fImagePath], [fMinParticipants], [fMaxParticipants], [fAssemblyPoint], [fStartDate], [fEndDate], [fProviderID], [fRemoved], [fRemark], [fCreationDate], [fLastUpdateDate]) VALUES (158, N'善化啤酒觀光工廠', 1, 350.0000, 700.0000, 200, N'善化啤酒廠為台灣菸酒公司在台灣南部的生產重鎮，從西元2005年起便改以多角化方式來發展，從製造啤酒的工廠細心規劃成為啤酒文化園區，成為全台第一座以啤酒做為主題的觀光酒廠。', N'善化啤酒觀光工廠.jpg', 1, 20, N'741台南市善化區成功路2-1號', CAST(N'2020-01-01T00:00:00' AS SmallDateTime), CAST(N'2023-12-31T00:00:00' AS SmallDateTime), 10, 0, NULL, CAST(N'1900-01-20T00:00:00' AS SmallDateTime), CAST(N'1902-10-09T00:00:00' AS SmallDateTime))
INSERT [dbo].[tProduct] ([fID], [fName], [fPeriodID], [fCost], [fPrice], [fStocks], [fDescription], [fImagePath], [fMinParticipants], [fMaxParticipants], [fAssemblyPoint], [fStartDate], [fEndDate], [fProviderID], [fRemoved], [fRemark], [fCreationDate], [fLastUpdateDate]) VALUES (159, N'善化啤酒觀光工廠', 2, 350.0000, 700.0000, 200, N'善化啤酒廠為台灣菸酒公司在台灣南部的生產重鎮，從西元2005年起便改以多角化方式來發展，從製造啤酒的工廠細心規劃成為啤酒文化園區，成為全台第一座以啤酒做為主題的觀光酒廠。', N'善化啤酒觀光工廠.jpg', 1, 20, N'741台南市善化區成功路2-1號', CAST(N'2020-01-01T00:00:00' AS SmallDateTime), CAST(N'2023-12-31T00:00:00' AS SmallDateTime), 10, 0, NULL, CAST(N'1900-01-20T00:00:00' AS SmallDateTime), CAST(N'1902-10-09T00:00:00' AS SmallDateTime))
INSERT [dbo].[tProduct] ([fID], [fName], [fPeriodID], [fCost], [fPrice], [fStocks], [fDescription], [fImagePath], [fMinParticipants], [fMaxParticipants], [fAssemblyPoint], [fStartDate], [fEndDate], [fProviderID], [fRemoved], [fRemark], [fCreationDate], [fLastUpdateDate]) VALUES (160, N'台南運河遊船', 2, 350.0000, 700.0000, 200, N'從環河街的運河星鑽區域開始直至安億橋外的港區，是台南運河最精華的景觀區域，目前已推出遊河行程，常可見運河中的魚躍出水面向遊客打招呼，兩側現代高樓林立，沿著水岸有著總舖師電影場景金華橋與談情說愛樹，如彩虹般橫跨的新臨安橋，弦月般的望月橋、亮麗的安億橋沿水路橫跨兩端，夜間燈光亮起時水岸氛圍有如台南塞納河般的浪漫。依著潮汐，搭乘特製的平底船還可享受低頭穿越12座橋的環運河體驗。', N'台南運河遊船.jpg', 1, 20, N'708台南市安平區安億路', CAST(N'2020-01-01T00:00:00' AS SmallDateTime), CAST(N'2023-12-31T00:00:00' AS SmallDateTime), 11, 0, NULL, CAST(N'1900-01-20T00:00:00' AS SmallDateTime), CAST(N'1902-10-09T00:00:00' AS SmallDateTime))
INSERT [dbo].[tProduct] ([fID], [fName], [fPeriodID], [fCost], [fPrice], [fStocks], [fDescription], [fImagePath], [fMinParticipants], [fMaxParticipants], [fAssemblyPoint], [fStartDate], [fEndDate], [fProviderID], [fRemoved], [fRemark], [fCreationDate], [fLastUpdateDate]) VALUES (161, N'台南運河遊船', 3, 350.0000, 700.0000, 200, N'從環河街的運河星鑽區域開始直至安億橋外的港區，是台南運河最精華的景觀區域，目前已推出遊河行程，常可見運河中的魚躍出水面向遊客打招呼，兩側現代高樓林立，沿著水岸有著總舖師電影場景金華橋與談情說愛樹，如彩虹般橫跨的新臨安橋，弦月般的望月橋、亮麗的安億橋沿水路橫跨兩端，夜間燈光亮起時水岸氛圍有如台南塞納河般的浪漫。依著潮汐，搭乘特製的平底船還可享受低頭穿越12座橋的環運河體驗。', N'台南運河遊船.jpg', 1, 20, N'708台南市安平區安億路', CAST(N'2020-01-01T00:00:00' AS SmallDateTime), CAST(N'2023-12-31T00:00:00' AS SmallDateTime), 11, 0, NULL, CAST(N'1900-01-20T00:00:00' AS SmallDateTime), CAST(N'1902-10-09T00:00:00' AS SmallDateTime))
INSERT [dbo].[tProduct] ([fID], [fName], [fPeriodID], [fCost], [fPrice], [fStocks], [fDescription], [fImagePath], [fMinParticipants], [fMaxParticipants], [fAssemblyPoint], [fStartDate], [fEndDate], [fProviderID], [fRemoved], [fRemark], [fCreationDate], [fLastUpdateDate]) VALUES (162, N'安平蚵灰窯文化館', 1, 350.0000, 700.0000, 200, N'蚵灰窯曾經是安平地區很重要的建材製造場所，也是目前台灣僅存唯一的蚵灰窯，從17世紀開始蚵灰便是以海為生的安平人必備的造船材料之一，後來延伸加入糖水、糯米汁成為蓋房的磚瓦黏合使用，現今雖然已不再使用這些古法建材，但仍舊保留了安平燒製蚵殼成為蚵灰的重要遺址，走進蚵灰窯會看見被愛玉子藤蔓覆蓋住的紅磚牆面，內部就是一座相當大的窯坑，內部直徑約4公尺，高度約為2公尺，窯體牆面最薄的地方還有1公尺厚，是難得一見的燒窯建築。', N'安平蚵灰窯文化館.jpg', 1, 20, N'708台南市安平區安北路112號', CAST(N'2020-01-01T00:00:00' AS SmallDateTime), CAST(N'2023-12-31T00:00:00' AS SmallDateTime), 11, 0, NULL, CAST(N'1900-01-20T00:00:00' AS SmallDateTime), CAST(N'1902-10-09T00:00:00' AS SmallDateTime))
INSERT [dbo].[tProduct] ([fID], [fName], [fPeriodID], [fCost], [fPrice], [fStocks], [fDescription], [fImagePath], [fMinParticipants], [fMaxParticipants], [fAssemblyPoint], [fStartDate], [fEndDate], [fProviderID], [fRemoved], [fRemark], [fCreationDate], [fLastUpdateDate]) VALUES (163, N'安平蚵灰窯文化館', 2, 350.0000, 700.0000, 200, N'蚵灰窯曾經是安平地區很重要的建材製造場所，也是目前台灣僅存唯一的蚵灰窯，從17世紀開始蚵灰便是以海為生的安平人必備的造船材料之一，後來延伸加入糖水、糯米汁成為蓋房的磚瓦黏合使用，現今雖然已不再使用這些古法建材，但仍舊保留了安平燒製蚵殼成為蚵灰的重要遺址，走進蚵灰窯會看見被愛玉子藤蔓覆蓋住的紅磚牆面，內部就是一座相當大的窯坑，內部直徑約4公尺，高度約為2公尺，窯體牆面最薄的地方還有1公尺厚，是難得一見的燒窯建築。', N'安平蚵灰窯文化館.jpg', 1, 20, N'708台南市安平區安北路112號', CAST(N'2020-01-01T00:00:00' AS SmallDateTime), CAST(N'2023-12-31T00:00:00' AS SmallDateTime), 11, 0, NULL, CAST(N'1900-01-20T00:00:00' AS SmallDateTime), CAST(N'1902-10-09T00:00:00' AS SmallDateTime))
INSERT [dbo].[tProduct] ([fID], [fName], [fPeriodID], [fCost], [fPrice], [fStocks], [fDescription], [fImagePath], [fMinParticipants], [fMaxParticipants], [fAssemblyPoint], [fStartDate], [fEndDate], [fProviderID], [fRemoved], [fRemark], [fCreationDate], [fLastUpdateDate]) VALUES (164, N'台南武德殿', 1, 350.0000, 700.0000, 200, N'在孔廟園區旅行時一定會被這棟美麗巨大的建築所吸引，完整保留住日式建築的風格外觀，也是忠義國小師生共同的寶藏與回憶，試想有多少小學生可以驕傲地說出我們學校的禮堂是古蹟喔。', N'台南武德殿.jpg', 1, 20, N'700台南市中西區忠義路二段2號', CAST(N'2020-01-01T00:00:00' AS SmallDateTime), CAST(N'2023-12-31T00:00:00' AS SmallDateTime), 11, 0, NULL, CAST(N'1900-01-20T00:00:00' AS SmallDateTime), CAST(N'1902-10-09T00:00:00' AS SmallDateTime))
INSERT [dbo].[tProduct] ([fID], [fName], [fPeriodID], [fCost], [fPrice], [fStocks], [fDescription], [fImagePath], [fMinParticipants], [fMaxParticipants], [fAssemblyPoint], [fStartDate], [fEndDate], [fProviderID], [fRemoved], [fRemark], [fCreationDate], [fLastUpdateDate]) VALUES (165, N'台南武德殿', 2, 350.0000, 700.0000, 200, N'在孔廟園區旅行時一定會被這棟美麗巨大的建築所吸引，完整保留住日式建築的風格外觀，也是忠義國小師生共同的寶藏與回憶，試想有多少小學生可以驕傲地說出我們學校的禮堂是古蹟喔。', N'台南武德殿.jpg', 1, 20, N'700台南市中西區忠義路二段2號', CAST(N'2020-01-01T00:00:00' AS SmallDateTime), CAST(N'2023-12-31T00:00:00' AS SmallDateTime), 11, 0, NULL, CAST(N'1900-01-20T00:00:00' AS SmallDateTime), CAST(N'1902-10-09T00:00:00' AS SmallDateTime))
INSERT [dbo].[tProduct] ([fID], [fName], [fPeriodID], [fCost], [fPrice], [fStocks], [fDescription], [fImagePath], [fMinParticipants], [fMaxParticipants], [fAssemblyPoint], [fStartDate], [fEndDate], [fProviderID], [fRemoved], [fRemark], [fCreationDate], [fLastUpdateDate]) VALUES (166, N'蔴荳古港文化園區', 1, 350.0000, 700.0000, 200, N'蔴荳古港文化園區是麻豆最為傳奇的地方，此處是傳說為龍穴的水崛頭，會出天子的傳說由來已久，是當地人深信不疑的風水寶地，除傳奇故事外，歷史上這裡曾是倒風內海的港口，水堀頭屬於倒風內海的3叉港，佔地利之便，船隻可直通福建，水堀頭港曾是砂糖出口的港口，也因為當時平埔族人居住的嘛荳社梅花鹿遍布，大量鹿皮也由此出口，商船在水堀頭靠岸卸貨，繁華一時，可以稱得上是麻豆的發跡地。', N'蔴荳古港文化園區.jpg', 1, 20, N'721台南市麻豆區176縣道', CAST(N'2020-01-01T00:00:00' AS SmallDateTime), CAST(N'2023-12-31T00:00:00' AS SmallDateTime), 12, 0, NULL, CAST(N'1900-01-20T00:00:00' AS SmallDateTime), CAST(N'1902-10-09T00:00:00' AS SmallDateTime))
INSERT [dbo].[tProduct] ([fID], [fName], [fPeriodID], [fCost], [fPrice], [fStocks], [fDescription], [fImagePath], [fMinParticipants], [fMaxParticipants], [fAssemblyPoint], [fStartDate], [fEndDate], [fProviderID], [fRemoved], [fRemark], [fCreationDate], [fLastUpdateDate]) VALUES (167, N'蔴荳古港文化園區', 2, 350.0000, 700.0000, 200, N'蔴荳古港文化園區是麻豆最為傳奇的地方，此處是傳說為龍穴的水崛頭，會出天子的傳說由來已久，是當地人深信不疑的風水寶地，除傳奇故事外，歷史上這裡曾是倒風內海的港口，水堀頭屬於倒風內海的3叉港，佔地利之便，船隻可直通福建，水堀頭港曾是砂糖出口的港口，也因為當時平埔族人居住的嘛荳社梅花鹿遍布，大量鹿皮也由此出口，商船在水堀頭靠岸卸貨，繁華一時，可以稱得上是麻豆的發跡地。', N'蔴荳古港文化園區.jpg', 1, 20, N'721台南市麻豆區176縣道', CAST(N'2020-01-01T00:00:00' AS SmallDateTime), CAST(N'2023-12-31T00:00:00' AS SmallDateTime), 12, 0, NULL, CAST(N'1900-01-20T00:00:00' AS SmallDateTime), CAST(N'1902-10-09T00:00:00' AS SmallDateTime))
INSERT [dbo].[tProduct] ([fID], [fName], [fPeriodID], [fCost], [fPrice], [fStocks], [fDescription], [fImagePath], [fMinParticipants], [fMaxParticipants], [fAssemblyPoint], [fStartDate], [fEndDate], [fProviderID], [fRemoved], [fRemark], [fCreationDate], [fLastUpdateDate]) VALUES (168, N'官田水雉生態教育園區', 1, 350.0000, 700.0000, 200, N'水雉生態教育園區是官田區域內賞鳥的最佳去處，這也是一處長期觀察水雉生態的愛鳥人士共同努力10幾年的成果，從只有兩個貨櫃屋還有一片荒地開始，慢慢的建立起適合水雉生活的環境，因四周種植菱角與水田，鳥類食物來源豐富，讓此處埤塘充滿生機。', N'官田水雉生態教育園區.jpg', 1, 20, N'720台南市官田區隆田里', CAST(N'2020-01-01T00:00:00' AS SmallDateTime), CAST(N'2023-12-31T00:00:00' AS SmallDateTime), 12, 0, NULL, CAST(N'1900-01-20T00:00:00' AS SmallDateTime), CAST(N'1902-10-09T00:00:00' AS SmallDateTime))
INSERT [dbo].[tProduct] ([fID], [fName], [fPeriodID], [fCost], [fPrice], [fStocks], [fDescription], [fImagePath], [fMinParticipants], [fMaxParticipants], [fAssemblyPoint], [fStartDate], [fEndDate], [fProviderID], [fRemoved], [fRemark], [fCreationDate], [fLastUpdateDate]) VALUES (169, N'官田水雉生態教育園區', 2, 350.0000, 700.0000, 200, N'水雉生態教育園區是官田區域內賞鳥的最佳去處，這也是一處長期觀察水雉生態的愛鳥人士共同努力10幾年的成果，從只有兩個貨櫃屋還有一片荒地開始，慢慢的建立起適合水雉生活的環境，因四周種植菱角與水田，鳥類食物來源豐富，讓此處埤塘充滿生機。', N'官田水雉生態教育園區.jpg', 1, 20, N'720台南市官田區隆田里', CAST(N'2020-01-01T00:00:00' AS SmallDateTime), CAST(N'2023-12-31T00:00:00' AS SmallDateTime), 12, 0, NULL, CAST(N'1900-01-20T00:00:00' AS SmallDateTime), CAST(N'1902-10-09T00:00:00' AS SmallDateTime))
INSERT [dbo].[tProduct] ([fID], [fName], [fPeriodID], [fCost], [fPrice], [fStocks], [fDescription], [fImagePath], [fMinParticipants], [fMaxParticipants], [fAssemblyPoint], [fStartDate], [fEndDate], [fProviderID], [fRemoved], [fRemark], [fCreationDate], [fLastUpdateDate]) VALUES (170, N'噍吧哖事件紀念園區', 1, 350.0000, 700.0000, 200, N'1915年，日本治理臺灣殖民地邁向第20個年頭，在不公義的稅制、法制以及無所不管的警察「大人」體制下，積怨日深，於是余清芳等人以西來庵修廟名義籌募抗日基金，同年夏天噍吧哖地方爆發了日本統治臺灣以來規模最大的武裝抗日事件。有數百人在事件當中戰死，數千人罹難，因牽涉這次事件而遭受逮捕、判刑的人，遍布全台各地，此歷史事件被稱為噍吧哖事件，也稱西來庵事件或余清芳事件。', N'噍吧哖事件紀念園區.jpg', 1, 20, N'714台南市玉井區玉井里', CAST(N'2020-01-01T00:00:00' AS SmallDateTime), CAST(N'2023-12-31T00:00:00' AS SmallDateTime), 12, 0, NULL, CAST(N'1900-01-20T00:00:00' AS SmallDateTime), CAST(N'1902-10-09T00:00:00' AS SmallDateTime))
INSERT [dbo].[tProduct] ([fID], [fName], [fPeriodID], [fCost], [fPrice], [fStocks], [fDescription], [fImagePath], [fMinParticipants], [fMaxParticipants], [fAssemblyPoint], [fStartDate], [fEndDate], [fProviderID], [fRemoved], [fRemark], [fCreationDate], [fLastUpdateDate]) VALUES (171, N'噍吧哖事件紀念園區', 2, 350.0000, 700.0000, 200, N'1915年，日本治理臺灣殖民地邁向第20個年頭，在不公義的稅制、法制以及無所不管的警察「大人」體制下，積怨日深，於是余清芳等人以西來庵修廟名義籌募抗日基金，同年夏天噍吧哖地方爆發了日本統治臺灣以來規模最大的武裝抗日事件。有數百人在事件當中戰死，數千人罹難，因牽涉這次事件而遭受逮捕、判刑的人，遍布全台各地，此歷史事件被稱為噍吧哖事件，也稱西來庵事件或余清芳事件。', N'噍吧哖事件紀念園區.jpg', 1, 20, N'714台南市玉井區玉井里', CAST(N'2020-01-01T00:00:00' AS SmallDateTime), CAST(N'2023-12-31T00:00:00' AS SmallDateTime), 12, 0, NULL, CAST(N'1900-01-20T00:00:00' AS SmallDateTime), CAST(N'1902-10-09T00:00:00' AS SmallDateTime))
INSERT [dbo].[tProduct] ([fID], [fName], [fPeriodID], [fCost], [fPrice], [fStocks], [fDescription], [fImagePath], [fMinParticipants], [fMaxParticipants], [fAssemblyPoint], [fStartDate], [fEndDate], [fProviderID], [fRemoved], [fRemark], [fCreationDate], [fLastUpdateDate]) VALUES (172, N'善化糖廠', 1, 350.0000, 700.0000, 200, N'許多人對善化糖廠的印象一定是那片翠綠整齊的樹林，糖廠邊的樹林常吸引了許多攝影愛好者與幸福的新人拍攝婚紗，但更多人對於他的印象則是那香甜可口的冰品，從1905年至今善化糖廠總是飄散著壓榨甘蔗製糖的濃厚香氣，對於許多在此地的老居民來說那是無法忘懷的回憶。在冰品部，有9種口味的冰淇淋與13種口味的冰棒，加上特製的紅茶，讓這裡在夏天時總是人潮滿滿；', N'善化糖廠.jpg', 1, 20, N'741台南市善化區', CAST(N'2020-01-01T00:00:00' AS SmallDateTime), CAST(N'2023-12-31T00:00:00' AS SmallDateTime), 12, 0, NULL, CAST(N'1900-01-20T00:00:00' AS SmallDateTime), CAST(N'1902-10-09T00:00:00' AS SmallDateTime))
INSERT [dbo].[tProduct] ([fID], [fName], [fPeriodID], [fCost], [fPrice], [fStocks], [fDescription], [fImagePath], [fMinParticipants], [fMaxParticipants], [fAssemblyPoint], [fStartDate], [fEndDate], [fProviderID], [fRemoved], [fRemark], [fCreationDate], [fLastUpdateDate]) VALUES (173, N'善化糖廠', 2, 350.0000, 700.0000, 200, N'許多人對善化糖廠的印象一定是那片翠綠整齊的樹林，糖廠邊的樹林常吸引了許多攝影愛好者與幸福的新人拍攝婚紗，但更多人對於他的印象則是那香甜可口的冰品，從1905年至今善化糖廠總是飄散著壓榨甘蔗製糖的濃厚香氣，對於許多在此地的老居民來說那是無法忘懷的回憶。在冰品部，有9種口味的冰淇淋與13種口味的冰棒，加上特製的紅茶，讓這裡在夏天時總是人潮滿滿；', N'善化糖廠.jpg', 1, 20, N'741台南市善化區', CAST(N'2020-01-01T00:00:00' AS SmallDateTime), CAST(N'2023-12-31T00:00:00' AS SmallDateTime), 12, 0, NULL, CAST(N'1900-01-20T00:00:00' AS SmallDateTime), CAST(N'1902-10-09T00:00:00' AS SmallDateTime))
INSERT [dbo].[tProduct] ([fID], [fName], [fPeriodID], [fCost], [fPrice], [fStocks], [fDescription], [fImagePath], [fMinParticipants], [fMaxParticipants], [fAssemblyPoint], [fStartDate], [fEndDate], [fProviderID], [fRemoved], [fRemark], [fCreationDate], [fLastUpdateDate]) VALUES (174, N'新營鐵道文化園區', 1, 350.0000, 700.0000, 200, N'新營鐵道文化園區所在的新營糖廠為台糖公司三大總廠之一，因組織層級較高緣故，辦公廳舍及宿舍皆別具一格，鐵路軌道多而密、車輛調度靈活，在台糖公司五分仔車客運興盛時期為主要的運輸重鎮。', N'新營鐵道文化園區.jpg', 1, 20, N'730台南市新營區中興路42號', CAST(N'2020-01-01T00:00:00' AS SmallDateTime), CAST(N'2023-12-31T00:00:00' AS SmallDateTime), 13, 0, NULL, CAST(N'1900-01-20T00:00:00' AS SmallDateTime), CAST(N'1902-10-09T00:00:00' AS SmallDateTime))
INSERT [dbo].[tProduct] ([fID], [fName], [fPeriodID], [fCost], [fPrice], [fStocks], [fDescription], [fImagePath], [fMinParticipants], [fMaxParticipants], [fAssemblyPoint], [fStartDate], [fEndDate], [fProviderID], [fRemoved], [fRemark], [fCreationDate], [fLastUpdateDate]) VALUES (175, N'新營鐵道文化園區', 2, 350.0000, 700.0000, 200, N'新營鐵道文化園區所在的新營糖廠為台糖公司三大總廠之一，因組織層級較高緣故，辦公廳舍及宿舍皆別具一格，鐵路軌道多而密、車輛調度靈活，在台糖公司五分仔車客運興盛時期為主要的運輸重鎮。', N'新營鐵道文化園區.jpg', 1, 20, N'730台南市新營區中興路42號', CAST(N'2020-01-01T00:00:00' AS SmallDateTime), CAST(N'2023-12-31T00:00:00' AS SmallDateTime), 13, 0, NULL, CAST(N'1900-01-20T00:00:00' AS SmallDateTime), CAST(N'1902-10-09T00:00:00' AS SmallDateTime))
INSERT [dbo].[tProduct] ([fID], [fName], [fPeriodID], [fCost], [fPrice], [fStocks], [fDescription], [fImagePath], [fMinParticipants], [fMaxParticipants], [fAssemblyPoint], [fStartDate], [fEndDate], [fProviderID], [fRemoved], [fRemark], [fCreationDate], [fLastUpdateDate]) VALUES (176, N'樹谷生活科學館', 1, 350.0000, 700.0000, 200, N'樹谷生活科學館是台南最具規模的自然史博物館，也是首座以骨骼標本為主要展示的博物館，裡面有生物、考古、科學為三個主軸，展示館內的恐龍骨骼標本與長毛象的化石標本是小朋友最愛兩個明星，兩座標本高聳的氣勢讓許多孩子一進門就驚呼不已，搭配上其他古生物的化石標本，讓孩子們目不暇給，只要租借導覽機器，站在標本前方的定點都還有互動式的體驗導覽，燃起孩子們探索的慾望與想像力。', N'樹谷生活科學館.jpg', 1, 20, N'744台南市新市區豐華里', CAST(N'2020-01-01T00:00:00' AS SmallDateTime), CAST(N'2023-12-31T00:00:00' AS SmallDateTime), 13, 0, NULL, CAST(N'1900-01-20T00:00:00' AS SmallDateTime), CAST(N'1902-10-09T00:00:00' AS SmallDateTime))
INSERT [dbo].[tProduct] ([fID], [fName], [fPeriodID], [fCost], [fPrice], [fStocks], [fDescription], [fImagePath], [fMinParticipants], [fMaxParticipants], [fAssemblyPoint], [fStartDate], [fEndDate], [fProviderID], [fRemoved], [fRemark], [fCreationDate], [fLastUpdateDate]) VALUES (177, N'樹谷生活科學館', 2, 350.0000, 700.0000, 200, N'樹谷生活科學館是台南最具規模的自然史博物館，也是首座以骨骼標本為主要展示的博物館，裡面有生物、考古、科學為三個主軸，展示館內的恐龍骨骼標本與長毛象的化石標本是小朋友最愛兩個明星，兩座標本高聳的氣勢讓許多孩子一進門就驚呼不已，搭配上其他古生物的化石標本，讓孩子們目不暇給，只要租借導覽機器，站在標本前方的定點都還有互動式的體驗導覽，燃起孩子們探索的慾望與想像力。', N'樹谷生活科學館.jpg', 1, 20, N'744台南市新市區豐華里', CAST(N'2020-01-01T00:00:00' AS SmallDateTime), CAST(N'2023-12-31T00:00:00' AS SmallDateTime), 13, 0, NULL, CAST(N'1900-01-20T00:00:00' AS SmallDateTime), CAST(N'1902-10-09T00:00:00' AS SmallDateTime))
INSERT [dbo].[tProduct] ([fID], [fName], [fPeriodID], [fCost], [fPrice], [fStocks], [fDescription], [fImagePath], [fMinParticipants], [fMaxParticipants], [fAssemblyPoint], [fStartDate], [fEndDate], [fProviderID], [fRemoved], [fRemark], [fCreationDate], [fLastUpdateDate]) VALUES (178, N'方圓美術館
', 1, 350.0000, 700.0000, 200, N'方圓美術館是將軍區最文青、最美麗的建築之ㄧ。方圓美術館過去有兩個身分，ㄧ是將軍首任鄉長黃清舞的故居-遂園，同時是黃老鄉長懸壺濟世的診所-遂生醫院。建於西元1944年，建築最大特色是四合院結合拱門迴廊，中西建築特色合併，在當時為非常前衛的設計。財團法人方圓文化藝術基金會接手整修後成為現今的方圓美術館，展示許多當代藝術作品，過往主人黃老鄉長的書房及故居保留的文物和老照片也都典藏於內，訪客可以好好看一下早期文青的生活品味，也可以看看現代文青的藝術作品。', N'方圓美術館
.jpg', 1, 20, N'725005台南市將軍區西華里1-1號', CAST(N'2020-01-01T00:00:00' AS SmallDateTime), CAST(N'2023-12-31T00:00:00' AS SmallDateTime), 13, 0, NULL, CAST(N'1900-01-20T00:00:00' AS SmallDateTime), CAST(N'1902-10-09T00:00:00' AS SmallDateTime))
INSERT [dbo].[tProduct] ([fID], [fName], [fPeriodID], [fCost], [fPrice], [fStocks], [fDescription], [fImagePath], [fMinParticipants], [fMaxParticipants], [fAssemblyPoint], [fStartDate], [fEndDate], [fProviderID], [fRemoved], [fRemark], [fCreationDate], [fLastUpdateDate]) VALUES (179, N'方圓美術館
', 2, 350.0000, 700.0000, 200, N'方圓美術館是將軍區最文青、最美麗的建築之ㄧ。方圓美術館過去有兩個身分，ㄧ是將軍首任鄉長黃清舞的故居-遂園，同時是黃老鄉長懸壺濟世的診所-遂生醫院。建於西元1944年，建築最大特色是四合院結合拱門迴廊，中西建築特色合併，在當時為非常前衛的設計。財團法人方圓文化藝術基金會接手整修後成為現今的方圓美術館，展示許多當代藝術作品，過往主人黃老鄉長的書房及故居保留的文物和老照片也都典藏於內，訪客可以好好看一下早期文青的生活品味，也可以看看現代文青的藝術作品。', N'方圓美術館
.jpg', 1, 20, N'725005台南市將軍區西華里1-1號', CAST(N'2020-01-01T00:00:00' AS SmallDateTime), CAST(N'2023-12-31T00:00:00' AS SmallDateTime), 13, 0, NULL, CAST(N'1900-01-20T00:00:00' AS SmallDateTime), CAST(N'1902-10-09T00:00:00' AS SmallDateTime))
INSERT [dbo].[tProduct] ([fID], [fName], [fPeriodID], [fCost], [fPrice], [fStocks], [fDescription], [fImagePath], [fMinParticipants], [fMaxParticipants], [fAssemblyPoint], [fStartDate], [fEndDate], [fProviderID], [fRemoved], [fRemark], [fCreationDate], [fLastUpdateDate]) VALUES (180, N'林初埤木棉花道', 1, 350.0000, 700.0000, 200, N'每年三月的頭一兩天，都會有很多媒體迫不及待報導這一條享有盛名的木棉道，火紅色的木棉花綿延在整條馬路上的畫面，總是吸引了很多人前來，更是全球最美的10條花道之一，不管是來玩的、來湊熱鬧的、來拍婚紗的，三月份時整條路上總是充滿了遊客，各拍的各的，各忙各的，但是同樣都掛著開心的表情。', N'林初埤木棉花道.jpg', 1, 20, N'732台南市白河區', CAST(N'2020-01-01T00:00:00' AS SmallDateTime), CAST(N'2023-12-31T00:00:00' AS SmallDateTime), 13, 0, NULL, CAST(N'1900-01-20T00:00:00' AS SmallDateTime), CAST(N'1902-10-09T00:00:00' AS SmallDateTime))
INSERT [dbo].[tProduct] ([fID], [fName], [fPeriodID], [fCost], [fPrice], [fStocks], [fDescription], [fImagePath], [fMinParticipants], [fMaxParticipants], [fAssemblyPoint], [fStartDate], [fEndDate], [fProviderID], [fRemoved], [fRemark], [fCreationDate], [fLastUpdateDate]) VALUES (181, N'林初埤木棉花道', 2, 350.0000, 700.0000, 200, N'每年三月的頭一兩天，都會有很多媒體迫不及待報導這一條享有盛名的木棉道，火紅色的木棉花綿延在整條馬路上的畫面，總是吸引了很多人前來，更是全球最美的10條花道之一，不管是來玩的、來湊熱鬧的、來拍婚紗的，三月份時整條路上總是充滿了遊客，各拍的各的，各忙各的，但是同樣都掛著開心的表情。', N'林初埤木棉花道.jpg', 1, 20, N'732台南市白河區', CAST(N'2020-01-01T00:00:00' AS SmallDateTime), CAST(N'2023-12-31T00:00:00' AS SmallDateTime), 13, 0, NULL, CAST(N'1900-01-20T00:00:00' AS SmallDateTime), CAST(N'1902-10-09T00:00:00' AS SmallDateTime))
INSERT [dbo].[tProduct] ([fID], [fName], [fPeriodID], [fCost], [fPrice], [fStocks], [fDescription], [fImagePath], [fMinParticipants], [fMaxParticipants], [fAssemblyPoint], [fStartDate], [fEndDate], [fProviderID], [fRemoved], [fRemark], [fCreationDate], [fLastUpdateDate]) VALUES (182, N'林初埤木棉花道', 3, 350.0000, 700.0000, 200, N'每年三月的頭一兩天，都會有很多媒體迫不及待報導這一條享有盛名的木棉道，火紅色的木棉花綿延在整條馬路上的畫面，總是吸引了很多人前來，更是全球最美的10條花道之一，不管是來玩的、來湊熱鬧的、來拍婚紗的，三月份時整條路上總是充滿了遊客，各拍的各的，各忙各的，但是同樣都掛著開心的表情。', N'林初埤木棉花道.jpg', 1, 20, N'732台南市白河區', CAST(N'2020-01-01T00:00:00' AS SmallDateTime), CAST(N'2023-12-31T00:00:00' AS SmallDateTime), 13, 0, NULL, CAST(N'1900-01-20T00:00:00' AS SmallDateTime), CAST(N'1902-10-09T00:00:00' AS SmallDateTime))
INSERT [dbo].[tProduct] ([fID], [fName], [fPeriodID], [fCost], [fPrice], [fStocks], [fDescription], [fImagePath], [fMinParticipants], [fMaxParticipants], [fAssemblyPoint], [fStartDate], [fEndDate], [fProviderID], [fRemoved], [fRemark], [fCreationDate], [fLastUpdateDate]) VALUES (183, N'朱玖瑩故居', 1, 350.0000, 700.0000, 200, N'位於德記洋行旁的朱玖瑩故居原本是台鹽的宿舍，也稱為「因鹽玖定」，曾任財政部鹽務總局局長的朱玖瑩先生，因鹽定居於此而有此名，建築內有朱玖瑩先生的當代顏體書法展覽，身為書法名家的他留下許多作品，晚年長居安平，自號安平老人。', N'朱玖瑩故居.jpg', 1, 20, N'708台南市安平區古堡街', CAST(N'2020-01-01T00:00:00' AS SmallDateTime), CAST(N'2023-12-31T00:00:00' AS SmallDateTime), 13, 0, NULL, CAST(N'1900-01-20T00:00:00' AS SmallDateTime), CAST(N'1902-10-09T00:00:00' AS SmallDateTime))
INSERT [dbo].[tProduct] ([fID], [fName], [fPeriodID], [fCost], [fPrice], [fStocks], [fDescription], [fImagePath], [fMinParticipants], [fMaxParticipants], [fAssemblyPoint], [fStartDate], [fEndDate], [fProviderID], [fRemoved], [fRemark], [fCreationDate], [fLastUpdateDate]) VALUES (184, N'朱玖瑩故居', 2, 350.0000, 700.0000, 200, N'位於德記洋行旁的朱玖瑩故居原本是台鹽的宿舍，也稱為「因鹽玖定」，曾任財政部鹽務總局局長的朱玖瑩先生，因鹽定居於此而有此名，建築內有朱玖瑩先生的當代顏體書法展覽，身為書法名家的他留下許多作品，晚年長居安平，自號安平老人。', N'朱玖瑩故居.jpg', 1, 20, N'708台南市安平區古堡街', CAST(N'2020-01-01T00:00:00' AS SmallDateTime), CAST(N'2023-12-31T00:00:00' AS SmallDateTime), 13, 0, NULL, CAST(N'1900-01-20T00:00:00' AS SmallDateTime), CAST(N'1902-10-09T00:00:00' AS SmallDateTime))
INSERT [dbo].[tProduct] ([fID], [fName], [fPeriodID], [fCost], [fPrice], [fStocks], [fDescription], [fImagePath], [fMinParticipants], [fMaxParticipants], [fAssemblyPoint], [fStartDate], [fEndDate], [fProviderID], [fRemoved], [fRemark], [fCreationDate], [fLastUpdateDate]) VALUES (185, N'南部科學園區', 1, 350.0000, 700.0000, 200, N'南部科學園區是南台灣重要的高科技科學園區，以自然與生態並存做為開發的理念，整個園區綠意盎然，到處充滿植栽與草皮，加上在園區內廣設生態豐富的滯洪池，以及擁有獨特民族風格的西拉雅廣場，遍布各處的裝置藝術品，加上生態保護區，讓南部科學園區像是一座擁有美麗大公園的自然生態藝術博物館，更是重要的環境教育設施場所。', N'南部科學園區.jpg', 1, 20, N'744台南市新市區南科三路22號', CAST(N'2020-01-01T00:00:00' AS SmallDateTime), CAST(N'2023-12-31T00:00:00' AS SmallDateTime), 14, 0, NULL, CAST(N'1900-01-20T00:00:00' AS SmallDateTime), CAST(N'1902-10-09T00:00:00' AS SmallDateTime))
INSERT [dbo].[tProduct] ([fID], [fName], [fPeriodID], [fCost], [fPrice], [fStocks], [fDescription], [fImagePath], [fMinParticipants], [fMaxParticipants], [fAssemblyPoint], [fStartDate], [fEndDate], [fProviderID], [fRemoved], [fRemark], [fCreationDate], [fLastUpdateDate]) VALUES (186, N'南部科學園區', 2, 350.0000, 700.0000, 200, N'南部科學園區是南台灣重要的高科技科學園區，以自然與生態並存做為開發的理念，整個園區綠意盎然，到處充滿植栽與草皮，加上在園區內廣設生態豐富的滯洪池，以及擁有獨特民族風格的西拉雅廣場，遍布各處的裝置藝術品，加上生態保護區，讓南部科學園區像是一座擁有美麗大公園的自然生態藝術博物館，更是重要的環境教育設施場所。', N'南部科學園區.jpg', 1, 20, N'744台南市新市區南科三路22號', CAST(N'2020-01-01T00:00:00' AS SmallDateTime), CAST(N'2023-12-31T00:00:00' AS SmallDateTime), 14, 0, NULL, CAST(N'1900-01-20T00:00:00' AS SmallDateTime), CAST(N'1902-10-09T00:00:00' AS SmallDateTime))
INSERT [dbo].[tProduct] ([fID], [fName], [fPeriodID], [fCost], [fPrice], [fStocks], [fDescription], [fImagePath], [fMinParticipants], [fMaxParticipants], [fAssemblyPoint], [fStartDate], [fEndDate], [fProviderID], [fRemoved], [fRemark], [fCreationDate], [fLastUpdateDate]) VALUES (187, N'永康探索教育公園', 1, 350.0000, 700.0000, 200, N'探索教育公園佔地約6公頃，整個探索教育園區為全台最大的專業探索場地，也是台灣目前最大的探索教育公園，與鄰近的社教中心相佐，形成永康文化教育特區。公園內擁有大片的翠綠草皮，以及豐富的林蔭，完善的設施吸引許多附近的居民帶著小孩來玩，不管是常見的公園遊樂器材，或是較具挑戰性的攀岩場，及更為專業的低空探索設施都一應具全，需要注意探索設施有其專業性，必須有專業裝備與教練陪同才能確保使用安全，因此目前探索設施是必須經過申請才能使用的。', N'永康探索教育公園.jpg', 1, 20, N'710台南市永康區永平街469巷13號', CAST(N'2020-01-01T00:00:00' AS SmallDateTime), CAST(N'2023-12-31T00:00:00' AS SmallDateTime), 14, 0, NULL, CAST(N'1900-01-20T00:00:00' AS SmallDateTime), CAST(N'1902-10-09T00:00:00' AS SmallDateTime))
INSERT [dbo].[tProduct] ([fID], [fName], [fPeriodID], [fCost], [fPrice], [fStocks], [fDescription], [fImagePath], [fMinParticipants], [fMaxParticipants], [fAssemblyPoint], [fStartDate], [fEndDate], [fProviderID], [fRemoved], [fRemark], [fCreationDate], [fLastUpdateDate]) VALUES (188, N'永康探索教育公園', 2, 350.0000, 700.0000, 200, N'探索教育公園佔地約6公頃，整個探索教育園區為全台最大的專業探索場地，也是台灣目前最大的探索教育公園，與鄰近的社教中心相佐，形成永康文化教育特區。公園內擁有大片的翠綠草皮，以及豐富的林蔭，完善的設施吸引許多附近的居民帶著小孩來玩，不管是常見的公園遊樂器材，或是較具挑戰性的攀岩場，及更為專業的低空探索設施都一應具全，需要注意探索設施有其專業性，必須有專業裝備與教練陪同才能確保使用安全，因此目前探索設施是必須經過申請才能使用的。', N'永康探索教育公園.jpg', 1, 20, N'710台南市永康區永平街469巷13號', CAST(N'2020-01-01T00:00:00' AS SmallDateTime), CAST(N'2023-12-31T00:00:00' AS SmallDateTime), 14, 0, NULL, CAST(N'1900-01-20T00:00:00' AS SmallDateTime), CAST(N'1902-10-09T00:00:00' AS SmallDateTime))
INSERT [dbo].[tProduct] ([fID], [fName], [fPeriodID], [fCost], [fPrice], [fStocks], [fDescription], [fImagePath], [fMinParticipants], [fMaxParticipants], [fAssemblyPoint], [fStartDate], [fEndDate], [fProviderID], [fRemoved], [fRemark], [fCreationDate], [fLastUpdateDate]) VALUES (189, N'永康探索教育公園', 3, 350.0000, 700.0000, 200, N'探索教育公園佔地約6公頃，整個探索教育園區為全台最大的專業探索場地，也是台灣目前最大的探索教育公園，與鄰近的社教中心相佐，形成永康文化教育特區。公園內擁有大片的翠綠草皮，以及豐富的林蔭，完善的設施吸引許多附近的居民帶著小孩來玩，不管是常見的公園遊樂器材，或是較具挑戰性的攀岩場，及更為專業的低空探索設施都一應具全，需要注意探索設施有其專業性，必須有專業裝備與教練陪同才能確保使用安全，因此目前探索設施是必須經過申請才能使用的。', N'永康探索教育公園.jpg', 1, 20, N'710台南市永康區永平街469巷13號', CAST(N'2020-01-01T00:00:00' AS SmallDateTime), CAST(N'2023-12-31T00:00:00' AS SmallDateTime), 14, 0, NULL, CAST(N'1900-01-20T00:00:00' AS SmallDateTime), CAST(N'1902-10-09T00:00:00' AS SmallDateTime))
INSERT [dbo].[tProduct] ([fID], [fName], [fPeriodID], [fCost], [fPrice], [fStocks], [fDescription], [fImagePath], [fMinParticipants], [fMaxParticipants], [fAssemblyPoint], [fStartDate], [fEndDate], [fProviderID], [fRemoved], [fRemark], [fCreationDate], [fLastUpdateDate]) VALUES (190, N'原台南合同廳舍', 1, 350.0000, 700.0000, 200, N'經過湯德章紀念公園的圓環一定會被這棟白色的特別建築所吸引，它就是建於日治時期的合同廳舍(意即聯合辦公廳舍)，建築的高塔在1930年落成時稱為「火見樓」，是當時台南市區中最高的建築物，在當時幾乎全為木造房屋的市區中顯得格外重要，可以隨時監控著市區內火災的發生。', N'原台南合同廳舍.jpg', 1, 20, N'700台南市中西區中正路2-1號', CAST(N'2020-01-01T00:00:00' AS SmallDateTime), CAST(N'2023-12-31T00:00:00' AS SmallDateTime), 14, 0, NULL, CAST(N'1900-01-20T00:00:00' AS SmallDateTime), CAST(N'1902-10-09T00:00:00' AS SmallDateTime))
INSERT [dbo].[tProduct] ([fID], [fName], [fPeriodID], [fCost], [fPrice], [fStocks], [fDescription], [fImagePath], [fMinParticipants], [fMaxParticipants], [fAssemblyPoint], [fStartDate], [fEndDate], [fProviderID], [fRemoved], [fRemark], [fCreationDate], [fLastUpdateDate]) VALUES (191, N'原台南合同廳舍', 2, 350.0000, 700.0000, 200, N'經過湯德章紀念公園的圓環一定會被這棟白色的特別建築所吸引，它就是建於日治時期的合同廳舍(意即聯合辦公廳舍)，建築的高塔在1930年落成時稱為「火見樓」，是當時台南市區中最高的建築物，在當時幾乎全為木造房屋的市區中顯得格外重要，可以隨時監控著市區內火災的發生。', N'原台南合同廳舍.jpg', 1, 20, N'700台南市中西區中正路2-1號', CAST(N'2020-01-01T00:00:00' AS SmallDateTime), CAST(N'2023-12-31T00:00:00' AS SmallDateTime), 14, 0, NULL, CAST(N'1900-01-20T00:00:00' AS SmallDateTime), CAST(N'1902-10-09T00:00:00' AS SmallDateTime))
INSERT [dbo].[tProduct] ([fID], [fName], [fPeriodID], [fCost], [fPrice], [fStocks], [fDescription], [fImagePath], [fMinParticipants], [fMaxParticipants], [fAssemblyPoint], [fStartDate], [fEndDate], [fProviderID], [fRemoved], [fRemark], [fCreationDate], [fLastUpdateDate]) VALUES (192, N'後壁車站', 1, 350.0000, 700.0000, 200, N'建於日治時期1902年的後壁車站是後壁很具代表性的景點之一，許多造訪後壁的旅人總是從後壁火車站下車，再租借自行車緩緩的前往菁寮探訪田野與老街，車站前廣場以紀錄片無米樂中四位主角與一頭牛雕塑銅像以代表後壁的精神，分別是崑濱伯夫婦、煌明伯及文林伯，更是許多人合影留念的必拍之處。', N'後壁車站.jpg', 1, 20, N'731台南市後壁區後壁里', CAST(N'2020-01-01T00:00:00' AS SmallDateTime), CAST(N'2023-12-31T00:00:00' AS SmallDateTime), 14, 0, NULL, CAST(N'1900-01-20T00:00:00' AS SmallDateTime), CAST(N'1902-10-09T00:00:00' AS SmallDateTime))
INSERT [dbo].[tProduct] ([fID], [fName], [fPeriodID], [fCost], [fPrice], [fStocks], [fDescription], [fImagePath], [fMinParticipants], [fMaxParticipants], [fAssemblyPoint], [fStartDate], [fEndDate], [fProviderID], [fRemoved], [fRemark], [fCreationDate], [fLastUpdateDate]) VALUES (193, N'後壁車站', 2, 350.0000, 700.0000, 200, N'建於日治時期1902年的後壁車站是後壁很具代表性的景點之一，許多造訪後壁的旅人總是從後壁火車站下車，再租借自行車緩緩的前往菁寮探訪田野與老街，車站前廣場以紀錄片無米樂中四位主角與一頭牛雕塑銅像以代表後壁的精神，分別是崑濱伯夫婦、煌明伯及文林伯，更是許多人合影留念的必拍之處。', N'後壁車站.jpg', 1, 20, N'731台南市後壁區後壁里', CAST(N'2020-01-01T00:00:00' AS SmallDateTime), CAST(N'2023-12-31T00:00:00' AS SmallDateTime), 14, 0, NULL, CAST(N'1900-01-20T00:00:00' AS SmallDateTime), CAST(N'1902-10-09T00:00:00' AS SmallDateTime))
INSERT [dbo].[tProduct] ([fID], [fName], [fPeriodID], [fCost], [fPrice], [fStocks], [fDescription], [fImagePath], [fMinParticipants], [fMaxParticipants], [fAssemblyPoint], [fStartDate], [fEndDate], [fProviderID], [fRemoved], [fRemark], [fCreationDate], [fLastUpdateDate]) VALUES (194, N'後壁車站', 3, 350.0000, 700.0000, 200, N'建於日治時期1902年的後壁車站是後壁很具代表性的景點之一，許多造訪後壁的旅人總是從後壁火車站下車，再租借自行車緩緩的前往菁寮探訪田野與老街，車站前廣場以紀錄片無米樂中四位主角與一頭牛雕塑銅像以代表後壁的精神，分別是崑濱伯夫婦、煌明伯及文林伯，更是許多人合影留念的必拍之處。', N'後壁車站.jpg', 1, 20, N'731台南市後壁區後壁里', CAST(N'2020-01-01T00:00:00' AS SmallDateTime), CAST(N'2023-12-31T00:00:00' AS SmallDateTime), 14, 0, NULL, CAST(N'1900-01-20T00:00:00' AS SmallDateTime), CAST(N'1902-10-09T00:00:00' AS SmallDateTime))
SET IDENTITY_INSERT [dbo].[tProduct] OFF
GO
SET IDENTITY_INSERT [dbo].[tProductReport] ON 

INSERT [dbo].[tProductReport] ([fID], [fOrderDetailID], [fReportContent], [fCreationDate], [fProductID]) VALUES (1, 1, N'導遊沒來，爛透了', CAST(N'2023-01-01T00:00:00' AS SmallDateTime), 1)
INSERT [dbo].[tProductReport] ([fID], [fOrderDetailID], [fReportContent], [fCreationDate], [fProductID]) VALUES (2, 2, N'超無趣。再也不買了', CAST(N'2023-01-12T00:00:00' AS SmallDateTime), 3)
INSERT [dbo].[tProductReport] ([fID], [fOrderDetailID], [fReportContent], [fCreationDate], [fProductID]) VALUES (3, 3, N'人潮擁擠，價格昂貴，垃圾污染問題嚴重', CAST(N'2022-02-02T00:00:00' AS SmallDateTime), 5)
INSERT [dbo].[tProductReport] ([fID], [fOrderDetailID], [fReportContent], [fCreationDate], [fProductID]) VALUES (4, 4, N'交通堵塞，空氣污染嚴重，景點過於擁擠', CAST(N'2022-02-02T00:00:00' AS SmallDateTime), 8)
INSERT [dbo].[tProductReport] ([fID], [fOrderDetailID], [fReportContent], [fCreationDate], [fProductID]) VALUES (5, 5, N'交通不便，風景遭破壞，衛生情況較差', CAST(N'2022-02-02T00:00:00' AS SmallDateTime), 10)
INSERT [dbo].[tProductReport] ([fID], [fOrderDetailID], [fReportContent], [fCreationDate], [fProductID]) VALUES (6, 6, N'景點過於商業化，環境污染嚴重，商家服務差', CAST(N'2022-02-02T00:00:00' AS SmallDateTime), 12)
INSERT [dbo].[tProductReport] ([fID], [fOrderDetailID], [fReportContent], [fCreationDate], [fProductID]) VALUES (7, 7, N'價格過高，環境污染嚴重，景點過於繁忙', CAST(N'2022-02-02T00:00:00' AS SmallDateTime), 13)
INSERT [dbo].[tProductReport] ([fID], [fOrderDetailID], [fReportContent], [fCreationDate], [fProductID]) VALUES (8, 8, N'人潮太多，根本沒辦法好好體驗', CAST(N'2022-02-02T00:00:00' AS SmallDateTime), 15)
INSERT [dbo].[tProductReport] ([fID], [fOrderDetailID], [fReportContent], [fCreationDate], [fProductID]) VALUES (9, 9, N'交通混亂且停車困難，酒店房價昂貴', CAST(N'2022-02-02T00:00:00' AS SmallDateTime), 16)
INSERT [dbo].[tProductReport] ([fID], [fOrderDetailID], [fReportContent], [fCreationDate], [fProductID]) VALUES (10, 10, N'人擠人，還不如在家自己做飯', CAST(N'2022-02-02T00:00:00' AS SmallDateTime), 17)
SET IDENTITY_INSERT [dbo].[tProductReport] OFF
GO
SET IDENTITY_INSERT [dbo].[tProductReview] ON 

INSERT [dbo].[tProductReview] ([fID], [fOrderDetailID], [fReviewContent], [fScore], [fCreationDate], [fProductID]) VALUES (3, 3, N'好好玩，物超所值', 5, CAST(N'2022-01-10T00:00:00' AS SmallDateTime), 5)
INSERT [dbo].[tProductReview] ([fID], [fOrderDetailID], [fReviewContent], [fScore], [fCreationDate], [fProductID]) VALUES (4, 4, N'非常有趣，下次有機會會再買', 5, CAST(N'2023-01-16T00:00:00' AS SmallDateTime), 8)
INSERT [dbo].[tProductReview] ([fID], [fOrderDetailID], [fReviewContent], [fScore], [fCreationDate], [fProductID]) VALUES (6, 5, N'服務態度差，餐點沒有預期的美味，不太推薦', 1, CAST(N'2022-02-02T00:00:00' AS SmallDateTime), 10)
INSERT [dbo].[tProductReview] ([fID], [fOrderDetailID], [fReviewContent], [fScore], [fCreationDate], [fProductID]) VALUES (7, 6, N'周邊環境整治不佳，水質不好，不適合嬉水', 1, CAST(N'2022-02-02T00:00:00' AS SmallDateTime), 12)
INSERT [dbo].[tProductReview] ([fID], [fOrderDetailID], [fReviewContent], [fScore], [fCreationDate], [fProductID]) VALUES (8, 7, N'人潮擁擠，價格高昂，不太適合沉溺於此', 1, CAST(N'2022-02-02T00:00:00' AS SmallDateTime), 13)
INSERT [dbo].[tProductReview] ([fID], [fOrderDetailID], [fReviewContent], [fScore], [fCreationDate], [fProductID]) VALUES (9, 8, N'環境嘈雜，附近沒有美食，不適合放鬆休息', 1, CAST(N'2022-02-02T00:00:00' AS SmallDateTime), 15)
INSERT [dbo].[tProductReview] ([fID], [fOrderDetailID], [fReviewContent], [fScore], [fCreationDate], [fProductID]) VALUES (10, 9, N'價格過高，環境污染嚴重，景點過於繁忙', 1, CAST(N'2022-02-02T00:00:00' AS SmallDateTime), 16)
INSERT [dbo].[tProductReview] ([fID], [fOrderDetailID], [fReviewContent], [fScore], [fCreationDate], [fProductID]) VALUES (11, 10, N'交通不便，風景遭破壞，衛生情況較差', 1, CAST(N'2022-02-02T00:00:00' AS SmallDateTime), 17)
SET IDENTITY_INSERT [dbo].[tProductReview] OFF
GO
SET IDENTITY_INSERT [dbo].[tProductsTag] ON 

INSERT [dbo].[tProductsTag] ([fSID], [fProductID], [fTagID]) VALUES (1, 1, 1)
INSERT [dbo].[tProductsTag] ([fSID], [fProductID], [fTagID]) VALUES (2, 1, 2)
INSERT [dbo].[tProductsTag] ([fSID], [fProductID], [fTagID]) VALUES (3, 3, 3)
SET IDENTITY_INSERT [dbo].[tProductsTag] OFF
GO
SET IDENTITY_INSERT [dbo].[tProvider] ON 

INSERT [dbo].[tProvider] ([fID], [fCompanyName], [fPassword], [fTaxID], [fFax], [fOwnerName], [fOwnerTel], [fOwnerMobile], [fOwnerEmail], [fContactName], [fContactTel], [fContactMobile], [fContactEmail], [fAddress], [fBankName], [fBankDivisionName], [fBankAccountNumber], [fBankAccountName], [fBlackList], [fRemark], [fCreationDate], [fLastUpdateDate]) VALUES (2, N'台灣國玉科技股份有限公司', N'123456789', N'91768804', N'06-2357594', N'柯美玲', N'06-2357594', N'0911786561', N'PbGNWv0ny4SYwq@gmail.com', N'柯美玲', N'06-2357594', N'0911786561', N'PbGNWv0ny4SYwq@gmail.com', N'臺中市梧棲區頂寮里中橫十路100號', N'台灣銀行', N'台中分行', N'73958419824761', N'台灣國玉科技股份有限公司', 1, NULL, CAST(N'2023-01-15T00:00:00' AS SmallDateTime), CAST(N'2023-02-03T13:28:00' AS SmallDateTime))
INSERT [dbo].[tProvider] ([fID], [fCompanyName], [fPassword], [fTaxID], [fFax], [fOwnerName], [fOwnerTel], [fOwnerMobile], [fOwnerEmail], [fContactName], [fContactTel], [fContactMobile], [fContactEmail], [fAddress], [fBankName], [fBankDivisionName], [fBankAccountNumber], [fBankAccountName], [fBlackList], [fRemark], [fCreationDate], [fLastUpdateDate]) VALUES (6, N'曜吉智能製造有限公司', N'123456789', N'43354994', N'06-5291164', N'楊芳茲', N'06-5291164', N'0988659055', N'l5CHKfWAZju@gmail.com', N'楊芳茲
', N'06-5291164', N'0988659055', N'l5CHKfWAZju@gmail.com', N'臺中市大里區東湖里中興路一段159之1號3樓A339', N'台企銀', N'大里分行', N'79581348679240', N'曜吉智能製造有限公司', 0, NULL, CAST(N'2023-01-30T00:00:00' AS SmallDateTime), CAST(N'2023-02-01T23:48:00' AS SmallDateTime))
INSERT [dbo].[tProvider] ([fID], [fCompanyName], [fPassword], [fTaxID], [fFax], [fOwnerName], [fOwnerTel], [fOwnerMobile], [fOwnerEmail], [fContactName], [fContactTel], [fContactMobile], [fContactEmail], [fAddress], [fBankName], [fBankDivisionName], [fBankAccountNumber], [fBankAccountName], [fBlackList], [fRemark], [fCreationDate], [fLastUpdateDate]) VALUES (8, N'寶緹貿易有限公司
', N'1234', N'11147396', N'06-2584689', N'辛瑋濬
', N'06-2584689', N'0917961183', N'qoKTJWEsX@gmail.com', N'辛瑋濬
', N'06-2584689', N'0917961183', N'qoKTJWEsX@gmail.com', N'臺南市東區裕聖里裕信五街2號1樓
', N'土地銀行', N'玉峰分行', N'76814685794975', N'寶緹貿易有限公司
', 0, NULL, CAST(N'2023-02-01T09:39:00' AS SmallDateTime), CAST(N'2023-02-02T09:39:00' AS SmallDateTime))
INSERT [dbo].[tProvider] ([fID], [fCompanyName], [fPassword], [fTaxID], [fFax], [fOwnerName], [fOwnerTel], [fOwnerMobile], [fOwnerEmail], [fContactName], [fContactTel], [fContactMobile], [fContactEmail], [fAddress], [fBankName], [fBankDivisionName], [fBankAccountNumber], [fBankAccountName], [fBlackList], [fRemark], [fCreationDate], [fLastUpdateDate]) VALUES (10, N'大歸仁服裝有限公司
', N'1234', N'23418133', N'06-6523753', N'黃志翔
', N'06-6523753', N'0924038444', N'SUsiaPowSP@gmail.com', N'黃志翔
', N'06-6523753', N'0924038444', N'SUsiaPowSP@gmail.com', N'臺南市歸仁區文化里民權北路208號1樓
', N'台銀', N'歸仁分行', N'98746855713228', N'大歸仁服裝有限公司
', 0, NULL, CAST(N'2022-06-15T00:00:00' AS SmallDateTime), CAST(N'2023-01-02T00:00:00' AS SmallDateTime))
INSERT [dbo].[tProvider] ([fID], [fCompanyName], [fPassword], [fTaxID], [fFax], [fOwnerName], [fOwnerTel], [fOwnerMobile], [fOwnerEmail], [fContactName], [fContactTel], [fContactMobile], [fContactEmail], [fAddress], [fBankName], [fBankDivisionName], [fBankAccountNumber], [fBankAccountName], [fBlackList], [fRemark], [fCreationDate], [fLastUpdateDate]) VALUES (11, N'鋕達有限公司
', N'1234', N'76099072', N'06-5905231', N'吳宗翰
', N'06-5905231', N'0934641746', N'QWZ7OK0bb@gmail.com', N'吳宗翰
', N'06-5905231', N'0934641746', N'QWZ7OK0bb@gmail.com', N'臺南市東區仁和路178巷5號1樓
', N'台新銀', N'歸仁分行', N'45779355813658', N'鋕達有限公司
', 0, NULL, CAST(N'2022-01-05T00:00:00' AS SmallDateTime), CAST(N'2022-11-09T00:00:00' AS SmallDateTime))
INSERT [dbo].[tProvider] ([fID], [fCompanyName], [fPassword], [fTaxID], [fFax], [fOwnerName], [fOwnerTel], [fOwnerMobile], [fOwnerEmail], [fContactName], [fContactTel], [fContactMobile], [fContactEmail], [fAddress], [fBankName], [fBankDivisionName], [fBankAccountNumber], [fBankAccountName], [fBlackList], [fRemark], [fCreationDate], [fLastUpdateDate]) VALUES (12, N'五探哥漁村有限公司
', N'1234', N'43275078', N'06-6216787', N'劉育郡
', N'06-6216787', N'0910665230', N'B1K0DkS4Sg5@gmail.com', N'劉育郡
', N'06-6216787', N'0910665230', N'B1K0DkS4Sg5@gmail.com', N'臺南市佳里區建南里安南路300號1樓
', N'中信銀', N'佳里分行', N'14659732184493', N'祥槿企業有限公司', 0, NULL, CAST(N'2022-01-18T00:00:00' AS SmallDateTime), CAST(N'2022-02-02T00:00:00' AS SmallDateTime))
INSERT [dbo].[tProvider] ([fID], [fCompanyName], [fPassword], [fTaxID], [fFax], [fOwnerName], [fOwnerTel], [fOwnerMobile], [fOwnerEmail], [fContactName], [fContactTel], [fContactMobile], [fContactEmail], [fAddress], [fBankName], [fBankDivisionName], [fBankAccountNumber], [fBankAccountName], [fBlackList], [fRemark], [fCreationDate], [fLastUpdateDate]) VALUES (13, N'子葳股份有限公司
', N'1234', N'70844291', N'06-5638990', N'王子建
', N'06-5638990', N'0926774162', N'ox9eytd4kHJ@gmail.com', N'王子建
', N'06-5638990', N'0926774162', N'ox9eytd4kHJ@gmail.com', N'臺南市安平區怡平里永華六街35巷1號5樓之1
', N'台新銀', N'怡平分行', N'57994881366647', N'子葳股份有限公司
', 0, NULL, CAST(N'2022-02-02T00:00:00' AS SmallDateTime), CAST(N'2022-02-02T00:00:00' AS SmallDateTime))
INSERT [dbo].[tProvider] ([fID], [fCompanyName], [fPassword], [fTaxID], [fFax], [fOwnerName], [fOwnerTel], [fOwnerMobile], [fOwnerEmail], [fContactName], [fContactTel], [fContactMobile], [fContactEmail], [fAddress], [fBankName], [fBankDivisionName], [fBankAccountNumber], [fBankAccountName], [fBlackList], [fRemark], [fCreationDate], [fLastUpdateDate]) VALUES (14, N'金嘉泓企業有限公司', N'1234', N'92353965', N'06-7714861', N'高建泓', N'06-7714861', N'0915217033', N'yz1s6J8ERbzn0I@gmail.com', N'高建泓
', N'06-7714861', N'0915217033', N'yz1s6J8ERbzn0I@gmail.com', N'臺南市善化區光文里光華路62號1樓', N'國泰銀', N'光文分', N'68884715793488', N'金嘉泓企業有限公司', 0, NULL, CAST(N'2022-02-02T00:00:00' AS SmallDateTime), CAST(N'2023-02-19T03:22:00' AS SmallDateTime))
SET IDENTITY_INSERT [dbo].[tProvider] OFF
GO
SET IDENTITY_INSERT [dbo].[tPurchaseOrderSheet] ON 

INSERT [dbo].[tPurchaseOrderSheet] ([fID], [fOrderDetailID], [fCreationDate]) VALUES (1, 1, CAST(N'2023-01-02T00:00:00' AS SmallDateTime))
INSERT [dbo].[tPurchaseOrderSheet] ([fID], [fOrderDetailID], [fCreationDate]) VALUES (2, 2, CAST(N'2023-01-02T00:00:00' AS SmallDateTime))
INSERT [dbo].[tPurchaseOrderSheet] ([fID], [fOrderDetailID], [fCreationDate]) VALUES (3, 3, CAST(N'2023-01-05T00:00:00' AS SmallDateTime))
INSERT [dbo].[tPurchaseOrderSheet] ([fID], [fOrderDetailID], [fCreationDate]) VALUES (4, 4, CAST(N'2023-01-06T00:00:00' AS SmallDateTime))
INSERT [dbo].[tPurchaseOrderSheet] ([fID], [fOrderDetailID], [fCreationDate]) VALUES (5, 5, CAST(N'2023-01-06T00:00:00' AS SmallDateTime))
INSERT [dbo].[tPurchaseOrderSheet] ([fID], [fOrderDetailID], [fCreationDate]) VALUES (6, 6, CAST(N'2023-01-07T00:00:00' AS SmallDateTime))
INSERT [dbo].[tPurchaseOrderSheet] ([fID], [fOrderDetailID], [fCreationDate]) VALUES (10, 7, CAST(N'2023-01-09T00:00:00' AS SmallDateTime))
INSERT [dbo].[tPurchaseOrderSheet] ([fID], [fOrderDetailID], [fCreationDate]) VALUES (12, 8, CAST(N'2023-01-11T00:00:00' AS SmallDateTime))
INSERT [dbo].[tPurchaseOrderSheet] ([fID], [fOrderDetailID], [fCreationDate]) VALUES (13, 9, CAST(N'2023-01-19T00:00:00' AS SmallDateTime))
INSERT [dbo].[tPurchaseOrderSheet] ([fID], [fOrderDetailID], [fCreationDate]) VALUES (14, 10, CAST(N'2023-01-25T00:00:00' AS SmallDateTime))
SET IDENTITY_INSERT [dbo].[tPurchaseOrderSheet] OFF
GO
SET IDENTITY_INSERT [dbo].[tShoppingCart] ON 

INSERT [dbo].[tShoppingCart] ([fSID], [fCustomerID], [fProductID], [fPurchaseQuantity], [fTravelDate]) VALUES (1, 1, 1, 2, CAST(N'2023-03-20T00:00:00' AS SmallDateTime))
INSERT [dbo].[tShoppingCart] ([fSID], [fCustomerID], [fProductID], [fPurchaseQuantity], [fTravelDate]) VALUES (2, 1, 3, 3, CAST(N'2023-05-26T00:00:00' AS SmallDateTime))
INSERT [dbo].[tShoppingCart] ([fSID], [fCustomerID], [fProductID], [fPurchaseQuantity], [fTravelDate]) VALUES (3, 1, 5, 2, CAST(N'2023-03-20T00:00:00' AS SmallDateTime))
INSERT [dbo].[tShoppingCart] ([fSID], [fCustomerID], [fProductID], [fPurchaseQuantity], [fTravelDate]) VALUES (4, 3, 3, 2, CAST(N'2023-05-26T00:00:00' AS SmallDateTime))
INSERT [dbo].[tShoppingCart] ([fSID], [fCustomerID], [fProductID], [fPurchaseQuantity], [fTravelDate]) VALUES (5, 3, 5, 1, CAST(N'2023-05-26T00:00:00' AS SmallDateTime))
INSERT [dbo].[tShoppingCart] ([fSID], [fCustomerID], [fProductID], [fPurchaseQuantity], [fTravelDate]) VALUES (6, 4, 8, 5, CAST(N'2023-03-20T00:00:00' AS SmallDateTime))
INSERT [dbo].[tShoppingCart] ([fSID], [fCustomerID], [fProductID], [fPurchaseQuantity], [fTravelDate]) VALUES (7, 4, 10, 1, CAST(N'2022-11-23T00:00:00' AS SmallDateTime))
INSERT [dbo].[tShoppingCart] ([fSID], [fCustomerID], [fProductID], [fPurchaseQuantity], [fTravelDate]) VALUES (8, 6, 12, 3, CAST(N'2023-03-20T00:00:00' AS SmallDateTime))
INSERT [dbo].[tShoppingCart] ([fSID], [fCustomerID], [fProductID], [fPurchaseQuantity], [fTravelDate]) VALUES (12, 8, 15, 4, CAST(N'2023-03-28T00:00:00' AS SmallDateTime))
INSERT [dbo].[tShoppingCart] ([fSID], [fCustomerID], [fProductID], [fPurchaseQuantity], [fTravelDate]) VALUES (13, 8, 16, 4, CAST(N'2023-03-28T00:00:00' AS SmallDateTime))
INSERT [dbo].[tShoppingCart] ([fSID], [fCustomerID], [fProductID], [fPurchaseQuantity], [fTravelDate]) VALUES (14, 8, 8, 4, CAST(N'2023-03-28T00:00:00' AS SmallDateTime))
INSERT [dbo].[tShoppingCart] ([fSID], [fCustomerID], [fProductID], [fPurchaseQuantity], [fTravelDate]) VALUES (15, 9, 3, 8, CAST(N'2023-03-22T00:00:00' AS SmallDateTime))
INSERT [dbo].[tShoppingCart] ([fSID], [fCustomerID], [fProductID], [fPurchaseQuantity], [fTravelDate]) VALUES (16, 9, 17, 8, CAST(N'2023-03-22T00:00:00' AS SmallDateTime))
INSERT [dbo].[tShoppingCart] ([fSID], [fCustomerID], [fProductID], [fPurchaseQuantity], [fTravelDate]) VALUES (17, 9, 5, 8, CAST(N'2023-03-22T00:00:00' AS SmallDateTime))
INSERT [dbo].[tShoppingCart] ([fSID], [fCustomerID], [fProductID], [fPurchaseQuantity], [fTravelDate]) VALUES (18, 12, 182, 8, CAST(N'2023-03-23T00:00:00' AS SmallDateTime))
INSERT [dbo].[tShoppingCart] ([fSID], [fCustomerID], [fProductID], [fPurchaseQuantity], [fTravelDate]) VALUES (19, 12, 130, 8, CAST(N'2023-03-23T00:00:00' AS SmallDateTime))
INSERT [dbo].[tShoppingCart] ([fSID], [fCustomerID], [fProductID], [fPurchaseQuantity], [fTravelDate]) VALUES (20, 12, 46, 8, CAST(N'2023-03-23T00:00:00' AS SmallDateTime))
INSERT [dbo].[tShoppingCart] ([fSID], [fCustomerID], [fProductID], [fPurchaseQuantity], [fTravelDate]) VALUES (30, 6, 40, 4, CAST(N'2023-03-16T00:00:00' AS SmallDateTime))
INSERT [dbo].[tShoppingCart] ([fSID], [fCustomerID], [fProductID], [fPurchaseQuantity], [fTravelDate]) VALUES (31, 6, 145, 4, CAST(N'2023-03-16T00:00:00' AS SmallDateTime))
SET IDENTITY_INSERT [dbo].[tShoppingCart] OFF
GO
INSERT [dbo].[tTag] ([fID], [fDescription]) VALUES (1, N'廟')
INSERT [dbo].[tTag] ([fID], [fDescription]) VALUES (2, N'古蹟')
INSERT [dbo].[tTag] ([fID], [fDescription]) VALUES (3, N'手做')
GO
ALTER TABLE [dbo].[tCustomer]  WITH CHECK ADD  CONSTRAINT [FK_tCustomer_tGender1] FOREIGN KEY([fGender])
REFERENCES [dbo].[tGender] ([fID])
GO
ALTER TABLE [dbo].[tCustomer] CHECK CONSTRAINT [FK_tCustomer_tGender1]
GO
ALTER TABLE [dbo].[tCustomerOrderSheet]  WITH CHECK ADD  CONSTRAINT [FK_tCustomerOrderSheet_tCoupon] FOREIGN KEY([fCouponCode])
REFERENCES [dbo].[tCoupon] ([fCode])
GO
ALTER TABLE [dbo].[tCustomerOrderSheet] CHECK CONSTRAINT [FK_tCustomerOrderSheet_tCoupon]
GO
ALTER TABLE [dbo].[tCustomerOrderSheet]  WITH CHECK ADD  CONSTRAINT [FK_tCustomerOrderSheet_tCustomer] FOREIGN KEY([fCustomerID])
REFERENCES [dbo].[tCustomer] ([fID])
GO
ALTER TABLE [dbo].[tCustomerOrderSheet] CHECK CONSTRAINT [FK_tCustomerOrderSheet_tCustomer]
GO
ALTER TABLE [dbo].[tOrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_tOrderDetail_tCustomerOrderSheet] FOREIGN KEY([fCustomerOrderSheetID])
REFERENCES [dbo].[tCustomerOrderSheet] ([fID])
GO
ALTER TABLE [dbo].[tOrderDetail] CHECK CONSTRAINT [FK_tOrderDetail_tCustomerOrderSheet]
GO
ALTER TABLE [dbo].[tOrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_tOrderDetail_tProduct] FOREIGN KEY([fProductID])
REFERENCES [dbo].[tProduct] ([fID])
GO
ALTER TABLE [dbo].[tOrderDetail] CHECK CONSTRAINT [FK_tOrderDetail_tProduct]
GO
ALTER TABLE [dbo].[tProduct]  WITH CHECK ADD  CONSTRAINT [FK_tProduct_tPeriod] FOREIGN KEY([fPeriodID])
REFERENCES [dbo].[tPeriod] ([fID])
GO
ALTER TABLE [dbo].[tProduct] CHECK CONSTRAINT [FK_tProduct_tPeriod]
GO
ALTER TABLE [dbo].[tProduct]  WITH CHECK ADD  CONSTRAINT [FK_tProduct_tProvider] FOREIGN KEY([fProviderID])
REFERENCES [dbo].[tProvider] ([fID])
GO
ALTER TABLE [dbo].[tProduct] CHECK CONSTRAINT [FK_tProduct_tProvider]
GO
ALTER TABLE [dbo].[tProductReport]  WITH CHECK ADD  CONSTRAINT [FK_tProductReport_tOrderDetail] FOREIGN KEY([fOrderDetailID])
REFERENCES [dbo].[tOrderDetail] ([fID])
GO
ALTER TABLE [dbo].[tProductReport] CHECK CONSTRAINT [FK_tProductReport_tOrderDetail]
GO
ALTER TABLE [dbo].[tProductReport]  WITH CHECK ADD  CONSTRAINT [FK_tProductReport_tProduct] FOREIGN KEY([fProductID])
REFERENCES [dbo].[tProduct] ([fID])
GO
ALTER TABLE [dbo].[tProductReport] CHECK CONSTRAINT [FK_tProductReport_tProduct]
GO
ALTER TABLE [dbo].[tProductReview]  WITH CHECK ADD  CONSTRAINT [FK_tProductReview_tOrderDetail] FOREIGN KEY([fOrderDetailID])
REFERENCES [dbo].[tOrderDetail] ([fID])
GO
ALTER TABLE [dbo].[tProductReview] CHECK CONSTRAINT [FK_tProductReview_tOrderDetail]
GO
ALTER TABLE [dbo].[tProductReview]  WITH CHECK ADD  CONSTRAINT [FK_tProductReview_tProduct] FOREIGN KEY([fProductID])
REFERENCES [dbo].[tProduct] ([fID])
GO
ALTER TABLE [dbo].[tProductReview] CHECK CONSTRAINT [FK_tProductReview_tProduct]
GO
ALTER TABLE [dbo].[tProductsTag]  WITH CHECK ADD  CONSTRAINT [FK_tProductsTag_tProduct] FOREIGN KEY([fProductID])
REFERENCES [dbo].[tProduct] ([fID])
GO
ALTER TABLE [dbo].[tProductsTag] CHECK CONSTRAINT [FK_tProductsTag_tProduct]
GO
ALTER TABLE [dbo].[tProductsTag]  WITH CHECK ADD  CONSTRAINT [FK_tProductsTag_tTag] FOREIGN KEY([fTagID])
REFERENCES [dbo].[tTag] ([fID])
GO
ALTER TABLE [dbo].[tProductsTag] CHECK CONSTRAINT [FK_tProductsTag_tTag]
GO
ALTER TABLE [dbo].[tPurchaseOrderSheet]  WITH CHECK ADD  CONSTRAINT [FK_tPurchaseOrderSheet_tOrderDetail] FOREIGN KEY([fOrderDetailID])
REFERENCES [dbo].[tOrderDetail] ([fID])
GO
ALTER TABLE [dbo].[tPurchaseOrderSheet] CHECK CONSTRAINT [FK_tPurchaseOrderSheet_tOrderDetail]
GO
ALTER TABLE [dbo].[tShoppingCart]  WITH CHECK ADD  CONSTRAINT [FK_tShoppingCart_tCustomer] FOREIGN KEY([fCustomerID])
REFERENCES [dbo].[tCustomer] ([fID])
GO
ALTER TABLE [dbo].[tShoppingCart] CHECK CONSTRAINT [FK_tShoppingCart_tCustomer]
GO
ALTER TABLE [dbo].[tShoppingCart]  WITH CHECK ADD  CONSTRAINT [FK_tShoppingCart_tProduct] FOREIGN KEY([fProductID])
REFERENCES [dbo].[tProduct] ([fID])
GO
ALTER TABLE [dbo].[tShoppingCart] CHECK CONSTRAINT [FK_tShoppingCart_tProduct]
GO
USE [master]
GO
ALTER DATABASE [FinalProject] SET  READ_WRITE 
GO
