//ejercicio1
SELECT c.patente, c.largo, c.max_toneladas, v.modelo, v.marca, v.peso, v.km
FROM Camion c INNER JOIN Vehiculo v ON (c.patente = v.patente)
              INNER JOIN Service s ON (v.patente = s.patente)
WHERE (c.cant_ruedas BETWEEN 4 AND 8) AND (s.fecha BETWEEN "30/01/2022" AND "30/01/2023")
ORDER BY v.patente, v.modelo, v.marca

//ejercicio2
SELECT a.patente, a.es_electrico, a.tipo_motor
FROM Auto a INNER JOIN Service s ON (a.patente = s.patente)
WHERE (s.km_service < 13000) AND (s.observaciones LIKE "%cambio de aceite%")
UNION (
    SELECT a.patente, a.es_electrico, a.tipo_motor
    FROM Auto a INNER JOIN Service s ON (a.patente = s.patente)
                INNER JOIN Service_Parte sp ON (s.patente = sp.patente) AND (s.fecha = sp.fecha)
                INNER JOIN Parte p ON (sp.cod_parte = p.cod_parte)
    WHERE (p.nombre = "filtro de combustible") AND (s.observaciones LIKE "%inspeccion general%")
)

//ejercicio3
SELECT p.nombre, p.precio
FROM Parte p INNER JOIN Service_Parte sp ON (p.cod_parte = sp.cod_parte)
WHERE (p.precio > 4000)
GROUP BY p.cod_parte, p.nombre, p.precio
HAVING COUNT (*) > 30

//ejercicio4
DELETE FROM Camion WHERE patente IN (
                        SELECT c.patente 
                        FROM  Camion c INNER JOIN Vehiculo v ON (c.patente = v.patente)
                        WHERE v.km >250000
)

DELETE FROM Vehiculo WHERE patente IN (
    SELECT c.patente
    FROM Camion c INNER JOIN Vehiculo v ON (c.patente = v.patente)
    WHERE v.km > 250000
)

DELETE FROM Service WHERE patente IN (
    SELECT c.patente 
    FROM Camion c INNER JOIN Vehiculo v ON (c.patente = v.patente)
    WHERE v.km > 250000
)

DELETE FROM Service_Parte WHERE patente IN (
    SELECT c.patente
    FROM Camion c INNER JOIN Vehiculo v ON (c.patente = v.patente)
    WHERE v.km > 250000 
)

//ejercicio5
SELECT p.nombre, p.precio
FROM Parte p INNER JOIN Service_Parte sp ON (p.cod_parte = sp.cod_parte)
WHERE (sp.fecha BETWEEN "01/01/2023" AND "31/12/2023")
EXCEPT (
    SELECT p.nombre, p.precio
    FROM Parte p INNER JOIN Service_Parte sp ON (p.cod_parte = sp.cod_parte)
    WHERE NOT (sp.fecha BETWEEN "01/01/2023" AND "31/12/2023")
)

//ejercicio6
SELECT a.patente, v.modelo, v.marca, v.peso
FROM Auto a INNER JOIN Vehiculo v ON (a.patente = v.patente)
WHERE (a.es_electrico = true)

//ejercicio7
INSERT INTO Parte(nombre, precio)VALUES ("Aleron", "$400")

//ejercicio8
DELETE FROM Service WHERE patente ="AWA564"

DELETE FROM Service_Parte WHERE patente= "AWA564"


//ejercicio9
SELECT *
FROM Vehiculo v INNER JOIN Service s ON (v.patente = s.patente)
WHERE (s.fecha BETWEEN "01/01/2018" AND "31/12/2018")


