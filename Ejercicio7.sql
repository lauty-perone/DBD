/*Banda(codigoB, nombreBanda, genero_musical, año_creacion)
Integrante (DNI, nombre, apellido,dirección,email, fecha_nacimiento,codigoB(fk))
Escenario(nroEscenario, nombre _ escenario, ubicación,cubierto, m2, descripción)
Recital(fecha,hora,nroEscenario, codigoB (fk))*/

//ejercicio1
SELECT DISTINCT i.DNI, i.nombre,i .apellido, i.dirección, i.email
FROM Integrante i 
WHERE (i.fecha_nacimiento BETWEEN "01/01/1980" AND "31/12/1990") AND i.DNI IN (
    SELECT i.DNI
    FROM Recital r INNER JOIN Banda b ON (r.codigoB = b.codigoB)
                   INNER JOIN Integrante i ON (b.codigoB = i.codigoB)
    WHERE (r.fecha BETWEEN "01/01/2018" AND "31/12/2018")
)

//ejercicio2
SELECT b.nombre, b.genero_musical, b.año_creacion
FROM Banda b INNER JOIN Recital r ON (b.codigoB = r.codigoB)
WHERE (r.fecha BETWEEN "01/01/2018" AND "31/12/2018")
EXCEPT(
    SELECT b.nombre, b.genero_musical, b.año_creacion
    FROM Banda b INNER JOIN Recital r ON (b.codigoB = r.codigoB)
    WHERE (r.fecha BETWEEN "01/01/2017" AND "31/12/2017")
)

//ejercicio3
SELECT b.nombre, r.fecha, r.hora, e.nombre_escenario, e.ubicación
FROM Recital r INNER JOIN Banda b ON (r.codigoB = b.codigoB)
               INNER JOIN Escenario e ON (r.nroEscenario = e.nroEscenario)
WHERE (r.fecha = "04/12/2018")

//ejercicio4
SELECT i.DNI, i.nombre, i.apellido, i.email
FROM Integrante i INNER JOIN Recital r ON (i.codigoB = r.codigoB)
                  INNER JOIN Escenario e ON (r.nroEscenario = e.nroEscenario)
WHERE (e.nombre_escenario = "Gustavo Cerati")
INTERSECT (
    SELECT i.DNI, i.nombre, i.apellido, i.email
FROM Integrante i INNER JOIN Recital r ON (i.codigoB = r.codigoB)
                  INNER JOIN Escenario e ON (r.nroEscenario = e.nroEscenario)
WHERE (e.nombre_escenario = "Carlos Gardel")
)

//ejercicio5
SELECT b.nombreBanda, b.genero_musical,b.año_creacion
FROM Banda b INNER JOIN Integrante i ON (b.codigoB = i.codigoB)
GROUP BY b.codigoB, b.nombreBanda, b.genero_musical, b.año_creacion
HAVING COUNT(*) > 8

//ejercicio6
SELECT e.nombre_escenario, e.ubicación, e.descripcion
FROM Escenario e INNER JOIN Recital r ON (e.nroEscenario = r.nroEscenario)
                 INNER JOIN Banda b ON (r.codigoB = b.codigoB)
WHERE (b.genero_musical = "Rock and Roll")
EXCEPT (
    SELECT e.nombre_escenario, e.ubicación, e.descripcion
FROM Escenario e INNER JOIN Recital r ON (e.nroEscenario = r.nroEscenario)
                 INNER JOIN Banda b ON (r.codigoB = b.codigoB)
WHERE (b.genero_musical <> "Rock and Roll")
)
ORDER BY e.nombre_escenario

//ejercicio7
SELECT b.nombreBanda, b.genero_musical, b.año_creacion
FROM Banda b INNER JOIN Recital r ON (b.codigoB = r.codigoB)
             INNER JOIN Escenenario e ON (r.nroEscenario = e.nroEscenario)
WHERE (e.cubierto = True) AND (r.fecha BETWEEN "01/01/2018" AND "31/12/2018")

//ejercicio8
SELECT e.nombre_escenario,COUNT (*) AS CantidadRecitales
FROM Escenario e LEFT JOIN  Recital r ON (e.nroEscenario = r.nroEscenario)
WHERE (r.fecha BETWEEN "01/01/2018" AND "31/12/2018")
ORDER BY e.nroEscenario, e.nombre_escenario

//ejercicio9
UPDATE Banda SET nombreBanda = "Memphis la Blusera" WHERE nombreBanda = "Mempis la Blusera"