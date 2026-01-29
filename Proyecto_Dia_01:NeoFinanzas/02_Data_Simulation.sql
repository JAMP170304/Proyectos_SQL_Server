USE db_NeoFinanzas_Core;
GO

--Usuarios
INSERT INTO dbo.tbl_Usuarios(NombreCompleto,DNI,Email,Estado)
VALUES
	('Jordan Alexander Marin Prado','71876009','jordanalexandermarinprado@hotmail.com',1),
	('Orlando Palomino Suarez','23356029','Opalomino@gmail.com',1),
	('Marleni Perez Gutierrez','40697187','Mgutierrez@hotmail.com',1);
GO

--Cuentas
INSERT INTO dbo.tbl_Cuentas(UsuarioID,NumeroCuenta,Moneda,Saldo)
VALUES
	(1,'1071876009','PEN',100.00),
	(1,'1071876008','USD',50.00),
	(2,'1023356029','PEN',3000.00);
GO

--Transacciones
INSERT INTO dbo.tbl_Transacciones(CuentaID,Tipo,Monto)
VALUES
	(1,'Deposito',1000.00),
	(3,'Deposito',1000.00),
	(1,'Retiro',500.00),
	(3,'Retiro',2500.00),
	(2,'Retiro',30.00);
GO

--PROBANDO LA INTEGRIDAD DE LOS DATOS
--Meter saldo negativo (El constraint Check lo impedira)
INSERT INTO dbo.tbl_Cuentas(UsuarioID,NumeroCuenta,Moneda,Saldo)
VALUES
	(1,'1069007187','PEN',-5000.00);


SELECT * FROM dbo.tbl_Usuarios;
SELECT * FROM dbo.tbl_Cuentas;
SELECT * FROM dbo.tbl_Transacciones;
