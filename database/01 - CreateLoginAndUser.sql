USE [master]
GO
--
-- Primero hay que crear la base de datos 'DAI-Pizzas'
--

IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE [name] = N'personajesDB')
BEGIN
	PRINT 'Creando Login'
	CREATE LOGIN [personajesDB] WITH 
		PASSWORD=N'VivanLasPelis123', 
		DEFAULT_DATABASE=[PjsDB], 
		CHECK_EXPIRATION=OFF, 
		CHECK_POLICY=OFF
END
GO

USE [PjsDB]
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE [name] = N'personajesDB')
BEGIN
	PRINT 'Creando User'
	CREATE USER [personajesDB] FOR LOGIN [personajesDB]
	ALTER ROLE [db_owner] ADD MEMBER [personajesDB]
END 
GO
