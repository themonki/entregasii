ALTER TABLE auxiliar DROP CONSTRAINT FK_auxiliar_empleado
;
ALTER TABLE auxiliar_trabaja_principal DROP CONSTRAINT FK_auxiliar_trabaja_principal_auxiliar
;
ALTER TABLE auxiliar_trabaja_principal DROP CONSTRAINT FK_auxiliar_trabaja_principal_principal
;
ALTER TABLE auxiliar_vende_tarjeta DROP CONSTRAINT FK_auxiliar_vende_tarjeta_auxiliar
;
ALTER TABLE auxiliar_vende_tarjeta DROP CONSTRAINT FK_auxiliar_vende_tarjeta_tarjeta
;
ALTER TABLE bus_asignado_ruta DROP CONSTRAINT FK_bus_asignado_ruta_bus
;
ALTER TABLE bus_asignado_ruta DROP CONSTRAINT FK_bus_asignado_ruta_ruta
;
ALTER TABLE conductor DROP CONSTRAINT FK_conductor_empleado
;
ALTER TABLE conductor_conduce_bus DROP CONSTRAINT FK_conductor_conduce_bus_bus
;
ALTER TABLE conductor_conduce_bus DROP CONSTRAINT FK_conductor_conduce_bus_conductor
;
ALTER TABLE director DROP CONSTRAINT FK_director_empleado
;
ALTER TABLE director_jefe_operario DROP CONSTRAINT FK_director_jefe_operario_director
;
ALTER TABLE director_jefe_operario DROP CONSTRAINT FK_director_jefe_operario_operario
;
ALTER TABLE generica DROP CONSTRAINT FK_generica_tarjeta
;
ALTER TABLE medida_reclamo_operario_agrega DROP CONSTRAINT FK_medida_reclamo_operario_agrega_medida
;
ALTER TABLE medida_reclamo_operario_agrega DROP CONSTRAINT FK_medida_reclamo_operario_agrega_operario
;
ALTER TABLE medida_reclamo_operario_agrega DROP CONSTRAINT FK_medida_reclamo_operario_agrega_reclamo
;
ALTER TABLE operario DROP CONSTRAINT FK_operario_empleado
;
ALTER TABLE operario_administra_principal DROP CONSTRAINT FK_operario_administra_principal_operario
;
ALTER TABLE operario_administra_principal DROP CONSTRAINT FK_operario_administra_principal_principal
;
ALTER TABLE operario_jefe_auxiliar DROP CONSTRAINT FK_operario_jefe_auxiliar_auxiliar
;
ALTER TABLE operario_jefe_auxiliar DROP CONSTRAINT FK_operario_jefe_auxiliar_operario
;
ALTER TABLE paradero DROP CONSTRAINT FK_paradero_estacion
;
ALTER TABLE personalizada DROP CONSTRAINT FK_personalizada_tarjeta
;
ALTER TABLE principal DROP CONSTRAINT FK_principal_estacion
;
ALTER TABLE reclamo_auxiliar_usuario_realiza DROP CONSTRAINT FK_reclamo_auxiliar_usuario_realiza_auxiliar
;
ALTER TABLE reclamo_auxiliar_usuario_realiza DROP CONSTRAINT FK_reclamo_auxiliar_usuario_realiza_reclamo
;
ALTER TABLE reclamo_auxiliar_usuario_realiza DROP CONSTRAINT FK_reclamo_auxiliar_usuario_realiza_usuario
;
ALTER TABLE ruta_formado_estacion DROP CONSTRAINT FK_ruta_formado_estacion_estacion
;
ALTER TABLE ruta_formado_estacion DROP CONSTRAINT FK_ruta_formado_estacion_ruta
;
ALTER TABLE tarjeta_uso_ruta DROP CONSTRAINT FK_tarjeta_uso_ruta_ruta
;
ALTER TABLE tarjeta_uso_ruta DROP CONSTRAINT FK_tarjeta_uso_ruta_tarjeta
;
ALTER TABLE usuario_adquiere_personalizada DROP CONSTRAINT FK_usuario_adquiere_personalizada_personalizada
;
ALTER TABLE usuario_adquiere_personalizada DROP CONSTRAINT FK_usuario_adquiere_personalizada_usuario
;

