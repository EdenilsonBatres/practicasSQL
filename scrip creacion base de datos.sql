CREATE DATABASE SISTEMA_PARQUEO
USE SISTEMA_PARQUEO

CREATE TABLE NUEVO_LOGIN(
ID_NUEVO_LOGIN INT IDENTITY PRIMARY KEY NOT NULL,
NOMBRE VARCHAR(50) NOT NULL,
APELLIDO VARCHAR(50) NOT NULL,
CORREO VARCHAR(50) NOT NULL,
PASS VARCHAR(50) NOT NULL,
USUARIO VARCHAR(50) NOT NULL
)

CREATE TABLE ENCARGADO(
ID_ENCARGADO INT IDENTITY NOT NULL PRIMARY KEY,
NOMBRES VARCHAR(50) NOT NULL,
APELLIDOS VARCHAR(50) NOT NULL,
NUMERO_LICENCIA INT 
)


--DROP TABLE VEHICULO
-------------------------------
CREATE TABLE VEHICULO(
ID_VEHICULO INT PRIMARY KEY NOT NULL IDENTITY,
TIPO_VEHICULO VARCHAR(50) NOT NULL,
NUMERO_PLACA INT NOT NULL,
COLOR VARCHAR(50)

)
-----------------------------------
DROP TABLE VEHICULO
------------------------------------
CREATE TABLE TARIFA(
ID_TARIFA INT PRIMARY KEY NOT NULL IDENTITY,
CANTIDAD DECIMAL(6,2) NOT NULL,
ID_VEHICULO INT,

CONSTRAINT FK_TARIFA_VEHICULO FOREIGN KEY(ID_VEHICULO) REFERENCES VEHICULO(ID_VEHICULO)
)
-----

----
CREATE TABLE FLUJO_EFECTIVO(
ID_FLUJO_EFECTIVO INT PRIMARY KEY NOT NULL IDENTITY,
CANTIDAD_VEHICULOS_INGRESADOS INT NOT NULL,
TOTAL_DINERO DECIMAL(6,2) NOT NULL,
)

--DROP TABLE  DETALLE_ESTACIONAMIENTO 
--HORA ENTRDA EN VARCHAR PARA PODER OBTENER EL PARAMETRO DEL COMBOBOX
--CORREGIR ESTA TABLA
CREATE TABLE DETALLE_ESTACIONAMIENTO(
ID_DETALLE_ESTACIONAMIENTO INT PRIMARY KEY IDENTITY NOT NULL,
HORA_ENTRADA varchar(50) NOT NULL,
CANTIDAD_HORAS INT NOT NULL,
ID_TARIFA INT,
ID_FLUJO_EFECTIVO INT

CONSTRAINT FK_DETALLE_TARIFA FOREIGN KEY (ID_TARIFA) REFERENCES TARIFA(ID_TARIFA),
CONSTRAINT FK_FLUJO_EFECTIVO FOREIGN KEY (ID_FLUJO_EFECTIVO) REFERENCES FLUJO_EFECTIVO(ID_FLUJO_EFECTIVO),
)


CREATE TABLE SESION(
ID_SESION INT PRIMARY KEY NOT NULL IDENTITY,
FECHA DATETIME,
ID_NUEVO_LOGIN INT,

CONSTRAINT FK_SESION_LOGIN FOREIGN KEY(ID_NUEVO_LOGIN) REFERENCES NUEVO_LOGIN(ID_NUEVO_LOGIN)
)

CREATE TABLE REGISTRAR_VEHICULO(
ID_REGISTRO INT PRIMARY KEY IDENTITY,
ID_ENCARGADO INT,
ID_SESION INT,
ID_DETALLE_ESTACIONAMIENTO INT,
ID_VEHICULO INT,

CONSTRAINT FK_REGISTRAR_ENCARGADO FOREIGN KEY(ID_ENCARGADO) REFERENCES ENCARGADO(ID_ENCARGADO),
CONSTRAINT FK_REGISTRAR_SESION FOREIGN KEY (ID_SESION) REFERENCES SESION(ID_SESION),
CONSTRAINT FK_REGISTRAR_DETALLE_ESTACIONAMIENTO FOREIGN KEY(ID_DETALLE_ESTACIONAMIENTO) REFERENCES DETALLE_ESTACIONAMIENTO(ID_DETALLE_ESTACIONAMIENTO),
CONSTRAINT FK_REGISTRAR_VEHICULO FOREIGN KEY (ID_VEHICULO) REFERENCES VEHICULO(ID_VEHICULO)
)

ALTER TABLE REGISTRAR_VEHICULO DROP FK_REGISTRAR_DETALLE_ESTACIONAMIENTO ---------------------------------------------
DROP TABLE REGISTRAR_VEHICULO

--NO SIRVE