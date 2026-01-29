--- PROYECTO 1 DÍA 1: NEOFINANZAS CORE SYSTEM
--Objetivo: Crear una estructura de base de datos de una billetera digital que soporte multiples monedas,estado de cuenta y prevención de fraudes.

--CREACIÓN DE LA BASE DE DATOS
CREATE DATABASE db_NeoFinanzas_Core
ON PRIMARY
(
NAME = 'db_NeoFinanzas_Core_data',
FILENAME = 'C:\SQL_PROYECTOS\db_NeoFinanzas_Core_data.mdf',
SIZE = 10MB,
MAXSIZE = 100MB,
FILEGROWTH = 1MB
)

LOG ON
(
NAME = 'db_NeoFinanzas_Core_log',
FILENAME = 'C:\SQL_PROYECTOS\db_NeoFinanzas_Core_log.ldf',
SIZE = 5MB,
MAXSIZE = 50MB,
FILEGROWTH = 1MB
);
GO

USE db_NeoFinanzas_Core;
GO

--CREACION DE LA TABLA DE USUARIOS
CREATE TABLE tbl_Usuarios
(
ID_Usuario INT IDENTITY(1,1), --PK
NombreCompleto NVARCHAR(100),
DNI CHAR(9), --Unico
Email NVARCHAR(100),---Unico
Estado BIT NOT NULL DEFAULT 1, -- 1 "Activo" 0"No activo"

CONSTRAINT PK_ID_Usuario PRIMARY KEY(ID_Usuario),
CONSTRAINT UQ_DNI UNIQUE(DNI),
CONSTRAINT UQ_Email UNIQUE(Email),
);
GO

-- CREACIÓN DE LA TABLA CUENTAS
CREATE TABLE tbl_Cuentas
(
ID_Cuenta INT IDENTITY(1,1), --PK
UsuarioID INT,--FK
NumeroCuenta NVARCHAR(100),--Unico
Moneda CHAR(3), ---USD O PEN
Saldo MONEY,

CONSTRAINT PK_ID_Cuenta PRIMARY KEY(ID_Cuenta),
CONSTRAINT FK_UsuarioID FOREIGN KEY(UsuarioID) REFERENCES tbl_Usuarios(ID_Usuario),
CONSTRAINT UQ_NombreCuenta UNIQUE (NumeroCuenta),
CONSTRAINT Ck_saldo CHECK(Saldo >= 0)
);
GO

--CREACIÓN DE LA TABLA TRANSACCIONES
CREATE TABLE tbl_Transacciones
(
ID_Transaccion INT IDENTITY(1,1), --PK
CuentaID INT, --FK
Tipo VARCHAR(100),
Monto MONEY,-- Siempre positivo
Fecha DATE DEFAULT GETDATE(),

CONSTRAINT PK_ID_Transaccion PRIMARY KEY(ID_Transaccion),
CONSTRAINT FK_CuentaID FOREIGN KEY(CuentaID) REFERENCES tbl_Cuentas(ID_Cuenta),
CONSTRAINT CK_Monto CHECK(Monto>0)
);
GO