DROP TABLE IF EXISTS auxiliar
;
DROP TABLE IF EXISTS auxiliar_trabaja_principal
;
DROP TABLE IF EXISTS auxiliar_vende_tarjeta
;
DROP TABLE IF EXISTS bus
;
DROP SEQUENCE IF EXISTS bus_id_interno_seq; 

DROP TABLE IF EXISTS bus_asignado_ruta
;
DROP TABLE IF EXISTS conductor
;
DROP TABLE IF EXISTS conductor_conduce_bus
;
DROP TABLE IF EXISTS director
;
DROP TABLE IF EXISTS director_jefe_operario
;
DROP TABLE IF EXISTS empleado
;
DROP TABLE IF EXISTS estacion
;
DROP TABLE IF EXISTS generica
;
DROP TABLE IF EXISTS medida
;
DROP TABLE IF EXISTS medida_reclamo_operario_agrega
;
DROP SEQUENCE IF EXISTS medida_reclamo_operario_agrega_ticket_seq; 

DROP TABLE IF EXISTS operario
;
DROP TABLE IF EXISTS operario_administra_principal
;
DROP TABLE IF EXISTS operario_jefe_auxiliar
;
DROP TABLE IF EXISTS paradero
;
DROP TABLE IF EXISTS personalizada
;
DROP TABLE IF EXISTS principal
;
DROP TABLE IF EXISTS reclamo
;
DROP SEQUENCE IF EXISTS reclamo_ticket_seq; 

DROP TABLE IF EXISTS reclamo_auxiliar_usuario_realiza
;
DROP SEQUENCE IF EXISTS reclamo_auxiliar_usuario_realiza_ticket_seq; 

DROP TABLE IF EXISTS ruta
;
DROP TABLE IF EXISTS ruta_formado_estacion
;
DROP TABLE IF EXISTS tarjeta
;
DROP TABLE IF EXISTS tarjeta_uso_ruta
;
DROP TABLE IF EXISTS usuario
;
DROP TABLE IF EXISTS usuario_adquiere_personalizada
;

CREATE TABLE auxiliar ( 
	id varchar(50) NOT NULL
)
;

CREATE TABLE auxiliar_trabaja_principal ( 
	ubicacion varchar(100) NOT NULL,
	id varchar(50) NOT NULL
)
;

CREATE TABLE auxiliar_vende_tarjeta ( 
	id varchar(50) NOT NULL,
	pin varchar(100) NOT NULL
)
;

CREATE SEQUENCE bus_id_interno_seq INCREMENT 1 START 1
;

CREATE TABLE bus ( 
	estado boolean,
	tipo varchar(50),
	capacidad integer,
	id_interno integer DEFAULT NEXTVAL('bus_id_interno_seq'::TEXT),
	matricula varchar(10) NOT NULL
)
;

CREATE TABLE bus_asignado_ruta ( 
	nombre varchar(10) NOT NULL,
	matricula varchar(10) NOT NULL,
	fecha_asignacion date
)
;

CREATE TABLE conductor ( 
	id varchar(50) NOT NULL
)
;

CREATE TABLE conductor_conduce_bus ( 
	id varchar(50) NOT NULL,
	matricula varchar(10) NOT NULL,
	hora_inicio time,
	hora_fin time,
	fecha date
)
;

CREATE TABLE director ( 
	id varchar(50) NOT NULL
)
;

CREATE TABLE director_jefe_operario ( 
	id_director varchar(50) NOT NULL,
	id_operario varchar(50) NOT NULL
)
;

CREATE TABLE empleado ( 
	id varchar(50) NOT NULL,
	fecha_ingreso date,
	salario integer,
	telefono varchar(20),
	tipo_id varchar(50),
	direccion varchar(50),
	nombre varchar(50),
	apellido varchar(50),
	fecha_nacimiento date
)
;

