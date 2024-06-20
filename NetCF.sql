
USE [NetCF]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account]
(
	[id] [int] IDENTITY(1,1) NOT NULL,
	[balance] [float] NOT NULL,
	[createdAt] [datetime2](7) NOT NULL,
	[deletedAt] [datetime2](7) NULL,
	[password] [varchar](45) NOT NULL,
	[role] [int] NULL,
	[username] [varchar](45) NOT NULL,
	PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Computer]
(
	[id] [int] IDENTITY(1,1) NOT NULL,
	[createdAt] [datetime2](7) NOT NULL,
	[deletedAt] [datetime2](7) NULL,
	[name] [varchar](100) NOT NULL,
	[price] [float] NOT NULL,
	[status] [int] NULL,
	[type] [int] NULL,
	PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ComputerUsage]
(
	[id] [int] IDENTITY(1,1) NOT NULL,
	[computerID] [int] NULL,
	[createdAt] [datetime2](7) NOT NULL,
	[endAt] [datetime2](7) NULL,
	[isEmployeeUsing] [bit] NOT NULL,
	[totalMoney] [float] NULL,
	[usedByAccountId] [int] NULL,
	[usedBy] [int] NULL,
	CONSTRAINT [PK__Computer__3213E83FC8E93F82] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee]
(
	[id] [int] IDENTITY(1,1) NOT NULL,
	[accountID] [int] NULL,
	[createdAt] [datetime2](7) NOT NULL,
	[deletedAt] [datetime2](7) NULL,
	[name] [nvarchar](100) NOT NULL,
	[otherInformation] [nvarchar](255) NULL,
	[salaryPerHour] [int] NULL,
	[phoneNumber] [char](15) NULL,
	[address] [nvarchar](250) NULL,
	CONSTRAINT [PK__Employee__3213E83F302F774D] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Invoice]
(
	[id] [int] IDENTITY(1,1) NOT NULL,
	[computerId] [int] NULL,
	[createdAt] [datetime2](7) NOT NULL,
	[createdBy] [int] NOT NULL,
	[createdToAccountId] [int] NULL,
	[deletedAt] [datetime2](7) NULL,
	[isPaid] [bit] NOT NULL,
	[note] [text] NULL,
	[status] [int] NOT NULL,
	[total] [float] NULL,
	[type] [int] NOT NULL,
	CONSTRAINT [PK__Invoice__3213E83F58DFCC58] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InvoiceDetail]
(
	[id] [int] IDENTITY(1,1) NOT NULL,
	[invoiceId] [int] NOT NULL,
	[price] [float] NOT NULL,
	[productId] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Message]
(
	[id] [int] IDENTITY(1,1) NOT NULL,
	[sessionId] [int] NOT NULL,
	[content] [nvarchar](255) NULL,
	[fromType] [int] NULL,
	[createdAt] [datetime2](7) NULL,
	CONSTRAINT [PK__Message__3213E83F731F660F] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product]
(
	[id] [int] IDENTITY(1,1) NOT NULL,
	[createdAt] [datetime2](7) NOT NULL,
	[deletedAt] [datetime2](7) NULL,
	[description] [ntext] NOT NULL,
	[image] [nvarchar](255) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[price] [float] NOT NULL,
	[stock] [int] NOT NULL,
	[type] [int] NULL,
	CONSTRAINT [PK__Product__3213E83F4D1FA368] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Session]
(
	[id] [int] IDENTITY(1,1) NOT NULL,
	[computerID] [int] NOT NULL,
	[prepaidAmount] [float] NULL,
	[serviceCost] [int] NOT NULL,
	[startTime] [datetime2](7) NOT NULL,
	[totalTime] [int] NULL,
	[usedCost] [int] NOT NULL,
	[usedTime] [int] NOT NULL,
	[usingBy] [int] NULL,
	CONSTRAINT [PK__Session__3213E83FFAE34045] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Account] ON

INSERT [dbo].[Account]
	([id], [balance], [createdAt], [deletedAt], [password], [role], [username])
VALUES
	(1, 0, CAST(N'2024-06-19T00:00:00.0000000' AS DateTime2), NULL, N'admin', 0, N'admin')
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
SET IDENTITY_INSERT [dbo].[Computer] ON

INSERT [dbo].[Computer]
	([id], [createdAt], [deletedAt], [name], [price], [status], [type])
VALUES
	(1, CAST(N'2024-06-19T15:25:30.3980000' AS DateTime2), NULL, N'Máy 1', 5000, 2, 1)
