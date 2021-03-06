USE [EcommGroceryOnline]
GO
/****** Object:  Table [dbo].[AddressDetails]    Script Date: 28-Dec-18 9:32:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AddressDetails](
	[AddressId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[Address] [varchar](50) NOT NULL,
	[Landmark] [varchar](50) NOT NULL,
	[Direction] [varchar](50) NOT NULL,
	[CityId] [int] NOT NULL,
	[AreaId] [int] NOT NULL,
	[CountryId] [int] NOT NULL,
	[Pincode] [varchar](15) NOT NULL,
	[AddressTypeId] [int] NOT NULL,
	[OtherAddress] [varchar](50) NOT NULL,
	[IsDefault] [bit] NOT NULL,
 CONSTRAINT [PK_AddressDetails] PRIMARY KEY CLUSTERED 
(
	[AddressId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AreaMaster]    Script Date: 28-Dec-18 9:32:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AreaMaster](
	[AreaId] [int] IDENTITY(1,1) NOT NULL,
	[AreaName] [varchar](100) NOT NULL,
	[CityId] [int] NOT NULL,
 CONSTRAINT [PK_AreaMaster] PRIMARY KEY CLUSTERED 
(
	[AreaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 28-Dec-18 9:32:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[CartId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
	[DateCreated] [datetime] NULL,
	[IsActive] [bit] NOT NULL,
	[IpAddress] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_Cart] PRIMARY KEY CLUSTERED 
(
	[CartId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CartDetail]    Script Date: 28-Dec-18 9:32:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CartDetail](
	[CartDetailId] [int] IDENTITY(1,1) NOT NULL,
	[CartId] [int] NULL,
	[ProductId] [int] NULL,
	[Amount] [decimal](18, 2) NULL,
	[Discount] [decimal](18, 2) NULL,
	[NetAmount] [decimal](18, 2) NULL,
	[Timestamp] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[Quantity] [int] NULL,
	[PricePerUnit] [int] NULL,
	[Unit] [varchar](50) NULL,
 CONSTRAINT [PK_CardDetail] PRIMARY KEY CLUSTERED 
(
	[CartDetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CityMaster]    Script Date: 28-Dec-18 9:32:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CityMaster](
	[CityId] [int] IDENTITY(1,1) NOT NULL,
	[CityName] [varchar](100) NOT NULL,
	[CountryId] [int] NOT NULL,
 CONSTRAINT [PK_CityMaster] PRIMARY KEY CLUSTERED 
(
	[CityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CountryMaster]    Script Date: 28-Dec-18 9:32:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CountryMaster](
	[CountryId] [int] IDENTITY(1,1) NOT NULL,
	[CountryName] [varchar](100) NOT NULL,
 CONSTRAINT [PK_CountryMaster] PRIMARY KEY CLUSTERED 
(
	[CountryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CouponDetails]    Script Date: 28-Dec-18 9:32:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CouponDetails](
	[CouponId] [int] IDENTITY(1,1) NOT NULL,
	[CouponCode] [varchar](50) NOT NULL,
	[ExpDate] [datetime] NOT NULL,
	[Status] [bit] NOT NULL,
	[DiscountPer] [int] NOT NULL,
 CONSTRAINT [PK_CouponDetails] PRIMARY KEY CLUSTERED 
(
	[CouponId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FollowUpDetails]    Script Date: 28-Dec-18 9:32:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FollowUpDetails](
	[FollowUpId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[Day] [int] NOT NULL,
	[Time] [time](7) NOT NULL,
 CONSTRAINT [PK_FollowUpDetails] PRIMARY KEY CLUSTERED 
(
	[FollowUpId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MainCategoryMaster]    Script Date: 28-Dec-18 9:32:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MainCategoryMaster](
	[MainCategoryId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](150) NOT NULL,
 CONSTRAINT [PK_MainCategoryMaster] PRIMARY KEY CLUSTERED 
(
	[MainCategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductDetails]    Script Date: 28-Dec-18 9:32:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductDetails](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](200) NOT NULL,
	[SubCategoryId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Description] [varchar](250) NOT NULL,
	[ImageURL] [varchar](max) NOT NULL,
	[PricePerUnit] [int] NOT NULL,
	[Unit] [varchar](50) NOT NULL,
	[Status] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[IsOutOfStock] [bit] NOT NULL,
	[IsLimitedStock] [bit] NOT NULL,
	[IsSeasonalStock] [bit] NOT NULL,
 CONSTRAINT [PK_ProductDetails] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 28-Dec-18 9:32:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[RoleId] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SubCategoryMaster]    Script Date: 28-Dec-18 9:32:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubCategoryMaster](
	[SubCategoryId] [int] IDENTITY(1,1) NOT NULL,
	[MainCategoryId] [int] NOT NULL,
	[Name] [varchar](150) NOT NULL,
	[ImageURL] [varchar](250) NULL,
 CONSTRAINT [PK_SubCategoryMaster] PRIMARY KEY CLUSTERED 
(
	[SubCategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SubSubCategoryMaster]    Script Date: 28-Dec-18 9:32:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubSubCategoryMaster](
	[SubSubCategoryId] [int] IDENTITY(1,1) NOT NULL,
	[SubCategoryId] [int] NOT NULL,
	[Name] [varchar](150) NOT NULL,
 CONSTRAINT [PK_SubSubCategoryMaster] PRIMARY KEY CLUSTERED 
(
	[SubSubCategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TransactionDetails]    Script Date: 28-Dec-18 9:32:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TransactionDetails](
	[TransactionId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[TransactionDate] [datetime] NOT NULL,
	[ConfirmationDate] [datetime] NULL,
	[IsConfirm] [bit] NOT NULL,
	[PGTransactionId] [varchar](250) NULL,
	[InvoiceId] [varchar](50) NULL,
	[Custom] [varchar](50) NULL,
	[Custom1] [varchar](50) NULL,
	[CartId] [int] NOT NULL,
 CONSTRAINT [PK_TransactionDetails] PRIMARY KEY CLUSTERED 
(
	[TransactionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 28-Dec-18 9:32:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [int] NOT NULL,
	[UserName] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[EmailId] [varchar](150) NOT NULL,
	[MobileNumber] [varchar](20) NOT NULL,
	[AlternateNumber] [varchar](20) NULL,
	[IsFollowUp] [bit] NOT NULL,
	[IPAddres] [varchar](50) NULL,
	[RegistrationDate] [datetime] NOT NULL,
	[Status] [bit] NOT NULL,
	[LastLoginDate] [datetime] NULL,
	[ActivationCode] [varchar](50) NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[AreaMaster] ON 

INSERT [dbo].[AreaMaster] ([AreaId], [AreaName], [CityId]) VALUES (1, N'Ajwa', 1)
INSERT [dbo].[AreaMaster] ([AreaId], [AreaName], [CityId]) VALUES (2, N'Ajwa bypass', 1)
INSERT [dbo].[AreaMaster] ([AreaId], [AreaName], [CityId]) VALUES (3, N'Ajwa Road', 1)
INSERT [dbo].[AreaMaster] ([AreaId], [AreaName], [CityId]) VALUES (4, N'Akota', 1)
INSERT [dbo].[AreaMaster] ([AreaId], [AreaName], [CityId]) VALUES (5, N'Akshar Chowk', 1)
INSERT [dbo].[AreaMaster] ([AreaId], [AreaName], [CityId]) VALUES (6, N'Alembic Road', 1)
INSERT [dbo].[AreaMaster] ([AreaId], [AreaName], [CityId]) VALUES (7, N'Alkapuri', 1)
INSERT [dbo].[AreaMaster] ([AreaId], [AreaName], [CityId]) VALUES (8, N'Alva Naka', 1)
INSERT [dbo].[AreaMaster] ([AreaId], [AreaName], [CityId]) VALUES (9, N'Amdavadi Pole', 1)
INSERT [dbo].[AreaMaster] ([AreaId], [AreaName], [CityId]) VALUES (10, N'Anjesar Village', 1)
INSERT [dbo].[AreaMaster] ([AreaId], [AreaName], [CityId]) VALUES (11, N'Ankhol', 1)
INSERT [dbo].[AreaMaster] ([AreaId], [AreaName], [CityId]) VALUES (12, N'Ankodia', 1)
INSERT [dbo].[AreaMaster] ([AreaId], [AreaName], [CityId]) VALUES (13, N'Atladra', 1)
INSERT [dbo].[AreaMaster] ([AreaId], [AreaName], [CityId]) VALUES (14, N'Bagikhana', 1)
INSERT [dbo].[AreaMaster] ([AreaId], [AreaName], [CityId]) VALUES (15, N'Bahucharaji Road', 1)
INSERT [dbo].[AreaMaster] ([AreaId], [AreaName], [CityId]) VALUES (16, N'Bajwa', 1)
INSERT [dbo].[AreaMaster] ([AreaId], [AreaName], [CityId]) VALUES (17, N'Baranpura', 1)
INSERT [dbo].[AreaMaster] ([AreaId], [AreaName], [CityId]) VALUES (18, N'Bhaniyara', 1)
INSERT [dbo].[AreaMaster] ([AreaId], [AreaName], [CityId]) VALUES (19, N'Bhayli', 1)
INSERT [dbo].[AreaMaster] ([AreaId], [AreaName], [CityId]) VALUES (20, N'Bhutdi Jhapa', 1)
INSERT [dbo].[AreaMaster] ([AreaId], [AreaName], [CityId]) VALUES (21, N'Bill Village', 1)
INSERT [dbo].[AreaMaster] ([AreaId], [AreaName], [CityId]) VALUES (22, N'Chhani', 1)
INSERT [dbo].[AreaMaster] ([AreaId], [AreaName], [CityId]) VALUES (23, N'Chhani Road', 1)
INSERT [dbo].[AreaMaster] ([AreaId], [AreaName], [CityId]) VALUES (24, N'Chikoowadi', 1)
INSERT [dbo].[AreaMaster] ([AreaId], [AreaName], [CityId]) VALUES (25, N'Chokhandi', 1)
INSERT [dbo].[AreaMaster] ([AreaId], [AreaName], [CityId]) VALUES (26, N'Dabhasa', 1)
INSERT [dbo].[AreaMaster] ([AreaId], [AreaName], [CityId]) VALUES (27, N'Dabhoi Road', 1)
INSERT [dbo].[AreaMaster] ([AreaId], [AreaName], [CityId]) VALUES (28, N'Dabhoi Waghodia Ring Road', 1)
INSERT [dbo].[AreaMaster] ([AreaId], [AreaName], [CityId]) VALUES (29, N'Dandia Bazar', 1)
INSERT [dbo].[AreaMaster] ([AreaId], [AreaName], [CityId]) VALUES (30, N'Danteshwar', 1)
INSERT [dbo].[AreaMaster] ([AreaId], [AreaName], [CityId]) VALUES (31, N'Darjipura', 1)
INSERT [dbo].[AreaMaster] ([AreaId], [AreaName], [CityId]) VALUES (32, N'Dashrath', 1)
INSERT [dbo].[AreaMaster] ([AreaId], [AreaName], [CityId]) VALUES (33, N'Dhaniyavi Village', 1)
INSERT [dbo].[AreaMaster] ([AreaId], [AreaName], [CityId]) VALUES (34, N'Dhanora', 1)
INSERT [dbo].[AreaMaster] ([AreaId], [AreaName], [CityId]) VALUES (35, N'Diwalipura', 1)
INSERT [dbo].[AreaMaster] ([AreaId], [AreaName], [CityId]) VALUES (36, N'Dumad ', 1)
INSERT [dbo].[AreaMaster] ([AreaId], [AreaName], [CityId]) VALUES (37, N'Ellora Park', 1)
INSERT [dbo].[AreaMaster] ([AreaId], [AreaName], [CityId]) VALUES (38, N'EME Road', 1)
INSERT [dbo].[AreaMaster] ([AreaId], [AreaName], [CityId]) VALUES (39, N'Fatehgunj', 1)
INSERT [dbo].[AreaMaster] ([AreaId], [AreaName], [CityId]) VALUES (40, N'Fatehpura', 1)
INSERT [dbo].[AreaMaster] ([AreaId], [AreaName], [CityId]) VALUES (41, N'Fertilizer Nagar', 1)
INSERT [dbo].[AreaMaster] ([AreaId], [AreaName], [CityId]) VALUES (42, N'Geeta Mandir', 1)
INSERT [dbo].[AreaMaster] ([AreaId], [AreaName], [CityId]) VALUES (43, N'Genda Circle', 1)
INSERT [dbo].[AreaMaster] ([AreaId], [AreaName], [CityId]) VALUES (44, N'Gendi Gate Road', 1)
INSERT [dbo].[AreaMaster] ([AreaId], [AreaName], [CityId]) VALUES (45, N'Gendidate', 1)
INSERT [dbo].[AreaMaster] ([AreaId], [AreaName], [CityId]) VALUES (46, N'Ghadiyali Pole', 1)
INSERT [dbo].[AreaMaster] ([AreaId], [AreaName], [CityId]) VALUES (47, N'Golden Chowkdi', 1)
INSERT [dbo].[AreaMaster] ([AreaId], [AreaName], [CityId]) VALUES (48, N'Gorwa', 1)
INSERT [dbo].[AreaMaster] ([AreaId], [AreaName], [CityId]) VALUES (49, N'Gorwa Industrial Estate', 1)
INSERT [dbo].[AreaMaster] ([AreaId], [AreaName], [CityId]) VALUES (50, N'Gotri', 1)
INSERT [dbo].[AreaMaster] ([AreaId], [AreaName], [CityId]) VALUES (51, N'Halol Highway', 1)
INSERT [dbo].[AreaMaster] ([AreaId], [AreaName], [CityId]) VALUES (52, N'Harinagar Char Rasta', 1)
INSERT [dbo].[AreaMaster] ([AreaId], [AreaName], [CityId]) VALUES (53, N'Harni', 1)
INSERT [dbo].[AreaMaster] ([AreaId], [AreaName], [CityId]) VALUES (54, N'Harni Road', 1)
INSERT [dbo].[AreaMaster] ([AreaId], [AreaName], [CityId]) VALUES (55, N'Hathikhana', 1)
INSERT [dbo].[AreaMaster] ([AreaId], [AreaName], [CityId]) VALUES (56, N'Industrial Estate', 1)
INSERT [dbo].[AreaMaster] ([AreaId], [AreaName], [CityId]) VALUES (57, N'Jambuva', 1)
INSERT [dbo].[AreaMaster] ([AreaId], [AreaName], [CityId]) VALUES (58, N'Jetalpur', 1)
INSERT [dbo].[AreaMaster] ([AreaId], [AreaName], [CityId]) VALUES (59, N'Jetalpur Road', 1)
INSERT [dbo].[AreaMaster] ([AreaId], [AreaName], [CityId]) VALUES (60, N'Jubilee Garden', 1)
INSERT [dbo].[AreaMaster] ([AreaId], [AreaName], [CityId]) VALUES (61, N'Kalali', 1)
INSERT [dbo].[AreaMaster] ([AreaId], [AreaName], [CityId]) VALUES (62, N'Kapurai', 1)
INSERT [dbo].[AreaMaster] ([AreaId], [AreaName], [CityId]) VALUES (63, N'Karelibaug', 1)
INSERT [dbo].[AreaMaster] ([AreaId], [AreaName], [CityId]) VALUES (64, N'Kelanpur', 1)
INSERT [dbo].[AreaMaster] ([AreaId], [AreaName], [CityId]) VALUES (65, N'Khanderao Market', 1)
INSERT [dbo].[AreaMaster] ([AreaId], [AreaName], [CityId]) VALUES (66, N'Khatamba Village', 1)
INSERT [dbo].[AreaMaster] ([AreaId], [AreaName], [CityId]) VALUES (67, N'Khodiyar Nagar', 1)
INSERT [dbo].[AreaMaster] ([AreaId], [AreaName], [CityId]) VALUES (68, N'Kishanwadi', 1)
INSERT [dbo].[AreaMaster] ([AreaId], [AreaName], [CityId]) VALUES (69, N'Koyali', 1)
INSERT [dbo].[AreaMaster] ([AreaId], [AreaName], [CityId]) VALUES (70, N'L &amp; T Knowledge City', 1)
INSERT [dbo].[AreaMaster] ([AreaId], [AreaName], [CityId]) VALUES (71, N'Laheripura', 1)
INSERT [dbo].[AreaMaster] ([AreaId], [AreaName], [CityId]) VALUES (72, N'Laxmipura', 1)
INSERT [dbo].[AreaMaster] ([AreaId], [AreaName], [CityId]) VALUES (73, N'M G Road', 1)
INSERT [dbo].[AreaMaster] ([AreaId], [AreaName], [CityId]) VALUES (74, N'Madan Zapa', 1)
INSERT [dbo].[AreaMaster] ([AreaId], [AreaName], [CityId]) VALUES (75, N'Mahapura Village', 1)
INSERT [dbo].[AreaMaster] ([AreaId], [AreaName], [CityId]) VALUES (76, N'Makarpura', 1)
INSERT [dbo].[AreaMaster] ([AreaId], [AreaName], [CityId]) VALUES (77, N'Makarpura GIDC', 1)
INSERT [dbo].[AreaMaster] ([AreaId], [AreaName], [CityId]) VALUES (78, N'Makarpura Road', 1)
INSERT [dbo].[AreaMaster] ([AreaId], [AreaName], [CityId]) VALUES (79, N'Mandvi', 1)
INSERT [dbo].[AreaMaster] ([AreaId], [AreaName], [CityId]) VALUES (80, N'Maneja', 1)
INSERT [dbo].[AreaMaster] ([AreaId], [AreaName], [CityId]) VALUES (81, N'Manjalpur', 1)
INSERT [dbo].[AreaMaster] ([AreaId], [AreaName], [CityId]) VALUES (82, N'Manjusar GIDC', 1)
INSERT [dbo].[AreaMaster] ([AreaId], [AreaName], [CityId]) VALUES (83, N'Manjusar Village', 1)
INSERT [dbo].[AreaMaster] ([AreaId], [AreaName], [CityId]) VALUES (84, N'Mujmahuda', 1)
INSERT [dbo].[AreaMaster] ([AreaId], [AreaName], [CityId]) VALUES (85, N'Nagarwada', 1)
INSERT [dbo].[AreaMaster] ([AreaId], [AreaName], [CityId]) VALUES (86, N'Nandesari', 1)
INSERT [dbo].[AreaMaster] ([AreaId], [AreaName], [CityId]) VALUES (87, N'Nava Bazar', 1)
INSERT [dbo].[AreaMaster] ([AreaId], [AreaName], [CityId]) VALUES (88, N'Nava Yard Road', 1)
INSERT [dbo].[AreaMaster] ([AreaId], [AreaName], [CityId]) VALUES (89, N'New Alkapuri', 1)
INSERT [dbo].[AreaMaster] ([AreaId], [AreaName], [CityId]) VALUES (90, N'New IPCL Road', 1)
INSERT [dbo].[AreaMaster] ([AreaId], [AreaName], [CityId]) VALUES (91, N'New Sama', 1)
INSERT [dbo].[AreaMaster] ([AreaId], [AreaName], [CityId]) VALUES (92, N'New VIP Road', 1)
INSERT [dbo].[AreaMaster] ([AreaId], [AreaName], [CityId]) VALUES (93, N'Nimeta', 1)
INSERT [dbo].[AreaMaster] ([AreaId], [AreaName], [CityId]) VALUES (94, N'Nizampura', 1)
INSERT [dbo].[AreaMaster] ([AreaId], [AreaName], [CityId]) VALUES (95, N'Nyay Mandir', 1)
INSERT [dbo].[AreaMaster] ([AreaId], [AreaName], [CityId]) VALUES (96, N'Old Padra Road', 1)
INSERT [dbo].[AreaMaster] ([AreaId], [AreaName], [CityId]) VALUES (97, N'ONGC', 1)
INSERT [dbo].[AreaMaster] ([AreaId], [AreaName], [CityId]) VALUES (98, N'Padamla', 1)
INSERT [dbo].[AreaMaster] ([AreaId], [AreaName], [CityId]) VALUES (99, N'Padmavati Chaugan', 1)
GO
INSERT [dbo].[AreaMaster] ([AreaId], [AreaName], [CityId]) VALUES (100, N'Padra', 1)
INSERT [dbo].[AreaMaster] ([AreaId], [AreaName], [CityId]) VALUES (101, N'Padra Road', 1)
INSERT [dbo].[AreaMaster] ([AreaId], [AreaName], [CityId]) VALUES (102, N'Panchvati', 1)
INSERT [dbo].[AreaMaster] ([AreaId], [AreaName], [CityId]) VALUES (103, N'Panigate', 1)
INSERT [dbo].[AreaMaster] ([AreaId], [AreaName], [CityId]) VALUES (104, N'Patel Estate', 1)
INSERT [dbo].[AreaMaster] ([AreaId], [AreaName], [CityId]) VALUES (105, N'Pathar Gate', 1)
INSERT [dbo].[AreaMaster] ([AreaId], [AreaName], [CityId]) VALUES (106, N'Polo Ground', 1)
INSERT [dbo].[AreaMaster] ([AreaId], [AreaName], [CityId]) VALUES (107, N'Pratapgunj', 1)
INSERT [dbo].[AreaMaster] ([AreaId], [AreaName], [CityId]) VALUES (108, N'Pratapnagar', 1)
INSERT [dbo].[AreaMaster] ([AreaId], [AreaName], [CityId]) VALUES (109, N'Productivity Road', 1)
INSERT [dbo].[AreaMaster] ([AreaId], [AreaName], [CityId]) VALUES (110, N'R C Dutt Road', 1)
INSERT [dbo].[AreaMaster] ([AreaId], [AreaName], [CityId]) VALUES (111, N'R V Desai Road', 1)
INSERT [dbo].[AreaMaster] ([AreaId], [AreaName], [CityId]) VALUES (112, N'Race Course', 1)
INSERT [dbo].[AreaMaster] ([AreaId], [AreaName], [CityId]) VALUES (113, N'Rajmahal Road', 1)
INSERT [dbo].[AreaMaster] ([AreaId], [AreaName], [CityId]) VALUES (114, N'Ranoli', 1)
INSERT [dbo].[AreaMaster] ([AreaId], [AreaName], [CityId]) VALUES (115, N'Raopura', 1)
INSERT [dbo].[AreaMaster] ([AreaId], [AreaName], [CityId]) VALUES (116, N'Reliance Township', 1)
INSERT [dbo].[AreaMaster] ([AreaId], [AreaName], [CityId]) VALUES (117, N'Salatwada', 1)
INSERT [dbo].[AreaMaster] ([AreaId], [AreaName], [CityId]) VALUES (118, N'Sama', 1)
INSERT [dbo].[AreaMaster] ([AreaId], [AreaName], [CityId]) VALUES (119, N'Sama Savli', 1)
INSERT [dbo].[AreaMaster] ([AreaId], [AreaName], [CityId]) VALUES (120, N'Sama Savli Road', 1)
INSERT [dbo].[AreaMaster] ([AreaId], [AreaName], [CityId]) VALUES (121, N'Samata', 1)
INSERT [dbo].[AreaMaster] ([AreaId], [AreaName], [CityId]) VALUES (122, N'Samiyala', 1)
INSERT [dbo].[AreaMaster] ([AreaId], [AreaName], [CityId]) VALUES (123, N'Sant Kanvar Colony', 1)
INSERT [dbo].[AreaMaster] ([AreaId], [AreaName], [CityId]) VALUES (124, N'Savli', 1)
INSERT [dbo].[AreaMaster] ([AreaId], [AreaName], [CityId]) VALUES (125, N'Sayajigunj', 1)
INSERT [dbo].[AreaMaster] ([AreaId], [AreaName], [CityId]) VALUES (126, N'Sayajipura', 1)
INSERT [dbo].[AreaMaster] ([AreaId], [AreaName], [CityId]) VALUES (127, N'Sevasi', 1)
INSERT [dbo].[AreaMaster] ([AreaId], [AreaName], [CityId]) VALUES (128, N'Sevasi Road', 1)
INSERT [dbo].[AreaMaster] ([AreaId], [AreaName], [CityId]) VALUES (129, N'Sindhrot Village', 1)
INSERT [dbo].[AreaMaster] ([AreaId], [AreaName], [CityId]) VALUES (130, N'Subhanpura', 1)
INSERT [dbo].[AreaMaster] ([AreaId], [AreaName], [CityId]) VALUES (131, N'Sun Pharma Road', 1)
INSERT [dbo].[AreaMaster] ([AreaId], [AreaName], [CityId]) VALUES (132, N'Susen Road', 1)
INSERT [dbo].[AreaMaster] ([AreaId], [AreaName], [CityId]) VALUES (133, N'Tandalja', 1)
INSERT [dbo].[AreaMaster] ([AreaId], [AreaName], [CityId]) VALUES (134, N'Tarsali', 1)
INSERT [dbo].[AreaMaster] ([AreaId], [AreaName], [CityId]) VALUES (135, N'Umeta Village', 1)
INSERT [dbo].[AreaMaster] ([AreaId], [AreaName], [CityId]) VALUES (136, N'Undera', 1)
INSERT [dbo].[AreaMaster] ([AreaId], [AreaName], [CityId]) VALUES (137, N'Vadsar Road', 1)
INSERT [dbo].[AreaMaster] ([AreaId], [AreaName], [CityId]) VALUES (138, N'Varnama', 1)
INSERT [dbo].[AreaMaster] ([AreaId], [AreaName], [CityId]) VALUES (139, N'Vasad', 1)
INSERT [dbo].[AreaMaster] ([AreaId], [AreaName], [CityId]) VALUES (140, N'Vasna Road', 1)
INSERT [dbo].[AreaMaster] ([AreaId], [AreaName], [CityId]) VALUES (141, N'Vidhyut Nagar Colony', 1)
INSERT [dbo].[AreaMaster] ([AreaId], [AreaName], [CityId]) VALUES (142, N'VIP Road', 1)
INSERT [dbo].[AreaMaster] ([AreaId], [AreaName], [CityId]) VALUES (143, N'Virod Village', 1)
INSERT [dbo].[AreaMaster] ([AreaId], [AreaName], [CityId]) VALUES (144, N'Wadi', 1)
INSERT [dbo].[AreaMaster] ([AreaId], [AreaName], [CityId]) VALUES (145, N'Waghodia', 1)
INSERT [dbo].[AreaMaster] ([AreaId], [AreaName], [CityId]) VALUES (146, N'Waghodia Road', 1)
INSERT [dbo].[AreaMaster] ([AreaId], [AreaName], [CityId]) VALUES (147, N'Warasia', 1)
INSERT [dbo].[AreaMaster] ([AreaId], [AreaName], [CityId]) VALUES (148, N'Warasia Ring Road', 1)
SET IDENTITY_INSERT [dbo].[AreaMaster] OFF
SET IDENTITY_INSERT [dbo].[Cart] ON 

INSERT [dbo].[Cart] ([CartId], [UserId], [DateCreated], [IsActive], [IpAddress]) VALUES (1, 1, CAST(N'2016-06-20T00:00:00.000' AS DateTime), 1, N'1.2.3.4')
INSERT [dbo].[Cart] ([CartId], [UserId], [DateCreated], [IsActive], [IpAddress]) VALUES (2, NULL, CAST(N'2016-06-21T10:54:50.630' AS DateTime), 1, N'123.63.65.66')
INSERT [dbo].[Cart] ([CartId], [UserId], [DateCreated], [IsActive], [IpAddress]) VALUES (3, NULL, CAST(N'2016-06-21T12:11:41.563' AS DateTime), 1, N'123.63.65.66')
INSERT [dbo].[Cart] ([CartId], [UserId], [DateCreated], [IsActive], [IpAddress]) VALUES (1003, NULL, CAST(N'2016-06-22T11:38:33.850' AS DateTime), 1, N'123.63.65.66')
INSERT [dbo].[Cart] ([CartId], [UserId], [DateCreated], [IsActive], [IpAddress]) VALUES (1004, NULL, CAST(N'2016-07-09T19:15:13.090' AS DateTime), 1, N'117.207.35.100')
INSERT [dbo].[Cart] ([CartId], [UserId], [DateCreated], [IsActive], [IpAddress]) VALUES (2004, NULL, CAST(N'2016-07-17T12:21:22.897' AS DateTime), 1, N'43.239.217.4')
INSERT [dbo].[Cart] ([CartId], [UserId], [DateCreated], [IsActive], [IpAddress]) VALUES (2005, NULL, CAST(N'2016-07-23T09:05:11.637' AS DateTime), 1, N'117.248.179.5')
INSERT [dbo].[Cart] ([CartId], [UserId], [DateCreated], [IsActive], [IpAddress]) VALUES (2006, NULL, CAST(N'2016-07-23T10:07:35.660' AS DateTime), 1, N'117.198.192.18')
INSERT [dbo].[Cart] ([CartId], [UserId], [DateCreated], [IsActive], [IpAddress]) VALUES (2007, NULL, CAST(N'2016-07-23T11:14:46.010' AS DateTime), 1, N'117.198.192.18')
INSERT [dbo].[Cart] ([CartId], [UserId], [DateCreated], [IsActive], [IpAddress]) VALUES (2008, NULL, CAST(N'2016-07-23T12:23:09.300' AS DateTime), 1, N'117.198.192.18')
INSERT [dbo].[Cart] ([CartId], [UserId], [DateCreated], [IsActive], [IpAddress]) VALUES (2009, NULL, CAST(N'2016-07-23T12:24:32.437' AS DateTime), 1, N'117.198.192.18')
INSERT [dbo].[Cart] ([CartId], [UserId], [DateCreated], [IsActive], [IpAddress]) VALUES (2010, NULL, CAST(N'2016-07-30T16:54:56.113' AS DateTime), 1, N'117.198.207.43')
INSERT [dbo].[Cart] ([CartId], [UserId], [DateCreated], [IsActive], [IpAddress]) VALUES (2011, NULL, CAST(N'2016-07-30T17:32:54.347' AS DateTime), 1, N'117.208.39.107')
INSERT [dbo].[Cart] ([CartId], [UserId], [DateCreated], [IsActive], [IpAddress]) VALUES (3010, NULL, CAST(N'2018-12-22T15:27:26.640' AS DateTime), 1, N'178.62.238.64')
INSERT [dbo].[Cart] ([CartId], [UserId], [DateCreated], [IsActive], [IpAddress]) VALUES (3011, NULL, CAST(N'2018-12-22T15:28:20.937' AS DateTime), 1, N'178.62.238.64')
INSERT [dbo].[Cart] ([CartId], [UserId], [DateCreated], [IsActive], [IpAddress]) VALUES (3012, NULL, CAST(N'2018-12-24T08:54:00.787' AS DateTime), 1, N'146.185.157.242')
INSERT [dbo].[Cart] ([CartId], [UserId], [DateCreated], [IsActive], [IpAddress]) VALUES (3013, NULL, CAST(N'2018-12-24T08:55:50.740' AS DateTime), 1, N'146.185.157.242')
SET IDENTITY_INSERT [dbo].[Cart] OFF
SET IDENTITY_INSERT [dbo].[CityMaster] ON 

INSERT [dbo].[CityMaster] ([CityId], [CityName], [CountryId]) VALUES (1, N'Vadodara', 1)
SET IDENTITY_INSERT [dbo].[CityMaster] OFF
SET IDENTITY_INSERT [dbo].[CountryMaster] ON 

INSERT [dbo].[CountryMaster] ([CountryId], [CountryName]) VALUES (1, N'INDIA')
SET IDENTITY_INSERT [dbo].[CountryMaster] OFF
SET IDENTITY_INSERT [dbo].[MainCategoryMaster] ON 

INSERT [dbo].[MainCategoryMaster] ([MainCategoryId], [Name]) VALUES (10, N'Continental')
INSERT [dbo].[MainCategoryMaster] ([MainCategoryId], [Name]) VALUES (11, N'South Indian')
INSERT [dbo].[MainCategoryMaster] ([MainCategoryId], [Name]) VALUES (12, N'Pan Indian')
INSERT [dbo].[MainCategoryMaster] ([MainCategoryId], [Name]) VALUES (13, N'Desserts')
INSERT [dbo].[MainCategoryMaster] ([MainCategoryId], [Name]) VALUES (14, N'Pan Asian')
SET IDENTITY_INSERT [dbo].[MainCategoryMaster] OFF
SET IDENTITY_INSERT [dbo].[ProductDetails] ON 

INSERT [dbo].[ProductDetails] ([ProductId], [ProductName], [SubCategoryId], [Quantity], [Description], [ImageURL], [PricePerUnit], [Unit], [Status], [IsDeleted], [IsOutOfStock], [IsLimitedStock], [IsSeasonalStock]) VALUES (343, N'SMOKED CORN SOUP', 12, 1, N'SMOKED CORN SOUP', N'media/catalog/product/cache/1/small_image/200x200/9df78eab33525d08d6e5fb8d27136e95/p/i/pinapple.jpg', 45, N'100', 1, 0, 0, 0, 0)
INSERT [dbo].[ProductDetails] ([ProductId], [ProductName], [SubCategoryId], [Quantity], [Description], [ImageURL], [PricePerUnit], [Unit], [Status], [IsDeleted], [IsOutOfStock], [IsLimitedStock], [IsSeasonalStock]) VALUES (344, N'HOT & SOUR SOUP (VEG/CHICKEN)', 12, 1, N'HOT & SOUR SOUP (VEG/CHICKEN)', N'media/catalog/product/cache/1/small_image/200x200/9df78eab33525d08d6e5fb8d27136e95/p/i/pinapple.jpg', 45, N'100', 1, 0, 0, 0, 0)
INSERT [dbo].[ProductDetails] ([ProductId], [ProductName], [SubCategoryId], [Quantity], [Description], [ImageURL], [PricePerUnit], [Unit], [Status], [IsDeleted], [IsOutOfStock], [IsLimitedStock], [IsSeasonalStock]) VALUES (345, N'MANCHOW SOUP (VEG/CHICKEN)', 12, 1, N'MANCHOW SOUP (VEG/CHICKEN)', N'media/catalog/product/cache/1/small_image/200x200/9df78eab33525d08d6e5fb8d27136e95/p/i/pinapple.jpg', 45, N'100', 1, 0, 0, 0, 0)
INSERT [dbo].[ProductDetails] ([ProductId], [ProductName], [SubCategoryId], [Quantity], [Description], [ImageURL], [PricePerUnit], [Unit], [Status], [IsDeleted], [IsOutOfStock], [IsLimitedStock], [IsSeasonalStock]) VALUES (346, N'TOM YUM SOUP (CHICKEN/SHRIMP)', 12, 1, N'TOM YUM SOUP (CHICKEN/SHRIMP)', N'media/catalog/product/cache/1/small_image/200x200/9df78eab33525d08d6e5fb8d27136e95/p/i/pinapple.jpg', 45, N'100', 1, 0, 0, 0, 0)
INSERT [dbo].[ProductDetails] ([ProductId], [ProductName], [SubCategoryId], [Quantity], [Description], [ImageURL], [PricePerUnit], [Unit], [Status], [IsDeleted], [IsOutOfStock], [IsLimitedStock], [IsSeasonalStock]) VALUES (347, N'TOM KHA SOUP (VEG/CHICKEN/SHRIMP)', 12, 1, N'TOM KHA SOUP (VEG/CHICKEN/SHRIMP)', N'media/catalog/product/cache/1/small_image/200x200/9df78eab33525d08d6e5fb8d27136e95/p/i/pinapple.jpg', 25, N'100', 1, 0, 0, 0, 0)
INSERT [dbo].[ProductDetails] ([ProductId], [ProductName], [SubCategoryId], [Quantity], [Description], [ImageURL], [PricePerUnit], [Unit], [Status], [IsDeleted], [IsOutOfStock], [IsLimitedStock], [IsSeasonalStock]) VALUES (362, N'THAI CRISPY VEGETABLE', 12, 1, N'THAI CRISPY VEGETABLE', N'media/catalog/product/cache/1/small_image/200x200/9df78eab33525d08d6e5fb8d27136e95/p/i/pinapple.jpg', 62, N'100', 1, 0, 0, 0, 0)
INSERT [dbo].[ProductDetails] ([ProductId], [ProductName], [SubCategoryId], [Quantity], [Description], [ImageURL], [PricePerUnit], [Unit], [Status], [IsDeleted], [IsOutOfStock], [IsLimitedStock], [IsSeasonalStock]) VALUES (363, N'STUFFED ONION SHELLS', 12, 1, N'STUFFED ONION SHELLS', N'media/catalog/product/cache/1/small_image/200x200/9df78eab33525d08d6e5fb8d27136e95/p/i/pinapple.jpg', 47, N'100', 1, 0, 0, 0, 0)
INSERT [dbo].[ProductDetails] ([ProductId], [ProductName], [SubCategoryId], [Quantity], [Description], [ImageURL], [PricePerUnit], [Unit], [Status], [IsDeleted], [IsOutOfStock], [IsLimitedStock], [IsSeasonalStock]) VALUES (364, N'CHILLY SOY VEG', 12, 1, N'CHILLY SOY VEG', N'media/catalog/product/cache/1/small_image/200x200/9df78eab33525d08d6e5fb8d27136e95/p/i/pinapple.jpg', 96, N'100', 1, 0, 0, 0, 0)
INSERT [dbo].[ProductDetails] ([ProductId], [ProductName], [SubCategoryId], [Quantity], [Description], [ImageURL], [PricePerUnit], [Unit], [Status], [IsDeleted], [IsOutOfStock], [IsLimitedStock], [IsSeasonalStock]) VALUES (365, N'THAI PAI VEG', 12, 1, N'THAI PAI VEG', N'media/catalog/product/cache/1/small_image/200x200/9df78eab33525d08d6e5fb8d27136e95/p/i/pinapple.jpg', 34, N'100', 1, 0, 0, 0, 0)
INSERT [dbo].[ProductDetails] ([ProductId], [ProductName], [SubCategoryId], [Quantity], [Description], [ImageURL], [PricePerUnit], [Unit], [Status], [IsDeleted], [IsOutOfStock], [IsLimitedStock], [IsSeasonalStock]) VALUES (366, N'THE GREAT BALLS OF CHINA (VEG/CHICKEN/FISH)', 12, 1, N'THE GREAT BALLS OF CHINA (VEG/CHICKEN/FISH)', N'media/catalog/product/cache/1/small_image/200x200/9df78eab33525d08d6e5fb8d27136e95/p/i/pinapple.jpg', 77, N'100', 1, 0, 0, 0, 0)
INSERT [dbo].[ProductDetails] ([ProductId], [ProductName], [SubCategoryId], [Quantity], [Description], [ImageURL], [PricePerUnit], [Unit], [Status], [IsDeleted], [IsOutOfStock], [IsLimitedStock], [IsSeasonalStock]) VALUES (367, N'CHINESE SPRING ROLLS (VEG/CHICKEN)', 12, 1, N'CHINESE SPRING ROLLS (VEG/CHICKEN)', N'media/catalog/product/cache/1/small_image/200x200/9df78eab33525d08d6e5fb8d27136e95/p/i/pinapple.jpg', 12, N'100', 1, 0, 0, 0, 0)
INSERT [dbo].[ProductDetails] ([ProductId], [ProductName], [SubCategoryId], [Quantity], [Description], [ImageURL], [PricePerUnit], [Unit], [Status], [IsDeleted], [IsOutOfStock], [IsLimitedStock], [IsSeasonalStock]) VALUES (368, N'TEMPURA (CORN/PRAWN)', 12, 1, N'TEMPURA (CORN/PRAWN)', N'media/catalog/product/cache/1/small_image/200x200/9df78eab33525d08d6e5fb8d27136e95/p/i/pinapple.jpg', 82, N'100', 1, 0, 0, 0, 0)
INSERT [dbo].[ProductDetails] ([ProductId], [ProductName], [SubCategoryId], [Quantity], [Description], [ImageURL], [PricePerUnit], [Unit], [Status], [IsDeleted], [IsOutOfStock], [IsLimitedStock], [IsSeasonalStock]) VALUES (369, N'MOMOS (VEG/CHICKEN/SHRIMP)', 12, 1, N'MOMOS (VEG/CHICKEN/SHRIMP)', N'media/catalog/product/cache/1/small_image/200x200/9df78eab33525d08d6e5fb8d27136e95/p/i/pinapple.jpg', 35, N'100', 1, 0, 0, 0, 0)
INSERT [dbo].[ProductDetails] ([ProductId], [ProductName], [SubCategoryId], [Quantity], [Description], [ImageURL], [PricePerUnit], [Unit], [Status], [IsDeleted], [IsOutOfStock], [IsLimitedStock], [IsSeasonalStock]) VALUES (370, N'POT STICKERS (VEG/CHICKEN/SHRIMP)', 12, 1, N'POT STICKERS (VEG/CHICKEN/SHRIMP)', N'media/catalog/product/cache/1/small_image/200x200/9df78eab33525d08d6e5fb8d27136e95/p/i/pinapple.jpg', 74, N'100', 1, 0, 0, 0, 0)
INSERT [dbo].[ProductDetails] ([ProductId], [ProductName], [SubCategoryId], [Quantity], [Description], [ImageURL], [PricePerUnit], [Unit], [Status], [IsDeleted], [IsOutOfStock], [IsLimitedStock], [IsSeasonalStock]) VALUES (371, N'ASIAN BBQ CHICKEN', 12, 1, N'ASIAN BBQ CHICKEN', N'media/catalog/product/cache/1/small_image/200x200/9df78eab33525d08d6e5fb8d27136e95/p/i/pinapple.jpg', 23, N'100', 1, 0, 0, 0, 0)
INSERT [dbo].[ProductDetails] ([ProductId], [ProductName], [SubCategoryId], [Quantity], [Description], [ImageURL], [PricePerUnit], [Unit], [Status], [IsDeleted], [IsOutOfStock], [IsLimitedStock], [IsSeasonalStock]) VALUES (372, N'PICKLED CHILLY CHICKEN', 12, 1, N'PICKLED CHILLY CHICKEN', N'media/catalog/product/cache/1/small_image/200x200/9df78eab33525d08d6e5fb8d27136e95/p/i/pinapple.jpg', 65, N'100', 1, 0, 0, 0, 0)
INSERT [dbo].[ProductDetails] ([ProductId], [ProductName], [SubCategoryId], [Quantity], [Description], [ImageURL], [PricePerUnit], [Unit], [Status], [IsDeleted], [IsOutOfStock], [IsLimitedStock], [IsSeasonalStock]) VALUES (373, N'BASIL CHILLY SHREDDED CHICKEN', 12, 1, N'BASIL CHILLY SHREDDED CHICKEN', N'media/catalog/product/cache/1/small_image/200x200/9df78eab33525d08d6e5fb8d27136e95/p/i/pinapple.jpg', 23, N'100', 1, 0, 0, 0, 0)
INSERT [dbo].[ProductDetails] ([ProductId], [ProductName], [SubCategoryId], [Quantity], [Description], [ImageURL], [PricePerUnit], [Unit], [Status], [IsDeleted], [IsOutOfStock], [IsLimitedStock], [IsSeasonalStock]) VALUES (374, N'CRISPY SHREDDED LAMB', 12, 1, N'CRISPY SHREDDED LAMB', N'media/catalog/product/cache/1/small_image/200x200/9df78eab33525d08d6e5fb8d27136e95/p/i/pinapple.jpg', 75, N'100', 1, 0, 0, 0, 0)
INSERT [dbo].[ProductDetails] ([ProductId], [ProductName], [SubCategoryId], [Quantity], [Description], [ImageURL], [PricePerUnit], [Unit], [Status], [IsDeleted], [IsOutOfStock], [IsLimitedStock], [IsSeasonalStock]) VALUES (375, N'BANANA LEAF GRILLED FISH', 12, 1, N'BANANA LEAF GRILLED FISH', N'media/catalog/product/cache/1/small_image/200x200/9df78eab33525d08d6e5fb8d27136e95/p/i/pinapple.jpg', 23, N'100', 1, 0, 0, 0, 0)
INSERT [dbo].[ProductDetails] ([ProductId], [ProductName], [SubCategoryId], [Quantity], [Description], [ImageURL], [PricePerUnit], [Unit], [Status], [IsDeleted], [IsOutOfStock], [IsLimitedStock], [IsSeasonalStock]) VALUES (381, N'SOFT', 12, 1, N'SOFT', N'media/catalog/product/cache/1/small_image/200x200/9df78eab33525d08d6e5fb8d27136e95/p/i/pinapple.jpg', 64, N'100', 1, 0, 0, 0, 0)
INSERT [dbo].[ProductDetails] ([ProductId], [ProductName], [SubCategoryId], [Quantity], [Description], [ImageURL], [PricePerUnit], [Unit], [Status], [IsDeleted], [IsOutOfStock], [IsLimitedStock], [IsSeasonalStock]) VALUES (382, N'SCHEZWAN', 12, 1, N'SCHEZWAN', N'media/catalog/product/cache/1/small_image/200x200/9df78eab33525d08d6e5fb8d27136e95/p/i/pinapple.jpg', 16, N'100', 1, 0, 0, 0, 0)
INSERT [dbo].[ProductDetails] ([ProductId], [ProductName], [SubCategoryId], [Quantity], [Description], [ImageURL], [PricePerUnit], [Unit], [Status], [IsDeleted], [IsOutOfStock], [IsLimitedStock], [IsSeasonalStock]) VALUES (383, N'HAKKA', 12, 1, N'HAKKA', N'media/catalog/product/cache/1/small_image/200x200/9df78eab33525d08d6e5fb8d27136e95/p/i/pinapple.jpg', 55, N'100', 1, 0, 0, 0, 0)
INSERT [dbo].[ProductDetails] ([ProductId], [ProductName], [SubCategoryId], [Quantity], [Description], [ImageURL], [PricePerUnit], [Unit], [Status], [IsDeleted], [IsOutOfStock], [IsLimitedStock], [IsSeasonalStock]) VALUES (384, N'SINGAPOREAN RICE VERMICELLI', 12, 1, N'SINGAPOREAN RICE VERMICELLI', N'media/catalog/product/cache/1/small_image/200x200/9df78eab33525d08d6e5fb8d27136e95/p/i/pinapple.jpg', 54, N'100', 1, 0, 0, 0, 0)
INSERT [dbo].[ProductDetails] ([ProductId], [ProductName], [SubCategoryId], [Quantity], [Description], [ImageURL], [PricePerUnit], [Unit], [Status], [IsDeleted], [IsOutOfStock], [IsLimitedStock], [IsSeasonalStock]) VALUES (385, N'PHAD THAI', 12, 1, N'PHAD THAI', N'media/catalog/product/cache/1/small_image/200x200/9df78eab33525d08d6e5fb8d27136e95/p/i/pinapple.jpg', 24, N'100', 1, 0, 0, 0, 0)
INSERT [dbo].[ProductDetails] ([ProductId], [ProductName], [SubCategoryId], [Quantity], [Description], [ImageURL], [PricePerUnit], [Unit], [Status], [IsDeleted], [IsOutOfStock], [IsLimitedStock], [IsSeasonalStock]) VALUES (390, N'FRIED RICE  (THE ORIGINAL/SCHEZWAN/CANTONESE CHILLI)', 12, 1, N'FRIED RICE  (THE ORIGINAL/SCHEZWAN/CANTONESE CHILLI)', N'media/catalog/product/cache/1/small_image/200x200/9df78eab33525d08d6e5fb8d27136e95/p/i/pinapple.jpg', 74, N'100', 1, 0, 0, 0, 0)
INSERT [dbo].[ProductDetails] ([ProductId], [ProductName], [SubCategoryId], [Quantity], [Description], [ImageURL], [PricePerUnit], [Unit], [Status], [IsDeleted], [IsOutOfStock], [IsLimitedStock], [IsSeasonalStock]) VALUES (391, N'NASI GORENG', 12, 1, N'NASI GORENG', N'media/catalog/product/cache/1/small_image/200x200/9df78eab33525d08d6e5fb8d27136e95/p/i/pinapple.jpg', 84, N'100', 1, 0, 0, 0, 0)
INSERT [dbo].[ProductDetails] ([ProductId], [ProductName], [SubCategoryId], [Quantity], [Description], [ImageURL], [PricePerUnit], [Unit], [Status], [IsDeleted], [IsOutOfStock], [IsLimitedStock], [IsSeasonalStock]) VALUES (392, N'CHAMPIONS FRIED RICE (CHEF''S SPECIAL)', 12, 1, N'CHAMPIONS FRIED RICE (CHEF''S SPECIAL)', N'media/catalog/product/cache/1/small_image/200x200/9df78eab33525d08d6e5fb8d27136e95/p/i/pinapple.jpg', 23, N'100', 1, 0, 0, 0, 0)
INSERT [dbo].[ProductDetails] ([ProductId], [ProductName], [SubCategoryId], [Quantity], [Description], [ImageURL], [PricePerUnit], [Unit], [Status], [IsDeleted], [IsOutOfStock], [IsLimitedStock], [IsSeasonalStock]) VALUES (393, N'THAI JASMINE RICE', 12, 1, N'THAI JASMINE RICE', N'media/catalog/product/cache/1/small_image/200x200/9df78eab33525d08d6e5fb8d27136e95/p/i/pinapple.jpg', 54, N'100', 1, 0, 0, 0, 0)
INSERT [dbo].[ProductDetails] ([ProductId], [ProductName], [SubCategoryId], [Quantity], [Description], [ImageURL], [PricePerUnit], [Unit], [Status], [IsDeleted], [IsOutOfStock], [IsLimitedStock], [IsSeasonalStock]) VALUES (404, N'STIR FRIED VEGETABLE IN CARAMELISED GARLIC', 12, 1, N'STIR FRIED VEGETABLE IN CARAMELISED GARLIC', N'media/catalog/product/cache/1/small_image/200x200/9df78eab33525d08d6e5fb8d27136e95/p/i/pinapple.jpg', 27, N'100', 1, 0, 0, 0, 0)
INSERT [dbo].[ProductDetails] ([ProductId], [ProductName], [SubCategoryId], [Quantity], [Description], [ImageURL], [PricePerUnit], [Unit], [Status], [IsDeleted], [IsOutOfStock], [IsLimitedStock], [IsSeasonalStock]) VALUES (405, N'CRISPY FRIED VEGETABLE IN THAI CHILLI & BASIL', 12, 1, N'CRISPY FRIED VEGETABLE IN THAI CHILLI & BASIL', N'media/catalog/product/cache/1/small_image/200x200/9df78eab33525d08d6e5fb8d27136e95/p/i/pinapple.jpg', 34, N'100', 1, 0, 0, 0, 0)
INSERT [dbo].[ProductDetails] ([ProductId], [ProductName], [SubCategoryId], [Quantity], [Description], [ImageURL], [PricePerUnit], [Unit], [Status], [IsDeleted], [IsOutOfStock], [IsLimitedStock], [IsSeasonalStock]) VALUES (406, N'BRAISED POKCHOY SHITAKE MUSHROOM', 12, 1, N'BRAISED POKCHOY SHITAKE MUSHROOM', N'media/catalog/product/cache/1/small_image/200x200/9df78eab33525d08d6e5fb8d27136e95/p/i/pinapple.jpg', 66, N'100', 1, 0, 0, 0, 0)
INSERT [dbo].[ProductDetails] ([ProductId], [ProductName], [SubCategoryId], [Quantity], [Description], [ImageURL], [PricePerUnit], [Unit], [Status], [IsDeleted], [IsOutOfStock], [IsLimitedStock], [IsSeasonalStock]) VALUES (407, N'BABYCORN  & WATER CHESTNUT IN  SUNDRIED TOMATO', 12, 1, N'BABYCORN  & WATER CHESTNUT IN  SUNDRIED TOMATO', N'media/catalog/product/cache/1/small_image/200x200/9df78eab33525d08d6e5fb8d27136e95/p/i/pinapple.jpg', 25, N'100', 1, 0, 0, 0, 0)
INSERT [dbo].[ProductDetails] ([ProductId], [ProductName], [SubCategoryId], [Quantity], [Description], [ImageURL], [PricePerUnit], [Unit], [Status], [IsDeleted], [IsOutOfStock], [IsLimitedStock], [IsSeasonalStock]) VALUES (408, N'GAZI NAMUL', 12, 1, N'GAZI NAMUL', N'media/catalog/product/cache/1/small_image/200x200/9df78eab33525d08d6e5fb8d27136e95/p/i/pinapple.jpg', 64, N'100', 1, 0, 0, 0, 0)
INSERT [dbo].[ProductDetails] ([ProductId], [ProductName], [SubCategoryId], [Quantity], [Description], [ImageURL], [PricePerUnit], [Unit], [Status], [IsDeleted], [IsOutOfStock], [IsLimitedStock], [IsSeasonalStock]) VALUES (409, N'CRISPY CHICKEN  IN BLACK PEPPER', 12, 1, N'CRISPY CHICKEN  IN BLACK PEPPER', N'media/catalog/product/cache/1/small_image/200x200/9df78eab33525d08d6e5fb8d27136e95/p/i/pinapple.jpg', 35, N'100', 1, 0, 0, 0, 0)
INSERT [dbo].[ProductDetails] ([ProductId], [ProductName], [SubCategoryId], [Quantity], [Description], [ImageURL], [PricePerUnit], [Unit], [Status], [IsDeleted], [IsOutOfStock], [IsLimitedStock], [IsSeasonalStock]) VALUES (410, N'CHILLI CUMIN FISH', 12, 1, N'CHILLI CUMIN FISH', N'media/catalog/product/cache/1/small_image/200x200/9df78eab33525d08d6e5fb8d27136e95/p/i/pinapple.jpg', 74, N'100', 1, 0, 0, 0, 0)
INSERT [dbo].[ProductDetails] ([ProductId], [ProductName], [SubCategoryId], [Quantity], [Description], [ImageURL], [PricePerUnit], [Unit], [Status], [IsDeleted], [IsOutOfStock], [IsLimitedStock], [IsSeasonalStock]) VALUES (411, N'FISH FILLET  IN CHILLI BEAN', 12, 1, N'FISH FILLET  IN CHILLI BEAN', N'media/catalog/product/cache/1/small_image/200x200/9df78eab33525d08d6e5fb8d27136e95/p/i/pinapple.jpg', 25, N'100', 1, 0, 0, 0, 0)
INSERT [dbo].[ProductDetails] ([ProductId], [ProductName], [SubCategoryId], [Quantity], [Description], [ImageURL], [PricePerUnit], [Unit], [Status], [IsDeleted], [IsOutOfStock], [IsLimitedStock], [IsSeasonalStock]) VALUES (412, N'THAI RED CURRY (VEG/CHICKEN)', 12, 1, N'THAI RED CURRY (VEG/CHICKEN)', N'media/catalog/product/cache/1/small_image/200x200/9df78eab33525d08d6e5fb8d27136e95/p/i/pinapple.jpg', 64, N'100', 1, 0, 0, 0, 0)
INSERT [dbo].[ProductDetails] ([ProductId], [ProductName], [SubCategoryId], [Quantity], [Description], [ImageURL], [PricePerUnit], [Unit], [Status], [IsDeleted], [IsOutOfStock], [IsLimitedStock], [IsSeasonalStock]) VALUES (413, N'THAI GREEN CURRY (VEG/CHICKEN)', 12, 1, N'THAI GREEN CURRY (VEG/CHICKEN)', N'media/catalog/product/cache/1/small_image/200x200/9df78eab33525d08d6e5fb8d27136e95/p/i/pinapple.jpg', 46, N'100', 1, 0, 0, 0, 0)
SET IDENTITY_INSERT [dbo].[ProductDetails] OFF
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([RoleId], [RoleName]) VALUES (1, N'Admin')
INSERT [dbo].[Roles] ([RoleId], [RoleName]) VALUES (2, N'User')
SET IDENTITY_INSERT [dbo].[Roles] OFF
SET IDENTITY_INSERT [dbo].[SubCategoryMaster] ON 

INSERT [dbo].[SubCategoryMaster] ([SubCategoryId], [MainCategoryId], [Name], [ImageURL]) VALUES (12, 12, N'Soup', N'media/catalog/product/cache/1/small_image/200x200/9df78eab33525d08d6e5fb8d27136e95/p/i/pinapple.jpg')
INSERT [dbo].[SubCategoryMaster] ([SubCategoryId], [MainCategoryId], [Name], [ImageURL]) VALUES (13, 12, N'Starters', N'media/catalog/product/cache/1/small_image/200x200/9df78eab33525d08d6e5fb8d27136e95/p/i/pinapple.jpg')
INSERT [dbo].[SubCategoryMaster] ([SubCategoryId], [MainCategoryId], [Name], [ImageURL]) VALUES (14, 12, N'Mains', N'media/catalog/product/cache/1/small_image/200x200/9df78eab33525d08d6e5fb8d27136e95/p/i/pinapple.jpg')
INSERT [dbo].[SubCategoryMaster] ([SubCategoryId], [MainCategoryId], [Name], [ImageURL]) VALUES (15, 12, N'Rice', N'media/catalog/product/cache/1/small_image/200x200/9df78eab33525d08d6e5fb8d27136e95/p/i/pinapple.jpg')
INSERT [dbo].[SubCategoryMaster] ([SubCategoryId], [MainCategoryId], [Name], [ImageURL]) VALUES (16, 12, N'Side', N'media/catalog/product/cache/1/small_image/200x200/9df78eab33525d08d6e5fb8d27136e95/p/i/pinapple.jpg')
INSERT [dbo].[SubCategoryMaster] ([SubCategoryId], [MainCategoryId], [Name], [ImageURL]) VALUES (17, 10, N'Soup', N'media/catalog/product/cache/1/small_image/200x200/9df78eab33525d08d6e5fb8d27136e95/p/i/pinapple.jpg')
INSERT [dbo].[SubCategoryMaster] ([SubCategoryId], [MainCategoryId], [Name], [ImageURL]) VALUES (18, 10, N'Starters', N'media/catalog/product/cache/1/small_image/200x200/9df78eab33525d08d6e5fb8d27136e95/p/i/pinapple.jpg')
INSERT [dbo].[SubCategoryMaster] ([SubCategoryId], [MainCategoryId], [Name], [ImageURL]) VALUES (19, 10, N'Pastas', N'media/catalog/product/cache/1/small_image/200x200/9df78eab33525d08d6e5fb8d27136e95/p/i/pinapple.jpg')
INSERT [dbo].[SubCategoryMaster] ([SubCategoryId], [MainCategoryId], [Name], [ImageURL]) VALUES (20, 10, N'Sizzlers', N'media/catalog/product/cache/1/small_image/200x200/9df78eab33525d08d6e5fb8d27136e95/p/i/pinapple.jpg')
INSERT [dbo].[SubCategoryMaster] ([SubCategoryId], [MainCategoryId], [Name], [ImageURL]) VALUES (21, 10, N'Pizza', N'media/catalog/product/cache/1/small_image/200x200/9df78eab33525d08d6e5fb8d27136e95/p/i/pinapple.jpg')
INSERT [dbo].[SubCategoryMaster] ([SubCategoryId], [MainCategoryId], [Name], [ImageURL]) VALUES (22, 11, N'Rasam', N'media/catalog/product/cache/1/small_image/200x200/9df78eab33525d08d6e5fb8d27136e95/p/i/pinapple.jpg')
INSERT [dbo].[SubCategoryMaster] ([SubCategoryId], [MainCategoryId], [Name], [ImageURL]) VALUES (23, 11, N'Starters - veg', N'media/catalog/product/cache/1/small_image/200x200/9df78eab33525d08d6e5fb8d27136e95/p/i/pinapple.jpg')
INSERT [dbo].[SubCategoryMaster] ([SubCategoryId], [MainCategoryId], [Name], [ImageURL]) VALUES (24, 11, N'Starters -non-veg', N'media/catalog/product/cache/1/small_image/200x200/9df78eab33525d08d6e5fb8d27136e95/p/i/pinapple.jpg')
INSERT [dbo].[SubCategoryMaster] ([SubCategoryId], [MainCategoryId], [Name], [ImageURL]) VALUES (25, 11, N'Kodi/chicken', N'media/catalog/product/cache/1/small_image/200x200/9df78eab33525d08d6e5fb8d27136e95/p/i/pinapple.jpg')
INSERT [dbo].[SubCategoryMaster] ([SubCategoryId], [MainCategoryId], [Name], [ImageURL]) VALUES (26, 11, N'Chepa/fish', N'media/catalog/product/cache/1/small_image/200x200/9df78eab33525d08d6e5fb8d27136e95/p/i/pinapple.jpg')
INSERT [dbo].[SubCategoryMaster] ([SubCategoryId], [MainCategoryId], [Name], [ImageURL]) VALUES (27, 11, N'Mamsam/mutton', N'media/catalog/product/cache/1/small_image/200x200/9df78eab33525d08d6e5fb8d27136e95/p/i/pinapple.jpg')
INSERT [dbo].[SubCategoryMaster] ([SubCategoryId], [MainCategoryId], [Name], [ImageURL]) VALUES (28, 11, N'Steamed rice', N'media/catalog/product/cache/1/small_image/200x200/9df78eab33525d08d6e5fb8d27136e95/p/i/pinapple.jpg')
INSERT [dbo].[SubCategoryMaster] ([SubCategoryId], [MainCategoryId], [Name], [ImageURL]) VALUES (29, 12, N'Shorba', N'media/catalog/product/cache/1/small_image/200x200/9df78eab33525d08d6e5fb8d27136e95/p/i/pinapple.jpg')
INSERT [dbo].[SubCategoryMaster] ([SubCategoryId], [MainCategoryId], [Name], [ImageURL]) VALUES (30, 12, N'Starters-veg', N'media/catalog/product/cache/1/small_image/200x200/9df78eab33525d08d6e5fb8d27136e95/p/i/pinapple.jpg')
INSERT [dbo].[SubCategoryMaster] ([SubCategoryId], [MainCategoryId], [Name], [ImageURL]) VALUES (31, 12, N'Starters – non-veg', N'media/catalog/product/cache/1/small_image/200x200/9df78eab33525d08d6e5fb8d27136e95/p/i/pinapple.jpg')
INSERT [dbo].[SubCategoryMaster] ([SubCategoryId], [MainCategoryId], [Name], [ImageURL]) VALUES (32, 12, N'Sides - veg', N'media/catalog/product/cache/1/small_image/200x200/9df78eab33525d08d6e5fb8d27136e95/p/i/pinapple.jpg')
INSERT [dbo].[SubCategoryMaster] ([SubCategoryId], [MainCategoryId], [Name], [ImageURL]) VALUES (33, 12, N'Dal', N'media/catalog/product/cache/1/small_image/200x200/9df78eab33525d08d6e5fb8d27136e95/p/i/pinapple.jpg')
INSERT [dbo].[SubCategoryMaster] ([SubCategoryId], [MainCategoryId], [Name], [ImageURL]) VALUES (34, 12, N'Sides - non veg', N'media/catalog/product/cache/1/small_image/200x200/9df78eab33525d08d6e5fb8d27136e95/p/i/pinapple.jpg')
INSERT [dbo].[SubCategoryMaster] ([SubCategoryId], [MainCategoryId], [Name], [ImageURL]) VALUES (35, 13, N'Pan asian', N'media/catalog/product/cache/1/small_image/200x200/9df78eab33525d08d6e5fb8d27136e95/p/i/pinapple.jpg')
INSERT [dbo].[SubCategoryMaster] ([SubCategoryId], [MainCategoryId], [Name], [ImageURL]) VALUES (36, 13, N'Continental', N'media/catalog/product/cache/1/small_image/200x200/9df78eab33525d08d6e5fb8d27136e95/p/i/pinapple.jpg')
INSERT [dbo].[SubCategoryMaster] ([SubCategoryId], [MainCategoryId], [Name], [ImageURL]) VALUES (37, 13, N'South indian', N'media/catalog/product/cache/1/small_image/200x200/9df78eab33525d08d6e5fb8d27136e95/p/i/pinapple.jpg')
INSERT [dbo].[SubCategoryMaster] ([SubCategoryId], [MainCategoryId], [Name], [ImageURL]) VALUES (38, 13, N'Pan indian', N'media/catalog/product/cache/1/small_image/200x200/9df78eab33525d08d6e5fb8d27136e95/p/i/pinapple.jpg')
INSERT [dbo].[SubCategoryMaster] ([SubCategoryId], [MainCategoryId], [Name], [ImageURL]) VALUES (39, 14, N'Soup', N'media/catalog/product/cache/1/small_image/200x200/9df78eab33525d08d6e5fb8d27136e95/p/i/pinapple.jpg')
INSERT [dbo].[SubCategoryMaster] ([SubCategoryId], [MainCategoryId], [Name], [ImageURL]) VALUES (40, 14, N'Starters', N'media/catalog/product/cache/1/small_image/200x200/9df78eab33525d08d6e5fb8d27136e95/p/i/pinapple.jpg')
INSERT [dbo].[SubCategoryMaster] ([SubCategoryId], [MainCategoryId], [Name], [ImageURL]) VALUES (41, 14, N'Mains', N'media/catalog/product/cache/1/small_image/200x200/9df78eab33525d08d6e5fb8d27136e95/p/i/pinapple.jpg')
INSERT [dbo].[SubCategoryMaster] ([SubCategoryId], [MainCategoryId], [Name], [ImageURL]) VALUES (42, 14, N'Rice', N'media/catalog/product/cache/1/small_image/200x200/9df78eab33525d08d6e5fb8d27136e95/p/i/pinapple.jpg')
INSERT [dbo].[SubCategoryMaster] ([SubCategoryId], [MainCategoryId], [Name], [ImageURL]) VALUES (43, 14, N'Side', N'media/catalog/product/cache/1/small_image/200x200/9df78eab33525d08d6e5fb8d27136e95/p/i/pinapple.jpg')
SET IDENTITY_INSERT [dbo].[SubCategoryMaster] OFF
SET IDENTITY_INSERT [dbo].[SubSubCategoryMaster] ON 

INSERT [dbo].[SubSubCategoryMaster] ([SubSubCategoryId], [SubCategoryId], [Name]) VALUES (12, 12, N'SMOKED CORN SOUP')
INSERT [dbo].[SubSubCategoryMaster] ([SubSubCategoryId], [SubCategoryId], [Name]) VALUES (13, 12, N'HOT & SOUR SOUP (VEG/CHICKEN)')
INSERT [dbo].[SubSubCategoryMaster] ([SubSubCategoryId], [SubCategoryId], [Name]) VALUES (14, 12, N'MANCHOW SOUP (VEG/CHICKEN)')
INSERT [dbo].[SubSubCategoryMaster] ([SubSubCategoryId], [SubCategoryId], [Name]) VALUES (15, 12, N'TOM YUM SOUP (CHICKEN/SHRIMP)')
INSERT [dbo].[SubSubCategoryMaster] ([SubSubCategoryId], [SubCategoryId], [Name]) VALUES (16, 12, N'TOM KHA SOUP (VEG/CHICKEN/SHRIMP)')
INSERT [dbo].[SubSubCategoryMaster] ([SubSubCategoryId], [SubCategoryId], [Name]) VALUES (45, 13, N'THAI CRISPY VEGETABLE')
INSERT [dbo].[SubSubCategoryMaster] ([SubSubCategoryId], [SubCategoryId], [Name]) VALUES (46, 13, N'STUFFED ONION SHELLS')
INSERT [dbo].[SubSubCategoryMaster] ([SubSubCategoryId], [SubCategoryId], [Name]) VALUES (47, 13, N'CHILLY SOY VEG')
INSERT [dbo].[SubSubCategoryMaster] ([SubSubCategoryId], [SubCategoryId], [Name]) VALUES (48, 13, N'THAI PAI VEG')
INSERT [dbo].[SubSubCategoryMaster] ([SubSubCategoryId], [SubCategoryId], [Name]) VALUES (49, 13, N'THE GREAT BALLS OF CHINA (VEG/CHICKEN/FISH)')
INSERT [dbo].[SubSubCategoryMaster] ([SubSubCategoryId], [SubCategoryId], [Name]) VALUES (50, 13, N'CHINESE SPRING ROLLS (VEG/CHICKEN)')
INSERT [dbo].[SubSubCategoryMaster] ([SubSubCategoryId], [SubCategoryId], [Name]) VALUES (51, 13, N'TEMPURA (CORN/PRAWN)')
INSERT [dbo].[SubSubCategoryMaster] ([SubSubCategoryId], [SubCategoryId], [Name]) VALUES (52, 13, N'MOMOS (VEG/CHICKEN/SHRIMP)')
INSERT [dbo].[SubSubCategoryMaster] ([SubSubCategoryId], [SubCategoryId], [Name]) VALUES (53, 13, N'POT STICKERS (VEG/CHICKEN/SHRIMP)')
INSERT [dbo].[SubSubCategoryMaster] ([SubSubCategoryId], [SubCategoryId], [Name]) VALUES (54, 13, N'ASIAN BBQ CHICKEN')
INSERT [dbo].[SubSubCategoryMaster] ([SubSubCategoryId], [SubCategoryId], [Name]) VALUES (55, 13, N'PICKLED CHILLY CHICKEN')
INSERT [dbo].[SubSubCategoryMaster] ([SubSubCategoryId], [SubCategoryId], [Name]) VALUES (56, 13, N'BASIL CHILLY SHREDDED CHICKEN')
INSERT [dbo].[SubSubCategoryMaster] ([SubSubCategoryId], [SubCategoryId], [Name]) VALUES (57, 13, N'CRISPY SHREDDED LAMB')
INSERT [dbo].[SubSubCategoryMaster] ([SubSubCategoryId], [SubCategoryId], [Name]) VALUES (58, 13, N'BANANA LEAF GRILLED FISH')
INSERT [dbo].[SubSubCategoryMaster] ([SubSubCategoryId], [SubCategoryId], [Name]) VALUES (65, 14, N'NOODLES (VEG/CHICKEN/SEA FOOD)')
INSERT [dbo].[SubSubCategoryMaster] ([SubSubCategoryId], [SubCategoryId], [Name]) VALUES (66, 14, N'SOFT')
INSERT [dbo].[SubSubCategoryMaster] ([SubSubCategoryId], [SubCategoryId], [Name]) VALUES (67, 14, N'SCHEZWAN ')
INSERT [dbo].[SubSubCategoryMaster] ([SubSubCategoryId], [SubCategoryId], [Name]) VALUES (68, 14, N'HAKKA')
INSERT [dbo].[SubSubCategoryMaster] ([SubSubCategoryId], [SubCategoryId], [Name]) VALUES (69, 14, N'SINGAPOREAN RICE VERMICELLI')
INSERT [dbo].[SubSubCategoryMaster] ([SubSubCategoryId], [SubCategoryId], [Name]) VALUES (70, 14, N'PHAD THAI')
INSERT [dbo].[SubSubCategoryMaster] ([SubSubCategoryId], [SubCategoryId], [Name]) VALUES (75, 15, N'FRIED RICE  (THE ORIGINAL/SCHEZWAN/CANTONESE CHILLI)')
INSERT [dbo].[SubSubCategoryMaster] ([SubSubCategoryId], [SubCategoryId], [Name]) VALUES (76, 15, N'NASI GORENG')
INSERT [dbo].[SubSubCategoryMaster] ([SubSubCategoryId], [SubCategoryId], [Name]) VALUES (77, 15, N'CHAMPIONS FRIED RICE (CHEF''S SPECIAL)')
INSERT [dbo].[SubSubCategoryMaster] ([SubSubCategoryId], [SubCategoryId], [Name]) VALUES (78, 15, N'THAI JASMINE RICE')
INSERT [dbo].[SubSubCategoryMaster] ([SubSubCategoryId], [SubCategoryId], [Name]) VALUES (89, 16, N'STIR FRIED VEGETABLE IN CARAMELISED GARLIC')
INSERT [dbo].[SubSubCategoryMaster] ([SubSubCategoryId], [SubCategoryId], [Name]) VALUES (90, 16, N'CRISPY FRIED VEGETABLE IN THAI CHILLI & BASIL')
INSERT [dbo].[SubSubCategoryMaster] ([SubSubCategoryId], [SubCategoryId], [Name]) VALUES (91, 16, N'BRAISED POKCHOY SHITAKE MUSHROOM')
INSERT [dbo].[SubSubCategoryMaster] ([SubSubCategoryId], [SubCategoryId], [Name]) VALUES (92, 16, N'BABYCORN  & WATER CHESTNUT IN  SUNDRIED TOMATO')
INSERT [dbo].[SubSubCategoryMaster] ([SubSubCategoryId], [SubCategoryId], [Name]) VALUES (93, 16, N'GAZI NAMUL')
INSERT [dbo].[SubSubCategoryMaster] ([SubSubCategoryId], [SubCategoryId], [Name]) VALUES (94, 16, N'CRISPY CHICKEN  IN BLACK PEPPER')
INSERT [dbo].[SubSubCategoryMaster] ([SubSubCategoryId], [SubCategoryId], [Name]) VALUES (95, 16, N'CHILLI CUMIN FISH')
INSERT [dbo].[SubSubCategoryMaster] ([SubSubCategoryId], [SubCategoryId], [Name]) VALUES (96, 16, N'FISH FILLET  IN CHILLI BEAN')
INSERT [dbo].[SubSubCategoryMaster] ([SubSubCategoryId], [SubCategoryId], [Name]) VALUES (97, 16, N'THAI RED CURRY (VEG/CHICKEN)')
INSERT [dbo].[SubSubCategoryMaster] ([SubSubCategoryId], [SubCategoryId], [Name]) VALUES (98, 16, N'THAI GREEN CURRY (VEG/CHICKEN)')
SET IDENTITY_INSERT [dbo].[SubSubCategoryMaster] OFF
SET IDENTITY_INSERT [dbo].[TransactionDetails] ON 

INSERT [dbo].[TransactionDetails] ([TransactionId], [UserId], [TransactionDate], [ConfirmationDate], [IsConfirm], [PGTransactionId], [InvoiceId], [Custom], [Custom1], [CartId]) VALUES (1, 1, CAST(N'2016-06-20T14:48:38.747' AS DateTime), NULL, 0, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[TransactionDetails] ([TransactionId], [UserId], [TransactionDate], [ConfirmationDate], [IsConfirm], [PGTransactionId], [InvoiceId], [Custom], [Custom1], [CartId]) VALUES (2, 2, CAST(N'2016-07-23T11:14:45.020' AS DateTime), NULL, 0, NULL, NULL, NULL, NULL, 2006)
INSERT [dbo].[TransactionDetails] ([TransactionId], [UserId], [TransactionDate], [ConfirmationDate], [IsConfirm], [PGTransactionId], [InvoiceId], [Custom], [Custom1], [CartId]) VALUES (3, 2, CAST(N'2016-07-23T12:23:08.650' AS DateTime), NULL, 0, NULL, NULL, NULL, NULL, 2007)
INSERT [dbo].[TransactionDetails] ([TransactionId], [UserId], [TransactionDate], [ConfirmationDate], [IsConfirm], [PGTransactionId], [InvoiceId], [Custom], [Custom1], [CartId]) VALUES (4, 2, CAST(N'2016-07-23T12:24:19.897' AS DateTime), NULL, 0, NULL, NULL, NULL, NULL, 2008)
SET IDENTITY_INSERT [dbo].[TransactionDetails] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserId], [RoleId], [UserName], [Password], [FirstName], [LastName], [EmailId], [MobileNumber], [AlternateNumber], [IsFollowUp], [IPAddres], [RegistrationDate], [Status], [LastLoginDate], [ActivationCode], [IsDeleted]) VALUES (1, 1, N'abc', N'abc', N'abc', N'abc', N'abc@gmail.com', N'9999999999', NULL, 0, N'::1', CAST(N'2016-05-18T12:48:39.467' AS DateTime), 1, CAST(N'2018-12-28T21:10:23.703' AS DateTime), NULL, 0)
INSERT [dbo].[Users] ([UserId], [RoleId], [UserName], [Password], [FirstName], [LastName], [EmailId], [MobileNumber], [AlternateNumber], [IsFollowUp], [IPAddres], [RegistrationDate], [Status], [LastLoginDate], [ActivationCode], [IsDeleted]) VALUES (2, 2, N'ali', N'ali1', N'aliabbas', N'vohra', N'aav@gmail.com', N'5852125254', N'1252125474', 0, N'::1', CAST(N'2016-05-30T16:00:43.027' AS DateTime), 1, CAST(N'2018-12-27T17:52:10.477' AS DateTime), NULL, 0)
SET IDENTITY_INSERT [dbo].[Users] OFF
ALTER TABLE [dbo].[AddressDetails] ADD  CONSTRAINT [DF_AddressDetails_AddressTypeId]  DEFAULT ((1)) FOR [AddressTypeId]
GO
ALTER TABLE [dbo].[Cart] ADD  CONSTRAINT [DF_Cart_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [dbo].[Cart] ADD  CONSTRAINT [DF_Cart_IsActive]  DEFAULT ((0)) FOR [IsActive]
GO
ALTER TABLE [dbo].[CartDetail] ADD  CONSTRAINT [DF_CartDetail_Timestamp]  DEFAULT (getdate()) FOR [Timestamp]
GO
ALTER TABLE [dbo].[CartDetail] ADD  CONSTRAINT [DF_CardDetail_IsActive]  DEFAULT ((0)) FOR [IsActive]
GO
ALTER TABLE [dbo].[CouponDetails] ADD  CONSTRAINT [DF_CouponDetails_ExpDate]  DEFAULT (getdate()) FOR [ExpDate]
GO
ALTER TABLE [dbo].[CouponDetails] ADD  CONSTRAINT [DF_CouponDetails_Status]  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [dbo].[CouponDetails] ADD  CONSTRAINT [DF_CouponDetails_DiscountPer]  DEFAULT ((0)) FOR [DiscountPer]
GO
ALTER TABLE [dbo].[ProductDetails] ADD  CONSTRAINT [DF_ProductDetails_Quantity]  DEFAULT ((1)) FOR [Quantity]
GO
ALTER TABLE [dbo].[ProductDetails] ADD  CONSTRAINT [DF_ProductDetails_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[ProductDetails] ADD  CONSTRAINT [DF_ProductDetails_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[ProductDetails] ADD  CONSTRAINT [DF_ProductDetails_IsOutOfStock]  DEFAULT ((0)) FOR [IsOutOfStock]
GO
ALTER TABLE [dbo].[ProductDetails] ADD  CONSTRAINT [DF_ProductDetails_IsLimitedStock]  DEFAULT ((0)) FOR [IsLimitedStock]
GO
ALTER TABLE [dbo].[ProductDetails] ADD  CONSTRAINT [DF_ProductDetails_IsSeasonalStock]  DEFAULT ((0)) FOR [IsSeasonalStock]
GO
ALTER TABLE [dbo].[TransactionDetails] ADD  CONSTRAINT [DF_TransactionDetails_TransactionDate]  DEFAULT (getdate()) FOR [TransactionDate]
GO
ALTER TABLE [dbo].[TransactionDetails] ADD  CONSTRAINT [DF_TransactionDetails_IsConfirm]  DEFAULT ((0)) FOR [IsConfirm]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_IsFollowUp]  DEFAULT ((0)) FOR [IsFollowUp]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_RegistrationDate]  DEFAULT (getdate()) FOR [RegistrationDate]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[AddressDetails]  WITH CHECK ADD  CONSTRAINT [FK_AddressDetails_AreaMaster] FOREIGN KEY([AreaId])
REFERENCES [dbo].[AreaMaster] ([AreaId])
GO
ALTER TABLE [dbo].[AddressDetails] CHECK CONSTRAINT [FK_AddressDetails_AreaMaster]
GO
ALTER TABLE [dbo].[AddressDetails]  WITH CHECK ADD  CONSTRAINT [FK_AddressDetails_CityMaster] FOREIGN KEY([CityId])
REFERENCES [dbo].[CityMaster] ([CityId])
GO
ALTER TABLE [dbo].[AddressDetails] CHECK CONSTRAINT [FK_AddressDetails_CityMaster]
GO
ALTER TABLE [dbo].[AddressDetails]  WITH CHECK ADD  CONSTRAINT [FK_AddressDetails_CountryMaster] FOREIGN KEY([CountryId])
REFERENCES [dbo].[CountryMaster] ([CountryId])
GO
ALTER TABLE [dbo].[AddressDetails] CHECK CONSTRAINT [FK_AddressDetails_CountryMaster]
GO
ALTER TABLE [dbo].[AddressDetails]  WITH CHECK ADD  CONSTRAINT [FK_AddressDetails_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[AddressDetails] CHECK CONSTRAINT [FK_AddressDetails_Users]
GO
ALTER TABLE [dbo].[AreaMaster]  WITH CHECK ADD  CONSTRAINT [FK_AreaMaster_CityMaster] FOREIGN KEY([CityId])
REFERENCES [dbo].[CityMaster] ([CityId])
GO
ALTER TABLE [dbo].[AreaMaster] CHECK CONSTRAINT [FK_AreaMaster_CityMaster]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_Users]
GO
ALTER TABLE [dbo].[CartDetail]  WITH CHECK ADD  CONSTRAINT [FK_CardDetail_Cart] FOREIGN KEY([CartId])
REFERENCES [dbo].[Cart] ([CartId])
GO
ALTER TABLE [dbo].[CartDetail] CHECK CONSTRAINT [FK_CardDetail_Cart]
GO
ALTER TABLE [dbo].[CartDetail]  WITH CHECK ADD  CONSTRAINT [FK_CartDetail_ProductDetails] FOREIGN KEY([ProductId])
REFERENCES [dbo].[ProductDetails] ([ProductId])
GO
ALTER TABLE [dbo].[CartDetail] CHECK CONSTRAINT [FK_CartDetail_ProductDetails]
GO
ALTER TABLE [dbo].[CityMaster]  WITH CHECK ADD  CONSTRAINT [FK_CityMaster_CountryMaster] FOREIGN KEY([CountryId])
REFERENCES [dbo].[CountryMaster] ([CountryId])
GO
ALTER TABLE [dbo].[CityMaster] CHECK CONSTRAINT [FK_CityMaster_CountryMaster]
GO
ALTER TABLE [dbo].[FollowUpDetails]  WITH CHECK ADD  CONSTRAINT [FK_FollowUpDetails_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[FollowUpDetails] CHECK CONSTRAINT [FK_FollowUpDetails_Users]
GO
ALTER TABLE [dbo].[ProductDetails]  WITH NOCHECK ADD  CONSTRAINT [FK_ProductDetails_SubCategoryMaster] FOREIGN KEY([SubCategoryId])
REFERENCES [dbo].[SubCategoryMaster] ([SubCategoryId])
GO
ALTER TABLE [dbo].[ProductDetails] CHECK CONSTRAINT [FK_ProductDetails_SubCategoryMaster]
GO
ALTER TABLE [dbo].[SubCategoryMaster]  WITH CHECK ADD  CONSTRAINT [FK_SubCategoryMaster_MainCategoryMaster] FOREIGN KEY([MainCategoryId])
REFERENCES [dbo].[MainCategoryMaster] ([MainCategoryId])
GO
ALTER TABLE [dbo].[SubCategoryMaster] CHECK CONSTRAINT [FK_SubCategoryMaster_MainCategoryMaster]
GO
ALTER TABLE [dbo].[SubSubCategoryMaster]  WITH CHECK ADD  CONSTRAINT [FK_SubSubCategoryMaster_SubCategoryMaster] FOREIGN KEY([SubCategoryId])
REFERENCES [dbo].[SubCategoryMaster] ([SubCategoryId])
GO
ALTER TABLE [dbo].[SubSubCategoryMaster] CHECK CONSTRAINT [FK_SubSubCategoryMaster_SubCategoryMaster]
GO
ALTER TABLE [dbo].[TransactionDetails]  WITH CHECK ADD  CONSTRAINT [FK_TransactionDetails_Cart] FOREIGN KEY([CartId])
REFERENCES [dbo].[Cart] ([CartId])
GO
ALTER TABLE [dbo].[TransactionDetails] CHECK CONSTRAINT [FK_TransactionDetails_Cart]
GO
ALTER TABLE [dbo].[TransactionDetails]  WITH CHECK ADD  CONSTRAINT [FK_TransactionDetails_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[TransactionDetails] CHECK CONSTRAINT [FK_TransactionDetails_Users]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Roles] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([RoleId])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Roles]
GO
/****** Object:  StoredProcedure [dbo].[Sp_GetProductDetailsList]    Script Date: 28-Dec-18 9:32:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Sp_GetProductDetailsList]
(
	@currentIndex int,
	@pageSize int,
	@orderByClause varchar(100),
	@search varchar(2000) = '',
	@MainCategoryId AS INT,
	@SubCategoryId AS INT,	
	@totalRecords int OUTPUT

)
AS
BEGIN
    DECLARE @Start int = (@currentIndex)*@pageSize;
    DECLARE @End int = @Start+@pageSize;
	DECLARE @SQL varchar(max)
    SET NOCOUNT ON;
	
	IF @search != ''
		BEGIN
			SET @search = ' AND ' + '( ProductName like ''%' + @search + '%'' OR scm.Name like ''%' + @search + '%'' OR mcm.Name like ''%' + @search + '%'' OR Description like ''%' + @search + '%'')'
		END

	IF  @MainCategoryId > 0
		BEGIN
			SET @search = ' AND mcm.MainCategoryId = ' + CAST(@MainCategoryId AS varchar(10))
		END

	IF  @SubCategoryId > 0
		BEGIN
			SET @search = ' AND scm.SubCategoryId = ' + CAST(@SubCategoryId	 AS varchar(10))
		END

    DECLARE @tblProductListList AS TABLE
        (	ProductId			int,
			ProductName			varchar(400),
			SubCategoryId		int,
			Quantity			int,
			Description			varchar(250),
			ImageURL			varchar(max),
			PricePerUnit		int,
			Unit				varchar(50),
			Status				bit,
			MainCategoryId		int,
			MainCategoryName	varchar(200),
			SubCategoryName		varchar(200),
			RowNumber			int)

   SET @SQL = 'SELECT pd.ProductId,pd.ProductName,pd.SubCategoryId,pd.Quantity,pd.Description,pd.ImageURL,pd.PricePerUnit,pd.Unit,pd.Status,mcm.MainCategoryId,mcm.Name AS MainCategoryName,scm.Name AS SubCategoryName
				,ROW_NUMBER() OVER ('+ @orderByClause +') AS RowNumber FROM dbo.ProductDetails pd INNER JOIN
				dbo.SubCategoryMaster scm ON pd.SubCategoryId = scm.SubCategoryId INNER JOIN
				dbo.MainCategoryMaster mcm ON mcm.MainCategoryId = scm.MainCategoryId WHERE IsDeleted = 0 ' + @search
 
    print @sql
	INSERT INTO @tblProductListList
	exec (@sql)

	select  @totalRecords = COUNT(*) from @tblProductListList
	print @totalRecords

	select * from @tblProductListList where RowNumber > @Start and [RowNumber] <= @End order by [RowNumber] 

END



GO
/****** Object:  StoredProcedure [dbo].[Sp_GetTransactionList]    Script Date: 28-Dec-18 9:32:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Sp_GetTransactionList]
(
	@CartId AS int = 0,
	@Op AS int = 0
)
AS
BEGIN
	
		
		IF	@Op = 0
			BEGIN
					SELECT td.*,u.FirstName + ' ' + u.LastName AS FullName,u.EmailId,u.MobileNumber,u.AlternateNumber FROM dbo.TransactionDetails td INNER JOIN dbo.Users u ON u.UserId = td.UserId
					ORDER BY td.TransactionDate
			END

		IF @Op = 1
			BEGIN
					SELECT * FROM dbo.CartDetail cd  INNER JOIN dbo.Cart c ON c.CartId = cd.CartId
								 INNER JOIN dbo.ProductDetails pd  ON pd.ProductId = cd.ProductId
								 WHERE cd.CartId = @CartId
			END
		
END



GO
/****** Object:  StoredProcedure [dbo].[Sp_GetUserList]    Script Date: 28-Dec-18 9:32:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Sp_GetUserList]
(
	@currentIndex int,
	@pageSize int,
	@orderByClause varchar(100),
	@search varchar(2000) = '',
	@totalRecords int OUTPUT
)
AS
BEGIN
    DECLARE @Start int = (@currentIndex)*@pageSize;
    DECLARE @End int = @Start+@pageSize;
	DECLARE @SQL varchar(max)
    SET NOCOUNT ON;
	
	IF @search != ''
		BEGIN
			SET @search = ' AND ' + '( UserName like ''%' + @search + '%'' OR EmailId like ''%' + @search + '%'')'
		END

    DECLARE @tblUserList AS TABLE
        ([UserId]               [int] ,
		[RoleId]               [int] ,
		[UserName]             [varchar](50) , 
		[Password]             [varchar](50) , 
		[FirstName]            [varchar](50) ,
		[LastName]             [varchar](50) , 
		[EmailId]              [varchar](150), 
		[MobileNumber]         [varchar](20) , 
		[AlternateNumber]      [varchar](20) , 
		[RegistrationDate]     [varchar](30) , 
		[Status]               [bit],
		[RoleName]             [varchar](20),
		[RowNumber]			   [INT])

   SET  @SQL = 'SELECT u.UserId,u.RoleId,u.UserName,u.Password,u.FirstName,u.LastName,u.EmailId,u.MobileNumber,u.AlternateNumber,
		CONVERT(varchar(30),u.RegistrationDate,103),u.Status,r.RoleName,ROW_NUMBER() OVER ('+ @orderByClause +') AS RowNumber
		FROM dbo.Users u INNER JOIN dbo.Roles r ON r.RoleId = u.RoleId WHERE IsDeleted = 0 ' + @search

    print @sql
	INSERT INTO @tblUserList
	exec (@sql)

	select  @totalRecords= COUNT(*) from @tblUserList
	print @totalRecords

	select * from @tblUserList where RowNumber > @Start and [RowNumber] <= @End order by [RowNumber] 

END



GO
/****** Object:  StoredProcedure [dbo].[Sp_GetUserTransactionList]    Script Date: 28-Dec-18 9:32:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Sp_GetUserTransactionList]
(
	@currentIndex int,
	@pageSize int,
	@orderByClause varchar(100),
	@search varchar(2000) = '',
	@totalRecords int OUTPUT
)
AS
BEGIN
    DECLARE @Start int = (@currentIndex)*@pageSize;
    DECLARE @End int = @Start+@pageSize;
	DECLARE @SQL varchar(max)
    SET NOCOUNT ON;
	
	IF @search != ''
		BEGIN
			SET @search = ' AND ' + '( MobileNumber like ''%' + @search + '%'' OR EmailId like ''%' + @search + '%'' OR ProductName like ''%' + @search + '%'')'
		END

    DECLARE @tblUserTransactionList AS TABLE
        (	[RowNumber]			   [INT],
			[UserFullName]         [varchar](250),
			[EmailId]              [varchar](150), 
			[MobileNumber]         [varchar](20), 
			[AlternateNumber]      [varchar](20),
			[ProductName]		   [varchar](200),
			[Description]		   [varchar](250),
			[TransactionId]			[int],
			[UserId]				[int],
			[ProductId]				[int],
			[TransactionDate]		[datetime],
			[ConfirmationDate]		[datetime],
			[Unit]					[varchar](50),
			[Quantity]				[int],
			[PricePerUnit]			[int],
			[IsConfirm]				[bit],
			[PGTransactionId]		[varchar](250),
			[InvoiceId]				[varchar](50),
			[Amount]				[decimal](18, 2),
			[Discount]				[decimal](18, 2),
			[NetAmount]				[decimal](18, 2),
			[Custom]				[varchar](50),
			[Custom1]				[varchar](50)
		)
		
	SET @SQL = 'SELECT ROW_NUMBER() OVER ('+ @orderByClause +') AS RowNumber,u.FirstName + '' '' + u.LastName AS UserFullName,u.EmailId,u.MobileNumber,u.AlternateNumber
				,pd.ProductName,pd.Description,td.* FROM dbo.TransactionDetails td  INNER JOIN dbo.Users u ON u.UserId = td.UserId
				INNER JOIN dbo.ProductDetails pd ON pd.ProductId = td.ProductId WHERE 1=1  ' + @search

    print @sql
	INSERT INTO @tblUserTransactionList
	exec (@sql)

	select  @totalRecords= COUNT(*) from @tblUserTransactionList
	print @totalRecords

	select * from @tblUserTransactionList where RowNumber > @Start and [RowNumber] <= @End order by [RowNumber] 

END




GO
/****** Object:  StoredProcedure [dbo].[Sp_UpdateDeleteProduct]    Script Date: 28-Dec-18 9:32:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Sp_UpdateDeleteProduct]
(
	@ProductId AS INT,
	@ProductStatus AS BIT = 1,
	@Status AS INT OUTPUT,
	@Op AS INT = 0
)
AS
BEGIN
	
	SET NOCOUNT ON;
	
	IF @Op = 0
		BEGIN
			
			UPDATE	dbo.ProductDetails
			SET
			    dbo.ProductDetails.Status = @ProductStatus -- bit
			WHERE dbo.ProductDetails.ProductId = @ProductId

			SET @Status = 1  

		END
	ELSE
		BEGIN

			UPDATE	dbo.ProductDetails
			SET
			    dbo.ProductDetails.IsDeleted = 1 -- bit
			WHERE dbo.ProductDetails.ProductId = @ProductId

			SET @Status = 1  

		END
	
END



GO
/****** Object:  StoredProcedure [dbo].[Sp_UpdateDeleteUser]    Script Date: 28-Dec-18 9:32:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Sp_UpdateDeleteUser]
(
	@UserId AS INT,
	@UserStatus AS BIT = 1,
	@Status AS INT OUTPUT,
	@Op AS INT = 0
)
AS
BEGIN
	
	SET NOCOUNT ON;

	IF EXISTS(SELECT u.* FROM dbo.Users u INNER JOIN dbo.Roles r ON r.RoleId = u.RoleId
	WHERE u.UserId = @UserId AND r.RoleName LIKE 'Admin')
		BEGIN
			 RAISERROR ('You can not delete/update Admin user.',16,1);
		END
	ELSE
		BEGIN
			IF @Op = 0
				BEGIN
			
					UPDATE dbo.Users
					SET 
						dbo.Users.Status = @UserStatus WHERE dbo.Users.UserId = @UserId

					SET @Status = 1  
				END
			ELSE
				BEGIN

					UPDATE dbo.Users
					SET 
						dbo.Users.IsDeleted = 1 WHERE dbo.Users.UserId = @UserId

					SET @Status = 1  
				END
		END
END



GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1 for Home, 2 for Office and 3 for Other' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AddressDetails', @level2type=N'COLUMN',@level2name=N'AddressTypeId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1 - Mon, 2 - Tue, 3 - Wed, 4 - Thurs, 5 - Fri, 6 - Sat, 7 - Sun' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FollowUpDetails', @level2type=N'COLUMN',@level2name=N'Day'
GO
