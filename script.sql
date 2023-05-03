USE [master]
GO
/****** Object:  Database [personajesDB]    Script Date: 3/5/2023 10:52:01 ******/
CREATE DATABASE [personajesDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'personajesDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\personajesDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'personajesDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\personajesDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [personajesDB] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [personajesDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [personajesDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [personajesDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [personajesDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [personajesDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [personajesDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [personajesDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [personajesDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [personajesDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [personajesDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [personajesDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [personajesDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [personajesDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [personajesDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [personajesDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [personajesDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [personajesDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [personajesDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [personajesDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [personajesDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [personajesDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [personajesDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [personajesDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [personajesDB] SET RECOVERY FULL 
GO
ALTER DATABASE [personajesDB] SET  MULTI_USER 
GO
ALTER DATABASE [personajesDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [personajesDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [personajesDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [personajesDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [personajesDB] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'personajesDB', N'ON'
GO
ALTER DATABASE [personajesDB] SET QUERY_STORE = OFF
GO
USE [personajesDB]
GO
/****** Object:  User [alumno]    Script Date: 3/5/2023 10:52:02 ******/
CREATE USER [alumno] FOR LOGIN [alumno] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Personaje]    Script Date: 3/5/2023 10:52:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Personaje](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Imagen] [nvarchar](max) NOT NULL,
	[Nombre] [nvarchar](50) NOT NULL,
	[Edad] [int] NOT NULL,
	[Peso] [nvarchar](50) NOT NULL,
	[Historia] [nvarchar](max) NOT NULL,
	[PeliculasSeries] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Personaje] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PersonajesPeliculas]    Script Date: 3/5/2023 10:52:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PersonajesPeliculas](
	[FK_Id_personaje] [int] NOT NULL,
	[FK_Id_seriesPelis] [int] NOT NULL,
 CONSTRAINT [PK_PersonajesPeliculas] PRIMARY KEY CLUSTERED 
(
	[FK_Id_personaje] ASC,
	[FK_Id_seriesPelis] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[seriesPelis]    Script Date: 3/5/2023 10:52:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[seriesPelis](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Imagen] [nvarchar](max) NOT NULL,
	[FechaCreacion] [date] NOT NULL,
	[Calificacion] [decimal](2, 1) NOT NULL,
	[pjAsociados] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_seriesPelis] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Personaje] ON 

INSERT [dbo].[Personaje] ([Id], [Imagen], [Nombre], [Edad], [Peso], [Historia], [PeliculasSeries]) VALUES (1, N'luca.jpg', N'Luca', 13, N'46kg', N'En el verano de 1959,​ Luca Paguro (voz de Jacob tremblay) un joven monstruo marino de 13 años que vive en la costa de la ciudad italiana de Portorosso, cría peces cabra y sus padres le prohíben acercarse a la superficie (aunque su abuela ya lo había hecho y jugó a las cartas con unos humanos), porque era peligroso.', N'Luca')
INSERT [dbo].[Personaje] ([Id], [Imagen], [Nombre], [Edad], [Peso], [Historia], [PeliculasSeries]) VALUES (2, N'srPeabody.jpg', N'Sr Peabody', 5, N'15kg', N'Peabody es un antropomórfico perro superdotado que vive en un ático en la ciudad de Nueva York. Él cría a su hijo humano adoptivo, Sherman de 7 años, y lo instruye viajando a lo largo de la historia usando la WABAC, pronunciada "muy atrás", una máquina del tiempo.', N'Las aventuras del Sr Peabody y Sherman')
INSERT [dbo].[Personaje] ([Id], [Imagen], [Nombre], [Edad], [Peso], [Historia], [PeliculasSeries]) VALUES (3, N'raju.jpg', N'Alluri Sitarama Raju', 23, N'85kg', N'Alluri Sitarama Raju fue un revolucionario indio que emprendió una campaña armada contra el dominio colonial británico en la India.', N'RRR')
SET IDENTITY_INSERT [dbo].[Personaje] OFF
GO
SET IDENTITY_INSERT [dbo].[seriesPelis] ON 

INSERT [dbo].[seriesPelis] ([Id], [Imagen], [FechaCreacion], [Calificacion], [pjAsociados]) VALUES (2, N'luca.jpg', CAST(N'2021-06-13' AS Date), CAST(4.0 AS Decimal(2, 1)), N'Luca Paguro, Alberto Scorfano, Giulia Marcovaldo')
INSERT [dbo].[seriesPelis] ([Id], [Imagen], [FechaCreacion], [Calificacion], [pjAsociados]) VALUES (4, N'srPeabody.jpg', CAST(N'2014-02-20' AS Date), CAST(4.0 AS Decimal(2, 1)), N'Sr Peabody, Sherman, Penny Peterson')
INSERT [dbo].[seriesPelis] ([Id], [Imagen], [FechaCreacion], [Calificacion], [pjAsociados]) VALUES (6, N'raju.jpg', CAST(N'2022-03-24' AS Date), CAST(4.5 AS Decimal(2, 1)), N'Alluri Sitarama Raju')
SET IDENTITY_INSERT [dbo].[seriesPelis] OFF
GO
USE [master]
GO
ALTER DATABASE [personajesDB] SET  READ_WRITE 
GO
