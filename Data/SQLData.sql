USE [master]
GO
/****** Object:  Database [EShop]    Script Date: 4/7/2021 5:03:05 PM ******/
CREATE DATABASE [EShop]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'EShop', FILENAME = N'F:\WinData\MSSQL15.MSSQLSERVER\MSSQL\DATA\EShop.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'EShop_log', FILENAME = N'F:\WinData\MSSQL15.MSSQLSERVER\MSSQL\DATA\EShop_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [EShop] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [EShop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [EShop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [EShop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [EShop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [EShop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [EShop] SET ARITHABORT OFF 
GO
ALTER DATABASE [EShop] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [EShop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [EShop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [EShop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [EShop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [EShop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [EShop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [EShop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [EShop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [EShop] SET  DISABLE_BROKER 
GO
ALTER DATABASE [EShop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [EShop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [EShop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [EShop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [EShop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [EShop] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [EShop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [EShop] SET RECOVERY FULL 
GO
ALTER DATABASE [EShop] SET  MULTI_USER 
GO
ALTER DATABASE [EShop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [EShop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [EShop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [EShop] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [EShop] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'EShop', N'ON'
GO
ALTER DATABASE [EShop] SET QUERY_STORE = OFF
GO
USE [EShop]
GO
/****** Object:  Table [dbo].[About]    Script Date: 4/7/2021 5:03:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[About](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[MetaTitle] [nvarchar](250) NULL,
	[Description] [nvarchar](max) NULL,
	[Detail] [ntext] NULL,
	[Warranty] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [varchar](100) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [varchar](100) NULL,
	[MetaKeywords] [nvarchar](250) NULL,
	[Status] [bit] NULL,
	[Image] [nvarchar](250) NULL,
 CONSTRAINT [PK_About] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 4/7/2021 5:03:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[MetaTitle] [varchar](250) NULL,
	[ParentId] [bigint] NULL,
	[DisplayOrder] [int] NULL,
	[SeoTitle] [nvarchar](250) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [varchar](100) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [varchar](100) NULL,
	[MetaKeywords] [nvarchar](250) NULL,
	[Status] [bit] NULL,
	[ShowOnHome] [bit] NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contact]    Script Date: 4/7/2021 5:03:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contact](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Content] [ntext] NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Contact] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Content]    Script Date: 4/7/2021 5:03:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Content](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[MetaTitle] [nvarchar](250) NULL,
	[Description] [nvarchar](max) NULL,
	[Image] [nvarchar](250) NULL,
	[CategoryID] [bigint] NULL,
	[Detail] [ntext] NULL,
	[Warranty] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [varchar](100) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [varchar](100) NULL,
	[MetaKeywords] [nvarchar](250) NULL,
	[Status] [bit] NULL,
	[TopHot] [datetime] NULL,
	[ViewCount] [int] NULL,
	[Tags] [nvarchar](500) NULL,
 CONSTRAINT [PK_Content] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ContentTag]    Script Date: 4/7/2021 5:03:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContentTag](
	[ContentID] [bigint] NOT NULL,
	[TagID] [varchar](50) NOT NULL,
 CONSTRAINT [PK_ContentTag] PRIMARY KEY CLUSTERED 
(
	[ContentID] ASC,
	[TagID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feedback]    Script Date: 4/7/2021 5:03:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feedback](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Phone] [nvarchar](15) NULL,
	[Email] [nvarchar](100) NULL,
	[Address] [nvarchar](255) NULL,
	[CreatedDate] [datetime] NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Feedback] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Footer]    Script Date: 4/7/2021 5:03:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Footer](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Content] [ntext] NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Footer] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Menu]    Script Date: 4/7/2021 5:03:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menu](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Text] [nvarchar](100) NULL,
	[Link] [nvarchar](250) NULL,
	[DisplayOrder] [int] NULL,
	[Target] [nvarchar](100) NULL,
	[Status] [bit] NULL,
	[TypeID] [int] NULL,
 CONSTRAINT [PK_Menu] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MenuType]    Script Date: 4/7/2021 5:03:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MenuType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
 CONSTRAINT [PK_MenuType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 4/7/2021 5:03:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[CreatedDate] [datetime] NULL,
	[CustomerId] [bigint] NULL,
	[ShipName] [nvarchar](50) NULL,
	[ShipAddress] [nvarchar](50) NULL,
	[ShipMobile] [nvarchar](50) NULL,
	[ShipEmail] [nvarchar](50) NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 4/7/2021 5:03:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[ProductID] [bigint] NOT NULL,
	[OrderID] [bigint] NOT NULL,
	[Price] [decimal](18, 0) NULL,
	[Quantity] [int] NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC,
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 4/7/2021 5:03:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[MetaTitle] [nvarchar](250) NULL,
	[Description] [nvarchar](max) NULL,
	[Image] [nvarchar](250) NULL,
	[MoreImages] [xml] NULL,
	[Price] [decimal](18, 0) NULL,
	[PromotionPrice] [decimal](18, 0) NULL,
	[Quantity] [int] NULL,
	[CategoryID] [bigint] NULL,
	[Detail] [ntext] NULL,
	[Warranty] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [varchar](100) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [varchar](100) NULL,
	[MetaKeywords] [nvarchar](250) NULL,
	[Status] [bit] NULL,
	[TopHot] [datetime] NULL,
	[ViewCount] [int] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductCategory]    Script Date: 4/7/2021 5:03:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductCategory](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[MetaTitle] [varchar](250) NULL,
	[ParentId] [bigint] NULL,
	[DisplayOrder] [int] NULL,
	[SeoTitle] [nvarchar](250) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [varchar](100) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [varchar](100) NULL,
	[MetaKeywords] [nvarchar](250) NULL,
	[Status] [bit] NULL,
	[ShowOnHome] [bit] NULL,
 CONSTRAINT [PK_ProductCategory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Slide]    Script Date: 4/7/2021 5:03:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Slide](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Image] [nvarchar](250) NULL,
	[DisplayOrder] [int] NULL,
	[Link] [nvarchar](250) NULL,
	[ModifiedBy] [varchar](100) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [varchar](100) NULL,
	[ModifiedDate] [datetime] NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Slide] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SystemConfig]    Script Date: 4/7/2021 5:03:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SystemConfig](
	[ID] [varchar](100) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Type] [nvarchar](100) NULL,
	[Value] [nvarchar](250) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_SystemConfig] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tag]    Script Date: 4/7/2021 5:03:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tag](
	[ID] [varchar](50) NOT NULL,
	[Name] [varchar](50) NULL,
 CONSTRAINT [PK_Tag] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 4/7/2021 5:03:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](100) NULL,
	[Password] [nvarchar](100) NULL,
	[Name] [nvarchar](100) NULL,
	[Email] [nvarchar](250) NULL,
	[Address] [nvarchar](250) NULL,
	[Phone] [varchar](20) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [varchar](100) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [varchar](100) NULL,
	[MetaKeywords] [nvarchar](250) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([ID], [Name], [MetaTitle], [ParentId], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [Status], [ShowOnHome]) VALUES (1, N'Category', N'Category', NULL, 1, N'1', CAST(N'2021-01-01T00:00:00.000' AS DateTime), N'1', CAST(N'2021-01-01T00:00:00.000' AS DateTime), N'1', N'1', 1, 1)
INSERT [dbo].[Category] ([ID], [Name], [MetaTitle], [ParentId], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [Status], [ShowOnHome]) VALUES (3, N'tano 123', N'1', 1, 1, N'1', CAST(N'2021-03-21T10:37:53.073' AS DateTime), N'1', NULL, NULL, N'1', NULL, NULL)
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Content] ON 

INSERT [dbo].[Content] ([ID], [Name], [MetaTitle], [Description], [Image], [CategoryID], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [Status], [TopHot], [ViewCount], [Tags]) VALUES (1, N'2', N'2', N'2', N'2', 2, N'<p>2</p>', 2, NULL, NULL, NULL, NULL, N'2', NULL, NULL, NULL, N'2')
INSERT [dbo].[Content] ([ID], [Name], [MetaTitle], [Description], [Image], [CategoryID], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [Status], [TopHot], [ViewCount], [Tags]) VALUES (7, N'1', N'1', N'4', N'2', 3, N'<p>34</p>', 3, CAST(N'2021-03-11T00:00:00.000' AS DateTime), NULL, CAST(N'2021-03-21T16:40:41.210' AS DateTime), N'1', N'6', 1, CAST(N'2021-03-23T00:00:00.000' AS DateTime), NULL, N'5')
SET IDENTITY_INSERT [dbo].[Content] OFF
GO
SET IDENTITY_INSERT [dbo].[Menu] ON 

INSERT [dbo].[Menu] ([ID], [Text], [Link], [DisplayOrder], [Target], [Status], [TypeID]) VALUES (1, N'Trang chủ', N'/', 1, N'_blank', 1, 1)
INSERT [dbo].[Menu] ([ID], [Text], [Link], [DisplayOrder], [Target], [Status], [TypeID]) VALUES (2, N'Giới thiệu', N'/gioi-thieu', 2, N'_self', 1, 1)
INSERT [dbo].[Menu] ([ID], [Text], [Link], [DisplayOrder], [Target], [Status], [TypeID]) VALUES (3, N'Tin tức', N'/tin-tuc', 3, N'_self', 1, 1)
INSERT [dbo].[Menu] ([ID], [Text], [Link], [DisplayOrder], [Target], [Status], [TypeID]) VALUES (4, N'Sản phẩm', N'/san-pham', 4, N'_self', 1, 1)
INSERT [dbo].[Menu] ([ID], [Text], [Link], [DisplayOrder], [Target], [Status], [TypeID]) VALUES (5, N'Liên hệ', N'/lien-he', 5, N'_self', 1, 1)
INSERT [dbo].[Menu] ([ID], [Text], [Link], [DisplayOrder], [Target], [Status], [TypeID]) VALUES (6, N'Giới thiệu', N'/gioi-thieu', 3, N'_self', 1, 2)
INSERT [dbo].[Menu] ([ID], [Text], [Link], [DisplayOrder], [Target], [Status], [TypeID]) VALUES (7, N'Tin tức', N'/tin-tuc', 4, N'_self', 1, 2)
INSERT [dbo].[Menu] ([ID], [Text], [Link], [DisplayOrder], [Target], [Status], [TypeID]) VALUES (8, N'Sản phẩm', N'/san-pham', 5, N'_self', 1, 2)
SET IDENTITY_INSERT [dbo].[Menu] OFF
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([ID], [CreatedDate], [CustomerId], [ShipName], [ShipAddress], [ShipMobile], [ShipEmail], [Status]) VALUES (1, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Order] ([ID], [CreatedDate], [CustomerId], [ShipName], [ShipAddress], [ShipMobile], [ShipEmail], [Status]) VALUES (2, NULL, NULL, N'7', N'7', N'7', N'7', NULL)
INSERT [dbo].[Order] ([ID], [CreatedDate], [CustomerId], [ShipName], [ShipAddress], [ShipMobile], [ShipEmail], [Status]) VALUES (3, NULL, NULL, N'1', N'1', N'1', N'1', NULL)
INSERT [dbo].[Order] ([ID], [CreatedDate], [CustomerId], [ShipName], [ShipAddress], [ShipMobile], [ShipEmail], [Status]) VALUES (4, NULL, NULL, N'9', N'9', N'9', N'9', NULL)
INSERT [dbo].[Order] ([ID], [CreatedDate], [CustomerId], [ShipName], [ShipAddress], [ShipMobile], [ShipEmail], [Status]) VALUES (5, NULL, NULL, N'2', N'2', N'2', N'2', NULL)
INSERT [dbo].[Order] ([ID], [CreatedDate], [CustomerId], [ShipName], [ShipAddress], [ShipMobile], [ShipEmail], [Status]) VALUES (6, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Order] ([ID], [CreatedDate], [CustomerId], [ShipName], [ShipAddress], [ShipMobile], [ShipEmail], [Status]) VALUES (7, NULL, NULL, N'12', N'12', N'12', N'12', NULL)
INSERT [dbo].[Order] ([ID], [CreatedDate], [CustomerId], [ShipName], [ShipAddress], [ShipMobile], [ShipEmail], [Status]) VALUES (8, NULL, NULL, N'77', N'77', N'77', N'77', NULL)
INSERT [dbo].[Order] ([ID], [CreatedDate], [CustomerId], [ShipName], [ShipAddress], [ShipMobile], [ShipEmail], [Status]) VALUES (9, NULL, NULL, N'99', N'99', N'99', N'99', NULL)
INSERT [dbo].[Order] ([ID], [CreatedDate], [CustomerId], [ShipName], [ShipAddress], [ShipMobile], [ShipEmail], [Status]) VALUES (10, NULL, NULL, N'44', N'44', N'44', N'44', NULL)
INSERT [dbo].[Order] ([ID], [CreatedDate], [CustomerId], [ShipName], [ShipAddress], [ShipMobile], [ShipEmail], [Status]) VALUES (11, NULL, NULL, N'test', N'test', N'1234567890', N'tntan796@gmail.com', NULL)
INSERT [dbo].[Order] ([ID], [CreatedDate], [CustomerId], [ShipName], [ShipAddress], [ShipMobile], [ShipEmail], [Status]) VALUES (12, NULL, NULL, N'test', N'test', N'1234567890', N'tantanotnt96@gmail.com', NULL)
INSERT [dbo].[Order] ([ID], [CreatedDate], [CustomerId], [ShipName], [ShipAddress], [ShipMobile], [ShipEmail], [Status]) VALUES (13, NULL, NULL, N'test', N'test', N'1234567890', N'tantanotnt96@gmail.com', NULL)
INSERT [dbo].[Order] ([ID], [CreatedDate], [CustomerId], [ShipName], [ShipAddress], [ShipMobile], [ShipEmail], [Status]) VALUES (14, NULL, NULL, N'test', N'99', N'1234567890', N'tantanotnt96@gmail.com', NULL)
INSERT [dbo].[Order] ([ID], [CreatedDate], [CustomerId], [ShipName], [ShipAddress], [ShipMobile], [ShipEmail], [Status]) VALUES (15, NULL, NULL, N'Tano', N'test', N'1234567890', N'tantanotnt96@gmail.com', NULL)
INSERT [dbo].[Order] ([ID], [CreatedDate], [CustomerId], [ShipName], [ShipAddress], [ShipMobile], [ShipEmail], [Status]) VALUES (16, NULL, NULL, N'test', N'test', N'1234567890', N'tantanotnt96@gmail.com', NULL)
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Price], [Quantity]) VALUES (4, 4, CAST(16690000 AS Decimal(18, 0)), 1)
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Price], [Quantity]) VALUES (4, 5, CAST(16690000 AS Decimal(18, 0)), 1)
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Price], [Quantity]) VALUES (4, 8, CAST(16690000 AS Decimal(18, 0)), 1)
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Price], [Quantity]) VALUES (4, 9, CAST(16690000 AS Decimal(18, 0)), 1)
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Price], [Quantity]) VALUES (4, 13, CAST(16690000 AS Decimal(18, 0)), 1)
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Price], [Quantity]) VALUES (4, 14, CAST(16690000 AS Decimal(18, 0)), 1)
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Price], [Quantity]) VALUES (4, 15, CAST(16690000 AS Decimal(18, 0)), 1)
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Price], [Quantity]) VALUES (5, 3, CAST(12490000 AS Decimal(18, 0)), 1)
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Price], [Quantity]) VALUES (5, 4, CAST(12490000 AS Decimal(18, 0)), 1)
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Price], [Quantity]) VALUES (5, 5, CAST(12490000 AS Decimal(18, 0)), 2)
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Price], [Quantity]) VALUES (5, 7, CAST(12490000 AS Decimal(18, 0)), 1)
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Price], [Quantity]) VALUES (5, 10, CAST(12490000 AS Decimal(18, 0)), 1)
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Price], [Quantity]) VALUES (5, 12, CAST(12490000 AS Decimal(18, 0)), 1)
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Price], [Quantity]) VALUES (6, 2, CAST(25000000 AS Decimal(18, 0)), 1)
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Price], [Quantity]) VALUES (6, 11, CAST(25000000 AS Decimal(18, 0)), 1)
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Price], [Quantity]) VALUES (6, 16, CAST(25000000 AS Decimal(18, 0)), 1)
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ID], [Name], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [Quantity], [CategoryID], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [Status], [TopHot], [ViewCount]) VALUES (1, N'Galaxy Z Ford', N'galaxy-z-ford', N'<table>
	<tbody>
		<tr>
			<td>M&agrave;n h&igrave;nh</td>
			<td>M&agrave;n h&igrave;nh trước: 6.2&quot;, M&agrave;n h&igrave;nh ch&iacute;nh: 7.6&quot;, HD+, Ch&iacute;nh: Dynamic AMOLED 2X, phụ: Super AMOLED, 1768 x 2208 Pixel</td>
		</tr>
		<tr>
			<td>Camera sau</td>
			<td>12.0 MP + 12.0 MP + 12.0 MP</td>
		</tr>
		<tr>
			<td>Camera Selfie</td>
			<td>10.0 MP</td>
		</tr>
		<tr>
			<td>RAM&nbsp;</td>
			<td>12 GB</td>
		</tr>
		<tr>
			<td>Bộ nhớ trong</td>
			<td>256 GB</td>
		</tr>
		<tr>
			<td>CPU</td>
			<td>Snapdragon 865+</td>
		</tr>
		<tr>
			<td>GPU</td>
			<td>Adreno 650</td>
		</tr>
		<tr>
			<td>Dung lượng pin</td>
			<td>4500 mAh</td>
		</tr>
		<tr>
			<td>Thẻ sim</td>
			<td>1, 1 eSIM, 1 Nano SIM</td>
		</tr>
		<tr>
			<td>Hệ điều h&agrave;nh</td>
			<td>Android 10.0</td>
		</tr>
		<tr>
			<td>Xuất xứ</td>
			<td>Việt Nam</td>
		</tr>
		<tr>
			<td>Thời gian ra mắt</td>
			<td>08/2020</td>
		</tr>
	</tbody>
</table>
', N'galaxy-ford.jpg', NULL, CAST(50000000 AS Decimal(18, 0)), CAST(48000000 AS Decimal(18, 0)), 10, 7, N'<p><strong>Kh&ocirc;ng giống bất kỳ chiếc điện thoại n&agrave;o kh&aacute;c,&nbsp;<a href="https://fptshop.com.vn/dien-thoai/samsung-galaxy-z-fold-2">Samsung Galaxy Z Fold 2 5G</a>&nbsp;sở hữu m&agrave;n h&igrave;nh gập kỳ diệu m&agrave; mỗi khi mở m&agrave;n h&igrave;nh, bạn đ&atilde; mở ra tương lai của ng&agrave;nh c&ocirc;ng nghiệp smartphone.</strong></p>

<p><strong><img alt="Samsung Galaxy Z Fold 2 5G" src="https://images.fpt.shop/unsafe/fit-in/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/QuanLNH2/samsung-galaxy-zfold2.jpg" /></strong></p>

<h3><strong>Hai m&agrave;n h&igrave;nh, trải nghiệm trong c&ugrave;ng một thiết bị</strong></h3>

<p>Kh&ocirc;ng chỉ l&agrave; một chiếc điện thoại m&agrave;n h&igrave;nh gập, Galaxy Z Fold 2 5G c&ograve;n l&agrave; chiếc&nbsp;<a href="https://fptshop.com.vn/dien-thoai">điện thoại</a>&nbsp;c&oacute; tới 2 m&agrave;n h&igrave;nh. Trong trạng th&aacute;i gập, m&agrave;n h&igrave;nh ngo&agrave;i của m&aacute;y với k&iacute;ch thước 6,2 inch, viền mỏng cho trải nghiệm smartphone th&ocirc;ng thường, nơi bạn c&oacute; thể thao t&aacute;c dễ d&agrave;ng bằng một tay. C&ograve;n muốn trải nghiệm một m&agrave;n h&igrave;nh lớn hơn, tương đương m&aacute;y t&iacute;nh bảng, bạn c&oacute; thể mở ra m&agrave;n h&igrave;nh gập, điều kỳ diệu sẽ xuất hiện.</p>

<p><img alt="Hai màn hình, trải nghiệm trong cùng một thiết bị | Galaxy Z Fold 2 5G" src="https://images.fpt.shop/unsafe/fit-in/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/QuanLNH2/samsung-galaxy-zfold2-6.jpg" /></p>

<h3><strong>M&agrave;n h&igrave;nh gập 7,6 inch&nbsp;lớn nhất thế giới smartphone</strong></h3>

<p>M&agrave;n h&igrave;nh gập Galaxy Z Fold 2 5G khi mở ra c&oacute; k&iacute;ch thước lớn tới 7,6 inch v&agrave; được l&agrave;m viền mỏng cả 4 cạnh tuyệt đẹp. Bạn sẽ được tận hưởng m&agrave;n h&igrave;nh lớn chưa từng thấy tr&ecirc;n thế giới smartphone, d&ugrave; l&agrave; đọc b&aacute;o, v&agrave;o mạng x&atilde; hội, xem phim hay chơi game, tất cả đều cho những trải nghiệm th&uacute; vị.</p>
', 1, CAST(N'2021-03-31T20:57:14.667' AS DateTime), NULL, NULL, NULL, N'galaxy-ford', 1, CAST(N'1900-01-01T00:00:00.000' AS DateTime), 10)
INSERT [dbo].[Product] ([ID], [Name], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [Quantity], [CategoryID], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [Status], [TopHot], [ViewCount]) VALUES (2, N'Iphone 12', N'iphone-12', N'<table>
	<tbody>
		<tr>
			<td>M&agrave;n h&igrave;nh</td>
			<td>6.1&quot;, Super Retina XDR, AMOLED</td>
		</tr>
		<tr>
			<td>Camera sau</td>
			<td>12.0 MP + 12.0 MP</td>
		</tr>
		<tr>
			<td>Camera Selfie</td>
			<td>12.0 MP</td>
		</tr>
		<tr>
			<td>RAM&nbsp;</td>
			<td>4 GB</td>
		</tr>
		<tr>
			<td>Bộ nhớ trong</td>
			<td>64 GB</td>
		</tr>
		<tr>
			<td>CPU</td>
			<td>A14 Bionic</td>
		</tr>
		<tr>
			<td>GPU</td>
			<td>Apple GPU 4 nh&acirc;n</td>
		</tr>
		<tr>
			<td>Dung lượng pin</td>
			<td>2815 mAh</td>
		</tr>
		<tr>
			<td>Thẻ sim</td>
			<td>2, 1 eSIM, 1 Nano SIM</td>
		</tr>
		<tr>
			<td>Hệ điều h&agrave;nh</td>
			<td>iOS 14</td>
		</tr>
		<tr>
			<td>Xuất xứ</td>
			<td>Trung Quốc</td>
		</tr>
		<tr>
			<td>Thời gian ra mắt</td>
			<td>10/2020</td>
		</tr>
	</tbody>
</table>
', N'iphone12.jpg', NULL, CAST(21000000 AS Decimal(18, 0)), CAST(20000000 AS Decimal(18, 0)), 8, 8, N'<p><strong>iPhone 12 ra mắt với vai tr&ograve; mở ra một kỷ nguy&ecirc;n ho&agrave;n to&agrave;n mới. Tốc độ mạng 5G si&ecirc;u tốc, bộ vi xử l&yacute; A14 Bionic nhanh nhất thế giới smartphone, m&agrave;n h&igrave;nh OLED tr&agrave;n cạnh tuyệt đẹp v&agrave; camera si&ecirc;u chụp đ&ecirc;m, tất cả đều c&oacute; mặt tr&ecirc;n&nbsp;<a href="https://fptshop.com.vn/dien-thoai/iphone-12" title="Điện thoại iPhone 12 chính hãng tại FPTShop" type="Điện thoại iPhone 12 chính hãng tại FPTShop">iPhone 12</a>.</strong></p>

<p><strong><img alt="iPhone 12 chính hãng FPTShop" src="https://fptshop.com.vn/Uploads/images/2015/Tin-Tuc/QuanLNH2/iphone-12-1(1).JPG" title="iPhone 12 chính hãng FPTShop" /></strong></p>

<h2><strong>Thiết kế mỏng nhẹ, nhỏ gọn v&agrave; đẳng cấp</strong></h2>

<p>iPhone 12 đ&atilde; c&oacute; sự đột ph&aacute; về thiết kế với kiểu d&aacute;ng mới vu&ocirc;ng vắn, mạnh mẽ v&agrave; sang trọng hơn. Kh&ocirc;ng chỉ vậy, iPhone 12 mỏng hơn 11%, nhỏ gọn hơn 15% v&agrave; nhẹ hơn 16% so với thế hệ trước&nbsp;<a href="https://fptshop.com.vn/dien-thoai/iphone-11-64gb" title="iPhone 11 64GB" type="iPhone 11 64GB">iPhone 11</a>.</p>

<p>Bất ngờ hơn nữa l&agrave; d&ugrave; gọn hơn đ&aacute;ng kể nhưng iPhone 12 vẫn c&oacute;&nbsp;<a href="https://fptshop.com.vn/dien-thoai?man-hinh=tren-60-inch" title="Tham khảo điện thoại màn hình trên 6.0 inch tại FPTShop" type="Tham khảo điện thoại màn hình trên 6.0 inch tại FPTShop">m&agrave;n h&igrave;nh 6,1 inch</a>&nbsp;như iPhone 11 m&agrave; kh&ocirc;ng hề bị cắt giảm. Phần viền m&agrave;n h&igrave;nh thu hẹp tối đa c&ugrave;ng sự nỗ lực trong thiết kế đ&atilde; tạo n&ecirc;n điều kỳ diệu ở iPhone 12.</p>

<p><img alt="Thiết kế iPhone 12" src="https://fptshop.com.vn/Uploads/images/2015/Tin-Tuc/QuanLNH2/iphone-12-2(1).JPG" title="Thiết kế iPhone 12 mỏng nhẹ, nhỏ gọn và đẳng cấp" /></p>

<p><em>iPhone 12 c&oacute; thiết kế nhỏ gọn, mỏng nhẹ v&agrave; đẳng cấp</em></p>

<h2><strong>Ceramic Shield, bảo vệ an to&agrave;n cho mặt k&iacute;nh</strong></h2>

<p>iPhone 12 thể hiện sự cao cấp từ những vật liệu chế t&aacute;c, bao gồm khung nh&ocirc;m cứng c&aacute;p v&agrave; 2 mặt k&iacute;nh tuyệt đẹp. Hơn thế nữa, mặt k&iacute;nh của iPhone 12 được bảo vệ bởi một lớp gốm (Ceramic Shield), gi&uacute;p cứng hơn mặt k&iacute;nh của bất kỳ chiếc&nbsp;<a href="https://fptshop.com.vn/dien-thoai" title="Xem thêm điện thoại chính hãng giá tốt tại FPTShop" type="Xem thêm điện thoại chính hãng giá tốt tại FPTShop">điện thoại</a>&nbsp;n&agrave;o kh&aacute;c. iPhone của bạn sẽ bền vững hơn tới 4 lần, kh&oacute; xước hơn, mang tới cảm gi&aacute;c y&ecirc;n t&acirc;m khi sử dụng.</p>
', 1, CAST(N'2021-03-31T20:57:21.710' AS DateTime), NULL, NULL, NULL, N'iphone-12', 1, CAST(N'1900-01-01T00:00:00.000' AS DateTime), 7)
INSERT [dbo].[Product] ([ID], [Name], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [Quantity], [CategoryID], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [Status], [TopHot], [ViewCount]) VALUES (3, N'Xiaomi 11', N'xiaomi-11', N'<table>
	<tbody>
		<tr>
			<td>M&agrave;n h&igrave;nh</td>
			<td>6.81&quot;, 2K+, AMOLED, 1440 x 3200 Pixel</td>
		</tr>
		<tr>
			<td>Camera sau</td>
			<td>108.0 MP + 13.0 MP + 5.0 MP</td>
		</tr>
		<tr>
			<td>Camera Selfie</td>
			<td>20.0 MP</td>
		</tr>
		<tr>
			<td>RAM&nbsp;</td>
			<td>8 GB</td>
		</tr>
		<tr>
			<td>Bộ nhớ trong</td>
			<td>256 GB</td>
		</tr>
		<tr>
			<td>CPU</td>
			<td>Snapdragon 888</td>
		</tr>
		<tr>
			<td>GPU</td>
			<td>Adreno 660</td>
		</tr>
		<tr>
			<td>Dung lượng pin</td>
			<td>4600 mAh</td>
		</tr>
		<tr>
			<td>Thẻ sim</td>
			<td>2, Nano SIM</td>
		</tr>
		<tr>
			<td>Hệ điều h&agrave;nh</td>
			<td>Android 11</td>
		</tr>
		<tr>
			<td>Xuất xứ</td>
			<td>Trung Quốc</td>
		</tr>
		<tr>
			<td>Thời gian ra mắt</td>
			<td>03/2021</td>
		</tr>
	</tbody>
</table>
', N'xiaomi11.jpg', NULL, CAST(21000000 AS Decimal(18, 0)), CAST(20000000 AS Decimal(18, 0)), 7, 9, N'<p><strong>Cao cấp, mạnh mẽ v&agrave; trải nghiệm giải tr&iacute; tuyệt đỉnh, đ&oacute; ch&iacute;nh l&agrave; những g&igrave;&nbsp;<a href="https://fptshop.com.vn/dien-thoai/xiaomi-mi-11" title="Điện thoại Mi 11" type="Điện thoại Mi 11">Xiaomi Mi 11</a>&nbsp;mang đến cho người d&ugrave;ng, nơi bạn được tận hưởng camera 108MP, m&agrave;n h&igrave;nh QHD+ 120Hz c&ugrave;ng &acirc;m thanh Harman Kardon si&ecirc;u sống động.</strong></p>

<p><strong><img alt="Đánh giá chi tiết Xiaomi Mi 11" src="https://fptshop.com.vn/Uploads/images/2015/Tin-Tuc/QuanLNH2/xiaomi-mi-11-1.jpg" title="Đánh giá chi tiết Xiaomi Mi 11" /></strong></p>

<h3><strong>Thử khả năng l&agrave;m đạo diễn chuy&ecirc;n nghiệp</strong></h3>

<p>Xiaomi Mi 11 được thiết kế d&agrave;nh cho những người y&ecirc;u th&iacute;ch điện ảnh. Phần cứng camera tuyệt vời với bộ 3 camera 108MP v&agrave; những t&iacute;nh năng phần mềm th&ocirc;ng minh cho bạn khả năng quay phim, dựng phim chuy&ecirc;n nghiệp. Bạn c&oacute; thể dễ d&agrave;ng sử dụng những hiệu ứng chuẩn studio như Time Freeze, Magic Zoom, Night Time-lapse, &hellip; Tất nhi&ecirc;n chất lượng của đoạn video cũng kh&ocirc;ng k&eacute;m phần ấn tượng với t&iacute;nh năng quay video đ&ecirc;m, khử nhiễu th&ocirc;ng minh bằng AI, quay video HDR10+. Sẵn s&agrave;ng s&aacute;ng tạo với kỷ nguy&ecirc;n điện ảnh mới tr&ecirc;n Xiaomi Mi 11.</p>

<p><iframe frameborder="0" height="360" src="https://www.youtube.com/embed/dkJS0RfkGcQ" width="640"></iframe></p>

<h3><strong>Camera 108MP, r&otilde; n&eacute;t đến từng chi tiết</strong></h3>

<p>Camera ch&iacute;nh của Xiaomi Mi 11 c&oacute; độ ph&acirc;n giải l&ecirc;n tới 108MP, khẩu độ f/1.9, chống rung quang học OIS. Với 108 triệu điểm ảnh, bạn sẽ được chi&ecirc;m ngưỡng mọi h&igrave;nh ảnh với độ n&eacute;t đ&aacute;ng kinh ngạc. Thoải m&aacute;i ph&oacute;ng to để nh&igrave;n r&otilde; mọi chi tiết, bức ảnh vẫn rất n&eacute;t v&agrave; kh&ocirc;ng c&oacute; hiện tượng vỡ h&igrave;nh. B&ecirc;n cạnh đ&oacute; bạn c&ograve;n c&oacute; camera g&oacute;c si&ecirc;u rộng 13MP v&agrave; camera macro 5MP, cho trải nghiệm chụp ảnh th&ecirc;m phần th&uacute; vị.</p>

<p><img alt="Xiaomi Mi 11 | Camera 108MP, rõ nét đến từng chi tiết" src="https://fptshop.com.vn/Uploads/images/2015/Tin-Tuc/QuanLNH2/xiaomi-mi-11-2.jpg" title="Xiaomi Mi 11 | Camera 108MP, rõ nét đến từng chi tiết" /></p>

<h3><strong>Chụp đ&ecirc;m xuất sắc gấp 3 lần</strong></h3>

<p>Chế độ chụp đ&ecirc;m tr&ecirc;n Xiaomi Mi 11 được n&acirc;ng l&ecirc;n một tầm cao mới khi sử dụng được cho cả camera ch&iacute;nh 108MP, camera g&oacute;c si&ecirc;u rộng 13MP v&agrave; camera trước 20MP, đồng thời chất lượng h&igrave;nh ảnh trở n&ecirc;n vượt trội. &Aacute;nh s&aacute;ng trong bức ảnh được tăng cường, giảm hiện tượng phơi s&aacute;ng qu&aacute; mức, tăng độ n&eacute;t v&agrave; giảm nhiễu, tất cả sẽ gi&uacute;p bạn chụp được những kiệt t&aacute;c đ&iacute;ch thực trong m&agrave;n đ&ecirc;m.</p>
', 1, CAST(N'2021-03-31T20:57:25.343' AS DateTime), NULL, NULL, NULL, N'xiaomi-11', 1, CAST(N'1900-01-01T00:00:00.000' AS DateTime), 4)
INSERT [dbo].[Product] ([ID], [Name], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [Quantity], [CategoryID], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [Status], [TopHot], [ViewCount]) VALUES (4, N'Iphone 11', N'iphone-11', N'<table>
	<tbody>
		<tr>
			<td>M&agrave;n h&igrave;nh</td>
			<td>6.1&quot;, Liquid Retina HD, IPS LCD, 828 x 1792 Pixel</td>
		</tr>
		<tr>
			<td>Camera sau</td>
			<td>12.0 MP + 12.0 MP</td>
		</tr>
		<tr>
			<td>Camera Selfie</td>
			<td>12.0 MP</td>
		</tr>
		<tr>
			<td>RAM&nbsp;</td>
			<td>4 GB</td>
		</tr>
		<tr>
			<td>Bộ nhớ trong</td>
			<td>64 GB</td>
		</tr>
		<tr>
			<td>CPU</td>
			<td>A13 Bionic</td>
		</tr>
		<tr>
			<td>GPU</td>
			<td>Apple GPU 4 nh&acirc;n</td>
		</tr>
		<tr>
			<td>Dung lượng pin</td>
			<td>3110 mAh</td>
		</tr>
		<tr>
			<td>Thẻ sim</td>
			<td>2, 1 eSIM, 1 Nano SIM</td>
		</tr>
		<tr>
			<td>Hệ điều h&agrave;nh</td>
			<td>iOS 14</td>
		</tr>
		<tr>
			<td>Xuất xứ</td>
			<td>Trung Quốc</td>
		</tr>
		<tr>
			<td>Thời gian ra mắt</td>
			<td>09/2019</td>
		</tr>
	</tbody>
</table>
', N'iphone11.jpg', NULL, CAST(16690000 AS Decimal(18, 0)), CAST(15000000 AS Decimal(18, 0)), 14, 8, N'<p><strong><a href="https://fptshop.com.vn/dien-thoai/iphone-11-64gb" target="_blank">iPhone 11</a>&nbsp;với 6 phi&ecirc;n bản m&agrave;u sắc, camera c&oacute; khả năng chụp ảnh vượt trội, thời lượng pin cực d&agrave;i v&agrave; bộ vi xử l&yacute; mạnh nhất từ trước đến nay sẽ mang đến trải nghiệm tuyệt vời d&agrave;nh cho bạn.</strong></p>

<p><strong><img alt="Điện thoại iPhone 11 chính hãng" src="https://fptshop.com.vn/Uploads/images/2015/Tin-Tuc/QuanLNH2/iphone-11-1.jpg" title="Điện thoại iPhone 11 chính hãng" /></strong></p>

<h3><strong>Rực rỡ sắc m&agrave;u, thể hiện c&aacute; t&iacute;nh</strong></h3>

<p>C&oacute; tới 6 sự lựa chọn m&agrave;u sắc cho iPhone 11 64GB, bao gồm T&iacute;m, V&agrave;ng, Xanh lục, Đen, Trắng v&agrave; Đỏ, tha hồ để bạn lựa chọn m&agrave;u ph&ugrave; hợp với sở th&iacute;ch, c&aacute; t&iacute;nh ri&ecirc;ng của bản th&acirc;n. Vẻ đẹp của iPhone 11 đến từ thiết kế cao cấp khi được l&agrave;m từ khung nh&ocirc;m nguy&ecirc;n khối v&agrave; mặt lưng liền lạc với một tấm k&iacute;nh duy nhất. Ở mặt trước, bạn sẽ được chi&ecirc;m ngưỡng m&agrave;n h&igrave;nh Liquid Retina lớn 6,1 inch, m&agrave;u sắc v&ocirc; c&ugrave;ng ch&acirc;n thực. Tất cả tạo n&ecirc;n chiếc&nbsp;<a href="https://fptshop.com.vn/dien-thoai">điện thoại</a>&nbsp;tr&agrave;n đầy hứng khởi.</p>

<p><img alt="Rực rỡ sắc màu, thể hiện cá tính | iPhone 11" src="https://fptshop.com.vn/Uploads/images/2015/Tin-Tuc/QuanLNH2/iphone-11-2.jpg" /></p>

<h3><strong>Hệ thống camera k&eacute;p mới</strong></h3>

<p>Apple iPhone 11 sở hữu cụm camera k&eacute;p mặt sau, bao gồm camera g&oacute;c rộng v&agrave; camera g&oacute;c si&ecirc;u rộng. Cảm biến camera g&oacute;c rộng 12MP c&oacute; khả năng lấy n&eacute;t tự động nhanh gấp 3 lần trong điều kiện thiếu s&aacute;ng. B&ecirc;n cạnh đ&oacute; cảm biến g&oacute;c si&ecirc;u rộng cho khả năng chụp cảnh rộng gấp 4 lần, l&agrave; phương tiện ghi h&igrave;nh tuyệt vời cho những chuyến du lịch, chụp h&igrave;nh nh&oacute;m. Nhanh ch&oacute;ng chụp ảnh, quay video, chỉnh sửa v&agrave; chia sẻ ngay tr&ecirc;n&nbsp;<a href="https://fptshop.com.vn/dien-thoai/apple-iphone">iPhone</a>, bạn sẽ kh&ocirc;ng bỏ lỡ bất cứ khoảnh khắc đ&aacute;ng nhớ n&agrave;o.</p>
', 1, CAST(N'2021-04-02T22:09:51.723' AS DateTime), NULL, NULL, NULL, N'iphone-11', 1, CAST(N'1900-01-01T00:00:00.000' AS DateTime), 15)
INSERT [dbo].[Product] ([ID], [Name], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [Quantity], [CategoryID], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [Status], [TopHot], [ViewCount]) VALUES (5, N'Iphone Xr', N'iphone-xr', N'<p>&nbsp;</p>

<table>
	<tbody>
		<tr>
			<td>M&agrave;n h&igrave;nh</td>
			<td>6.1&quot;, Liquid Retina HD, IPS LCD, 828 x 1792 Pixel</td>
		</tr>
		<tr>
			<td>Camera sau</td>
			<td>12.0 MP</td>
		</tr>
		<tr>
			<td>Camera Selfie</td>
			<td>7.0 MP</td>
		</tr>
		<tr>
			<td>RAM&nbsp;</td>
			<td>3 GB</td>
		</tr>
		<tr>
			<td>Bộ nhớ trong</td>
			<td>64 GB</td>
		</tr>
		<tr>
			<td>CPU</td>
			<td>A12 Bionic</td>
		</tr>
		<tr>
			<td>GPU</td>
			<td>Apple GPU 4 nh&acirc;n</td>
		</tr>
		<tr>
			<td>Dung lượng pin</td>
			<td>2942 mAh</td>
		</tr>
		<tr>
			<td>Thẻ sim</td>
			<td>2, 1 eSIM, 1 Nano SIM</td>
		</tr>
		<tr>
			<td>Hệ điều h&agrave;nh</td>
			<td>iOS 14</td>
		</tr>
		<tr>
			<td>Xuất xứ</td>
			<td>Trung Quốc</td>
		</tr>
		<tr>
			<td>Thời gian ra mắt</td>
			<td>09/2018</td>
		</tr>
	</tbody>
</table>
', N'iphonexr.jpg', NULL, CAST(12490000 AS Decimal(18, 0)), CAST(12000000 AS Decimal(18, 0)), 14, 8, N'<h2>Đ&aacute;nh gi&aacute; chi tiết&nbsp;iPhone XR 64GB</h2>

<p>Chiếc&nbsp;<a href="https://fptshop.com.vn/dien-thoai/apple-iphone">iPhone</a>&nbsp;với&nbsp;<a href="https://fptshop.com.vn/tin-tuc/danh-gia/ti-m-hie-u-ve-cong-nghe-liquid-retina-tren-iphone-xr-73345">m&agrave;n h&igrave;nh Liquid Retina</a>&nbsp;ho&agrave;n to&agrave;n mới, c&ocirc;ng nghệ m&agrave;n h&igrave;nh LCD ti&ecirc;n tiến nhất đi c&ugrave;ng Face ID nhanh hơn, con chip mạnh mẽ v&agrave; hệ thống camera x&oacute;a ph&ocirc;ng ho&agrave;n hảo. Đ&oacute; ch&iacute;nh l&agrave;&nbsp;<a href="https://fptshop.com.vn/dien-thoai/iphone-xr-64gb" target="_blank">iPhone XR&nbsp;</a>với nhiều m&agrave;u sắc tuyệt vời đang chờ đ&oacute;n bạn.</p>

<p><img alt="Điện thoại iPhone XR" src="https://fptshop.com.vn/Uploads/images/2015/Tin-Tuc/QuanLNH2/iphone-xr-16.jpg" /></p>

<h3><strong>M&agrave;n h&igrave;nh Liquid Retina cực lớn</strong></h3>

<p>iPhone XR sử dụng m&agrave;n h&igrave;nh LCD ti&ecirc;n tiến nhất hiện nay, hiển thị tuyệt đẹp với k&iacute;ch thước lớn 6,1 inch Liquid Retina sắc n&eacute;t, tr&agrave;n viền cạnh. Thiết kế tr&agrave;n viền gi&uacute;p cho d&ugrave; m&agrave;n h&igrave;nh lớn tới 6,1 inch nhưng iPhone XR vẫn nhỏ gọn hơn so với&nbsp;<a href="https://fptshop.com.vn/dien-thoai/iphone-8-plus-64gb">iPhone 8 Plus</a>, dễ d&agrave;ng cầm nắm thao t&aacute;c bằng một tay. C&ocirc;ng nghệ LCD cho m&agrave;u sắc ch&iacute;nh x&aacute;c, độ s&aacute;ng cao, t&aacute;i tạo cuộc sống v&ocirc; c&ugrave;ng ch&acirc;n thực. C&oacute; tới 6 tấm cảm biến đ&egrave;n nền dưới m&agrave;n h&igrave;nh, tự động điều chỉnh c&acirc;n bằng trắng th&ocirc;ng minh để thay đổi nhiệt độ m&agrave;u dựa theo m&ocirc;i trường, để bạn lu&ocirc;n được tận hưởng m&agrave;n h&igrave;nh đẹp v&agrave; dễ chịu cho mắt.</p>

<p><img alt="Màn hình Liquid Retina cực lớn | iPhone XR" src="https://fptshop.com.vn/Uploads/images/2015/Tin-Tuc/QuanLNH2/iphone-xr-4.jpg" /></p>

<h3><strong>Chiếc iPhone đầy m&agrave;u sắc tuyệt đẹp</strong></h3>

<p>iPhone XR c&oacute; kiểu d&aacute;ng đẹp mắt khi được ho&agrave;n thiện từ nh&ocirc;m v&agrave; vỏ k&iacute;nh bền nhất trong thế giới&nbsp;<a href="https://fptshop.com.vn/dien-thoai">smartphone</a>. Sử dụng tới 7 tầm nền m&agrave;u sắc gi&uacute;p m&agrave;u sơn c&oacute; độ s&acirc;u đầy ấn tượng phản chiếu qua lớp k&iacute;nh sang trọng. Việc sử dụng vỏ k&iacute;nh cũng gi&uacute;p cho iPhone XR c&oacute; khả năng&nbsp;<a href="https://fptshop.com.vn/phu-kien/sac-cap?tinh-nang=sac-khong-day">sạc kh&ocirc;ng d&acirc;y</a>. Rất nhiều m&agrave;u sắc đang chờ bạn lựa chọn: Đỏ, v&agrave;ng, trắng, hồng, đen, xanh. Kh&ocirc;ng chỉ đẹp, iPhone XR c&ograve;n rất bền vững nhờ khả năng chống nước, mang tới sự y&ecirc;n t&acirc;m khi sử dụng.</p>

<p><img alt="Chiếc iPhone đầy màu sắc tuyệt đẹp | iPhone XR" src="https://fptshop.com.vn/Uploads/images/2015/Tin-Tuc/QuanLNH2/iphone-xr-17.jpg" /></p>
', NULL, CAST(N'2021-04-02T22:12:28.320' AS DateTime), NULL, NULL, NULL, N'iphone-xr', 1, CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Product] ([ID], [Name], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [Quantity], [CategoryID], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [Status], [TopHot], [ViewCount]) VALUES (6, N'Galaxy Note 20 Ultra', N'galaxy-note-20-ultra', N'<table>
	<tbody>
		<tr>
			<td>M&agrave;n h&igrave;nh</td>
			<td>6.9&quot;, 2K+, Dynamic AMOLED 2X, 1440 x 3088 Pixel</td>
		</tr>
		<tr>
			<td>Camera sau</td>
			<td>108.0 MP + 12.0 MP + 12.0 MP</td>
		</tr>
		<tr>
			<td>Camera Selfie</td>
			<td>10.0 MP</td>
		</tr>
		<tr>
			<td>RAM&nbsp;</td>
			<td>8 GB</td>
		</tr>
		<tr>
			<td>Bộ nhớ trong</td>
			<td>256 GB</td>
		</tr>
		<tr>
			<td>CPU</td>
			<td>Exynos 990</td>
		</tr>
		<tr>
			<td>GPU</td>
			<td>ARM Mali-G77 MP11</td>
		</tr>
		<tr>
			<td>Dung lượng pin</td>
			<td>4500 mAh</td>
		</tr>
		<tr>
			<td>Thẻ sim</td>
			<td>2, 2 Nano SIM hoặc 1 eSIM, 1 Nano SIM</td>
		</tr>
		<tr>
			<td>Hệ điều h&agrave;nh</td>
			<td>Android 10.0</td>
		</tr>
		<tr>
			<td>Xuất xứ</td>
			<td>Việt Nam</td>
		</tr>
		<tr>
			<td>Thời gian ra mắt</td>
			<td>08/2020</td>
		</tr>
	</tbody>
</table>
', N'galaxy-note-20-ultra.jpg', NULL, CAST(25000000 AS Decimal(18, 0)), CAST(24000000 AS Decimal(18, 0)), 8, 7, N'<h2>Đ&aacute;nh gi&aacute; chi tiết&nbsp;Samsung Galaxy Note 20 Ultra</h2>

<p><strong>Chiếc Galaxy Note m&agrave;n h&igrave;nh lớn nhất, b&uacute;t S Pen th&ocirc;ng minh nhất v&agrave; những t&iacute;nh năng mạnh mẽ nhất đ&atilde; xuất hiện.&nbsp;<a href="https://fptshop.com.vn/dien-thoai/samsung-galaxy-note-20-ultra">Samsung Galaxy Note 20 Ultra</a>&nbsp;sẽ định nghĩa lại&nbsp;<a href="https://fptshop.com.vn/dien-thoai">smartphone</a>, thay đổi những trải nghiệm của bạn theo c&aacute;ch th&uacute; vị hơn bao giờ hết.</strong></p>

<p><strong><img alt="Điện thoại Samsung Galaxy Note 20 Ultra" src="https://images.fpt.shop/unsafe/fit-in/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/QuanLNH2/samsung-galaxy-note20-ultra-1.jpg" /></strong></p>

<h3><strong>Kiệt t&aacute;c c&ocirc;ng nghệ với m&agrave;u sắc huyền b&iacute;</strong></h3>

<p>Samsung Galaxy Note 20 Ultra được chế t&aacute;c từ những vật liệu cao cấp h&agrave;ng đầu hiện nay, với sự tỉ mỉ v&agrave; chất lượng gia c&ocirc;ng thượng thừa, tạo n&ecirc;n chiếc điện thoại đẹp hơn những g&igrave; bạn c&oacute; thể tưởng tượng. Kh&ocirc;ng chỉ c&oacute; kiểu d&aacute;ng thanh lịch,&nbsp;<a href="https://fptshop.com.vn/tin-tuc/danh-gia/giai-ma-nhung-cong-nghe-man-hinh-vo-cuc-moi-cua-samsung-77417">m&agrave;n h&igrave;nh kh&ocirc;ng viền Infinity-O</a>&nbsp;quyến rũ, Galaxy Note20 Ultra c&ograve;n thể hiện sự cao cấp ở từng chi tiết nhỏ như c&aacute;c phần viền cạnh s&aacute;ng b&oacute;ng, họa tiết phay xước độc đ&aacute;o tr&ecirc;n khung m&aacute;y, mang đến niềm cảm hứng cho người d&ugrave;ng ở mọi g&oacute;c cạnh.</p>

<p><img alt="thiết kế Samsung Galaxy Note 20 Ultra" src="https://images.fpt.shop/unsafe/fit-in/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/QuanLNH2/samsung-galaxy-note20-ultra-2.jpg" /></p>

<p>B&ecirc;n cạnh phần th&acirc;n kim loại, chất liệu ch&iacute;nh l&agrave;m n&ecirc;n Note 20 Ultra l&agrave; k&iacute;nh cường lực<a href="https://fptshop.com.vn/tin-tuc/tin-moi/corning-trinh-lang-kinh-cuong-luc-gorilla-glass-victus-roi-tu-2-met-van-song-sot-123754">&nbsp;Corning Gorilla Glass Victus</a>, c&oacute; khả năng chịu lực tốt nhất thế giới smartphone hiện nay. M&agrave;u sắc cũng l&agrave; điều bạn sẽ y&ecirc;u th&iacute;ch tr&ecirc;n Note 20 Ultra khi điện thoại c&oacute; 3 lựa chọn m&agrave;u l&agrave; Trắng huyền b&iacute;, Đen huyền b&iacute; v&agrave; m&agrave;u đặc biệt Đồng huyền b&iacute; chỉ c&oacute; tr&ecirc;n Galaxy Note 20 series.</p>

<h3><strong>Hiển thị tuyệt đẹp, mượt m&agrave; đến kh&oacute; tin</strong></h3>

<p>Note 20 Ultra chắc chắn l&agrave; mẫu smartphone c&oacute; m&agrave;n h&igrave;nh đẹp bậc nhất thế giới hiện nay. Trước mắt bạn l&agrave; một m&agrave;n h&igrave;nh cực lớn 6,9 inch tr&agrave;n cạnh Infinity-O, độ ph&acirc;n giải QHD+ si&ecirc;u n&eacute;t, hỗ trợ HDR10+ v&agrave; c&ocirc;ng nghệ m&agrave;n h&igrave;nh<a href="https://fptshop.com.vn/tin-tuc/danh-gia/man-hinh-samsung-dynamic-amoled-khong-chi-la-man-hinh-not-ruoi-no-con-co-nhieu-hon-the-80743">&nbsp;Dynamic AMOLED 2X</a>. Mọi thứ đều hiển thị lớn, sống động, đẹp rực rỡ v&agrave; độ chi tiết ho&agrave;n hảo. Kh&ocirc;ng chỉ đẹp, m&agrave;n h&igrave;nh n&agrave;y c&ograve;n c&oacute; độ mượt m&agrave; vượt trội với tần số qu&eacute;t 120Hz, cho những thao t&aacute;c vuốt chạm của bạn phản hồi ngay lập tức, đưa hiệu quả c&ocirc;ng việc v&agrave; giải tr&iacute; l&ecirc;n tối đa.</p>
', NULL, CAST(N'2021-04-02T22:14:34.570' AS DateTime), NULL, NULL, NULL, N'galaxy-note-20-ultra', 1, CAST(N'1900-01-01T00:00:00.000' AS DateTime), 9)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductCategory] ON 

INSERT [dbo].[ProductCategory] ([ID], [Name], [MetaTitle], [ParentId], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [Status], [ShowOnHome]) VALUES (1, N'Điện thoại', N'mobile', NULL, 1, N'mobile', CAST(N'2021-01-01T00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[ProductCategory] ([ID], [Name], [MetaTitle], [ParentId], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [Status], [ShowOnHome]) VALUES (2, N'Laptop', N'laptop', NULL, 2, N'laptop', CAST(N'2021-01-01T00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[ProductCategory] ([ID], [Name], [MetaTitle], [ParentId], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [Status], [ShowOnHome]) VALUES (3, N'Apple', N'apply', NULL, 3, N'apple', CAST(N'2021-01-01T00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[ProductCategory] ([ID], [Name], [MetaTitle], [ParentId], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [Status], [ShowOnHome]) VALUES (4, N'Máy tính bảng', N'tablet', NULL, 4, N'tablet', CAST(N'2021-04-02T21:52:31.370' AS DateTime), NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[ProductCategory] ([ID], [Name], [MetaTitle], [ParentId], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [Status], [ShowOnHome]) VALUES (5, N'Đồng hồ thông minh', N'smart-watch', NULL, 5, N'smart-watch', CAST(N'2021-01-01T00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[ProductCategory] ([ID], [Name], [MetaTitle], [ParentId], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [Status], [ShowOnHome]) VALUES (6, N'Màn hình', N'monitor', NULL, 6, N'monitor', CAST(N'2021-01-01T00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[ProductCategory] ([ID], [Name], [MetaTitle], [ParentId], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [Status], [ShowOnHome]) VALUES (7, N'Samsung', N'samsung', 1, 7, N'samsung', CAST(N'2021-04-02T21:54:09.360' AS DateTime), NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[ProductCategory] ([ID], [Name], [MetaTitle], [ParentId], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [Status], [ShowOnHome]) VALUES (8, N'Iphone', N'iphone', 1, 8, N'iphone', CAST(N'2021-01-01T00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[ProductCategory] ([ID], [Name], [MetaTitle], [ParentId], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [Status], [ShowOnHome]) VALUES (9, N'Xiaomi', N'xiaomi', 1, 9, N'xiaomi', CAST(N'2021-01-01T00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[ProductCategory] ([ID], [Name], [MetaTitle], [ParentId], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [Status], [ShowOnHome]) VALUES (10, N'Nokia', N'nokia', 1, 10, N'nokia', CAST(N'2021-01-01T00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[ProductCategory] ([ID], [Name], [MetaTitle], [ParentId], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [Status], [ShowOnHome]) VALUES (11, N'Oppo', N'oppo', 1, 11, N'oppo', CAST(N'2021-01-01T00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[ProductCategory] ([ID], [Name], [MetaTitle], [ParentId], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [Status], [ShowOnHome]) VALUES (12, N'Realme', N'realme', 1, 12, N'realme', CAST(N'2021-01-01T00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[ProductCategory] ([ID], [Name], [MetaTitle], [ParentId], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [Status], [ShowOnHome]) VALUES (13, N'Macbook', N'macbook', 2, 13, N'macbook', CAST(N'2021-01-01T00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[ProductCategory] ([ID], [Name], [MetaTitle], [ParentId], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [Status], [ShowOnHome]) VALUES (14, N'Dell', N'dell', 2, 14, N'dell', CAST(N'2021-01-01T00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[ProductCategory] ([ID], [Name], [MetaTitle], [ParentId], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [Status], [ShowOnHome]) VALUES (15, N'Asus', N'asus', 2, 15, N'asus', CAST(N'2021-04-02T21:57:15.033' AS DateTime), NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[ProductCategory] ([ID], [Name], [MetaTitle], [ParentId], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [Status], [ShowOnHome]) VALUES (16, N'Lenovo', N'lenovo', 2, 16, N'lenovo', CAST(N'2021-01-01T00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[ProductCategory] ([ID], [Name], [MetaTitle], [ParentId], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [Status], [ShowOnHome]) VALUES (17, N'Ipad', N'ipad', 3, 17, N'ipad', CAST(N'2021-01-01T00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[ProductCategory] ([ID], [Name], [MetaTitle], [ParentId], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [Status], [ShowOnHome]) VALUES (18, N'Imac', N'imac', 3, 18, N'imac', CAST(N'2021-01-01T00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, 1, 1)
SET IDENTITY_INSERT [dbo].[ProductCategory] OFF
GO
SET IDENTITY_INSERT [dbo].[Slide] ON 

INSERT [dbo].[Slide] ([ID], [Image], [DisplayOrder], [Link], [ModifiedBy], [CreatedDate], [CreatedBy], [ModifiedDate], [Status]) VALUES (1, N'slide1.png', 1, NULL, NULL, CAST(N'2021-03-30T22:27:23.170' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[Slide] ([ID], [Image], [DisplayOrder], [Link], [ModifiedBy], [CreatedDate], [CreatedBy], [ModifiedDate], [Status]) VALUES (2, N'slide2.png', 2, NULL, NULL, CAST(N'2021-03-30T22:27:31.427' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[Slide] ([ID], [Image], [DisplayOrder], [Link], [ModifiedBy], [CreatedDate], [CreatedBy], [ModifiedDate], [Status]) VALUES (3, N'slide3.png', 3, NULL, NULL, CAST(N'2021-03-30T22:27:34.797' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[Slide] ([ID], [Image], [DisplayOrder], [Link], [ModifiedBy], [CreatedDate], [CreatedBy], [ModifiedDate], [Status]) VALUES (4, N'slide4.png', 4, NULL, NULL, CAST(N'2021-03-30T22:27:37.723' AS DateTime), NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[Slide] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([ID], [UserName], [Password], [Name], [Email], [Address], [Phone], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [Status]) VALUES (1, N'tano', N'8867e7959e7070fdf9127554f966eb3f', N'tano', NULL, N'tano', N'1234567890', CAST(N'2021-03-18T00:00:00.000' AS DateTime), N'tano', CAST(N'2021-03-18T00:00:00.000' AS DateTime), N'tano', NULL, 1)
INSERT [dbo].[User] ([ID], [UserName], [Password], [Name], [Email], [Address], [Phone], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [Status]) VALUES (3, N'a', N'a', N'a', NULL, N'1234', N'a', NULL, N'1', CAST(N'2021-03-19T12:08:20.697' AS DateTime), N'1', NULL, 1)
INSERT [dbo].[User] ([ID], [UserName], [Password], [Name], [Email], [Address], [Phone], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [Status]) VALUES (5, N'3', N'a87ff679a2f3e71d9181a67b7542122c', NULL, NULL, N'2', N'5', CAST(N'2021-03-20T20:31:32.137' AS DateTime), N'1', NULL, NULL, N'3', 1)
INSERT [dbo].[User] ([ID], [UserName], [Password], [Name], [Email], [Address], [Phone], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [Status]) VALUES (6, N'b', N'92eb5ffee6ae2fec3ad71c777531578f', N'b', NULL, N'b', N'b', CAST(N'2021-03-21T20:41:52.353' AS DateTime), N'1', NULL, NULL, N'b', 1)
INSERT [dbo].[User] ([ID], [UserName], [Password], [Name], [Email], [Address], [Phone], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [Status]) VALUES (7, N'v', N'9e3669d19b675bd57058fd4664205d2a', N'v', NULL, N'v', N'v', CAST(N'2021-03-21T20:54:23.210' AS DateTime), N'1', NULL, NULL, N'v', 0)
INSERT [dbo].[User] ([ID], [UserName], [Password], [Name], [Email], [Address], [Phone], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [Status]) VALUES (8, N'q', N'7694f4a66316e53c8cdd9d9954bd611d', N'q', NULL, N'q', N'q', CAST(N'2021-03-21T21:00:49.707' AS DateTime), N'1', NULL, NULL, N'q', 0)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[About] ADD  CONSTRAINT [DF_About_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[About] ADD  CONSTRAINT [DF_About_Status]  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [dbo].[Category] ADD  CONSTRAINT [DF_Category_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Category] ADD  CONSTRAINT [DF_Category_Status]  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [dbo].[Category] ADD  CONSTRAINT [DF_Category_ShowOnHome]  DEFAULT ((0)) FOR [ShowOnHome]
GO
ALTER TABLE [dbo].[Content] ADD  CONSTRAINT [DF_Content_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Content] ADD  CONSTRAINT [DF_Content_Status]  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [dbo].[Content] ADD  CONSTRAINT [DF_Content_TopHot]  DEFAULT ((0)) FOR [TopHot]
GO
ALTER TABLE [dbo].[Content] ADD  CONSTRAINT [DF_Content_ViewCount]  DEFAULT ((0)) FOR [ViewCount]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_Price]  DEFAULT ((0)) FOR [Price]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_Quantity]  DEFAULT ((0)) FOR [Quantity]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_Status]  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_ShowOnHome]  DEFAULT ((0)) FOR [TopHot]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_ViewCount]  DEFAULT ((0)) FOR [ViewCount]
GO
ALTER TABLE [dbo].[ProductCategory] ADD  CONSTRAINT [DF_ProductCategory_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[ProductCategory] ADD  CONSTRAINT [DF_ProductCategory_Status]  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [dbo].[ProductCategory] ADD  CONSTRAINT [DF_ProductCategory_ShowOnHome]  DEFAULT ((0)) FOR [ShowOnHome]
GO
ALTER TABLE [dbo].[Slide] ADD  CONSTRAINT [DF_Slide_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_Status]  DEFAULT ((0)) FOR [Status]
GO
USE [master]
GO
ALTER DATABASE [EShop] SET  READ_WRITE 
GO