CREATE TABLE estacion ( 
	ubicacion varchar(100) NOT NULL
)
;

CREATE TABLE generica ( 
	pin varchar(100) NOT NULL
)
;

CREATE TABLE medida ( 
	accion varchar(200) NOT NULL
)
;

CREATE SEQUENCE medida_reclamo_operario_agrega_ticket_seq INCREMENT 1 START 1
;

CREATE TABLE medida_reclamo_operario_agrega ( 
	id_operario varchar(50) NOT NULL,
	ticket integer DEFAULT NEXTVAL('medida_reclamo_operario_agrega_ticket_seq'::TEXT) NOT NULL,
	accion varchar(200) NOT NULL
)
;

CREATE TABLE operario ( 
	id varchar(50) NOT NULL
)
;

CREATE TABLE operario_administra_principal ( 
	ubicacion varchar(100) NOT NULL,
	id varchar(50) NOT NULL
)
;

CREATE TABLE operario_jefe_auxiliar ( 
	id_operario varchar(50) NOT NULL,
	id_auxiliar varchar(50) NOT NULL
)
;

CREATE TABLE paradero ( 
	ubicacion varchar(100) NOT NULL
)
;

CREATE TABLE personalizada ( 
	pin varchar(100) NOT NULL,
	credito integer
)
;

CREATE TABLE principal ( 
	nombre varchar(50),
	ubicacion varchar(100) NOT NULL
)
;

CREATE SEQUENCE reclamo_ticket_seq INCREMENT 1 START 1
;

CREATE TABLE reclamo ( 
	ticket integer DEFAULT NEXTVAL('reclamo_ticket_seq'::TEXT) NOT NULL,
	fecha date,
	descripcion varchar(200),
	motivo varchar(50),
	estado varchar(10)
)
;

CREATE SEQUENCE reclamo_auxiliar_usuario_realiza_ticket_seq INCREMENT 1 START 1
;

CREATE TABLE reclamo_auxiliar_usuario_realiza ( 
	id_auxiliar varchar(50) NOT NULL,
	id_usuario varchar(50) NOT NULL,
	ticket integer DEFAULT NEXTVAL('reclamo_auxiliar_usuario_realiza_ticket_seq'::TEXT) NOT NULL
)
;

CREATE TABLE ruta ( 
	descripcion varchar(50),
	nombre varchar(10) NOT NULL
)
;

CREATE TABLE ruta_formado_estacion ( 
	nombre varchar(10) NOT NULL,
	ubicacion varchar(100) NOT NULL
)
;

CREATE TABLE tarjeta ( 
	pin varchar(100) NOT NULL,
	saldo integer,
	estado boolean
)
;

CREATE TABLE tarjeta_uso_ruta ( 
	nombre varchar(10) NOT NULL,
	pin varchar(100) NOT NULL,
	fecha date,
	hora time
)
;

CREATE TABLE usuario ( 
	tipo varchar(50),
	id varchar(50) NOT NULL,
	nombre varchar(50),
	apellido varchar(50),
	direccion varchar(50),
	email varchar(50),
	fecha_nacimiento date,
	estado boolean
)
;

CREATE TABLE usuario_adquiere_personalizada ( 
	pin varchar(100) NOT NULL,
	id varchar(50) NOT NULL
)
;


ALTER TABLE auxiliar ADD CONSTRAINT PK_auxiliar 
	PRIMARY KEY (id)
;


ALTER TABLE auxiliar_trabaja_principal ADD CONSTRAINT PK_auxiliar_trabaja_principal 
	PRIMARY KEY (ubicacion, id)
;


ALTER TABLE auxiliar_vende_tarjeta ADD CONSTRAINT PK_auxiliar_vende_tarjeta 
	PRIMARY KEY (id, pin)
;


ALTER TABLE bus ADD CONSTRAINT PK_bus 
	PRIMARY KEY (matricula)
;


ALTER TABLE bus_asignado_ruta ADD CONSTRAINT PK_bus_asignado_ruta 
	PRIMARY KEY (nombre, matricula)
