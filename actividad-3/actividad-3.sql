SHOW DATABASES;

SELECT * FROM users

/* 1 ejercicio, nombres y apellidos de todas las personas que tienen 20 años */
SELECT nombres, apellidos, edad FROM users WHERE edad = 20

/* 2 ejercicio ,mujeres que tengan entre 20 y 30 años */
SELECT nombres, apellidos, edad, genero FROM users WHERE genero = "M" AND edad >= 20 AND edad <= 30

/* 3 ejercicio, ACs, acsendente, ORDER BY, es ordenar,limit, limita , mostrar la persona con menor edad*/
SELECT * FROM users ORDER BY edad ASC LIMIT 1;

SELECT MIN(edad) FROM users

/* 4 ejercicio, cuantos usuarios hay registrados en la base de datos */
SELECT COUNT(*) FROM users

/* 5 ejercicio, traer los 5 primeros usuarios de la base de datos */
SELECT * FROM users LIMIT 5

/* 6 ejercicio, traer los 10 ultimos usuarios de la base de datos */
SELECT * FROM users ORDER BY id DESC LIMIT 10

/* 7 ejercicio, listar usuarios que su correo finalice en .net*/
SELECT nombres, apellidos, correo FROM users WHERE correo LIKE '%.net%'

/* 8 ejercicio, listar usuarios que no vivan en colombia, */
SELECT nombres, apellidos, pais FROM users WHERE pais <> 'Colombia'

/* 9 ejercicio, listar usuarios que no vivan en ecuador y panama  */
SELECT nombres, apellidos, pais FROM users WHERE pais <> 'ecuador' AND pais <> 'panama'

/* 10 ejercicio, cuantos(numero) usuarios son de colombia y les gusta el rock */
SELECT COUNT(*) FROM users WHERE pais = 'colombia' AND musica = 'rock'

/* 11 ejercicio, actualizar el genero musical de todos los usuarios de la base de metal a carranga */
UPDATE users SET musica='Carranga' WHERE musica='Metal'

SELECT musica FROM users WHERE musica = "Carranga"

/* 12 ejercicio, listado de hombres que le gusta la carranga, sean de colombia y tengan entre 10 y 20 años de edad */
SELECT nombres, apellidos, pais, genero, edad FROM users WHERE genero = "H" AND musica = "carranga" AND pais = 
"Colombia" AND edad >= 10 AND edad <= 20


/* 13 ejercicio, actualizar todos los usuarios que tengan 99 años, su nuevo genero musical favorito sera carranga */
UPDATE users SET musica = "Carranga" WHERE edad = 99

SELECT musica FROM users WHERE edad = 99

/* 14 ejercicio, listar todos los usuarios que su nombre inicie con la "a", "A", lower, aplica camelcase */
SELECT * FROM users WHERE nombres LIKE 'A%' OR nombres LIKE 'a%'

/* 15 ejercicio, listar todos los usuarios que su apellido finalice en z, Z */
SELECT * FROM users WHERE apellidos LIKE '%Z' OR apellidos LIKE '%z'

/* 16 ejercicio, Actualizar los usuarios que tengan 50 años de edad su nuevo genero musical sera NULL */
ALTER TABLE users MODIFY COLUMN musica VARCHAR(255) NULL

UPDATE users SET musica = NULL WHERE edad = 50

SELECT musica FROM users WHERE edad = 50

/* 17 ejercicio listar todos los usuarios que su genero musical sea igual a NULL */
SELECT nombres, apellidos, musica FROM users WHERE musica IS NULL

/* 18 ejercicio, cual es el resultado de la suma de todas las edades de la base de datos, SUM para sumar */
SELECT SUM(edad) FROM users

/* 19 ejercicio cuantos usuarios tenemos registrados en ecuador */
SELECT COUNT(*) FROM users WHERE pais = "Ecuador"

/* 20 ejercicio, cuantos usuarios son de colombia y les gusta el vallenato */
SELECT COUNT(*) FROM users WHERE pais = "Colombia" AND musica = "Vallenato"