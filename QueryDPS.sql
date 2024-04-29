USE master
GO
CREATE DATABASE SistemaNotas
GO
USE SistemaNotas

CREATE TABLE Estudiantes (
    EstudianteID INT PRIMARY KEY,
    Nombre NVARCHAR(100),
    Apellido NVARCHAR(100),
    Email NVARCHAR(100),
	Carrera NVARCHAR(100)
);

CREATE TABLE Cursos (
    CursoID INT PRIMARY KEY,
    Nombre NVARCHAR(100),
    Descripcion NVARCHAR(255)
);

CREATE TABLE Actividades (
	ActividadID INT PRIMARY KEY,
	NombreActividad NVARCHAR(100),
	Porcentaje FLOAT,
	CursoID INT
	CONSTRAINT FK_CursoID FOREIGN KEY (CursoID) REFERENCES Cursos(CursoID),


);

CREATE TABLE Notas (
    NotaID INT PRIMARY KEY,
    EstudianteID INT,
    ActividadID INT,
    Nota FLOAT,
    CONSTRAINT FK_EstudianteID FOREIGN KEY (EstudianteID) REFERENCES Estudiantes(EstudianteID),
    CONSTRAINT FK_Actividad FOREIGN KEY (ActividadID) REFERENCES Actividades(ActividadID)
);

-- Insertando registros en la tabla Estudiantes
INSERT INTO Estudiantes (EstudianteID, Nombre, Apellido, Email) VALUES
(1, 'Juan', 'Perez', 'juan@udb.edu.sv'),
(2, 'Maria', 'Gonzalez', 'maria@udb.edu.sv'),
(3, 'Carlos', 'Martinez', 'carlos@udb.edu.sv'),
(4, 'Ana', 'Lopez', 'ana@udb.edu.sv'),
(5, 'Pedro', 'Rodriguez', 'pedro@udb.edu.sv');

-- Insertando registros en la tabla Cursos
INSERT INTO Cursos (CursoID, Nombre, Descripcion) VALUES
(1, 'Álgebra', 'Álgebra vectorial y matríces'),
(2, 'Progra 1', 'Progra 1'),
(3, 'Servidores', 'Servidores Libres'),
(4, 'Calculo Integral', 'Calculo Integral'),
(5, 'Seguridad', 'Seguridad Informática');


-- Insertando registros en la tabla Cursos
INSERT INTO Actividades (ActividadID, NombreActividad, Porcentaje, CursoID) VALUES
(1, 'Guía 1 Algebra',10,1),
(2, 'Avance de Proyecto Progra1',20,2 ),
(3, 'Avance de Proyecto Servidores',20,3),
(4, 'Guía 1 Calculo Integral',10,4),
(5, 'Avance de Proyecto Seguridad',10,5);

-- Insertando registros en la tabla Notas
INSERT INTO Notas (NotaID, EstudianteID, ActividadID, Nota) VALUES
(1, 1, 1, 8),
(2, 1, 2, 10),
(3, 2, 3, 6),
(4, 2, 4, 9),
(5, 3, 5, 7);