;


ALTER TABLE conductor ADD CONSTRAINT PK_conductor 
	PRIMARY KEY (id)
;


ALTER TABLE conductor_conduce_bus ADD CONSTRAINT PK_conductor_conduce_bus 
	PRIMARY KEY (id, matricula)
;


ALTER TABLE director ADD CONSTRAINT PK_director 
	PRIMARY KEY (id)
;


ALTER TABLE director_jefe_operario ADD CONSTRAINT PK_director_jefe_operario 
	PRIMARY KEY (id_director, id_operario)
;


ALTER TABLE empleado ADD CONSTRAINT PK_empleado 
	PRIMARY KEY (id)
;


ALTER TABLE estacion ADD CONSTRAINT PK_estacion 
	PRIMARY KEY (ubicacion)
;


ALTER TABLE generica ADD CONSTRAINT PK_generica 
	PRIMARY KEY (pin)
;


ALTER TABLE medida ADD CONSTRAINT PK_medida 
	PRIMARY KEY (accion)
;


ALTER TABLE medida_reclamo_operario_agrega ADD CONSTRAINT PK_medida_reclamo_operario_agrega 
	PRIMARY KEY (id_operario, ticket, accion)
;


ALTER TABLE operario ADD CONSTRAINT PK_operario 
	PRIMARY KEY (id)
;


ALTER TABLE operario_administra_principal ADD CONSTRAINT PK_operario_administra_principal 
	PRIMARY KEY (ubicacion, id)
;


ALTER TABLE operario_jefe_auxiliar ADD CONSTRAINT PK_operario_jefe_auxiliar 
	PRIMARY KEY (id_operario, id_auxiliar)
;


ALTER TABLE paradero ADD CONSTRAINT PK_paradero 
	PRIMARY KEY (ubicacion)
;


ALTER TABLE personalizada ADD CONSTRAINT PK_personalizada 
	PRIMARY KEY (pin)
;


ALTER TABLE principal ADD CONSTRAINT PK_principal 
	PRIMARY KEY (ubicacion)
;


ALTER TABLE reclamo ADD CONSTRAINT PK_reclamo 
	PRIMARY KEY (ticket)
;


ALTER TABLE reclamo_auxiliar_usuario_realiza ADD CONSTRAINT PK_reclamo_auxiliar_usuario_realiza 
	PRIMARY KEY (id_auxiliar, id_usuario, ticket)
;


ALTER TABLE ruta ADD CONSTRAINT PK_ruta 
	PRIMARY KEY (nombre)
;


ALTER TABLE ruta_formado_estacion ADD CONSTRAINT PK_ruta_formado_estacion 
	PRIMARY KEY (nombre, ubicacion)
;


ALTER TABLE tarjeta ADD CONSTRAINT PK_tarjeta 
	PRIMARY KEY (pin)
;


ALTER TABLE tarjeta_uso_ruta ADD CONSTRAINT PK_tarjeta_uso_ruta 
	PRIMARY KEY (nombre, pin)
;


ALTER TABLE usuario ADD CONSTRAINT PK_usuario 
	PRIMARY KEY (id)
;


ALTER TABLE usuario_adquiere_personalizada ADD CONSTRAINT PK_usuario_adquiere_personalizada 
	PRIMARY KEY (pin, id)
;




ALTER TABLE auxiliar ADD CONSTRAINT FK_auxiliar_empleado 
	FOREIGN KEY (id) REFERENCES empleado (id)
ON DELETE CASCADE ON UPDATE CASCADE
;

ALTER TABLE auxiliar_trabaja_principal ADD CONSTRAINT FK_auxiliar_trabaja_principal_auxiliar 
	FOREIGN KEY (id) REFERENCES auxiliar (id)
ON DELETE CASCADE ON UPDATE CASCADE
;

ALTER TABLE auxiliar_trabaja_principal ADD CONSTRAINT FK_auxiliar_trabaja_principal_principal 
	FOREIGN KEY (ubicacion) REFERENCES principal (ubicacion)
