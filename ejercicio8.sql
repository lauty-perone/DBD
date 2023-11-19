//ejercicio1
SELECT i.DNI, i.nombre, i.apellido, i.email
FROM Integrante i INNER JOIN Inscripcion ins ON(i.codigoE = ins.codigoE)
                  INNER JOIN TorneoPesca t ON (ins.codTorneo = t.codTorneo)
WHERE (i.ciudad = "La Plata") AND (t.fecha BETWEEN "01/01/2019" AND "31/12/2019")

//ejercicio2
SELECT e.codigoE , e.descripcionE
FROM Equipo e i INNER JOIN Inscripcion ins ON (i.codigoE =  ins.codigoE)
                INNER JOIN TorneoPesca t ON (ins.codTorneo = t.codTorneo)
WHERE (t.fecha BETWEEN "01/01/2018" AND "31/12/2018")
EXCEPT (
   SELECT e.codigoE , e.descripcionE
FROM Equipo e i INNER JOIN Inscripcion ins ON (i.codigoE =  ins.codigoE)
                INNER JOIN TorneoPesca t ON (ins.codTorneo = t.codTorneo)
WHERE NOT (t.fecha BETWEEN "01/01/2018" AND "31/12/2018") 
)

//ejercicio3
SELECT i.DNI, i.nombre, i.apellido, i.email, i.ciudad
FROM Integrante i INNER JOIN Inscripcion ins ON (i.codigoE = ins.codigoE)
                  INNER JOIN TorneoPesca t ON (ins.codTorneo = t.codTorneo)
                  INNER JOIN Laguna l ON (t.nroLaguna = l.nroLaguna)
WHERE (l.nombreL = "La Salada, Coronel Granada")
EXCEPT (
   SELECT i.DNI, i.nombre, i.apellido, i.email, i.ciudad 
   FROM Integrante i INNER JOIN Inscripcion ins ON (i.codigoE = ins.codigoE)
                     INNER JOIN TorneoPesca t ON (ins.codTorneo = t.codTorneo)
    WHERE (t.fecha BETWEEN "01/01/2019" AND "31/12/2019")
)

//ejercicio4
SELECT e.nombreE, e.descripcionE
FROM Equipo e INNER JOIN Integrante i ON (e.codigoE = i.codigoE)
GROUP BY e.codigoE, e.nombreE
HAVING COUNT(*) >= 5
ORDER BY e.nombreE, e.descripcionE

//ejercicio5
SELECT e.nombreE, e.descripcionE
FROM Equipo e 
WHERE NOT EXIST (
    SELECT l.nroLaguna
    FROM Laguna l
    EXCEPT (
        SELECT l2.nroLaguna
        FROM Inscripcion ins INNER JOIN TorneoPesca tp ON (ins2.codTorneo = tp2.codTorneo) 
            INNER JOIN Laguna l2 ON (tp2.nroLaguna = l.nroLaguna)
        WHERE (e.codigoE = ins2.codigoE)
    )
)

//ejercicio6
DELETE FROM Equipo WHERE codigoE = 10000
DELETE FROM Integrante WHERE codigoE = 10000
DELETE FROM Inscripcion WHERE codigoE = 10000

//ejercicio7
SELECT l.nombreL, l.ubicación, l.extension, l.descripcion
FROM  Laguna l 
WHERE l.nroLaguna NOT IN (
    SELECT t.nroLaguna
    FROM TorneoPesca t
)

//ejercicio8
SELECT e.nombreE, e.descripcionE
FROM Equipo e INNER JOIN Inscripcion ins ON (e.codigoE = ins.codigoE)
              INNER JOIN TorneoPesca t  ON (ins.codTorneo = t.codTorneo)
WHERE (t.fecha BETWEEN "01/01/2019" AND "31/12/2019")
EXCEPT (
    SELECT e.nombreE, e.descripcionE
    FROM Equipo e INNER JOIN Inscripcion ins ON (e.codigoE = ins.codigoE)
                  INNER JOIN TorneoPesca t  ON (ins.codTorneo = t.codTorneo)
    WHERE (t.fecha BETWEEN "01/01/2018" AND "31/12/2018")
)

//ejercicio9
SELECT i.DNI, i.nombre, i.apellido, i.ciudad, i.email
FROM Integrante i INNER JOIN Inscripcion ins ON (i.codigoE = ins.codigoE)
                  INNER JOIN TorneoPesca t ON (ins.codTorneo = t.codTorneo)
                  INNER JOIN Laguna l ON (t.nroLaguna = l.nroLaguna)
WHERE (ins.gano = True ) AND (l.nombreL = "Laguna de Chascomús")