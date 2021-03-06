USE [NewEcommGroceryOnline]
GO
/****** Object:  Table [dbo].[AddressDetails]    Script Date: 23-Dec-18 8:26:19 PM ******/
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
 CONSTRAINT [PK_AddressDetails] PRIMARY KEY CLUSTERED 
(
	[AddressId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AreaMaster]    Script Date: 23-Dec-18 8:26:19 PM ******/
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
/****** Object:  Table [dbo].[Cart]    Script Date: 23-Dec-18 8:26:19 PM ******/
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
/****** Object:  Table [dbo].[CartDetail]    Script Date: 23-Dec-18 8:26:19 PM ******/
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
/****** Object:  Table [dbo].[CityMaster]    Script Date: 23-Dec-18 8:26:19 PM ******/
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
/****** Object:  Table [dbo].[CountryMaster]    Script Date: 23-Dec-18 8:26:19 PM ******/
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
/****** Object:  Table [dbo].[CouponDetails]    Script Date: 23-Dec-18 8:26:19 PM ******/
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
/****** Object:  Table [dbo].[FollowUpDetails]    Script Date: 23-Dec-18 8:26:19 PM ******/
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
/****** Object:  Table [dbo].[MainCategoryMaster]    Script Date: 23-Dec-18 8:26:19 PM ******/
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
/****** Object:  Table [dbo].[ProductDetails]    Script Date: 23-Dec-18 8:26:19 PM ******/
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
/****** Object:  Table [dbo].[Roles]    Script Date: 23-Dec-18 8:26:19 PM ******/
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
/****** Object:  Table [dbo].[SubCategoryMaster]    Script Date: 23-Dec-18 8:26:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubCategoryMaster](
	[SubCategoryId] [int] IDENTITY(1,1) NOT NULL,
	[MainCategoryId] [int] NOT NULL,
	[Name] [varchar](150) NOT NULL,
 CONSTRAINT [PK_SubCategoryMaster] PRIMARY KEY CLUSTERED 
(
	[SubCategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TransactionDetails]    Script Date: 23-Dec-18 8:26:19 PM ******/
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
/****** Object:  Table [dbo].[Users]    Script Date: 23-Dec-18 8:26:20 PM ******/
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
INSERT [dbo].[Cart] ([CartId], [UserId], [DateCreated], [IsActive], [IpAddress]) VALUES (1004, NULL, CAST(N'2016-07-13T07:22:25.707' AS DateTime), 1, N'180.215.193.68')
SET IDENTITY_INSERT [dbo].[Cart] OFF
SET IDENTITY_INSERT [dbo].[CartDetail] ON 

INSERT [dbo].[CartDetail] ([CartDetailId], [CartId], [ProductId], [Amount], [Discount], [NetAmount], [Timestamp], [IsActive], [Quantity], [PricePerUnit], [Unit]) VALUES (1, 1, 320, CAST(28.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(28.00 AS Decimal(18, 2)), CAST(N'2016-06-20T14:47:18.410' AS DateTime), 1, 1, 28, N'100')
INSERT [dbo].[CartDetail] ([CartDetailId], [CartId], [ProductId], [Amount], [Discount], [NetAmount], [Timestamp], [IsActive], [Quantity], [PricePerUnit], [Unit]) VALUES (2, 1, 326, CAST(34.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(68.00 AS Decimal(18, 2)), CAST(N'2016-06-20T14:48:12.407' AS DateTime), 1, 2, 34, N'200')
INSERT [dbo].[CartDetail] ([CartDetailId], [CartId], [ProductId], [Amount], [Discount], [NetAmount], [Timestamp], [IsActive], [Quantity], [PricePerUnit], [Unit]) VALUES (5, 2, 310, NULL, NULL, NULL, CAST(N'2016-06-21T11:05:51.297' AS DateTime), 0, 9, NULL, NULL)
INSERT [dbo].[CartDetail] ([CartDetailId], [CartId], [ProductId], [Amount], [Discount], [NetAmount], [Timestamp], [IsActive], [Quantity], [PricePerUnit], [Unit]) VALUES (16, 3, 302, CAST(150.00 AS Decimal(18, 2)), NULL, CAST(150.00 AS Decimal(18, 2)), CAST(N'2016-06-22T10:38:21.213' AS DateTime), 0, 15, NULL, NULL)
INSERT [dbo].[CartDetail] ([CartDetailId], [CartId], [ProductId], [Amount], [Discount], [NetAmount], [Timestamp], [IsActive], [Quantity], [PricePerUnit], [Unit]) VALUES (17, 3, 306, CAST(42.00 AS Decimal(18, 2)), NULL, CAST(42.00 AS Decimal(18, 2)), CAST(N'2016-06-21T13:54:26.310' AS DateTime), 0, 3, NULL, NULL)
INSERT [dbo].[CartDetail] ([CartDetailId], [CartId], [ProductId], [Amount], [Discount], [NetAmount], [Timestamp], [IsActive], [Quantity], [PricePerUnit], [Unit]) VALUES (18, 3, 304, CAST(24.00 AS Decimal(18, 2)), NULL, CAST(24.00 AS Decimal(18, 2)), CAST(N'2016-06-21T15:28:59.903' AS DateTime), 0, 2, NULL, NULL)
INSERT [dbo].[CartDetail] ([CartDetailId], [CartId], [ProductId], [Amount], [Discount], [NetAmount], [Timestamp], [IsActive], [Quantity], [PricePerUnit], [Unit]) VALUES (1006, 3, 308, CAST(48.00 AS Decimal(18, 2)), NULL, CAST(48.00 AS Decimal(18, 2)), CAST(N'2016-06-22T10:39:35.180' AS DateTime), 0, 3, NULL, NULL)
INSERT [dbo].[CartDetail] ([CartDetailId], [CartId], [ProductId], [Amount], [Discount], [NetAmount], [Timestamp], [IsActive], [Quantity], [PricePerUnit], [Unit]) VALUES (1007, 1004, 322, CAST(510.00 AS Decimal(18, 2)), NULL, CAST(510.00 AS Decimal(18, 2)), CAST(N'2016-07-13T07:25:23.110' AS DateTime), 0, 17, NULL, NULL)
SET IDENTITY_INSERT [dbo].[CartDetail] OFF
SET IDENTITY_INSERT [dbo].[CityMaster] ON 

INSERT [dbo].[CityMaster] ([CityId], [CityName], [CountryId]) VALUES (1, N'Vadodara', 1)
SET IDENTITY_INSERT [dbo].[CityMaster] OFF
SET IDENTITY_INSERT [dbo].[CountryMaster] ON 

INSERT [dbo].[CountryMaster] ([CountryId], [CountryName]) VALUES (1, N'INDIA')
SET IDENTITY_INSERT [dbo].[CountryMaster] OFF
SET IDENTITY_INSERT [dbo].[MainCategoryMaster] ON 

INSERT [dbo].[MainCategoryMaster] ([MainCategoryId], [Name]) VALUES (1, N'Vegetables')
INSERT [dbo].[MainCategoryMaster] ([MainCategoryId], [Name]) VALUES (2, N'Fruits')
INSERT [dbo].[MainCategoryMaster] ([MainCategoryId], [Name]) VALUES (3, N'Rose')
SET IDENTITY_INSERT [dbo].[MainCategoryMaster] OFF
SET IDENTITY_INSERT [dbo].[ProductDetails] ON 

INSERT [dbo].[ProductDetails] ([ProductId], [ProductName], [SubCategoryId], [Quantity], [Description], [ImageURL], [PricePerUnit], [Unit], [Status], [IsDeleted], [IsOutOfStock], [IsLimitedStock], [IsSeasonalStock]) VALUES (302, N'Apple Indian ', 2, 1, N'Test product three', N'media/catalog/product/cache/1/small_image/200x200/9df78eab33525d08d6e5fb8d27136e95/r/e/red_apples-551.jpg ', 10, N'100', 1, 0, 0, 0, 0)
INSERT [dbo].[ProductDetails] ([ProductId], [ProductName], [SubCategoryId], [Quantity], [Description], [ImageURL], [PricePerUnit], [Unit], [Status], [IsDeleted], [IsOutOfStock], [IsLimitedStock], [IsSeasonalStock]) VALUES (303, N'Apple Washington ', 2, 1, N'Apple Indian ', N'media/catalog/product/cache/1/small_image/200x200/9df78eab33525d08d6e5fb8d27136e95/w/a/washington_apple.jpg ', 11, N'100', 1, 0, 0, 0, 0)
INSERT [dbo].[ProductDetails] ([ProductId], [ProductName], [SubCategoryId], [Quantity], [Description], [ImageURL], [PricePerUnit], [Unit], [Status], [IsDeleted], [IsOutOfStock], [IsLimitedStock], [IsSeasonalStock]) VALUES (304, N'Asparagus ', 1, 1, N'Apple Washington ', N'media/catalog/product/cache/1/small_image/200x200/9df78eab33525d08d6e5fb8d27136e95/a/s/asparagus.jpg ', 12, N'100', 1, 0, 0, 0, 0)
INSERT [dbo].[ProductDetails] ([ProductId], [ProductName], [SubCategoryId], [Quantity], [Description], [ImageURL], [PricePerUnit], [Unit], [Status], [IsDeleted], [IsOutOfStock], [IsLimitedStock], [IsSeasonalStock]) VALUES (305, N'avocado', 2, 1, N'Asparagus ', N'media/catalog/product/cache/1/small_image/200x200/9df78eab33525d08d6e5fb8d27136e95/a/v/avocado.png', 13, N'100', 1, 0, 0, 0, 0)
INSERT [dbo].[ProductDetails] ([ProductId], [ProductName], [SubCategoryId], [Quantity], [Description], [ImageURL], [PricePerUnit], [Unit], [Status], [IsDeleted], [IsOutOfStock], [IsLimitedStock], [IsSeasonalStock]) VALUES (306, N'Awala ', 1, 1, N'avocado', N'media/catalog/product/cache/1/small_image/200x200/9df78eab33525d08d6e5fb8d27136e95/a/w/awala.jpg ', 14, N'100', 1, 0, 0, 0, 0)
INSERT [dbo].[ProductDetails] ([ProductId], [ProductName], [SubCategoryId], [Quantity], [Description], [ImageURL], [PricePerUnit], [Unit], [Status], [IsDeleted], [IsOutOfStock], [IsLimitedStock], [IsSeasonalStock]) VALUES (307, N'Baby Corn ', 1, 1, N'Awala ', N'media/catalog/product/cache/1/small_image/200x200/9df78eab33525d08d6e5fb8d27136e95/b/a/baby_corn.jpg ', 15, N'100', 1, 0, 0, 0, 0)
INSERT [dbo].[ProductDetails] ([ProductId], [ProductName], [SubCategoryId], [Quantity], [Description], [ImageURL], [PricePerUnit], [Unit], [Status], [IsDeleted], [IsOutOfStock], [IsLimitedStock], [IsSeasonalStock]) VALUES (308, N'Baby potatoes ', 1, 1, N'Baby Corn ', N'media/catalog/product/cache/1/small_image/200x200/9df78eab33525d08d6e5fb8d27136e95/b/a/baby_potato.jpg ', 16, N'100', 1, 0, 0, 0, 0)
INSERT [dbo].[ProductDetails] ([ProductId], [ProductName], [SubCategoryId], [Quantity], [Description], [ImageURL], [PricePerUnit], [Unit], [Status], [IsDeleted], [IsOutOfStock], [IsLimitedStock], [IsSeasonalStock]) VALUES (309, N'Banana ', 2, 1, N'Baby potatoes ', N'media/catalog/product/cache/1/small_image/200x200/9df78eab33525d08d6e5fb8d27136e95/b/a/bananai.jpg ', 17, N'100', 1, 0, 0, 0, 0)
INSERT [dbo].[ProductDetails] ([ProductId], [ProductName], [SubCategoryId], [Quantity], [Description], [ImageURL], [PricePerUnit], [Unit], [Status], [IsDeleted], [IsOutOfStock], [IsLimitedStock], [IsSeasonalStock]) VALUES (310, N'Banana Flower ', 2, 1, N'Banana ', N'media/catalog/product/cache/1/small_image/200x200/9df78eab33525d08d6e5fb8d27136e95/b/a/banana-flower.jpg ', 18, N'100', 1, 0, 0, 0, 0)
INSERT [dbo].[ProductDetails] ([ProductId], [ProductName], [SubCategoryId], [Quantity], [Description], [ImageURL], [PricePerUnit], [Unit], [Status], [IsDeleted], [IsOutOfStock], [IsLimitedStock], [IsSeasonalStock]) VALUES (311, N'Basil ', 1, 1, N'Banana Flower ', N'media/catalog/product/cache/1/small_image/200x200/9df78eab33525d08d6e5fb8d27136e95/b/a/basil.jpg ', 19, N'100', 1, 0, 0, 0, 0)
INSERT [dbo].[ProductDetails] ([ProductId], [ProductName], [SubCategoryId], [Quantity], [Description], [ImageURL], [PricePerUnit], [Unit], [Status], [IsDeleted], [IsOutOfStock], [IsLimitedStock], [IsSeasonalStock]) VALUES (312, N'Beetroot ', 1, 1, N'Basil ', N'media/catalog/product/cache/1/small_image/200x200/9df78eab33525d08d6e5fb8d27136e95/b/e/beetroot-300x225-wa-scene.gif', 20, N'100', 1, 0, 0, 0, 0)
INSERT [dbo].[ProductDetails] ([ProductId], [ProductName], [SubCategoryId], [Quantity], [Description], [ImageURL], [PricePerUnit], [Unit], [Status], [IsDeleted], [IsOutOfStock], [IsLimitedStock], [IsSeasonalStock]) VALUES (313, N'Bitter Gourd ', 1, 1, N'Beetroot ', N'media/catalog/product/cache/1/small_image/200x200/9df78eab33525d08d6e5fb8d27136e95/b/i/bittergourd.jpg ', 21, N'100', 1, 0, 0, 0, 0)
INSERT [dbo].[ProductDetails] ([ProductId], [ProductName], [SubCategoryId], [Quantity], [Description], [ImageURL], [PricePerUnit], [Unit], [Status], [IsDeleted], [IsOutOfStock], [IsLimitedStock], [IsSeasonalStock]) VALUES (314, N'Ridge Gourd/Turai ', 1, 1, N'Bitter Gourd ', N'media/catalog/product/cache/1/small_image/200x200/9df78eab33525d08d6e5fb8d27136e95/t/u/turai_big.png ', 22, N'100', 1, 0, 0, 0, 0)
INSERT [dbo].[ProductDetails] ([ProductId], [ProductName], [SubCategoryId], [Quantity], [Description], [ImageURL], [PricePerUnit], [Unit], [Status], [IsDeleted], [IsOutOfStock], [IsLimitedStock], [IsSeasonalStock]) VALUES (315, N'Pudina/Mint ', 1, 1, N'Ridge Gourd/Turai ', N'media/catalog/product/cache/1/small_image/200x200/9df78eab33525d08d6e5fb8d27136e95/m/i/mint-leaves.jpg ', 23, N'100', 1, 0, 0, 0, 0)
INSERT [dbo].[ProductDetails] ([ProductId], [ProductName], [SubCategoryId], [Quantity], [Description], [ImageURL], [PricePerUnit], [Unit], [Status], [IsDeleted], [IsOutOfStock], [IsLimitedStock], [IsSeasonalStock]) VALUES (316, N'Onion ', 1, 1, N'Pudina/Mint ', N'media/catalog/product/cache/1/small_image/200x200/9df78eab33525d08d6e5fb8d27136e95/o/n/onion.jpg ', 24, N'100', 1, 0, 0, 0, 0)
INSERT [dbo].[ProductDetails] ([ProductId], [ProductName], [SubCategoryId], [Quantity], [Description], [ImageURL], [PricePerUnit], [Unit], [Status], [IsDeleted], [IsOutOfStock], [IsLimitedStock], [IsSeasonalStock]) VALUES (317, N'Cauliflower ', 1, 1, N'Onion ', N'media/catalog/product/cache/1/small_image/200x200/9df78eab33525d08d6e5fb8d27136e95/c/a/cauliflower1.jpg ', 25, N'100', 1, 0, 0, 0, 0)
INSERT [dbo].[ProductDetails] ([ProductId], [ProductName], [SubCategoryId], [Quantity], [Description], [ImageURL], [PricePerUnit], [Unit], [Status], [IsDeleted], [IsOutOfStock], [IsLimitedStock], [IsSeasonalStock]) VALUES (318, N'Parsley ', 1, 1, N'Cauliflower ', N'media/catalog/product/cache/1/small_image/200x200/9df78eab33525d08d6e5fb8d27136e95/p/a/parsley_2.jpg ', 26, N'100', 1, 0, 0, 0, 0)
INSERT [dbo].[ProductDetails] ([ProductId], [ProductName], [SubCategoryId], [Quantity], [Description], [ImageURL], [PricePerUnit], [Unit], [Status], [IsDeleted], [IsOutOfStock], [IsLimitedStock], [IsSeasonalStock]) VALUES (319, N'Garlic ', 1, 1, N'Parsley ', N'media/catalog/product/cache/1/small_image/200x200/9df78eab33525d08d6e5fb8d27136e95/g/a/garlic1.jpg ', 27, N'100', 1, 0, 0, 0, 0)
INSERT [dbo].[ProductDetails] ([ProductId], [ProductName], [SubCategoryId], [Quantity], [Description], [ImageURL], [PricePerUnit], [Unit], [Status], [IsDeleted], [IsOutOfStock], [IsLimitedStock], [IsSeasonalStock]) VALUES (320, N'Carrot ', 1, 1, N'Garlic ', N'media/catalog/product/cache/1/small_image/200x200/9df78eab33525d08d6e5fb8d27136e95/c/a/carrat.jpg ', 28, N'100', 1, 0, 0, 0, 0)
INSERT [dbo].[ProductDetails] ([ProductId], [ProductName], [SubCategoryId], [Quantity], [Description], [ImageURL], [PricePerUnit], [Unit], [Status], [IsDeleted], [IsOutOfStock], [IsLimitedStock], [IsSeasonalStock]) VALUES (321, N'Cabbage ', 1, 1, N'Carrot ', N'media/catalog/product/cache/1/small_image/200x200/9df78eab33525d08d6e5fb8d27136e95/c/a/cabbage.jpg ', 29, N'100', 1, 0, 0, 0, 0)
INSERT [dbo].[ProductDetails] ([ProductId], [ProductName], [SubCategoryId], [Quantity], [Description], [ImageURL], [PricePerUnit], [Unit], [Status], [IsDeleted], [IsOutOfStock], [IsLimitedStock], [IsSeasonalStock]) VALUES (322, N'Brinjal Small ', 1, 1, N'Cabbage ', N'media/catalog/product/cache/1/small_image/200x200/9df78eab33525d08d6e5fb8d27136e95/s/m/small-brinjal.jpg ', 30, N'100', 1, 0, 0, 0, 0)
INSERT [dbo].[ProductDetails] ([ProductId], [ProductName], [SubCategoryId], [Quantity], [Description], [ImageURL], [PricePerUnit], [Unit], [Status], [IsDeleted], [IsOutOfStock], [IsLimitedStock], [IsSeasonalStock]) VALUES (323, N'Green Peas ', 1, 1, N'Brinjal Small ', N'media/catalog/product/cache/1/small_image/200x200/9df78eab33525d08d6e5fb8d27136e95/g/r/greenpeas_225x318.ashx.jpg ', 31, N'100', 1, 0, 0, 0, 0)
INSERT [dbo].[ProductDetails] ([ProductId], [ProductName], [SubCategoryId], [Quantity], [Description], [ImageURL], [PricePerUnit], [Unit], [Status], [IsDeleted], [IsOutOfStock], [IsLimitedStock], [IsSeasonalStock]) VALUES (324, N'Cucumber White ', 1, 1, N'Green Peas ', N'media/catalog/product/cache/1/small_image/200x200/9df78eab33525d08d6e5fb8d27136e95/c/u/cucumber_2.jpg ', 32, N'100', 1, 0, 0, 0, 0)
INSERT [dbo].[ProductDetails] ([ProductId], [ProductName], [SubCategoryId], [Quantity], [Description], [ImageURL], [PricePerUnit], [Unit], [Status], [IsDeleted], [IsOutOfStock], [IsLimitedStock], [IsSeasonalStock]) VALUES (325, N'Ginger ', 1, 1, N'Cucumber White ', N'media/catalog/product/cache/1/small_image/200x200/9df78eab33525d08d6e5fb8d27136e95/g/i/ginger_1.jpg ', 33, N'100', 1, 0, 0, 0, 0)
INSERT [dbo].[ProductDetails] ([ProductId], [ProductName], [SubCategoryId], [Quantity], [Description], [ImageURL], [PricePerUnit], [Unit], [Status], [IsDeleted], [IsOutOfStock], [IsLimitedStock], [IsSeasonalStock]) VALUES (326, N'Apple Indian ', 2, 1, N'Ginger ', N'media/catalog/product/cache/1/small_image/200x200/9df78eab33525d08d6e5fb8d27136e95/r/e/red_apples-551.jpg ', 34, N'100', 1, 0, 0, 0, 0)
INSERT [dbo].[ProductDetails] ([ProductId], [ProductName], [SubCategoryId], [Quantity], [Description], [ImageURL], [PricePerUnit], [Unit], [Status], [IsDeleted], [IsOutOfStock], [IsLimitedStock], [IsSeasonalStock]) VALUES (327, N'Musk Melon ', 2, 1, N'Apple Indian ', N'media/catalog/product/cache/1/small_image/200x200/9df78eab33525d08d6e5fb8d27136e95/c/a/cantaloupe.jpg ', 35, N'100', 1, 0, 0, 0, 0)
INSERT [dbo].[ProductDetails] ([ProductId], [ProductName], [SubCategoryId], [Quantity], [Description], [ImageURL], [PricePerUnit], [Unit], [Status], [IsDeleted], [IsOutOfStock], [IsLimitedStock], [IsSeasonalStock]) VALUES (328, N'Guava Indian ', 2, 1, N'Musk Melon ', N'media/catalog/product/cache/1/small_image/200x200/9df78eab33525d08d6e5fb8d27136e95/g/u/guava01.jpg ', 36, N'100', 1, 0, 0, 0, 0)
INSERT [dbo].[ProductDetails] ([ProductId], [ProductName], [SubCategoryId], [Quantity], [Description], [ImageURL], [PricePerUnit], [Unit], [Status], [IsDeleted], [IsOutOfStock], [IsLimitedStock], [IsSeasonalStock]) VALUES (329, N'Banana ', 2, 1, N'Guava Indian ', N'media/catalog/product/cache/1/small_image/200x200/9df78eab33525d08d6e5fb8d27136e95/b/a/bananai.jpg ', 37, N'100', 1, 0, 0, 0, 0)
INSERT [dbo].[ProductDetails] ([ProductId], [ProductName], [SubCategoryId], [Quantity], [Description], [ImageURL], [PricePerUnit], [Unit], [Status], [IsDeleted], [IsOutOfStock], [IsLimitedStock], [IsSeasonalStock]) VALUES (330, N'Pomegranate ', 2, 1, N'Banana ', N'media/catalog/product/cache/1/small_image/200x200/9df78eab33525d08d6e5fb8d27136e95/p/o/pomegranate.jpg ', 38, N'100', 1, 0, 0, 0, 0)
INSERT [dbo].[ProductDetails] ([ProductId], [ProductName], [SubCategoryId], [Quantity], [Description], [ImageURL], [PricePerUnit], [Unit], [Status], [IsDeleted], [IsOutOfStock], [IsLimitedStock], [IsSeasonalStock]) VALUES (331, N'Awala ', 1, 1, N'Pomegranate ', N'media/catalog/product/cache/1/small_image/200x200/9df78eab33525d08d6e5fb8d27136e95/a/w/awala.jpg ', 39, N'100', 1, 0, 0, 0, 0)
INSERT [dbo].[ProductDetails] ([ProductId], [ProductName], [SubCategoryId], [Quantity], [Description], [ImageURL], [PricePerUnit], [Unit], [Status], [IsDeleted], [IsOutOfStock], [IsLimitedStock], [IsSeasonalStock]) VALUES (332, N'Apple Washington ', 2, 1, N'Awala ', N'media/catalog/product/cache/1/small_image/200x200/9df78eab33525d08d6e5fb8d27136e95/w/a/washington_apple.jpg ', 40, N'100', 1, 0, 0, 0, 0)
INSERT [dbo].[ProductDetails] ([ProductId], [ProductName], [SubCategoryId], [Quantity], [Description], [ImageURL], [PricePerUnit], [Unit], [Status], [IsDeleted], [IsOutOfStock], [IsLimitedStock], [IsSeasonalStock]) VALUES (333, N'Chiku (8 Pcs Medium Size) ', 2, 1, N'Apple Washington ', N'media/catalog/product/cache/1/small_image/200x200/9df78eab33525d08d6e5fb8d27136e95/c/h/chikoo-600x600.png ', 41, N'100', 1, 0, 0, 0, 0)
INSERT [dbo].[ProductDetails] ([ProductId], [ProductName], [SubCategoryId], [Quantity], [Description], [ImageURL], [PricePerUnit], [Unit], [Status], [IsDeleted], [IsOutOfStock], [IsLimitedStock], [IsSeasonalStock]) VALUES (334, N'Orange / Malta ( Imported)', 2, 1, N'Chiku (8 Pcs Medium Size) ', N'media/catalog/product/cache/1/small_image/200x200/9df78eab33525d08d6e5fb8d27136e95/o/r/orangejunction.jpg ', 42, N'100', 1, 0, 0, 0, 0)
INSERT [dbo].[ProductDetails] ([ProductId], [ProductName], [SubCategoryId], [Quantity], [Description], [ImageURL], [PricePerUnit], [Unit], [Status], [IsDeleted], [IsOutOfStock], [IsLimitedStock], [IsSeasonalStock]) VALUES (335, N'Custard Apple ', 2, 1, N'Orange / Malta ( Imported)', N'media/catalog/product/cache/1/small_image/200x200/9df78eab33525d08d6e5fb8d27136e95/s/i/sitafhal.jpg ', 43, N'100', 1, 0, 0, 0, 0)
INSERT [dbo].[ProductDetails] ([ProductId], [ProductName], [SubCategoryId], [Quantity], [Description], [ImageURL], [PricePerUnit], [Unit], [Status], [IsDeleted], [IsOutOfStock], [IsLimitedStock], [IsSeasonalStock]) VALUES (336, N'Mosambi ', 2, 1, N'Custard Apple ', N'media/catalog/product/cache/1/small_image/200x200/9df78eab33525d08d6e5fb8d27136e95/m/o/mosambi_1.jpg ', 44, N'100', 1, 0, 0, 0, 0)
INSERT [dbo].[ProductDetails] ([ProductId], [ProductName], [SubCategoryId], [Quantity], [Description], [ImageURL], [PricePerUnit], [Unit], [Status], [IsDeleted], [IsOutOfStock], [IsLimitedStock], [IsSeasonalStock]) VALUES (337, N'Pineapple ', 2, 1, N'Mosambi ', N'media/catalog/product/cache/1/small_image/200x200/9df78eab33525d08d6e5fb8d27136e95/p/i/pinapple.jpg ', 45, N'100', 1, 0, 0, 0, 0)
SET IDENTITY_INSERT [dbo].[ProductDetails] OFF
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([RoleId], [RoleName]) VALUES (1, N'Admin')
INSERT [dbo].[Roles] ([RoleId], [RoleName]) VALUES (2, N'User')
SET IDENTITY_INSERT [dbo].[Roles] OFF
SET IDENTITY_INSERT [dbo].[SubCategoryMaster] ON 

INSERT [dbo].[SubCategoryMaster] ([SubCategoryId], [MainCategoryId], [Name]) VALUES (1, 1, N'Fresh Vegetales')
INSERT [dbo].[SubCategoryMaster] ([SubCategoryId], [MainCategoryId], [Name]) VALUES (2, 2, N'Fresh Fruits')
INSERT [dbo].[SubCategoryMaster] ([SubCategoryId], [MainCategoryId], [Name]) VALUES (6, 3, N'Fresh Rose')
SET IDENTITY_INSERT [dbo].[SubCategoryMaster] OFF
SET IDENTITY_INSERT [dbo].[TransactionDetails] ON 

INSERT [dbo].[TransactionDetails] ([TransactionId], [UserId], [TransactionDate], [ConfirmationDate], [IsConfirm], [PGTransactionId], [InvoiceId], [Custom], [Custom1], [CartId]) VALUES (1, 1, CAST(N'2016-06-20T14:48:38.747' AS DateTime), NULL, 0, NULL, NULL, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[TransactionDetails] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserId], [RoleId], [UserName], [Password], [FirstName], [LastName], [EmailId], [MobileNumber], [AlternateNumber], [IsFollowUp], [IPAddres], [RegistrationDate], [Status], [LastLoginDate], [ActivationCode], [IsDeleted]) VALUES (1, 1, N'abc', N'abc', N'abc', N'abc', N'abc@gmail.com', N'9999999999', NULL, 0, N'::1', CAST(N'2016-05-18T12:48:39.467' AS DateTime), 1, CAST(N'2018-12-23T14:24:35.137' AS DateTime), NULL, 0)
INSERT [dbo].[Users] ([UserId], [RoleId], [UserName], [Password], [FirstName], [LastName], [EmailId], [MobileNumber], [AlternateNumber], [IsFollowUp], [IPAddres], [RegistrationDate], [Status], [LastLoginDate], [ActivationCode], [IsDeleted]) VALUES (2, 2, N'ali', N'ali1', N'aliabbas', N'vohra', N'aav@gmail.com', N'5852125254', N'1252125474', 0, N'::1', CAST(N'2016-05-30T16:00:43.027' AS DateTime), 1, CAST(N'2018-12-23T14:24:19.050' AS DateTime), NULL, 0)
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
/****** Object:  StoredProcedure [dbo].[Sp_GetProductDetailsList]    Script Date: 23-Dec-18 8:26:20 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Sp_GetTransactionList]    Script Date: 23-Dec-18 8:26:20 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Sp_GetUserList]    Script Date: 23-Dec-18 8:26:20 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Sp_GetUserTransactionList]    Script Date: 23-Dec-18 8:26:20 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Sp_UpdateDeleteProduct]    Script Date: 23-Dec-18 8:26:20 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Sp_UpdateDeleteUser]    Script Date: 23-Dec-18 8:26:20 PM ******/
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
