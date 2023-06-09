USE [PjsDB]
GO
/****** Object:  Table [dbo].[Personaje]    Script Date: 10/5/2023 10:37:49 ******/
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
/****** Object:  Table [dbo].[PersonajesPeliculas]    Script Date: 10/5/2023 10:37:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PersonajesPeliculas](
	[FK_Id_persj] [int] NOT NULL,
	[FK_Id_pelis] [int] NOT NULL,
 CONSTRAINT [PK_PersonajesPeliculas] PRIMARY KEY CLUSTERED 
(
	[FK_Id_persj] ASC,
	[FK_Id_pelis] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[seriesPelis]    Script Date: 10/5/2023 10:37:49 ******/
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
INSERT [dbo].[PersonajesPeliculas] ([FK_Id_persj], [FK_Id_pelis]) VALUES (1, 2)
INSERT [dbo].[PersonajesPeliculas] ([FK_Id_persj], [FK_Id_pelis]) VALUES (2, 4)
INSERT [dbo].[PersonajesPeliculas] ([FK_Id_persj], [FK_Id_pelis]) VALUES (3, 6)
GO
SET IDENTITY_INSERT [dbo].[seriesPelis] ON 

INSERT [dbo].[seriesPelis] ([Id], [Imagen], [FechaCreacion], [Calificacion], [pjAsociados]) VALUES (2, N'peliLuca.jpg', CAST(N'2021-06-13' AS Date), CAST(4.0 AS Decimal(2, 1)), N'Luca Paguro, Alberto Scorfano, Giulia Marcovaldo')
INSERT [dbo].[seriesPelis] ([Id], [Imagen], [FechaCreacion], [Calificacion], [pjAsociados]) VALUES (4, N'peliPeabody.jpg', CAST(N'2014-02-20' AS Date), CAST(4.0 AS Decimal(2, 1)), N'Sr Peabody, Sherman, Penny Peterson')
INSERT [dbo].[seriesPelis] ([Id], [Imagen], [FechaCreacion], [Calificacion], [pjAsociados]) VALUES (6, N'rrrPeli.jpg', CAST(N'2022-03-24' AS Date), CAST(4.5 AS Decimal(2, 1)), N'Alluri Sitarama Raju')
SET IDENTITY_INSERT [dbo].[seriesPelis] OFF
GO
ALTER TABLE [dbo].[PersonajesPeliculas]  WITH CHECK ADD  CONSTRAINT [FK_PersonajesPeliculas_PersonajesPeliculas] FOREIGN KEY([FK_Id_persj], [FK_Id_pelis])
REFERENCES [dbo].[PersonajesPeliculas] ([FK_Id_persj], [FK_Id_pelis])
GO
ALTER TABLE [dbo].[PersonajesPeliculas] CHECK CONSTRAINT [FK_PersonajesPeliculas_PersonajesPeliculas]
GO
ALTER TABLE [dbo].[PersonajesPeliculas]  WITH CHECK ADD  CONSTRAINT [FK_PersonajesPeliculas_PersonajesPeliculas1] FOREIGN KEY([FK_Id_persj], [FK_Id_pelis])
REFERENCES [dbo].[PersonajesPeliculas] ([FK_Id_persj], [FK_Id_pelis])
GO
ALTER TABLE [dbo].[PersonajesPeliculas] CHECK CONSTRAINT [FK_PersonajesPeliculas_PersonajesPeliculas1]
GO
USE [master]
GO
ALTER DATABASE [personajesDB] SET  READ_WRITE 
GO
