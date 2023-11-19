//ejercio 1
SELECT c.nombre, c.anioFundacion
FROM club c INNER JOIN Estadio e ON (e.codigoClub = c.codigoClub)
INNER JOIN Ciudad ciu ON (ciu.codigoCiudad = c.codigoCiudad)
WHERE (ciu.nombre = "La Plata") and (e.codigoEstadio IS NULL )

//ejercio 2
SELECT c.nombre 
FROM Club c INNER JOIN ClubJugador cJ ON (c.codigoClub = cJ.codigoClub)
WHERE cJ.DNI NOT IN (SELECT j.DNI
    FROM Jugador j INNER JOIN Ciudad ciu ON (j.codigoCiudad = ciu.codigoCiudad)
    WHERE ciu.nombre = "Berisso"
    )

//ejercicio 3
SELECT j.DNI, j.nombre, j.apellido
FROM Jugador j INNER JOIN ClubJugador cj ON (j.DNI = cj.DNI)
INNER JOIN Club c ON (c.codigoClub = cj.codigoClub)
WHERE (c.nombre = "Gimnasia y Esgrima La Plata")

//ejercicio 4
SELECT j.DNI, j.nombre , j.apellido
FROM Jugador j INNER JOIN ClubJugador cj ON (j.DNI = cj.DNI)
INNER JOIN Club c ON (cj.codigoClub = c.codigoClub)
INNER JOIN Ciudad ciu ON (c.codigoCiudad = ciu.codigoCiudad)
WHERE (j.edad > 29)and (ciu.nombre = "Cordoba")

SELECT j.DNI, j.nombre, j.apellido 
FROM Jugador j
WHERE j.edad > 29 AND j.DNI IN (
    SELECT cj.DNI
    FROM ClubJugador cj INNER JOIN Club c ON (cj.codigoClub = c.codigoClub)
    WHERE c.codigoCiudad IN (
        SELECT c.codigoCiudad
        FROM Ciudad c
        WHERE c.nombre = "Cordoba"
    )
) //es mas eficiente

//ejercicio 5
SELECT c.nombre, AVG(j.edad) as Edad Promedio
FROM Club c INNER JOIN ClubJugador cj ON (c.codigoClub = cj.codigoClub)
INNER JOIN Jugador j ON (j.DNI = cj.DNI)
WHERE cj.hasta  IS NULL
GROUP BY c.codigoClub, c.nombre

//ejercicio 6
SELECT j.nombre, j.apellido , j.edad, COUNT(*) as Cantidad
FROM Jugador j INNER JOIN ClubJugador cj ON(j.DNI= cj.DNI)
GROUP BY j.DNI, j.nombre, j.apellido, j.edad


//ejercicio 7
SELECT c.nombre
FROM Club c INNER JOIN ClubJugador cj ON (c.codigoClub = cj.codigoClub)
WHERE cj.DNI NOT IN (
    SELECT j.DNI
    FROM Jugador j INNER JOIN Ciudad ciu ON (j.codigoCiudad = ciu.codigoCiudad)
    WHERE ciu.nombre = "Mar del Plata"
)

//ejercio 8
SELECT j.nombre, j.apellido
FROM Jugador 
WHERE NOT EXIST (
    SELECT *
    FROM Club c
    WHERE NOT EXIST (        //lo que hace es que me dice el jugador que no estuvo en ningun club pero al negarlo estuvo en todos
        SELECT * 
        FROM ClubJugador cj 
        WHERE (cj.DNI = j.DNI )and (c.codigoClub = cj.codigoClub)
    )
)

//ejercicio 9
INSERT INTO Club (codigoClub, nombre,anioFundacion,codigoCiudad) VALUES (1234,"Estrella de Berisso", 1921, 
SELECT c.codigoCiudad
FROM Ciudad c
WHERE c.nombre = "Berisso")

