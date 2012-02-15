DROP TABLE IF EXISTS auxiliar CASCADE;
CREATE TABLE auxiliar ( 
	id varchar(20) NOT NULL,
	id_jefe varchar(20),
	trabaja_en integer
);

DROP TABLE IF EXISTS bus CASCADE;
CREATE TABLE bus ( 
	matricula varchar(10) NOT NULL,
	tipo varchar(50),
	capacidad integer,
	id_interno varchar(20) NOT NULL,
	estado boolean NOT NULL,
	pertenece_ruta varchar(10),
	estado_fisico VARCHAR(20)
);

DROP TABLE IF EXISTS conductor CASCADE;
CREATE TABLE conductor ( 
	id varchar(20) NOT NULL,
   licencia varchar(20),
   conduce_bus varchar(10)
);

DROP TABLE IF EXISTS director CASCADE;
CREATE TABLE director ( 
	id varchar(20) NOT NULL
);

DROP TABLE IF EXISTS empleado CASCADE;
CREATE TABLE empleado ( 
	id varchar(20) NOT NULL,
	tipo_id varchar(5),
	salario integer,
	telefono varchar(20),
	direccion varchar(50),
	nombre varchar(15) NOT NULL,
   nombre2 varchar(15),
	apellido varchar(15) NOT NULL,
   apellido2 varchar(15),
	fecha_nacimiento date,
   fecha_ingreso date,
	rol integer,
   email varchar(50),
	login varchar(10) NOT NULL,
	password char(32) NOT NULL,
	estado boolean NOT NULL  

);

DROP TABLE IF EXISTS estacion CASCADE;
DROP SEQUENCE IF EXISTS estacion_id_seq; 

CREATE SEQUENCE estacion_id_seq INCREMENT 1 START 1;

CREATE TABLE estacion ( 
	id integer DEFAULT NEXTVAL('estacion_id_seq'::TEXT) NOT NULL,
	ubicacion varchar(20) NOT NULL,
	estado boolean NOT NULL
);

DROP TABLE IF EXISTS estacion_paradero CASCADE;
CREATE TABLE estacion_paradero ( 
	id_estacion integer NOT NULL
);

DROP TABLE IF EXISTS estacion_principal CASCADE;
CREATE TABLE estacion_principal ( 
	id_estacion integer NOT NULL,
	nombre varchar(50),
	id_operario varchar(20)
);

DROP TABLE IF EXISTS medida CASCADE;
DROP SEQUENCE IF EXISTS medida_id_seq; 

CREATE SEQUENCE medida_id_seq INCREMENT 1 START 1;

CREATE TABLE medida ( 
	id integer DEFAULT NEXTVAL('medida_id_seq'::TEXT) NOT NULL,
	accion varchar(200) NOT NULL
);

DROP TABLE IF EXISTS medida_reclamo_operario_agrega CASCADE;
CREATE TABLE medida_reclamo_operario_agrega ( 
	id_operario varchar(50) NOT NULL,
	ticket integer NOT NULL,
	id_medida integer NOT NULL
);

DROP TABLE IF EXISTS operario CASCADE;
CREATE TABLE operario ( 
	id varchar(20) NOT NULL,
	id_jefe varchar(20)
);

DROP TABLE IF EXISTS recarga CASCADE;
CREATE TABLE recarga ( 
	pin varchar(30) NOT NULL,
	id_estacion integer NOT NULL,
	fecha date NOT NULL,
	hora time NOT NULL,
	valor integer NOT NULL
);

DROP TABLE IF EXISTS reclamo CASCADE;
DROP SEQUENCE IF EXISTS reclamo_ticket_seq; 

CREATE SEQUENCE reclamo_ticket_seq INCREMENT 1 START 1;

CREATE TABLE reclamo ( 
	ticket integer DEFAULT NEXTVAL('reclamo_ticket_seq'::TEXT) NOT NULL,
	fecha date,
	descripcion varchar(200),
	motivo varchar(50),
	estado varchar(10),
	auxiliar_recibe varchar(20),
	usuario_realiza varchar(20)
);

DROP TABLE IF EXISTS ruta CASCADE;
CREATE TABLE ruta ( 
	nombre varchar(10) NOT NULL,
	descripcion varchar(350),
	estado boolean NOT NULL
);

