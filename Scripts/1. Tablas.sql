--CREATE DATABASE Ventas
--GO

CREATE TABLE [Usuario](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombres] [nvarchar](100) NOT NULL,
	[Apellidos] [nvarchar](100) NOT NULL,	
	[UserName] [nvarchar](50) NOT NULL,
	[Contraseña] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Estado] [int] NOT NULL,
 CONSTRAINT [PK_Cobranzas.Usuario] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
))
GO

CREATE TABLE [Formulario](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](100) NULL,	
	[Orden] [int] NOT NULL,
	[FormularioParentId] [int] NULL,
	[Estado] [int] NOT NULL,
 CONSTRAINT [PK_Cobranzas.Formulario] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
))
GO

ALTER TABLE [Formulario]  WITH CHECK ADD  CONSTRAINT [FK_Formulario_Formulario] FOREIGN KEY([FormularioParentId])
REFERENCES [Formulario] ([Id])
GO

ALTER TABLE [Formulario] CHECK CONSTRAINT [FK_Formulario_Formulario]
GO

CREATE TABLE [Rol](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](100) NOT NULL,
	[Estado] [int] NOT NULL,
 CONSTRAINT [PK_Cobranzas.Rol] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
))
GO

CREATE TABLE [RolUsuario](
	[UsuarioId] [int] NOT NULL,
	[RolId] [int] NOT NULL
 CONSTRAINT [PK_Cobranzas.RolUsuario] PRIMARY KEY CLUSTERED 
(
	[UsuarioId] ASC,
	[RolId] ASC
))ON [PRIMARY]
GO

ALTER TABLE [RolUsuario]  WITH CHECK ADD  CONSTRAINT [FK_RolUsuario_Rol] FOREIGN KEY([RolId])
REFERENCES [Rol] ([Id])
GO

ALTER TABLE [RolUsuario] CHECK CONSTRAINT [FK_RolUsuario_Rol]
GO

ALTER TABLE [RolUsuario]  WITH CHECK ADD  CONSTRAINT [FK_RolUsuario_Usuario] FOREIGN KEY([UsuarioId])
REFERENCES [Usuario] ([Id])
GO

ALTER TABLE [RolUsuario] CHECK CONSTRAINT [FK_RolUsuario_Usuario]
GO

CREATE TABLE [PermisoRol](	
	[FormularioId] [int] NOT NULL,	
	[RolId] [int] NOT NULL
 CONSTRAINT [PK_Cobranzas.PermisoRol] PRIMARY KEY CLUSTERED 
(
	[FormularioId] ASC,
	[RolId] ASC
))ON [PRIMARY]

GO

ALTER TABLE [PermisoRol]  WITH CHECK ADD  CONSTRAINT [FK_PermisoRol_Formulario] FOREIGN KEY([FormularioId])
REFERENCES [Formulario] ([Id])
GO

ALTER TABLE [PermisoRol] CHECK CONSTRAINT [FK_PermisoRol_Formulario]
GO

ALTER TABLE [PermisoRol]  WITH CHECK ADD  CONSTRAINT [FK_PermisoRol_Rol] FOREIGN KEY([RolId])
REFERENCES [Rol] ([Id])
GO

ALTER TABLE [PermisoRol] CHECK CONSTRAINT [FK_PermisoRol_Rol]
GO

CREATE TABLE [CabeceraCarga](
	[Id] int IDENTITY(1,1) NOT NULL,
	[TipoArchivo] char(1) NOT NULL,
	[FechaArchivo] datetime NOT NULL,
	[FechaCargaIni] datetime NOT NULL,
	[FechaCargaFin] datetime NULL,
	[EstadoCarga] int NOT NULL,
 CONSTRAINT [PK_CabeceraCarga] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)) ON [PRIMARY]
GO

