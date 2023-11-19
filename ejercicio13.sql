//ejercicio1
SELECT e.nombreEntrenador, e.fechaNacimiento, e.direccion
FROM Entrenador e INNER JOIN Entrenamiento en ON (e.IdEntrenador = en.IdEntrenador)
WHERE (en.fecha BETWEEN "01/01/2020" AND "31/12/2020")

//ejercicio2
SELECT c.nombreCancha, COUNT (*)AS CantidadEntrenamientos
FROM Cancha c LEFT JOIN Entrenamiento en ON (c.IdCancha = en.IdCancha)
              INNER JOIN Comlpejo com ON (c.IdComplejo = com.IdComplejo) 
WHERE (en.fecha BETWEEN "01/01/2019" AND "31/12/2019") AND (com.nombreComplejo = "Complejo 1")
GROUP BY c.IdCancha,c.nombreCancha

//ejercicio3
SELECT DISTINCT com.nombreComplejo
FROM Comlpejo com INNER JOIN Cancha c ON (com.IdComplejo = c.IdComplejo)
                  INNER JOIN Entrenamiento en ON (c.IdCancha =en.IdCancha)
                  INNER JOIN Entrenador e ON (en.IdEntrenador = e.IdEntrenador)
WHERE (e.nombreEntrenador = "Jorge Gonzalez")
ORDER BY com.nombreComplejo

//ejercicio4
SELECT e.nombreEntrenador, e.fechaNacimiento, e.direccion
FROM Entrenador e INNER JOIN Entrenamiento en ON (e.IdEntrenador = en.IdEntrenador)
                  INNER JOIN Cancha c ON (en.IdCancha =c.IdCancha)
WHERE (c.nombreCancha = "Cancha 1")
INTERSECT (
    SELECT e.nombreEntrenador, e.fechaNacimiento, e.direccion
    FROM Entrenador e INNER JOIN Entrenamiento en ON (e.IdEntrenador = en.IdEntrenador)
                  INNER JOIN Cancha c ON (en.IdCancha =c.IdCancha)
    WHERE (c.nombreCancha = "Cancha 2")
)

//ejercicio5
SELECT cl.nombreClub, cl.ciudad
FROM Club cl INNER JOIN Complejo com ON (cl.IdClub = com.IdClub)
             INNER JOIN Cancha c ON (com.IdComplejo = c.IdComplejo)
             INNER JOIN Entrenamiento en ON (c.IdCancha= en.IdCancha)
             INNER JOIN Entrenador e ON (en.IdEntrenador = e.IdEntrenador)
WHERE (e.nombreEntrenador = "Marcos Perez")

//ejercicio6
DELETE FROM Entrenamiento WHERE IdEntrenador IN (
    SELECT e.IdEntrenador
    FROM Entrenador e INNER JOIN Entrenamiento en ON (e.IdEntrenador = en.IdEntrenador)
    WHERE e.nombreEntrenador = "Juan Perez"
)