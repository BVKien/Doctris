USE [master]
GO
/****** Object:  Database [ClothesShopping]    Script Date: 7/21/2023 11:57:10 AM ******/
CREATE DATABASE [ClothesShopping]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ClothesShopping', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\ClothesShopping.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ClothesShopping_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\ClothesShopping_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ClothesShopping] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ClothesShopping].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ClothesShopping] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ClothesShopping] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ClothesShopping] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ClothesShopping] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ClothesShopping] SET ARITHABORT OFF 
GO
ALTER DATABASE [ClothesShopping] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [ClothesShopping] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ClothesShopping] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ClothesShopping] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ClothesShopping] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ClothesShopping] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ClothesShopping] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ClothesShopping] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ClothesShopping] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ClothesShopping] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ClothesShopping] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ClothesShopping] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ClothesShopping] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ClothesShopping] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ClothesShopping] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ClothesShopping] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ClothesShopping] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ClothesShopping] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ClothesShopping] SET  MULTI_USER 
GO
ALTER DATABASE [ClothesShopping] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ClothesShopping] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ClothesShopping] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ClothesShopping] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ClothesShopping] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ClothesShopping] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [ClothesShopping] SET QUERY_STORE = OFF
GO
USE [ClothesShopping]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 7/21/2023 11:57:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](200) NULL,
	[CategoryImage] [nvarchar](100) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 7/21/2023 11:57:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderId] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [int] NULL,
	[Address] [nvarchar](200) NULL,
	[TotalPrice] [float] NULL,
	[NumberOfItem] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 7/21/2023 11:57:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[OrderDetailId] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NULL,
	[ProductId] [int] NULL,
	[ItemPrice] [float] NULL,
	[Quantity] [int] NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[OrderDetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 7/21/2023 11:57:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](200) NULL,
	[CategoryId] [int] NULL,
	[Price] [float] NULL,
	[Quantity] [int] NULL,
	[Image] [nvarchar](200) NULL,
	[Status] [bit] NULL,
	[Description] [nvarchar](200) NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 7/21/2023 11:57:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleId] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](50) NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 7/21/2023 11:57:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](200) NULL,
	[PhoneNumber] [nvarchar](200) NULL,
	[Email] [nvarchar](200) NULL,
	[Address] [nvarchar](200) NULL,
	[Password] [nvarchar](200) NULL,
	[Gender] [bit] NULL,
	[Birthday] [datetime] NULL,
	[Avatar] [nvarchar](200) NULL,
	[Role] [int] NULL,
	[Status] [bit] NULL,
	[CodeVerify] [varchar](15) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([CategoryId], [CategoryName], [CategoryImage]) VALUES (1, N'Skin Care', N'lib/images/pharmacy/skin.jpg')
