USE [EcommGroceryOnline]
GO
/****** Object:  Table [dbo].[AddressDetails]    Script Date: 17-May-16 4:03:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AreaMaster]    Script Date: 17-May-16 4:03:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CityMaster]    Script Date: 17-May-16 4:03:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CountryMaster]    Script Date: 17-May-16 4:03:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CouponDetails]    Script Date: 17-May-16 4:03:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FollowUpDetails]    Script Date: 17-May-16 4:03:51 PM ******/
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
/****** Object:  Table [dbo].[MainCategoryMaster]    Script Date: 17-May-16 4:03:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ProductDetails]    Script Date: 17-May-16 4:03:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ProductDetails](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](200) NOT NULL,
	[MainCategoryId] [int] NOT NULL,
	[SubCategoryId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Description] [varchar](250) NOT NULL,
	[ImageURL] [varchar](max) NOT NULL,
	[PricePerUnit] [int] NOT NULL,
	[Unit] [varchar](50) NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_ProductDetails] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 17-May-16 4:03:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SubCategoryMaster]    Script Date: 17-May-16 4:03:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Users]    Script Date: 17-May-16 4:03:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([RoleId], [RoleName]) VALUES (1, N'Admin')
INSERT [dbo].[Roles] ([RoleId], [RoleName]) VALUES (2, N'User')
SET IDENTITY_INSERT [dbo].[Roles] OFF
ALTER TABLE [dbo].[AddressDetails] ADD  CONSTRAINT [DF_AddressDetails_AddressTypeId]  DEFAULT ((1)) FOR [AddressTypeId]
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
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_IsFollowUp]  DEFAULT ((0)) FOR [IsFollowUp]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_RegistrationDate]  DEFAULT (getdate()) FOR [RegistrationDate]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_Status]  DEFAULT ((1)) FOR [Status]
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
ALTER TABLE [dbo].[ProductDetails]  WITH CHECK ADD  CONSTRAINT [FK_ProductDetails_MainCategoryMaster] FOREIGN KEY([MainCategoryId])
REFERENCES [dbo].[MainCategoryMaster] ([MainCategoryId])
GO
ALTER TABLE [dbo].[ProductDetails] CHECK CONSTRAINT [FK_ProductDetails_MainCategoryMaster]
GO
ALTER TABLE [dbo].[ProductDetails]  WITH CHECK ADD  CONSTRAINT [FK_ProductDetails_SubCategoryMaster] FOREIGN KEY([SubCategoryId])
REFERENCES [dbo].[SubCategoryMaster] ([SubCategoryId])
GO
ALTER TABLE [dbo].[ProductDetails] CHECK CONSTRAINT [FK_ProductDetails_SubCategoryMaster]
GO
ALTER TABLE [dbo].[SubCategoryMaster]  WITH CHECK ADD  CONSTRAINT [FK_SubCategoryMaster_MainCategoryMaster] FOREIGN KEY([MainCategoryId])
REFERENCES [dbo].[MainCategoryMaster] ([MainCategoryId])
GO
ALTER TABLE [dbo].[SubCategoryMaster] CHECK CONSTRAINT [FK_SubCategoryMaster_MainCategoryMaster]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Roles] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([RoleId])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Roles]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1 for Home, 2 for Office and 3 for Other' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AddressDetails', @level2type=N'COLUMN',@level2name=N'AddressTypeId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1 - Mon, 2 - Tue, 3 - Wed, 4 - Thurs, 5 - Fri, 6 - Sat, 7 - Sun' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FollowUpDetails', @level2type=N'COLUMN',@level2name=N'Day'
GO
