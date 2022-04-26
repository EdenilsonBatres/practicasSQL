CREATE PROCEDURE spDINEROTOTAL
@PARAMETRO INT
AS
BEGIN
	--select COUNT(ID_VEHICULO) from VEHICULO
	if(@PARAMETRO = 1)
	begin
			SELECT SUM(TOTAL_DINERO) AS TOTAL_DINERO, COUNT(CANTIDAD_VEHICULOS_INGRESADOS) AS TOTAL_VEHICULOS
				FROM FLUJO_EFECTIVO F
								   INNER JOIN FECHA_REGISTRO FR ON ( F.ID_FECHA_REGISTRO = FR.ID_FECHA_REGISTRO)
				WHERE CONVERT(varchar, FECHA, 112) = CONVERT(varchar, GETDATE(), 112) ;
	end

	else if(@PARAMETRO = 2)
	begin
		SELECT SUM(TOTAL_DINERO) AS TOTAL_DINERO, COUNT(CANTIDAD_VEHICULOS_INGRESADOS) AS TOTAL_VEHICULOS
		FROM FLUJO_EFECTIVO F
						   INNER JOIN FECHA_REGISTRO FR ON ( F.ID_FECHA_REGISTRO = FR.ID_FECHA_REGISTRO)
		WHERE CONVERT(varchar, FECHA, 112) < 20201125 ;
	end

	ELSE IF(@PARAMETRO = 3)
	begin
		SELECT SUM(TOTAL_DINERO) AS TOTAL_DINERO, COUNT(CANTIDAD_VEHICULOS_INGRESADOS) AS TOTAL_VEHICULOS
		FROM FLUJO_EFECTIVO F
						   INNER JOIN FECHA_REGISTRO FR ON ( F.ID_FECHA_REGISTRO = FR.ID_FECHA_REGISTRO)
		WHERE CONVERT(varchar, FECHA, 112) < 20201201 ;
	end

	ELSE IF(@PARAMETRO = 4)
	begin
		SELECT SUM(TOTAL_DINERO) AS TOTAL_DINERO, COUNT(CANTIDAD_VEHICULOS_INGRESADOS) AS TOTAL_VEHICULOS
		FROM FLUJO_EFECTIVO F
						   INNER JOIN FECHA_REGISTRO FR ON ( F.ID_FECHA_REGISTRO = FR.ID_FECHA_REGISTRO)
		WHERE CONVERT(varchar, FECHA, 112) < 20211201 ;
	end


END