INSERT [dbo].[Computer]
	([id], [createdAt], [deletedAt], [name], [price], [status], [type])
VALUES
	(2, CAST(N'2024-06-19T15:25:30.4040000' AS DateTime2), NULL, N'Máy 2', 10000, 2, 0)
INSERT [dbo].[Computer]
	([id], [createdAt], [deletedAt], [name], [price], [status], [type])
VALUES
	(3, CAST(N'2024-06-19T15:25:30.4060000' AS DateTime2), NULL, N'Máy 3', 5000, 2, 1)
INSERT [dbo].[Computer]
	([id], [createdAt], [deletedAt], [name], [price], [status], [type])
VALUES
	(4, CAST(N'2024-06-19T15:25:30.4070000' AS DateTime2), NULL, N'Máy 4', 5000, 2, 1)
INSERT [dbo].[Computer]
	([id], [createdAt], [deletedAt], [name], [price], [status], [type])
VALUES
	(5, CAST(N'2024-06-19T15:25:30.4080000' AS DateTime2), NULL, N'Máy 5', 5000, 2, 1)
INSERT [dbo].[Computer]
	([id], [createdAt], [deletedAt], [name], [price], [status], [type])
VALUES
	(6, CAST(N'2024-06-19T15:25:30.4090000' AS DateTime2), NULL, N'Máy 6', 10000, 2, 0)
INSERT [dbo].[Computer]
	([id], [createdAt], [deletedAt], [name], [price], [status], [type])
VALUES
	(7, CAST(N'2024-06-19T15:25:30.4110000' AS DateTime2), NULL, N'Máy 7', 10000, 2, 0)
INSERT [dbo].[Computer]
	([id], [createdAt], [deletedAt], [name], [price], [status], [type])
VALUES
	(8, CAST(N'2024-06-19T15:25:30.4120000' AS DateTime2), NULL, N'Máy 8', 10000, 2, 0)
INSERT [dbo].[Computer]
	([id], [createdAt], [deletedAt], [name], [price], [status], [type])
VALUES
	(9, CAST(N'2024-06-19T15:25:30.4140000' AS DateTime2), NULL, N'Máy 9', 5000, 2, 1)
INSERT [dbo].[Computer]
	([id], [createdAt], [deletedAt], [name], [price], [status], [type])
VALUES
	(10, CAST(N'2024-06-19T15:25:30.4150000' AS DateTime2), NULL, N'Máy 10', 5000, 2, 1)
INSERT [dbo].[Computer]
	([id], [createdAt], [deletedAt], [name], [price], [status], [type])
VALUES
	(11, CAST(N'2024-06-19T15:25:30.4170000' AS DateTime2), NULL, N'Máy 11', 5000, 2, 1)
INSERT [dbo].[Computer]
	([id], [createdAt], [deletedAt], [name], [price], [status], [type])
VALUES
	(12, CAST(N'2024-06-19T15:25:30.4180000' AS DateTime2), NULL, N'Máy 12', 10000, 2, 0)
INSERT [dbo].[Computer]
	([id], [createdAt], [deletedAt], [name], [price], [status], [type])
VALUES
	(13, CAST(N'2024-06-19T15:25:30.4200000' AS DateTime2), NULL, N'Máy 13', 5000, 2, 1)
INSERT [dbo].[Computer]
	([id], [createdAt], [deletedAt], [name], [price], [status], [type])
VALUES
	(14, CAST(N'2024-06-19T15:25:30.4220000' AS DateTime2), NULL, N'Máy 14', 10000, 2, 0)
INSERT [dbo].[Computer]
	([id], [createdAt], [deletedAt], [name], [price], [status], [type])
VALUES
	(15, CAST(N'2024-06-19T15:25:30.4240000' AS DateTime2), NULL, N'Máy 15', 10000, 2, 0)
INSERT [dbo].[Computer]
	([id], [createdAt], [deletedAt], [name], [price], [status], [type])
VALUES
	(16, CAST(N'2024-06-19T15:25:30.4250000' AS DateTime2), NULL, N'Máy 16', 10000, 2, 0)
INSERT [dbo].[Computer]
	([id], [createdAt], [deletedAt], [name], [price], [status], [type])
VALUES
	(17, CAST(N'2024-06-19T15:25:30.4270000' AS DateTime2), NULL, N'Máy 17', 10000, 2, 0)
INSERT [dbo].[Computer]
	([id], [createdAt], [deletedAt], [name], [price], [status], [type])
