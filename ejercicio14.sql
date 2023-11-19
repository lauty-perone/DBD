//ejercicio1
SELECT p.nombre, p.descripcion, p.genero
FROM Pelicula p INNER JOIN Funcion f ON (p.idPeli = f.idPeli)
WHERE (f.fecha BETWEEN "01/01/2020" AND "31/12/2020")

//ejercicio2
SELECT s.nombreS, c.nombreC, SUM(f.ocupacion) AS CantidadTotalEspectadores
FROM Funcion f INNER JOIN Sala s ON (f.nroSala = s.nroSala)
               INNER JOIN Cine c ON (s.idCine = c.idCine)
WHERE (f.fecha BETWEEN "01/01/2020" AND "31/12/2020")
GROUP BY s.nombreS, c.nombreC

//ejercicio3
SELECT c.nombreC, c.direccion 
FROM Cine c INNER JOIN Sala s ON (c.idCine= s.idCine)
            INNER JOIN Funcion f ON (s.nroSala = f.nroSala)
            INNER JOIN Pelicula p ON (f.idPeli = p.idPeli)
WHERE (p.nombre = "Relic")
ORDER BY c.nombreC, c.direccion DESC 

//ejercicio4
SELECT p.nombre, p.descripcion, p.genero
FROM Pelicula p INNER JOIN Funcion f ON (p.idPeli = f.idPeli)
                INNER JOIN Sala s ON (f.nroSala = s.nroSala)
                INNER JOIN Cine c ON (s.idCine = c.idCine)
WHERE (s.nombreS = "Sala Lola Membrives")OR(c.nombreC = "Gran Rex")

//ejercicio5
SELECT c.nombreC, c.direccion
FROM Cine c INNER JOIN Sala s ON (c.idCine = s.idCine)
WHERE (s.capacidad > 300)

//ejercicio6
INSERT INTO Cine(idCine,nombre,direccion) VALUES (5000,"Cine Ricardo Darin", "calle 2 nro 1900, La Plata")


