
/****** Object:  Database [FOCIMIRSDesarrollo]    Script Date: 8/24/2015 9:25:28 AM ******/
CREATE DATABASE [FOCIMIRSDesarrollo] ON  PRIMARY 
( NAME = N'FOCIMIRSDesarrollo', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\FOCIMIRSDesarrollo.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'FOCIMIRSDesarrollo_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\FOCIMIRSDesarrollo_log.ldf' , SIZE = 4160KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [FOCIMIRSDesarrollo] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FOCIMIRSDesarrollo].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FOCIMIRSDesarrollo] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FOCIMIRSDesarrollo] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FOCIMIRSDesarrollo] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FOCIMIRSDesarrollo] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FOCIMIRSDesarrollo] SET ARITHABORT OFF 
GO
ALTER DATABASE [FOCIMIRSDesarrollo] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [FOCIMIRSDesarrollo] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FOCIMIRSDesarrollo] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FOCIMIRSDesarrollo] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FOCIMIRSDesarrollo] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FOCIMIRSDesarrollo] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FOCIMIRSDesarrollo] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FOCIMIRSDesarrollo] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FOCIMIRSDesarrollo] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FOCIMIRSDesarrollo] SET  DISABLE_BROKER 
GO
ALTER DATABASE [FOCIMIRSDesarrollo] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FOCIMIRSDesarrollo] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FOCIMIRSDesarrollo] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FOCIMIRSDesarrollo] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FOCIMIRSDesarrollo] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FOCIMIRSDesarrollo] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FOCIMIRSDesarrollo] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FOCIMIRSDesarrollo] SET RECOVERY FULL 
GO
ALTER DATABASE [FOCIMIRSDesarrollo] SET  MULTI_USER 
GO
ALTER DATABASE [FOCIMIRSDesarrollo] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FOCIMIRSDesarrollo] SET DB_CHAINING OFF 
GO
USE [FOCIMIRSDesarrollo]
/****** Object:  Table [dbo].[amb_cuestionario]    Script Date: 8/24/2015 9:25:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[amb_cuestionario](
	[cuestionario_id] [int] IDENTITY(1,1) NOT NULL,
	[cuestionario_nombre] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[cuestionario_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[amb_cuestionario_lleno]    Script Date: 8/24/2015 9:25:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[amb_cuestionario_lleno](
	[cuestionario_llenoid] [int] IDENTITY(1,1) NOT NULL,
	[fecha] [date] NULL,
	[Etapa] [int] NULL,
	[Cuestionario_id] [int] NULL,
	[COD_PERIODO] [varchar](4) NULL,
	[COD_PROVINCIA] [varchar](2) NULL,
	[COD_REGION] [varchar](2) NULL,
	[COD_MUNICIPIO] [varchar](4) NULL,
PRIMARY KEY CLUSTERED 
(
	[cuestionario_llenoid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[amb_cuestionario_usuario]    Script Date: 8/24/2015 9:25:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[amb_cuestionario_usuario](
	[cuestionario_usuarioid] [int] IDENTITY(1,1) NOT NULL,
	[cuestionario_id] [int] NULL,
	[usuario_id] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[cuestionario_usuarioid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[amb_municipios]    Script Date: 8/24/2015 9:25:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[amb_municipios](
	[COD_PERIODO] [varchar](4) NOT NULL,
	[COD_REGION] [varchar](2) NOT NULL,
	[COD_PROVINCIA] [varchar](2) NOT NULL,
	[COD_MUNICIPIO] [varchar](4) NOT NULL,
	[NOM_MUNICIPIO] [varchar](70) NULL,
	[vertedero] [varchar](50) NULL,
	[responsable] [varchar](50) NULL,
 CONSTRAINT [MUNI_PK] PRIMARY KEY CLUSTERED 
(
	[COD_PERIODO] ASC,
	[COD_REGION] ASC,
	[COD_PROVINCIA] ASC,
	[COD_MUNICIPIO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[amb_municipios_Cuestionario]    Script Date: 8/24/2015 9:25:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[amb_municipios_Cuestionario](
	[COD_PERIODO] [varchar](4) NOT NULL,
	[COD_REGION] [varchar](2) NOT NULL,
	[COD_PROVINCIA] [varchar](2) NOT NULL,
	[COD_MUNICIPIO] [varchar](4) NOT NULL,
	[Cuestionario_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[COD_PERIODO] ASC,
	[COD_REGION] ASC,
	[COD_PROVINCIA] ASC,
	[COD_MUNICIPIO] ASC,
	[Cuestionario_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[amb_opciones]    Script Date: 8/24/2015 9:25:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[amb_opciones](
	[opcion_id] [int] IDENTITY(1,1) NOT NULL,
	[opcion] [varchar](100) NULL,
	[tipo_opcionid] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[opcion_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[amb_opciones_preguntas]    Script Date: 8/24/2015 9:25:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[amb_opciones_preguntas](
	[preguntaid] [int] NULL,
	[opcionid] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[amb_permisos]    Script Date: 8/24/2015 9:25:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[amb_permisos](
	[permisosid] [int] IDENTITY(1,1) NOT NULL,
	[permiso_nombre] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[permisosid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[amb_permisos_roles]    Script Date: 8/24/2015 9:25:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[amb_permisos_roles](
	[permisos_id] [int] NULL,
	[rol_id] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[amb_pregunta_seccion]    Script Date: 8/24/2015 9:25:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[amb_pregunta_seccion](
	[seccionID] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[seccionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[amb_preguntas]    Script Date: 8/24/2015 9:25:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[amb_preguntas](
	[pregunta_id] [int] IDENTITY(1,1) NOT NULL,
	[pregunta] [varchar](400) NULL,
	[cuestionarioid] [int] NULL,
	[seccion_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[pregunta_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[amb_provincias]    Script Date: 8/24/2015 9:25:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[amb_provincias](
	[COD_PERIODO] [varchar](4) NOT NULL,
	[COD_REGION] [varchar](2) NOT NULL,
	[COD_PROVINCIA] [varchar](2) NOT NULL,
	[NOM_PROVINCIA] [varchar](70) NULL,
	[poblacion] [int] NULL,
	[Alcalde] [varchar](50) NULL,
	[encargado_ugam] [varchar](50) NULL,
	[director_provincial_de_MA] [varchar](50) NULL,
	[enc_de_ornato] [varchar](50) NULL,
	[AlcaldeTel] [varchar](15) NULL,
	[AlcaldeMail] [varchar](60) NULL,
	[UgamTel] [varchar](15) NULL,
	[UgamMail] [varchar](60) NULL,
	[Director_PTel] [varchar](15) NULL,
	[Director_PMail] [varchar](60) NULL,
	[OrnatoTel] [varchar](15) NULL,
	[OrnatoMail] [varchar](60) NULL,
 CONSTRAINT [PROV_PK] PRIMARY KEY CLUSTERED 
(
	[COD_PROVINCIA] ASC,
	[COD_REGION] ASC,
	[COD_PERIODO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[amb_regiones]    Script Date: 8/24/2015 9:25:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[amb_regiones](
	[COD_PERIODO] [varchar](4) NOT NULL,
	[COD_REGION] [varchar](2) NOT NULL,
	[NOM_REGION] [varchar](70) NULL,
 CONSTRAINT [REGI_PK] PRIMARY KEY CLUSTERED 
(
	[COD_PERIODO] ASC,
	[COD_REGION] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[amb_respuesta]    Script Date: 8/24/2015 9:25:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[amb_respuesta](
	[respuestaid] [int] IDENTITY(1,1) NOT NULL,
	[opcion_id] [int] NULL,
	[pregunta_id] [int] NULL,
	[cuestionario_lleno_id] [int] NULL,
	[respuesta] [nvarchar](100) NULL,
	[preguntaP_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[respuestaid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[amb_respuestas_temp]    Script Date: 8/24/2015 9:25:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[amb_respuestas_temp](
	[respuestaid] [int] IDENTITY(1,1) NOT NULL,
	[opcion_id] [int] NULL,
	[pregunta_id] [int] NULL,
	[cuestionario_lleno_id] [int] NULL,
	[respuesta] [nvarchar](100) NULL,
	[preguntaP_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[respuestaid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[amb_roles]    Script Date: 8/24/2015 9:25:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[amb_roles](
	[rolid] [int] IDENTITY(1,1) NOT NULL,
	[rol_nombre] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[rolid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[amb_subPreguntas]    Script Date: 8/24/2015 9:25:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[amb_subPreguntas](
	[subpreguntasid] [int] NULL,
	[pregunta_id] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[amb_tipo_opcion]    Script Date: 8/24/2015 9:25:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[amb_tipo_opcion](
	[tipoid] [int] IDENTITY(1,1) NOT NULL,
	[tipo_nombre] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[tipoid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[amb_usuarios]    Script Date: 8/24/2015 9:25:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[amb_usuarios](
	[usuario_id] [varchar](20) NOT NULL,
	[Pass] [varbinary](128) NOT NULL,
	[nombre] [varchar](50) NULL,
	[rol_id] [int] NULL,
	[COD_PERIODO] [varchar](4) NOT NULL,
	[COD_REGION] [varchar](2) NOT NULL,
	[COD_PROVINCIA] [varchar](2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[usuario_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[amb_vehiculos]    Script Date: 8/24/2015 9:25:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[amb_vehiculos](
	[ficha] [varchar](30) NOT NULL,
	[chasis] [varchar](20) NOT NULL,
	[color] [varchar](20) NULL,
	[densidad] [float] NULL,
	[COD_PERIODO] [varchar](4) NOT NULL,
	[COD_REGION] [varchar](2) NOT NULL,
	[COD_PROVINCIA] [varchar](2) NOT NULL,
	[Capacidad] [float] NULL,
	[COD_MUNICIPIO] [varchar](4) NOT NULL,
	[tipo_vehiculo] [varchar](80) NULL,
	[Tipo_residuos] [varchar](80) NULL,
 CONSTRAINT [PK__amb_vehi__E386D4B3440B1D61] PRIMARY KEY CLUSTERED 
(
	[ficha] ASC,
	[chasis] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[amb_viajes_mensuales]    Script Date: 8/24/2015 9:25:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[amb_viajes_mensuales](
	[viajesid] [int] IDENTITY(1,1) NOT NULL,
	[fecha1] [date] NULL,
	[viajes] [int] NULL,
	[fichaid] [varchar](30) NULL,
	[chasisid] [varchar](20) NULL,
	[fecha2] [date] NULL,
	[cantidad] [float] NULL,
 CONSTRAINT [PK__amb_viaj__E9E1439A48CFD27E] PRIMARY KEY CLUSTERED 
(
	[viajesid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[amb_vehiculos] ADD  CONSTRAINT [DF_Constraint]  DEFAULT ((1)) FOR [densidad]
GO
ALTER TABLE [dbo].[amb_cuestionario_lleno]  WITH CHECK ADD FOREIGN KEY([Cuestionario_id])
REFERENCES [dbo].[amb_cuestionario_usuario] ([cuestionario_usuarioid])
GO
ALTER TABLE [dbo].[amb_cuestionario_lleno]  WITH CHECK ADD  CONSTRAINT [fk_cuestionario_municipios] FOREIGN KEY([COD_PERIODO], [COD_REGION], [COD_PROVINCIA], [COD_MUNICIPIO])
REFERENCES [dbo].[amb_municipios] ([COD_PERIODO], [COD_REGION], [COD_PROVINCIA], [COD_MUNICIPIO])
GO
ALTER TABLE [dbo].[amb_cuestionario_lleno] CHECK CONSTRAINT [fk_cuestionario_municipios]
GO
ALTER TABLE [dbo].[amb_cuestionario_usuario]  WITH CHECK ADD FOREIGN KEY([cuestionario_id])
REFERENCES [dbo].[amb_cuestionario] ([cuestionario_id])
GO
ALTER TABLE [dbo].[amb_cuestionario_usuario]  WITH CHECK ADD FOREIGN KEY([usuario_id])
REFERENCES [dbo].[amb_usuarios] ([usuario_id])
GO
ALTER TABLE [dbo].[amb_municipios]  WITH CHECK ADD  CONSTRAINT [MUNI_PROV_FK] FOREIGN KEY([COD_PROVINCIA], [COD_REGION], [COD_PERIODO])
REFERENCES [dbo].[amb_provincias] ([COD_PROVINCIA], [COD_REGION], [COD_PERIODO])
GO
ALTER TABLE [dbo].[amb_municipios] CHECK CONSTRAINT [MUNI_PROV_FK]
GO
ALTER TABLE [dbo].[amb_municipios_Cuestionario]  WITH CHECK ADD  CONSTRAINT [FK_amb_municipios_Cuestionario_amb_cuestionario_lleno] FOREIGN KEY([Cuestionario_id])
REFERENCES [dbo].[amb_cuestionario_lleno] ([cuestionario_llenoid])
GO
ALTER TABLE [dbo].[amb_municipios_Cuestionario] CHECK CONSTRAINT [FK_amb_municipios_Cuestionario_amb_cuestionario_lleno]
GO
ALTER TABLE [dbo].[amb_municipios_Cuestionario]  WITH CHECK ADD  CONSTRAINT [FK_amb_municipios_Cuestionario_amb_municipios] FOREIGN KEY([COD_PERIODO], [COD_REGION], [COD_PROVINCIA], [COD_MUNICIPIO])
REFERENCES [dbo].[amb_municipios] ([COD_PERIODO], [COD_REGION], [COD_PROVINCIA], [COD_MUNICIPIO])
GO
ALTER TABLE [dbo].[amb_municipios_Cuestionario] CHECK CONSTRAINT [FK_amb_municipios_Cuestionario_amb_municipios]
GO
ALTER TABLE [dbo].[amb_opciones]  WITH CHECK ADD FOREIGN KEY([tipo_opcionid])
REFERENCES [dbo].[amb_tipo_opcion] ([tipoid])
GO
ALTER TABLE [dbo].[amb_opciones_preguntas]  WITH CHECK ADD FOREIGN KEY([opcionid])
REFERENCES [dbo].[amb_opciones] ([opcion_id])
GO
ALTER TABLE [dbo].[amb_opciones_preguntas]  WITH CHECK ADD FOREIGN KEY([preguntaid])
REFERENCES [dbo].[amb_preguntas] ([pregunta_id])
GO
ALTER TABLE [dbo].[amb_permisos_roles]  WITH CHECK ADD FOREIGN KEY([permisos_id])
REFERENCES [dbo].[amb_permisos] ([permisosid])
GO
ALTER TABLE [dbo].[amb_permisos_roles]  WITH CHECK ADD FOREIGN KEY([rol_id])
REFERENCES [dbo].[amb_roles] ([rolid])
GO
ALTER TABLE [dbo].[amb_preguntas]  WITH CHECK ADD FOREIGN KEY([cuestionarioid])
REFERENCES [dbo].[amb_cuestionario] ([cuestionario_id])
GO
ALTER TABLE [dbo].[amb_preguntas]  WITH CHECK ADD FOREIGN KEY([seccion_id])
REFERENCES [dbo].[amb_pregunta_seccion] ([seccionID])
GO
ALTER TABLE [dbo].[amb_provincias]  WITH CHECK ADD  CONSTRAINT [PROV_REGI_FK] FOREIGN KEY([COD_PERIODO], [COD_REGION])
REFERENCES [dbo].[amb_regiones] ([COD_PERIODO], [COD_REGION])
GO
ALTER TABLE [dbo].[amb_provincias] CHECK CONSTRAINT [PROV_REGI_FK]
GO
ALTER TABLE [dbo].[amb_respuesta]  WITH CHECK ADD FOREIGN KEY([cuestionario_lleno_id])
REFERENCES [dbo].[amb_cuestionario_lleno] ([cuestionario_llenoid])
GO
ALTER TABLE [dbo].[amb_respuesta]  WITH CHECK ADD FOREIGN KEY([opcion_id])
REFERENCES [dbo].[amb_opciones] ([opcion_id])
GO
ALTER TABLE [dbo].[amb_respuesta]  WITH CHECK ADD FOREIGN KEY([pregunta_id])
REFERENCES [dbo].[amb_preguntas] ([pregunta_id])
GO
ALTER TABLE [dbo].[amb_respuesta]  WITH CHECK ADD  CONSTRAINT [FK_amb_respuesta_amb_preguntas] FOREIGN KEY([preguntaP_id])
REFERENCES [dbo].[amb_preguntas] ([pregunta_id])
GO
ALTER TABLE [dbo].[amb_respuesta] CHECK CONSTRAINT [FK_amb_respuesta_amb_preguntas]
GO
ALTER TABLE [dbo].[amb_respuestas_temp]  WITH CHECK ADD FOREIGN KEY([cuestionario_lleno_id])
REFERENCES [dbo].[amb_cuestionario_lleno] ([cuestionario_llenoid])
GO
ALTER TABLE [dbo].[amb_respuestas_temp]  WITH CHECK ADD FOREIGN KEY([opcion_id])
REFERENCES [dbo].[amb_opciones] ([opcion_id])
GO
ALTER TABLE [dbo].[amb_respuestas_temp]  WITH CHECK ADD FOREIGN KEY([pregunta_id])
REFERENCES [dbo].[amb_preguntas] ([pregunta_id])
GO
ALTER TABLE [dbo].[amb_respuestas_temp]  WITH CHECK ADD  CONSTRAINT [FK_amb_respuesta_temp_amb_preguntas] FOREIGN KEY([preguntaP_id])
REFERENCES [dbo].[amb_preguntas] ([pregunta_id])
GO
ALTER TABLE [dbo].[amb_respuestas_temp] CHECK CONSTRAINT [FK_amb_respuesta_temp_amb_preguntas]
GO
ALTER TABLE [dbo].[amb_subPreguntas]  WITH CHECK ADD FOREIGN KEY([pregunta_id])
REFERENCES [dbo].[amb_preguntas] ([pregunta_id])
GO
ALTER TABLE [dbo].[amb_subPreguntas]  WITH CHECK ADD FOREIGN KEY([subpreguntasid])
REFERENCES [dbo].[amb_preguntas] ([pregunta_id])
GO
ALTER TABLE [dbo].[amb_usuarios]  WITH CHECK ADD FOREIGN KEY([rol_id])
REFERENCES [dbo].[amb_roles] ([rolid])
GO
ALTER TABLE [dbo].[amb_usuarios]  WITH CHECK ADD  CONSTRAINT [USUARIO_PROV_FK] FOREIGN KEY([COD_PROVINCIA], [COD_REGION], [COD_PERIODO])
REFERENCES [dbo].[amb_provincias] ([COD_PROVINCIA], [COD_REGION], [COD_PERIODO])
GO
ALTER TABLE [dbo].[amb_usuarios] CHECK CONSTRAINT [USUARIO_PROV_FK]
GO
ALTER TABLE [dbo].[amb_viajes_mensuales]  WITH CHECK ADD  CONSTRAINT [FK__amb_viajes_mensu__4AB81AF0] FOREIGN KEY([fichaid], [chasisid])
REFERENCES [dbo].[amb_vehiculos] ([ficha], [chasis])
GO
ALTER TABLE [dbo].[amb_viajes_mensuales] CHECK CONSTRAINT [FK__amb_viajes_mensu__4AB81AF0]
GO
USE [master]
GO
ALTER DATABASE [FOCIMIRSDesarrollo] SET  READ_WRITE 
GO
