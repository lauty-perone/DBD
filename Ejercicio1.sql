//ejercicio 1
SELECT c.nombre, c.apellido, c.direccion, c.DNI, c.telefono
FROM Cliente c 
WHERE (apellido LIKE "Pe%")

//ejercicio 2
SELECT c.nombre, c.apellido, c.DNI, c.direccion, c.telefono
FROM Cliente c INNER JOIN Factura f ON (c.idCliente = f.idCliente)
WHERE (f.fecha BETWEEN 01/01/2017 and 31/12/2017)
EXCEPT 
SELECT c.nombre, c.apellido, c.DNI, c.direccion, c.telefono
FROM Cliente c INNER JOIN Factura f ON (c.idCliente =  f.idCliente)
WHERE(f.fecha < 01/01/2017 and f.fecha 31/12/2017)

//ejercicio 3
SELECT p.nombre,p.descripcion, p.precio,p.stock
FROM Producto p 
INNER JOIN Detalle d ON (p.idProducto = d.idProducto)
INNER JOIN Factura f ON (f.nroticket = d.nroticket)
INNER JOIN Cliente c ON (c.idCliente =  p.idCliente)
WHERE (c.DNI = 45789456)
EXCEPT 
SELECT p.nombre,p.descripcion, p.precio,p.stock
FROM Producto p 
INNER JOIN Detalle d ON (p.idProducto = d.idProducto)
INNER JOIN Factura f ON (f.nroticket = d.nroticket)
INNER JOIN Cliente c ON (c.idCliente =  p.idCliente)
WHERE (c.apellido = "Garcia")

//ejercicio 4
SELECT p.nombre, p.descripcion, p.precio, p.stock
FROM Producto p 

WHERE p.idProducto NOT IN (
SELECT p.idProducto
FROM Producto p
INNER JOIN Detalle d ON (p.idProducto = d.idProducto)
INNER JOIN Factura f ON (f.nroTicket = d.nroTicket)
INNER JOIN Cliente c ON (c.idCliente =  p.idCliente)
WHERE (c.telefono LIKE  "221%"))
ORDER BY c.nombre, c.apellido

//ejercicio 5
SELECT p.nombre, p.descripcion, p.precio, SUM(d.cantidad) as Cantidad
FROM Producto p LEFT JOIN Detalle d ON (p.idProducto = d.idProducto)
GROUP BY p.idProducto, p.nombre, p.descripcion,p.precio

//ejercico 6
SELECT c.nombre, c.apellido, c.DNI, c.telefono, c.direccion
FROM Cliente c 
INNER JOIN Factura f ON (f.idCliente = c.idCliente)
INNER JOIN Detalle d ON (d.nroTicket = f.nroTicket)
INNER JOIN Producto p ON (p.idProducto = d.idProducto)
WHERE (p.nombre = "prod1" and p.nombre = "prod2")
EXCEPT 
SELECT c.nombre, c.apellido, c.DNI, c.telefono, c.direccion
FROM Cliente c 
INNER JOIN Factura f ON (f.idCliente = c.idCliente)
INNER JOIN Detalle d ON (d.nroTicket = f.nroTicket)
INNER JOIN Producto p ON (p.idProducto = d.idProducto)
WHERE (p.nombre = "prod3")

//ejercicio 7
SELECT f.nroTicket, f.total, f.fecha, f.hora , c.DNI
FROM Factura f INNER JOIN Cliente c ON  (f.idCliente = c.idCliente)
WHERE (SELECT p.idProducto FROM
        Detalle d ON(f.nroTicket P= d.nroTicket)
        INNER JOIN Producto p ON (p.idProducto = d.idProducto)
        WHERE ((p.nombreP = "prod38") or (f.fecha BETWEEN 01/01/2019 and 31/12/2019)))

//ejercicio 8
INSERT INTO Cliente(idCliente, nombre, apellido,DNI, telefono, direccion)
VALUES (500002,"Jorge Luis", "Castor", 40578999,2214400789,"11 entre 500 y 501 nro: 2587")

//ejercicio 9 
SELECT f.nroTicket, f.total,f.fecha,f.hora 
FROM Producto p INNER JOIN Detalle d ON (p.idProducto = d.idProducto)
INNER JOIN Factura f ON (d.nroTicket = f.nroTicket)
INNER JOIN Cliente c ON (f.idCliente = c.idCliente)
WHERE (c.nombre = "Jorge")and (c.apellido = "Pérez") and f.nroTicket NOT IN(
    SELECT f.nroTicket
    FROM Producto p 
    INNER JOIN Detalle d ON (p.idProducto = d.idProducto)
    INNER JOIN Factura f ON(f.nroTicket = d.nroTicket)
    INNER JOIN Cliente c ON(c.idCliente = f.idCliente)
    WHERE (p.nombreP ="Z")
)

//ejercicio 10
SELECT c.DNI,c.apellido,c.nombre, SUM(f.total) as total
FROM Cliente c INNER JOIN Factura f ON (c.idCliente = f.idCliente)
GROUP BY c.DNI, c.apellido, c.nombre
HAVING SUM (f.total > 10000000)