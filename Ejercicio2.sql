//ejercicio 1
SELECT a.RAZON_SOCIAL, a.direccion, a.telef 
FROM VIAJE v INNER JOIN AGENCIA a ON (v.RAZON_SOCIAL = a.RAZON_SOCIAL)
INNER JOIN CLIENTE c ON (v.DNI = c.DNI)
WHERE (c.apellido ="Roma") and (SELECT v.RAZON_SOCIAL IN(
    SELECT v.RAZON_SOCIAL
    FROM VIAJE v INNER JOIN CIUDAD ciu ON (v.cpOrigen = ciu.CODIGOPOSTAL)
    WHERE (ciu.nombreCiudad = "La Plata")
    )
)
ORDER BY a.RAZON_SOCIAL, a.telef

//ejercicio 2
SELECT v.FECHA, v.HORA, c.DNI, c.nombre,c.apellido, c.telefono, c.direccion,ori.nombreCiudad,dest.nombreCiudad
FROM VIAJE v INNER JOIN Cliente c ON (v.DNI,c.DNI)
INNER JOIN CIUDAD ori ON (v.cpOrigen = ori.CODIGOPOSTAL)
INNER JOIN CIUDAD dest ON (v.cpDestino = dest.CODIGOPOSTAL)
WHERE (v.fecha BETWEEN 01/01/2019 and 31/01/2019)and (v.descripcion LIKE "%demorado%")

//ejercicio 3
SELECT a.RAZON_SOCIAL, a.direccion, a.telef, a.e-mail
FROM AGENCIA a INNER JOIN VIAJE v ON (a.RAZON_SOCIAL = v.RAZON_SOCIAL)
WHERE (v.FECHA BETWEEN 01/01/2019 and 31/12/2019) or  (a.e-mail LIKE "%@jmail.com")

//ejercicio 4
SELECT c.DNI, c.nombre, c.apellido, c.telefono, c.direccion
FROM Cliente c INNER JOIN VIAJE v ON (c.DNI = v.DNI)
INNER JOIN CIUDAD dest ON (dest.CODIGOPOSTAL = v.cpDestino)
WHERE (dest.nombreCiudad ="Coronel Brandsen")
EXCEPT (
    SELECT c.DNI, c.nombre,c.apellido,c.telefono,c.direccion
    FROM Cliente c INNER JOIN VIAJE v ON (c.DNI = v.DNI)
    INNER JOIN CIUDAD dest ON (dest.CODIGOPOSTAL = v.cpDestino)
    WHERE NOT(dest.nombreCiudad = "Coronel Brandsen")
) 

//ejercicio 5
SELECT COUNT  (*) as Cantidad
FROM AGENCIA a INNER JOIN VIAJE v ON (a.RAZON_SOCIAL = v.RAZON_SOCIAL)
INNER JOIN CIUDAD ciu ON (ciu.CODIGOPOSTAL = v.cpDestino)
WHERE (a.RAZON_SOCIAL = "TAXI Y") and (ciu.nombreCiudad = "Villa Elisa")

//ejercicio 6
SELECT c.nombre, c.apellido, c.direccion, c.telefono
FROM CLIENTE c INNER JOIN VIAJE v ON (c.DNI = v.DNI)
INNER JOIN AGENCIA a


//ejercicio 7
UPDATE CLIENTE SET telefono = "221-4400897" WHERE DNI = 38495444

//ejercicio 8
SELECT a.RAZON_SOCIAL, a.direccion, a.telef
FROM AGENCIA a INNER JOIN VIAJE v ON (a.RAZON_SOCIAL = v.RAZON_SOCIAL)
GROUP BY a.RAZON_SOCIAL, a.direccion,a.telef
HAVING COUNT (*) > ALL (
    SELECT COUNT (*)
    FROM VIAJE v
    GROUP BY v.RAZON_SOCIAL
)

//ejercicio 9
SELECT c.nombre,c.apellido, c.direccion, c.telefono
FROM CLIENTE c INNER JOIN VIAJE v ON (c.DNI = v.DNI)
GROUP BY c.nombre, c.apellido, c.direccion, c.telefono
HAVING COUNT (*) >= 10

//ejercicio 10
DETELE FROM CLIENTE WHERE DNI = 40325692