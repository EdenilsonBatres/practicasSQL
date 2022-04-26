--comprovar el inicio de sesion
CREATE PROCEDURE  [spLogin]
	@usuario varchar(50),
	@pass varchar(50)
as
	begin
		select top 1 count(*) from NUEVO_LOGIN
		where NUEVO_LOGIN.USUARIO = @usuario and NUEVO_LOGIN.PASS = @pass

		DECLARE @LOGIN_VAR INT =  IDENT_CURRENT('NUEVO_LOGIN');
		INSERT INTO SESION(FECHA, ID_NUEVO_LOGIN)
		VALUES(GETDATE(), @LOGIN_VAR)
	end
	go

	