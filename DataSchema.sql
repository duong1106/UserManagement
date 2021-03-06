USE [master]
GO
/****** Object:  Database [UserManagement]    Script Date: 30-Jun-21 8:43:02 AM ******/
CREATE DATABASE [UserManagement]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'UserManagement', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SWORCERERSQL\MSSQL\DATA\UserManagement.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'UserManagement_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SWORCERERSQL\MSSQL\DATA\UserManagement_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [UserManagement] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [UserManagement].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [UserManagement] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [UserManagement] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [UserManagement] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [UserManagement] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [UserManagement] SET ARITHABORT OFF 
GO
ALTER DATABASE [UserManagement] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [UserManagement] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [UserManagement] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [UserManagement] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [UserManagement] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [UserManagement] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [UserManagement] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [UserManagement] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [UserManagement] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [UserManagement] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [UserManagement] SET  DISABLE_BROKER 
GO
ALTER DATABASE [UserManagement] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [UserManagement] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [UserManagement] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [UserManagement] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [UserManagement] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [UserManagement] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [UserManagement] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [UserManagement] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [UserManagement] SET  MULTI_USER 
GO
ALTER DATABASE [UserManagement] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [UserManagement] SET DB_CHAINING OFF 
GO
ALTER DATABASE [UserManagement] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [UserManagement] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [UserManagement]
GO
/****** Object:  Table [dbo].[PromotionList]    Script Date: 30-Jun-21 8:43:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PromotionList](
	[promote_code] [int] IDENTITY(1,1) NOT NULL,
	[promote_rank] [decimal](5, 2) NULL,
	[promote_date] [date] NULL,
	[users_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[promote_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Registrations]    Script Date: 30-Jun-21 8:43:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Registrations](
	[username] [nvarchar](50) NOT NULL,
	[passwords] [varchar](64) NOT NULL,
	[roles] [nvarchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Users]    Script Date: 30-Jun-21 8:43:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[users_id] [int] IDENTITY(1,1) NOT NULL,
	[users_fname] [nvarchar](50) NULL,
	[users_lname] [nvarchar](50) NULL,
	[users_email] [nvarchar](100) NULL,
	[users_phone] [nvarchar](15) NULL,
	[users_photo] [nvarchar](50) NULL,
	[users_status] [bit] NULL,
	[username] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[users_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[PromotionList] ON 

INSERT [dbo].[PromotionList] ([promote_code], [promote_rank], [promote_date], [users_id]) VALUES (2, CAST(1.00 AS Decimal(5, 2)), CAST(N'2021-06-28' AS Date), 4)
INSERT [dbo].[PromotionList] ([promote_code], [promote_rank], [promote_date], [users_id]) VALUES (7, CAST(5.00 AS Decimal(5, 2)), CAST(N'2021-06-30' AS Date), 5)
SET IDENTITY_INSERT [dbo].[PromotionList] OFF
INSERT [dbo].[Registrations] ([username], [passwords], [roles]) VALUES (N'luigi', N'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', N'patron')
INSERT [dbo].[Registrations] ([username], [passwords], [roles]) VALUES (N'mario', N'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', N'patron')
INSERT [dbo].[Registrations] ([username], [passwords], [roles]) VALUES (N'minh', N'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', N'admin')
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([users_id], [users_fname], [users_lname], [users_email], [users_phone], [users_photo], [users_status], [username]) VALUES (3, N'Minh', N'Nhat', N'minh@gmail.com', N'1234567890', N'assets/avatar/index.png', 1, N'minh')
INSERT [dbo].[Users] ([users_id], [users_fname], [users_lname], [users_email], [users_phone], [users_photo], [users_status], [username]) VALUES (4, N'Mario', N'Mario', N'mario@gmail.com', N'1234567890', N'assets/avatar/super-mario-run.jpg', 1, N'mario')
INSERT [dbo].[Users] ([users_id], [users_fname], [users_lname], [users_email], [users_phone], [users_photo], [users_status], [username]) VALUES (5, N'Luigi', N'Mario', N'luigi@gmail.com', N'1234567890', N'assets/avatar/luigi.jpg', 1, N'luigi')
SET IDENTITY_INSERT [dbo].[Users] OFF
/****** Object:  Index [UQ__Promotio__EAA7D14A41538F32]    Script Date: 30-Jun-21 8:43:03 AM ******/
ALTER TABLE [dbo].[PromotionList] ADD UNIQUE NONCLUSTERED 
(
	[users_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__Users__F3DBC572AA2FEACD]    Script Date: 30-Jun-21 8:43:03 AM ******/
ALTER TABLE [dbo].[Users] ADD UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[PromotionList]  WITH CHECK ADD FOREIGN KEY([users_id])
REFERENCES [dbo].[Users] ([users_id])
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD FOREIGN KEY([username])
REFERENCES [dbo].[Registrations] ([username])
GO
USE [master]
GO
ALTER DATABASE [UserManagement] SET  READ_WRITE 
GO
