INSERT INTO tbl_vehiculo (marca_vehiculo, modelo_vehiculo, anyo_fabricacion, precio_vehiculo, estado_vehiculo)
VALUES 
  ('Toyota', 2022, 2023, 25000.00, 'nuevo'),
  ('Ford', 2019, 2020, 18000.00, 'usado'),
  ('Chevrolet', 2017, 2018, 15000.00, 'usado'),
  ('Honda', 2021, 2022, 22000.00, 'nuevo'),
  ('Nissan', 2015, 2016, 12000.00, 'usado'),
  ('BMW', 2018, 2019, 30000.00, 'usado'),
  ('Mercedes-Benz', 2020, 2021, 35000.00, 'nuevo');


INSERT INTO tbl_cliente (dni_cliente, nombre_cliente, apellido_cliente, email_cliente, telefono_cliente)
VALUES 
  ('123456789', 'Juan', 'Pérez', 'juan@example.com', '123-456-7890'),
  ('987654321', 'María', 'López', 'maria@example.com', '987-654-3210'),
  ('456789123', 'Carlos', 'González', 'carlos@example.com', '456-789-1230'),
  ('789123456', 'Laura', 'Martínez', 'laura@example.com', '789-123-4560'),
  ('369852147', 'Ana', 'Sánchez', 'ana@example.com', '369-852-1470'),
  ('258741369', 'Pedro', 'Gómez', 'pedro@example.com', '258-741-3690'),
  ('147258369', 'Sofía', 'Rodríguez', 'sofia@example.com', '147-258-3690'),
  ('632541879', 'David', 'Hernández', 'david@example.com', '632-541-8790');


INSERT INTO tbl_rol (nombre_rol, descripcion_rol)
VALUES 
  ('Administrador', 'Rol con permisos de administración del sistema.'),
  ('Vendedor', 'Rol para los empleados encargados de las ventas.'),
  ('Gerente', 'Rol para los gerentes de la empresa.'),
  ('Mantenimiento Vehiculos', 'Rol para los de mantenimiento y reparaciones de vehiculos de la empresa.');


INSERT INTO tbl_empleado (dni_empleado, nombre_empleado, apellido_empleado, email_empleado, telefono_empleado, fecha_contratacion, id_rol)
VALUES 
  ('123456789', 'Juan', 'Pérez', 'juan@example.com', '123-456-7890', '2023-01-15', 1),
  ('987654321', 'María', 'López', 'maria@example.com', '987-654-3210', '2022-05-20', 2),
  ('456789123', 'Carlos', 'González', 'carlos@example.com', '456-789-1230', '2023-03-10', 3),
  ('789123456', 'Laura', 'Martínez', 'laura@example.com', '789-123-4560', '2021-11-28', 4),
  ('369852147', 'Ana', 'Sánchez', 'ana@example.com', '369-852-1470', '2022-09-03', 2),
  ('258741369', 'Pedro', 'Gómez', 'pedro@example.com', '258-741-3690', '2023-02-14', 4),
  ('147258369', 'Sofía', 'Rodríguez', 'sofia@example.com', '147-258-3690', '2021-07-10', 2),
  ('632541879', 'David', 'Hernández', 'david@example.com', '632-541-8790', '2022-11-30', 4);


INSERT INTO tbl_proveedor (nit_proveedor, razon_social, direccion_proveedor, telefono_proveedor, email_proveedor)
VALUES 
  ('123456789-0', 'Proveedor A', 'Calle 123, Ciudad X', '123-456-7890', 'proveedora@example.com'),
  ('987654321-0', 'Proveedor B', 'Avenida Principal, Ciudad Y', '987-654-3210', 'proveedorb@example.com'),
  ('456789123-0', 'Proveedor C', 'Carrera 456, Ciudad Z', '456-789-1230', 'proveedorc@example.com'),
  ('789123456-0', 'Proveedor D', 'Avenida Central, Ciudad W', '789-123-4560', 'proveedord@example.com'),
  ('369852147-0', 'Proveedor E', 'Calle 789, Ciudad M', '369-852-1470', 'proveedore@example.com'),
  ('258741369-0', 'Proveedor F', 'Avenida 567, Ciudad N', '258-741-3690', 'proveedorf@example.com'),
  ('147258369-0', 'Proveedor G', 'Carrera 321, Ciudad O', '147-258-3690', 'proveedorg@example.com'),
  ('632541879-0', 'Proveedor H', 'Avenida 654, Ciudad P', '632-541-8790', 'proveedorh@example.com');