DROP TABLE IF EXISTS ruta_formado_estacion CASCADE;
CREATE TABLE ruta_formado_estacion ( 
	nombre varchar(10) NOT NULL,
	id_estacion integer NOT NULL
);

DROP TABLE IF EXISTS tarjeta CASCADE;
CREATE TABLE tarjeta ( 
	pin varchar(30) NOT NULL,
	saldo integer,
	estado boolean NOT NULL,
	tipo integer,
	costo integer,
	fecha_venta date,
	estacion_venta integer
);

DROP TABLE IF EXISTS tarjeta_generica CASCADE;
CREATE TABLE tarjeta_generica ( 
	pin varchar(30) NOT NULL
);

DROP TABLE IF EXISTS tarjeta_personalizada CASCADE;
CREATE TABLE tarjeta_personalizada ( 
	pin varchar(30) NOT NULL,
	credito integer
);

DROP TABLE IF EXISTS tarjeta_uso_ruta CASCADE;
CREATE TABLE tarjeta_uso_ruta ( 
	nombre varchar(10) NOT NULL,
	pin varchar(30) NOT NULL,
	fecha date NOT NULL,
	hora time NOT NULL
);

DROP TABLE IF EXISTS usuario CASCADE;
CREATE TABLE usuario ( 
	id varchar(20) NOT NULL,
	tipo_id varchar(5),
	nombre varchar(50),
	apellido varchar(50),
	direccion varchar(50),
	email varchar(50),
	fecha_nacimiento date,
	telefono varchar(10),
	adquiere_tarjeta varchar(30),
	password char(32) NOT NULL,
	estado boolean NOT NULL
);

--------------------------------------------------------------------------
ALTER TABLE auxiliar ADD CONSTRAINT PK_auxiliar 
	PRIMARY KEY (id);

ALTER TABLE bus ADD CONSTRAINT PK_bus 
	PRIMARY KEY (matricula);

ALTER TABLE conductor ADD CONSTRAINT PK_conductor 
	PRIMARY KEY (id);

ALTER TABLE director ADD CONSTRAINT PK_director 
	PRIMARY KEY (id);

ALTER TABLE empleado ADD CONSTRAINT PK_empleado 
	PRIMARY KEY (id);

ALTER TABLE estacion ADD CONSTRAINT PK_estacion 
	PRIMARY KEY (id);

ALTER TABLE estacion_paradero ADD CONSTRAINT PK_paradero 
	PRIMARY KEY (id_estacion);

ALTER TABLE estacion_principal ADD CONSTRAINT PK_principal 
	PRIMARY KEY (id_estacion);

ALTER TABLE medida ADD CONSTRAINT PK_medida 
	PRIMARY KEY (id);

ALTER TABLE medida_reclamo_operario_agrega ADD CONSTRAINT PK_medida_reclamo_operario_agrega 
	PRIMARY KEY (id_operario, ticket, id_medida);

ALTER TABLE operario ADD CONSTRAINT PK_operario 
	PRIMARY KEY (id);

ALTER TABLE recarga ADD CONSTRAINT PK_recarga 
	PRIMARY KEY (pin, id_estacion, fecha, hora);

ALTER TABLE reclamo ADD CONSTRAINT PK_reclamo 
	PRIMARY KEY (ticket);

ALTER TABLE ruta ADD CONSTRAINT PK_ruta 
	PRIMARY KEY (nombre);

ALTER TABLE ruta_formado_estacion ADD CONSTRAINT PK_ruta_formado_estacion 
	PRIMARY KEY (nombre, id_estacion);

ALTER TABLE tarjeta ADD CONSTRAINT PK_tarjeta 
	PRIMARY KEY (pin);

ALTER TABLE tarjeta_generica ADD CONSTRAINT PK_tarjeta_generica 
	PRIMARY KEY (pin);

ALTER TABLE tarjeta_personalizada ADD CONSTRAINT PK_tarjeta_personalizada 
	PRIMARY KEY (pin);

ALTER TABLE tarjeta_uso_ruta ADD CONSTRAINT PK_tarjeta_uso_ruta 
	PRIMARY KEY (nombre, pin, fecha, hora);

ALTER TABLE usuario ADD CONSTRAINT PK_usuario 
	PRIMARY KEY (id);
--------------------------------------------------------------------------
--Auxiliar

