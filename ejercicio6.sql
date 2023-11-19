//ejercicio1
SELECT r.nombre, r.stock, r.precio
FROM Repuesto r 
ORDER BY r.precio

//ejercicio2
SELECT DISTINCT r.nombre, r.stock, r.precio
FROM Repuesto r INNER JOIN RepuestoReparacion rp ON (r.codRep = rp.codRep)
                INNER JOIN Reparacion re ON (rp.nroReparac = re.nroReparac)
WHERE (re.fecha BETWEEN "01/01/2019" AND "31/12/2019")
EXCEPT (
    SELECT r.nombre, r.stock, r.precio
    FROM Repuesto r INNER JOIN RepuestoReparacion rp ON (r.codRep =  rp.codRep)
                    INNER JOIN Reparacion re ON (rp.nroReparac = re.nroReparac)
                    INNER JOIN Tecnico t ON (re.codTec = t.codTec)
    WHERE (t.nombre = "José Gonzalez")
)

//ejercicio3
SELECT DISTINCT t.nombre, t.especialidad
FROM Tecnico t 
WHERE NOT EXIST (
    SELECT *
    FROM Reparacion re 
    WHERE (t.codTec = re.codTec)
)
ORDER BY t.nombre

//ejercicio4
SELECT DISTINCT t.nombre, t.especialidad
FROM Tecnico t INNER JOIN Reparacion re ON(t.codTec = re.codTec)
WHERE (re.fecha BETWEEN "01/01/2018" AND "31/12/2018")
EXCEPT (
    SELECT t.nombre, t.especialidad
    FROM Tecnico t INNER JOIN Reparacion re ON (t.codTec = re.codTec)
    WHERE NOT (re.fecha BETWEEN "01/01/2018" AND "31/12/2018")
)

//ejercicio5
SELECT r.nombre, r.stock , COUNT(DISTINCT re.codTec) AS CantidadTecnicos
FROM Repuesto r LEFT JOIN RepuestoReparacion rr ON (r.codRep = rr.codRep)
                INNER JOIN Reparacion re ON (rr.nroReparac =  re.nroReparac)
GROUP BY r.codRep, r.nombre, r.stock

//ejercicio6
SELECT t.nombre, t.especialidad
FROM Tecnico t INNER JOIN Reparacion re ON(t.codTec = re.codTec)
GROUP BY t.codTec,t.nombre, t.especialidad
HAVING COUNT (*) <= ALL(
    SELECT *
    FROM Reparacion re
    GROUP BY re.codTec
)

//ejercicio7
SELECT r.nombre, r.stock, r.precio
FROM Repuesto r 
WHERE (r.stock > 0)
EXCEPT (
    SELECT r.nombre, r.stock, r.precio
    FROM Repuesto r INNER JOIN RepuestoReparacion rr ON (r.codRep = rr.codRep)
                    INNER JOIN Reparacion re ON (rr.nroReparac = re.nroReparac)
    WHERE (re.precio_total > 10000)
)

//ejercicio8
SELECT rr.precio, re.fecha, re.precio_total
FROM Reparacion re INNER JOIN RepuestoReparacion rr ON (re.nroReparac = rr.nroReparac)
WHERE (rr.precio >1000 AND rr.precio < 5000)

//ejercicio9
SELECT r.nombre, r.stock, r.precio
FROM Repuesto r 
WHERE NOT EXIST (
    SELECT rr.codRep
    FROM RepuestoReparacion 
    EXCEPT (
        SELECT r2.codRep
        FROM Repuesto r2, RepuestoReparacion rr2
        WHERE (r2.codRep = rr2.codRep) AND (r2.codRep = r.codRep)
    )
)

//ejercicio10
SELECT re.fecha, t.nombre, t.especialidad, re.precio_total
FROM Reparacion re INNER JOIN Tecnico t ON (re.codTec = t.codTec)
                   INNER JOIN RepuestoReparacion rr ON (re.nroReparac = rr.nroReparac)
GROUP BY re.nroReparac, re.fecha, t.nombre, r.precio_total
HAVING COUNT (*) >= 10