VALUES
	(18, CAST(N'2024-06-19T15:25:30.4280000' AS DateTime2), NULL, N'Máy 18', 10000, 2, 0)
INSERT [dbo].[Computer]
	([id], [createdAt], [deletedAt], [name], [price], [status], [type])
VALUES
	(19, CAST(N'2024-06-19T15:25:30.4290000' AS DateTime2), NULL, N'Máy 19', 10000, 2, 0)
INSERT [dbo].[Computer]
	([id], [createdAt], [deletedAt], [name], [price], [status], [type])
VALUES
	(20, CAST(N'2024-06-19T15:25:30.4300000' AS DateTime2), NULL, N'Máy 20', 5000, 2, 1)
SET IDENTITY_INSERT [dbo].[Computer] OFF
GO


SET IDENTITY_INSERT [dbo].[ComputerUsage] ON

INSERT [dbo].[ComputerUsage]
	([id], [computerID], [createdAt], [endAt], [isEmployeeUsing], [totalMoney], [usedByAccountId], [usedBy])
VALUES
	(1, 20, CAST(N'2024-06-19T05:24:58.6430000' AS DateTime2), CAST(N'2021-07-25T10:24:58.6430000' AS DateTime2), 0, 25000, NULL, NULL)
INSERT [dbo].[ComputerUsage]
	([id], [computerID], [createdAt], [endAt], [isEmployeeUsing], [totalMoney], [usedByAccountId], [usedBy])
VALUES
	(2, 10, CAST(N'2024-06-19T20:32:10.4320000' AS DateTime2), CAST(N'2021-11-19T22:56:10.4320000' AS DateTime2), 0, 12000, 15, NULL)
INSERT [dbo].[ComputerUsage]
	([id], [computerID], [createdAt], [endAt], [isEmployeeUsing], [totalMoney], [usedByAccountId], [usedBy])
VALUES
	(3, 6, CAST(N'2024-06-19T06:01:56.3750000' AS DateTime2), CAST(N'2021-08-06T08:07:56.3750000' AS DateTime2), 0, 21000, 67, NULL)
SET IDENTITY_INSERT [dbo].[ComputerUsage] OFF
GO

SET IDENTITY_INSERT [dbo].[Employee] ON

INSERT [dbo].[Employee]
	([id], [accountID], [createdAt], [deletedAt], [name], [otherInformation], [salaryPerHour], [phoneNumber], [address])
VALUES
	(1, 1, CAST(N'2024-06-19T15:25:30.3550000' AS DateTime2), NULL, N'admin', N'admin', 0, N'0372843512', N'Mai Thanh Cong ')
SET IDENTITY_INSERT [dbo].[Employee] OFF
GO

SET IDENTITY_INSERT [dbo].[Invoice] ON
INSERT [dbo].[Invoice]
	([id], [computerId], [createdAt], [createdBy], [createdToAccountId], [deletedAt], [isPaid], [note], [status], [total], [type])
VALUES
	(1, NULL, CAST(N'2024-06-19T04:34:21.0570000' AS DateTime2), 4, NULL, NULL, 0, NULL, 3, 10971090, 0)
INSERT [dbo].[Invoice]
	([id], [computerId], [createdAt], [createdBy], [createdToAccountId], [deletedAt], [isPaid], [note], [status], [total], [type])
VALUES
	(2, NULL, CAST(N'2024-06-19T11:57:28.2420000' AS DateTime2), 3, NULL, NULL, 0, NULL, 3, 3784960, 0)
INSERT [dbo].[Invoice]
	([id], [computerId], [createdAt], [createdBy], [createdToAccountId], [deletedAt], [isPaid], [note], [status], [total], [type])
VALUES
	(3, NULL, CAST(N'2024-06-19T00:06:24.0730000' AS DateTime2), 4, NULL, NULL, 0, NULL, 3, 10718270, 0)
INSERT [dbo].[Invoice]
	([id], [computerId], [createdAt], [createdBy], [createdToAccountId], [deletedAt], [isPaid], [note], [status], [total], [type])
VALUES
	(4, NULL, CAST(N'2024-06-19T16:37:19.8000000' AS DateTime2), 2, NULL, NULL, 0, NULL, 3, 2316500, 0)
INSERT [dbo].[Invoice]
	([id], [computerId], [createdAt], [createdBy], [createdToAccountId], [deletedAt], [isPaid], [note], [status], [total], [type])
