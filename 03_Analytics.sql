--Auditoria: Saldos mayor a 50,000 o sean USD
SELECT 
	u.DNI,
	u.NombreCompleto,
	c.NumeroCuenta,
	c.Moneda,
	c.Saldo
FROM dbo.tbl_Cuentas AS c
INNER JOIN dbo.tbl_Usuarios AS u ON c.UsuarioID = u.ID_Usuario 
WHERE c.Saldo > 50000.00 OR c.Moneda = 'USD';
GO

--Reporte de Riesgo: Mostrar los retiros que hayan sido mayores a 500.00 ordenadas por fecha
SELECT
	U.NombreCompleto,
	U.DNI,
	T.Tipo,
	T.Monto,
	T.Fecha
FROM dbo.tbl_Transacciones AS T
INNER JOIN dbo.tbl_Cuentas AS C ON T.CuentaID = C.ID_Cuenta
INNER JOIN dbo.tbl_Usuarios AS U ON C.UsuarioID = U.ID_Usuario
WHERE T.Tipo = 'Retiro' AND T.Monto > 500.00
ORDER BY T.Fecha 

--USO DE UPDATE
--Aplicar un descuento Masivo de 5.00 a todos los usuarios

UPDATE dbo.tbl_Cuentas
SET Saldo = Saldo - 5.00
WHERE Saldo >= 5