CREATE TABLE [SaldosVencidoCyber](
	CabeceraCargaId int NOT NULL,
	Secuencia int NOT NULL,
	Informacional DateTime NOT NULL,
	NroCuenta nvarchar(15) NOT NULL,
	SituacionCuenta int NOT NULL,
	DiaVencimiento int NULL,
	MontoMora decimal(12, 2) NOT NULL,
	SaldoDeuda decimal(12, 2) NOT NULL,
	Capital decimal(12, 2) NOT NULL,
	MontoAcelerado  decimal(12, 2) NULL,
	FechaAceleracion datetime NULL,
	DiasMora int NULL,
	EtapaMora int NULL,
	InicioMora datetime NOT NULL,
	HabitoPago nvarchar(3) NULL,
	ColaActual nvarchar(6) NOT NULL,
	Agencia nvarchar(15) NULL,
	FechaAsignacion datetime NULL,
	Behavior int NULL,
	Bar int NULL,
	CodSubProducto nvarchar(4) NULL,
	Ubigeo nvarchar(8) NULL,
	Pan nvarchar(16) NULL,
	Celular nvarchar(16) NULL,
	FonoCasa nvarchar(16) NULL,
	TipoDoc int NULL, 
	NroDoc nvarchar(20) NULL, 
	CondicionCliente int NULL,
	Empleado bit NOT NULL,
	FechaProxContacto datetime NULL,
	UltimaFechaPago datetime NULL,
	UltimoMontoPagado decimal(12, 2) NULL,
	Venc1 datetime NULL,
	Venc2 datetime NULL,
	Venc3 datetime NULL,
	Venc4 datetime NULL,
	Cuota1 decimal(12, 2) NULL,
	Cuota2 decimal(12, 2) NULL,
	Cuota3 decimal(12, 2) NULL,
	Cuota4 decimal(12, 2) NULL,
	SaldoSuperCash decimal(12, 2) NULL,
	Cola3 nvarchar(4) NULL,
	FechaRefinanciacion datetime NULL,
	Cedente nvarchar(4) NULL,
 CONSTRAINT [PK_SaldosVencidoCyber] PRIMARY KEY CLUSTERED 
(
	[CabeceraCargaId] ASC,
	[Secuencia] ASC
)) ON [PRIMARY]
GO

ALTER TABLE [SaldosVencidoCyber]  WITH CHECK ADD  CONSTRAINT [FK_SaldosVencidoCyber_CabeceraCarga] FOREIGN KEY([CabeceraCargaId])
REFERENCES [CabeceraCarga] ([Id])
GO

ALTER TABLE [SaldosVencidoCyber] CHECK CONSTRAINT [FK_SaldosVencidoCyber_CabeceraCarga]
GO

CREATE INDEX IDX_NroCuenta ON [SaldosVencidoCyber] (NroCuenta)
GO

CREATE INDEX IDX_Informacional ON [SaldosVencidoCyber] (Informacional)
GO

CREATE TABLE [Riad](
	CabeceraCargaId int NOT NULL,
	Secuencia int NOT NULL,
	Fecha DATETIME NOT NULL,
	NroCuenta nvarchar(12) NOT NULL,
	CSbs nvarchar(27) NULL,
	TipoDoc int NOT NULL,
	NroDoc nvarchar(20) NOT NULL, 
	Nombres nvarchar(50) NOT NULL,
	SubProducto nvarchar(3) NOT NULL,
	DiasMora int NOT NULL,
	EstadoCuenta nvarchar(2) NULL,
	CatProducto nvarchar(1) NULL,
	CatInterna nvarchar(1) NULL,
	CatSbs nvarchar(1) NULL,
	CatExterna nvarchar(1) NULL,
	Capital decimal(12, 2) NULL,
	ProvAlineada decimal(12, 2) NULL,
	ProvInterna decimal(12, 2) NULL,
	TipoCredito nvarchar(1) NOT NULL,
	Tienda int NOT NULL,
	FolioErrado nvarchar(7) NULL,
	EsTarjetaCredito bit,
 CONSTRAINT [PK_Riad] PRIMARY KEY CLUSTERED 
(
	[CabeceraCargaId] ASC,
	[Secuencia] ASC
)) ON [PRIMARY]
GO

ALTER TABLE [Riad]  WITH CHECK ADD  CONSTRAINT [FK_Riad_CabeceraCarga] FOREIGN KEY([CabeceraCargaId])
REFERENCES [CabeceraCarga] ([Id])
GO

ALTER TABLE [Riad] CHECK CONSTRAINT [FK_Riad_CabeceraCarga]
GO

CREATE INDEX IDX_NroCuenta ON [Riad] (NroCuenta)
GO

CREATE INDEX IDX_Fecha ON [Riad] (Fecha)
GO

CREATE INDEX IDX_SubProducto ON [Riad] (SubProducto)
GO

