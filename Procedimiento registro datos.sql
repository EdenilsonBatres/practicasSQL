CREATE PROCEDURE [spREGISTRO]
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
	
	DECLARE @CANTIDAD_VEHICULOS INT;
	DECLARE @TOTAL_DINERO DECIMAL(6,2) = 1;
	SELECT @CANTIDAD_VEHICULOS = IDENT_CURRENT('VEHICULO');

	
	SELECT @TOTAL_DINERO = @TARIFA * @HORAS_ESTACIONADO;
	
	INSERT INTO ENCARGADO(NOMBRES, APELLIDOS, NUMERO_LICENCIA) 
	VALUES (@NOMBRE, @APELLIDO, @NUMERO_LICENCIA);

	INSERT INTO VEHICULO(TIPO_VEHICULO,NUMERO_PLACA, COLOR) 
	VALUES (@TIPO_VEHICULO,@NUMERO_PLACA, @COLOR);

	INSERT INTO FECHA_REGISTRO(FECHA) VALUES(GETDATE());

	DECLARE @FECHA_VAR INT = IDENT_CURRENT('FECHA_REGISTRO');
	INSERT INTO FLUJO_EFECTIVO(CANTIDAD_VEHICULOS_INGRESADOS, TOTAL_DINERO, ID_FECHA_REGISTRO) 
	VALUES(@CANTIDAD_VEHICULOS, @TOTAL_DINERO,@FECHA_VAR);

	DECLARE @IDENTIFICADOR INT = IDENT_CURRENT('VEHICULO');

	INSERT INTO TARIFA(CANTIDAD, ID_VEHICULO) 
	VALUES (@TARIFA, @IDENTIFICADOR)

	DECLARE @FLUJOVAR INT = IDENT_CURRENT('FLUJO_EFECTIVO');
	DECLARE @TARIFAVAR INT = IDENT_CURRENT('TARIFA');
	SELECT * FROM DETALLE_ESTACIONAMIENTO

	INSERT INTO DETALLE_ESTACIONAMIENTO(HORA_ENTRADA, CANTIDAD_HORAS,ID_TARIFA, ID_FLUJO_EFECTIVO)
	VALUES (@HORA_ENTRADA, @HORAS_ESTACIONADO, @TARIFAVAR, @FLUJOVAR);

	
	DECLARE @ENCARGADO_VAR INT = IDENT_CURRENT('ENCARGADO');
	DECLARE @SESION_VAR INT = IDENT_CURRENT('SESION');
	DECLARE @DETALLE_VAR INT = IDENT_CURRENT('DETALLE_ESTACIONAMIENTO');
	DECLARE @VEHICULO_VAR INT = IDENT_CURRENT('VEHICULO');
	INSERT INTO REGISTRAR_VEHICULO(ID_ENCARGADO, ID_SESION, ID_DETALLE_ESTACIONAMIENTO, ID_VEHICULO) 
	VALUES(@ENCARGADO_VAR,@SESION_VAR, @DETALLE_VAR,@VEHICULO_VAR);

	
					
END

