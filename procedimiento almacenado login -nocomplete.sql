ALTER PROCEDURE [spOBTENER_USUARIO] @usuario varchar(50)
AS

BEGIN
	DECLARE  @usuarioObtenido varchar(50);

	SELECT USUARIO FROM NUEVO_LOGIN WHERE USUARIO = @USUARIO;
	set @usuarioObtenido = 
	print @usuarioObtenido
END

EXEC spOBTENER_USUARIO eBAT