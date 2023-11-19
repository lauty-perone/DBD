//ejercicio1
SELECT p.nombreP, p.descripcion, p.fechaInicioP, p.fechaFinP,fechaFinP
FROM Proyecto p
WHERE (p.fechaFinP IS NOT NULL ) AND (p.fechaFinP > p.fechaFinEstimada)

//ejercicio2
SELECT *
FROM Empleado e
WHERE e.DNI NOT IN(
    SELECT p.DNIResponsable
    FROM Proyecto p
)
ORDER BY e.apellido, e.nombre

//ejercicio3
SELECT e.DNI, e.nombre, e.apellido, e.telefono, e.dirección
FROM Empleado e INNER JOIN Equipo eq ON (e.DNI, eq.DNILider)
GROUP BY e.DNI,e.nombre,e.apellido, e.telefono, e.dirección
HAVING COUNT (*)> 1

//ejercicio4
SELECT e.DNI, e.nombre, e.apellido, e.telefono, e.dirección
FROM Empleado e INNER JOIN Empleado_Equipo ee ON (e.DNI =  ee.DNI )
                INNER JOIN Proyecto p ON (ee.codEquipo = p.equipoBackend)
WHERE (p.nombreO = "Proyecto X")
UNION (
    SELECT e.DNI, e.nombre, e.apellido, e.telefono, e.dirección
FROM Empleado e INNER JOIN Empleado_Equipo ee ON (e.DNI =  ee.DNI )
                INNER JOIN Proyecto p ON (ee.codEquipo = p.equipoFrontend)
WHERE (p.nombreO = "Proyecto X")
)

//ejercicio5
SELECT eq.nombreE, e.DNI,e.nombre,e.apellido, e.telefono, e.dirección
FROM Equipo eq INNER JOIN Empleado e ON (eq.DNILider = e.DNI)
WHERE (eq.descripcionTecnologias LIKE "%Java%")AND (eq.codEquipo NOT IN(
    SELECT ee.codEquipo
    FROM Empleado_Equipo ee
))

//ejercicio6
UPDATE Empleado SET 43732185, "Lautaro", "Perone", 2346694768,"kndck", "2184" WHERE DNI = 40568965

//ejercicio7
SELECT e.DNI, e.nombre, e.apellido, e.telefono, e.dirección
FROM Empleado e INNER JOIN Proyecto p ON (e.DNI = p.DNIResponsable)
WHERE e.DNI NOT IN (
    SELECT eq.DNILider
    FROM Equipo eq
)

//ejercicio8
SELECT eq.nombreE, eq.descripcionTecnologias
FROM Equipo eq INNER JOIN Proyecto p ON (eq.codEquipo = p.equipoBackend)
INTERSECT (
    SELECT eq.nombreE, eq.descripcionTecnologias
    FROM Equipo eq INNER JOIN Proyecto p ON (eq.codEquipo = p.equipoFrontend)
)

//ejercicio9
SELECT p.nombreP, p.descripcion, p.fechaInicioP, e.nombre, e.apellido
FROM Proyecto p INNER JOIN Empleado e ON (p.DNIResponsable = e.DNI)
WHERE (p.fechaFinEstimada BETWEEN "01/01/2019" AND "31/12/2019")
