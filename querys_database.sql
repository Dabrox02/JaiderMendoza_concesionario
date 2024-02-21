-- Listar vehiculos disponible

SELECT id_vehiculo, marca_vehiculo, modelo_vehiculo, precio_vehiculo
FROM tbl_vehiculo
WHERE id_vehiculo NOT IN (
    SELECT id_vehiculo
    FROM tbl_ventas
);


-- Clientes con compras recientes, junto con la informacion del vehiculo comprado

SELECT c.nombre_cliente, c.apellido_cliente, c.email_cliente, v.fecha_venta, v.medio_pago, 
       ve.marca_vehiculo, ve.modelo_vehiculo, ve.anyo_fabricacion, ve.precio_vehiculo
FROM tbl_cliente c
INNER JOIN tbl_ventas v ON c.dni_cliente = v.dni_cliente
INNER JOIN tbl_vehiculo ve ON v.id_vehiculo = ve.id_vehiculo
ORDER BY v.fecha_venta DESC;


-- Historial de servicios por vehiculo, incluyendo detalles de los empleados involucrados y fechas del servicio

SELECT sr.placa_vehiculo, sr.fecha_servicio , e.*  FROM tbl_servicio_realizado sr
INNER JOIN tbl_empleado e ON sr.dni_empleado = e.dni_empleado
WHERE sr.placa_vehiculo = 'PQR678';


-- Proveedores piezas utilizadas

SELECT DISTINCT pr.nit_proveedor, pr.razon_social
FROM tbl_pieza pz
INNER JOIN tbl_piezas_servicio ps ON pz.id_pieza = ps.id_pieza
INNER JOIN tbl_servicio_realizado sr ON ps.id_servicio_realizado = sr.id_servicio_realizado
INNER JOIN tbl_proveedor pr ON pz.nit_proveedor = pr.nit_proveedor
WHERE sr.tipo_servicio = 'mantenimiento';


-- Rendimiento personal de ventas

