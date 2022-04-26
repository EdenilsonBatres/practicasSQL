--procedimiento almacenado
CREATE PROCEDURE [spNUEVO_LOGIN] @Nombre varchar(50), @apellido varchar(50), @correo varchar(50), @pass varchar(50), @usuario varchar (50)
AS
BEGIN
		
		INSERT INTO NUEVO_LOGIN(NOMBRE, APELLIDO, CORREO, PASS, USUARIO)
		VALUES (@Nombre, @apellido, @correo, @pass, @usuario);

		
END

