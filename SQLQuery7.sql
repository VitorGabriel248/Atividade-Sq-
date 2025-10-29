CREATE DATABASE BIBLIOTECA

use BIBLIOTECA;

Create Table Alunos (
 id_alunos INT PRIMARY KEY,
 NomeCompleto VARCHAR(100),
 CPF Char(14),
 Matricula INT
);

Create Table Emprestimo(
    id_Emprestimo INT PRIMARY KEY,
    DataEmprestimo DATE,
    DataPrevista DATE,
    DataDevolucao DATE,
    id_Alunos INT,
    FOREIGN KEY (id_Alunos) REFERENCES Alunos(id_Alunos)

 );

 Create Table Autor (
 id_Autor INT PRIMARY KEY,
 NomeAutor VARCHAR);

 Create Table Livro(
 Id_Livro INT PRIMARY KEY,
 Titulo VARCHAR(100),
 AnoPublicacao date,
 id_Autor INT,
 FOREIGN KEY (id_Autor) REFERENCES Autor(id_Autor)
 );


CREATE TABLE LivroEmprestado (
    id_Emprestimo INT,
    id_Livro INT,
    PRIMARY KEY (id_Emprestimo, id_Livro),
    FOREIGN KEY (id_Emprestimo) REFERENCES Emprestimo(id_Emprestimo),
    FOREIGN KEY (id_Livro) REFERENCES Livro(id_Livro)
	);


select * from LivroEmprestado


INSERT INTO Alunos (id_alunos, NomeCompleto, CPF, Matricula) VALUES
(1, 'Ana Souza', '123.456.789-00', 2023001),
(2, 'Bruno Lima', '987.654.321-00', 2023002),
(3, 'Carlos Mendes', '456.789.123-00', 2023003);


INSERT INTO Autor (id_Autor, NomeAutor) VALUES
(1, 'Machado de Assis'),
(2, 'Clarice Lispector'),
(3, 'Graciliano Ramos');


ALTER TABLE Autor
DROP COLUMN NomeAutor;



ALTER TABLE Autor
ADD NomeAutor VARCHAR(100);


INSERT INTO Autor (id_Autor, NomeAutor) VALUES
(1, 'Machado de Assis'),
(2, 'Clarice Lispector'),
(3, 'Graciliano Ramos')



INSERT INTO Livro (Id_Livro, Titulo, AnoPublicacao, id_Autor) VALUES
(101, 'Dom Casmurro', '1899-01-01', 1),
(102, 'Memórias Póstumas de Brás Cubas', '1881-01-01', 1),
(103, 'A Hora da Estrela', '1977-01-01', 2),
(104, 'Vidas Secas', '1938-01-01', 3),
(105, 'São Bernardo', '1934-01-01', 3);


INSERT INTO Emprestimo (id_Emprestimo, DataEmprestimo, DataPrevista, DataDevolucao, id_Alunos) VALUES
(1, '2025-09-01', '2025-09-15', '2025-09-14', 1),
(2, '2025-09-05', '2025-09-20', NULL, 2),
(3, '2025-09-10', '2025-09-25', NULL, 3);



INSERT INTO LivroEmprestado (id_Emprestimo, id_Livro) VALUES
(1, 101),
(1, 102),
(2, 103),
(3, 101),
(3, 104);

select * from Livro