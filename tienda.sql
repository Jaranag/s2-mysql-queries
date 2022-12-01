-- 1
SELECT nombre 
FROM producto;

-- 2
SELECT nombre, precio
FROM producto;

-- 3
SELECT *
FROM producto;

-- 4

SELECT nombre, precio, precio * 1.04 
FROM producto;

-- 5

SELECT nombre AS "nom de 'producto'", precio AS "euros", precio * 1.04 AS " dòlars nord-americans"
FROM producto;

-- 6

SELECT UPPER(nombre), PRECIO
FROM producto;

-- 7

SELECT lower(nombre), precio
FROM producto;

-- 8 

SELECT nombre, UPPER(LEFT(nombre, 2))
FROM fabricante;

-- 9

SELECT nombre , ROUND(precio)
FROM producto;

-- 10

SELECT nombre , cast(precio as int)
FROM producto;

-- 11

SELECT F.codigo
FROM producto P
JOIN fabricante F ON P.codigo_fabricante = F.codigo;

-- 12

SELECT distinct F.codigo
FROM producto P
JOIN fabricante F ON P.codigo_fabricante = F.codigo;

-- 13 

SELECT nombre
FROM fabricante ORDER BY nombre;

-- 14 

SELECT nombre
FROM fabricante ORDER BY nombre DESC;

-- 15

SELECT nombre
FROM PRODUCTO ORDER BY nombre, precio DESC;

-- 16

SELECT *
FROM fabricante
LIMIT 5;

-- 17

SELECT *
FROM fabricante
LIMIT 3, 2;

-- 18

SELECT nombre, precio
FROM producto 
ORDER BY precio 
LIMIT 1;

-- 19

SELECT nombre, precio
FROM producto 
ORDER BY precio DESC
LIMIT 1;

-- 20 

SELECT *
FROM producto 
WHERE codigo_fabricante = 2;

-- 21

SELECT p.nombre, p.precio, f.nombre AS nombre_fabricante
FROM producto p 
JOIN fabricante f ON p.codigo_fabricante = f.codigo;

-- 22

SELECT p.nombre, p.precio, f.nombre AS nombre_fabricante
FROM producto p 
JOIN fabricante f ON p.codigo_fabricante = f.codigo
ORDER BY f.nombre;

-- 23

SELECT p.codigo, p.nombre, f.codigo, f.nombre
FROM producto p 
JOIN fabricante f ON p.codigo_fabricante = f.codigo;

-- 24

SELECT p.codigo, p.nombre, f.codigo, f.nombre
FROM producto p 
JOIN fabricante f ON p.codigo_fabricante = f.codigo
ORDER BY p.precio 
LIMIT 1;

-- 25

SELECT p.codigo, p.nombre, f.codigo, f.nombre
FROM producto p 
JOIN fabricante f ON p.codigo_fabricante = f.codigo
ORDER BY p.precio DESC
LIMIT 1;

-- 26 

SELECT *
FROM producto p 
JOIN fabricante f ON p.codigo_fabricante = f.codigo
WHERE f.nombre = 'lenovo';

-- 27

SELECT *
FROM producto p 
JOIN fabricante f ON p.codigo_fabricante = f.codigo
WHERE f.nombre = 'crucial' AND p.precio > 200;

























