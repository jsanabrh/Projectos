
SHOW DATABASES;

CREATE TABLE empresas(
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(45),
    nit INT(45),
    telefono INT(20),
    direccion VARCHAR(45)
)

CREATE TABLE vehiculos(
    id INT PRIMARY KEY AUTO_INCREMENT,
    placa VARCHAR(45),
    modelo VARCHAR(45),
    marca VARCHAR(45),
    color VARCHAR(45),
    tipo_vehiculo VARCHAR(45)
)

CREATE TABLE paises(
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombres VARCHAR(45)
)

CREATE TABLE ciudad(
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(45)
)

CREATE TABLE usuarios(
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(45),
    apellidos VARCHAR(45),
    correo VARCHAR(45),
    contraseña VARCHAR(45),
    edad DATE,
    genero VARCHAR(10),
    altura VARCHAR(10),
    peso VARCHAR(10)
)

/* Insert */

INSERT INTO empresas (nombre, nit, telefono, direccion) VALUES ('Juan', 12345678, 1235456, 'calle1#4-5');

INSERT INTO vehiculos(placa,modelo,marca,color,tipo_vehiculo) VALUES('okl33f', '2013', 'honda', 'blanco', 'moto')


INSERT INTO paises(nombres) VALUES('Colombia')

INSERT INTO ciudad(nombre) VALUES ('Medellin')

INSERT INTO usuarios(nombre,apellidos, correo, contraseña, edad, genero, altura, peso) VALUES ('Juan', 'Sanabria', 'juan@gmail.com', '123456', '2024-05-04', 'masculino', '1.79', '65kg')

DROP TABLE usuarios

SELECT nombre,edad,genero FROM usuarios

UPDATE ciudad SET nombre='Bogota' WHERE nombre='Medellin'

SELECT * FROM ciudad

/* 

1. Que es un motor de base de datos?

    Su papel fundamental es gestionar la interaccion entre las aplicaicones y los datos almacenados, proporcionando infraestructura solida para la gestion de informacion en entornos diversos, encargandose del almacenamiento, recuperacion y manipulacion efeciente de la infromacion de los datos.

    Ejemplos de motores de bases de datos:

        -SQL SERVER
        -MySQL
        -SQLite
        -PostgreSQL
        -Oracle database

2. Cual es la diferencia entre SQL y MYSQL?

    SQL es un lenguaje de programacion que se puede utilizar para almacenar y procesar informacion en una base de datos Relacional. MySQL es la base de datos relacional mas utilizada. Ambas tecnologias funcionann conjuntamente de manera que sea posible almacenar y procesar datos en tablas estructuradas con filas y columnas. MySQL es la tecnologia subyacente que almacena los datos mientras que SQL es el lenguaje que se utiliza para leer, modificar y eliminar esos datos.

3. Que es una relación en MYSQL?

    Son las asociaciones que se crean entre las tablas, con el fin de vincularlas.

    Para que dicha relacion entre tablas exista, la tabla que quieres relacionar debe de poseer una clave primaria, mientras que la tabla donde estara el lado dependiente debe poseer una clave foranea.

    La clave primaria es un campo cuyos valores identifican de forma unica cada registro dentro de la tabla (PRIMARY KEY)

    La clave foranea es un campo dentro de la tabla cuyos valores hacen referencia a las claves primarias (FOREIGN KEY)

    Existen varios tipos de relaciones las cuales son: 

    - Relaciones uno a uno: Se presenta cuando un SOLO registro de la tabla esta relacionado con un registro de otra tabla

    - Relaciones uno a muchos / muchos a uno: Se presenta cuando un registro de la tabla A esta relaciona con ninguno o muchos de la tabla B, pero este registro de la tabla B solo esta relaciona con un registro de la tabla A

    - Relaciones muchos a muchos: Se presenta cuando muchos registros de una tabla A se relacionan con muchos registros de una tabla B

Bibliografia

    -https://keepcoding.io/blog/que-son-los-motores-de-bases-de-datos/

    -https://aws.amazon.com/es/compare/the-difference-between-sql-and-mysql/#:~:text=MySQL%20es%20la%20tecnolog%C3%ADa%20subyacente,que%20tambi%C3%A9n%20es%20muy%20conocido.
    
    -https://styde.net/relaciones-entre-tablas-de-bases-de-datos/

*/