VALUES
	(5, NULL, CAST(N'2024-06-19T07:10:17.2610000' AS DateTime2), 2, NULL, NULL, 0, NULL, 3, 18098400, 0)

SET IDENTITY_INSERT [dbo].[Invoice] OFF
GO

SET IDENTITY_INSERT [dbo].[InvoiceDetail] ON

INSERT [dbo].[InvoiceDetail]
	([id], [invoiceId], [price], [productId], [quantity])
VALUES
	(1, 1, 466600000, 15, 21)
INSERT [dbo].[InvoiceDetail]
	([id], [invoiceId], [price], [productId], [quantity])
VALUES
	(2, 1, 61710000, 9, 19)

SET IDENTITY_INSERT [dbo].[InvoiceDetail] OFF
GO

SET IDENTITY_INSERT [dbo].[Product] ON

INSERT [dbo].[Product]
	([id], [createdAt], [deletedAt], [description], [image], [name], [price], [stock], [type])
VALUES
	(1, CAST(N'2024-06-19T01:16:46.4630000' AS DateTime2), NULL, N'Com chiên bò', N'/images/Cơm_chiên_bò.jpg', N'Cơm chiên bò', 30000, -1, 0)
INSERT [dbo].[Product]
	([id], [createdAt], [deletedAt], [description], [image], [name], [price], [stock], [type])
VALUES
	(2, CAST(N'2024-06-19T01:16:46.4630000' AS DateTime2), NULL, N'Com chiên trứng', N'/images/Cơm_chiên_trứng.jpg', N'Cơm chiên trứng', 30000, -1, 0)
INSERT [dbo].[Product]
	([id], [createdAt], [deletedAt], [description], [image], [name], [price], [stock], [type])
VALUES
	(3, CAST(N'2024-06-19T01:16:46.4630000' AS DateTime2), NULL, N'Nui xào bò', N'/images/Nui_xào_bò.jpg', N'Nui xào bò', 30000, -1, 0)
INSERT [dbo].[Product]
	([id], [createdAt], [deletedAt], [description], [image], [name], [price], [stock], [type])
VALUES
	(4, CAST(N'2024-06-19T01:16:46.4630000' AS DateTime2), NULL, N'Mì tôm', N'/images/Mì_tôm.jpg', N'Mì tôm', 10000, 20, 0)
INSERT [dbo].[Product]
	([id], [createdAt], [deletedAt], [description], [image], [name], [price], [stock], [type])
VALUES
	(5, CAST(N'2024-06-19T01:16:46.4630000' AS DateTime2), NULL, N'Mì tôm trứng', N'/images/Mì_tôm_trứng.jpg', N'Mì tôm trứng', 20000, 40, 0)
INSERT [dbo].[Product]
	([id], [createdAt], [deletedAt], [description], [image], [name], [price], [stock], [type])
VALUES
	(6, CAST(N'2024-06-19T01:16:46.4630000' AS DateTime2), NULL, N'Cá viên chiên', N'/images/Cá_viên_chiên.jpg', N'Cá viên chiên', 15000, 36, 0)
INSERT [dbo].[Product]
	([id], [createdAt], [deletedAt], [description], [image], [name], [price], [stock], [type])
VALUES
	(7, CAST(N'2024-06-19T01:16:46.4630000' AS DateTime2), NULL, N'Mì xào bò', N'/images/Mì_xào_bò.jpg', N'Mì xào bò', 30000, -2, 0)
INSERT [dbo].[Product]
	([id], [createdAt], [deletedAt], [description], [image], [name], [price], [stock], [type])
VALUES
	(8, CAST(N'2024-06-19T01:16:46.4630000' AS DateTime2), NULL, N'Com rang thập cẩm', N'/images/Cơm_rang_thập_cẩm.jpg', N'Com rang thập cẩm', 30000, -1, 0)
INSERT [dbo].[Product]
	([id], [createdAt], [deletedAt], [description], [image], [name], [price], [stock], [type])
VALUES
	(9, CAST(N'2024-06-19T01:16:46.4630000' AS DateTime2), NULL, N'Coca', N'/images/Coca.jpg', N'Coca', 15000, 60, 1)
INSERT [dbo].[Product]
	([id], [createdAt], [deletedAt], [description], [image], [name], [price], [stock], [type])
VALUES
	(10, CAST(N'2024-06-19T01:16:46.4630000' AS DateTime2), NULL, N'Pepsi', N'/images/Pepsi.jpg', N'Pepsi', 15000, 45, 1)