INSERT INTO tbl_ventas (dni_cliente, id_vehiculo, dni_vendedor, fecha_venta, medio_pago)
VALUES 
  ('123456789', 1, '987654321', '2023-05-10', 'Efectivo'),
  ('369852147', 3, '147258369', '2023-06-15', 'Cheque'),
  ('258741369', 4, '147258369', '2023-08-25', 'Efectivo'),
  ('147258369', 5, '147258369', '2023-09-30', 'Cheque'),
  ('123456789', 2, '987654321', '2024-02-15', 'Efectivo');

INSERT INTO tbl_cliente_potencial (dni_cliente, id_vehiculo)
VALUES 
  ('123456789', 7),
  ('456789123', 5),
  ('456789123', 3),
  ('369852147', 4);


INSERT INTO tbl_vehiculo_servicio (placa_vehiculo, marca_vehiculo, modelo_vehiculo, dni_propietario)
VALUES 
  ('ABC123', 'Toyota', 2022, '123456789A'),
  ('DEF456', 'Honda', 2019, '987654321B'),
  ('GHI789', 'Ford', 2017, '456789123C'),
  ('JKL012', 'Chevrolet', 2020, '789123456D'),
  ('MNO345', 'Nissan', 2015, '369852147E'),
  ('PQR678', 'BMW', 2018, '258741369F'),
  ('STU901', 'Mercedes-Benz', 2021, '147258369G');


INSERT INTO tbl_servicio_realizado (dni_empleado, placa_vehiculo, fecha_servicio, tipo_servicio, descripcion_servicio)
VALUES 
  ('789123456', 'JKL012', '2023-05-10', 'mantenimiento', 'Cambio de aceite y filtro'),
  ('258741369', 'DEF456', '2023-06-15', 'reparacion', 'Reemplazo de la bomba de agua'),
  ('632541879', 'MNO345', '2023-09-30', 'mantenimiento', 'Alineación y balanceo de ruedas'),
  ('632541879', 'PQR678', '2023-10-05', 'reparacion', 'Reparación del sistema eléctrico'),
  ('632541879', 'STU901', '2023-11-10', 'mantenimiento', 'Cambio de bujías y cables de encendido');


INSERT INTO tbl_pieza (nombre_pieza, nit_proveedor)
VALUES 
  ('Filtro de aceite', '369852147-0'),
  ('Bomba de agua', '632541879-0'),
  ('Pastillas de freno', '147258369-0'),
  ('Bujías', '987654321-0'),
  ('Lámpara frontal', '987654321-0'),
  ('Bobina de encendido', '789123456-0'),
  ('Correa de distribución', '369852147-0');


INSERT INTO tbl_piezas_servicio (id_servicio_realizado, id_pieza)
VALUES 
  (1, 2),
  (2, 4),
  (3, 6),
  (4, 7),
  (5, 1);


INSERT INTO tbl_departamento_venta (fecha_reporte, dni_empleado, comision_generada, ventas_realizadas)
VALUES 
  ('2023-01-01', '987654321', 2500.00, 10.00),
  ('2023-01-02', '987654321', 3000.00, 12.00),
  ('2023-01-01', '369852147', 2000.00, 8.00),
  ('2023-01-02', '369852147', 3500.00, 14.00),
  ('2023-02-05', '147258369', 2800.00, 11.00);


INSERT INTO tbl_departamento_servicio (dni_empleado, hora_inicio, hora_fin)
VALUES 
  ('789123456', '08:00:00', '16:00:00'),
  ('258741369', '09:00:00', '17:00:00'),
  ('632541879', '10:00:00', '18:00:00');