ALTER TABLE auxiliar
	ADD CONSTRAINT UQ_auxiliar_id UNIQUE (id);

ALTER TABLE auxiliar ADD CONSTRAINT FK_auxiliar_empleado 
	FOREIGN KEY (id) REFERENCES empleado (id) 
ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE auxiliar ADD CONSTRAINT FK_auxiliar_estacion_principal
	FOREIGN KEY (trabaja_en) REFERENCES estacion_principal (id_estacion) 
ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE auxiliar ADD CONSTRAINT FK_auxiliar_operario
	FOREIGN KEY (id_jefe) REFERENCES operario (id) 
ON DELETE CASCADE ON UPDATE CASCADE;

--
--Bus

ALTER TABLE bus
	ADD CONSTRAINT UQ_bus_id_interno UNIQUE (id_interno);

ALTER TABLE bus
	ADD CONSTRAINT UQ_bus_matricula UNIQUE (matricula);

ALTER TABLE bus ADD CONSTRAINT FK_bus_ruta 
   FOREIGN KEY (pertenece_ruta) REFERENCES ruta (nombre) 
ON DELETE CASCADE ON UPDATE CASCADE;

--
--Conductor

ALTER TABLE conductor
	ADD CONSTRAINT UQ_conductor_id UNIQUE (id);

ALTER TABLE conductor ADD CONSTRAINT FK_conductor_empleado 
	FOREIGN KEY (id) REFERENCES empleado (id)
ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE conductor ADD CONSTRAINT FK_conductor_bus 
   FOREIGN KEY (conduce_bus) REFERENCES bus (matricula) 
ON DELETE CASCADE ON UPDATE CASCADE;

--
--Director

ALTER TABLE director
	ADD CONSTRAINT UQ_director_id UNIQUE (id);

ALTER TABLE director ADD CONSTRAINT FK_director_empleado 
	FOREIGN KEY (id) REFERENCES empleado (id)
ON DELETE CASCADE ON UPDATE CASCADE;

--
--Empleado

ALTER TABLE empleado
	ADD CONSTRAINT UQ_empleado_id UNIQUE (id);

ALTER TABLE empleado
	ADD CONSTRAINT UQ_empleado_login UNIQUE (login);

--
--Estacion

ALTER TABLE estacion
	ADD CONSTRAINT UQ_estacion_id UNIQUE (id);

ALTER TABLE estacion
	ADD CONSTRAINT UQ_estacion_ubicacion UNIQUE (ubicacion);

--
--Estacion Paradero

ALTER TABLE estacion_paradero
	ADD CONSTRAINT UQ_estacion_paradero_id_estacion UNIQUE (id_estacion);

ALTER TABLE estacion_paradero ADD CONSTRAINT FK_estacion_paradero_estacion 
	FOREIGN KEY (id_estacion) REFERENCES estacion (id) 
ON DELETE CASCADE ON UPDATE CASCADE;

--
--Estacion Principal

ALTER TABLE estacion_principal
	ADD CONSTRAINT UQ_estacion_principal_id_estacion UNIQUE (id_estacion);

ALTER TABLE estacion_principal ADD CONSTRAINT FK_estacion_principal_estacion 
	FOREIGN KEY (id_estacion) REFERENCES estacion (id) 
ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE estacion_principal ADD CONSTRAINT FK_etacionprincipal_operario 
   FOREIGN KEY (id_operario) REFERENCES operario (id);

--
-- Medida

ALTER TABLE medida
	ADD CONSTRAINT UQ_medida_accion UNIQUE (accion);

ALTER TABLE medida
	ADD CONSTRAINT UQ_medida_id UNIQUE (id);

--
-- Medida Operario Reclamo Agrega

ALTER TABLE medida_reclamo_operario_agrega ADD CONSTRAINT FK_medida_reclamo_operario_agrega_operario 
	FOREIGN KEY (id_operario) REFERENCES operario (id)
ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE medida_reclamo_operario_agrega ADD CONSTRAINT FK_medida_reclamo_operario_agrega_reclamo 
	FOREIGN KEY (ticket) REFERENCES reclamo (ticket)
ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE medida_reclamo_operario_agrega ADD CONSTRAINT FK_medida_reclamo_operario_agrega_medida
	FOREIGN KEY (id_medida) REFERENCES medida (id)
ON DELETE CASCADE ON UPDATE CASCADE;