ON DELETE CASCADE ON UPDATE CASCADE
;

ALTER TABLE auxiliar_vende_tarjeta ADD CONSTRAINT FK_auxiliar_vende_tarjeta_auxiliar 
	FOREIGN KEY (id) REFERENCES auxiliar (id)
ON DELETE CASCADE ON UPDATE CASCADE
;

ALTER TABLE auxiliar_vende_tarjeta ADD CONSTRAINT FK_auxiliar_vende_tarjeta_tarjeta 
	FOREIGN KEY (pin) REFERENCES tarjeta (pin)
ON DELETE CASCADE ON UPDATE CASCADE
;

ALTER TABLE bus_asignado_ruta ADD CONSTRAINT FK_bus_asignado_ruta_bus 
	FOREIGN KEY (matricula) REFERENCES bus (matricula)
ON DELETE CASCADE ON UPDATE CASCADE
;

ALTER TABLE bus_asignado_ruta ADD CONSTRAINT FK_bus_asignado_ruta_ruta 
	FOREIGN KEY (nombre) REFERENCES ruta (nombre)
ON DELETE CASCADE ON UPDATE CASCADE
;

ALTER TABLE conductor ADD CONSTRAINT FK_conductor_empleado 
	FOREIGN KEY (id) REFERENCES empleado (id)
ON DELETE CASCADE ON UPDATE CASCADE
;

ALTER TABLE conductor_conduce_bus ADD CONSTRAINT FK_conductor_conduce_bus_bus 
	FOREIGN KEY (matricula) REFERENCES bus (matricula)
ON DELETE CASCADE ON UPDATE CASCADE
;

ALTER TABLE conductor_conduce_bus ADD CONSTRAINT FK_conductor_conduce_bus_conductor 
	FOREIGN KEY (id) REFERENCES conductor (id)
ON DELETE CASCADE ON UPDATE CASCADE
;

ALTER TABLE director ADD CONSTRAINT FK_director_empleado 
	FOREIGN KEY (id) REFERENCES empleado (id)
ON DELETE CASCADE ON UPDATE CASCADE
;

ALTER TABLE director_jefe_operario ADD CONSTRAINT FK_director_jefe_operario_director 
	FOREIGN KEY (id_director) REFERENCES director (id)
ON DELETE CASCADE ON UPDATE CASCADE
;

ALTER TABLE director_jefe_operario ADD CONSTRAINT FK_director_jefe_operario_operario 
	FOREIGN KEY (id_operario) REFERENCES operario (id)
ON DELETE CASCADE ON UPDATE CASCADE
;

ALTER TABLE generica ADD CONSTRAINT FK_generica_tarjeta 
	FOREIGN KEY (pin) REFERENCES tarjeta (pin)
ON DELETE CASCADE ON UPDATE CASCADE
;

ALTER TABLE medida_reclamo_operario_agrega ADD CONSTRAINT FK_medida_reclamo_operario_agrega_medida 
	FOREIGN KEY (accion) REFERENCES medida (accion)
ON DELETE CASCADE ON UPDATE CASCADE
;

ALTER TABLE medida_reclamo_operario_agrega ADD CONSTRAINT FK_medida_reclamo_operario_agrega_operario 
	FOREIGN KEY (id_operario) REFERENCES operario (id)
ON DELETE CASCADE
;

ALTER TABLE medida_reclamo_operario_agrega ADD CONSTRAINT FK_medida_reclamo_operario_agrega_reclamo 
	FOREIGN KEY (ticket) REFERENCES reclamo (ticket)
ON DELETE CASCADE ON UPDATE CASCADE
;

ALTER TABLE operario ADD CONSTRAINT FK_operario_empleado 
	FOREIGN KEY (id) REFERENCES empleado (id)
;

ALTER TABLE operario_administra_principal ADD CONSTRAINT FK_operario_administra_principal_operario 
	FOREIGN KEY (id) REFERENCES operario (id)
ON DELETE CASCADE ON UPDATE CASCADE
;

