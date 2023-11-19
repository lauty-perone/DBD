/*Barberia= (codBarberia, razon_social, direccion, telefono)
  Cliente = (nroCLiente, DNI, nombYAP, direccionC, fechaNacimiento, celular)
  Barbero = (codEmpleado, DNIB,nombYApB, direccionB, telefonoContacto, mail)
  Atencion= (codEmpleado, Fecha,hora,codBarberia(fk), nroCliente(fk), descTratamiento, valor)*/

//ejercicio1
SELECT c.DNI, c.nombYAp, c,direccionC, c.fechaNacimiento,c.celular
FROM Cliente c 
WHERE c.nroCliente NOT IN (
    SELECT a.nroCliente
    FROM Atencion a 
    WHERE (a.fecha BETWEEN "01/01/2018" AND "31/12/2018")
)

//ejercicio2
SELECT b.DNIB, b.nombYApB, b.direccionB, b.telefonoContacto,b.mail, COUNT (*)AS CantidadAtenciones
FROM Barbero b INNER JOIN Atencion a ON (b.codEmpleado = a.codEmpleado)
WHERE (a.fecha BETWEEN "01/01/2018" AND "31/12/2018")
GROUP BY b.codEmpleado, b.DNIB, b.nombYApB, b.direccionB, b.telefonoContacto, b.mail

//ejercicio3
SELECT bar.razon_social, bar.direccion, bar.telefono
FROM Barberia bar INNER JOIN Atencion a ON (bar.codBarberia = a.codBarberia)
                  INNER JOIN Cliente c ON (a.nroCliente = c.nroCliente)
WHERE (c.DNI = 22283566)
ORDER BY bar.razon_social, bar.direccion

//ejercicio4
SELECT b.DNIB, b.nombYApB, b.direccionB, b.telefonoContacto, b.mail
FROM Barbero b INNER JOIN Atencion a ON (b.codEmpleado = a.codEmpleado)
WHERE (a.valor > 5000)

//ejercicio5
SELECT c.DNI, c.nombYAp, c.direccionC, c.fechaNacimiento, c.celular 
FROM Cliente c INNER JOIN Atencion a ON (c.nroCliente = a.nroCliente)
               INNER JOIN Barberia bar ON (a.codBarberia = bar.codBarberia)
WHERE (bar.razon_social ="Corta barba")
INTERSECT (
    SELECT c.DNI, c.nombYAp, c.direccionC, c.fechaNacimiento, c.celular 
FROM Cliente c INNER JOIN Atencion a ON (c.nroCliente = a.nroCliente)
               INNER JOIN Barberia bar ON (a.codBarberia = bar.codBarberia)
WHERE (bar.razon_social ="Barberia Barbara")
)

//ejercicio6
DELETE FROM Atencion WHERE nroCliente IN (
    SELECT c.nroCliente
    FROM Cliente c 
    WHERE c.DNI = 22222222
)

DELETE FROM Cliente WHERE DNI = 22222222