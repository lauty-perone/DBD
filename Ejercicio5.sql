//ejercicio1
SELECT DISTINCT a.especie, a.años, a.calle, a.nro, l.nombreL
FROM Podador p INNER JOIN Poda.po ON (p.DNI = po.DNI)
INNER JOIN Arbol a ON (po.nroArbol = a.nroArbol)
INNER JOIN Localidad l ON (a.codigoPostal = l.codigoPostal)
WHERE (p.nombre = "Juan")AND (p.apellido = "Perez")
INTERSECT(
    SELECT DISTINCT a.especie, a.años, a.calle, a.nro, l.nombreL
    FROM Arbol a INNER JOIN Localidad l ON (a.codigoPostal = l.CodigoPostal)
        INNER JOIN Poda po ON (a.nroArbol = po.nroArbol)
        INNER JOIN Podador p ON (po.DNI = p.DNI)
    WHERE p.nombre = "Jose" AND p.apellido = "Garcia"
)

//ejercicio2
SELECT DISTINCT p.DNI, p.nombre, p.apellido, p.fnac, l.nombreL
FROM Podador p INNER JOIN Poda po ON (p.DNI = po.DNI)
INNER JOIN Localidad l ON (p.codigoPostalVive = p.codigoPostal)
WHERE (po.fecha BETWEEN "01/01/2018" AND "31/12/2018")

//ejercicio3
SELECT DISTINCT a.especie, a.años, a.calle, a.nro, l.nombreL
FROM Arbol a INNER JOIN Localidad l ON(a.codigoPostal= l.codigoPostal)
WHERE NOT EXIST (
    SELECT * 
    FROM Poda p
    WHERE (a.nroArbol = p.nroArbol)
)

//ejercicio4
SELECT a.especie, a.años, a.calle, a.nro, l.nombreL
FROM Arbol a INNER JOIN Localidad l (a.codigoPostal = l.codigoPostal)
             INNER JOIN Poda po (po.nroArbol = a.nroArbol)
             WHERE (po.fecha BETWEEN "01/01/2017" AND "31/12/2017") AND NOT IN(
                SELECT a.nroArbol
                FROM Arbol a INNER JOIN Poda po (a.nroArbol = po.nroArbol)
                WHERE (po.fecha BETWEEN "01/01/2018" AND "31/12/2018")
             )

//ejercicio5
SELECT p.DNI, p.nombre, p.apellido, p.fnac, l.nombreL
FROM Podador p INNER JOIN Localidad l (p.codigoPostalVive = l.codigoPostal)
WHERE (p.apellido LIKE "%ata")AND p.DNI IN (
    SELECT po.DNI
    FROM Poda po
    WHERE (po.fecha BETWEEN "01/01/2018" AND "31/12/2018") 
)
ORDER BY p.apellido, p.nombre

//ejercicio6
SELECT p.DNI, p.apellido, p.nombre, p.telefono, p.fnac
FROM Podador p INNER JOIN Poda po ON(p.DNI = po.DNI)
               INNER JOIN Arbol a ON(a.nroArbol = po.nroArbol)
WHERE (a.especie = "Conífera")
EXCEPT (
    SELECT p.DNI, p.apellido, p.nombre, p.telefono, p.fnac
    FROM Podador p INNER JOIN Poda po ON(p.DNI = po.DNI)
               INNER JOIN Arbol a ON(a.nroArbol = po.nroArbol)
    WHERE NOT (a.especie = "Conífera")
)

//ejercicio7
SELECT DISTINCT a.especie
FROM Arbol a INNER JOIN Localidad l ON (a.codigoPostal = l.codigoPostal)
WHERE (l.nombreL = "La Plata")
INTERSECT (
    SELECT a.especie
    FROM Arbol a INNER JOIN Localidad l ON (a.codigoPostal = l.codigoPostal)
    WHERE(l.nombreL = "Salta")
)

//ejercicio8
DELETE FROM Podador WHERE DNI = 22234566
DELETE FROM Poda WHERE DNI = 22234566

//ejercicio9
SELECT l.nombreL, l.descripcion, l.#habitantes
FROM Localidad l INNER JOIN Arbol a ON (l.codigoPostal = a.codigoPostal)
GROUP BY l.codigoPostal, l.nombreL, l.descripcion, l.#habitantes
HAVING COUNT (*) < 100
