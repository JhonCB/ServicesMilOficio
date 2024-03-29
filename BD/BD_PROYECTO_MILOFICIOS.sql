USE [master]
GO
/****** Object:  Database [bdmiloficios]    Script Date: 07/11/2019 2:55:18 ******/
CREATE DATABASE [bdmiloficios]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'bdmiloficios_Data', FILENAME = N'c:\dzsqls\bdmiloficios.mdf' , SIZE = 3264KB , MAXSIZE = 15360KB , FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'bdmiloficios_Logs', FILENAME = N'c:\dzsqls\bdmiloficios.ldf' , SIZE = 1024KB , MAXSIZE = 20480KB , FILEGROWTH = 10%)
GO
ALTER DATABASE [bdmiloficios] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [bdmiloficios].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [bdmiloficios] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [bdmiloficios] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [bdmiloficios] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [bdmiloficios] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [bdmiloficios] SET ARITHABORT OFF 
GO
ALTER DATABASE [bdmiloficios] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [bdmiloficios] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [bdmiloficios] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [bdmiloficios] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [bdmiloficios] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [bdmiloficios] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [bdmiloficios] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [bdmiloficios] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [bdmiloficios] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [bdmiloficios] SET  ENABLE_BROKER 
GO
ALTER DATABASE [bdmiloficios] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [bdmiloficios] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [bdmiloficios] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [bdmiloficios] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [bdmiloficios] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [bdmiloficios] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [bdmiloficios] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [bdmiloficios] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [bdmiloficios] SET  MULTI_USER 
GO
ALTER DATABASE [bdmiloficios] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [bdmiloficios] SET DB_CHAINING OFF 
GO
ALTER DATABASE [bdmiloficios] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [bdmiloficios] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [bdmiloficios] SET DELAYED_DURABILITY = DISABLED 
GO
USE [bdmiloficios]
GO
/****** Object:  User [JhonCB_SQLLogin_1]    Script Date: 07/11/2019 2:55:20 ******/
CREATE USER [JhonCB_SQLLogin_1] FOR LOGIN [JhonCB_SQLLogin_1] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [JhonCB_SQLLogin_1]
GO
/****** Object:  Schema [JhonCB_SQLLogin_1]    Script Date: 07/11/2019 2:55:21 ******/
CREATE SCHEMA [JhonCB_SQLLogin_1]
GO
/****** Object:  Table [dbo].[categoria]    Script Date: 07/11/2019 2:55:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[categoria](
	[id_categoria] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](50) NULL,
	[activo] [bit] NULL,
	[eliminado] [bit] NULL,
 CONSTRAINT [PK_categoria] PRIMARY KEY CLUSTERED 
(
	[id_categoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[estado_servicio]    Script Date: 07/11/2019 2:55:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[estado_servicio](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](50) NULL,
 CONSTRAINT [PK_estado_servicio] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[facturacion]    Script Date: 07/11/2019 2:55:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[facturacion](
	[id_factura] [int] IDENTITY(1,1) NOT NULL,
	[fecha] [datetime] NULL,
	[NroFactura] [varchar](50) NULL,
	[Precio] [smallmoney] NULL,
	[idservicio] [int] NULL,
 CONSTRAINT [PK_facturacion] PRIMARY KEY CLUSTERED 
(
	[id_factura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Localizacion]    Script Date: 07/11/2019 2:55:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Localizacion](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Ubicacion] [varchar](max) NULL,
	[Latitud] [varchar](500) NULL,
	[Longitud] [varchar](500) NULL,
 CONSTRAINT [PK_Localizacion] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[modulo]    Script Date: 07/11/2019 2:55:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[modulo](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NULL,
 CONSTRAINT [PK_modulo] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[operaciones]    Script Date: 07/11/2019 2:55:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[operaciones](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NULL,
	[idModulo] [int] NULL,
 CONSTRAINT [PK_operaciones] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[rol]    Script Date: 07/11/2019 2:55:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[rol](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NULL,
 CONSTRAINT [PK_rol] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[rol_operacion]    Script Date: 07/11/2019 2:55:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rol_operacion](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idRol] [int] NULL,
	[idOperacion] [int] NULL,
 CONSTRAINT [PK_perfil_operacion] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Servicios]    Script Date: 07/11/2019 2:55:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Servicios](
	[id_servicio] [int] IDENTITY(1,1) NOT NULL,
	[idUsuario] [int] NULL,
	[descripcion] [varchar](200) NULL,
	[calificacion] [int] NULL,
	[fecha_inicio] [datetime] NULL,
	[fecha_fin] [datetime] NULL,
	[id_categoria] [int] NULL,
	[idLocalizacion] [int] NULL,
	[latitud] [varchar](50) NULL,
	[longitud] [varchar](50) NULL,
	[estado] [int] NULL,
 CONSTRAINT [PK_Servicios] PRIMARY KEY CLUSTERED 
(
	[id_servicio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Solicitud]    Script Date: 07/11/2019 2:55:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Solicitud](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_servicio] [int] NULL,
	[costo] [smallmoney] NULL,
	[cotizacion] [smallmoney] NULL,
	[Estado] [bit] NULL,
	[id_usuario] [int] NULL,
 CONSTRAINT [PK_Solicitud] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[usuario]    Script Date: 07/11/2019 2:55:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[usuario](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NULL,
	[email] [varchar](50) NULL,
	[password] [varchar](200) NULL,
	[activo] [bit] NULL,
	[eliminado] [bit] NULL,
	[fecha] [datetime] NULL,
	[idRol] [int] NULL,
	[idLocalizacion] [int] NULL,
	[telefono] [varchar](10) NULL,
	[urlFoto] [varchar](max) NULL,
 CONSTRAINT [PK_usuario] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[categoria] ON 

GO
INSERT [dbo].[categoria] ([id_categoria], [descripcion], [activo], [eliminado]) VALUES (1, N'Mudanzas', 1, 0)
GO
INSERT [dbo].[categoria] ([id_categoria], [descripcion], [activo], [eliminado]) VALUES (2, N'Tecnicos', 1, 0)
GO
INSERT [dbo].[categoria] ([id_categoria], [descripcion], [activo], [eliminado]) VALUES (3, N'Jardinero', 1, 0)
GO
INSERT [dbo].[categoria] ([id_categoria], [descripcion], [activo], [eliminado]) VALUES (4, N'Arquitecto', 1, 0)
GO
INSERT [dbo].[categoria] ([id_categoria], [descripcion], [activo], [eliminado]) VALUES (5, N'Seguridad', 1, 0)
GO
INSERT [dbo].[categoria] ([id_categoria], [descripcion], [activo], [eliminado]) VALUES (6, N'Gas', 1, 0)
GO
INSERT [dbo].[categoria] ([id_categoria], [descripcion], [activo], [eliminado]) VALUES (7, N'Carpintero', 1, 0)
GO
SET IDENTITY_INSERT [dbo].[categoria] OFF
GO
SET IDENTITY_INSERT [dbo].[estado_servicio] ON 

GO
INSERT [dbo].[estado_servicio] ([id], [descripcion]) VALUES (1, N'Activo')
GO
INSERT [dbo].[estado_servicio] ([id], [descripcion]) VALUES (2, N'Inactivo')
GO
SET IDENTITY_INSERT [dbo].[estado_servicio] OFF
GO
SET IDENTITY_INSERT [dbo].[facturacion] ON 

GO
INSERT [dbo].[facturacion] ([id_factura], [fecha], [NroFactura], [Precio], [idservicio]) VALUES (1, CAST(N'2017-01-01 22:00:00.000' AS DateTime), N'A00001', 250.0000, 1)
GO
SET IDENTITY_INSERT [dbo].[facturacion] OFF
GO
SET IDENTITY_INSERT [dbo].[Localizacion] ON 

GO
INSERT [dbo].[Localizacion] ([ID], [Ubicacion], [Latitud], [Longitud]) VALUES (1, N'Lima', N'-12.046490', N'-77.032130')
GO
INSERT [dbo].[Localizacion] ([ID], [Ubicacion], [Latitud], [Longitud]) VALUES (2, N'Trujillo', N'-8.107150', N'-79.027470')
GO
INSERT [dbo].[Localizacion] ([ID], [Ubicacion], [Latitud], [Longitud]) VALUES (3, N'Huaraz', N'-9.526110', N'-77.528750')
GO
INSERT [dbo].[Localizacion] ([ID], [Ubicacion], [Latitud], [Longitud]) VALUES (4, N'Huarmey', N'-10.067352', N'-78.152757')
GO
SET IDENTITY_INSERT [dbo].[Localizacion] OFF
GO
SET IDENTITY_INSERT [dbo].[modulo] ON 

GO
INSERT [dbo].[modulo] ([id], [nombre]) VALUES (1, N'Usuarios')
GO
INSERT [dbo].[modulo] ([id], [nombre]) VALUES (2, N'Roles')
GO
INSERT [dbo].[modulo] ([id], [nombre]) VALUES (3, N'Servicios')
GO
INSERT [dbo].[modulo] ([id], [nombre]) VALUES (4, N'Orden de Servicio')
GO
INSERT [dbo].[modulo] ([id], [nombre]) VALUES (5, N'Configuracion')
GO
INSERT [dbo].[modulo] ([id], [nombre]) VALUES (6, N'Categoria')
GO
INSERT [dbo].[modulo] ([id], [nombre]) VALUES (7, N'Solicitud')
GO
SET IDENTITY_INSERT [dbo].[modulo] OFF
GO
SET IDENTITY_INSERT [dbo].[operaciones] ON 

GO
INSERT [dbo].[operaciones] ([id], [nombre], [idModulo]) VALUES (1, N'Agregar', 1)
GO
INSERT [dbo].[operaciones] ([id], [nombre], [idModulo]) VALUES (2, N'Editar', 1)
GO
INSERT [dbo].[operaciones] ([id], [nombre], [idModulo]) VALUES (3, N'Eliminar', 1)
GO
INSERT [dbo].[operaciones] ([id], [nombre], [idModulo]) VALUES (4, N'Ver', 1)
GO
INSERT [dbo].[operaciones] ([id], [nombre], [idModulo]) VALUES (5, N'Agregar', 2)
GO
INSERT [dbo].[operaciones] ([id], [nombre], [idModulo]) VALUES (6, N'Editar', 2)
GO
INSERT [dbo].[operaciones] ([id], [nombre], [idModulo]) VALUES (7, N'Eliminar', 2)
GO
INSERT [dbo].[operaciones] ([id], [nombre], [idModulo]) VALUES (8, N'Ver', 2)
GO
INSERT [dbo].[operaciones] ([id], [nombre], [idModulo]) VALUES (9, N'Agregar', 3)
GO
INSERT [dbo].[operaciones] ([id], [nombre], [idModulo]) VALUES (10, N'Editar', 3)
GO
INSERT [dbo].[operaciones] ([id], [nombre], [idModulo]) VALUES (11, N'Ver', 3)
GO
INSERT [dbo].[operaciones] ([id], [nombre], [idModulo]) VALUES (12, N'Generar', 4)
GO
INSERT [dbo].[operaciones] ([id], [nombre], [idModulo]) VALUES (13, N'Editar Configuracion', 5)
GO
SET IDENTITY_INSERT [dbo].[operaciones] OFF
GO
SET IDENTITY_INSERT [dbo].[rol] ON 

GO
INSERT [dbo].[rol] ([id], [nombre]) VALUES (1, N'Administrador')
GO
INSERT [dbo].[rol] ([id], [nombre]) VALUES (2, N'Socio')
GO
INSERT [dbo].[rol] ([id], [nombre]) VALUES (3, N'Cliente')
GO
SET IDENTITY_INSERT [dbo].[rol] OFF
GO
SET IDENTITY_INSERT [dbo].[rol_operacion] ON 

GO
INSERT [dbo].[rol_operacion] ([id], [idRol], [idOperacion]) VALUES (1, 1, 1)
GO
INSERT [dbo].[rol_operacion] ([id], [idRol], [idOperacion]) VALUES (2, 1, 2)
GO
INSERT [dbo].[rol_operacion] ([id], [idRol], [idOperacion]) VALUES (3, 1, 3)
GO
INSERT [dbo].[rol_operacion] ([id], [idRol], [idOperacion]) VALUES (4, 1, 4)
GO
INSERT [dbo].[rol_operacion] ([id], [idRol], [idOperacion]) VALUES (5, 2, 5)
GO
INSERT [dbo].[rol_operacion] ([id], [idRol], [idOperacion]) VALUES (6, 2, 6)
GO
INSERT [dbo].[rol_operacion] ([id], [idRol], [idOperacion]) VALUES (7, 2, 7)
GO
INSERT [dbo].[rol_operacion] ([id], [idRol], [idOperacion]) VALUES (8, 2, 8)
GO
INSERT [dbo].[rol_operacion] ([id], [idRol], [idOperacion]) VALUES (9, 3, 9)
GO
INSERT [dbo].[rol_operacion] ([id], [idRol], [idOperacion]) VALUES (10, 3, 10)
GO
INSERT [dbo].[rol_operacion] ([id], [idRol], [idOperacion]) VALUES (11, 3, 11)
GO
SET IDENTITY_INSERT [dbo].[rol_operacion] OFF
GO
SET IDENTITY_INSERT [dbo].[Servicios] ON 

GO
INSERT [dbo].[Servicios] ([id_servicio], [idUsuario], [descripcion], [calificacion], [fecha_inicio], [fecha_fin], [id_categoria], [idLocalizacion], [latitud], [longitud], [estado]) VALUES (1, 1, N'aaaaaaa', 8, CAST(N'2019-11-05 00:00:00.000' AS DateTime), CAST(N'2018-06-06 00:00:00.000' AS DateTime), 7, 1, N'-12.01359', N'-77.00', 1)
GO
INSERT [dbo].[Servicios] ([id_servicio], [idUsuario], [descripcion], [calificacion], [fecha_inicio], [fecha_fin], [id_categoria], [idLocalizacion], [latitud], [longitud], [estado]) VALUES (3, 2, N'Hola', 0, CAST(N'2019-11-07 00:00:00.000' AS DateTime), CAST(N'2019-11-21 00:00:00.000' AS DateTime), 1, 1, N'-12.042141', N'-77.061129', 1)
GO
INSERT [dbo].[Servicios] ([id_servicio], [idUsuario], [descripcion], [calificacion], [fecha_inicio], [fecha_fin], [id_categoria], [idLocalizacion], [latitud], [longitud], [estado]) VALUES (4, 2, N'Testing', 7, CAST(N'2019-11-01 00:00:00.000' AS DateTime), CAST(N'2019-11-30 00:00:00.000' AS DateTime), 6, 1, N'-12.092141', N'-77.069129', 1)
GO
INSERT [dbo].[Servicios] ([id_servicio], [idUsuario], [descripcion], [calificacion], [fecha_inicio], [fecha_fin], [id_categoria], [idLocalizacion], [latitud], [longitud], [estado]) VALUES (5, 1, N'Testing2', 0, CAST(N'2019-11-27 19:32:22.000' AS DateTime), CAST(N'2019-11-30 00:00:00.000' AS DateTime), 1, 2, N'-8.094580', N'-79.035265', 1)
GO
INSERT [dbo].[Servicios] ([id_servicio], [idUsuario], [descripcion], [calificacion], [fecha_inicio], [fecha_fin], [id_categoria], [idLocalizacion], [latitud], [longitud], [estado]) VALUES (6, 1, N'Testing2', 0, CAST(N'2019-10-27 19:32:22.000' AS DateTime), CAST(N'2019-11-30 00:00:00.000' AS DateTime), 1, 2, N'-8.103797', N'-79.014767', 1)
GO
INSERT [dbo].[Servicios] ([id_servicio], [idUsuario], [descripcion], [calificacion], [fecha_inicio], [fecha_fin], [id_categoria], [idLocalizacion], [latitud], [longitud], [estado]) VALUES (7, 1, N'Testing2', 0, CAST(N'2019-10-27 19:32:51.000' AS DateTime), CAST(N'2019-11-30 00:00:00.000' AS DateTime), 1, 2, N'-8.083797', N'-79.024767', 1)
GO
INSERT [dbo].[Servicios] ([id_servicio], [idUsuario], [descripcion], [calificacion], [fecha_inicio], [fecha_fin], [id_categoria], [idLocalizacion], [latitud], [longitud], [estado]) VALUES (8, 1, N'Testing2', 0, CAST(N'2019-10-27 19:32:51.000' AS DateTime), CAST(N'2019-11-30 00:00:00.000' AS DateTime), 1, 2, N'-8.083797', N'-79.022767', 1)
GO
INSERT [dbo].[Servicios] ([id_servicio], [idUsuario], [descripcion], [calificacion], [fecha_inicio], [fecha_fin], [id_categoria], [idLocalizacion], [latitud], [longitud], [estado]) VALUES (9, 1, N'asdasdas', 3, CAST(N'2019-10-28 00:00:00.000' AS DateTime), CAST(N'2019-11-30 00:00:00.000' AS DateTime), 1, 1, N'-12.0032141', N'-77.091129', 2)
GO
INSERT [dbo].[Servicios] ([id_servicio], [idUsuario], [descripcion], [calificacion], [fecha_inicio], [fecha_fin], [id_categoria], [idLocalizacion], [latitud], [longitud], [estado]) VALUES (10, 1, N'Testing2', 0, CAST(N'2019-10-27 19:34:45.000' AS DateTime), CAST(N'2019-11-30 00:00:00.000' AS DateTime), 1, 2, N'-8.053797', N'-79.052767', 1)
GO
INSERT [dbo].[Servicios] ([id_servicio], [idUsuario], [descripcion], [calificacion], [fecha_inicio], [fecha_fin], [id_categoria], [idLocalizacion], [latitud], [longitud], [estado]) VALUES (11, 1, N'Testing3', 0, CAST(N'2019-10-27 19:35:00.000' AS DateTime), CAST(N'2019-11-30 00:00:00.000' AS DateTime), 1, 1, N'-12.032141', N'-77.061129', 1)
GO
INSERT [dbo].[Servicios] ([id_servicio], [idUsuario], [descripcion], [calificacion], [fecha_inicio], [fecha_fin], [id_categoria], [idLocalizacion], [latitud], [longitud], [estado]) VALUES (12, 1, N'Testing3', 5, CAST(N'2019-10-27 19:35:00.000' AS DateTime), CAST(N'2019-11-30 00:00:00.000' AS DateTime), 1, 1, N'-12.0402141', N'-77.062129', 1)
GO
INSERT [dbo].[Servicios] ([id_servicio], [idUsuario], [descripcion], [calificacion], [fecha_inicio], [fecha_fin], [id_categoria], [idLocalizacion], [latitud], [longitud], [estado]) VALUES (13, 2, N'Testing4', 0, CAST(N'2019-10-27 00:00:00.000' AS DateTime), CAST(N'2019-10-28 00:00:00.000' AS DateTime), 1, 1, N'-12.052141', N'-77.141129', 1)
GO
INSERT [dbo].[Servicios] ([id_servicio], [idUsuario], [descripcion], [calificacion], [fecha_inicio], [fecha_fin], [id_categoria], [idLocalizacion], [latitud], [longitud], [estado]) VALUES (14, 2, N'Testing5', 6, CAST(N'2019-10-27 19:38:37.000' AS DateTime), CAST(N'2019-10-20 00:00:00.000' AS DateTime), 1, 1, N'-12.082141', N'-77.06561', 1)
GO
INSERT [dbo].[Servicios] ([id_servicio], [idUsuario], [descripcion], [calificacion], [fecha_inicio], [fecha_fin], [id_categoria], [idLocalizacion], [latitud], [longitud], [estado]) VALUES (15, 2, N'Testing5', 4, CAST(N'2019-10-27 19:38:37.000' AS DateTime), CAST(N'2019-10-20 00:00:00.000' AS DateTime), 1, 1, N'-12.002141', N'-77.641129', 1)
GO
INSERT [dbo].[Servicios] ([id_servicio], [idUsuario], [descripcion], [calificacion], [fecha_inicio], [fecha_fin], [id_categoria], [idLocalizacion], [latitud], [longitud], [estado]) VALUES (16, 2, N'Testing6', 1, CAST(N'2019-10-27 19:41:51.000' AS DateTime), CAST(N'2019-11-25 00:00:00.000' AS DateTime), 1, 1, N'-12.002141', N'-77.341129', 1)
GO
INSERT [dbo].[Servicios] ([id_servicio], [idUsuario], [descripcion], [calificacion], [fecha_inicio], [fecha_fin], [id_categoria], [idLocalizacion], [latitud], [longitud], [estado]) VALUES (17, 2, N'Testing6', 0, CAST(N'2019-10-27 19:41:51.000' AS DateTime), CAST(N'2019-11-25 00:00:00.000' AS DateTime), 1, 1, N'-12.002141', N'-77.051129', 1)
GO
INSERT [dbo].[Servicios] ([id_servicio], [idUsuario], [descripcion], [calificacion], [fecha_inicio], [fecha_fin], [id_categoria], [idLocalizacion], [latitud], [longitud], [estado]) VALUES (18, 2, N'Testing7', 4, CAST(N'2019-10-27 19:42:28.000' AS DateTime), CAST(N'2019-11-25 00:00:00.000' AS DateTime), 1, 1, N'-12.002141', N'-77.071129', 1)
GO
INSERT [dbo].[Servicios] ([id_servicio], [idUsuario], [descripcion], [calificacion], [fecha_inicio], [fecha_fin], [id_categoria], [idLocalizacion], [latitud], [longitud], [estado]) VALUES (19, 2, N'Testing7', 10, CAST(N'2019-10-27 19:42:28.000' AS DateTime), CAST(N'2019-11-25 00:00:00.000' AS DateTime), 1, 1, N'-12.002141', N'-77.061129', 1)
GO
INSERT [dbo].[Servicios] ([id_servicio], [idUsuario], [descripcion], [calificacion], [fecha_inicio], [fecha_fin], [id_categoria], [idLocalizacion], [latitud], [longitud], [estado]) VALUES (20, 2, N'Testing8', 0, CAST(N'2019-10-27 19:44:55.000' AS DateTime), CAST(N'2019-10-28 00:00:00.000' AS DateTime), 2, 1, N'-12.002141', N'-77.091129', 1)
GO
INSERT [dbo].[Servicios] ([id_servicio], [idUsuario], [descripcion], [calificacion], [fecha_inicio], [fecha_fin], [id_categoria], [idLocalizacion], [latitud], [longitud], [estado]) VALUES (21, 2, N'Testing8', 0, CAST(N'2019-10-27 19:44:55.000' AS DateTime), CAST(N'2019-10-28 00:00:00.000' AS DateTime), 2, 1, N'-12.002141', N'-77.051129', 1)
GO
INSERT [dbo].[Servicios] ([id_servicio], [idUsuario], [descripcion], [calificacion], [fecha_inicio], [fecha_fin], [id_categoria], [idLocalizacion], [latitud], [longitud], [estado]) VALUES (22, 21, N'Reparación de muebles', 10, CAST(N'2019-11-03 20:05:00.000' AS DateTime), CAST(N'2019-11-25 00:00:00.000' AS DateTime), 7, 1, N'-12.002141', N'-77.021129', 1)
GO
INSERT [dbo].[Servicios] ([id_servicio], [idUsuario], [descripcion], [calificacion], [fecha_inicio], [fecha_fin], [id_categoria], [idLocalizacion], [latitud], [longitud], [estado]) VALUES (23, 2, N'Reparacion de noseque', 0, CAST(N'2019-11-03 21:55:00.000' AS DateTime), CAST(N'2019-12-03 00:00:00.000' AS DateTime), 7, 1, N'-12.002141', N'-77.041129', 1)
GO
INSERT [dbo].[Servicios] ([id_servicio], [idUsuario], [descripcion], [calificacion], [fecha_inicio], [fecha_fin], [id_categoria], [idLocalizacion], [latitud], [longitud], [estado]) VALUES (24, 1, N'xdxdxdxd', 8, CAST(N'2019-08-05 00:00:00.000' AS DateTime), CAST(N'2018-06-06 00:00:00.000' AS DateTime), 7, 1, N'-12.032082', N'-77.095693', 1)
GO
INSERT [dbo].[Servicios] ([id_servicio], [idUsuario], [descripcion], [calificacion], [fecha_inicio], [fecha_fin], [id_categoria], [idLocalizacion], [latitud], [longitud], [estado]) VALUES (25, 18, N'Reparacion de computadoras', 8, CAST(N'2019-08-05 00:00:00.000' AS DateTime), CAST(N'2018-06-06 00:00:00.000' AS DateTime), 7, 1, N'-12.032082', N'-77.095693', 1)
GO
INSERT [dbo].[Servicios] ([id_servicio], [idUsuario], [descripcion], [calificacion], [fecha_inicio], [fecha_fin], [id_categoria], [idLocalizacion], [latitud], [longitud], [estado]) VALUES (26, 18, N'Reparacion de computadoras', 8, CAST(N'2019-11-06 20:34:00.000' AS DateTime), CAST(N'2020-06-06 00:00:00.000' AS DateTime), 7, 1, N'-12.032082', N'-77.095693', 1)
GO
INSERT [dbo].[Servicios] ([id_servicio], [idUsuario], [descripcion], [calificacion], [fecha_inicio], [fecha_fin], [id_categoria], [idLocalizacion], [latitud], [longitud], [estado]) VALUES (27, 18, N'Testing11', 0, CAST(N'2019-11-06 22:53:00.000' AS DateTime), CAST(N'2019-06-12 00:00:00.000' AS DateTime), 1, 1, N'-12.04005', N'-77.021129', 1)
GO
INSERT [dbo].[Servicios] ([id_servicio], [idUsuario], [descripcion], [calificacion], [fecha_inicio], [fecha_fin], [id_categoria], [idLocalizacion], [latitud], [longitud], [estado]) VALUES (28, 18, N'xdaa', 4, CAST(N'2019-11-06 23:13:41.000' AS DateTime), CAST(N'2019-06-11 23:13:41.000' AS DateTime), 1, 1, N'-12.0555', N'-77.021129', 1)
GO
INSERT [dbo].[Servicios] ([id_servicio], [idUsuario], [descripcion], [calificacion], [fecha_inicio], [fecha_fin], [id_categoria], [idLocalizacion], [latitud], [longitud], [estado]) VALUES (29, 18, N'xdaa', 3, CAST(N'2019-11-06 23:13:41.000' AS DateTime), CAST(N'2019-06-11 23:13:41.000' AS DateTime), 1, 1, N'-12.0455', N'-77.021129', 1)
GO
INSERT [dbo].[Servicios] ([id_servicio], [idUsuario], [descripcion], [calificacion], [fecha_inicio], [fecha_fin], [id_categoria], [idLocalizacion], [latitud], [longitud], [estado]) VALUES (30, 18, N'Reparaciones generales', 0, CAST(N'2019-11-06 23:17:43.000' AS DateTime), CAST(N'2019-06-11 23:17:43.000' AS DateTime), 1, 1, N'-12.066', N'-77.055', 1)
GO
INSERT [dbo].[Servicios] ([id_servicio], [idUsuario], [descripcion], [calificacion], [fecha_inicio], [fecha_fin], [id_categoria], [idLocalizacion], [latitud], [longitud], [estado]) VALUES (31, 18, N'Testing11', 0, CAST(N'2019-11-06 22:53:00.000' AS DateTime), CAST(N'2019-06-12 00:00:00.000' AS DateTime), 1, 1, N'-12.05005', N'-77.04440', 1)
GO
INSERT [dbo].[Servicios] ([id_servicio], [idUsuario], [descripcion], [calificacion], [fecha_inicio], [fecha_fin], [id_categoria], [idLocalizacion], [latitud], [longitud], [estado]) VALUES (32, 19, N'Hola soy un servicio', 2, CAST(N'2019-11-06 23:46:00.000' AS DateTime), CAST(N'2019-06-12 23:46:00.000' AS DateTime), 1, 1, N'-12.076', N'-77.099', 1)
GO
INSERT [dbo].[Servicios] ([id_servicio], [idUsuario], [descripcion], [calificacion], [fecha_inicio], [fecha_fin], [id_categoria], [idLocalizacion], [latitud], [longitud], [estado]) VALUES (33, 5, N'Desarrollo móvil', 10, CAST(N'2019-11-07 02:48:00.000' AS DateTime), CAST(N'2025-11-06 02:48:00.000' AS DateTime), 2, 1, N'-12.05005', N'-77.04440', 1)
GO
SET IDENTITY_INSERT [dbo].[Servicios] OFF
GO
SET IDENTITY_INSERT [dbo].[usuario] ON 

GO
INSERT [dbo].[usuario] ([id], [nombre], [email], [password], [activo], [eliminado], [fecha], [idRol], [idLocalizacion], [telefono], [urlFoto]) VALUES (1, N'roberto', N'acuario6432@outlook', N'micontra', 0, 0, CAST(N'2019-01-01 00:00:00.000' AS DateTime), 3, 1, N'949568229', N'https://adadi.org/wp-content/uploads/2019/03/FOTO-CARNET-MIGUEL-RUZ-150x150.jpg')
GO
INSERT [dbo].[usuario] ([id], [nombre], [email], [password], [activo], [eliminado], [fecha], [idRol], [idLocalizacion], [telefono], [urlFoto]) VALUES (2, N'ricardo', N'acuario6432@outlook.', N'Ev5tzx8e', 1, 1, CAST(N'2012-02-10 00:00:00.000' AS DateTime), 1, 1, N'949568264', N'data:image/jpeg;base64,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')
GO
INSERT [dbo].[usuario] ([id], [nombre], [email], [password], [activo], [eliminado], [fecha], [idRol], [idLocalizacion], [telefono], [urlFoto]) VALUES (3, N'guillermo', N'guillermo@gmail.com', N'1234', 1, 0, CAST(N'2018-05-04 00:00:00.000' AS DateTime), 3, 1, N'949568221', N'http://kelvinfong.net/wp-content/uploads/2016/01/Yong-Kok-Wong-300x300.jpg')
GO
INSERT [dbo].[usuario] ([id], [nombre], [email], [password], [activo], [eliminado], [fecha], [idRol], [idLocalizacion], [telefono], [urlFoto]) VALUES (4, N'jhon', N'jhon@cibertec.com', N'12345', 1, 0, CAST(N'2015-02-01 00:00:00.000' AS DateTime), 2, 2, N'949568292', N'https://media.licdn.com/dms/image/C4E03AQHhcPMr6w3EHQ/profile-displayphoto-shrink_200_200/0?e=1578528000&v=beta&t=UjGLZlqQY-bLag9qD8bnxbRukpITPIQ0iUffDnAza2A')
GO
INSERT [dbo].[usuario] ([id], [nombre], [email], [password], [activo], [eliminado], [fecha], [idRol], [idLocalizacion], [telefono], [urlFoto]) VALUES (5, N'Jhon Coronel', N'ghoozh@gmail.com', N'123', 1, 0, CAST(N'2019-10-17 00:00:00.000' AS DateTime), 2, 1, N'949568234', N'https://media.licdn.com/dms/image/C4E03AQHhcPMr6w3EHQ/profile-displayphoto-shrink_200_200/0?e=1578528000&v=beta&t=UjGLZlqQY-bLag9qD8bnxbRukpITPIQ0iUffDnAza2A')
GO
INSERT [dbo].[usuario] ([id], [nombre], [email], [password], [activo], [eliminado], [fecha], [idRol], [idLocalizacion], [telefono], [urlFoto]) VALUES (6, N'Steven', N'Steven@gmal.com', N'123456', 1, 0, CAST(N'2019-10-17 00:00:00.000' AS DateTime), 2, 2, N'949568214', N'https://media.licdn.com/dms/image/C4E03AQElIzVxr7qMxw/profile-displayphoto-shrink_200_200/0?e=1578528000&v=beta&t=NCzPKogBBBZoKVTRXD6aq4l9gHC9fAPPjxpdq1t3J9U')
GO
INSERT [dbo].[usuario] ([id], [nombre], [email], [password], [activo], [eliminado], [fecha], [idRol], [idLocalizacion], [telefono], [urlFoto]) VALUES (7, N'Edwin', N'coronel@gmail.com', N'123', 1, 0, CAST(N'2019-10-17 00:00:00.000' AS DateTime), 2, 2, N'949568294', N'http://www.ysu.am/images/FZsoGQYv2CY49BAZRT8IfKzAtb.jpg')
GO
INSERT [dbo].[usuario] ([id], [nombre], [email], [password], [activo], [eliminado], [fecha], [idRol], [idLocalizacion], [telefono], [urlFoto]) VALUES (8, N'Edwin', N'coronel2@gmail.com', N'123', 1, 0, CAST(N'2019-10-17 00:00:00.000' AS DateTime), 2, 2, N'949568233', N'https://pbs.twimg.com/profile_images/1119628698972504064/yAVLjaN-_400x400.jpg')
GO
INSERT [dbo].[usuario] ([id], [nombre], [email], [password], [activo], [eliminado], [fecha], [idRol], [idLocalizacion], [telefono], [urlFoto]) VALUES (9, N'Edwin', N'coronel3@gmail.com', N'123', 1, 0, CAST(N'2019-10-17 00:00:00.000' AS DateTime), 2, 2, N'949568211', N'https://www.wt-park.com/2017/contents/presentator/t54_nakajima_kensuke.jpg')
GO
INSERT [dbo].[usuario] ([id], [nombre], [email], [password], [activo], [eliminado], [fecha], [idRol], [idLocalizacion], [telefono], [urlFoto]) VALUES (10, N'Edwin', N'coronel4@gmail.com', N'123', 1, 0, CAST(N'2019-10-17 00:00:00.000' AS DateTime), 2, 2, N'949568294', N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRJBMzGpbRAwyyYZjLJdLei7kwSTVHQxcyy1lIkBEXQFqLuCEg3&s')
GO
INSERT [dbo].[usuario] ([id], [nombre], [email], [password], [activo], [eliminado], [fecha], [idRol], [idLocalizacion], [telefono], [urlFoto]) VALUES (11, N'Edwin', N'coronel5@gmail.com', N'123', 1, 0, CAST(N'2019-10-17 00:00:00.000' AS DateTime), 2, 2, N'949568251', N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRhodWUxo4U4CmDeJcbtpwQuccKSTtzcXS076sho96Zig5wsMka&s')
GO
INSERT [dbo].[usuario] ([id], [nombre], [email], [password], [activo], [eliminado], [fecha], [idRol], [idLocalizacion], [telefono], [urlFoto]) VALUES (12, N'Alberto', N'alber@gmail.com', N'12345', 1, 0, CAST(N'2017-05-02 00:00:00.000' AS DateTime), 2, 1, N'949568261', N'http://www.xavicrespocoaching.com/wp-content/uploads/2017/11/xavi-foto-carnet-150x150.jpg')
GO
INSERT [dbo].[usuario] ([id], [nombre], [email], [password], [activo], [eliminado], [fecha], [idRol], [idLocalizacion], [telefono], [urlFoto]) VALUES (13, N'Alberto', N'alber2@gmail.com', N'12345', 1, 0, CAST(N'2017-05-02 00:00:00.000' AS DateTime), 2, 1, N'949568210', N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTFUA-Zm95UUFLyvsMt533NeKitFSqCxKC0CF7MceP_8C7ifcIP&s')
GO
INSERT [dbo].[usuario] ([id], [nombre], [email], [password], [activo], [eliminado], [fecha], [idRol], [idLocalizacion], [telefono], [urlFoto]) VALUES (14, N'Alberto', N'alber3@gmail.com', N'12345', 1, 0, CAST(N'2017-05-02 00:00:00.000' AS DateTime), 2, 1, N'949568288', N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSI7ly226TpI8MsZAWIpgj119OTbJSxVtX23ymgCv1ITcM6w85t&s')
GO
INSERT [dbo].[usuario] ([id], [nombre], [email], [password], [activo], [eliminado], [fecha], [idRol], [idLocalizacion], [telefono], [urlFoto]) VALUES (15, N'Juan', N'juan@gmail.com', N'123', 1, 0, CAST(N'2019-10-18 00:00:00.000' AS DateTime), 1, 1, N'949568277', N'https://pbs.twimg.com/profile_images/770564171603771392/FwTqlLee_400x400.jpg')
GO
INSERT [dbo].[usuario] ([id], [nombre], [email], [password], [activo], [eliminado], [fecha], [idRol], [idLocalizacion], [telefono], [urlFoto]) VALUES (16, N'Edwin', N'corone2l@gmail.com', N'123', 1, 0, CAST(N'2019-10-17 00:00:00.000' AS DateTime), 2, 2, N'949568266', N'https://static.goldenline.pl/user_photo/157/user_4281501_dd4d46_huge.jpg')
GO
INSERT [dbo].[usuario] ([id], [nombre], [email], [password], [activo], [eliminado], [fecha], [idRol], [idLocalizacion], [telefono], [urlFoto]) VALUES (17, N'Edwin', N'hola@gmail.com', N'123', 1, 0, CAST(N'2019-10-17 00:00:00.000' AS DateTime), 2, 2, N'949568255', N'https://static.goldenline.pl/user_photo/119/user_4567159_886248_huge.jpg')
GO
INSERT [dbo].[usuario] ([id], [nombre], [email], [password], [activo], [eliminado], [fecha], [idRol], [idLocalizacion], [telefono], [urlFoto]) VALUES (18, N'Daniel', N'daniel@gmail.com', N'123', 1, 0, CAST(N'2019-10-17 00:00:00.000' AS DateTime), 2, 2, N'949568244', N'https://media.licdn.com/dms/image/C4D03AQEqHcQeewXVVg/profile-displayphoto-shrink_200_200/0?e=1578528000&v=beta&t=u4IZdx_kiyHp2g7BL4anpdmgPFXFtymuplP0UmU9Kec')
GO
INSERT [dbo].[usuario] ([id], [nombre], [email], [password], [activo], [eliminado], [fecha], [idRol], [idLocalizacion], [telefono], [urlFoto]) VALUES (19, N'Juan', N'asd@gmail.com', N'123', 1, 0, CAST(N'2019-10-23 00:00:00.000' AS DateTime), 2, 1, N'949568223', N'http://www.congreso.gob.pe/Storage/tbl_congresistas/fld_47_Fotografia_file/749-u9Os9Eb6Sb1Cq1P.jpg')
GO
INSERT [dbo].[usuario] ([id], [nombre], [email], [password], [activo], [eliminado], [fecha], [idRol], [idLocalizacion], [telefono], [urlFoto]) VALUES (20, N'Lucho', N'assd@gmail.com', N'123', 1, 0, CAST(N'2019-10-23 00:00:00.000' AS DateTime), 2, 1, N'949568225', N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRBFWVa-hERKIFBIDy0KMSxBOQAVg4mb61RFjX1NLe3PVZ7Z6kg&s')
GO
INSERT [dbo].[usuario] ([id], [nombre], [email], [password], [activo], [eliminado], [fecha], [idRol], [idLocalizacion], [telefono], [urlFoto]) VALUES (21, N'Carlos', N'Hola@gmail.com', N'124', 1, 0, CAST(N'2019-10-23 00:00:00.000' AS DateTime), 2, 1, N'949584844', N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQdYFg4bxfAxH9eMZ7Z0EI5ZxglnMLImGhcbXPSFv26E3LAlnUM&s')
GO
INSERT [dbo].[usuario] ([id], [nombre], [email], [password], [activo], [eliminado], [fecha], [idRol], [idLocalizacion], [telefono], [urlFoto]) VALUES (22, N'Jhon Edwin', N'cibertec@hotmail.com', N'123', 1, 0, CAST(N'2019-05-11 23:37:00.000' AS DateTime), 1, 1, N'949568224', N'https://media.licdn.com/dms/image/C4E03AQHhcPMr6w3EHQ/profile-displayphoto-shrink_200_200/0?e=1578528000&v=beta&t=UjGLZlqQY-bLag9qD8bnxbRukpITPIQ0iUffDnAza2A')
GO
INSERT [dbo].[usuario] ([id], [nombre], [email], [password], [activo], [eliminado], [fecha], [idRol], [idLocalizacion], [telefono], [urlFoto]) VALUES (23, N'Pepe', N'pepe@gmail.com', N'1234', 1, 0, CAST(N'2019-06-11 00:00:00.000' AS DateTime), 2, 1, N'949568841', N'https://directorio.ugr.es/static/PersonalUGR/*/img/996025162a49f243644b360fddb9ab8a')
GO
INSERT [dbo].[usuario] ([id], [nombre], [email], [password], [activo], [eliminado], [fecha], [idRol], [idLocalizacion], [telefono], [urlFoto]) VALUES (24, N'Pepe', N'pepes@gmail.com', N'1234', 1, 0, CAST(N'2019-11-06 00:00:00.000' AS DateTime), 2, 1, N'949568842', N'https://directorio.ugr.es/static/PersonalUGR/*/img/996025162a49f243644b360fddb9ab8a')
GO
INSERT [dbo].[usuario] ([id], [nombre], [email], [password], [activo], [eliminado], [fecha], [idRol], [idLocalizacion], [telefono], [urlFoto]) VALUES (25, N'Cuaaack', N'cuack@gmail.com', N'123', 1, 0, CAST(N'2019-11-06 00:24:00.000' AS DateTime), 1, 1, N'949568228', N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQsHcY28tvuNKaxq0UlxddCP7ar06a8WxnqwCGvwtv7zmE42RRN&s')
GO
INSERT [dbo].[usuario] ([id], [nombre], [email], [password], [activo], [eliminado], [fecha], [idRol], [idLocalizacion], [telefono], [urlFoto]) VALUES (26, N'Cuaaack', N'cuack2@gmail.com', N'123', 1, 0, CAST(N'2019-11-06 00:24:00.000' AS DateTime), 1, 1, N'949568227', N'http://if-institute.org/wp-content/uploads/2017/04/Foto2017carnet-1.jpg')
GO
INSERT [dbo].[usuario] ([id], [nombre], [email], [password], [activo], [eliminado], [fecha], [idRol], [idLocalizacion], [telefono], [urlFoto]) VALUES (27, N'Patricio', N'gaaaa@gmail.com', N'123', 1, 0, CAST(N'2019-11-06 00:27:00.000' AS DateTime), 1, 1, N'949568112', N'https://peru-noticias.com/wp-content/uploads/2018/07/Patricio-Parodi-150x150.jpg')
GO
SET IDENTITY_INSERT [dbo].[usuario] OFF
GO
ALTER TABLE [dbo].[facturacion]  WITH CHECK ADD  CONSTRAINT [FK_facturacion_Servicios] FOREIGN KEY([idservicio])
REFERENCES [dbo].[Servicios] ([id_servicio])
GO
ALTER TABLE [dbo].[facturacion] CHECK CONSTRAINT [FK_facturacion_Servicios]
GO
ALTER TABLE [dbo].[operaciones]  WITH CHECK ADD  CONSTRAINT [FK_operaciones_modulo] FOREIGN KEY([idModulo])
REFERENCES [dbo].[modulo] ([id])
GO
ALTER TABLE [dbo].[operaciones] CHECK CONSTRAINT [FK_operaciones_modulo]
GO
ALTER TABLE [dbo].[rol_operacion]  WITH CHECK ADD  CONSTRAINT [FK_rol_operacion_operaciones] FOREIGN KEY([idOperacion])
REFERENCES [dbo].[operaciones] ([id])
GO
ALTER TABLE [dbo].[rol_operacion] CHECK CONSTRAINT [FK_rol_operacion_operaciones]
GO
ALTER TABLE [dbo].[rol_operacion]  WITH CHECK ADD  CONSTRAINT [FK_rol_operacion_rol] FOREIGN KEY([idRol])
REFERENCES [dbo].[rol] ([id])
GO
ALTER TABLE [dbo].[rol_operacion] CHECK CONSTRAINT [FK_rol_operacion_rol]
GO
ALTER TABLE [dbo].[Servicios]  WITH CHECK ADD  CONSTRAINT [FK_Servicios_categoria] FOREIGN KEY([id_categoria])
REFERENCES [dbo].[categoria] ([id_categoria])
GO
ALTER TABLE [dbo].[Servicios] CHECK CONSTRAINT [FK_Servicios_categoria]
GO
ALTER TABLE [dbo].[Servicios]  WITH CHECK ADD  CONSTRAINT [FK_Servicios_estado_servicio] FOREIGN KEY([estado])
REFERENCES [dbo].[estado_servicio] ([id])
GO
ALTER TABLE [dbo].[Servicios] CHECK CONSTRAINT [FK_Servicios_estado_servicio]
GO
ALTER TABLE [dbo].[Servicios]  WITH CHECK ADD  CONSTRAINT [FK_Servicios_Localizacion] FOREIGN KEY([idLocalizacion])
REFERENCES [dbo].[Localizacion] ([ID])
GO
ALTER TABLE [dbo].[Servicios] CHECK CONSTRAINT [FK_Servicios_Localizacion]
GO
ALTER TABLE [dbo].[Servicios]  WITH CHECK ADD  CONSTRAINT [FK_Servicios_usuario] FOREIGN KEY([idUsuario])
REFERENCES [dbo].[usuario] ([id])
GO
ALTER TABLE [dbo].[Servicios] CHECK CONSTRAINT [FK_Servicios_usuario]
GO
ALTER TABLE [dbo].[Solicitud]  WITH CHECK ADD  CONSTRAINT [FK_Solicitud_Servicios] FOREIGN KEY([id_servicio])
REFERENCES [dbo].[Servicios] ([id_servicio])
GO
ALTER TABLE [dbo].[Solicitud] CHECK CONSTRAINT [FK_Solicitud_Servicios]
GO
ALTER TABLE [dbo].[Solicitud]  WITH CHECK ADD  CONSTRAINT [FK_Solicitud_usuario] FOREIGN KEY([id_usuario])
REFERENCES [dbo].[usuario] ([id])
GO
ALTER TABLE [dbo].[Solicitud] CHECK CONSTRAINT [FK_Solicitud_usuario]
GO
ALTER TABLE [dbo].[usuario]  WITH CHECK ADD  CONSTRAINT [FK_usuario_Localizacion] FOREIGN KEY([idLocalizacion])
REFERENCES [dbo].[Localizacion] ([ID])
GO
ALTER TABLE [dbo].[usuario] CHECK CONSTRAINT [FK_usuario_Localizacion]
GO
ALTER TABLE [dbo].[usuario]  WITH CHECK ADD  CONSTRAINT [FK_usuario_rol] FOREIGN KEY([idRol])
REFERENCES [dbo].[rol] ([id])
GO
ALTER TABLE [dbo].[usuario] CHECK CONSTRAINT [FK_usuario_rol]
GO
/****** Object:  StoredProcedure [dbo].[BuscarServicioXcategoria]    Script Date: 07/11/2019 2:55:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[BuscarServicioXcategoria]
(@categoria varchar(50))

as
begin
select s.id_servicio as[CODIGO],u.nombre as[NOMBRE],s.calificacion as[CALIFICACION],s.fecha_inicio as [FECHA-INICIO],
        s.fecha_fin as [FECHA-FIN],e.descripcion as[ESTADO],s.descripcion as [DESCRIPCIONSERVICIO],c.descripcion as[DESCRIPCION],l.Ubicacion AS[UBICACION],l.Latitud AS[LATITUD],l.Longitud AS[LONGITUD]
       

from Servicios s inner join categoria c
on s.id_categoria=c.id_categoria join usuario u
on u.id=s.idusuario inner join Localizacion l 
on u.idlocalizacion=l.ID inner join estado_servicio e
on s.estado=e.id
	where s.id_categoria=@categoria
end

GO
/****** Object:  StoredProcedure [dbo].[DETALLE_SERVICIO]    Script Date: 07/11/2019 2:55:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[DETALLE_SERVICIO]
@codigo int
as
begin
     select s.descripcion as[DESCRIPCION],f.Precio AS[PRECIO],l.Ubicacion,l.Latitud,l.Longitud
	  from Servicios s inner join facturacion f
	 on s.id_servicio=f.idservicio inner join Localizacion l
	 on s.idLocalizacion=l.ID  where s.id_servicio=@codigo
   

end

GO
/****** Object:  StoredProcedure [dbo].[ELIMINAR_SERVICIO]    Script Date: 07/11/2019 2:55:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[ELIMINAR_SERVICIO]
@ID INT
AS
BEGIN
DELETE FROM Servicios
WHERE id_servicio=@ID
END

GO
/****** Object:  StoredProcedure [dbo].[ELIMINAR_USUARIO]    Script Date: 07/11/2019 2:55:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[ELIMINAR_USUARIO]
@ID INT
AS
BEGIN
DELETE FROM usuario
WHERE id=@ID
END

GO
/****** Object:  StoredProcedure [dbo].[LISTA_CATEGORIA]    Script Date: 07/11/2019 2:55:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[LISTA_CATEGORIA]
as
begin
      select c.id_categoria as[CODIGO],c.descripcion as [NOMBRE] from categoria c

end

GO
/****** Object:  StoredProcedure [dbo].[LISTAR_ROL]    Script Date: 07/11/2019 2:55:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[LISTAR_ROL]
as 
begin
   select r.id as[CODIGO],r.nombre as[NOMBRE] from rol r
end

GO
/****** Object:  StoredProcedure [dbo].[LISTAR_SERVICIO]    Script Date: 07/11/2019 2:55:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[LISTAR_SERVICIO]
as
begin
select s.id_servicio as[CODIGO],u.nombre as[NOMBRE],u.urlFoto as [URLFOTO],s.calificacion as[CALIFICACION],s.fecha_inicio as [FECHA-INICIO],
        s.fecha_fin as [FECHA-FIN],e.descripcion as[ESTADO],s.descripcion as [DESCRIPCIONSERVICIO],c.descripcion as[DESCRIPCION],l.Ubicacion AS[UBICACION],s.Latitud AS[LATITUD],s.Longitud AS[LONGITUD]
       

from Servicios s inner join categoria c
on s.id_categoria=c.id_categoria join usuario u
on u.id=s.idusuario join Localizacion l 
on s.idlocalizacion=l.ID inner join estado_servicio e
on s.estado=e.id
end

GO
/****** Object:  StoredProcedure [dbo].[LISTAR_SERVICIO_CALIFICACION]    Script Date: 07/11/2019 2:55:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[LISTAR_SERVICIO_CALIFICACION]

as
begin
select s.id_servicio as[CODIGO],u.nombre as[NOMBRE],u.urlFoto as [URLFOTO],s.calificacion as[CALIFICACION],s.fecha_inicio as [FECHA-INICIO],
        s.fecha_fin as [FECHA-FIN],e.descripcion as[ESTADO],s.descripcion as [DESCRIPCIONSERVICIO],c.descripcion as[DESCRIPCION],l.Ubicacion AS[UBICACION],s.Latitud AS[LATITUD],s.Longitud AS[LONGITUD]
   

from Servicios s inner join categoria c
on s.id_categoria=c.id_categoria join usuario u
on u.id=s.idusuario join Localizacion l 
on s.idlocalizacion=l.ID inner join estado_servicio e
on s.estado=e.id
	ORDER BY s.calificacion DESC
end

GO
/****** Object:  StoredProcedure [dbo].[LISTAR_SERVICIO_RECIENTE]    Script Date: 07/11/2019 2:55:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[LISTAR_SERVICIO_RECIENTE]

as
begin
select s.id_servicio as[CODIGO],u.nombre as[NOMBRE],u.urlFoto as [URLFOTO],s.calificacion as[CALIFICACION],s.fecha_inicio as [FECHA-INICIO],
        s.fecha_fin as [FECHA-FIN],e.descripcion as[ESTADO],s.descripcion as [DESCRIPCIONSERVICIO],c.descripcion as[DESCRIPCION],l.Ubicacion AS[UBICACION],s.Latitud AS[LATITUD],s.Longitud AS[LONGITUD]
        

from Servicios s inner join categoria c
on s.id_categoria=c.id_categoria join usuario u
on u.id=s.idusuario join Localizacion l 
on s.idlocalizacion=l.ID inner join estado_servicio e
on s.estado=e.id
	ORDER BY s.id_servicio DESC
end

GO
/****** Object:  StoredProcedure [dbo].[LISTAR_UBICACION]    Script Date: 07/11/2019 2:55:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[LISTAR_UBICACION]
as
begin
       select l.ID,l.Ubicacion,l.Latitud,l.Longitud from Localizacion l

end

GO
/****** Object:  StoredProcedure [dbo].[LISTAR_USUARIO]    Script Date: 07/11/2019 2:55:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[LISTAR_USUARIO]
as
begin
select u.id as[CODIGO],u.nombre as[NOMBRE],u.email as [CORREO],u.password as [PASSWORD],u.telefono as [TELEFONO],u.Activo as [ACTIVO],u.eliminado as [ELIMINADO],u.fecha as [FECHA],r.id as [IDROL] ,r.nombre AS [ROL],
       l.Ubicacion as[UBICACION],l.Latitud as[LATITUD],l.Longitud as[LONGITUD],u.urlFoto as [URLFOTO]

from usuario u inner join rol r
on u.idRol=r.id inner join Localizacion l
on u.idLocalizacion=l.id
end

GO
/****** Object:  StoredProcedure [dbo].[LOGIN_USUARIO]    Script Date: 07/11/2019 2:55:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[LOGIN_USUARIO]
@Usuario varchar(50),
@Contraseña varchar(20)
as
begin 
        declare @codResultado int, @mensaje varchar(50),@codUsuario int,@codTipo int,@Tipo varchar(20),@nombre varchar(50),@urlFoto varchar(max),@idLocalizacion int,@telefono varchar(10),@fechaNacimiento varchar(50), @activo int, @eliminado int;
		if exists(SELECT email,password FROM usuario where password=@Contraseña and email=@Usuario)
		begin

		   SELECT @codTipo = r.id,@Tipo = r.nombre,@codUsuario = u.id,@nombre = u.nombre,@urlFoto = u.urlFoto,@idLocalizacion = u.idLocalizacion, @telefono = u.telefono,@fechaNacimiento = convert(varchar(10),u.fecha, 103),@activo = u.activo, @eliminado = u.eliminado 
			FROM rol r inner join usuario u on u.idRol = r.id 
			WHERE u.password=@Contraseña and u.email=@Usuario

		   if(@Tipo='Socio')
		   begin
		   
		   set @mensaje='Bienvenido Socio'	
		   set @codResultado = 1;	

		   end
		   else if(@Tipo='Administrador')
		   begin

		   set @mensaje='Bienvenido Administrador'
		   set @codResultado = 1;	

		   end
		   else if(@Tipo='Cliente')
		   begin
		   set @mensaje='Bienvenido Cliente'
		   set @codResultado = 1;	

		   end
		   END
		   else BEGIN
		     set @mensaje='Usuario o contraseña inválidos'
			 set @codResultado = 0;	
		end
		select @codResultado as [codResultado],@mensaje as [desResultado],@codTipo as [codRol],@Tipo as [nomRol],@codUsuario as [codUsuario],@nombre as [nomUsuario],@urlFoto as [urlFoto],@idLocalizacion as [idLocalizacion],@telefono as [telefono],@fechaNacimiento as [fechaNacimiento], @activo as [activo], @eliminado as [eliminado]
end

GO
/****** Object:  StoredProcedure [dbo].[MODIFICAR_SERVICIO]    Script Date: 07/11/2019 2:55:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[MODIFICAR_SERVICIO]
@ID INT,
@idusuario int,
@descripcion varchar(200),
@calificacion int,
@fecha_inicio datetime,
@fecha_fin datetime,
@idcategoria int,
@localizacion int,
@latitud varchar(200),
@longitud varchar(200),
@estado int

as
BEGIN
UPDATE Servicios
SET idusuario=@idusuario,descripcion=@descripcion,calificacion=@calificacion ,fecha_inicio=@fecha_inicio,fecha_fin=@fecha_fin,latitud=@latitud,longitud=@longitud,estado=@estado,id_categoria=@idcategoria 
,idLocalizacion=@localizacion
WHERE id_servicio =@ID
END

GO
/****** Object:  StoredProcedure [dbo].[MODIFICAR_USUARIO]    Script Date: 07/11/2019 2:55:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[MODIFICAR_USUARIO]
@id int,
@nombre varchar(20),
@email varchar(20),
@Contraseña varchar(10),
@telefono varchar(10),
@Activo bit,
@Eliminado bit,
@fecha datetime,
@rol int,
@localizacion int,
@urlFoto varchar(max)

as
BEGIN
UPDATE usuario
SET nombre=@nombre,email=@email,password=@Contraseña,telefono=@telefono,Activo=@Activo,eliminado=@Eliminado ,fecha=@fecha ,idRol=@rol ,idLocalizacion=@localizacion, urlFoto = @urlFoto
WHERE id =@id
END

GO
/****** Object:  StoredProcedure [dbo].[PublicarServicios]    Script Date: 07/11/2019 2:55:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[PublicarServicios]
(
@NombreCate varchar(20),
@ubicacion int,
@Descripcion varchar(100)
)
as
begin
    select s.descripcion as[DESCRIPCION],c.descripcion [NOMBRE-CATEGORIA],l.Ubicacion AS[UBICACION]
	   from Servicios s inner join categoria c
	   on s.id_categoria=c.id_categoria inner join Localizacion l
	   on s.idLocalizacion=l.ID
	   where s.id_categoria=@NombreCate and s.idLocalizacion=@ubicacion and s.id_servicio=@Descripcion

end

GO
/****** Object:  StoredProcedure [dbo].[REGISTRAR_SERVICIO]    Script Date: 07/11/2019 2:55:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[REGISTRAR_SERVICIO]
(
@idusuario int,
@descripcion varchar(200),
@calificacion int,
@fecha_inicio datetime,
@fecha_fin datetime,
@idcategoria int,
@localizacion int,
@latitud varchar(200),
@longitud varchar(200),
@estado int
)
as
begin
DECLARE @ID INT;
INSERT INTO Servicios(idusuario,descripcion,calificacion,fecha_inicio,fecha_fin,id_categoria,idLocalizacion,latitud,longitud,estado) VALUES(
@idusuario,@descripcion,@calificacion,@fecha_inicio,@fecha_fin,@idcategoria,@localizacion,@latitud,@longitud,@estado) 
SELECT @ID=id_servicio FROM Servicios
SET @ID =(SELECT SCOPE_IDENTITY())
end

GO
/****** Object:  StoredProcedure [dbo].[REGISTRAR_USUARIO]    Script Date: 07/11/2019 2:55:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[REGISTRAR_USUARIO]
(
@nombre varchar(20),
@email varchar(20),
@Contraseña varchar(10),
@Activo bit,
@Eliminado bit,
@fecha datetime,
@telefono int,
@rol int,
@localizacion int,
@urlFoto varchar(max)
)

as
	declare @codResultado int,@mensaje varchar(50),@tel varchar(50);         
    if exists(Select * from usuario where email=@email)   
	        
	begin	       
		   set @mensaje='Ya existe este Usuario'+' '+@email		  
		   set @codResultado = 0;
		   select @codResultado as codResultado,@mensaje as Mensaje,@activo as Conectado		   
	  return 
	end
	else if exists(Select * from usuario where telefono=@telefono)
	begin
	      set @mensaje='Ya existe este Telefono'+' '+str(@telefono)		  
		  set @codResultado = 0;
		   select @codResultado as codResultado,@mensaje as Mensaje,@activo as Conectado	
	return
	end

begin
DECLARE @ID INT;
INSERT INTO usuario(nombre,email,password,Activo,eliminado,fecha,idRol,idLocalizacion,telefono,urlFoto) VALUES(@nombre,
@email,@contraseña,@Activo,@Eliminado,@fecha,@rol,@localizacion,@telefono,@urlFoto) 
SELECT @ID=id FROM usuario 
SET @ID =(SELECT SCOPE_IDENTITY())
  set @codResultado = 1;
  set @mensaje='Registrado Correctamente'
  select @codResultado as codResultado,@mensaje as Mensaje 
end

GO
/****** Object:  StoredProcedure [dbo].[ServiciosXubicacion]    Script Date: 07/11/2019 2:55:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[ServiciosXubicacion]
(@ubicacion int)

as
begin    
select s.id_servicio as[CODIGO],u.nombre as[NOMBRE],s.calificacion as[CALIFICACION],s.fecha_inicio as [FECHA-INICIO],
        s.fecha_fin as [FECHA-FIN],e.descripcion as[ESTADO],s.descripcion as [DESCRIPCIONSERVICIO],c.descripcion as[DESCRIPCION],l.Ubicacion AS[UBICACION],l.Latitud AS[LATITUD],l.Longitud AS[LONGITUD]
       

from Servicios s inner join categoria c
on s.id_categoria=c.id_categoria join usuario u
on u.id=s.idusuario inner join Localizacion l 
on u.idlocalizacion=l.ID inner join estado_servicio e
on s.estado=e.id
	 where s.idLocalizacion=@ubicacion	 	  
end

GO
/****** Object:  StoredProcedure [dbo].[VALIDAR_EMAIL]    Script Date: 07/11/2019 2:55:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[VALIDAR_EMAIL]

@email varchar(100)
as   
   declare @mensaje varchar(50),@codResultado int       
    if exists(Select * from usuario where email=@email)

	begin
			set @codResultado = 0
		   set @mensaje='Ya existe el usuario'+'  '+@email	    	   	
	   select @codResultado as CodResultado, @mensaje as DesResultado		
	  return 
	end

begin
set @codResultado = 1
set @mensaje=@email+' está disponible'	    	   	
	   select @codResultado as CodResultado, @mensaje as DesResultado  			
	  return 
end


GO
/****** Object:  StoredProcedure [dbo].[VALIDAR_TELEFONO]    Script Date: 07/11/2019 2:55:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[VALIDAR_TELEFONO]

@telefono int
as   
   declare @mensaje varchar(50),@codResultado int       
    if exists(Select * from usuario where telefono=@telefono)

	begin
			set @codResultado = 0
		   set @mensaje='Ya existe el número'+' '+CAST(@telefono as varchar(10))   	   	
	   select @codResultado as CodResultado, @mensaje as DesResultado		
	  return 
	end

begin
set @codResultado = 1
set @mensaje=CAST(@telefono as varchar(10))+' está disponible'	    	   	
	   select @codResultado as CodResultado, @mensaje as DesResultado  			
	  return 
end


GO
USE [master]
GO
ALTER DATABASE [bdmiloficios] SET  READ_WRITE 
GO
