--DDL
CREATE DATABASE RpgFull11
GO

USE RpgFull11
GO

CREATE TABLE Usuarios(
		IdUsuario INT PRIMARY KEY IDENTITY,
		Email VARCHAR(100) UNIQUE NOT NULL,
		Senha VARCHAR(255) NOT NULL
)
GO

CREATE TABLE Classes(
		IdClasse INT PRIMARY KEY IDENTITY,
		Nome VARCHAR(100) UNIQUE NOT NULL,
		Descricao VARCHAR(255)
)
GO

CREATE TABLE Personagens(
		IdPersonagem INT PRIMARY KEY IDENTITY,
		Nome VARCHAR(30) UNIQUE NOT NULL,
		IdUsuario INT UNIQUE FOREIGN KEY REFERENCES Usuarios(IdUsuario),
		IdClasse INT FOREIGN KEY REFERENCES Classes(IdClasse)
)
GO

CREATE TABLE Habilidades(
		IdHabilidade INT PRIMARY KEY IDENTITY,
		Nome VARCHAR(100) UNIQUE NOT NULL,
		Descricao VARCHAR(255)
)
GO

CREATE TABLE ClassesHabilidades(
		IdClasse INT FOREIGN KEY REFERENCES Classes(IdClasse),
		IdHabilidade INT FOREIGN KEY REFERENCES Habilidades(IdHabilidade)
)
GO

--DML---------------------------------------------
INSERT INTO Usuarios (Senha, Email) VALUES(123456, 'email@email.com')
INSERT INTO Classes VALUES('B�rbaro', 'Descri��o Classe B�rbaro')
INSERT INTO Habilidades VALUES('Lan�a Mortal', 'Descri��o Lan�a Mortal'), ('Escudo Supremo', 'Descri��o Escudo Supremo')

INSERT INTO Personagens VALUES('DeuBug', 1, 1)
INSERT INTO ClassesHabilidades VALUES(1, 1), (1, 2)

---------------------------------------------------

INSERT INTO Usuarios (Senha, Email) VALUES(654321, 'BitBug@email.com')
INSERT INTO Classes VALUES('Monge', 'Descri��o Classe Monge')
INSERT INTO Habilidades VALUES('Recuperar Vida', 'Descri��o Recuperar Vida')

INSERT INTO Personagens VALUES('BitBug', 2, 2)
INSERT INTO ClassesHabilidades VALUES(2, 2), (2, 3)

UPDATE Usuarios SET Senha = 123457 WHERE IdUsuario = 1

--DQL
SELECT * FROM Usuarios
SELECT Senha, Email FROM Usuarios

SELECT * FROM Classes
SELECT * FROM Personagens
SELECT * FROM Habilidades
SELECT * FROM ClassesHabilidades

--JOIN(JUN��O)

--INNER JOIN
SELECT * FROM Personagens INNER JOIN Classes ON Personagens.IdClasse = Classes.IdClasse

--FIM DO SCRIPT