CREATE NONCLUSTERED INDEX [IDX_FechaTarjetaDia]
ON [Riad] ([Fecha],[EsTarjetaCredito], [DiasMora])
INCLUDE ([NroCuenta],[Capital])
GO

CREATE TABLE [ContencionHistorico](
	[Fecha] datetime NOT NULL,
	[Rango] INT NOT NULL,
	[Porcentaje] decimal(10, 7) NOT NULL,
 CONSTRAINT [PK_ContencionHistorico] PRIMARY KEY CLUSTERED 
(
	[Fecha] ASC,
	[Rango] ASC
)) ON [PRIMARY]
GO

CREATE TABLE [TampJ](
	CabeceraCargaId int NOT NULL,
	Secuencia int NOT NULL,
	CodGesto nvarchar(8) NULL,
	NroCuenta nvarchar(12) NOT NULL,
	Dias int NOT NULL,
	NumeroTarjeta nvarchar(16) NULL,
	SaldoDeuda decimal(14, 2) NOT NULL,
	MontoProtesto decimal(14, 2) NOT NULL,
	Capital decimal(14, 2) NOT NULL,
	InteresJudicial decimal(14, 2) NOT NULL,
	CargoJudicial decimal(14, 2) NOT NULL,
	InteresMorator decimal(14, 2) NOT NULL,
	CargoCobranza decimal(14, 2) NOT NULL,
	Situacion int NULL,
	FechaProtes DATETIME NULL,
	FechaCastig DATETIME NULL,
	FechaAsigna DATETIME NULL,
	TipoDocumento int NULL,
	NroDocumento nvarchar(25) NOT NULL,
	DireccionParticular nvarchar(80) NULL,
	DistritoParticular nvarchar(20) NULL,
	UbigeoParticular nvarchar(80) NULL,
	DireccionComercial nvarchar(80) NULL,
	DistritoComercial nvarchar(80) NULL,
	Ubigeo nvarchar(6) NULL,
	Celular nvarchar(13) NULL,
	TelfParticular nvarchar(13) NULL,
	TelfComercial nvarchar(13) NULL,
	CorreoParticular nvarchar(50) NULL,
	CorreoComercial nvarchar(50) NULL,
	InformacionAl DATETIME NOT NULL,
	Col1 nvarchar(4) NULL,
	Col2 nvarchar(4) NULL,
	NombreCompleto nvarchar(80) NULL,
	NombreEmpresa nvarchar(80) NULL,
	FechaUltimo DATETIME NULL,
	MontoUltimoPago decimal(14, 2) NULL,
	InteresCompens decimal(14, 2) NULL,
	DeptoParticular nvarchar(20) NULL,
	ProvinciaParticular nvarchar(20) NULL,
	DeptoComercial nvarchar(20) NULL,
	ProvinciaComercial nvarchar(20) NULL,
 CONSTRAINT [PK_TampJ] PRIMARY KEY CLUSTERED 
(
	[CabeceraCargaId] ASC,
	[Secuencia] ASC
)) ON [PRIMARY]
GO

ALTER TABLE [TampJ]  WITH CHECK ADD  CONSTRAINT [FK_TampJ_CabeceraCarga] FOREIGN KEY([CabeceraCargaId])
REFERENCES [CabeceraCarga] ([Id])
GO

ALTER TABLE [TampJ] CHECK CONSTRAINT [FK_TampJ_CabeceraCarga]
GO

CREATE INDEX IDX_NroCuenta ON [TampJ] (NroCuenta)
GO

CREATE INDEX IDX_InformacionAl ON [TampJ] (InformacionAl)
GO

CREATE TABLE [PagosVencidos](
	CabeceraCargaId int NOT NULL,
	Secuencia int NOT NULL,
	Fecha date NULL,
	Hora time NULL,
	NroCuentaOrigen nvarchar(12) NOT NULL,
	NroCreditoVencido nvarchar(10) NOT NULL,
	Moneda nvarchar(7) NOT NULL,
	[Local] nvarchar(3) NULL,
	Terminal nvarchar(8) NULL,
	CodigoPago nvarchar(10) NULL,
	Descripcion nvarchar(50) NULL,
	Monto decimal(14, 2) NULL,
	FechaRegularizacion date NOT NULL,
 CONSTRAINT [PK_PagosVencidos] PRIMARY KEY CLUSTERED 
(
	[CabeceraCargaId] ASC,
	[Secuencia] ASC
)) ON [PRIMARY]
GO