INSERT [dbo].[Category] ([CategoryId], [CategoryName], [CategoryImage]) VALUES (2, N'Sexual Wallness', N'lib/images/pharmacy/sexual.jpg')
INSERT [dbo].[Category] ([CategoryId], [CategoryName], [CategoryImage]) VALUES (3, N'Weight Management', N'lib/images/pharmacy/weight.jpg')
INSERT [dbo].[Category] ([CategoryId], [CategoryName], [CategoryImage]) VALUES (4, N'Pain Relief', N'lib/images/pharmacy/pain.jpg')
INSERT [dbo].[Category] ([CategoryId], [CategoryName], [CategoryImage]) VALUES (5, N'Heart Health', N'lib/images/pharmacy/heart.jpg')
INSERT [dbo].[Category] ([CategoryId], [CategoryName], [CategoryImage]) VALUES (6, N'Cough Cold', N'lib/images/pharmacy/cough.jpg')
INSERT [dbo].[Category] ([CategoryId], [CategoryName], [CategoryImage]) VALUES (7, N'Diabetes Care', N'lib/images/pharmacy/diabetes.jpg')
INSERT [dbo].[Category] ([CategoryId], [CategoryName], [CategoryImage]) VALUES (8, N'Cancer Care', N'lib/images/pharmacy/cancer.jpg')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([OrderId], [CustomerId], [Address], [TotalPrice], [NumberOfItem], [CreatedDate], [Status]) VALUES (1, 1, N'1', 1, 1, CAST(N'2002-02-12T00:00:00.000' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderDetail] ON 

INSERT [dbo].[OrderDetail] ([OrderDetailId], [OrderId], [ProductId], [ItemPrice], [Quantity]) VALUES (1, 1, 1, 1, 1)
SET IDENTITY_INSERT [dbo].[OrderDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Image], [Status], [Description]) VALUES (1, N'Thermometer', 1, 16, 1, N'/lib/images/pharmacy/shop/thermometer.jpg', 1, N'1')
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Image], [Status], [Description]) VALUES (2, N'Stethoscope', 2, 10, 1, N'/lib/images/pharmacy/shop/stethoscope.jpg', 1, N'1')
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Image], [Status], [Description]) VALUES (3, N'Pulse oximeter', 3, 9, 1, N'/lib/images/pharmacy/shop/pulse-oximeter.jpg', 1, N'1')
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Image], [Status], [Description]) VALUES (4, N'Medicine pills', 4, 36, 1, N'/lib/images/pharmacy/shop/medicine.jpg', 1, N'1')
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Image], [Status], [Description]) VALUES (5, N'Smokill smoking habit', 3, 20, 1, N'/lib/images/pharmacy/shop/smoking-habit.jpg', 1, N'1')
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Image], [Status], [Description]) VALUES (6, N'Sanitizer', 1, 16, 1, N'/lib/images/pharmacy/shop/sanitizer.jpg', 1, N'1')
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Image], [Status], [Description]) VALUES (7, N'Nicotex', 2, 17, 1, N'/lib/images/pharmacy/shop/nicotex.jpg', 1, N'1')
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Image], [Status], [Description]) VALUES (8, N'Medigrip', 5, 5, 1, N'/lib/images/pharmacy/shop/medigrip.jpg', 1, N'1')
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([RoleId], [RoleName]) VALUES (1, N'Admin')
INSERT [dbo].[Role] ([RoleId], [RoleName]) VALUES (2, N'User')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([UserId], [FullName], [PhoneNumber], [Email], [Address], [Password], [Gender], [Birthday], [Avatar], [Role], [Status], [CodeVerify]) VALUES (1, N'Nguyễn Tiến Đạt', N'0865474685', N'datnthe163935@fpt.edu.vn', N'Đại học FPT', N'e10adc3949ba59abbe56e057f20f883e', 1, CAST(N'2002-04-30T00:00:00.000' AS DateTime), N'UserID _144913a45-a287-4a01-b628-af9455ee9156_z3936088334151_cc2ba1cbf99f6a671b2d72c1e8f039e3.jpg', 1, 1, NULL)
INSERT [dbo].[User] ([UserId], [FullName], [PhoneNumber], [Email], [Address], [Password], [Gender], [Birthday], [Avatar], [Role], [Status], [CodeVerify]) VALUES (2, N'Trần Khánh Hiển', NULL, N'admin@gmail.com', N'Đại học FPT', N'e10adc3949ba59abbe56e057f20f883e', 1, NULL, NULL, 1, 1, NULL)
INSERT [dbo].[User] ([UserId], [FullName], [PhoneNumber], [Email], [Address], [Password], [Gender], [Birthday], [Avatar], [Role], [Status], [CodeVerify]) VALUES (3, N'Bùi Văn Kiên', NULL, N'admin02@gmail.com', N'Đại học FPT 132131', N'96e79218965eb72c92a549dd5a330112', 1, CAST(N'2023-07-14T00:00:00.000' AS DateTime), N'UserID _39c52371b-6ac4-4891-b167-f421424c3786_swtPointLab234.jpg', 1, 1, NULL)
INSERT [dbo].[User] ([UserId], [FullName], [PhoneNumber], [Email], [Address], [Password], [Gender], [Birthday], [Avatar], [Role], [Status], [CodeVerify]) VALUES (4, N'Hữu LV', NULL, N'admin3@gmail.com', N'Đại học FPT', N'e10adc3949ba59abbe56e057f20f883e', 1, NULL, NULL, 1, 1, NULL)
INSERT [dbo].[User] ([UserId], [FullName], [PhoneNumber], [Email], [Address], [Password], [Gender], [Birthday], [Avatar], [Role], [Status], [CodeVerify]) VALUES (5, N'test1', N'0915288966', N'test@gmail.com', N'Đại học FPT', N'e10adc3949ba59abbe56e057f20f883e', 0, CAST(N'2002-02-18T00:00:00.000' AS DateTime), NULL, 2, 0, NULL)
INSERT [dbo].[User] ([UserId], [FullName], [PhoneNumber], [Email], [Address], [Password], [Gender], [Birthday], [Avatar], [Role], [Status], [CodeVerify]) VALUES (6, N'Nguyen Tien Dat', NULL, N'tiendat320@gmail.com', N'Đại học FPT', N'e10adc3949ba59abbe56e057f20f883e', 1, CAST(N'2023-07-23T00:00:00.000' AS DateTime), N'UserID _650abe5bb-c5c0-4dc0-94fe-bba135c7a2d7_Sample_User_Icon.png', 2, 1, NULL)
INSERT [dbo].[User] ([UserId], [FullName], [PhoneNumber], [Email], [Address], [Password], [Gender], [Birthday], [Avatar], [Role], [Status], [CodeVerify]) VALUES (7, N'Dat PK', NULL, N'tiendat3200@gmail.com', N'Đại học FPT', N'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, NULL, 2, 1, NULL)
INSERT [dbo].[User] ([UserId], [FullName], [PhoneNumber], [Email], [Address], [Password], [Gender], [Birthday], [Avatar], [Role], [Status], [CodeVerify]) VALUES (8, N'Dat PK1', NULL, N'tiendat32000@gmail.com', N'Đại học FPT', N'202cb962ac59075b964b07152d234b70', NULL, NULL, NULL, 2, 1, NULL)
INSERT [dbo].[User] ([UserId], [FullName], [PhoneNumber], [Email], [Address], [Password], [Gender], [Birthday], [Avatar], [Role], [Status], [CodeVerify]) VALUES (9, N'test2', NULL, N'test2@gmail.com', NULL, N'e10adc3949ba59abbe56e057f20f883e', 1, NULL, N'UserID _98d2ba44e-5095-4b14-87d1-c956d5982b8f_Sample_User_Icon.png', 2, 1, NULL)
INSERT [dbo].[User] ([UserId], [FullName], [PhoneNumber], [Email], [Address], [Password], [Gender], [Birthday], [Avatar], [Role], [Status], [CodeVerify]) VALUES (10, N'test3', NULL, N'test3@gmail.com', NULL, N'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, N'UserID _6ed2d8bf8-0529-4f4c-ad13-b1d3b1547a88_Sample_User_Icon.png', 2, 1, NULL)
INSERT [dbo].[User] ([UserId], [FullName], [PhoneNumber], [Email], [Address], [Password], [Gender], [Birthday], [Avatar], [Role], [Status], [CodeVerify]) VALUES (12, N'Bui Van Kien ', NULL, N'kbui0212@gmail.com', NULL, N'f5bb0c8de146c67b44babbf4e6584cc0', NULL, NULL, N'UserID _6ed2d8bf8-0529-4f4c-ad13-b1d3b1547a88_Sample_User_Icon.png', 2, 1, NULL)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_User] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_User]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Order] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Order] ([OrderId])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Order]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([ProductId])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Product]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([CategoryId])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Role] FOREIGN KEY([Role])
REFERENCES [dbo].[Role] ([RoleId])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Role]
GO
USE [master]
GO
ALTER DATABASE [ClothesShopping] SET  READ_WRITE 
GO
