-- 1. Listar Vehículos Disponibles: Obtener una lista de todos los vehículos disponibles para la venta, incluyendo detalles como marca, modelo, y precio.

SELECT id_vehiculo, marca_vehiculo, modelo_vehiculo, precio_vehiculo
FROM tbl_vehiculo
WHERE id_vehiculo NOT IN (
    SELECT id_vehiculo
    FROM tbl_ventas
);

-- 2. Clientes con Compras Recientes: Mostrar los clientes que han realizado compras recientemente, junto con la información de los vehículos adquiridos.

SELECT c.nombre_cliente, c.apellido_cliente, c.email_cliente, v.fecha_venta, v.medio_pago, 
       ve.marca_vehiculo, ve.modelo_vehiculo, ve.anyo_fabricacion, ve.precio_vehiculo
FROM tbl_cliente c
INNER JOIN tbl_ventas v ON c.dni_cliente = v.dni_cliente
INNER JOIN tbl_vehiculo ve ON v.id_vehiculo = ve.id_vehiculo
ORDER BY v.fecha_venta DESC;


-- 3. Historial de Servicios por Vehículo: Obtener el historial completo de servicios realizados para un vehículo específico, incluyendo detalles sobre los empleados involucrados y las fechas de servicio.

SELECT sr.placa_vehiculo, sr.fecha_servicio , e.*  FROM tbl_servicio_realizado sr
INNER JOIN tbl_empleado e ON sr.dni_empleado = e.dni_empleado
WHERE sr.placa_vehiculo = 'PQR678';


-- 4. Proveedores de Piezas Utilizados: Listar los proveedores de piezas que han suministrado componentes utilizados en los servicios de mantenimiento.

SELECT DISTINCT pr.nit_proveedor, pr.razon_social
FROM tbl_pieza pz
INNER JOIN tbl_piezas_servicio ps ON pz.id_pieza = ps.id_pieza
INNER JOIN tbl_servicio_realizado sr ON ps.id_servicio_realizado = sr.id_servicio_realizado
INNER JOIN tbl_proveedor pr ON pz.nit_proveedor = pr.nit_proveedor
WHERE sr.tipo_servicio = 'mantenimiento';


-- 5. Rendimiento del Personal de Ventas: Calcular las comisiones generadas por cada empleado del departamento de ventas en un período específico.

SELECT e.dni_empleado, CONCAT(e.nombre_empleado, ' ', e.apellido_empleado) AS "Nombre Empleado",
       SUM(comision_generada) AS "Total Comisiones"
FROM tbl_departamento_venta dv
JOIN tbl_empleado e ON dv.dni_empleado = e.dni_empleado
WHERE dv.fecha_reporte BETWEEN '2023-01-01' AND '2023-12-31'
GROUP BY e.dni_empleado, e.nombre_empleado, e.apellido_empleado;

-- 6. Servicios Realizados por un Empleado: Identificar todos los servicios de mantenimiento realizados por un empleado específico, incluyendo detalles sobre los vehículos atendidos.

SELECT sr.fecha_servicio, sr.tipo_servicio, sr.descripcion_servicio,
       vs.marca_vehiculo, vs.modelo_vehiculo
FROM tbl_servicio_realizado sr
JOIN tbl_empleado e ON sr.dni_empleado = e.dni_empleado
JOIN tbl_vehiculo_servicio vs ON sr.placa_vehiculo = vs.placa_vehiculo
WHERE e.dni_empleado = '632541879' 
      AND sr.tipo_servicio = 'mantenimiento';
	  
-- SELECT * FROM tbl_servicio_realizado;


-- 7. Clientes Potenciales y Vehículos de Interés: Mostrar información sobre los clientes potenciales y los vehículos de su interés, proporcionando pistas valiosas para estrategias de marketing.

SELECT cp.dni_cliente, c.nombre_cliente, c.apellido_cliente, c.email_cliente, c.telefono_cliente,
       v.marca_vehiculo, v.modelo_vehiculo, v.anyo_fabricacion, v.precio_vehiculo
FROM tbl_cliente_potencial cp
JOIN tbl_cliente c ON cp.dni_cliente = c.dni_cliente
JOIN tbl_vehiculo v ON cp.id_vehiculo = v.id_vehiculo;


-- 8. Empleados del Departamento de Servicio: Listar todos los empleados que pertenecen al departamento de servicio, junto con sus horarios de trabaio.


SELECT e.nombre_empleado, e.apellido_empleado, ds.hora_inicio, ds.hora_fin
FROM tbl_empleado e
JOIN tbl_departamento_servicio ds ON e.dni_empleado = ds.dni_empleado;


-- 9. Vehiculos Vendidos en un Rango de Precios: Encontrar los veículos vendidos en un rango de precios específico, proporcionando datos útiles para análisis de ventas.

SELECT v.id_vehiculo, v.marca_vehiculo, v.modelo_vehiculo, v.anyo_fabricacion, v.precio_vehiculo
FROM tbl_ventas ven
JOIN tbl_vehiculo v ON ven.id_vehiculo = v.id_vehiculo
WHERE ven.id_vehiculo IS NOT NULL -- Asegurarse de que el vehículo esté vendido
AND v.precio_vehiculo BETWEEN 10000 AND 20000;


-- 10. Clientes con Múltiples Compras: Identificar a aquellos clientes que han realizado más de una compra en el concesionario, destacando la lealtad del cliente.

SELECT c.dni_cliente, c.nombre_cliente, c.apellido_cliente, COUNT(*) AS total_compras
FROM tbl_cliente c
JOIN tbl_ventas v ON c.dni_cliente = v.dni_cliente
GROUP BY c.dni_cliente, c.nombre_cliente, c.apellido_cliente
HAVING COUNT(*) > 1;