ALTER TABLE [PagosVencidos]  WITH CHECK ADD  CONSTRAINT [FK_PagosVencidos_CabeceraCarga] FOREIGN KEY([CabeceraCargaId])
REFERENCES [CabeceraCarga] ([Id])
GO

ALTER TABLE [PagosVencidos] CHECK CONSTRAINT [FK_PagosVencidos_CabeceraCarga]
GO

CREATE INDEX IDX_NroCuentaOrigen ON [PagosVencidos] (NroCuentaOrigen)
GO

CREATE TABLE [TipoEstudio](
	Id int IDENTITY(1,1) NOT NULL,
	Nombre varchar(10) NOT NULL,
 CONSTRAINT [PK_TipoEstudio] PRIMARY KEY CLUSTERED 
(
	Id ASC
)) ON [PRIMARY]
GO

CREATE TABLE [RegionEstudio](
	Id int IDENTITY(1,1) NOT NULL,
	Nombre varchar(10) NOT NULL,
 CONSTRAINT [PK_RegionEstudio] PRIMARY KEY CLUSTERED 
(
	Id ASC
)) ON [PRIMARY]
GO

CREATE TABLE [Estudio](
	Codigo varchar(10) NOT NULL,
	Nombre varchar(50) NOT NULL,
	TipoEstudio int NOT NULL,
	CodigoAuxiliar varchar(12) NOT NULL,	
	Region int NOT NULL,
	Grupo char(1) NULL,
	Estado int NULL,
 CONSTRAINT [PK_Estudio] PRIMARY KEY CLUSTERED 
(
	Codigo ASC
)) ON [PRIMARY]
GO

ALTER TABLE [Estudio]  WITH CHECK ADD  CONSTRAINT [FK_Estudio_RegionEstudio] FOREIGN KEY([Region])
REFERENCES [RegionEstudio] ([Id])
GO

ALTER TABLE [Estudio] CHECK CONSTRAINT [FK_Estudio_RegionEstudio]
GO

ALTER TABLE [Estudio]  WITH CHECK ADD  CONSTRAINT [FK_Estudio_TipoEstudio] FOREIGN KEY([TipoEstudio])
REFERENCES [TipoEstudio] ([Id])
GO

ALTER TABLE [Estudio] CHECK CONSTRAINT [FK_Estudio_TipoEstudio]
GO

CREATE TABLE [CastigoHc](
	CabeceraCargaId int NOT NULL,
	Secuencia int NOT NULL,
	NroCuenta nvarchar(12) NOT NULL,
	Sit nvarchar(3) NULL,
	FechaCastigo date NOT NULL,
	Considerar bit NULL,	
 CONSTRAINT [PK_CastigoHc] PRIMARY KEY CLUSTERED 
(
	[CabeceraCargaId] ASC,
	[Secuencia] ASC
)) ON [PRIMARY]
GO

ALTER TABLE [CastigoHc]  WITH CHECK ADD  CONSTRAINT [FK_CastigoHc_CabeceraCarga] FOREIGN KEY([CabeceraCargaId])
REFERENCES [CabeceraCarga] ([Id])
GO

ALTER TABLE [CastigoHc] CHECK CONSTRAINT [FK_CastigoHc_CabeceraCarga]
GO

CREATE INDEX IDX_NroCuenta ON [CastigoHc] (NroCuenta)
GO

CREATE TABLE [EstudioMeta](
	Fecha date NOT NULL,
	Codigo varchar(10) NOT NULL,
	Meta decimal(14, 2) NULL	
 CONSTRAINT [PK_EstudioMeta] PRIMARY KEY CLUSTERED 
(
	Fecha ASC,
	Codigo ASC
)) ON [PRIMARY]
GO

ALTER TABLE [EstudioMeta]  WITH CHECK ADD  CONSTRAINT [FK_EstudioMeta_Estudio] FOREIGN KEY([Codigo])
REFERENCES [Estudio] ([Codigo])
GO

ALTER TABLE [EstudioMeta] CHECK CONSTRAINT [FK_EstudioMeta_Estudio]
GO

