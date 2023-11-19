//ejercicio 1
SELECT a.DNI,a.legajo,p.nombre,p.apellido
FROM ALUMNO a INNER JOIN PERSONA p ON (a.DNI = p.DNI)
WHERE (a.año_ingreso < 2014)

//ejercicio 2
SELECT p.DNI,profe.matricula,p.apellido,p.nombre 
FROM PROFESOR profe INNER JOIN PROFESOR-CURSO pc ON (profe.DNI = pc.DNI)
INNER JOIN PERSONA p ON (profe.DNI = p.DNI)
INNER JOIN CURSO c ON(c.Cod_Curso = pc.Cod_Curso)
WHERE (c.Duracion >=100)
ORDER BY profe.DNI

//ejercicio 3