ALTER TABLE operario_administra_principal ADD CONSTRAINT FK_operario_administra_principal_principal 
	FOREIGN KEY (ubicacion) REFERENCES principal (ubicacion)
ON DELETE CASCADE ON UPDATE CASCADE
;

ALTER TABLE operario_jefe_auxiliar ADD CONSTRAINT FK_operario_jefe_auxiliar_auxiliar 
	FOREIGN KEY (id_auxiliar) REFERENCES auxiliar (id)
ON DELETE CASCADE ON UPDATE CASCADE
;

ALTER TABLE operario_jefe_auxiliar ADD CONSTRAINT FK_operario_jefe_auxiliar_operario 
	FOREIGN KEY (id_operario) REFERENCES operario (id)
ON DELETE CASCADE ON UPDATE CASCADE
;

ALTER TABLE paradero ADD CONSTRAINT FK_paradero_estacion 
	FOREIGN KEY (ubicacion) REFERENCES estacion (ubicacion)
ON DELETE CASCADE ON UPDATE CASCADE
;

ALTER TABLE personalizada ADD CONSTRAINT FK_personalizada_tarjeta 
	FOREIGN KEY (pin) REFERENCES tarjeta (pin)
ON DELETE CASCADE ON UPDATE CASCADE
;

ALTER TABLE principal ADD CONSTRAINT FK_principal_estacion 
	FOREIGN KEY (ubicacion) REFERENCES estacion (ubicacion)
ON DELETE CASCADE ON UPDATE CASCADE
;

ALTER TABLE reclamo_auxiliar_usuario_realiza ADD CONSTRAINT FK_reclamo_auxiliar_usuario_realiza_auxiliar 
	FOREIGN KEY (id_auxiliar) REFERENCES auxiliar (id)
ON DELETE CASCADE ON UPDATE CASCADE
;

ALTER TABLE reclamo_auxiliar_usuario_realiza ADD CONSTRAINT FK_reclamo_auxiliar_usuario_realiza_reclamo 
	FOREIGN KEY (ticket) REFERENCES reclamo (ticket)
ON DELETE CASCADE ON UPDATE CASCADE
;

ALTER TABLE reclamo_auxiliar_usuario_realiza ADD CONSTRAINT FK_reclamo_auxiliar_usuario_realiza_usuario 
	FOREIGN KEY (id_usuario) REFERENCES usuario (id)
ON DELETE CASCADE ON UPDATE CASCADE
;

ALTER TABLE ruta_formado_estacion ADD CONSTRAINT FK_ruta_formado_estacion_estacion 
	FOREIGN KEY (ubicacion) REFERENCES estacion (ubicacion)
ON DELETE CASCADE ON UPDATE CASCADE
;

ALTER TABLE ruta_formado_estacion ADD CONSTRAINT FK_ruta_formado_estacion_ruta 
	FOREIGN KEY (nombre) REFERENCES ruta (nombre)
ON DELETE CASCADE ON UPDATE CASCADE
;

ALTER TABLE tarjeta_uso_ruta ADD CONSTRAINT FK_tarjeta_uso_ruta_ruta 
	FOREIGN KEY (nombre) REFERENCES ruta (nombre)
ON DELETE CASCADE ON UPDATE CASCADE
;

ALTER TABLE tarjeta_uso_ruta ADD CONSTRAINT FK_tarjeta_uso_ruta_tarjeta 
	FOREIGN KEY (pin) REFERENCES tarjeta (pin)
ON DELETE CASCADE ON UPDATE CASCADE
;

ALTER TABLE usuario_adquiere_personalizada ADD CONSTRAINT FK_usuario_adquiere_personalizada_personalizada 
	FOREIGN KEY (pin) REFERENCES personalizada (pin)
ON DELETE CASCADE ON UPDATE CASCADE
;

ALTER TABLE usuario_adquiere_personalizada ADD CONSTRAINT FK_usuario_adquiere_personalizada_usuario 
	FOREIGN KEY (id) REFERENCES usuario (id)
ON DELETE CASCADE ON UPDATE CASCADE
;
