USE [master]
GO
/****** Object:  Database [bdhotel_mouaddorian]    Script Date: 25/10/2026 19:57:29 ******/
CREATE DATABASE [bdhotel_mouaddorian] COLLATE French_CI_AS
GO
ALTER DATABASE [bdhotel_mouaddorian] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [bdhotel_mouaddorian].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [bdhotel_mouaddorian] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [bdhotel_mouaddorian] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [bdhotel_mouaddorian] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [bdhotel_mouaddorian] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [bdhotel_mouaddorian] SET ARITHABORT OFF 
GO
ALTER DATABASE [bdhotel_mouaddorian] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [bdhotel_mouaddorian] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [bdhotel_mouaddorian] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [bdhotel_mouaddorian] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [bdhotel_mouaddorian] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [bdhotel_mouaddorian] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [bdhotel_mouaddorian] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [bdhotel_mouaddorian] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [bdhotel_mouaddorian] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [bdhotel_mouaddorian] SET  DISABLE_BROKER 
GO
ALTER DATABASE [bdhotel_mouaddorian] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [bdhotel_mouaddorian] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [bdhotel_mouaddorian] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [bdhotel_mouaddorian] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [bdhotel_mouaddorian] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [bdhotel_mouaddorian] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [bdhotel_mouaddorian] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [bdhotel_mouaddorian] SET RECOVERY FULL 
GO
ALTER DATABASE [bdhotel_mouaddorian] SET  MULTI_USER 
GO
ALTER DATABASE [bdhotel_mouaddorian] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [bdhotel_mouaddorian] SET DB_CHAINING OFF 
GO
ALTER DATABASE [bdhotel_mouaddorian] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [bdhotel_mouaddorian] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [bdhotel_mouaddorian] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [bdhotel_mouaddorian] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'bdhotel_mouaddorian', N'ON'
GO
ALTER DATABASE [bdhotel_mouaddorian] SET QUERY_STORE = OFF
GO
USE [bdhotel_mouaddorian]
GO
/****** Object:  Table [dbo].[chambre]    Script Date: 25/10/2026 19:57:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[chambre](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[numero] [varchar](10) NOT NULL,
	[hotel_id] [int] NOT NULL,
 CONSTRAINT [PK_chambre] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[chambre_reservation]    Script Date: 25/10/2026 19:57:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[chambre_reservation](
	[reservation_id] [int] NOT NULL,
	[chambre_id] [int] NOT NULL,
 CONSTRAINT [PK_chambre_reservation] PRIMARY KEY CLUSTERED 
(
	[reservation_id] ASC,
	[chambre_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[client]    Script Date: 25/10/2026 19:57:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[client](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nom] [varchar](30) NULL,
	[mail] [varchar](50) NULL,
	[motpasse] [nvarchar](max) NULL,
 CONSTRAINT [PK_client] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[equipement]    Script Date: 25/10/2026 19:57:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[equipement](
	[id] [int] NOT NULL,
	[libelle] [varchar](50) NULL,
	[logo] [varchar](50) NULL,
 CONSTRAINT [PK_equipement] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[equipement_hotel]    Script Date: 25/10/2026 19:57:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[equipement_hotel](
	[hotel_id] [int] NOT NULL,
	[equipement_id] [int] NOT NULL,
 CONSTRAINT [PK_equiper] PRIMARY KEY CLUSTERED 
(
	[hotel_id] ASC,
	[equipement_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[hotel]    Script Date: 25/10/2026 19:57:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[hotel](
	[id] [int] NOT NULL,
	[nom] [varchar](50) NULL,
	[rue1] [varchar](100) NULL,
	[rue2] [varchar](100) NULL,
	[cp] [varchar](10) NULL,
	[ville] [varchar](50) NULL,
	[telephone] [varchar](20) NULL,
	[descourt] [nvarchar](max) NULL,
	[deslong] [nvarchar](max) NULL,
	[prix] [float] NULL,
	[motpasse] [nvarchar](max) NULL,
 CONSTRAINT [PK_hotel] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[photo]    Script Date: 25/10/2026 19:57:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[photo](
	[id] [int] NOT NULL,
	[nomfichier] [varchar](50) NULL,
	[hotel_id] [int] NOT NULL,
 CONSTRAINT [PK_photo] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[reservation]    Script Date: 25/10/2026 19:57:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[reservation](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[datedebut] [date] NULL,
	[datefin] [date] NULL,
	[hotel_id] [int] NOT NULL,
	[client_id] [int] NOT NULL,
 CONSTRAINT [PK__reservat__F92D26C802D9D041] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[chambre] ON 

INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (1, N'6', 105)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (2, N'7', 105)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (3, N'8', 105)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (4, N'9', 105)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (5, N'10', 105)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (6, N'11', 105)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (7, N'12', 105)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (8, N'13', 105)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (9, N'14', 105)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (10, N'15', 105)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (11, N'16', 105)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (12, N'17', 105)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (13, N'18', 105)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (14, N'19', 105)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (15, N'20', 105)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (16, N'21', 105)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (17, N'22', 105)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (18, N'23', 105)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (19, N'24', 105)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (20, N'25', 105)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (21, N'26', 105)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (22, N'27', 105)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (23, N'28', 105)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (24, N'29', 105)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (25, N'30', 105)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (26, N'31', 105)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (27, N'32', 105)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (28, N'33', 105)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (29, N'34', 105)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (30, N'35', 105)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (31, N'36', 105)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (32, N'37', 105)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (33, N'38', 105)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (34, N'39', 105)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (35, N'40', 105)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (36, N'41', 105)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (37, N'42', 105)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (38, N'43', 105)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (39, N'44', 105)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (40, N'45', 105)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (41, N'46', 105)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (42, N'47', 105)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (43, N'48', 105)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (44, N'49', 105)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (45, N'50', 105)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (46, N'51', 105)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (47, N'52', 105)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (48, N'53', 105)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (49, N'54', 105)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (50, N'55', 105)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (51, N'56', 105)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (52, N'57', 105)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (53, N'58', 105)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (54, N'59', 105)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (55, N'60', 105)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (56, N'61', 105)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (57, N'62', 105)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (58, N'63', 105)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (59, N'64', 105)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (60, N'65', 105)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (61, N'66', 105)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (62, N'67', 105)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (63, N'68', 105)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (64, N'69', 105)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (65, N'70', 105)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (66, N'11', 106)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (67, N'12', 106)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (68, N'13', 106)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (69, N'14', 106)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (70, N'15', 106)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (71, N'16', 106)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (72, N'17', 106)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (73, N'18', 106)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (74, N'19', 106)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (75, N'20', 106)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (76, N'21', 106)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (77, N'22', 106)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (78, N'23', 106)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (79, N'24', 106)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (80, N'25', 106)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (81, N'26', 106)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (82, N'27', 106)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (83, N'28', 106)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (84, N'29', 106)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (85, N'30', 106)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (86, N'31', 106)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (87, N'32', 106)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (88, N'33', 106)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (89, N'34', 106)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (90, N'35', 106)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (91, N'36', 106)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (92, N'37', 106)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (93, N'38', 106)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (94, N'39', 106)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (95, N'40', 106)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (96, N'41', 106)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (97, N'42', 106)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (98, N'43', 106)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (99, N'44', 106)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (100, N'45', 106)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (101, N'46', 106)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (102, N'47', 106)
GO
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (103, N'48', 106)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (104, N'49', 106)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (105, N'50', 106)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (106, N'51', 106)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (107, N'52', 106)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (108, N'53', 106)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (109, N'54', 106)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (110, N'55', 106)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (111, N'56', 106)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (112, N'57', 106)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (113, N'58', 106)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (114, N'59', 106)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (115, N'60', 106)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (116, N'61', 106)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (117, N'62', 106)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (118, N'63', 106)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (119, N'64', 106)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (120, N'65', 106)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (121, N'66', 106)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (122, N'67', 106)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (123, N'68', 106)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (124, N'69', 106)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (125, N'70', 106)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (126, N'11', 107)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (127, N'12', 107)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (128, N'13', 107)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (129, N'14', 107)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (130, N'15', 107)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (131, N'16', 107)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (132, N'17', 107)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (133, N'18', 107)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (134, N'19', 107)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (135, N'20', 107)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (136, N'21', 107)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (137, N'22', 107)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (138, N'23', 107)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (139, N'24', 107)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (140, N'25', 107)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (141, N'26', 107)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (142, N'27', 107)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (143, N'28', 107)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (144, N'29', 107)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (145, N'30', 107)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (146, N'31', 107)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (147, N'32', 107)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (148, N'33', 107)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (149, N'34', 107)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (150, N'35', 107)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (151, N'36', 107)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (152, N'37', 107)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (153, N'38', 107)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (154, N'39', 107)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (155, N'40', 107)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (156, N'41', 107)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (157, N'42', 107)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (158, N'43', 107)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (159, N'44', 107)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (160, N'45', 107)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (161, N'46', 107)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (162, N'47', 107)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (163, N'48', 107)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (164, N'49', 107)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (165, N'50', 107)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (166, N'51', 107)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (167, N'52', 107)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (168, N'53', 107)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (169, N'54', 107)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (170, N'55', 107)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (171, N'56', 107)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (172, N'57', 107)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (173, N'58', 107)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (174, N'59', 107)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (175, N'60', 107)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (176, N'11', 108)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (177, N'12', 108)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (178, N'13', 108)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (179, N'14', 108)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (180, N'15', 108)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (181, N'16', 108)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (182, N'17', 108)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (183, N'18', 108)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (184, N'19', 108)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (185, N'20', 108)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (186, N'21', 108)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (187, N'22', 108)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (188, N'23', 108)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (189, N'24', 108)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (190, N'25', 108)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (191, N'26', 108)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (192, N'27', 108)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (193, N'28', 108)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (194, N'29', 108)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (195, N'30', 108)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (196, N'31', 108)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (197, N'32', 108)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (198, N'33', 108)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (199, N'34', 108)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (200, N'35', 108)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (201, N'36', 108)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (202, N'37', 108)
GO
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (203, N'11', 111)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (204, N'12', 111)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (205, N'13', 111)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (206, N'14', 111)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (207, N'15', 111)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (208, N'16', 111)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (209, N'17', 111)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (210, N'18', 111)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (211, N'19', 111)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (212, N'20', 111)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (213, N'21', 111)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (214, N'22', 111)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (215, N'23', 111)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (216, N'24', 111)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (217, N'25', 111)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (218, N'26', 111)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (219, N'27', 111)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (220, N'28', 111)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (221, N'29', 111)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (222, N'30', 111)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (223, N'31', 111)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (224, N'32', 111)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (225, N'33', 111)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (226, N'34', 111)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (227, N'35', 111)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (228, N'36', 111)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (229, N'37', 111)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (230, N'38', 111)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (231, N'39', 111)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (232, N'40', 111)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (233, N'41', 111)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (234, N'42', 111)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (235, N'43', 111)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (236, N'44', 111)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (237, N'45', 111)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (238, N'46', 111)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (239, N'47', 111)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (240, N'48', 111)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (241, N'49', 111)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (242, N'50', 111)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (243, N'51', 111)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (244, N'52', 111)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (245, N'53', 111)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (246, N'54', 111)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (247, N'55', 111)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (248, N'56', 111)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (249, N'57', 111)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (250, N'58', 111)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (251, N'59', 111)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (252, N'60', 111)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (253, N'61', 111)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (254, N'62', 111)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (255, N'63', 111)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (256, N'11', 112)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (257, N'12', 112)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (258, N'13', 112)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (259, N'14', 112)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (260, N'15', 112)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (261, N'16', 112)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (262, N'17', 112)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (263, N'18', 112)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (264, N'19', 112)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (265, N'20', 112)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (266, N'21', 112)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (267, N'22', 112)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (268, N'23', 112)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (269, N'24', 112)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (270, N'25', 112)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (271, N'26', 112)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (272, N'27', 112)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (273, N'28', 112)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (274, N'29', 112)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (275, N'30', 112)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (276, N'31', 112)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (277, N'32', 112)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (278, N'33', 112)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (279, N'34', 112)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (280, N'35', 112)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (281, N'36', 112)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (282, N'37', 112)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (283, N'38', 112)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (284, N'39', 112)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (285, N'40', 112)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (286, N'41', 112)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (287, N'42', 112)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (288, N'43', 112)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (289, N'44', 112)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (290, N'45', 112)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (291, N'46', 112)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (292, N'47', 112)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (293, N'48', 112)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (294, N'49', 112)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (295, N'50', 112)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (296, N'51', 112)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (297, N'52', 112)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (298, N'53', 112)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (299, N'54', 112)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (300, N'55', 112)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (301, N'56', 112)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (302, N'57', 112)
GO
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (303, N'58', 112)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (304, N'59', 112)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (305, N'11', 120)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (306, N'12', 120)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (307, N'13', 120)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (308, N'14', 120)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (309, N'15', 120)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (310, N'16', 120)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (311, N'17', 120)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (312, N'18', 120)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (313, N'19', 120)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (314, N'20', 120)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (315, N'21', 120)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (316, N'22', 120)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (317, N'23', 120)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (318, N'24', 120)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (319, N'25', 120)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (320, N'26', 120)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (321, N'27', 120)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (322, N'28', 120)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (323, N'29', 120)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (324, N'30', 120)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (325, N'31', 120)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (326, N'32', 120)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (327, N'33', 120)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (328, N'34', 120)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (329, N'35', 120)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (330, N'36', 120)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (331, N'37', 120)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (332, N'38', 120)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (333, N'39', 120)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (334, N'40', 120)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (335, N'41', 120)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (336, N'42', 120)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (337, N'43', 120)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (338, N'44', 120)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (339, N'45', 120)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (340, N'46', 120)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (341, N'47', 120)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (342, N'48', 120)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (343, N'49', 120)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (344, N'50', 120)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (345, N'11', 128)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (346, N'12', 128)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (347, N'13', 128)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (348, N'14', 128)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (349, N'15', 128)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (350, N'16', 128)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (351, N'17', 128)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (352, N'18', 128)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (353, N'19', 128)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (354, N'20', 128)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (355, N'21', 128)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (356, N'22', 128)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (357, N'23', 128)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (358, N'24', 128)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (359, N'25', 128)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (360, N'26', 128)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (361, N'27', 128)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (362, N'28', 128)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (363, N'29', 128)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (364, N'30', 128)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (365, N'31', 128)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (366, N'32', 128)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (367, N'33', 128)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (368, N'34', 128)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (369, N'35', 128)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (370, N'36', 128)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (371, N'37', 128)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (372, N'38', 128)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (373, N'39', 128)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (374, N'40', 128)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (375, N'41', 128)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (376, N'42', 128)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (377, N'43', 128)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (378, N'44', 128)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (379, N'45', 128)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (380, N'46', 128)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (381, N'47', 128)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (382, N'48', 128)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (383, N'49', 128)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (384, N'50', 128)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (385, N'51', 128)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (386, N'52', 128)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (387, N'53', 128)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (388, N'54', 128)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (389, N'55', 128)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (390, N'56', 128)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (391, N'57', 128)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (392, N'58', 128)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (393, N'59', 128)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (394, N'60', 128)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (395, N'61', 128)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (396, N'62', 128)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (397, N'63', 128)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (398, N'64', 128)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (399, N'65', 128)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (400, N'11', 129)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (401, N'12', 129)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (402, N'13', 129)
GO
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (403, N'14', 129)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (404, N'15', 129)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (405, N'16', 129)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (406, N'17', 129)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (407, N'18', 129)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (408, N'19', 129)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (409, N'20', 129)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (410, N'21', 129)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (411, N'22', 129)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (412, N'23', 129)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (413, N'24', 129)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (414, N'25', 129)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (415, N'26', 129)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (416, N'27', 129)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (417, N'28', 129)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (418, N'29', 129)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (419, N'30', 129)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (420, N'31', 129)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (421, N'32', 129)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (422, N'33', 129)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (423, N'34', 129)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (424, N'35', 129)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (425, N'36', 129)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (426, N'37', 129)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (427, N'38', 129)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (428, N'39', 129)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (429, N'40', 129)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (430, N'41', 129)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (431, N'42', 129)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (432, N'43', 129)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (433, N'44', 129)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (434, N'45', 129)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (435, N'46', 129)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (436, N'47', 129)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (437, N'48', 129)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (438, N'49', 129)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (439, N'50', 129)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (440, N'51', 129)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (441, N'52', 129)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (442, N'53', 129)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (443, N'54', 129)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (444, N'55', 129)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (445, N'56', 129)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (446, N'57', 129)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (447, N'58', 129)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (448, N'59', 129)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (449, N'60', 129)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (450, N'11', 103)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (451, N'12', 103)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (452, N'13', 103)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (453, N'14', 103)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (454, N'15', 103)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (455, N'16', 103)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (456, N'17', 103)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (457, N'18', 103)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (458, N'19', 103)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (459, N'20', 103)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (460, N'21', 103)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (461, N'22', 103)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (462, N'23', 103)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (463, N'24', 103)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (464, N'25', 103)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (465, N'26', 103)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (466, N'27', 103)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (467, N'28', 103)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (468, N'29', 103)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (469, N'30', 103)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (470, N'31', 103)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (471, N'32', 103)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (472, N'33', 103)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (473, N'34', 103)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (474, N'35', 103)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (475, N'36', 103)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (476, N'37', 103)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (477, N'38', 103)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (478, N'39', 103)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (479, N'40', 103)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (480, N'41', 103)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (481, N'42', 103)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (482, N'43', 103)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (483, N'44', 103)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (484, N'45', 103)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (485, N'46', 103)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (486, N'47', 103)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (487, N'48', 103)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (488, N'49', 103)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (489, N'50', 103)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (490, N'51', 103)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (491, N'52', 103)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (492, N'53', 103)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (493, N'54', 103)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (494, N'55', 103)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (495, N'56', 103)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (496, N'57', 103)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (497, N'58', 103)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (498, N'59', 103)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (499, N'60', 103)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (500, N'61', 103)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (501, N'62', 103)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (502, N'63', 103)
GO
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (503, N'64', 103)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (504, N'65', 103)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (505, N'66', 103)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (506, N'67', 103)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (507, N'68', 103)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (508, N'11', 101)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (509, N'12', 101)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (510, N'13', 101)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (511, N'14', 101)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (512, N'15', 101)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (513, N'16', 101)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (514, N'17', 101)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (515, N'18', 101)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (516, N'19', 101)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (517, N'20', 101)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (518, N'21', 101)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (519, N'22', 101)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (520, N'23', 101)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (521, N'24', 101)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (522, N'25', 101)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (523, N'26', 101)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (524, N'27', 101)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (525, N'28', 101)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (526, N'29', 101)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (527, N'30', 101)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (528, N'31', 101)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (529, N'32', 101)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (530, N'33', 101)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (531, N'34', 101)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (532, N'35', 101)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (533, N'36', 101)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (534, N'37', 101)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (535, N'38', 101)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (536, N'39', 101)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (537, N'40', 101)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (538, N'41', 101)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (539, N'42', 101)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (540, N'43', 101)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (541, N'44', 101)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (542, N'45', 101)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (543, N'46', 101)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (544, N'47', 101)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (545, N'48', 101)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (546, N'49', 101)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (547, N'50', 101)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (548, N'51', 101)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (549, N'52', 101)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (550, N'53', 101)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (551, N'54', 101)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (552, N'55', 101)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (553, N'56', 101)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (554, N'57', 101)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (555, N'58', 101)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (556, N'59', 101)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (557, N'60', 101)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (558, N'61', 101)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (559, N'62', 101)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (560, N'63', 101)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (561, N'64', 101)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (562, N'65', 101)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (563, N'11', 135)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (564, N'12', 135)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (565, N'13', 135)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (566, N'14', 135)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (567, N'15', 135)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (568, N'16', 135)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (569, N'17', 135)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (570, N'18', 135)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (571, N'19', 135)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (572, N'20', 135)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (573, N'21', 135)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (574, N'22', 135)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (575, N'23', 135)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (576, N'24', 135)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (577, N'25', 135)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (578, N'26', 135)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (579, N'27', 135)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (580, N'28', 135)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (581, N'29', 135)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (582, N'30', 135)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (583, N'31', 135)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (584, N'32', 135)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (585, N'33', 135)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (586, N'34', 135)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (587, N'35', 135)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (588, N'36', 135)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (589, N'37', 135)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (590, N'38', 135)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (591, N'39', 135)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (592, N'40', 135)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (593, N'41', 135)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (594, N'42', 135)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (595, N'43', 135)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (596, N'44', 135)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (597, N'45', 135)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (598, N'46', 135)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (599, N'47', 135)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (600, N'48', 135)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (601, N'49', 135)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (602, N'50', 135)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (603, N'51', 135)
GO
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (604, N'52', 135)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (605, N'53', 135)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (606, N'54', 135)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (607, N'55', 135)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (608, N'56', 135)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (609, N'57', 135)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (610, N'58', 135)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (611, N'59', 135)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (612, N'60', 135)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (613, N'61', 135)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (614, N'62', 135)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (615, N'63', 135)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (616, N'64', 135)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (617, N'65', 135)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (618, N'11', 140)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (619, N'12', 140)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (620, N'13', 140)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (621, N'14', 140)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (622, N'15', 140)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (623, N'16', 140)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (624, N'17', 140)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (625, N'18', 140)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (626, N'19', 140)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (627, N'20', 140)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (628, N'21', 140)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (629, N'22', 140)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (630, N'23', 140)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (631, N'24', 140)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (632, N'25', 140)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (633, N'26', 140)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (634, N'27', 140)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (635, N'28', 140)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (636, N'29', 140)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (637, N'30', 140)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (638, N'31', 140)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (639, N'32', 140)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (640, N'33', 140)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (641, N'34', 140)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (642, N'35', 140)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (643, N'36', 140)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (644, N'37', 140)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (645, N'38', 140)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (646, N'39', 140)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (647, N'40', 140)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (648, N'41', 140)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (649, N'42', 140)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (650, N'43', 140)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (651, N'44', 140)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (652, N'45', 140)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (653, N'46', 140)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (654, N'47', 140)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (655, N'48', 140)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (656, N'49', 140)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (657, N'50', 140)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (658, N'51', 140)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (659, N'52', 140)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (660, N'53', 140)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (661, N'54', 140)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (662, N'55', 140)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (663, N'56', 140)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (664, N'57', 140)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (665, N'58', 140)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (666, N'59', 140)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (667, N'60', 140)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (668, N'61', 140)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (669, N'62', 140)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (670, N'63', 140)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (671, N'64', 140)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (672, N'11', 110)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (673, N'12', 110)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (674, N'13', 110)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (675, N'14', 110)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (676, N'15', 110)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (677, N'16', 110)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (678, N'17', 110)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (679, N'18', 110)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (680, N'19', 110)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (681, N'20', 110)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (682, N'21', 110)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (683, N'22', 110)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (684, N'23', 110)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (685, N'24', 110)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (686, N'25', 110)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (687, N'26', 110)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (688, N'27', 110)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (689, N'28', 110)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (690, N'29', 110)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (691, N'30', 110)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (692, N'31', 110)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (693, N'32', 110)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (694, N'33', 110)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (695, N'34', 110)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (696, N'35', 110)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (697, N'36', 110)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (698, N'37', 110)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (699, N'38', 110)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (700, N'39', 110)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (701, N'40', 110)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (702, N'41', 110)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (703, N'42', 110)
GO
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (704, N'43', 110)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (705, N'44', 110)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (706, N'45', 110)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (707, N'46', 110)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (708, N'47', 110)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (709, N'48', 110)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (710, N'49', 110)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (711, N'50', 110)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (712, N'51', 110)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (713, N'52', 110)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (714, N'53', 110)
INSERT [dbo].[chambre] ([id], [numero], [hotel_id]) VALUES (715, N'54', 110)
SET IDENTITY_INSERT [dbo].[chambre] OFF
GO
INSERT [dbo].[chambre_reservation] ([reservation_id], [chambre_id]) VALUES (1, 503)
INSERT [dbo].[chambre_reservation] ([reservation_id], [chambre_id]) VALUES (1, 504)
INSERT [dbo].[chambre_reservation] ([reservation_id], [chambre_id]) VALUES (1, 506)
INSERT [dbo].[chambre_reservation] ([reservation_id], [chambre_id]) VALUES (2, 451)
INSERT [dbo].[chambre_reservation] ([reservation_id], [chambre_id]) VALUES (2, 453)
INSERT [dbo].[chambre_reservation] ([reservation_id], [chambre_id]) VALUES (3, 460)
INSERT [dbo].[chambre_reservation] ([reservation_id], [chambre_id]) VALUES (4, 469)
INSERT [dbo].[chambre_reservation] ([reservation_id], [chambre_id]) VALUES (4, 470)
INSERT [dbo].[chambre_reservation] ([reservation_id], [chambre_id]) VALUES (5, 484)
INSERT [dbo].[chambre_reservation] ([reservation_id], [chambre_id]) VALUES (6, 489)
INSERT [dbo].[chambre_reservation] ([reservation_id], [chambre_id]) VALUES (6, 490)
INSERT [dbo].[chambre_reservation] ([reservation_id], [chambre_id]) VALUES (6, 491)
INSERT [dbo].[chambre_reservation] ([reservation_id], [chambre_id]) VALUES (7, 503)
INSERT [dbo].[chambre_reservation] ([reservation_id], [chambre_id]) VALUES (8, 517)
INSERT [dbo].[chambre_reservation] ([reservation_id], [chambre_id]) VALUES (9, 527)
GO
SET IDENTITY_INSERT [dbo].[client] ON 

INSERT [dbo].[client] ([id], [nom], [mail], [motpasse]) VALUES (1, N'GIRAUD', N'kevin.giraud@gmail.com', N'$argon2id$v=19$m=65536,t=3,p=1$yHDqnXAhYFt2ALAj4Izx+g$BdXsOTwkYcm3Lf4H1ws3MhU4M6OVFCKF2UHdb9dJ7vU')
INSERT [dbo].[client] ([id], [nom], [mail], [motpasse]) VALUES (2, N'LENOIR', N'lea.lenoir@gmail.com', N'$argon2id$v=19$m=65536,t=3,p=1$aUX3gAT1TMk4mexCYeLn5Q$Yj4pMDdbYq1YYzZxhIMplW3LlT1OTfIwTQtec0nK9tQ')
INSERT [dbo].[client] ([id], [nom], [mail], [motpasse]) VALUES (3, N'MERAD', N'smail.merad@yahoo.fr', N'$argon2id$v=19$m=65536,t=3,p=1$r2Id7sxbmiEQy/rjXg71aQ$FDA1lsXtarxk8rlolMe8O68gpTLNULSRM/ltwrq0nPw')
INSERT [dbo].[client] ([id], [nom], [mail], [motpasse]) VALUES (4, N'DUPONT', N'claire.dupont@gmail.com', N'$argon2id$v=19$m=65536,t=3,p=1$3pM4iz0XQZWra5CP1jpKZw$rKmhnWvTIe6NQus6yx3/U7Et3vJpst0JJVcmpzPxLX8')
INSERT [dbo].[client] ([id], [nom], [mail], [motpasse]) VALUES (5, N'BERNARD', N'thomas.bernard@orange.fr', N'$argon2id$v=19$m=65536,t=3,p=1$4IRKEcHKeJHMNM72lnhdMA$golnUHo7Iwrk0MhuqStV4QKVBXFJ7BLtQPWvLkuvK88')
INSERT [dbo].[client] ([id], [nom], [mail], [motpasse]) VALUES (6, N'MOREAU', N'julie.moreau@outlook.fr', N'$argon2id$v=19$m=65536,t=3,p=1$6zAZSC3iRzNQMR1ildwALw$mDq9ZFrcNhG5GWobAIP1wYXNSi6HT6leDZczoC3oYVY')
INSERT [dbo].[client] ([id], [nom], [mail], [motpasse]) VALUES (7, N'PETIT', N'lucas.petit@free.fr', N'$argon2id$v=19$m=65536,t=3,p=1$+xDTgJO9Mid42Cj8vnHtTw$2Erh+vqYr6XXH+VyNdg5wTOUpl4Z9ZDp0v5YiPau12U')
SET IDENTITY_INSERT [dbo].[client] OFF
GO
INSERT [dbo].[equipement] ([id], [libelle], [logo]) VALUES (15, N'Wifi', N'wifi.png')
INSERT [dbo].[equipement] ([id], [libelle], [logo]) VALUES (18, N'Animaux admis', N'animaux.png')
INSERT [dbo].[equipement] ([id], [libelle], [logo]) VALUES (21, N'Petit Déjeuner', N'petitdejeuner.png')
INSERT [dbo].[equipement] ([id], [libelle], [logo]) VALUES (24, N'Bar', N'bar.png')
INSERT [dbo].[equipement] ([id], [libelle], [logo]) VALUES (29, N'Restaurant', N'restaurant.png')
INSERT [dbo].[equipement] ([id], [libelle], [logo]) VALUES (35, N'Climatisation', N'climatisation.png')
INSERT [dbo].[equipement] ([id], [libelle], [logo]) VALUES (38, N'Parking', N'parking.png')
INSERT [dbo].[equipement] ([id], [libelle], [logo]) VALUES (40, N'Salle de réunion', N'sallereunion.png')
INSERT [dbo].[equipement] ([id], [libelle], [logo]) VALUES (44, N'Accès handicapés', N'handicapes.png')
INSERT [dbo].[equipement] ([id], [libelle], [logo]) VALUES (46, N'Piscine', N'piscine.png')
GO
INSERT [dbo].[equipement_hotel] ([hotel_id], [equipement_id]) VALUES (101, 15)
INSERT [dbo].[equipement_hotel] ([hotel_id], [equipement_id]) VALUES (101, 21)
INSERT [dbo].[equipement_hotel] ([hotel_id], [equipement_id]) VALUES (101, 35)
INSERT [dbo].[equipement_hotel] ([hotel_id], [equipement_id]) VALUES (101, 38)
INSERT [dbo].[equipement_hotel] ([hotel_id], [equipement_id]) VALUES (101, 40)
INSERT [dbo].[equipement_hotel] ([hotel_id], [equipement_id]) VALUES (103, 15)
INSERT [dbo].[equipement_hotel] ([hotel_id], [equipement_id]) VALUES (103, 21)
INSERT [dbo].[equipement_hotel] ([hotel_id], [equipement_id]) VALUES (103, 38)
INSERT [dbo].[equipement_hotel] ([hotel_id], [equipement_id]) VALUES (105, 15)
INSERT [dbo].[equipement_hotel] ([hotel_id], [equipement_id]) VALUES (105, 18)
INSERT [dbo].[equipement_hotel] ([hotel_id], [equipement_id]) VALUES (105, 21)
INSERT [dbo].[equipement_hotel] ([hotel_id], [equipement_id]) VALUES (105, 24)
INSERT [dbo].[equipement_hotel] ([hotel_id], [equipement_id]) VALUES (105, 29)
INSERT [dbo].[equipement_hotel] ([hotel_id], [equipement_id]) VALUES (105, 35)
INSERT [dbo].[equipement_hotel] ([hotel_id], [equipement_id]) VALUES (105, 38)
INSERT [dbo].[equipement_hotel] ([hotel_id], [equipement_id]) VALUES (105, 40)
INSERT [dbo].[equipement_hotel] ([hotel_id], [equipement_id]) VALUES (105, 44)
INSERT [dbo].[equipement_hotel] ([hotel_id], [equipement_id]) VALUES (105, 46)
INSERT [dbo].[equipement_hotel] ([hotel_id], [equipement_id]) VALUES (106, 15)
INSERT [dbo].[equipement_hotel] ([hotel_id], [equipement_id]) VALUES (106, 21)
INSERT [dbo].[equipement_hotel] ([hotel_id], [equipement_id]) VALUES (106, 29)
INSERT [dbo].[equipement_hotel] ([hotel_id], [equipement_id]) VALUES (106, 35)
INSERT [dbo].[equipement_hotel] ([hotel_id], [equipement_id]) VALUES (106, 38)
INSERT [dbo].[equipement_hotel] ([hotel_id], [equipement_id]) VALUES (107, 15)
INSERT [dbo].[equipement_hotel] ([hotel_id], [equipement_id]) VALUES (107, 18)
INSERT [dbo].[equipement_hotel] ([hotel_id], [equipement_id]) VALUES (107, 21)
INSERT [dbo].[equipement_hotel] ([hotel_id], [equipement_id]) VALUES (107, 38)
INSERT [dbo].[equipement_hotel] ([hotel_id], [equipement_id]) VALUES (108, 15)
INSERT [dbo].[equipement_hotel] ([hotel_id], [equipement_id]) VALUES (108, 18)
INSERT [dbo].[equipement_hotel] ([hotel_id], [equipement_id]) VALUES (108, 21)
INSERT [dbo].[equipement_hotel] ([hotel_id], [equipement_id]) VALUES (108, 24)
INSERT [dbo].[equipement_hotel] ([hotel_id], [equipement_id]) VALUES (108, 35)
INSERT [dbo].[equipement_hotel] ([hotel_id], [equipement_id]) VALUES (108, 38)
INSERT [dbo].[equipement_hotel] ([hotel_id], [equipement_id]) VALUES (110, 15)
INSERT [dbo].[equipement_hotel] ([hotel_id], [equipement_id]) VALUES (110, 18)
INSERT [dbo].[equipement_hotel] ([hotel_id], [equipement_id]) VALUES (110, 21)
INSERT [dbo].[equipement_hotel] ([hotel_id], [equipement_id]) VALUES (110, 24)
INSERT [dbo].[equipement_hotel] ([hotel_id], [equipement_id]) VALUES (110, 35)
INSERT [dbo].[equipement_hotel] ([hotel_id], [equipement_id]) VALUES (110, 38)
INSERT [dbo].[equipement_hotel] ([hotel_id], [equipement_id]) VALUES (111, 15)
INSERT [dbo].[equipement_hotel] ([hotel_id], [equipement_id]) VALUES (111, 18)
INSERT [dbo].[equipement_hotel] ([hotel_id], [equipement_id]) VALUES (111, 21)
INSERT [dbo].[equipement_hotel] ([hotel_id], [equipement_id]) VALUES (111, 29)
INSERT [dbo].[equipement_hotel] ([hotel_id], [equipement_id]) VALUES (111, 35)
INSERT [dbo].[equipement_hotel] ([hotel_id], [equipement_id]) VALUES (111, 38)
INSERT [dbo].[equipement_hotel] ([hotel_id], [equipement_id]) VALUES (111, 46)
INSERT [dbo].[equipement_hotel] ([hotel_id], [equipement_id]) VALUES (112, 15)
INSERT [dbo].[equipement_hotel] ([hotel_id], [equipement_id]) VALUES (112, 21)
INSERT [dbo].[equipement_hotel] ([hotel_id], [equipement_id]) VALUES (112, 24)
INSERT [dbo].[equipement_hotel] ([hotel_id], [equipement_id]) VALUES (112, 35)
INSERT [dbo].[equipement_hotel] ([hotel_id], [equipement_id]) VALUES (112, 38)
INSERT [dbo].[equipement_hotel] ([hotel_id], [equipement_id]) VALUES (112, 46)
INSERT [dbo].[equipement_hotel] ([hotel_id], [equipement_id]) VALUES (120, 15)
INSERT [dbo].[equipement_hotel] ([hotel_id], [equipement_id]) VALUES (120, 21)
INSERT [dbo].[equipement_hotel] ([hotel_id], [equipement_id]) VALUES (120, 24)
INSERT [dbo].[equipement_hotel] ([hotel_id], [equipement_id]) VALUES (120, 38)
INSERT [dbo].[equipement_hotel] ([hotel_id], [equipement_id]) VALUES (128, 15)
INSERT [dbo].[equipement_hotel] ([hotel_id], [equipement_id]) VALUES (128, 21)
INSERT [dbo].[equipement_hotel] ([hotel_id], [equipement_id]) VALUES (128, 38)
INSERT [dbo].[equipement_hotel] ([hotel_id], [equipement_id]) VALUES (128, 40)
INSERT [dbo].[equipement_hotel] ([hotel_id], [equipement_id]) VALUES (129, 15)
INSERT [dbo].[equipement_hotel] ([hotel_id], [equipement_id]) VALUES (129, 21)
INSERT [dbo].[equipement_hotel] ([hotel_id], [equipement_id]) VALUES (129, 29)
INSERT [dbo].[equipement_hotel] ([hotel_id], [equipement_id]) VALUES (129, 35)
INSERT [dbo].[equipement_hotel] ([hotel_id], [equipement_id]) VALUES (129, 38)
INSERT [dbo].[equipement_hotel] ([hotel_id], [equipement_id]) VALUES (135, 15)
INSERT [dbo].[equipement_hotel] ([hotel_id], [equipement_id]) VALUES (135, 21)
INSERT [dbo].[equipement_hotel] ([hotel_id], [equipement_id]) VALUES (135, 24)
INSERT [dbo].[equipement_hotel] ([hotel_id], [equipement_id]) VALUES (135, 35)
INSERT [dbo].[equipement_hotel] ([hotel_id], [equipement_id]) VALUES (135, 38)
INSERT [dbo].[equipement_hotel] ([hotel_id], [equipement_id]) VALUES (140, 15)
INSERT [dbo].[equipement_hotel] ([hotel_id], [equipement_id]) VALUES (140, 21)
INSERT [dbo].[equipement_hotel] ([hotel_id], [equipement_id]) VALUES (140, 29)
INSERT [dbo].[equipement_hotel] ([hotel_id], [equipement_id]) VALUES (140, 38)
INSERT [dbo].[equipement_hotel] ([hotel_id], [equipement_id]) VALUES (140, 40)
GO
INSERT [dbo].[hotel] ([id], [nom], [rue1], [rue2], [cp], [ville], [telephone], [descourt], [deslong], [prix], [motpasse]) VALUES (101, N'MACON - NORD', N'73, rue de Barbentane', N'Sennecé-les-Mâcon', N'71000', N'MACON', N'+33 (0)3 85 13 63 00', N'L''hôtel Mâcon Nord propose un hébergement confortable et un accueil chaleureux et convivial à l''entrée de l''autoroute A6', N'Les chambres confortables sont dotées d''une salle de bains privative, d''une télévision et d''un téléphone. L''accès Internet sans fil est disponible dans les parties communes et un parking gratuit est disponible sur place. Dans la matinée, profitez du petit déjeuner buffet copieux.', 56, N'$argon2id$v=19$m=65536,t=3,p=1$tgKzvq2uIE6aop4WAC9iLQ$zZ/fqjRtgBhH8rpPSaLateU2vmXdrofkHgxxnpchvNM')
INSERT [dbo].[hotel] ([id], [nom], [rue1], [rue2], [cp], [ville], [telephone], [descourt], [deslong], [prix], [motpasse]) VALUES (103, N'MACON - CENTRE', N'1 Rue Bigonnet', NULL, N'71000', N'MACON', N'+33 (0)3 85 38 18 10', N'Hôtel entièrement rénové ! Au centre-gare de Mâcon, nous saurons vous faire allier déplacement professionnel et plaisir de la connaissance !', N'Offrant une télévision à écran plat dans les chambres et une connexion Wi-Fi gratuite, l''hôtel  propose des équipements modernes et un accueil chaleureux. Les chambres sont confortables et disposent de salle de bains privée et de tout le confort moderne. Démarrez la journée en beauté en dégustant un petit déjeuner buffet savoureux et copieux.', 60, N'$argon2id$v=19$m=65536,t=3,p=1$KJgYecVfsTJxfKFdhvye0A$+AHgCiU+FiiLnp6vZfeHd+E6lnrVJSQh4eqjj4una7U')
INSERT [dbo].[hotel] ([id], [nom], [rue1], [rue2], [cp], [ville], [telephone], [descourt], [deslong], [prix], [motpasse]) VALUES (105, N'LYON - DARDILLY', N'15 Chemin de Gargantua', N'Sortie: 33b Dardilly-Porte de lyon', N'69570', N'DARDILLY', N'+33 (0)4 78 66 77 77', N'L''hôtel Lyon Nord Dardilly, entièrement rénové en 2011, est situé à 11 kilomètres du centre-ville de Lyon.', N'L''hôtel, entièrement rénové en 2025, propose un restaurant-bar, un parking gratuit et une connexion Wi-Fi gratuite dans chaque chambre. Le Lyon Nord Dardilly dispose de 60 chambres avec terrasse et télévision par satellite et par câble. Vous pourrez choisir parmi une sélection de plats traditionnels et régionaux servis dans le restaurant de l''hôtel. Le Lyon Nord Dardilly se trouve à proximité des musées et des théâtres de Lyon. Vous pourrez également vous rendre dans les Alpes voisines et profiter des pistes de ski et des sentiers de randonnée. L''hôtel est ouvert 24h/24 et les chambres sont disponibles dès 14H. ATTENTION : Restaurant fermé pour congés du 22/12/14 au 04/01/15 inclus.', 70, N'$argon2id$v=19$m=65536,t=3,p=1$Rk6pt+lXQHotnJ6oqo3UWg$mocBrXkfLrjESWrUgcPC/WUoHypGANwyT6B/PwTVHJA')
INSERT [dbo].[hotel] ([id], [nom], [rue1], [rue2], [cp], [ville], [telephone], [descourt], [deslong], [prix], [motpasse]) VALUES (106, N'LYON - VILLEFRANCHE-SUR-SAONE', N'365 av. Theodore - Braun', NULL, N'69400', N'VILLEFRANCHE-SUR-SAONE', N'+33 (0)4 74 62 89 13', N'L''hotel est situé à Villefranche-sur-Saone, à 15 minutes au nord de Lyon. Vous apprécierez le calme et la convivialité de notre hotel. Les horaires d''ouverture de la réception sont les suivants : 7H00 à 23H00.', N'L’hôtel de Villefranche sur Saône, entièrement climatisé, dispose de 50 chambres tout confort, équipées : d’une salle de bain/douche avec toilettes, d’une télévision écran plat LED avec canal+, canal satellite et les chaines internationales, d’un téléphone direct avec réveil automatique ainsi que d’une connexion Wifi gratuite. Dans votre chambre, vous trouverez tout le confort nécessaire dans un cadre moderne et fonctionnel. Vous pourrez également vous restaurer dans notre restaurant où le buffet est à volonté ! Pour vous détendre, un salon ainsi qu’une terrasse ombragée sont à votre disposition. L’hôtel propose un parking privé gratuit fermé la nuit. L''hôtel de Villefranche sur Saône se situe à 300 m de l’autoroute, à 2 mn du parc des expositions, à 5 mn du centre ville, à 15 mn du centre de Lyon, 30 mn de l’aéroport, et à 20 mn des Dombes (Parc des oiseaux) et du Hameau du Beaujolais. A quelques minutes d’Ars. ', 63, N'$argon2id$v=19$m=65536,t=3,p=1$rGGViPEJ2sd8+ljufAPo4A$DFR83Alok42q1BQjXi1+4eXQl7eEq07ksTMKv4mRUYM')
INSERT [dbo].[hotel] ([id], [nom], [rue1], [rue2], [cp], [ville], [telephone], [descourt], [deslong], [prix], [motpasse]) VALUES (107, N'LYON - BRON', N'16 rue Maryse Bastie', N'', N'69500', N'BRON', N'+33 (0)4 72 37 46 46', N'L''Hôtel Lyon-Bron, idéal pour les escales et les voyages d''affaires courts, jouit d''un emplacement privilégié à seulement 5 minutes du parc des expositions Eurexpo, à 10 minutes du centre de Lyon et à 15 minutes de l''aéroport international Lyon Saint Exupéry.', N'Nous vous proposons 50 chambres non-fumeurs tout confort, climatisées, avec WIFI gratuit et un parking fermé sous surveillance vidéo enregistrée. Nous nous ferons un plaisir de vous accueillir pour vos séjours professionnels et touristiques. L''hôtel dispose aussi d''un bar avec terrasse et d''un parking privé avec système de vidéosurveillance. Plusieurs restaurants sont accessibles à proximité de cet établissement.', 70, N'$argon2id$v=19$m=65536,t=3,p=1$2mhgaCBFp+l0Pik3NdiV/A$RHkcVDpmCLXtqHeEeqI/yC7IMPlSUWboeNgUhCaaGbU')
INSERT [dbo].[hotel] ([id], [nom], [rue1], [rue2], [cp], [ville], [telephone], [descourt], [deslong], [prix], [motpasse]) VALUES (108, N'LYON - GIVORS', N'Centre Commercial des 2 vallees', N'Rue de la paix', N'69700', N'GIVORS', N'+33 (0)4 72 24 15 56', N'L''hotel Lyon-Givors vous accueille dans la périphérie de Lyon. Vous apprécierez l''accueil chaleureux et amical de notre équipe.', N'Nous vous proposons 27 chambres tout confort, équipées de salle de bain et télévision satellite. Venez vous détendre au bar ou prendre un verre sur la terrasse. Idéal pour vos voyages ou vos soirées étapes, vous trouverez ici le confort et la douceur de vivre. Lyon capitale historique et gastronomique à 15 min. Eurexpo à 30 min', 61, N'$argon2id$v=19$m=65536,t=3,p=1$n5GsxdfadFMeHqMBf4T09Q$vajOsc7TOh23tQS8F+8/BjXlWpfMYxEsi+5b5dzI+tw')
INSERT [dbo].[hotel] ([id], [nom], [rue1], [rue2], [cp], [ville], [telephone], [descourt], [deslong], [prix], [motpasse]) VALUES (110, N'BOURG-EN-BRESSE - VIRIAT', N'694 rue des Vareys', N'Parc de la Chambiere', N'01440', N'VIRIAT', N'+33 (0)4 74 45 11 35', N'Situé sur une zone d’activité, à proximité du nœud autoroutier A39, 40 et 42, l’hôtel ffre une position stratégique d’où que vous veniez.', N'L''Hôtel Bourg En Bresse vous propose des chambres confortables à des tarifs abordables à proximité de l''autoroute, à 3 kilomètres du centre-ville et à 4 kilomètres de la gare. Vous pourrez profiter de la connexion Wi-Fi gratuite illimitée et du parking privé gratuit. Les chambres possèdent une salle de bains privative avec douche, lavabo et toilettes, un espace de travail, une télévision à écran plat et la climatisation en été. Certaines chambres comprennent des toilettes privées et des douches communes. Hôtel non fumeur. Merci de nous informer au préalable pour toute arrivée en dehors des horaires d''ouverture de la réception (ouvert de 7h-12h et 17h-21h). Les chambres doivent être libérées à 11h00 le jour du départ. Les animaux sont admis.', 45, N'$argon2id$v=19$m=65536,t=3,p=1$LD5TlvJMTxU1zdkuLaEluw$mJS3Gckvq5SmJYNFoaPpubGalY1HUflkNtHbDr7CoHM')
INSERT [dbo].[hotel] ([id], [nom], [rue1], [rue2], [cp], [ville], [telephone], [descourt], [deslong], [prix], [motpasse]) VALUES (111, N'DIJON - NORD', N'4 rue des Ardennes', N'Village Auto', N'21000', N'DIJON', N'+33 (0)3 80 78 90 80', N'L''hôtel Dijon vous attend pour vous offrir un accueil à la fois chaleureux et personnel. L''hôtel est idéal pour un séjour en famille ou entre amis, et y passer un agréable moment.', N'L''Hôtel Dijon Nord vous accueille 24h/24 dans ses 53 chambres non fumeur, entièrement équipées et climatisées avec l''accès wifi gratuit. Nous disposons également de chambres familiales et communicantes. Toute l''équipe de notre restaurant aura le plaisir de vous accueillir tous les jours (sauf le Samedi midi et Dimanche midi) pour vous servir des spécialités bourguignonnes, des grillades, pizzas, salades... Dès les beaux jours vous pourrez profiter de notre terrasse ainsi que de la piscine extérieur.', 68, N'$argon2id$v=19$m=65536,t=3,p=1$BlrG5qOQY/LgDef2dhUKFg$TaPUkMt8fGn+xVbtziRCVhtaXAsjaVOEo2R7+UJ+RH0')
INSERT [dbo].[hotel] ([id], [nom], [rue1], [rue2], [cp], [ville], [telephone], [descourt], [deslong], [prix], [motpasse]) VALUES (112, N'DIJON - MARSANNAY', N'84 Route de Beaune', NULL, N'21160', N'MARSANNAY-LA-COTE', N'+33 (0)3 80 51 10 00', N'Situé à quelques minutes de Dijon, l''hôtel Superior sera le point de départ pour découvrir la route des Grands Crus de Bourgogne, le prestigieux Palais de ses Grands Ducs et le centre médiéval de la ville.', N'Le Superior vous propose 49 chambres climatisées, toutes équipées de salle de bain et wc privés, Wifi gratuit, téléviseur LCD, canal+, canal sat et téléphone direct, dont 2 chambres accessibles aux personnes à mobilité réduite. Vous aurez un large choix de chambres doubles, triples et quadruples. A la belle saison vous apprécierez la piscine chauffée. Un parking fermé sous vidéo surveillance est à votre disposition.', 78, N'$argon2id$v=19$m=65536,t=3,p=1$yo5B9GQerb+j4yCbfXi8EA$TKWx0cflly7Ih6ri7hC9+SM3jOLawDn5+YL1S2LV0oA')
INSERT [dbo].[hotel] ([id], [nom], [rue1], [rue2], [cp], [ville], [telephone], [descourt], [deslong], [prix], [motpasse]) VALUES (120, N'GRIGNY', N'10 Avenue des Tuileries', NULL, N'91350', N'GRIGNY', N'+33 (0)1 69 43 53 33', N'Notre hôtel, situé à proximité de l''autoroute A6, à 15 min de l''aéroport d''Orly et à 2 minutes à pied de la ligne D du RER, est ouvert 24/24 7/7j.', N'L''hôtel propose un hébergement de qualité à un prix abordable. Toutes les chambres, à la décoration sobre et brillante, sont spacieuses et confortables. Elles sont toutes dotées d''équipements modernes, comme la salle de bains privative, la télévision satellite et l''accès Internet sans fil.', 66, N'$argon2id$v=19$m=65536,t=3,p=1$MVEp/4HPBf80xRbK0CpcdA$VazNxbAAN5uWK4sb9L784Ix1pzPRwArPmADx1vg2Ih0')
INSERT [dbo].[hotel] ([id], [nom], [rue1], [rue2], [cp], [ville], [telephone], [descourt], [deslong], [prix], [motpasse]) VALUES (128, N'CHILLY MAZARIN', N'4 rue Denis Papin', N'ZI La Vigne aux Loups', N'91380', N'CHILLY - MAZARIN', N'+33 (0)1 69 09 02 22', N'Situé à proximité de l''aéroport Paris Orly, entre les autoroutes A6 et A10, , l''hôtel de Chilly Mazarin vous accueille dans une de ses 80 chambres.', N'L''hôtel propose des chambres spacieuses dotées de 1 à 2 lits et d''une connexion WiFi gratuite. Ses chambres offrent des espaces de vie confortables, parfaits pour une étape ou un séjour de courte durée dans la région. La station de RER toute proche vous place à mi-chemin du Château de Versailles et du centre de Paris. L''aéroport de Paris-Orly se trouve à seulement 10 minutes de l''hôtel.', 65, N'$argon2id$v=19$m=65536,t=3,p=1$Qseo+NlMH1MXmx5qIdbEhA$GtHZuPAptaFjWXcRkXzE4rnWTzFLYNfZlvGbNzmE3aI')
INSERT [dbo].[hotel] ([id], [nom], [rue1], [rue2], [cp], [ville], [telephone], [descourt], [deslong], [prix], [motpasse]) VALUES (129, N'ANTONY', N'1 rue Alexis de Tocqueville', NULL, N'92160', N'ANTONY', N'+33 (0)1 55 59 98 46', N'Cet hôtel se trouve à Antony, à quelques minutes de route des autoroutes A6 et A10, et à 10 minutes de l''aéroport d''Orly.', N'Chaque chambre comprend une connexion Wi-Fi gratuite, la télévision par satellite, Canal+ et une salle de bains. Un petit déjeuner buffet est proposé en matinée et le restaurant de l''hôtel sert des plats de saison pour le déjeuner et le dîner. En soirée, vous pouvez vous détendre dans le bar de l''Hôtel Antony Superior. L''Hôtel se trouve à 1,5 km de la station de RER Fontaine-Michalon, qui permet de rejoindre le centre de Paris. En voiture, la capitale est accessible en 20 minutes.', 94, N'$argon2id$v=19$m=65536,t=3,p=1$PAwaf0EIWx27jUN9B6XZ2Q$814y4dQ9PHLQ4RoF8otW28HM0Rv+g0Mk6Id7r5eNKS4')
INSERT [dbo].[hotel] ([id], [nom], [rue1], [rue2], [cp], [ville], [telephone], [descourt], [deslong], [prix], [motpasse]) VALUES (135, N'RAMBOUILLET', N'Rue Joseph Jacquart', NULL, N'78120', N'RAMBOUILLET', N'+33 (0)1 34 94 90 26', N'Notre hôtel vous accueille pour une halte reposante à 50km de Paris et à proximité de l''aéroport d''Orly.', N'Cet hôtel propose un hébergement économique en périphérie de Rambouillet et près du parc naturel régional de la Haute Vallée de Chevreuse. Une connexion Wi-Fi gratuite est disponible dans tout l''établissement. Chaque chambre de l''Hôtel  Rambouillet possède une salle de bain privative et une télévision avec les chaînes satellite. L''Hôtel  Rambouillet occupe un emplacement idéal, à 2,5 km du centre-ville et de la gare de Rambouillet. Il se trouve également à 40 minutes de route de l''aéroport de Paris-Orly et est facilement accessible depuis l''autoroute N10. Les clients voyageant en voiture apprécieront le parking gratuit.', 66, N'$argon2id$v=19$m=65536,t=3,p=1$S5sa6HYqIbfit83jeYOkPw$UuMXc2PKMqNfKsDb7K7ifqy22czMNnA/2zpW41BuNY8')
INSERT [dbo].[hotel] ([id], [nom], [rue1], [rue2], [cp], [ville], [telephone], [descourt], [deslong], [prix], [motpasse]) VALUES (140, N'TRAPPES', N'Rue gaston Monmousseau', N'Z.A. de Trappes Elancourt', N'78190', N'TRAPPES', N'+33 (0)1 30 50 82 42', N'A 5 minutes du centre-ville, 10 minutes du Vélodrome National de Saint Quentin en Yvelines, l''hôtel Trappes est une destination de choix pour se dépayser de la capitale sans en être très loin, à seulement 40 minutes.', N'Proche des centres d''affaires et des sites touristiques (Vélodrome National, Golf de St Quentin, Versailles…), cet établissement est idéal aussi bien pour les déplacements professionnels que pour les séjours loisirs. Ses 67 chambres comprennent une salle de bain privative avec baignoire ou douche, une télévision satellite, un accès Wifi gratuit. L''hôtel dispose également de 3 salles de réunion équipées (d''une capacité de 5 à 50 personnes) ainsi que d''une grande terrasse extérieure pouvant accueillir jusqu''à 30 personnes.', 100, N'$argon2id$v=19$m=65536,t=3,p=1$gHXIenBWpXZuN62dzVjQxg$eVaZqJbctAI+qMVmttOsnAfWpCmeyn/+BYi7b995JQM')
GO
INSERT [dbo].[photo] ([id], [nomfichier], [hotel_id]) VALUES (1, N'01.jpg', 105)
INSERT [dbo].[photo] ([id], [nomfichier], [hotel_id]) VALUES (2, N'02.jpg', 106)
INSERT [dbo].[photo] ([id], [nomfichier], [hotel_id]) VALUES (3, N'03.jpg', 107)
INSERT [dbo].[photo] ([id], [nomfichier], [hotel_id]) VALUES (4, N'04.jpg', 108)
INSERT [dbo].[photo] ([id], [nomfichier], [hotel_id]) VALUES (5, N'05.jpg', 120)
INSERT [dbo].[photo] ([id], [nomfichier], [hotel_id]) VALUES (6, N'06.jpg', 111)
INSERT [dbo].[photo] ([id], [nomfichier], [hotel_id]) VALUES (7, N'07.jpg', 105)
INSERT [dbo].[photo] ([id], [nomfichier], [hotel_id]) VALUES (8, N'08.jpg', 106)
INSERT [dbo].[photo] ([id], [nomfichier], [hotel_id]) VALUES (9, N'09.jpg', 128)
INSERT [dbo].[photo] ([id], [nomfichier], [hotel_id]) VALUES (10, N'10.jpg', 107)
INSERT [dbo].[photo] ([id], [nomfichier], [hotel_id]) VALUES (11, N'11.jpg', 112)
INSERT [dbo].[photo] ([id], [nomfichier], [hotel_id]) VALUES (12, N'12.jpg', 120)
INSERT [dbo].[photo] ([id], [nomfichier], [hotel_id]) VALUES (13, N'13.jpg', 120)
INSERT [dbo].[photo] ([id], [nomfichier], [hotel_id]) VALUES (14, N'14.jpg', 111)
INSERT [dbo].[photo] ([id], [nomfichier], [hotel_id]) VALUES (15, N'15.jpg', 103)
INSERT [dbo].[photo] ([id], [nomfichier], [hotel_id]) VALUES (16, N'16.jpg', 135)
INSERT [dbo].[photo] ([id], [nomfichier], [hotel_id]) VALUES (17, N'17.jpg', 128)
INSERT [dbo].[photo] ([id], [nomfichier], [hotel_id]) VALUES (18, N'18.jpg', 110)
INSERT [dbo].[photo] ([id], [nomfichier], [hotel_id]) VALUES (19, N'19.jpg', 140)
INSERT [dbo].[photo] ([id], [nomfichier], [hotel_id]) VALUES (20, N'20.jpg', 112)
INSERT [dbo].[photo] ([id], [nomfichier], [hotel_id]) VALUES (21, N'21.jpg', 101)
INSERT [dbo].[photo] ([id], [nomfichier], [hotel_id]) VALUES (22, N'22.jpg', 108)
INSERT [dbo].[photo] ([id], [nomfichier], [hotel_id]) VALUES (23, N'23.jpg', 129)
INSERT [dbo].[photo] ([id], [nomfichier], [hotel_id]) VALUES (24, N'24.jpg', 103)
INSERT [dbo].[photo] ([id], [nomfichier], [hotel_id]) VALUES (25, N'25.jpg', 101)
INSERT [dbo].[photo] ([id], [nomfichier], [hotel_id]) VALUES (26, N'26.jpg', 135)
INSERT [dbo].[photo] ([id], [nomfichier], [hotel_id]) VALUES (27, N'27.jpg', 140)
INSERT [dbo].[photo] ([id], [nomfichier], [hotel_id]) VALUES (28, N'28.jpg', 110)
INSERT [dbo].[photo] ([id], [nomfichier], [hotel_id]) VALUES (29, N'29.jpg', 105)
INSERT [dbo].[photo] ([id], [nomfichier], [hotel_id]) VALUES (30, N'30.jpg', 106)
INSERT [dbo].[photo] ([id], [nomfichier], [hotel_id]) VALUES (31, N'31.jpg', 107)
INSERT [dbo].[photo] ([id], [nomfichier], [hotel_id]) VALUES (32, N'32.jpg', 108)
INSERT [dbo].[photo] ([id], [nomfichier], [hotel_id]) VALUES (33, N'33.jpg', 111)
INSERT [dbo].[photo] ([id], [nomfichier], [hotel_id]) VALUES (34, N'34.jpg', 112)
INSERT [dbo].[photo] ([id], [nomfichier], [hotel_id]) VALUES (35, N'35.jpg', 120)
INSERT [dbo].[photo] ([id], [nomfichier], [hotel_id]) VALUES (36, N'36.jpg', 128)
INSERT [dbo].[photo] ([id], [nomfichier], [hotel_id]) VALUES (37, N'37.jpg', 129)
INSERT [dbo].[photo] ([id], [nomfichier], [hotel_id]) VALUES (38, N'38.jpg', 103)
INSERT [dbo].[photo] ([id], [nomfichier], [hotel_id]) VALUES (39, N'39.jpg', 129)
INSERT [dbo].[photo] ([id], [nomfichier], [hotel_id]) VALUES (40, N'40.jpg', 101)
INSERT [dbo].[photo] ([id], [nomfichier], [hotel_id]) VALUES (41, N'41.jpg', 135)
INSERT [dbo].[photo] ([id], [nomfichier], [hotel_id]) VALUES (42, N'42.jpg', 140)
INSERT [dbo].[photo] ([id], [nomfichier], [hotel_id]) VALUES (43, N'43.jpg', 110)
INSERT [dbo].[photo] ([id], [nomfichier], [hotel_id]) VALUES (44, N'44.jpg', 105)
INSERT [dbo].[photo] ([id], [nomfichier], [hotel_id]) VALUES (45, N'45.jpg', 106)
INSERT [dbo].[photo] ([id], [nomfichier], [hotel_id]) VALUES (46, N'46.jpg', 107)
INSERT [dbo].[photo] ([id], [nomfichier], [hotel_id]) VALUES (47, N'47.jpg', 108)
INSERT [dbo].[photo] ([id], [nomfichier], [hotel_id]) VALUES (48, N'48.jpg', 111)
INSERT [dbo].[photo] ([id], [nomfichier], [hotel_id]) VALUES (49, N'49.jpg', 112)
INSERT [dbo].[photo] ([id], [nomfichier], [hotel_id]) VALUES (50, N'50.jpg', 120)
INSERT [dbo].[photo] ([id], [nomfichier], [hotel_id]) VALUES (51, N'51.jpg', 103)
GO
SET IDENTITY_INSERT [dbo].[reservation] ON 

INSERT [dbo].[reservation] ([id], [datedebut], [datefin], [hotel_id], [client_id]) VALUES (1, CAST(N'2026-10-01' AS Date), CAST(N'2026-10-04' AS Date), 103, 2)
INSERT [dbo].[reservation] ([id], [datedebut], [datefin], [hotel_id], [client_id]) VALUES (2, CAST(N'2026-10-02' AS Date), CAST(N'2026-10-05' AS Date), 103, 1)
INSERT [dbo].[reservation] ([id], [datedebut], [datefin], [hotel_id], [client_id]) VALUES (3, CAST(N'2026-11-13' AS Date), CAST(N'2026-11-15' AS Date), 103, 1)
INSERT [dbo].[reservation] ([id], [datedebut], [datefin], [hotel_id], [client_id]) VALUES (4, CAST(N'2026-11-13' AS Date), CAST(N'2026-11-14' AS Date), 103, 4)
INSERT [dbo].[reservation] ([id], [datedebut], [datefin], [hotel_id], [client_id]) VALUES (5, CAST(N'2026-11-20' AS Date), CAST(N'2026-11-22' AS Date), 103, 5)
INSERT [dbo].[reservation] ([id], [datedebut], [datefin], [hotel_id], [client_id]) VALUES (6, CAST(N'2026-11-18' AS Date), CAST(N'2026-11-22' AS Date), 103, 6)
INSERT [dbo].[reservation] ([id], [datedebut], [datefin], [hotel_id], [client_id]) VALUES (7, CAST(N'2026-12-06' AS Date), CAST(N'2026-12-08' AS Date), 103, 2)
INSERT [dbo].[reservation] ([id], [datedebut], [datefin], [hotel_id], [client_id]) VALUES (8, CAST(N'2026-11-13' AS Date), CAST(N'2026-11-16' AS Date), 101, 3)
INSERT [dbo].[reservation] ([id], [datedebut], [datefin], [hotel_id], [client_id]) VALUES (9, CAST(N'2026-12-27' AS Date), CAST(N'2027-01-02' AS Date), 101, 4)
SET IDENTITY_INSERT [dbo].[reservation] OFF
GO
/****** Object:  Index [IX_chambre]    Script Date: 25/10/2026 19:57:32 ******/
CREATE NONCLUSTERED INDEX [IX_chambre] ON [dbo].[chambre]
(
	[hotel_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[chambre]  WITH CHECK ADD  CONSTRAINT [FK_chambre_hotel] FOREIGN KEY([hotel_id])
REFERENCES [dbo].[hotel] ([id])
GO
ALTER TABLE [dbo].[chambre] CHECK CONSTRAINT [FK_chambre_hotel]
GO
ALTER TABLE [dbo].[chambre_reservation]  WITH CHECK ADD  CONSTRAINT [FK_chambre_reservation_chambre] FOREIGN KEY([chambre_id])
REFERENCES [dbo].[chambre] ([id])
GO
ALTER TABLE [dbo].[chambre_reservation] CHECK CONSTRAINT [FK_chambre_reservation_chambre]
GO
ALTER TABLE [dbo].[chambre_reservation]  WITH CHECK ADD  CONSTRAINT [FK_chambre_reservation_reservation] FOREIGN KEY([reservation_id])
REFERENCES [dbo].[reservation] ([id])
GO
ALTER TABLE [dbo].[chambre_reservation] CHECK CONSTRAINT [FK_chambre_reservation_reservation]
GO
ALTER TABLE [dbo].[equipement_hotel]  WITH CHECK ADD  CONSTRAINT [FK_equipement_hotel_equipement] FOREIGN KEY([equipement_id])
REFERENCES [dbo].[equipement] ([id])
GO
ALTER TABLE [dbo].[equipement_hotel] CHECK CONSTRAINT [FK_equipement_hotel_equipement]
GO
ALTER TABLE [dbo].[equipement_hotel]  WITH CHECK ADD  CONSTRAINT [FK_equipement_hotel_hotel] FOREIGN KEY([hotel_id])
REFERENCES [dbo].[hotel] ([id])
GO
ALTER TABLE [dbo].[equipement_hotel] CHECK CONSTRAINT [FK_equipement_hotel_hotel]
GO
ALTER TABLE [dbo].[photo]  WITH CHECK ADD  CONSTRAINT [FK_photo_hotel] FOREIGN KEY([hotel_id])
REFERENCES [dbo].[hotel] ([id])
GO
ALTER TABLE [dbo].[photo] CHECK CONSTRAINT [FK_photo_hotel]
GO
ALTER TABLE [dbo].[reservation]  WITH CHECK ADD  CONSTRAINT [FK_reservation_client] FOREIGN KEY([client_id])
REFERENCES [dbo].[client] ([id])
GO
ALTER TABLE [dbo].[reservation] CHECK CONSTRAINT [FK_reservation_client]
GO
ALTER TABLE [dbo].[reservation]  WITH CHECK ADD  CONSTRAINT [FK_reservation_hotel] FOREIGN KEY([hotel_id])
REFERENCES [dbo].[hotel] ([id])
GO
ALTER TABLE [dbo].[reservation] CHECK CONSTRAINT [FK_reservation_hotel]
GO
USE [master]
GO
ALTER DATABASE [bdhotel_mouaddorian] SET  READ_WRITE 
GO
