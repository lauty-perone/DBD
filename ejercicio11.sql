//ejercicio1
SELECT v.matricula, v.CUIT, v.nombYAp, v.dirección, v.telefono, COUNT (*)AS CantidadSupervisiones
FROM Veterinario v INNER JOIN Supervision s ON (v.matricula = s.matricula)
WHERE (s.fechaSale BETWEEN "01/01/2020"AND "31/01/2020")
GROUP BY v.matricula, v.CUIT, v.nombYAp, v.dirección, v.telefono

//ejercicio2
SELECT v.CUIT, v.nombYAp, v.dirección, v.telefono
FROM Veterinario v 
WHERE v.matricula NOT IN (
    SELECT s.matricula
    FROM Supervision s
    WHERE s.fechaSale IS NULL
)

//ejercicio3
SELECT m.nombre, m.edad, m.raza, m.peso, m.telefonoContacto
FROM Mascota m INNER JOIN Supervision s ON (m.codMascota = s.codMascota)
               INNER JOIN Veterinario v ON (s.matricula = v.matricula)
WHERE v.nombYAp = "Oscar Lopez"
ORDER BY m.nombre, m.raza

//ejercicio4
UPDATE Veterinario SET nombYAp= "Pablo Lopez" WHERE matricula "MP 10000"

//ejercicio5
SELECT m.nombre, m.edad, m.raza, m.peso
FROM Mascota m INNER JOIN Supervision s ON (m.codMascota = s.codMascota)
WHERE s.matricula = "MP 1000"
INTERSECT (
   SELECT m.nombre, m.edad, m.raza, m.peso
   FROM Mascota m INNER JOIN Supervision s ON (m.codMascota = s.codMascota) 
   WHERE s.matricula = "MN 4545"
)

//ejercicio6
SELECT b.nroBox, b.m2, b.ubicacion, b.capacidad, m.nombre
FROM Box b INNER JOIN Supervision s ON (b.nroBox = s.nroBox)
           INNER JOIN Mascota m ON (s.codMascota = m.codMascota)
WHERE (s.fechaEntra BETWEEN "01/01/2020" AND "31/12/2020")


