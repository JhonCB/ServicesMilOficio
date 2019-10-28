USE [master]
GO
/****** Object:  Database [BD_PROYECTO]    Script Date: 27/10/2019 22:54:28 ******/
CREATE DATABASE [BD_PROYECTO]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BD_PROYECTO_Data', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\BD_PROYECTO.mdf' , SIZE = 4288KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'BD_PROYECTO_Log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\BD_PROYECTO.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [BD_PROYECTO] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BD_PROYECTO].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BD_PROYECTO] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BD_PROYECTO] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BD_PROYECTO] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BD_PROYECTO] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BD_PROYECTO] SET ARITHABORT OFF 
GO
ALTER DATABASE [BD_PROYECTO] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [BD_PROYECTO] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BD_PROYECTO] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BD_PROYECTO] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BD_PROYECTO] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BD_PROYECTO] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BD_PROYECTO] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BD_PROYECTO] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BD_PROYECTO] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BD_PROYECTO] SET  ENABLE_BROKER 
GO
ALTER DATABASE [BD_PROYECTO] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BD_PROYECTO] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BD_PROYECTO] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BD_PROYECTO] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BD_PROYECTO] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BD_PROYECTO] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BD_PROYECTO] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BD_PROYECTO] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BD_PROYECTO] SET  MULTI_USER 
GO
ALTER DATABASE [BD_PROYECTO] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BD_PROYECTO] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BD_PROYECTO] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BD_PROYECTO] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [BD_PROYECTO] SET DELAYED_DURABILITY = DISABLED 
GO
USE [BD_PROYECTO]
GO
/****** Object:  Table [dbo].[categoria]    Script Date: 27/10/2019 22:54:29 ******/
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
/****** Object:  Table [dbo].[estado_servicio]    Script Date: 27/10/2019 22:54:29 ******/
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
/****** Object:  Table [dbo].[facturacion]    Script Date: 27/10/2019 22:54:29 ******/
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
/****** Object:  Table [dbo].[Localizacion]    Script Date: 27/10/2019 22:54:29 ******/
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
/****** Object:  Table [dbo].[modulo]    Script Date: 27/10/2019 22:54:29 ******/
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
/****** Object:  Table [dbo].[operaciones]    Script Date: 27/10/2019 22:54:29 ******/
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
/****** Object:  Table [dbo].[rol]    Script Date: 27/10/2019 22:54:29 ******/
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
/****** Object:  Table [dbo].[rol_operacion]    Script Date: 27/10/2019 22:54:29 ******/
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
/****** Object:  Table [dbo].[Servicios]    Script Date: 27/10/2019 22:54:29 ******/
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
	[estado] [int] NULL,
 CONSTRAINT [PK_Servicios] PRIMARY KEY CLUSTERED 
