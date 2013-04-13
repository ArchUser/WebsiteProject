USE [Dorknozzle]
GO
/****** Object:  Table [dbo].[EmployeeStore]    Script Date: 04/04/2011 10:45:30 ******/
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