INSERT [dbo].[Product]
	([id], [createdAt], [deletedAt], [description], [image], [name], [price], [stock], [type])
VALUES
	(11, CAST(N'2024-06-19T01:16:46.4630000' AS DateTime2), NULL, N'7up', N'/images/7up.jpg', N'7up', 15000, 20, 1)
INSERT [dbo].[Product]
	([id], [createdAt], [deletedAt], [description], [image], [name], [price], [stock], [type])
VALUES
	(12, CAST(N'2024-06-19T01:16:46.4630000' AS DateTime2), NULL, N'Nước suối', N'/images/Nước_suối.jpg', N'Nước suối', 10000, 33, 1)
INSERT [dbo].[Product]
	([id], [createdAt], [deletedAt], [description], [image], [name], [price], [stock], [type])
VALUES
	(13, CAST(N'2024-06-19T01:16:46.4630000' AS DateTime2), NULL, N'Sting', N'/images/Sting.jpg', N'Sting', 15000, 58, 1)
INSERT [dbo].[Product]
	([id], [createdAt], [deletedAt], [description], [image], [name], [price], [stock], [type])
VALUES
	(14, CAST(N'2024-06-19T01:16:46.4630000' AS DateTime2), NULL, N'Redbull', N'/images/Redbull.jpg', N'Redbull', 20000, 46, 1)
INSERT [dbo].[Product]
	([id], [createdAt], [deletedAt], [description], [image], [name], [price], [stock], [type])
VALUES
	(15, CAST(N'2024-06-19T01:16:46.4630000' AS DateTime2), NULL, N'Thẻ garena 100k', N'/images/Thẻ_garena_100k.jpg', N'Thẻ garena 100k', 100000, 41, 2)
INSERT [dbo].[Product]
	([id], [createdAt], [deletedAt], [description], [image], [name], [price], [stock], [type])
VALUES
	(16, CAST(N'2024-06-19T01:16:46.4630000' AS DateTime2), NULL, N'Thẻ garena 200k', N'/images/Thẻ_garena_200k.jpg', N'Thẻ garena 200k', 200000, 53, 2)
INSERT [dbo].[Product]
	([id], [createdAt], [deletedAt], [description], [image], [name], [price], [stock], [type])
VALUES
	(17, CAST(N'2024-06-19T01:16:46.4630000' AS DateTime2), NULL, N'Thẻ viettel 100k', N'/images/Thẻ_viettel_100k.jpg', N'Thẻ viettel 100k', 100000, 20, 2)
INSERT [dbo].[Product]
	([id], [createdAt], [deletedAt], [description], [image], [name], [price], [stock], [type])
VALUES
	(18, CAST(N'2024-06-19T01:16:46.4630000' AS DateTime2), NULL, N'Thẻ mobi 50k', N'/images/Thẻ_mobi_50k.jpg', N'Thẻ mobi 50k', 50000, 50, 2)
INSERT [dbo].[Product]
	([id], [createdAt], [deletedAt], [description], [image], [name], [price], [stock], [type])
VALUES
	(19, CAST(N'2024-06-19T01:16:46.4630000' AS DateTime2), NULL, N'Phở', N'/images/Phở.jpg', N'Phở', 30000, -1, 0)
INSERT [dbo].[Product]
	([id], [createdAt], [deletedAt], [description], [image], [name], [price], [stock], [type])
VALUES
	(20, CAST(N'2024-06-19T01:16:46.4630000' AS DateTime2), NULL, N'Cà phê', N'/images/Cà_phê.jpg', N'Cà phê', 15000, 14, 1)
INSERT [dbo].[Product]
	([id], [createdAt], [deletedAt], [description], [image], [name], [price], [stock], [type])
VALUES
	(21, CAST(N'2024-06-19T01:16:46.4630000' AS DateTime2), NULL, N'Bánh mì trứng', N'/images/Bánh_mì_trứng.jpg', N'Bánh mì trứng', 20000, -1, 0)
INSERT [dbo].[Product]
	([id], [createdAt], [deletedAt], [description], [image], [name], [price], [stock], [type])
VALUES
	(22, CAST(N'2024-06-19T01:16:46.4630000' AS DateTime2), NULL, N'Bánh mì thịt', N'/images/Bánh_mì_thịt.jpg', N'Bánh mì thịt', 20000, -1, 0)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO

SET ANSI_PADDING ON
GO