CREATE TABLE [Refinanciados](
	CabeceraCargaId int NOT NULL,
	Secuencia int NOT NULL,
	EstadoActual nvarchar(15) NOT NULL,
	SaldoCapital decimal(14, 2) NOT NULL,
	FechaOperacion date NOT NULL
 CONSTRAINT [PK_Refinanciados] PRIMARY KEY CLUSTERED 
(
	[CabeceraCargaId] ASC,
	[Secuencia] ASC
)) ON [PRIMARY]
GO

ALTER TABLE [Refinanciados]  WITH CHECK ADD  CONSTRAINT [FK_Refinanciados_CabeceraCarga] FOREIGN KEY([CabeceraCargaId])
REFERENCES [CabeceraCarga] ([Id])
GO

ALTER TABLE [Refinanciados] CHECK CONSTRAINT [FK_Refinanciados_CabeceraCarga]
GO

CREATE NONCLUSTERED INDEX [IDX_FechaOperacionEstado]
ON [Refinanciados] (FechaOperacion, EstadoActual)
GO

CREATE TABLE [MetaRefinanciado](
	FechaMeta date NOT NULL,
	Meta decimal(14, 2) NOT NULL,
	IntervaloInferior decimal(4, 2) NULL,
	IntervaloSuperior decimal(4, 2) NULL,
	IntervaloSeleccionado decimal(4, 2) NULL
 CONSTRAINT [PK_MetaRefinanciado] PRIMARY KEY CLUSTERED 
(
	FechaMeta ASC
)) ON [PRIMARY]
GO

CREATE TABLE [Departamento](
	Id int IDENTITY(1,1) NOT NULL,
	Nombre varchar(20) NOT NULL,
 CONSTRAINT [PK_Departamento] PRIMARY KEY CLUSTERED 
(
	Id ASC
)) ON [PRIMARY]
GO

CREATE TABLE [Provincia](
	Id int IDENTITY(1,1) NOT NULL,
	DepartamentoId int NOT NULL,
	Nombre varchar(25) NOT NULL,
 CONSTRAINT [PK_Provincia] PRIMARY KEY CLUSTERED 
(
	Id ASC
)) ON [PRIMARY]
GO

ALTER TABLE [Provincia]  WITH CHECK ADD  CONSTRAINT [FK_Provincia_Departamento] FOREIGN KEY([DepartamentoId])
REFERENCES [Departamento] ([Id])
GO

ALTER TABLE [Provincia] CHECK CONSTRAINT [FK_Provincia_Departamento]
GO

CREATE TABLE [Distrito](
	Id int IDENTITY(1,1) NOT NULL,
	ProvinciaId int NOT NULL,
	Nombre varchar(35) NOT NULL,
 CONSTRAINT [PK_Distrito] PRIMARY KEY CLUSTERED 
(
	Id ASC
)) ON [PRIMARY]
GO

ALTER TABLE [Distrito]  WITH CHECK ADD  CONSTRAINT [FK_Distrito_Provincia] FOREIGN KEY([ProvinciaId])
REFERENCES [Provincia] ([Id])
GO

ALTER TABLE [Distrito] CHECK CONSTRAINT [FK_Distrito_Provincia]
GO

CREATE TABLE [UbigeoSaldoVencido](	
	Ubigeo nvarchar(8) NOT NULL,
	DistritoId int NOT NULL
 CONSTRAINT [PK_UbigeoSaldoVencido] PRIMARY KEY CLUSTERED 
(
	Ubigeo ASC
)) ON [PRIMARY]
GO

ALTER TABLE [UbigeoSaldoVencido]  WITH CHECK ADD  CONSTRAINT [FK_UbigeoSaldoVencido_Distrito] FOREIGN KEY([DistritoId])
REFERENCES [Distrito] ([Id])
GO

ALTER TABLE [UbigeoSaldoVencido] CHECK CONSTRAINT [FK_UbigeoSaldoVencido_Distrito]
GO

CREATE TABLE [EstudioCuentaTramo1](
	Fecha date NOT NULL,
	NroCuenta nvarchar(15) NOT NULL,
	EstudioPrimario nvarchar(10) NOT NULL,
	EstudioSecundario nvarchar(10) NULL
 CONSTRAINT [PK_EstudioCuentaTramo1] PRIMARY KEY CLUSTERED 
(
	Fecha ASC,
	NroCuenta ASC
)) ON [PRIMARY]
GO

