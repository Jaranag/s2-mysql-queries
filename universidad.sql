-- 1.1

SELECT apellido1, apellido2, nombre
FROM persona
WHERE tipo = 'alumno'
ORDER BY apellido1, apellido2, nombre;

-- 1.2

SELECT apellido1, apellido2, nombre
FROM persona
WHERE telefono IS NULL
AND TIPO = 'alumno';

-- 1.3

SELECT *
FROM persona
WHERE fecha_nacimiento >= '1999-01-01' 
AND fecha_nacimiento <= '1999-12-31'
AND TIPO = 'alumno';

-- 1.4

SELECT *
FROM persona
WHERE tipo = 'profesor' 
AND telefono IS NULL 
AND nif LIKE '%k';

-- 1.5

SELECT *
FROM asignatura
WHERE cuatrimestre = 1 AND curso = 3 AND id_grado = 7;

-- 1.6

SELECT pe.apellido1, pe.apellido2, pe.nombre, de.nombre
FROM persona pe
JOIN profesor pr ON pe.id = pr.id_profesor
JOIN departamento de ON de.id = pr.id_departamento
WHERE tipo = 'profesor';

-- 1.7

SELECT a.nombre, ce.anyo_inicio, ce.anyo_fin 
FROM persona p 
JOIN alumno_se_matricula_asignatura asma ON p.id = asma.id_alumno
JOIN asignatura a ON a.id = asma.id_asignatura
JOIN curso_escolar ce ON asma.id_asignatura = ce.id
WHERE nif = '26902806M';

-- 1.8

SELECT distinct de.nombre
FROM persona pe  
JOIN profesor pr ON pe.id = pr.id_profesor
JOIN departamento de ON de.id = pr.id_departamento
JOIN asignatura a ON a.id_profesor = pr.id_profesor
JOIN grado gr ON gr.id = a.id_grado;

-- 1.9

SELECT DISTINCT pe.id, pe.apellido1, pe.apellido2, pe.nombre
FROM persona pe 
JOIN alumno_se_matricula_asignatura asma ON pe.id = asma.id_alumno 
WHERE id_curso_escolar = 5;

-- 2.1

Select de.nombre, pe.apellido1, pe.apellido2, pe.nombre
FROM persona pe
JOIN profesor pr ON pe.id = pr.id_profesor
LEFT JOIN departamento de ON pr.id_departamento = de.id
ORDER BY de.nombre, pe.apellido1, pe.apellido2, pe.nombre;

-- 2.2

Select *
FROM persona pe
RIGHT JOIN profesor pr ON pe.id = pr.id_profesor
WHERE tipo = 'profesor' AND pr.id_departamento IS NULL;

-- 2.3

Select de.nombre 
FROM departamento de
LEFT JOIN profesor pr ON de.id = pr.id_departamento
WHERE pr.id_departamento IS NULL;

-- 2.4

Select *
FROM persona p 
RIGHT JOIN profesor pr ON p.id = pr.id_profesor
LEFT JOIN asignatura a ON pr.id_profesor = a.id_profesor
WHERE a.id_profesor IS NULL;

-- 2.5

Select *
FROM asignatura
WHERE id_profesor IS NULL;

-- 2.6

SELECT d.nombre
FROM departamento d 
LEFT JOIN profesor pr ON d.id = pr.id_departamento
LEFT JOIN asignatura a USING (id_profesor)
WHERE a.curso IS NULL;

-- 3.1

SELECT COUNT(tipo)
FROM persona pe 
WHERE tipo = 'alumno';

-- 3.2

SELECT 	COUNT(tipo)
FROM persona pe 
WHERE tipo = 'alumno' AND fecha_nacimiento >= '1999-01-01' 
AND fecha_nacimiento <= '1999-12-31';

-- 3.3

SELECT d.nombre, count(id_departamento)
FROM departamento d 
JOIN profesor p ON d.id = p.id_departamento
GROUP BY d.nombre
ORDER BY count(id_departamento) DESC;
 
 -- 3.4
 
SELECT d.nombre, count(id_departamento)
FROM departamento d 
LEFT JOIN profesor p ON d.id = p.id_departamento
GROUP BY d.nombre;
 
 -- 3.5
 
SELECT g.nombre, count(a.id_grado)
FROM grado g
LEFT JOIN asignatura a ON g.id = a.id_grado
GROUP BY g.nombre
ORDER BY count(a.id_grado) DESC;
 
 -- 3.6 
 
SELECT g.nombre, count(a.id_grado)
FROM grado g
JOIN asignatura a ON g.id = a.id_grado
GROUP BY id_grado
HAVING COUNT(A.id_grado) > 40;

-- 3.7

SELECT g.nombre, a.nombre, COUNT(a.creditos)
FROM grado g
JOIN asignatura a ON g.id = a.id_grado
GROUP BY g.nombre, a.tipo, a.creditos;

-- 3.8

SELECT ce.anyo_inicio, count(asma.id_alumno)
FROM curso_escolar ce
LEFT JOIN asignatura a ON ce.id = a.curso
LEFT JOIN alumno_se_matricula_asignatura asma ON ce.id = asma.id_curso_escolar
GROUP BY asma.id_curso_escolar;

-- 3.9

SELECT P.ID, P.nombre, p.apellido1, p.apellido2, count(a.id_profesor)
FROM persona P  
LEFT JOIN asignatura a ON p.id = a.id_profesor
WHERE p.tipo LIKE 'profesor'
GROUP BY P.ID
ORDER BY count(a.id_profesor) DESC;

-- 3.10

SELECT * 
FROM persona
WHERE tipo LIKE 'alumno'
ORDER BY fecha_nacimiento DESC
LIMIT 1;

-- 3.11

SELECT P.*
FROM persona p 
JOIN profesor pr ON p.id = pr.id_profesor
LEFT JOIN asignatura a ON p.id = a.id_profesor
WHERE p.tipo LIKE 'profesor' AND a.id_profesor IS NULL
group by p.id;