(
	[id_servicio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Solicitud]    Script Date: 27/10/2019 22:54:29 ******/
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
/****** Object:  Table [dbo].[usuario]    Script Date: 27/10/2019 22:54:29 ******/
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
 CONSTRAINT [PK_usuario] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

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
INSERT [dbo].[Localizacion] ([ID], [Ubicacion], [Latitud], [Longitud]) VALUES (1, N'Lima', N'20.945123149', N'-89.6412134556')
GO
INSERT [dbo].[Localizacion] ([ID], [Ubicacion], [Latitud], [Longitud]) VALUES (2, N'Trujillo', N'20.945123123', N'-89.6012344567')
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
INSERT [dbo].[Servicios] ([id_servicio], [idUsuario], [descripcion], [calificacion], [fecha_inicio], [fecha_fin], [id_categoria], [idLocalizacion], [estado]) VALUES (1, 1, N'aaaaaaa', 8, CAST(N'2018-08-05 00:00:00.000' AS DateTime), CAST(N'2018-06-06 00:00:00.000' AS DateTime), 7, 2, 1)
GO
INSERT [dbo].[Servicios] ([id_servicio], [idUsuario], [descripcion], [calificacion], [fecha_inicio], [fecha_fin], [id_categoria], [idLocalizacion], [estado]) VALUES (2, 1, N'aaaaaaa', 10, CAST(N'2018-08-05 00:00:00.000' AS DateTime), CAST(N'2018-06-06 00:00:00.000' AS DateTime), 7, 2, 1)
GO
INSERT [dbo].[Servicios] ([id_servicio], [idUsuario], [descripcion], [calificacion], [fecha_inicio], [fecha_fin], [id_categoria], [idLocalizacion], [estado]) VALUES (3, 2, N'Hola', NULL, CAST(N'2019-10-23 00:00:00.000' AS DateTime), CAST(N'2019-11-21 00:00:00.000' AS DateTime), 1, 2, 1)
GO
INSERT [dbo].[Servicios] ([id_servicio], [idUsuario], [descripcion], [calificacion], [fecha_inicio], [fecha_fin], [id_categoria], [idLocalizacion], [estado]) VALUES (4, 2, N'Testing', 0, CAST(N'2019-10-26 00:00:00.000' AS DateTime), CAST(N'2019-11-30 00:00:00.000' AS DateTime), 6, 2, 1)
GO
INSERT [dbo].[Servicios] ([id_servicio], [idUsuario], [descripcion], [calificacion], [fecha_inicio], [fecha_fin], [id_categoria], [idLocalizacion], [estado]) VALUES (5, 1, N'Testing2', 0, CAST(N'2019-10-27 19:32:22.000' AS DateTime), CAST(N'2019-11-30 00:00:00.000' AS DateTime), 1, 2, 1)
GO
INSERT [dbo].[Servicios] ([id_servicio], [idUsuario], [descripcion], [calificacion], [fecha_inicio], [fecha_fin], [id_categoria], [idLocalizacion], [estado]) VALUES (6, 1, N'Testing2', 0, CAST(N'2019-10-27 19:32:22.000' AS DateTime), CAST(N'2019-11-30 00:00:00.000' AS DateTime), 1, 2, 1)
GO
INSERT [dbo].[Servicios] ([id_servicio], [idUsuario], [descripcion], [calificacion], [fecha_inicio], [fecha_fin], [id_categoria], [idLocalizacion], [estado]) VALUES (7, 1, N'Testing2', 0, CAST(N'2019-10-27 19:32:51.000' AS DateTime), CAST(N'2019-11-30 00:00:00.000' AS DateTime), 1, 2, 1)
GO
INSERT [dbo].[Servicios] ([id_servicio], [idUsuario], [descripcion], [calificacion], [fecha_inicio], [fecha_fin], [id_categoria], [idLocalizacion], [estado]) VALUES (8, 1, N'Testing2', 0, CAST(N'2019-10-27 19:32:51.000' AS DateTime), CAST(N'2019-11-30 00:00:00.000' AS DateTime), 1, 2, 1)
GO
INSERT [dbo].[Servicios] ([id_servicio], [idUsuario], [descripcion], [calificacion], [fecha_inicio], [fecha_fin], [id_categoria], [idLocalizacion], [estado]) VALUES (9, 1, N'Testing2', 0, CAST(N'2019-10-27 19:34:45.000' AS DateTime), CAST(N'2019-11-30 00:00:00.000' AS DateTime), 1, 2, 1)
GO
INSERT [dbo].[Servicios] ([id_servicio], [idUsuario], [descripcion], [calificacion], [fecha_inicio], [fecha_fin], [id_categoria], [idLocalizacion], [estado]) VALUES (10, 1, N'Testing2', 0, CAST(N'2019-10-27 19:34:45.000' AS DateTime), CAST(N'2019-11-30 00:00:00.000' AS DateTime), 1, 2, 1)
GO
INSERT [dbo].[Servicios] ([id_servicio], [idUsuario], [descripcion], [calificacion], [fecha_inicio], [fecha_fin], [id_categoria], [idLocalizacion], [estado]) VALUES (11, 1, N'Testing3', 0, CAST(N'2019-10-27 19:35:00.000' AS DateTime), CAST(N'2019-11-30 00:00:00.000' AS DateTime), 1, 2, 1)
GO
INSERT [dbo].[Servicios] ([id_servicio], [idUsuario], [descripcion], [calificacion], [fecha_inicio], [fecha_fin], [id_categoria], [idLocalizacion], [estado]) VALUES (12, 1, N'Testing3', 0, CAST(N'2019-10-27 19:35:00.000' AS DateTime), CAST(N'2019-11-30 00:00:00.000' AS DateTime), 1, 2, 1)
GO
INSERT [dbo].[Servicios] ([id_servicio], [idUsuario], [descripcion], [calificacion], [fecha_inicio], [fecha_fin], [id_categoria], [idLocalizacion], [estado]) VALUES (13, 2, N'Testing4', 0, CAST(N'2019-10-27 00:00:00.000' AS DateTime), CAST(N'2019-10-28 00:00:00.000' AS DateTime), 1, 1, 1)
GO
INSERT [dbo].[Servicios] ([id_servicio], [idUsuario], [descripcion], [calificacion], [fecha_inicio], [fecha_fin], [id_categoria], [idLocalizacion], [estado]) VALUES (14, 2, N'Testing5', 0, CAST(N'2019-10-27 19:38:37.000' AS DateTime), CAST(N'2019-10-20 00:00:00.000' AS DateTime), 1, 1, 1)
GO
INSERT [dbo].[Servicios] ([id_servicio], [idUsuario], [descripcion], [calificacion], [fecha_inicio], [fecha_fin], [id_categoria], [idLocalizacion], [estado]) VALUES (15, 2, N'Testing5', 0, CAST(N'2019-10-27 19:38:37.000' AS DateTime), CAST(N'2019-10-20 00:00:00.000' AS DateTime), 1, 1, 1)
GO
INSERT [dbo].[Servicios] ([id_servicio], [idUsuario], [descripcion], [calificacion], [fecha_inicio], [fecha_fin], [id_categoria], [idLocalizacion], [estado]) VALUES (16, 2, N'Testing6', 0, CAST(N'2019-10-27 19:41:51.000' AS DateTime), CAST(N'2019-11-25 00:00:00.000' AS DateTime), 1, 2, 1)
GO
INSERT [dbo].[Servicios] ([id_servicio], [idUsuario], [descripcion], [calificacion], [fecha_inicio], [fecha_fin], [id_categoria], [idLocalizacion], [estado]) VALUES (17, 2, N'Testing6', 0, CAST(N'2019-10-27 19:41:51.000' AS DateTime), CAST(N'2019-11-25 00:00:00.000' AS DateTime), 1, 2, 1)
GO
INSERT [dbo].[Servicios] ([id_servicio], [idUsuario], [descripcion], [calificacion], [fecha_inicio], [fecha_fin], [id_categoria], [idLocalizacion], [estado]) VALUES (18, 2, N'Testing7', 0, CAST(N'2019-10-27 19:42:28.000' AS DateTime), CAST(N'2019-11-25 00:00:00.000' AS DateTime), 1, 2, 1)
GO
INSERT [dbo].[Servicios] ([id_servicio], [idUsuario], [descripcion], [calificacion], [fecha_inicio], [fecha_fin], [id_categoria], [idLocalizacion], [estado]) VALUES (19, 2, N'Testing7', 0, CAST(N'2019-10-27 19:42:28.000' AS DateTime), CAST(N'2019-11-25 00:00:00.000' AS DateTime), 1, 2, 1)
GO
INSERT [dbo].[Servicios] ([id_servicio], [idUsuario], [descripcion], [calificacion], [fecha_inicio], [fecha_fin], [id_categoria], [idLocalizacion], [estado]) VALUES (20, 2, N'Testing8', 0, CAST(N'2019-10-27 19:44:55.000' AS DateTime), CAST(N'2019-10-28 00:00:00.000' AS DateTime), 2, 2, 1)
GO
INSERT [dbo].[Servicios] ([id_servicio], [idUsuario], [descripcion], [calificacion], [fecha_inicio], [fecha_fin], [id_categoria], [idLocalizacion], [estado]) VALUES (21, 2, N'Testing8', 0, CAST(N'2019-10-27 19:44:55.000' AS DateTime), CAST(N'2019-10-28 00:00:00.000' AS DateTime), 2, 2, 1)
GO
SET IDENTITY_INSERT [dbo].[Servicios] OFF
GO
SET IDENTITY_INSERT [dbo].[usuario] ON 

GO
INSERT [dbo].[usuario] ([id], [nombre], [email], [password], [activo], [eliminado], [fecha], [idRol], [idLocalizacion], [telefono]) VALUES (1, N'roberto', N'acuario6432@outlook', N'micontra', 0, 0, CAST(N'2019-01-01 00:00:00.000' AS DateTime), 3, 1, NULL)
GO
INSERT [dbo].[usuario] ([id], [nombre], [email], [password], [activo], [eliminado], [fecha], [idRol], [idLocalizacion], [telefono]) VALUES (2, N'ricardo', N'acuario6432@outlook.', N'Ev5tzx8e', 1, 1, CAST(N'2012-02-10 00:00:00.000' AS DateTime), 1, 1, NULL)
GO
INSERT [dbo].[usuario] ([id], [nombre], [email], [password], [activo], [eliminado], [fecha], [idRol], [idLocalizacion], [telefono]) VALUES (3, N'guillermo', N'guillermo@gmail.com', N'1234', 1, 0, CAST(N'2018-05-04 00:00:00.000' AS DateTime), 3, 1, NULL)
GO
INSERT [dbo].[usuario] ([id], [nombre], [email], [password], [activo], [eliminado], [fecha], [idRol], [idLocalizacion], [telefono]) VALUES (4, N'jhon', N'jhon@cibertec.com', N'12345', 1, 0, CAST(N'2015-02-01 00:00:00.000' AS DateTime), 2, 2, NULL)
GO
INSERT [dbo].[usuario] ([id], [nombre], [email], [password], [activo], [eliminado], [fecha], [idRol], [idLocalizacion], [telefono]) VALUES (5, N'Jhon Coronel', N'ghoozh@gmail.com', N'123', 1, 0, CAST(N'2019-10-17 00:00:00.000' AS DateTime), 3, 1, NULL)
GO
INSERT [dbo].[usuario] ([id], [nombre], [email], [password], [activo], [eliminado], [fecha], [idRol], [idLocalizacion], [telefono]) VALUES (6, N'Edwin', N'Edwin02@gmal.com', N'123456', 1, 0, CAST(N'2019-10-17 00:00:00.000' AS DateTime), 2, 2, NULL)
GO
INSERT [dbo].[usuario] ([id], [nombre], [email], [password], [activo], [eliminado], [fecha], [idRol], [idLocalizacion], [telefono]) VALUES (7, N'Edwin', N'coronel@gmail.com', N'123', 1, 0, CAST(N'2019-10-17 00:00:00.000' AS DateTime), 2, 2, NULL)
GO
INSERT [dbo].[usuario] ([id], [nombre], [email], [password], [activo], [eliminado], [fecha], [idRol], [idLocalizacion], [telefono]) VALUES (8, N'Edwin', N'coronel@gmail.com', N'123', 1, 0, CAST(N'2019-10-17 00:00:00.000' AS DateTime), 2, 2, NULL)
GO
INSERT [dbo].[usuario] ([id], [nombre], [email], [password], [activo], [eliminado], [fecha], [idRol], [idLocalizacion], [telefono]) VALUES (9, N'Edwin', N'coronel@gmail.com', N'123', 1, 0, CAST(N'2019-10-17 00:00:00.000' AS DateTime), 2, 2, NULL)
GO
INSERT [dbo].[usuario] ([id], [nombre], [email], [password], [activo], [eliminado], [fecha], [idRol], [idLocalizacion], [telefono]) VALUES (10, N'Edwin', N'coronel@gmail.com', N'123', 1, 0, CAST(N'2019-10-17 00:00:00.000' AS DateTime), 2, 2, NULL)
GO
INSERT [dbo].[usuario] ([id], [nombre], [email], [password], [activo], [eliminado], [fecha], [idRol], [idLocalizacion], [telefono]) VALUES (11, N'Edwin', N'coronel@gmail.com', N'123', 1, 0, CAST(N'2019-10-17 00:00:00.000' AS DateTime), 2, 2, NULL)
GO
INSERT [dbo].[usuario] ([id], [nombre], [email], [password], [activo], [eliminado], [fecha], [idRol], [idLocalizacion], [telefono]) VALUES (12, N'Alberto', N'alber@gmail.com', N'12345', 1, 0, CAST(N'2017-05-02 00:00:00.000' AS DateTime), 2, 1, NULL)
GO
INSERT [dbo].[usuario] ([id], [nombre], [email], [password], [activo], [eliminado], [fecha], [idRol], [idLocalizacion], [telefono]) VALUES (13, N'Alberto', N'alber@gmail.com', N'12345', 1, 0, CAST(N'2017-05-02 00:00:00.000' AS DateTime), 2, 1, NULL)
GO
INSERT [dbo].[usuario] ([id], [nombre], [email], [password], [activo], [eliminado], [fecha], [idRol], [idLocalizacion], [telefono]) VALUES (14, N'Alberto', N'alber@gmail.com', N'12345', 1, 0, CAST(N'2017-05-02 00:00:00.000' AS DateTime), 2, 1, NULL)
GO
INSERT [dbo].[usuario] ([id], [nombre], [email], [password], [activo], [eliminado], [fecha], [idRol], [idLocalizacion], [telefono]) VALUES (15, N'Juan', N'juan@gmail.com', N'123', 1, 0, CAST(N'2019-10-18 00:00:00.000' AS DateTime), 1, 1, NULL)
GO
INSERT [dbo].[usuario] ([id], [nombre], [email], [password], [activo], [eliminado], [fecha], [idRol], [idLocalizacion], [telefono]) VALUES (16, N'Edwin', N'corone2l@gmail.com', N'123', 1, 0, CAST(N'2019-10-17 00:00:00.000' AS DateTime), 2, 2, NULL)
GO
INSERT [dbo].[usuario] ([id], [nombre], [email], [password], [activo], [eliminado], [fecha], [idRol], [idLocalizacion], [telefono]) VALUES (17, N'Edwin', N'hola@gmail.com', N'123', 1, 0, CAST(N'2019-10-17 00:00:00.000' AS DateTime), 2, 2, NULL)
GO
INSERT [dbo].[usuario] ([id], [nombre], [email], [password], [activo], [eliminado], [fecha], [idRol], [idLocalizacion], [telefono]) VALUES (18, N'Edwin', N'hola2@gmail.com', N'123', 1, 0, CAST(N'2019-10-17 00:00:00.000' AS DateTime), 2, 2, NULL)
GO
INSERT [dbo].[usuario] ([id], [nombre], [email], [password], [activo], [eliminado], [fecha], [idRol], [idLocalizacion], [telefono]) VALUES (19, NULL, N'asd@gmail.com', N'123', 1, 0, CAST(N'2019-10-23 00:00:00.000' AS DateTime), 2, 1, N'949568225')
GO
INSERT [dbo].[usuario] ([id], [nombre], [email], [password], [activo], [eliminado], [fecha], [idRol], [idLocalizacion], [telefono]) VALUES (20, NULL, N'assd@gmail.com', N'123', 1, 0, CAST(N'2019-10-23 00:00:00.000' AS DateTime), 2, 1, N'949568225')
GO
INSERT [dbo].[usuario] ([id], [nombre], [email], [password], [activo], [eliminado], [fecha], [idRol], [idLocalizacion], [telefono]) VALUES (21, NULL, N'ass2d@gmail.com', NULL, 1, 0, CAST(N'2019-10-23 00:00:00.000' AS DateTime), 2, 1, N'949568225')
GO
INSERT [dbo].[usuario] ([id], [nombre], [email], [password], [activo], [eliminado], [fecha], [idRol], [idLocalizacion], [telefono]) VALUES (22, N'Jhoncito', N'ghoozh222@gmail.com', N'123', 1, 0, CAST(N'2019-10-23 00:00:00.000' AS DateTime), 1, 1, N'949568224')
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
/****** Object:  StoredProcedure [dbo].[BuscarServicioXcategoria]    Script Date: 27/10/2019 22:54:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[BuscarServicioXcategoria]
(@categoria varchar(50))

as
begin
select s.id_servicio as[CODIGO],u.nombre as[NOMBRE],s.calificacion as[CALIFICACION],s.fecha_inicio as [FECHA-INICIO],
        s.fecha_fin as [FECHA-FIN],e.descripcion as[ESTADO],c.descripcion as[DESCRIPCION],l.Ubicacion AS[UBICACION],l.Latitud AS[LATITUD],l.Longitud AS[LONGITUD]
       

from Servicios s inner join categoria c
on s.id_categoria=c.id_categoria join usuario u
on u.id=s.idusuario inner join Localizacion l 
on u.idlocalizacion=l.ID inner join estado_servicio e
on s.estado=e.id
	where s.id_categoria=@categoria
end
GO
/****** Object:  StoredProcedure [dbo].[DETALLE_SERVICIO]    Script Date: 27/10/2019 22:54:29 ******/
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
/****** Object:  StoredProcedure [dbo].[ELIMINAR_SERVICIO]    Script Date: 27/10/2019 22:54:29 ******/
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
/****** Object:  StoredProcedure [dbo].[ELIMINAR_USUARIO]    Script Date: 27/10/2019 22:54:29 ******/
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
/****** Object:  StoredProcedure [dbo].[LISTA_CATEGORIA]    Script Date: 27/10/2019 22:54:29 ******/
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
/****** Object:  StoredProcedure [dbo].[LISTAR_ROL]    Script Date: 27/10/2019 22:54:29 ******/
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
/****** Object:  StoredProcedure [dbo].[LISTAR_SERVICIO]    Script Date: 27/10/2019 22:54:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[LISTAR_SERVICIO]
as
begin
select s.id_servicio as[CODIGO],u.nombre as[NOMBRE],s.calificacion as[CALIFICACION],s.fecha_inicio as [FECHA-INICIO],
        s.fecha_fin as [FECHA-FIN],e.descripcion as[ESTADO],c.descripcion as[DESCRIPCION],l.Ubicacion AS[UBICACION],l.Latitud AS[LATITUD],l.Longitud AS[LONGITUD]
       

from Servicios s inner join categoria c
on s.id_categoria=c.id_categoria join usuario u
on u.id=s.idusuario inner join Localizacion l 
on u.idlocalizacion=l.ID inner join estado_servicio e
on s.estado=e.id
end
GO
/****** Object:  StoredProcedure [dbo].[LISTAR_SERVICIO_CALIFICACION]    Script Date: 27/10/2019 22:54:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[LISTAR_SERVICIO_CALIFICACION]

as
begin
select s.id_servicio as[CODIGO],u.nombre as[NOMBRE],s.calificacion as[CALIFICACION],s.fecha_inicio as [FECHA-INICIO],
        s.fecha_fin as [FECHA-FIN],e.descripcion as[ESTADO],c.descripcion as[DESCRIPCION],l.Ubicacion AS[UBICACION],l.Latitud AS[LATITUD],l.Longitud AS[LONGITUD]
       

from Servicios s inner join categoria c
on s.id_categoria=c.id_categoria join usuario u
on u.id=s.idusuario inner join Localizacion l 
on u.idlocalizacion=l.ID inner join estado_servicio e
on s.estado=e.id
	ORDER BY s.calificacion DESC
end
GO
/****** Object:  StoredProcedure [dbo].[LISTAR_SERVICIO_RECIENTE]    Script Date: 27/10/2019 22:54:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[LISTAR_SERVICIO_RECIENTE]

as
begin
select s.id_servicio as[CODIGO],u.nombre as[NOMBRE],s.calificacion as[CALIFICACION],s.fecha_inicio as [FECHA-INICIO],
        s.fecha_fin as [FECHA-FIN],e.descripcion as[ESTADO],c.descripcion as[DESCRIPCION],l.Ubicacion AS[UBICACION],l.Latitud AS[LATITUD],l.Longitud AS[LONGITUD]
       

from Servicios s inner join categoria c
on s.id_categoria=c.id_categoria join usuario u
on u.id=s.idusuario inner join Localizacion l 
on u.idlocalizacion=l.ID inner join estado_servicio e
on s.estado=e.id
	ORDER BY s.id_servicio DESC
end
GO
/****** Object:  StoredProcedure [dbo].[LISTAR_UBICACION]    Script Date: 27/10/2019 22:54:29 ******/
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
/****** Object:  StoredProcedure [dbo].[LISTAR_USUARIO]    Script Date: 27/10/2019 22:54:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[LISTAR_USUARIO]
as
begin
select u.id as[CODIGO],u.nombre as[NOMBRE],u.email as [CORREO],u.password as [PASSWORD],u.telefono as [TELEFONO],u.Activo,u.eliminado,u.fecha as [FECHA] ,r.nombre AS [ROL],
       l.Ubicacion as[UBICACION],l.Latitud as[LATITUD],l.Longitud as[LONGITUD]

from usuario u inner join rol r
on u.idRol=r.id inner join Localizacion l
on u.idLocalizacion=l.id
end
GO
/****** Object:  StoredProcedure [dbo].[LOGIN_USUARIO]    Script Date: 27/10/2019 22:54:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[LOGIN_USUARIO]
@Usuario varchar(50),
@Contraseña varchar(20)
as
begin 
        declare @mensaje varchar(25),@Tipo varchar(20),@nombre varchar(50);
		if exists(SELECT email,password FROM usuario where password=@Contraseña and email=@Usuario)
		begin
		   set @Tipo=(SELECT r.nombre FROM rol r inner join usuario u on r.id=u.idRol
		   where password=@Contraseña and email=@Usuario)

		   set @nombre=(select u.nombre from usuario u
		       where password=@Contraseña and email=@Usuario)
		   if(@Tipo='Socio')
		   begin
		   
		   set @mensaje='BIENVENIDO SOCIO'	
		  	   
		   select @mensaje as Login,@Tipo as Rol,@nombre as Nombre
		   
		   end
		   else if(@Tipo='Administrador')
		   begin

		   set @mensaje='BIENVENIDO ADMINISTRADOR'
		   select @mensaje as Login,@Tipo as Rol,@nombre as Nombre
		   end
		   else if(@Tipo='Cliente')
		   begin
		   set @mensaje='BIENVENIDO CLIENTE'
		   select @mensaje as Login,@Tipo as Rol,@nombre as Nombre
		   end
		   END
		   else BEGIN
		     set @mensaje='EL USUARIO O CONTRASEÑA NO EXISTEN'
			 select @mensaje as MENSAJE
		
		end

end
GO
/****** Object:  StoredProcedure [dbo].[MODIFICAR_SERVICIO]    Script Date: 27/10/2019 22:54:29 ******/
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
@estado int,
@idcategoria int,
@localizacion int

as
BEGIN
UPDATE Servicios
SET idusuario=@idusuario,descripcion=@descripcion,calificacion=@calificacion ,fecha_inicio=@fecha_inicio ,fecha_fin=@fecha_fin,estado=@estado,id_categoria=@idcategoria 
,idLocalizacion=@localizacion
WHERE id_servicio =@ID
END
GO
/****** Object:  StoredProcedure [dbo].[MODIFICAR_USUARIO]    Script Date: 27/10/2019 22:54:29 ******/
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
@localizacion int

as
BEGIN
UPDATE usuario
SET nombre=@nombre,email=@email,password=@Contraseña,telefono=@telefono,Activo=@Activo,eliminado=@Eliminado ,fecha=@fecha ,idRol=@rol ,idLocalizacion=@localizacion
WHERE id =@id
END
GO
/****** Object:  StoredProcedure [dbo].[PublicarServicios]    Script Date: 27/10/2019 22:54:29 ******/
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
/****** Object:  StoredProcedure [dbo].[REGISTRAR_SERVICIO]    Script Date: 27/10/2019 22:54:29 ******/
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
@estado int,
@idcategoria int,
@localizacion int
)
as
begin
DECLARE @ID INT;
INSERT INTO Servicios(idusuario,descripcion,calificacion,fecha_inicio,fecha_fin,estado,id_categoria,idLocalizacion) VALUES(
@idusuario,@descripcion,@calificacion,@fecha_inicio,@fecha_fin,@estado,@idcategoria,@localizacion) 
SELECT @ID=id_servicio FROM Servicios
SET @ID =(SELECT SCOPE_IDENTITY())
end
GO
/****** Object:  StoredProcedure [dbo].[REGISTRAR_USUARIO]    Script Date: 27/10/2019 22:54:29 ******/
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
@localizacion int
)
as
  declare @mensaje varchar(50),@tel varchar(50);       
    if exists(Select * from usuario where email=@email)   
	        
	begin	       
		   set @mensaje='Ya existe este Usuario'+' '+@email		  
		   
		   select @mensaje as Mensaje,@activo as Conectado		   
	  return 
	end
	else if exists(Select * from usuario where telefono=@telefono)
	begin
	      set @mensaje='Ya existe este Telefono'+' '+str(@telefono)		  
		   
		   select @mensaje as Mensaje,@activo as Conectado	
	return
	end

