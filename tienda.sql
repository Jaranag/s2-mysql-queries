-- 1

SELECT nombre 
FROM producto;

-- 2

SELECT nombre, precio
FROM producto;

-- 3

SELECT *
FROM producto;

SHOW COLUMNS
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

SELECT nombre , TRUNCATE(precio,0 )
FROM producto;

SELECT nombre , cast(precio AS INT)
FROM producto;

-- 11

SELECT codigo_fabricante
FROM producto;

-- 12

SELECT codigo_fabricante
FROM producto
group by codigo_fabricante;

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

-- 28

SELECT p.nombre, p.precio, f.nombre
FROM producto p 
JOIN fabricante f ON p.codigo_fabricante = f.codigo
WHERE f.nombre = 'ASUS' OR f.nombre = 'hewlett-packard' OR f.nombre = 'seagate';

-- 29

SELECT p.nombre, p.precio, f.nombre
FROM producto p 
JOIN fabricante f ON p.codigo_fabricante = f.codigo
WHERE f.nombre IN ('asus','hewlett-packard', 'seagate');

-- 30

SELECT nombre, precio
FROM producto 
WHERE nombre LIKE '%e';

-- 31 

SELECT nombre, precio
FROM producto 
WHERE nombre LIKE '%w%';

-- 32

SELECT p.nombre, p.precio, f.nombre
FROM producto p 
JOIN fabricante f ON p.codigo_fabricante = f.codigo
WHERE precio >= 180 
ORDER BY p.precio DESC, p.nombre;

-- 33

SELECT f.codigo, f.nombre
FROM fabricante f
JOIN  producto p ON p.codigo_fabricante = f.codigo
GROUP BY NOMBRE;

-- 34

SELECT f.codigo, f.nombre, P.NOMBRE
FROM fabricante f
LEFT JOIN  producto p ON f.codigo = p.codigo_fabricante;


-- 35

SELECT f.codigo, f.nombre, P.NOMBRE
FROM fabricante f
LEFT JOIN  producto p ON f.codigo = p.codigo_fabricante
WHERE p.nombre IS NULL;

-- 36

SELECT *
FROM producto
WHERE codigo_fabricante = (SELECT codigo FROM FABRICANTE WHERE nombre = 'lenovo');

-- 37

SELECT *
FROM producto
WHERE precio =(SELECT MAX(precio) FROM producto WHERE codigo_fabricante in (SELECT codigo FROM fabricante WHERE nombre = 'LENOVO'));


-- 38

SELECT nombre
FROM producto WHERE precio =(SELECT Max(precio) FROM producto WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre LIKE 'lenovo'));

-- 39

SELECT nombre
FROM producto WHERE precio = (SELECT Min(precio) FROM producto WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre LIKE 'hewlett-packard'));

-- 40

SELECT * 
FROM producto
WHERE precio >= (SELECT max(precio) FROM producto WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre LIKE 'lenovo'));

-- 41

SELECT *
FROM producto WHERE precio >= (SELECT avg(precio) FROM producto WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre LIKE 'asus')) AND codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre LIKE 'asus'); 