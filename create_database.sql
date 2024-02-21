CREATE DATABASE JaiderMendoza_concesionario;

CREATE TYPE "estado_vehiculo" AS ENUM (
  'nuevo',
  'usado'
);

CREATE TYPE "tipo_servicio" AS ENUM (
  'mantenimiento',
  'reparacion'
);

CREATE TABLE "tbl_vehiculo" (
  "id_vehiculo" SERIAL PRIMARY KEY,
  "marca_vehiculo" varchar(50) NOT NULL,
  "modelo_vehiculo" int NOT NULL,
  "anyo_fabricacion" int NOT NULL,
  "precio_vehiculo" decimal(10,2) NOT NULL,
  "estado_vehiculo" estado_vehiculo NOT NULL
);

CREATE TABLE "tbl_cliente" (
  "dni_cliente" varchar(15) PRIMARY KEY,
  "nombre_cliente" varchar(50) NOT NULL,
  "apellido_cliente" varchar(50) NOT NULL,
  "email_cliente" varchar(80) UNIQUE NOT NULL,
  "telefono_cliente" varchar(50) NOT NULL
);

CREATE TABLE "tbl_cliente_potencial" (
  "dni_cliente" varchar(15) NOT NULL,
  "id_vehiculo" int NOT NULL
);

CREATE TABLE "tbl_ventas" (
  "id_venta" SERIAL PRIMARY KEY,
  "dni_cliente" varchar(15) NOT NULL,
  "id_vehiculo" int NOT NULL,
  "dni_vendedor" varchar(15) NOT NULL,
  "fecha_venta" date NOT NULL,
  "medio_pago" varchar(25) NOT NULL
);

CREATE TABLE "tbl_rol" (
  "id_rol" SERIAL PRIMARY KEY,
  "nombre_rol" varchar(50) NOT NULL,
  "descripcion_rol" text
);

CREATE TABLE "tbl_empleado" (
  "dni_empleado" VARCHAR(15) PRIMARY KEY,
  "nombre_empleado" varchar(50) NOT NULL,
  "apellido_empleado" varchar(50) NOT NULL,
  "email_empleado" varchar(80) UNIQUE NOT NULL,
  "telefono_empleado" varchar(50) NOT NULL,
  "fecha_contratacion" date NOT NULL,
  "id_rol" int NOT NULL
);

CREATE TABLE "tbl_servicio_realizado" (
  "id_servicio_realizado" SERIAL PRIMARY KEY,
  "dni_empleado" varchar(15) NOT NULL,
  "placa_vehiculo" varchar(10) NOT NULL,
  "fecha_servicio" date NOT NULL,
  "tipo_servicio" tipo_servicio NOT NULL,
  "descripcion_servicio" text
);

CREATE TABLE "tbl_piezas_servicio" (
  "id_servicio_realizado" int NOT NULL,
  "id_pieza" int NOT NULL
);

CREATE TABLE "tbl_pieza" (
  "id_pieza" SERIAL PRIMARY KEY,
  "nombre_pieza" varchar(50) NOT NULL,
  "nit_proveedor" varchar(20) NOT NULL
);

CREATE TABLE "tbl_proveedor" (
  "nit_proveedor" varchar(20) PRIMARY KEY,
  "razon_social" varchar(50) NOT NULL,
  "direccion_proveedor" varchar(80) NOT NULL,
  "telefono_proveedor" varchar(15) NOT NULL,
  "email_proveedor" varchar(80) UNIQUE NOT NULL
);

CREATE TABLE "tbl_vehiculo_servicio" (
  "placa_vehiculo" varchar(10) PRIMARY KEY,
  "marca_vehiculo" varchar(50) NOT NULL,
  "modelo_vehiculo" int NOT NULL,
  "dni_propietario" varchar(15) NOT NULL
);

CREATE TABLE "tbl_departamento_venta" (
  "id_reporte_ventas" SERIAL PRIMARY KEY,
  "fecha_reporte" date NOT NULL,
  "dni_empleado" varchar(15) NOT NULL,
  "comision_generada" decimal(8,2) NOT NULL,
  "ventas_realizadas" decimal(10,2) NOT NULL
);

CREATE TABLE "tbl_departamento_servicio" (
  "id_departamento_servicio" SERIAL PRIMARY KEY,
  "dni_empleado" varchar(15) NOT NULL,
  "hora_inicio" TIME NOT NULL,
  "hora_fin" TIME NOT NULL
);

ALTER TABLE "tbl_ventas" ADD FOREIGN KEY ("dni_cliente") REFERENCES "tbl_cliente" ("dni_cliente");

ALTER TABLE "tbl_ventas" ADD FOREIGN KEY ("id_vehiculo") REFERENCES "tbl_vehiculo" ("id_vehiculo");

ALTER TABLE "tbl_empleado" ADD FOREIGN KEY ("id_rol") REFERENCES "tbl_rol" ("id_rol");

ALTER TABLE "tbl_servicio_realizado" ADD FOREIGN KEY ("dni_empleado") REFERENCES "tbl_empleado" ("dni_empleado");

ALTER TABLE "tbl_servicio_realizado" ADD FOREIGN KEY ("placa_vehiculo") REFERENCES "tbl_vehiculo_servicio" ("placa_vehiculo");

ALTER TABLE "tbl_piezas_servicio" ADD FOREIGN KEY ("id_servicio_realizado") REFERENCES "tbl_servicio_realizado" ("id_servicio_realizado");

ALTER TABLE "tbl_piezas_servicio" ADD FOREIGN KEY ("id_pieza") REFERENCES "tbl_pieza" ("id_pieza");

ALTER TABLE "tbl_pieza" ADD FOREIGN KEY ("nit_proveedor") REFERENCES "tbl_proveedor" ("nit_proveedor");

ALTER TABLE "tbl_departamento_venta" ADD FOREIGN KEY ("dni_empleado") REFERENCES "tbl_empleado" ("dni_empleado");

ALTER TABLE "tbl_departamento_servicio" ADD FOREIGN KEY ("dni_empleado") REFERENCES "tbl_empleado" ("dni_empleado");

ALTER TABLE "tbl_ventas" ADD FOREIGN KEY ("dni_vendedor") REFERENCES "tbl_empleado" ("dni_empleado");

ALTER TABLE "tbl_cliente_potencial" ADD FOREIGN KEY ("dni_cliente") REFERENCES "tbl_cliente" ("dni_cliente");

ALTER TABLE "tbl_cliente_potencial" ADD FOREIGN KEY ("id_vehiculo") REFERENCES "tbl_vehiculo" ("id_vehiculo");