begin
DECLARE @ID INT,@Tex varchar(max);
INSERT INTO usuario(nombre,email,password,Activo,eliminado,fecha,idRol,idLocalizacion,telefono) VALUES(@nombre,
@email,@contraseña,@Activo,@Eliminado,@fecha,@rol,@localizacion,@telefono) 
SELECT @ID=id FROM usuario 
SET @ID =(SELECT SCOPE_IDENTITY())
  set @Tex='Registrado Correctamente'
  select @Tex as Mensaje 
end
GO
/****** Object:  StoredProcedure [dbo].[ServiciosXubicacion]    Script Date: 27/10/2019 22:54:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[ServiciosXubicacion]
(@ubicacion int)

as
begin    
select s.id_servicio as[CODIGO],u.nombre as[NOMBRE],s.calificacion as[CALIFICACION],s.fecha_inicio as [FECHA-INICIO],
        s.fecha_fin as [FECHA-FIN],e.descripcion as[ESTADO],c.descripcion as[DESCRIPCION],l.Ubicacion AS[UBICACION],l.Latitud AS[LATITUD],l.Longitud AS[LONGITUD]
       

from Servicios s inner join categoria c
on s.id_categoria=c.id_categoria join usuario u
on u.id=s.idusuario inner join Localizacion l 
on u.idlocalizacion=l.ID inner join estado_servicio e
on s.estado=e.id
	 where s.idLocalizacion=@ubicacion	 	  
end
GO
/****** Object:  StoredProcedure [dbo].[VALIDAR_EMAIL]    Script Date: 27/10/2019 22:54:29 ******/
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
/****** Object:  StoredProcedure [dbo].[VALIDAR_TELEFONO]    Script Date: 27/10/2019 22:54:29 ******/
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
ALTER DATABASE [BD_PROYECTO] SET  READ_WRITE 
GO
