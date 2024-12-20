USE [Assignment]
GO
/****** Object:  Table [dbo].[Attendence]    Script Date: 11/3/2024 11:19:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Attendence](
	[AttendentID] [int] NOT NULL,
	[SchEmpID] [int] NOT NULL,
	[Quantity] [decimal](18, 2) NOT NULL,
	[Alpha] [float] NOT NULL,
 CONSTRAINT [PK_Attendence] PRIMARY KEY CLUSTERED 
(
	[AttendentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Department]    Script Date: 11/3/2024 11:19:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[DepartmentID] [int] NOT NULL,
	[DepartmentName] [nvarchar](150) NOT NULL,
	[type] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[DepartmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 11/3/2024 11:19:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[EmployeeID] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeName] [nvarchar](150) NOT NULL,
	[gender] [bit] NOT NULL,
	[address] [varchar](150) NOT NULL,
	[dob] [date] NOT NULL,
	[RoleID] [int] NULL,
	[DepartmentID] [int] NOT NULL,
	[salary] [decimal](18, 2) NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feature]    Script Date: 11/3/2024 11:19:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feature](
	[FeatureID] [int] IDENTITY(1,1) NOT NULL,
	[FeatureName] [nvarchar](150) NOT NULL,
	[url] [varchar](max) NOT NULL,
 CONSTRAINT [PK_Feature] PRIMARY KEY CLUSTERED 
(
	[FeatureID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Plan]    Script Date: 11/3/2024 11:19:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Plan](
	[PlanID] [int] IDENTITY(1,1) NOT NULL,
	[PlanName] [nvarchar](150) NOT NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NOT NULL,
	[DepartmentID] [int] NOT NULL,
 CONSTRAINT [PK_Plan] PRIMARY KEY CLUSTERED 
(
	[PlanID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PlanCampain]    Script Date: 11/3/2024 11:19:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlanCampain](
	[PlanCampnID] [int] IDENTITY(1,1) NOT NULL,
	[PlanID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Estimate] [int] NOT NULL,
 CONSTRAINT [PK_PlanCampain] PRIMARY KEY CLUSTERED 
(
	[PlanCampnID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 11/3/2024 11:19:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 11/3/2024 11:19:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoleFeature]    Script Date: 11/3/2024 11:19:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoleFeature](
	[FeatureID] [int] NOT NULL,
	[RoleID] [int] NOT NULL,
 CONSTRAINT [PK_RoleFeature] PRIMARY KEY CLUSTERED 
(
	[FeatureID] ASC,
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SchedualCampaign]    Script Date: 11/3/2024 11:19:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SchedualCampaign](
	[ScID] [int] IDENTITY(1,1) NOT NULL,
	[PlanCampnID] [int] NOT NULL,
	[Date] [date] NOT NULL,
	[Shift] [varchar](50) NOT NULL,
	[Quantity] [int] NOT NULL,
 CONSTRAINT [PK_SchedualCampaign] PRIMARY KEY CLUSTERED 
(
	[ScID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SchedualEmployee]    Script Date: 11/3/2024 11:19:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SchedualEmployee](
	[SchEmpID] [int] NOT NULL,
	[ScID] [int] NOT NULL,
	[EmployeeID] [int] NOT NULL,
	[Quantity] [decimal](18, 0) NOT NULL,
 CONSTRAINT [PK_SchedualEmployee] PRIMARY KEY CLUSTERED 
(
	[SchEmpID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 11/3/2024 11:19:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserName] [nvarchar](150) NOT NULL,
	[password] [varchar](150) NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserRole]    Script Date: 11/3/2024 11:19:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRole](
	[UserName] [nvarchar](150) NOT NULL,
	[RoleID] [int] NOT NULL,
 CONSTRAINT [PK_UserRole] PRIMARY KEY CLUSTERED 
(
	[UserName] ASC,
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Department] ([DepartmentID], [DepartmentName], [type]) VALUES (1, N'Production Workshop1 _ SX Gio', N'WS')
INSERT [dbo].[Department] ([DepartmentID], [DepartmentName], [type]) VALUES (2, N'Production Workshop2_ SX Thung', N'WS')
INSERT [dbo].[Department] ([DepartmentID], [DepartmentName], [type]) VALUES (3, N'Production Workshop3_SX Met', N'WS')
INSERT [dbo].[Department] ([DepartmentID], [DepartmentName], [type]) VALUES (4, N'Production Planning', N'Plan')
GO
SET IDENTITY_INSERT [dbo].[Employee] ON 

INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [gender], [address], [dob], [RoleID], [DepartmentID], [salary]) VALUES (1, N'Pham Thoai', 1, N'Da Nang', CAST(N'1990-01-01' AS Date), 6, 1, CAST(1260000.00 AS Decimal(18, 2)))
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [gender], [address], [dob], [RoleID], [DepartmentID], [salary]) VALUES (2, N'Nguyen Thi Bai', 0, N'Hue', CAST(N'1991-02-02' AS Date), 6, 1, CAST(1200000.00 AS Decimal(18, 2)))
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [gender], [address], [dob], [RoleID], [DepartmentID], [salary]) VALUES (3, N'Le Van Cuong', 1, N'Nghe An', CAST(N'1992-03-03' AS Date), 6, 1, CAST(1200000.00 AS Decimal(18, 2)))
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [gender], [address], [dob], [RoleID], [DepartmentID], [salary]) VALUES (4, N'Pham Thi Dung', 0, N'Ha Noi', CAST(N'1993-04-04' AS Date), 6, 1, CAST(1200000.00 AS Decimal(18, 2)))
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [gender], [address], [dob], [RoleID], [DepartmentID], [salary]) VALUES (5, N'Do Van E', 1, N'Hai Phong', CAST(N'1994-05-05' AS Date), 6, 1, CAST(1260000.00 AS Decimal(18, 2)))
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [gender], [address], [dob], [RoleID], [DepartmentID], [salary]) VALUES (6, N'Bui Thi Giang', 0, N'Thanh Hoa', CAST(N'1995-06-06' AS Date), 6, 1, CAST(1200000.00 AS Decimal(18, 2)))
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [gender], [address], [dob], [RoleID], [DepartmentID], [salary]) VALUES (7, N'Hoang Van G', 1, N'Ha Tinh', CAST(N'1996-07-07' AS Date), 6, 1, CAST(1200000.00 AS Decimal(18, 2)))
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [gender], [address], [dob], [RoleID], [DepartmentID], [salary]) VALUES (8, N'Vu Thu Hang', 0, N'Quang Tri', CAST(N'1997-08-08' AS Date), 6, 1, CAST(1200000.00 AS Decimal(18, 2)))
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [gender], [address], [dob], [RoleID], [DepartmentID], [salary]) VALUES (9, N'Nguyen Van I', 1, N'Ha Noi', CAST(N'1998-09-09' AS Date), 6, 1, CAST(1200000.00 AS Decimal(18, 2)))
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [gender], [address], [dob], [RoleID], [DepartmentID], [salary]) VALUES (10, N'Tran Thi J', 0, N'Hai Duong', CAST(N'1999-10-10' AS Date), 1, 1, CAST(5000000.00 AS Decimal(18, 2)))
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [gender], [address], [dob], [RoleID], [DepartmentID], [salary]) VALUES (11, N'Pham Van K', 1, N'Nam Dinh', CAST(N'2000-11-11' AS Date), 6, 1, CAST(1200000.00 AS Decimal(18, 2)))
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [gender], [address], [dob], [RoleID], [DepartmentID], [salary]) VALUES (12, N'Le Thi L', 0, N'Quang Ninh', CAST(N'2001-12-12' AS Date), 6, 1, CAST(1140000.00 AS Decimal(18, 2)))
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [gender], [address], [dob], [RoleID], [DepartmentID], [salary]) VALUES (13, N'Nguyen Van M', 1, N'Hai Phong', CAST(N'2002-01-01' AS Date), 6, 1, CAST(1200000.00 AS Decimal(18, 2)))
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [gender], [address], [dob], [RoleID], [DepartmentID], [salary]) VALUES (14, N'Tran Van N', 1, N'Da Nang', CAST(N'1990-01-01' AS Date), 6, 2, CAST(1380000.00 AS Decimal(18, 2)))
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [gender], [address], [dob], [RoleID], [DepartmentID], [salary]) VALUES (15, N'Nguyen Thi O', 0, N'Hue', CAST(N'1991-02-02' AS Date), 6, 2, CAST(1200000.00 AS Decimal(18, 2)))
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [gender], [address], [dob], [RoleID], [DepartmentID], [salary]) VALUES (16, N'Le Van P', 1, N'Nghe An', CAST(N'1992-03-03' AS Date), 6, 2, CAST(1200000.00 AS Decimal(18, 2)))
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [gender], [address], [dob], [RoleID], [DepartmentID], [salary]) VALUES (17, N'Pham Thi Q', 0, N'Ha Noi', CAST(N'1993-04-04' AS Date), 6, 2, CAST(1200000.00 AS Decimal(18, 2)))
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [gender], [address], [dob], [RoleID], [DepartmentID], [salary]) VALUES (18, N'Do Van R', 1, N'Hai Phong', CAST(N'1994-05-05' AS Date), 6, 2, CAST(1200000.00 AS Decimal(18, 2)))
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [gender], [address], [dob], [RoleID], [DepartmentID], [salary]) VALUES (19, N'Bui Thi S', 0, N'Thanh Hoa', CAST(N'1995-06-06' AS Date), 6, 2, CAST(1200000.00 AS Decimal(18, 2)))
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [gender], [address], [dob], [RoleID], [DepartmentID], [salary]) VALUES (20, N'Hoang Van T', 1, N'Ha Tinh', CAST(N'1996-07-07' AS Date), 1, 2, CAST(5000000.00 AS Decimal(18, 2)))
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [gender], [address], [dob], [RoleID], [DepartmentID], [salary]) VALUES (21, N'Vu Thi U', 0, N'Quang Tri', CAST(N'1997-08-08' AS Date), 6, 2, CAST(1200000.00 AS Decimal(18, 2)))
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [gender], [address], [dob], [RoleID], [DepartmentID], [salary]) VALUES (22, N'Nguyen Van V', 1, N'Ha Noi', CAST(N'1998-09-09' AS Date), 6, 2, CAST(1200000.00 AS Decimal(18, 2)))
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [gender], [address], [dob], [RoleID], [DepartmentID], [salary]) VALUES (23, N'Tran Thi W', 0, N'Hai Duong', CAST(N'1999-10-10' AS Date), 6, 2, CAST(1200000.00 AS Decimal(18, 2)))
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [gender], [address], [dob], [RoleID], [DepartmentID], [salary]) VALUES (24, N'Pham Van X', 1, N'Nam Dinh', CAST(N'2000-11-11' AS Date), 6, 2, CAST(1200000.00 AS Decimal(18, 2)))
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [gender], [address], [dob], [RoleID], [DepartmentID], [salary]) VALUES (25, N'Le Thi Y', 0, N'Quang Ninh', CAST(N'2001-12-12' AS Date), 6, 2, CAST(1200000.00 AS Decimal(18, 2)))
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [gender], [address], [dob], [RoleID], [DepartmentID], [salary]) VALUES (26, N'Nguyen Van Z', 1, N'Hai Phong', CAST(N'2002-01-01' AS Date), 6, 2, CAST(1020000.00 AS Decimal(18, 2)))
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [gender], [address], [dob], [RoleID], [DepartmentID], [salary]) VALUES (27, N'Tran Van AA', 1, N'Da Nang', CAST(N'1990-01-01' AS Date), 6, 3, CAST(960000.00 AS Decimal(18, 2)))
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [gender], [address], [dob], [RoleID], [DepartmentID], [salary]) VALUES (28, N'Nguyen Thi BB', 0, N'Hue', CAST(N'1991-02-02' AS Date), 6, 3, CAST(1200000.00 AS Decimal(18, 2)))
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [gender], [address], [dob], [RoleID], [DepartmentID], [salary]) VALUES (29, N'Le Van CC', 1, N'Nghe An', CAST(N'1992-03-03' AS Date), 6, 3, CAST(1200000.00 AS Decimal(18, 2)))
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [gender], [address], [dob], [RoleID], [DepartmentID], [salary]) VALUES (30, N'Pham Thi DD', 0, N'Ha Noi', CAST(N'1993-04-04' AS Date), 1, 3, CAST(5000000.00 AS Decimal(18, 2)))
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [gender], [address], [dob], [RoleID], [DepartmentID], [salary]) VALUES (31, N'Do Van EE', 1, N'Hai Phong', CAST(N'1994-05-05' AS Date), 6, 3, CAST(1200000.00 AS Decimal(18, 2)))
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [gender], [address], [dob], [RoleID], [DepartmentID], [salary]) VALUES (32, N'Bui Thi FF', 0, N'Thanh Hoa', CAST(N'1995-06-06' AS Date), 6, 3, CAST(1440000.00 AS Decimal(18, 2)))
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [gender], [address], [dob], [RoleID], [DepartmentID], [salary]) VALUES (33, N'Hoang Van GG', 1, N'Ha Tinh', CAST(N'1996-07-07' AS Date), 6, 3, CAST(1200000.00 AS Decimal(18, 2)))
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [gender], [address], [dob], [RoleID], [DepartmentID], [salary]) VALUES (34, N'Vu Thi HH', 0, N'Quang Tri', CAST(N'1997-08-08' AS Date), 6, 3, CAST(1200000.00 AS Decimal(18, 2)))
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [gender], [address], [dob], [RoleID], [DepartmentID], [salary]) VALUES (35, N'Nguyen Van II', 1, N'Ha Noi', CAST(N'1998-09-09' AS Date), 6, 3, CAST(1080000.00 AS Decimal(18, 2)))
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [gender], [address], [dob], [RoleID], [DepartmentID], [salary]) VALUES (36, N'Tran Thi JJ', 0, N'Hai Duong', CAST(N'1999-10-10' AS Date), 6, 3, CAST(1320000.00 AS Decimal(18, 2)))
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [gender], [address], [dob], [RoleID], [DepartmentID], [salary]) VALUES (37, N'Pham Van KK', 1, N'Nam Dinh', CAST(N'2000-11-11' AS Date), 6, 3, CAST(1200000.00 AS Decimal(18, 2)))
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [gender], [address], [dob], [RoleID], [DepartmentID], [salary]) VALUES (38, N'Le Thi LL', 0, N'Quang Ninh', CAST(N'2001-12-12' AS Date), 6, 3, CAST(1200000.00 AS Decimal(18, 2)))
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [gender], [address], [dob], [RoleID], [DepartmentID], [salary]) VALUES (39, N'Nguyen Van MM', 1, N'Hai Phong', CAST(N'2002-01-01' AS Date), 6, 3, CAST(1200000.00 AS Decimal(18, 2)))
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [gender], [address], [dob], [RoleID], [DepartmentID], [salary]) VALUES (40, N'Tran Van NN', 1, N'Da Nang', CAST(N'1990-01-01' AS Date), 2, 4, CAST(5000000.00 AS Decimal(18, 2)))
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [gender], [address], [dob], [RoleID], [DepartmentID], [salary]) VALUES (50, N'Tien Nguyet Anh', 1, N'Thai Binh', CAST(N'2024-10-09' AS Date), NULL, 1, NULL)
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [gender], [address], [dob], [RoleID], [DepartmentID], [salary]) VALUES (51, N'Tien Huyen', 1, N'Binh Thai', CAST(N'2024-10-09' AS Date), NULL, 3, NULL)
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [gender], [address], [dob], [RoleID], [DepartmentID], [salary]) VALUES (52, N'Tien Huyen', 1, N'Binh Thai', CAST(N'2024-10-02' AS Date), NULL, 3, NULL)
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [gender], [address], [dob], [RoleID], [DepartmentID], [salary]) VALUES (53, N'Linh Tien', 0, N'Ha Noi', CAST(N'2024-10-08' AS Date), NULL, 2, NULL)
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [gender], [address], [dob], [RoleID], [DepartmentID], [salary]) VALUES (54, N'Nguyen Hoang Tho', 1, N'Hai Phong', CAST(N'2024-09-27' AS Date), NULL, 1, NULL)
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [gender], [address], [dob], [RoleID], [DepartmentID], [salary]) VALUES (55, N'Nguyen Tien Dat', 0, N'Hoa Lac', CAST(N'2024-10-10' AS Date), NULL, 1, NULL)
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [gender], [address], [dob], [RoleID], [DepartmentID], [salary]) VALUES (56, N'Trương Thị Phương Anh', 1, N'Ha Dong', CAST(N'2024-10-09' AS Date), NULL, 1, NULL)
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [gender], [address], [dob], [RoleID], [DepartmentID], [salary]) VALUES (57, N'Trương Thị Phương Anh', 1, N'Ha Noi', CAST(N'2024-10-01' AS Date), NULL, 1, NULL)
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [gender], [address], [dob], [RoleID], [DepartmentID], [salary]) VALUES (58, N'Nguyen Thi Tien', 0, N'Thach That', CAST(N'2024-10-30' AS Date), NULL, 2, NULL)
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [gender], [address], [dob], [RoleID], [DepartmentID], [salary]) VALUES (59, N'Nguyen Xuan Truong', 1, N'Ha Dong', CAST(N'2024-11-07' AS Date), NULL, 2, NULL)
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [gender], [address], [dob], [RoleID], [DepartmentID], [salary]) VALUES (60, N'Tien La Cho', 0, N'Hung Yen', CAST(N'2024-10-02' AS Date), NULL, 1, NULL)
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [gender], [address], [dob], [RoleID], [DepartmentID], [salary]) VALUES (61, N'Linh Tien', 0, N'Hung Yen', CAST(N'2024-10-08' AS Date), 2, 1, NULL)
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [gender], [address], [dob], [RoleID], [DepartmentID], [salary]) VALUES (63, N'Le Thanh Thuy', 0, N'Thach That', CAST(N'2024-10-01' AS Date), 6, 3, NULL)
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [gender], [address], [dob], [RoleID], [DepartmentID], [salary]) VALUES (64, N'Truong Phuong Thao', 0, N'Hung Yen', CAST(N'2024-10-01' AS Date), 2, 1, NULL)
SET IDENTITY_INSERT [dbo].[Employee] OFF
GO
SET IDENTITY_INSERT [dbo].[Feature] ON 

INSERT [dbo].[Feature] ([FeatureID], [FeatureName], [url]) VALUES (1, N'Create Employee', N'/employee/create')
INSERT [dbo].[Feature] ([FeatureID], [FeatureName], [url]) VALUES (2, N'List All Employee', N'/employee/list')
INSERT [dbo].[Feature] ([FeatureID], [FeatureName], [url]) VALUES (3, N'Filter Employee', N'/employee/filter')
INSERT [dbo].[Feature] ([FeatureID], [FeatureName], [url]) VALUES (4, N'Update Employee', N'/employee/update')
INSERT [dbo].[Feature] ([FeatureID], [FeatureName], [url]) VALUES (7, N'Delete Employee', N'/employee/delete')
INSERT [dbo].[Feature] ([FeatureID], [FeatureName], [url]) VALUES (9, N'Work Plan', N'/work/plan')
INSERT [dbo].[Feature] ([FeatureID], [FeatureName], [url]) VALUES (10, N'Create Production Plan', N'/productionplan/create')
INSERT [dbo].[Feature] ([FeatureID], [FeatureName], [url]) VALUES (12, N'List Prodution Plan', N'/productionplan/list')
INSERT [dbo].[Feature] ([FeatureID], [FeatureName], [url]) VALUES (13, N'Create Schedual Campain', N'/schedualcampain/create')
INSERT [dbo].[Feature] ([FeatureID], [FeatureName], [url]) VALUES (15, N'List Schedual Campain ', N'/schedualcampain/list')
INSERT [dbo].[Feature] ([FeatureID], [FeatureName], [url]) VALUES (17, N'Delete Production Plan', N'/productionplan/delete')
INSERT [dbo].[Feature] ([FeatureID], [FeatureName], [url]) VALUES (18, N'Delete Production Plan', N'/productionplan/update')
SET IDENTITY_INSERT [dbo].[Feature] OFF
GO
SET IDENTITY_INSERT [dbo].[Plan] ON 

INSERT [dbo].[Plan] ([PlanID], [PlanName], [StartDate], [EndDate], [DepartmentID]) VALUES (57, N'San Xuat Thung', CAST(N'2024-11-09' AS Date), CAST(N'2024-11-12' AS Date), 2)
INSERT [dbo].[Plan] ([PlanID], [PlanName], [StartDate], [EndDate], [DepartmentID]) VALUES (58, N'San Xuat Gi', CAST(N'2024-11-02' AS Date), CAST(N'2024-11-12' AS Date), 1)
INSERT [dbo].[Plan] ([PlanID], [PlanName], [StartDate], [EndDate], [DepartmentID]) VALUES (59, N'San Xuat Thung', CAST(N'2024-11-16' AS Date), CAST(N'2024-11-21' AS Date), 2)
INSERT [dbo].[Plan] ([PlanID], [PlanName], [StartDate], [EndDate], [DepartmentID]) VALUES (60, N'San Xuat Thung', CAST(N'2024-11-01' AS Date), CAST(N'2024-11-02' AS Date), 2)
INSERT [dbo].[Plan] ([PlanID], [PlanName], [StartDate], [EndDate], [DepartmentID]) VALUES (61, N'Trinh Van Anh', CAST(N'2024-11-07' AS Date), CAST(N'2024-11-21' AS Date), 1)
INSERT [dbo].[Plan] ([PlanID], [PlanName], [StartDate], [EndDate], [DepartmentID]) VALUES (63, N'San Xuat Thung', CAST(N'2024-11-02' AS Date), CAST(N'2024-11-05' AS Date), 1)
SET IDENTITY_INSERT [dbo].[Plan] OFF
GO
SET IDENTITY_INSERT [dbo].[PlanCampain] ON 

INSERT [dbo].[PlanCampain] ([PlanCampnID], [PlanID], [ProductID], [Quantity], [Estimate]) VALUES (84, 57, 2, 1110, 1)
INSERT [dbo].[PlanCampain] ([PlanCampnID], [PlanID], [ProductID], [Quantity], [Estimate]) VALUES (85, 58, 1, 344, 1)
INSERT [dbo].[PlanCampain] ([PlanCampnID], [PlanID], [ProductID], [Quantity], [Estimate]) VALUES (86, 59, 2, 3444, 2)
INSERT [dbo].[PlanCampain] ([PlanCampnID], [PlanID], [ProductID], [Quantity], [Estimate]) VALUES (87, 60, 2, 3444, 2)
INSERT [dbo].[PlanCampain] ([PlanCampnID], [PlanID], [ProductID], [Quantity], [Estimate]) VALUES (88, 61, 2, 344222, 2)
INSERT [dbo].[PlanCampain] ([PlanCampnID], [PlanID], [ProductID], [Quantity], [Estimate]) VALUES (90, 63, 1, 79, 9)
SET IDENTITY_INSERT [dbo].[PlanCampain] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ProductID], [ProductName]) VALUES (1, N'Giỏ')
INSERT [dbo].[Product] ([ProductID], [ProductName]) VALUES (2, N'Thúng')
INSERT [dbo].[Product] ([ProductID], [ProductName]) VALUES (3, N'Mẹt')
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (1, N'Human Resource Management')
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (2, N'Workshop Manager')
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (3, N'Produce Planner')
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (5, N'Accountant')
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (6, N'Worker')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
INSERT [dbo].[RoleFeature] ([FeatureID], [RoleID]) VALUES (1, 1)
INSERT [dbo].[RoleFeature] ([FeatureID], [RoleID]) VALUES (2, 2)
INSERT [dbo].[RoleFeature] ([FeatureID], [RoleID]) VALUES (3, 1)
INSERT [dbo].[RoleFeature] ([FeatureID], [RoleID]) VALUES (4, 1)
INSERT [dbo].[RoleFeature] ([FeatureID], [RoleID]) VALUES (4, 5)
INSERT [dbo].[RoleFeature] ([FeatureID], [RoleID]) VALUES (7, 1)
INSERT [dbo].[RoleFeature] ([FeatureID], [RoleID]) VALUES (10, 3)
INSERT [dbo].[RoleFeature] ([FeatureID], [RoleID]) VALUES (12, 2)
INSERT [dbo].[RoleFeature] ([FeatureID], [RoleID]) VALUES (12, 3)
INSERT [dbo].[RoleFeature] ([FeatureID], [RoleID]) VALUES (13, 2)
INSERT [dbo].[RoleFeature] ([FeatureID], [RoleID]) VALUES (15, 2)
INSERT [dbo].[RoleFeature] ([FeatureID], [RoleID]) VALUES (17, 3)
INSERT [dbo].[RoleFeature] ([FeatureID], [RoleID]) VALUES (18, 3)
GO
SET IDENTITY_INSERT [dbo].[SchedualCampaign] ON 

INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (15, 87, CAST(N'2024-11-01' AS Date), N'K1', 112)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (16, 87, CAST(N'2024-11-01' AS Date), N'K2', 111)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (17, 87, CAST(N'2024-11-01' AS Date), N'K3', 111)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (18, 87, CAST(N'2024-11-02' AS Date), N'K1', 222)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (19, 87, CAST(N'2024-11-02' AS Date), N'K2', 333)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (20, 87, CAST(N'2024-11-02' AS Date), N'K3', 222)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (21, 84, CAST(N'2024-11-09' AS Date), N'K1', 123)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (22, 84, CAST(N'2024-11-09' AS Date), N'K2', 333)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (23, 84, CAST(N'2024-11-09' AS Date), N'K3', 444)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (24, 84, CAST(N'2024-11-10' AS Date), N'K1', 344)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (25, 84, CAST(N'2024-11-10' AS Date), N'K2', 222)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (26, 84, CAST(N'2024-11-10' AS Date), N'K3', 233)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (27, 84, CAST(N'2024-11-11' AS Date), N'K1', 2224)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (28, 84, CAST(N'2024-11-11' AS Date), N'K2', 44)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (29, 84, CAST(N'2024-11-11' AS Date), N'K3', 222)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (30, 84, CAST(N'2024-11-12' AS Date), N'K1', 222)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (31, 84, CAST(N'2024-11-12' AS Date), N'K2', 332)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (32, 84, CAST(N'2024-11-12' AS Date), N'K3', 4443)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (39, 90, CAST(N'2024-11-02' AS Date), N'K1', 444)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (40, 90, CAST(N'2024-11-02' AS Date), N'K2', 44)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (41, 90, CAST(N'2024-11-02' AS Date), N'K3', 44)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (42, 90, CAST(N'2024-11-03' AS Date), N'K1', 44)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (43, 90, CAST(N'2024-11-03' AS Date), N'K2', 44)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (44, 90, CAST(N'2024-11-03' AS Date), N'K3', 44)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (45, 90, CAST(N'2024-11-04' AS Date), N'K1', 44)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (46, 90, CAST(N'2024-11-04' AS Date), N'K2', 44)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (47, 90, CAST(N'2024-11-04' AS Date), N'K3', 44)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (48, 90, CAST(N'2024-11-05' AS Date), N'K1', 44)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (49, 90, CAST(N'2024-11-05' AS Date), N'K2', 44)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (50, 90, CAST(N'2024-11-05' AS Date), N'K3', 44)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (51, 90, CAST(N'2024-11-02' AS Date), N'K1', 11)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (52, 90, CAST(N'2024-11-02' AS Date), N'K2', 11)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (53, 90, CAST(N'2024-11-02' AS Date), N'K3', 11)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (54, 90, CAST(N'2024-11-03' AS Date), N'K1', 11)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (55, 90, CAST(N'2024-11-03' AS Date), N'K2', 11)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (56, 90, CAST(N'2024-11-03' AS Date), N'K3', 11)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (57, 90, CAST(N'2024-11-04' AS Date), N'K1', 11)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (58, 90, CAST(N'2024-11-04' AS Date), N'K2', 11)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (59, 90, CAST(N'2024-11-04' AS Date), N'K3', 11)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (60, 90, CAST(N'2024-11-05' AS Date), N'K1', 11)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (61, 90, CAST(N'2024-11-05' AS Date), N'K2', 111)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (62, 90, CAST(N'2024-11-05' AS Date), N'K3', 11)
SET IDENTITY_INSERT [dbo].[SchedualCampaign] OFF
GO
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [Quantity]) VALUES (1, 15, 1, CAST(100 AS Decimal(18, 0)))
GO
INSERT [dbo].[User] ([UserName], [password]) VALUES (N'admin1', N'123')
INSERT [dbo].[User] ([UserName], [password]) VALUES (N'admin2', N'123')
INSERT [dbo].[User] ([UserName], [password]) VALUES (N'admin3', N'123')
INSERT [dbo].[User] ([UserName], [password]) VALUES (N'admin4', N'123')
GO
INSERT [dbo].[UserRole] ([UserName], [RoleID]) VALUES (N'admin1', 1)
INSERT [dbo].[UserRole] ([UserName], [RoleID]) VALUES (N'admin2', 2)
INSERT [dbo].[UserRole] ([UserName], [RoleID]) VALUES (N'admin3', 3)
INSERT [dbo].[UserRole] ([UserName], [RoleID]) VALUES (N'admin4', 5)
GO
ALTER TABLE [dbo].[Attendence]  WITH CHECK ADD  CONSTRAINT [FK_Attendence_SchedualEmployee] FOREIGN KEY([SchEmpID])
REFERENCES [dbo].[SchedualEmployee] ([SchEmpID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Attendence] CHECK CONSTRAINT [FK_Attendence_SchedualEmployee]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Department] FOREIGN KEY([DepartmentID])
REFERENCES [dbo].[Department] ([DepartmentID])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Department]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Role] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Role] ([RoleID])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Role]
GO
ALTER TABLE [dbo].[Plan]  WITH CHECK ADD  CONSTRAINT [FK_Plan_Department1] FOREIGN KEY([DepartmentID])
REFERENCES [dbo].[Department] ([DepartmentID])
GO
ALTER TABLE [dbo].[Plan] CHECK CONSTRAINT [FK_Plan_Department1]
GO
ALTER TABLE [dbo].[PlanCampain]  WITH CHECK ADD  CONSTRAINT [FK_PlanCampain_Plan] FOREIGN KEY([PlanID])
REFERENCES [dbo].[Plan] ([PlanID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PlanCampain] CHECK CONSTRAINT [FK_PlanCampain_Plan]
GO
ALTER TABLE [dbo].[PlanCampain]  WITH CHECK ADD  CONSTRAINT [FK_PlanCampain_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[PlanCampain] CHECK CONSTRAINT [FK_PlanCampain_Product]
GO
ALTER TABLE [dbo].[RoleFeature]  WITH CHECK ADD  CONSTRAINT [FK_RoleFeature_Feature] FOREIGN KEY([FeatureID])
REFERENCES [dbo].[Feature] ([FeatureID])
GO
ALTER TABLE [dbo].[RoleFeature] CHECK CONSTRAINT [FK_RoleFeature_Feature]
GO
ALTER TABLE [dbo].[RoleFeature]  WITH CHECK ADD  CONSTRAINT [FK_RoleFeature_Role] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Role] ([RoleID])
GO
ALTER TABLE [dbo].[RoleFeature] CHECK CONSTRAINT [FK_RoleFeature_Role]
GO
ALTER TABLE [dbo].[SchedualCampaign]  WITH CHECK ADD  CONSTRAINT [FK_SchedualCampaign_PlanCampain] FOREIGN KEY([PlanCampnID])
REFERENCES [dbo].[PlanCampain] ([PlanCampnID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SchedualCampaign] CHECK CONSTRAINT [FK_SchedualCampaign_PlanCampain]
GO
ALTER TABLE [dbo].[SchedualEmployee]  WITH CHECK ADD  CONSTRAINT [FK_SchedualEmployee_Employee] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employee] ([EmployeeID])
GO
ALTER TABLE [dbo].[SchedualEmployee] CHECK CONSTRAINT [FK_SchedualEmployee_Employee]
GO
ALTER TABLE [dbo].[SchedualEmployee]  WITH CHECK ADD  CONSTRAINT [FK_SchedualEmployee_SchedualCampaign] FOREIGN KEY([ScID])
REFERENCES [dbo].[SchedualCampaign] ([ScID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SchedualEmployee] CHECK CONSTRAINT [FK_SchedualEmployee_SchedualCampaign]
GO
ALTER TABLE [dbo].[UserRole]  WITH CHECK ADD  CONSTRAINT [FK_UserRole_Role] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Role] ([RoleID])
GO
ALTER TABLE [dbo].[UserRole] CHECK CONSTRAINT [FK_UserRole_Role]
GO
ALTER TABLE [dbo].[UserRole]  WITH CHECK ADD  CONSTRAINT [FK_UserRole_User] FOREIGN KEY([UserName])
REFERENCES [dbo].[User] ([UserName])
GO
ALTER TABLE [dbo].[UserRole] CHECK CONSTRAINT [FK_UserRole_User]
GO
