CREATE PROCEDURE [spELIMINAR]
@ID INT

AS
BEGIN
	
	
	DELETE FROM ENCARGADO WHERE ID_ENCARGADO = @ID;
	
	DELETE FROM VEHICULO  WHERE ID_VEHICULO = @ID
	
	DELETE FROM FLUJO_EFECTIVO WHERE ID_FLUJO_EFECTIVO = @ID

	DELETE FROM REGISTRAR_VEHICULO WHERE ID_REGISTRO = @ID

	DELETE FROM  TARIFA	WHERE ID_TARIFA = @ID
	 
	DELETE FROM  DETALLE_ESTACIONAMIENTO WHERE ID_DETALLE_ESTACIONAMIENTO = @ID
	
	
					
END