--CREATE TABLE [EstudioRangoTramo1](
--	Fecha date NOT NULL,
--	EstudioPrimario nvarchar(10) NOT NULL,
--	Rango int NOT NULL,
--	Meta decimal(14, 2) NOT NULL
-- CONSTRAINT [PK_EstudioRangoTramo1] PRIMARY KEY CLUSTERED 
--(
--	Fecha ASC,
--	EstudioPrimario ASC
--)) ON [PRIMARY]
--GO

CREATE TABLE [EstudioDistritoTramo2](
	Fecha date NOT NULL,
	Estudio nvarchar(20) NOT NULL,
	DistritoId int NOT NULL,
	Meta decimal(14, 4) NOT NULL
 CONSTRAINT [PK_EstudioDistritoTramo2] PRIMARY KEY CLUSTERED 
(
	Fecha ASC,
	DistritoId ASC
)) ON [PRIMARY]
GO

ALTER TABLE [EstudioDistritoTramo2]  WITH CHECK ADD  CONSTRAINT [FK_EstudioDistritoTramo2_Distrito] FOREIGN KEY([DistritoId])
REFERENCES [Distrito] ([Id])
GO

ALTER TABLE [EstudioDistritoTramo2] CHECK CONSTRAINT [FK_EstudioDistritoTramo2_Distrito]
GO

CREATE TABLE [EstudioRangoTramo3](
	Fecha date NOT NULL,
	Estudio nvarchar(20) NOT NULL,
	Rango int NOT NULL,
	Meta decimal(14, 4) NOT NULL
 CONSTRAINT [PK_EstudioRangoTramo3] PRIMARY KEY CLUSTERED 
(
	Fecha ASC,
	Estudio ASC,
	Rango ASC
)) ON [PRIMARY]
GO

CREATE TABLE [Zona](
	Id int NOT NULL,
	Descripcion varchar(50) NOT NULL
CONSTRAINT [PK_Cobranzas.Zona] PRIMARY KEY (Id)
) ON [PRIMARY]
GO

CREATE TABLE [TipoZona](
	Id int NOT NULL,
	ZonaId int NOT NULL,
	Descripcion varchar(50) NOT NULL,
	Grupo int NULL
CONSTRAINT [PK_Cobranzas.TipoZona] PRIMARY KEY (Id)
) ON [PRIMARY]
GO

ALTER TABLE [TipoZona]  WITH CHECK ADD  CONSTRAINT [FK_TipoZona_Zona] FOREIGN KEY([ZonaId])
REFERENCES [Zona] ([Id])
GO

ALTER TABLE [TipoZona] CHECK CONSTRAINT [FK_TipoZona_Zona]
GO

CREATE TABLE [UbigeoTramo45](
	[CabeceraCargaId] [int] NOT NULL,
	[Secuencia] [int] NOT NULL,
	[Fecha] [datetime] NOT NULL,
	[Ubigeo] [nchar](6) NOT NULL,
	[TipoZonaId] [int] NOT NULL,
	[EsCore] [bit] NULL,
 CONSTRAINT [PK_UbigeoTramo45] PRIMARY KEY CLUSTERED 
(
	[CabeceraCargaId] ASC,
	[Secuencia] ASC
)) ON [PRIMARY]
GO

ALTER TABLE [UbigeoTramo45]  WITH CHECK ADD  CONSTRAINT [FK_UbigeoTramo45_TipoZona] FOREIGN KEY([TipoZonaId])
REFERENCES [TipoZona] ([Id])
GO

ALTER TABLE [UbigeoTramo45] CHECK CONSTRAINT [FK_UbigeoTramo45_TipoZona]
GO

CREATE TABLE [EstudioCuentaTramo45](
	Fecha date NOT NULL,
	NroCuenta nvarchar(15) NOT NULL,
	Estudio nvarchar(20) NOT NULL
 CONSTRAINT [PK_EstudioCuentaTramo45] PRIMARY KEY CLUSTERED 
(
	Fecha ASC,
	NroCuenta ASC
)) ON [PRIMARY]
GO

CREATE TABLE [EstudioMetaTramo](
	Fecha date NOT NULL,
	Estudio nvarchar(20) NOT NULL,
	Tramo int NOT NULL,
	Meta decimal(14, 4) NOT NULL
 CONSTRAINT [PK_EstudioMetaTramo] PRIMARY KEY CLUSTERED 
(
	Fecha ASC,
	Estudio ASC
)) ON [PRIMARY]
GO