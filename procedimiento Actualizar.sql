ALTER PROCEDURE [spActualizar]
@ID INT,
@NOMBRE VARCHAR(50),
@APELLIDO VARCHAR(50),
@NUMERO_LICENCIA INT,
@NUMERO_PLACA INT,
@TIPO_VEHICULO VARCHAR(50),
@COLOR VARCHAR(50),
@HORA_ENTRADA varchar(10),
@HORAS_ESTACIONADO INT,
@TARIFA DECIMAL(6,2)
AS
BEGIN
	--DECLARE @IDENTIFICADOR INT = IDENT_CURRENT('ENCARGADO');
	--DECLARE @CANTIDAD_VEHICULOS INT;
	--DECLARE @TOTAL_DINERO DECIMAL(6,2) = 1;
	--SELECT @CANTIDAD_VEHICULOS = IDENT_CURRENT('ENCARGADO');
	--SELECT @TOTAL_DINERO = @TOTAL_DINERO +  @TARIFA;
	--SELECT @IDENTIFICADOR = @IDENTIFICADOR + 1;
	--DECLARE @IDENCARGADO = SELECT 
	
	UPDATE ENCARGADO
	SET NOMBRES = @NOMBRE,
		APELLIDOS =@APELLIDO,
		NUMERO_LICENCIA = @NUMERO_LICENCIA 
	WHERE ID_ENCARGADO = @ID;
	

	UPDATE VEHICULO
	SET TIPO_VEHICULO = @TIPO_VEHICULO,
		NUMERO_PLACA = @NUMERO_PLACA,
		COLOR = @COLOR 
	WHERE ID_VEHICULO = @ID
	

	--INSERT INTO FLUJO_EFECTIVO(CANTIDAD_VEHICULOS_INGRESADOS, TOTAL_DINERO)
	--VALUES(@CANTIDAD_VEHICULOS, @TOTAL_DINERO);
	
	UPDATE  TARIFA
	SET CANTIDAD = @TARIFA
	WHERE ID_TARIFA = @ID
	 

	--DECLARE @FLUJOVAR INT = IDENT_CURRENT('FLUJO_EFECTIVO');
	--DECLARE @TARIFAVAR INT = IDENT_CURRENT('TARIFA');

	UPDATE  DETALLE_ESTACIONAMIENTO
	SET HORA_ENTRADA = @HORA_ENTRADA,
		CANTIDAD_HORAS = @HORAS_ESTACIONADO
	WHERE ID_DETALLE_ESTACIONAMIENTO = @ID
	/*

	DECLARE @ENCARGADO_VAR INT = IDENT_CURRENT('ENCARGADO');
	DECLARE @SESION_VAR INT = IDENT_CURRENT('SESION');
	DECLARE @DETALLE_VAR INT = IDENT_CURRENT('DETALLE_ESTACIONAMIENTO');
	DECLARE @VEHICULO_VAR INT = IDENT_CURRENT('VEHICULO');
	INSERT INTO REGISTRAR_VEHICULO(ID_ENCARGADO, ID_SESION, ID_DETALLE_ESTACIONAMIENTO, ID_VEHICULO)
	VALUES(@ENCARGADO_VAR,@SESION_VAR, @DETALLE_VAR,@VEHICULO_VAR);
	*/
	
					
END



/*
select * from REGISTRAR_VEHICULO
select * from DETALLE_ESTACIONAMIENTO
*/
--sesion no esta reciviendo paramentros
--registrar vehiculo
