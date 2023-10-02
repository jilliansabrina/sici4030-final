REM ***************************************************************
REM *   Author     : Jillian S. Alvarez Sanlley                   *
REM *   Num.Est    : 841-19-6451                                  *
REM *   Curso      : SICI-4030                                    *
REM *   Sección    : KR1                                          *
REM *   Source     : Plantilla-SQL-Script-Documentado.sql         *
REM *   Comentario : Este script es para el Proyecto Final.       *
REM ***************************************************************
REM ***************************************************************
REM *  EL SET ECHO ON permite ver la corrida en pantalla.         *
REM ***************************************************************
SET ECHO ON
REM ***************************************************************
REM * Las próximas dos instrucciones muestran el nombre del       *
REM * usuario de la cuenta y la fecha del sistema. Esto es        *
REM * requerido para crear o eliminar tablas y otros objetos.     *
REM ***************************************************************
REM
SHOW USER
SELECT systimestamp FROM dual;
REM
REM ***************************************************************
REM *   Aquí se borran las tablas en caso de tener que volver a   *
REM *  crearlas, esta sub dividio por niveles.                    *
REM ***************************************************************
DROP TABLE mascotaobjeto;
DROP TABLE mascotacondicion;
DROP TABLE mascotacomida;
DROP TABLE record;
DROP TABLE reservacion;
DROP TABLE mascota;
DROP TABLE empleado;
DROP TABLE clinica;
DROP TABLE departamento;
DROP TABLE oficina;
DROP TABLE comida;
DROP TABLE dueno;
DROP TABLE encasillado;
DROP TABLE condicion;
DROP TABLE objeto;
DROP TABLE animal;
DROP TABLE direccion;
REM ***************************************************************
REM * Las próximas dos instrucciones muestran el nombre del       *
REM * usuario de la cuenta y la fecha del sistema. Esto es        *
REM * requerido para crear o eliminar tablas y otros objetos.     *
REM ***************************************************************
REM
SHOW USER
SELECT systimestamp FROM dual;
REM ***************************************************************
REM *   Creacion tabla direccion nivel-1                             *
REM ***************************************************************
CREATE TABLE direccion (
      id_pk                   VARCHAR2(4)   NOT NULL,
      calle                   VARCHAR2(10)  NOT NULL,
      urbanizacion            VARCHAR2(25),
      ciudad                  VARCHAR2(16)  NOT NULL,
      estado                  CHAR(2)       NOT NULL,
      codigo_postal           CHAR(5)       NOT NULL,
CONSTRAINT direccion_id_pk            PRIMARY KEY (id_pk));
REM ***************************************************************
REM * Las próximas dos instrucciones muestran el nombre del       *
REM * usuario de la cuenta y la fecha del sistema. Esto es        *
REM * requerido para crear o eliminar tablas y otros objetos.     *
REM ***************************************************************
REM
SHOW USER
SELECT systimestamp FROM dual;
REM ***************************************************************
REM *   Creacion tabla animal nivel-1                             *
REM ***************************************************************
CREATE TABLE animal (
      codigo_pk                 VARCHAR2(3)  NOT NULL,
      nombre                    VARCHAR2(25) NOT NULL,
      descripcion               VARCHAR2(99) NOT NULL,
CONSTRAINT animal_codigo_pk            PRIMARY KEY (codigo_pk));
REM ***************************************************************
REM * Las próximas dos instrucciones muestran el nombre del       *
REM * usuario de la cuenta y la fecha del sistema. Esto es        *
REM * requerido para crear o eliminar tablas y otros objetos.     *
REM ***************************************************************
REM
SHOW USER
SELECT systimestamp FROM dual;
REM ***************************************************************
REM *   Creacion tabla objeto nivel-1                             *
REM ***************************************************************
CREATE TABLE objeto (
      id_pk                     VARCHAR2(2)  NOT NULL,
      nombre                    VARCHAR2(30) NOT NULL,
CONSTRAINT objeto_id_pk            PRIMARY KEY (id_pk));
REM ***************************************************************
REM * Las próximas dos instrucciones muestran el nombre del       *
REM * usuario de la cuenta y la fecha del sistema. Esto es        *
REM * requerido para crear o eliminar tablas y otros objetos.     *
REM ***************************************************************
REM
SHOW USER
SELECT systimestamp FROM dual;
REM ***************************************************************
REM *   Creacion tabla condicion nivel-1                          *
REM ***************************************************************
CREATE TABLE condicion (
      id_pk                     VARCHAR2(5)  NOT NULL,
      nombre                    VARCHAR2(20) NOT NULL,
      descripcion               VARCHAR2(99) NOT NULL,
CONSTRAINT condicion_id_pk            PRIMARY KEY (id_pk));
REM ***************************************************************
REM * Las próximas dos instrucciones muestran el nombre del       *
REM * usuario de la cuenta y la fecha del sistema. Esto es        *
REM * requerido para crear o eliminar tablas y otros objetos.     *
REM ***************************************************************
REM
SHOW USER
SELECT systimestamp FROM dual;
REM ***************************************************************
REM *   Creacion tabla encasillado nivel-1                        *
REM ***************************************************************
CREATE TABLE encasillado (
      id_pk                     NUMBER(3)    NOT NULL,
      descripcion               VARCHAR2(99) NOT NULL,
CONSTRAINT encasillado_id_pk            PRIMARY KEY (id_pk));
REM ***************************************************************
REM * Las próximas dos instrucciones muestran el nombre del       *
REM * usuario de la cuenta y la fecha del sistema. Esto es        *
REM * requerido para crear o eliminar tablas y otros objetos.     *
REM ***************************************************************
REM
SHOW USER
SELECT systimestamp FROM dual;
REM ***************************************************************
REM *   Creacion tabla dueno nivel-2                              *
REM ***************************************************************
CREATE TABLE dueno (
      id_pk                     NUMBER(5)       NOT NULL,
      primer_nombre             VARCHAR2(20) 	NOT NULL,
      inicial                   CHAR(1),
      apellido_paterno          VARCHAR2(20) 	NOT NULL,
      apellido_materno          VARCHAR2(20),
      celular                   CHAR(10)        NOT NULL,
      correo_electronico        VARCHAR2(30)    NOT NULL,
      id_direccion_fk           VARCHAR2(4)     NOT NULL,
CONSTRAINT dueno_iddireccion_fk	 FOREIGN KEY  (id_direccion_fk)
                                 REFERENCES direccion(id_pk),
CONSTRAINT dueno_id_pk            PRIMARY KEY (id_pk));
REM ***************************************************************
REM * Las próximas dos instrucciones muestran el nombre del       *
REM * usuario de la cuenta y la fecha del sistema. Esto es        *
REM * requerido para crear o eliminar tablas y otros objetos.     *
REM ***************************************************************
REM
SHOW USER
SELECT systimestamp FROM dual;
REM ***************************************************************
REM *   Creacion tabla comida nivel-2                             *
REM ***************************************************************
CREATE TABLE comida (
      num_pk                    VARCHAR2(6)  NOT NULL,
      nombre                    VARCHAR2(32) NOT NULL,
      unidad_medida             VARCHAR2(15) NOT NULL,
      id_dueno_fk               NUMBER(7,0)  NOT NULL,
CONSTRAINT comida_iddueno_fk	 FOREIGN KEY  (id_dueno_fk)
                                 REFERENCES dueno(id_pk),
CONSTRAINT comida_num_pk              PRIMARY KEY (num_pk));
REM ***************************************************************
REM * Las próximas dos instrucciones muestran el nombre del       *
REM * usuario de la cuenta y la fecha del sistema. Esto es        *
REM * requerido para crear o eliminar tablas y otros objetos.     *
REM ***************************************************************
REM
SHOW USER
SELECT systimestamp FROM dual;
REM ***************************************************************
REM *   Creacion tabla oficina nivel-2                              *
REM ***************************************************************
CREATE TABLE oficina (
      id_pk                     NUMBER(4)       NOT NULL,
      telefono                  CHAR(10)        NOT NULL,
      correo_electronico        VARCHAR2(30)    NOT NULL,
      id_direccion_fk           VARCHAR2(4)     NOT NULL,
CONSTRAINT oficina_iddireccion_fk	 FOREIGN KEY  (id_direccion_fk)
                                 REFERENCES direccion(id_pk),
CONSTRAINT oficina_id_pk            PRIMARY KEY (id_pk));
REM ***************************************************************
REM * Las próximas dos instrucciones muestran el nombre del       *
REM * usuario de la cuenta y la fecha del sistema. Esto es        *
REM * requerido para crear o eliminar tablas y otros objetos.     *
REM ***************************************************************
REM
SHOW USER
SELECT systimestamp FROM dual;
REM ***************************************************************
REM *   Creacion tabla clinica nivel-2                              *
REM ***************************************************************
CREATE TABLE clinica (
      id_pk                     NUMBER(4)       NOT NULL,
      telefono                  CHAR(10)        NOT NULL,
      correo_electronico        VARCHAR2(30)    NOT NULL,
      id_direccion_fk           VARCHAR2(4)     NOT NULL,
CONSTRAINT clinica_iddireccion_fk	 FOREIGN KEY  (id_direccion_fk)
                                 REFERENCES direccion(id_pk),
CONSTRAINT clinica_id_pk            PRIMARY KEY (id_pk));
REM ***************************************************************
REM * Las próximas dos instrucciones muestran el nombre del       *
REM * usuario de la cuenta y la fecha del sistema. Esto es        *
REM * requerido para crear o eliminar tablas y otros objetos.     *
REM ***************************************************************
REM
SHOW USER
SELECT systimestamp FROM dual;
REM ***************************************************************
REM *   Creacion tabla departamento nivel-2                       *
REM ***************************************************************
CREATE TABLE departamento (
      codigo_pk                 CHAR(2)         NOT NULL,
      nombre                    VARCHAR2(25)    NOT NULL,
      descripcion               VARCHAR2(99)    NOT NULL,
      id_oficina_fk             NUMBER(4)       NOT NULL,
CONSTRAINT departamento_idoficina_fk	 FOREIGN KEY  (id_oficina_fk)
                                 REFERENCES oficina(id_pk),
CONSTRAINT departamento_codigo_pk            PRIMARY KEY (codigo_pk));
REM ***************************************************************
REM * Las próximas dos instrucciones muestran el nombre del       *
REM * usuario de la cuenta y la fecha del sistema. Esto es        *
REM * requerido para crear o eliminar tablas y otros objetos.     *
REM ***************************************************************
REM
SHOW USER
SELECT systimestamp FROM dual;
REM ***************************************************************
REM *   Creacion tabla empleado nivel-3                           *
REM ***************************************************************
CREATE TABLE empleado (
      num_pk                    NUMBER(5)       NOT NULL,
      celular                   CHAR(10)        NOT NULL,
      primer_nombre             VARCHAR2(20) 	NOT NULL,
      inicial                   CHAR(1),
      apellido_paterno          VARCHAR2(20) 	NOT NULL,
      apellido_materno          VARCHAR2(20),
      tipo                      CHAR(1),
      salario_mensual           NUMBER(7,2),
      tarifa_contrato           NUMBER(5,2),
      num_contrato              NUMBER(4),
      salario_x_hora            NUMBER(4,2),
      horas_trabajadas          NUMBER(2),
      fecha_nacimiento          DATE            NOT NULL,
      correo_electronico        VARCHAR2(30)    NOT NULL,
      id_direccion_fk1          VARCHAR2(4)     NOT NULL,
      codigo_departamento_fk2   CHAR(2),
      id_clinica_fk3            NUMBER(4),
CHECK ((tipo) IN ('C', 'H', 'A')),
CONSTRAINT empleado_iddireccion_fk1	 FOREIGN KEY  (id_direccion_fk1)
                                 REFERENCES direccion(id_pk),
CONSTRAINT empleado_codigodepartamento_fk2 FOREIGN KEY  (codigo_departamento_fk2)
                                 REFERENCES departamento(codigo_pk),
CONSTRAINT empleado_idclinica_fk3	 FOREIGN KEY  (id_clinica_fk3)
                                 REFERENCES clinica(id_pk),
CONSTRAINT empleado_num_pk            PRIMARY KEY (num_pk));
REM ***************************************************************
REM * Las próximas dos instrucciones muestran el nombre del       *
REM * usuario de la cuenta y la fecha del sistema. Esto es        *
REM * requerido para crear o eliminar tablas y otros objetos.     *
REM ***************************************************************
REM
SHOW USER
SELECT systimestamp FROM dual;
REM ***************************************************************
REM *   Creacion tabla mascota nivel-3                            *
REM ***************************************************************
CREATE TABLE mascota (
      num_pk                    NUMBER(6)    NOT NULL,
      nombre                    VARCHAR2(15) NOT NULL,
      fecha_nacimiento          DATE         NOT NULL,
      raza                      VARCHAR2(20) NOT NULL,
      id_dueno_fk1              NUMBER(7,0)  NOT NULL,
      codigo_animal_fk2         VARCHAR2(4)  NOT NULL,
CONSTRAINT mascota_iddueno_fk	 FOREIGN KEY  (id_dueno_fk1)
                                 REFERENCES dueno(id_pk),
CONSTRAINT mascota_codanimal_fk	 FOREIGN KEY  (codigo_animal_fk2)
                                 REFERENCES animal(codigo_pk),
CONSTRAINT mascota_num_pk              PRIMARY KEY (num_pk));
REM ***************************************************************
REM * Las próximas dos instrucciones muestran el nombre del       *
REM * usuario de la cuenta y la fecha del sistema. Esto es        *
REM * requerido para crear o eliminar tablas y otros objetos.     *
REM ***************************************************************
REM
SHOW USER
SELECT systimestamp FROM dual;
REM ***************************************************************
REM *   Creacion tabla reservacion nivel-3                        *
REM ***************************************************************
CREATE TABLE reservacion (
      num_pk                    VARCHAR2(5)  NOT NULL,
      fecha_inicial             DATE         NOT NULL,
      fecha_final               DATE,
      num_mascota_fk1           NUMBER(6)    NOT NULL,
      id_encasillado_fk2        NUMBER(3)    NOT NULL,
CONSTRAINT reservacion_nummascota_fk	 FOREIGN KEY  (num_mascota_fk1)
                                 REFERENCES mascota(num_pk),
CONSTRAINT reservacion_idencasillado_fk	 FOREIGN KEY  (id_encasillado_fk2)
                                 REFERENCES encasillado(id_pk),
CONSTRAINT reservacion_num_pk              PRIMARY KEY (num_pk));
REM ***************************************************************
REM * Las próximas dos instrucciones muestran el nombre del       *
REM * usuario de la cuenta y la fecha del sistema. Esto es        *
REM * requerido para crear o eliminar tablas y otros objetos.     *
REM ***************************************************************
REM
SHOW USER
SELECT systimestamp FROM dual;
REM ***************************************************************
REM *   Creacion tabla record nivel-3                             *
REM ***************************************************************
CREATE TABLE record (
      id_clinica_pk_fk1           NUMBER(4)    NOT NULL,
      num_mascota_pk_fk2          NUMBER(6)    NOT NULL,
CONSTRAINT record_id_clinica_pk_fk1	 FOREIGN KEY  (id_clinica_pk_fk1)
                                 REFERENCES clinica(id_pk),
CONSTRAINT record_num_mascota_pk_fk2	 FOREIGN KEY  (num_mascota_pk_fk2)
                                 REFERENCES mascota(num_pk),
CONSTRAINT record_id_pk	 PRIMARY KEY  (id_clinica_pk_fk1, num_mascota_pk_fk2));
REM ***************************************************************
REM * Las próximas dos instrucciones muestran el nombre del       *
REM * usuario de la cuenta y la fecha del sistema. Esto es        *
REM * requerido para crear o eliminar tablas y otros objetos.     *
REM ***************************************************************
REM
SHOW USER
SELECT systimestamp FROM dual;
REM ***************************************************************
REM *   Creacion tabla mascota-comida nivel-3                     *
REM ***************************************************************
CREATE TABLE mascotacomida (
      num_mascota_pk_fk1                 NUMBER(6)    NOT NULL,
      num_comida_pk_fk2                  VARCHAR2(6)  NOT NULL,
CONSTRAINT mascotacomida_nummascota_pk_fk1	 FOREIGN KEY  (num_mascota_pk_fk1)
                                 REFERENCES mascota(num_pk),
CONSTRAINT mascotacomida_numcomida_fk	 FOREIGN KEY  (num_comida_pk_fk2)
                                 REFERENCES comida(num_pk),
CONSTRAINT mascotacomida_num_pk	 PRIMARY KEY  (num_mascota_pk_fk1, num_comida_pk_fk2));
REM ***************************************************************
REM * Las próximas dos instrucciones muestran el nombre del       *
REM * usuario de la cuenta y la fecha del sistema. Esto es        *
REM * requerido para crear o eliminar tablas y otros objetos.     *
REM ***************************************************************
REM
SHOW USER
SELECT systimestamp FROM dual;
REM ***************************************************************
REM *   Creacion tabla mascota-objeto nivel-3                     *
REM ***************************************************************
CREATE TABLE mascotaobjeto (
      num_mascota_pk_fk1                 NUMBER(6,0)  NOT NULL,
      id_objeto_pk_fk2                   VARCHAR2(3)  NOT NULL,
CONSTRAINT mascotaobjeto_nummascota_pk_fk1	 FOREIGN KEY  (num_mascota_pk_fk1)
                                 REFERENCES mascota(num_pk),
CONSTRAINT mascotaobjeto_idobjeto_fk	 FOREIGN KEY  (id_objeto_pk_fk2)
                                 REFERENCES objeto(id_pk),
CONSTRAINT mascotaobjeto_id_pk	 PRIMARY KEY  (num_mascota_pk_fk1, id_objeto_pk_fk2));
REM ***************************************************************
REM * Las próximas dos instrucciones muestran el nombre del       *
REM * usuario de la cuenta y la fecha del sistema. Esto es        *
REM * requerido para crear o eliminar tablas y otros objetos.     *
REM ***************************************************************
REM
SHOW USER
SELECT systimestamp FROM dual;
REM ***************************************************************
REM *   Creacion tabla mascota-condicion nivel-3                  *
REM ***************************************************************
CREATE TABLE mascotacondicion (
      num_mascota_pk_fk1                 NUMBER(6,0)  NOT NULL,
      id_condicion_pk_fk2                VARCHAR2(25) NOT NULL,
CONSTRAINT mascotacondicion_nummascota_pk_fk1	 FOREIGN KEY  (num_mascota_pk_fk1)
                                 REFERENCES mascota(num_pk),
CONSTRAINT mascotacondicion_idcondicion_fk	 FOREIGN KEY  (id_condicion_pk_fk2)
                                 REFERENCES condicion(id_pk),
CONSTRAINT mascotacondicion_id_pk	 PRIMARY KEY  (num_mascota_pk_fk1, id_condicion_pk_fk2));
COMMIT;