ALTER TABLE [dbo].[Account] ADD  CONSTRAINT [UK_de34gsw4qt8auhffbna969ahp] UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Invoice] ADD  CONSTRAINT [DF_Invoice_total]  DEFAULT ((0)) FOR [total]
GO
ALTER TABLE [dbo].[ComputerUsage]  WITH CHECK ADD  CONSTRAINT [FK1ukgw2h7yqj0uqhs4kln7b0tv] FOREIGN KEY([computerID])
REFERENCES [dbo].[Computer] ([id])
GO
ALTER TABLE [dbo].[ComputerUsage] CHECK CONSTRAINT [FK1ukgw2h7yqj0uqhs4kln7b0tv]
GO
ALTER TABLE [dbo].[ComputerUsage]  WITH CHECK ADD  CONSTRAINT [FKru3cjhi3eagngqfgdf3ap0w0f] FOREIGN KEY([usedBy])
REFERENCES [dbo].[Account] ([id])
GO
ALTER TABLE [dbo].[ComputerUsage] CHECK CONSTRAINT [FKru3cjhi3eagngqfgdf3ap0w0f]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK94h4kungplj8clo62i971c85o] FOREIGN KEY([accountID])
REFERENCES [dbo].[Account] ([id])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK94h4kungplj8clo62i971c85o]
GO
ALTER TABLE [dbo].[Invoice]  WITH CHECK ADD  CONSTRAINT [FK6hqjk9ej9r883fy7sgep9efn7] FOREIGN KEY([createdBy])
REFERENCES [dbo].[Employee] ([id])
GO
ALTER TABLE [dbo].[Invoice] CHECK CONSTRAINT [FK6hqjk9ej9r883fy7sgep9efn7]
GO
ALTER TABLE [dbo].[Invoice]  WITH CHECK ADD  CONSTRAINT [FK937sc7o18kooa1fhxm57wld1w] FOREIGN KEY([createdToAccountId])
REFERENCES [dbo].[Account] ([id])
GO
ALTER TABLE [dbo].[Invoice] CHECK CONSTRAINT [FK937sc7o18kooa1fhxm57wld1w]
GO
ALTER TABLE [dbo].[Invoice]  WITH CHECK ADD  CONSTRAINT [FKmhlwjt2ll4e2gnxrx2i3yfljd] FOREIGN KEY([computerId])
REFERENCES [dbo].[Computer] ([id])
GO
ALTER TABLE [dbo].[Invoice] CHECK CONSTRAINT [FKmhlwjt2ll4e2gnxrx2i3yfljd]
GO
ALTER TABLE [dbo].[InvoiceDetail]  WITH CHECK ADD  CONSTRAINT [FK2pri5nh9cre1wwfky1gd4egw6] FOREIGN KEY([productId])
REFERENCES [dbo].[Product] ([id])
GO
ALTER TABLE [dbo].[InvoiceDetail] CHECK CONSTRAINT [FK2pri5nh9cre1wwfky1gd4egw6]
GO
ALTER TABLE [dbo].[InvoiceDetail]  WITH CHECK ADD  CONSTRAINT [FKb5m8jjhsq5jxvhdbwty3d05sq] FOREIGN KEY([invoiceId])
REFERENCES [dbo].[Invoice] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[InvoiceDetail] CHECK CONSTRAINT [FKb5m8jjhsq5jxvhdbwty3d05sq]
GO
ALTER TABLE [dbo].[Message]  WITH CHECK ADD  CONSTRAINT [FK_Message_Session] FOREIGN KEY([sessionId])
REFERENCES [dbo].[Session] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Message] CHECK CONSTRAINT [FK_Message_Session]
GO
ALTER TABLE [dbo].[Session]  WITH CHECK ADD  CONSTRAINT [FKa5yuno1td1sbamjqf31ccqbde] FOREIGN KEY([usingBy])
REFERENCES [dbo].[Account] ([id])
GO
ALTER TABLE [dbo].[Session] CHECK CONSTRAINT [FKa5yuno1td1sbamjqf31ccqbde]
GO
ALTER TABLE [dbo].[Session]  WITH CHECK ADD  CONSTRAINT [FKgy250fk87rpr8iwyiwbq3b5oi] FOREIGN KEY([computerID])
REFERENCES [dbo].[Computer] ([id])
GO
ALTER TABLE [dbo].[Session] CHECK CONSTRAINT [FKgy250fk87rpr8iwyiwbq3b5oi]
GO
USE [master]
GO
ALTER DATABASE [NetCF] SET  READ_WRITE 
GO
