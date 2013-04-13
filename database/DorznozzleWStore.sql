USE [Dorknozzle]
GO
/****** Object:  Table [dbo].[HelpDeskSubjects]    Script Date: 04/04/2011 10:43:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HelpDeskSubjects](
	[SubjectID] [int] IDENTITY(1,1) NOT NULL,
	[Subject] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_HelpDeskSubjects] PRIMARY KEY CLUSTERED 
(
	[SubjectID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[HelpDeskSubjects] ON
INSERT [dbo].[HelpDeskSubjects] ([SubjectID], [Subject]) VALUES (1, N'Computer won''t start')
INSERT [dbo].[HelpDeskSubjects] ([SubjectID], [Subject]) VALUES (2, N'Monitor won''t turn on')
INSERT [dbo].[HelpDeskSubjects] ([SubjectID], [Subject]) VALUES (3, N'Chair is broken')
INSERT [dbo].[HelpDeskSubjects] ([SubjectID], [Subject]) VALUES (4, N'Office won''t work')
INSERT [dbo].[HelpDeskSubjects] ([SubjectID], [Subject]) VALUES (5, N'Windows won''t work')
INSERT [dbo].[HelpDeskSubjects] ([SubjectID], [Subject]) VALUES (6, N'Computer crashes')
INSERT [dbo].[HelpDeskSubjects] ([SubjectID], [Subject]) VALUES (7, N'Other')
SET IDENTITY_INSERT [dbo].[HelpDeskSubjects] OFF
/****** Object:  Table [dbo].[HelpDeskStatus]    Script Date: 04/04/2011 10:43:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HelpDeskStatus](
	[StatusID] [int] IDENTITY(1,1) NOT NULL,
	[Status] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_HelpDeskStatus] PRIMARY KEY CLUSTERED 
(
	[StatusID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[HelpDeskStatus] ON
INSERT [dbo].[HelpDeskStatus] ([StatusID], [Status]) VALUES (1, N'Open')
INSERT [dbo].[HelpDeskStatus] ([StatusID], [Status]) VALUES (2, N'Closed')
SET IDENTITY_INSERT [dbo].[HelpDeskStatus] OFF
/****** Object:  Table [dbo].[HelpDeskCategories]    Script Date: 04/04/2011 10:43:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HelpDeskCategories](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[Category] [nvarchar](50) NULL,
 CONSTRAINT [PK_HelpDeskCategories] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[HelpDeskCategories] ON
INSERT [dbo].[HelpDeskCategories] ([CategoryID], [Category]) VALUES (1, N'Hardware')
INSERT [dbo].[HelpDeskCategories] ([CategoryID], [Category]) VALUES (2, N'Software')
INSERT [dbo].[HelpDeskCategories] ([CategoryID], [Category]) VALUES (3, N'Workstation')
INSERT [dbo].[HelpDeskCategories] ([CategoryID], [Category]) VALUES (4, N'Other/Don''t know')
SET IDENTITY_INSERT [dbo].[HelpDeskCategories] OFF
/****** Object:  Table [dbo].[Departments]    Script Date: 04/04/2011 10:43:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departments](
	[DepartmentID] [int] IDENTITY(1,1) NOT NULL,
	[Department] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Departments] PRIMARY KEY CLUSTERED 
(
	[DepartmentID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Departments] ON
INSERT [dbo].[Departments] ([DepartmentID], [Department]) VALUES (1, N'Accounting')
INSERT [dbo].[Departments] ([DepartmentID], [Department]) VALUES (2, N'Administration')
INSERT [dbo].[Departments] ([DepartmentID], [Department]) VALUES (3, N'Business Development')
INSERT [dbo].[Departments] ([DepartmentID], [Department]) VALUES (4, N'Customer Support')
INSERT [dbo].[Departments] ([DepartmentID], [Department]) VALUES (5, N'Executive')
INSERT [dbo].[Departments] ([DepartmentID], [Department]) VALUES (6, N'Engineering')
INSERT [dbo].[Departments] ([DepartmentID], [Department]) VALUES (7, N'Facilities')
INSERT [dbo].[Departments] ([DepartmentID], [Department]) VALUES (8, N'IT')
INSERT [dbo].[Departments] ([DepartmentID], [Department]) VALUES (9, N'Marketing')
INSERT [dbo].[Departments] ([DepartmentID], [Department]) VALUES (10, N'Operations')
SET IDENTITY_INSERT [dbo].[Departments] OFF
/****** Object:  Table [dbo].[EmployeeStore]    Script Date: 04/04/2011 10:43:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeeStore](
	[ItemID] [int] NOT NULL,
	[ItemName] [nvarchar](50) NULL,
	[ImageURL] [nvarchar](50) NULL,
	[Quantity] [int] NULL,
	[Cost] [money] NULL,
	[Description] [nvarchar](max) NULL
) ON [PRIMARY]
GO
INSERT [dbo].[EmployeeStore] ([ItemID], [ItemName], [ImageURL], [Quantity], [Cost], [Description]) VALUES (1, N'T-Shirt', N'tshirt.gif', 150, 12.9900, NULL)
INSERT [dbo].[EmployeeStore] ([ItemID], [ItemName], [ImageURL], [Quantity], [Cost], [Description]) VALUES (2, N'Hooded Sweat Shirt', N'hoodie.gif', 40, 32.9900, NULL)
INSERT [dbo].[EmployeeStore] ([ItemID], [ItemName], [ImageURL], [Quantity], [Cost], [Description]) VALUES (3, N'Longsleeve Shirt', N'longsleeve.gif', 60, 19.9900, NULL)
INSERT [dbo].[EmployeeStore] ([ItemID], [ItemName], [ImageURL], [Quantity], [Cost], [Description]) VALUES (4, N'Polo Shirt', N'polo.gif', 35, 29.9900, NULL)
INSERT [dbo].[EmployeeStore] ([ItemID], [ItemName], [ImageURL], [Quantity], [Cost], [Description]) VALUES (5, N'Sticker', N'sticker.gif', 1500, 1.9900, NULL)
INSERT [dbo].[EmployeeStore] ([ItemID], [ItemName], [ImageURL], [Quantity], [Cost], [Description]) VALUES (6, N'Mousepad', N'mousepad.gif', 1000, 5.9900, NULL)
INSERT [dbo].[EmployeeStore] ([ItemID], [ItemName], [ImageURL], [Quantity], [Cost], [Description]) VALUES (7, N'Mug', N'coffeemug.gif', 500, 5.9900, NULL)
INSERT [dbo].[EmployeeStore] ([ItemID], [ItemName], [ImageURL], [Quantity], [Cost], [Description]) VALUES (8, N'Water Bottle', N'waterbottle.gif', 300, 5.9900, NULL)
INSERT [dbo].[EmployeeStore] ([ItemID], [ItemName], [ImageURL], [Quantity], [Cost], [Description]) VALUES (9, N'Golf Balls', N'golfballs.gif', 100, 2.9900, NULL)
INSERT [dbo].[EmployeeStore] ([ItemID], [ItemName], [ImageURL], [Quantity], [Cost], [Description]) VALUES (10, N'Pen', N'pen.gif', 1500, 1.9900, NULL)
INSERT [dbo].[EmployeeStore] ([ItemID], [ItemName], [ImageURL], [Quantity], [Cost], [Description]) VALUES (11, N'Carry Bag', N'carrybag.gif', 80, 9.0000, NULL)
/****** Object:  Table [dbo].[Employees]    Script Date: 04/04/2011 10:43:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[EmployeeID] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NULL,
	[Address] [nvarchar](50) NULL,
	[City] [nvarchar](50) NULL,
	[State] [nvarchar](50) NULL,
	[Zip] [nvarchar](50) NULL,
	[HomePhone] [nvarchar](50) NULL,
	[Extension] [nvarchar](50) NULL,
	[MobilePhone] [nvarchar](50) NULL,
	[Picture] [nvarchar](50) NULL,
 CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Employees] ON
INSERT [dbo].[Employees] ([EmployeeID], [DepartmentID], [Name], [Username], [Password], [Address], [City], [State], [Zip], [HomePhone], [Extension], [MobilePhone], [Picture]) VALUES (1, 5, N'Zak Ruvalcaba', N'zak', N'zak', NULL, N'San Diego', N'Ca', NULL, NULL, NULL, N'555-555-5551', N'facef1.jpg')
INSERT [dbo].[Employees] ([EmployeeID], [DepartmentID], [Name], [Username], [Password], [Address], [City], [State], [Zip], [HomePhone], [Extension], [MobilePhone], [Picture]) VALUES (2, 9, N'Jessica Ruvalcaba', N'jessica', N'jessica', NULL, N'San Diego', N'Ca', NULL, NULL, NULL, N'555-555-5552', N'facem1.jpg')
INSERT [dbo].[Employees] ([EmployeeID], [DepartmentID], [Name], [Username], [Password], [Address], [City], [State], [Zip], [HomePhone], [Extension], [MobilePhone], [Picture]) VALUES (3, 6, N'Ted Lindsey', N'ted', N'ted', NULL, N'San Diego', N'Ca', NULL, NULL, NULL, N'555-555-5555', N'facef2.jpg')
INSERT [dbo].[Employees] ([EmployeeID], [DepartmentID], [Name], [Username], [Password], [Address], [City], [State], [Zip], [HomePhone], [Extension], [MobilePhone], [Picture]) VALUES (4, 6, N'Shane Weebe', N'shane', N'shane', N'', N'San Diego', N'Ca', N'', N'', N'2343', N'555-555-5554', N'facem2.jpg')
INSERT [dbo].[Employees] ([EmployeeID], [DepartmentID], [Name], [Username], [Password], [Address], [City], [State], [Zip], [HomePhone], [Extension], [MobilePhone], [Picture]) VALUES (5, 9, N'David Levinson', N'david', N'david', N'123 Sunset Blvd.', N'San Diego', N'Ca', N'', N'', N'', N'555-555-5553', N'facef1.jpg')
INSERT [dbo].[Employees] ([EmployeeID], [DepartmentID], [Name], [Username], [Password], [Address], [City], [State], [Zip], [HomePhone], [Extension], [MobilePhone], [Picture]) VALUES (6, 1, N'Geoff Kim', N'geoff', N'geoff', N'123 Sunset blvd.', N'San Diego', N'Ca', N'', N'', N'', N'555-555-5556', N'facem2.jpg')
INSERT [dbo].[Employees] ([EmployeeID], [DepartmentID], [Name], [Username], [Password], [Address], [City], [State], [Zip], [HomePhone], [Extension], [MobilePhone], [Picture]) VALUES (7, 6, N'Joanne Filotti', N'jofilotti', N'fido', N'123 Main', N'Toronto', N'ON', N'M1E 1E1', N'416-289-5000', N'8127', N'416-289-5000', N'facef2.jpg')
SET IDENTITY_INSERT [dbo].[Employees] OFF
/****** Object:  Table [dbo].[HelpDesk]    Script Date: 04/04/2011 10:43:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HelpDesk](
	[RequestID] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeID] [int] NOT NULL,
	[StationNumber] [int] NULL,
	[CategoryID] [int] NOT NULL,
	[SubjectID] [int] NOT NULL,
	[Description] [nvarchar](50) NULL,
	[StatusID] [int] NOT NULL,
 CONSTRAINT [PK_HelpDesk] PRIMARY KEY CLUSTERED 
(
	[RequestID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[HelpDesk] ON
INSERT [dbo].[HelpDesk] ([RequestID], [EmployeeID], [StationNumber], [CategoryID], [SubjectID], [Description], [StatusID]) VALUES (1, 5, 23, 2, 1, N'today''s problem', 1)
INSERT [dbo].[HelpDesk] ([RequestID], [EmployeeID], [StationNumber], [CategoryID], [SubjectID], [Description], [StatusID]) VALUES (2, 5, 12, 2, 3, N'2222', 1)
INSERT [dbo].[HelpDesk] ([RequestID], [EmployeeID], [StationNumber], [CategoryID], [SubjectID], [Description], [StatusID]) VALUES (3, 5, 3, 2, 3, N'chair is broken', 1)
INSERT [dbo].[HelpDesk] ([RequestID], [EmployeeID], [StationNumber], [CategoryID], [SubjectID], [Description], [StatusID]) VALUES (4, 5, 33, 1, 6, N'bsd', 1)
SET IDENTITY_INSERT [dbo].[HelpDesk] OFF
/****** Object:  StoredProcedure [dbo].[UpdateEmployeeDetails]    Script Date: 04/04/2011 10:43:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateEmployeeDetails]
(
  @EmployeeID Int,
  @NewAddress nvarchar(50),
  @NewCity nvarchar(50)
)
AS
UPDATE Employees
SET Address = @NewAddress, City = @NewCity
WHERE EmployeeID = @EmployeeID;
GO
/****** Object:  StoredProcedure [dbo].[UpdateEmployee]    Script Date: 04/04/2011 10:43:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateEmployee]
(
  @EmployeeID Int,
  @NewName nvarchar(50),
  @NewUsername nvarchar(50)
)
AS
UPDATE Employees
SET Name = @NewName, Username = @NewUsername
WHERE EmployeeID = @EmployeeID;
GO
/****** Object:  StoredProcedure [dbo].[InsertHelpDesk]    Script Date: 04/04/2011 10:43:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertHelpDesk]
(
  @EmployeeID int,
  @StationNumber int,
  @CategoryID int,
  @SubjectID int,
  @Description nvarchar(50),
  @StatusID int
)
AS
INSERT INTO HelpDesk (EmployeeID, StationNumber, CategoryID,
    SubjectID, Description, StatusID)
VALUES (@EmployeeID, @StationNumber, @CategoryID, @SubjectID,
    @Description, @StatusID)
GO
/****** Object:  ForeignKey [FK_Employees_Departments]    Script Date: 04/04/2011 10:43:34 ******/
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [FK_Employees_Departments] FOREIGN KEY([DepartmentID])
REFERENCES [dbo].[Departments] ([DepartmentID])
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK_Employees_Departments]
GO
/****** Object:  ForeignKey [FK_HelpDesk_Employees]    Script Date: 04/04/2011 10:43:34 ******/
ALTER TABLE [dbo].[HelpDesk]  WITH CHECK ADD  CONSTRAINT [FK_HelpDesk_Employees] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employees] ([EmployeeID])
GO
ALTER TABLE [dbo].[HelpDesk] CHECK CONSTRAINT [FK_HelpDesk_Employees]
GO
/****** Object:  ForeignKey [FK_HelpDesk_HelpDeskCategories]    Script Date: 04/04/2011 10:43:34 ******/
ALTER TABLE [dbo].[HelpDesk]  WITH CHECK ADD  CONSTRAINT [FK_HelpDesk_HelpDeskCategories] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[HelpDeskCategories] ([CategoryID])
GO
ALTER TABLE [dbo].[HelpDesk] CHECK CONSTRAINT [FK_HelpDesk_HelpDeskCategories]
GO
/****** Object:  ForeignKey [FK_HelpDesk_HelpDeskStatus]    Script Date: 04/04/2011 10:43:34 ******/
ALTER TABLE [dbo].[HelpDesk]  WITH CHECK ADD  CONSTRAINT [FK_HelpDesk_HelpDeskStatus] FOREIGN KEY([StatusID])
REFERENCES [dbo].[HelpDeskStatus] ([StatusID])
GO
ALTER TABLE [dbo].[HelpDesk] CHECK CONSTRAINT [FK_HelpDesk_HelpDeskStatus]
GO
/****** Object:  ForeignKey [FK_HelpDesk_HelpDeskSubjects]    Script Date: 04/04/2011 10:43:34 ******/
ALTER TABLE [dbo].[HelpDesk]  WITH CHECK ADD  CONSTRAINT [FK_HelpDesk_HelpDeskSubjects] FOREIGN KEY([SubjectID])
REFERENCES [dbo].[HelpDeskSubjects] ([SubjectID])
GO
ALTER TABLE [dbo].[HelpDesk] CHECK CONSTRAINT [FK_HelpDesk_HelpDeskSubjects]
GO