--
--Operario

ALTER TABLE operario
	ADD CONSTRAINT UQ_operario_id UNIQUE (id);

ALTER TABLE operario ADD CONSTRAINT FK_operario_empleado 
	FOREIGN KEY (id) REFERENCES empleado (id)
ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE operario ADD CONSTRAINT FK_operario_director 
	FOREIGN KEY (id_jefe) REFERENCES director (id)
ON DELETE CASCADE ON UPDATE CASCADE;

--
--Recarga

ALTER TABLE recarga ADD CONSTRAINT FK_recarga_tarjeta
	FOREIGN KEY (pin) REFERENCES tarjeta (pin)
ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE recarga ADD CONSTRAINT FK_recarga_estacion_principal
	FOREIGN KEY (id_estacion) REFERENCES estacion_principal (id_estacion)
ON DELETE CASCADE ON UPDATE CASCADE;

--
--Reclamo

ALTER TABLE reclamo
	ADD CONSTRAINT UQ_reclamo_ticket UNIQUE (ticket);

ALTER TABLE reclamo ADD CONSTRAINT FK_reclamo_usuario 
	FOREIGN KEY (usuario_realiza) REFERENCES usuario (id);

ALTER TABLE reclamo ADD CONSTRAINT FK_reclamo_auxiliar 
	FOREIGN KEY (auxiliar_recibe) REFERENCES auxiliar (id);
--
--Ruta

ALTER TABLE ruta
	ADD CONSTRAINT UQ_ruta_nombre UNIQUE (nombre);

--
--Ruta Formado Estacion

ALTER TABLE ruta_formado_estacion ADD CONSTRAINT FK_ruta_formado_estacion_ruta 
	FOREIGN KEY (nombre) REFERENCES ruta (nombre) 
ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE ruta_formado_estacion ADD CONSTRAINT FK_ruta_formado_estacion_estacion 
	FOREIGN KEY (id_estacion) REFERENCES estacion (id) 
ON DELETE CASCADE ON UPDATE CASCADE;

--
--Tarjeta

ALTER TABLE tarjeta
	ADD CONSTRAINT UQ_tarjeta_pin UNIQUE (pin);

ALTER TABLE tarjeta ADD CONSTRAINT FK_tarjeta_estacion_principal 
	FOREIGN KEY (estacion_venta) REFERENCES estacion_principal (id_estacion);

--
--Tarjeta Generica

ALTER TABLE tarjeta_generica
	ADD CONSTRAINT UQ_tarjeta_generica_pin UNIQUE (pin);

ALTER TABLE tarjeta_generica ADD CONSTRAINT FK_tarjeta_generica_tarjeta 
	FOREIGN KEY (pin) REFERENCES tarjeta (pin)
ON DELETE CASCADE ON UPDATE CASCADE;

--
--Tarjeta Personalizada
ALTER TABLE tarjeta_personalizada
	ADD CONSTRAINT UQ_tarjeta_personalizada_pin UNIQUE (pin);

ALTER TABLE tarjeta_personalizada ADD CONSTRAINT FK_tarjeta_personalizada_tarjeta 
	FOREIGN KEY (pin) REFERENCES tarjeta (pin)
ON DELETE CASCADE ON UPDATE CASCADE;

--
--Tarjeta Uso Ruta

ALTER TABLE tarjeta_uso_ruta ADD CONSTRAINT FK_tarjeta_uso_ruta_ruta 
	FOREIGN KEY (nombre) REFERENCES ruta (nombre)
ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE tarjeta_uso_ruta ADD CONSTRAINT FK_tarjeta_uso_ruta_tarjeta 
	FOREIGN KEY (pin) REFERENCES tarjeta (pin)
ON DELETE CASCADE ON UPDATE CASCADE;

--
--Usuario

ALTER TABLE usuario
	ADD CONSTRAINT UQ_usuario_adquiere_tarjeta UNIQUE (adquiere_tarjeta);

ALTER TABLE usuario
	ADD CONSTRAINT UQ_usuario_id UNIQUE (id);

ALTER TABLE usuario ADD CONSTRAINT FK_usuario_tarjeta_personalizada 
	FOREIGN KEY (adquiere_tarjeta) REFERENCES tarjeta_personalizada (pin) 
ON DELETE CASCADE ON UPDATE CASCADE;
