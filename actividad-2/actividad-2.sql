SHOW DATABASES;

USE bsauq8cqhq4gsg5ra7xd;

CREATE TABLE Estudiantes (
    EstudianteID INT PRIMARY KEY,
    Nombre VARCHAR(50) NOT NULL
);

SELECT * FROM Estudiantes;

INSERT INTO Estudiantes (EstudianteID, Nombre) VALUES
(1, 'Manuela'),
(2, 'Juan'),
(3, 'Pablo'),
(4, 'Luisa'),
(5, 'Thomas'),
(6, 'Camilo'),
(7, 'Daniel'),
(8, 'Luis'),
(9, 'Samuel'),
(10, 'Carlos');

SELECT * FROM Estudiantes

CREATE TABLE Materias (
    MateriaID INT PRIMARY KEY,
    NombreMateria VARCHAR(50) NOT NULL
);

INSERT INTO Materias (MateriaID, NombreMateria) VALUES
(1, 'ingles'),
(2, 'español'),
(3, 'matematicas'),
(4, 'artistica'),
(5, 'Tecnologia'),
(6, 'etica'),
(7, 'Comprension'),
(8, 'geometria'),
(9, 'Biologia'),
(10, 'Fisica');

CREATE TABLE Notas (
    EstudianteID INT(50),
    MateriaID INT(50),
    Nota DECIMAL(4,2),
    FOREIGN KEY (EstudianteID) REFERENCES Estudiantes(EstudianteID),
    FOREIGN KEY (MateriaID) REFERENCES Materias(MateriaID)
);

INSERT INTO Notas (EstudianteID, MateriaID, Nota) VALUES
(2, 1, 7.8),
(2, 2, 6.5),
(2, 3, 8.0),
(3, 4, 9.0),
(3, 5, 7.5),
(3, 6, 8.7),
(4, 7, 8.2),
(4, 8, 7.3),
(4, 9, 9.5),
(5, 10, 6.8),
(5, 1, 8.9),
(5, 2, 7.6),
(6, 3, 9.3),
(6, 4, 7.8),
(6, 5, 8.1),
(7, 6, 6.7),
(7, 7, 8.4),
(7, 8, 9.1),
(8, 9, 7.9),
(8, 10, 8.6),
(8, 1, 9.0),
(9, 2, 8.3),
(9, 3, 7.2),
(9, 4, 9.4),
(10, 5, 6.5),
(10, 6, 8.8),
(10, 7, 7.7);

SELECT Notas.EstudianteID, Estudiantes.Nombre AS NombreEstudiante, Notas.MateriaID, Materias.NombreMateria, Notas.Nota
FROM Notas
JOIN Estudiantes ON Notas.EstudianteID = Estudiantes.Nombre
JOIN Materias ON Notas.MateriaID = Materias.NombreMateria;

SELECT * FROM Notas;