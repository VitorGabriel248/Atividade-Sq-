
CREATE DATABASE Escola



USE Escola;

-- Criação das tabelas
CREATE TABLE Curso (
    id_Curso INT PRIMARY KEY,
    CursoNome VARCHAR(100),
    CagHORA INT
);

CREATE TABLE Diciplina (
    id_Diciplina INT PRIMARY KEY,
    NomeDiciplina VARCHAR(100),
    Cghora_Dip INT,
    Semestre VARCHAR(50),
    id_Curso INT,
    FOREIGN KEY (id_Curso) REFERENCES Curso(id_Curso)
);

CREATE TABLE Professor (
    id_Professor INT PRIMARY KEY,
    NomeProfessor VARCHAR(100),
    CPF CHAR(14),
    AreaAtuacao VARCHAR(100),
    id_Diciplina INT,
    FOREIGN KEY (id_Diciplina) REFERENCES Diciplina(id_Diciplina)
);

CREATE TABLE Aluno (
    id_Aluno INT PRIMARY KEY,
    Nome VARCHAR(100),
    CPF CHAR(14),
    Dt_NASC DATE,
    Matricula INT,
    id_Curso INT,
    FOREIGN KEY (id_Curso) REFERENCES Curso(id_Curso)
);

CREATE TABLE Boletim (
    id_Boletim INT PRIMARY KEY,
    Faltas INT,
    Nota1 INT,
    NOTA2 INT,
    SituacaoFinal VARCHAR(100),
    id_Aluno INT,
    id_Diciplina INT,
    id_Professor INT,
    FOREIGN KEY (id_Aluno) REFERENCES Aluno(id_Aluno),
    FOREIGN KEY (id_Diciplina) REFERENCES Diciplina(id_Diciplina),
    FOREIGN KEY (id_Professor) REFERENCES Professor(id_Professor)
);

alter table Curso
add areaAtuacao Nvarchar(100) not null default ' não informado';

select * from Curso


-- Inserção de dados
INSERT INTO Curso (id_Curso, CursoNome, CagHORA) VALUES
(1, 'Administração', 320),
(2, 'Engenharia Civil', 400),
(3, 'Direito', 360),
(4, 'Ciência da Computação', 380),
(5, 'Psicologia', 340);

INSERT INTO Diciplina (id_Diciplina, NomeDiciplina, Cghora_Dip, Semestre, id_Curso) VALUES
(1, 'Contabilidade Geral', 60, '1º Semestre', 1),
(2, 'Gestão de Pessoas', 60, '2º Semestre', 1),
(3, 'Cálculo Estrutural', 80, '3º Semestre', 2),
(4, 'Desenho Técnico', 60, '1º Semestre', 2),
(5, 'Direito Constitucional', 60, '1º Semestre', 3),
(6, 'Direito Penal', 60, '2º Semestre', 3),
(7, 'Algoritmos e Lógica', 60, '1º Semestre', 4),
(8, 'Estrutura de Dados', 60, '2º Semestre', 4),
(9, 'Psicologia do Desenvolvimento', 60, '1º Semestre', 5),
(10, 'Psicopatologia', 60, '2º Semestre', 5);

INSERT INTO Professor (id_Professor, NomeProfessor, CPF, AreaAtuacao, id_Diciplina) VALUES
(1, 'Prof. Ana Souza', '123.456.789-00', 'Administração', 1),
(2, 'Prof. Bruno Lima', '234.567.890-11', 'Administração', 2),
(3, 'Prof. Carlos Mendes', '345.678.901-22', 'Engenharia Civil', 3),
(4, 'Prof. Daniela Rocha', '456.789.012-33', 'Engenharia Civil', 4),
(5, 'Prof. Eduardo Silva', '567.890.123-44', 'Direito', 5),
(6, 'Prof. Fernanda Costa', '678.901.234-55', 'Direito', 6),
(7, 'Prof. Gustavo Almeida', '789.012.345-66', 'Computação', 7),
(8, 'Prof. Helena Martins', '890.123.456-77', 'Computação', 8),
(9, 'Prof. Igor Nunes', '901.234.567-88', 'Psicologia', 9),
(10, 'Prof. Juliana Freitas', '012.345.678-99', 'Psicologia', 10);

INSERT INTO Aluno (id_Aluno, Nome, CPF, Dt_NASC, Matricula, id_Curso) VALUES
(1, 'Alice', '111.222.333-44', '2000-01-15', 1001, 1),
(2, 'Bruno', '222.333.444-55', '1999-05-20', 1002, 2),
(3, 'Carla', '333.444.555-66', '2001-03-10', 1003, 3),
(4, 'Daniel', '444.555.666-77', '1998-07-25', 1004, 4),
(5, 'Elaine', '555.666.777-88', '2000-11-30', 1005, 5),
(6, 'Felipe', '666.777.888-99', '1997-09-12', 1006, 1),
(7, 'Gabriela', '777.888.999-00', '2002-02-28', 1007, 2),
(8, 'Henrique', '888.999.000-11', '1996-06-18', 1008, 3),
(9, 'Isabela', '999.000.111-22', '2001-12-05', 1009, 4),
(10, 'João', '000.111.222-33', '1999-04-14', 1010, 5),
(11, 'Karen', '111.222.333-44', '2000-08-09', 1011, 1),
(12, 'Lucas', '222.333.444-55', '1998-10-23', 1012, 2),
(13, 'Marina', '333.444.555-66', '2001-06-17', 1013, 3),
(14, 'Nicolas', '444.555.666-77', '1997-03-03', 1014, 4),
(15, 'Olivia', '555.666.777-88', '2000-05-29', 1015, 5),
(16, 'Pedro', '666.777.888-99', '1999-01-11', 1016, 1),
(17, 'Quésia', '777.888.999-00', '2002-07-07', 1017, 2),
(18, 'Rafael', '888.999.000-11', '1996-09-19', 1018, 3),
(19, 'Sabrina', '999.000.111-22', '2001-11-01', 1019, 4),
(20, 'Thiago', '000.111.222-33', '1998-02-26', 1020, 5);

INSERT INTO Boletim (id_Boletim, Faltas, Nota1, NOTA2, SituacaoFinal, id_Aluno, id_Diciplina, id_Professor) VALUES
(1, 5, 8, 7, 'Aprovado', 1, 1, 1),
(2, 10, 6, 5, 'Recuperação', 2, 3, 3),
(3, 15, 4, 3, 'Reprovado', 3, 5, 5),
(4, 2, 9, 9, 'Aprovado', 4, 7, 7),
(5, 8, 7, 6, 'Recuperação', 5, 9, 9),
(6, 20, 3, 4, 'Reprovado', 6, 2, 2),
(7, 0, 10, 10, 'Aprovado', 7, 4, 4),
(8, 12, 5, 5, 'Recuperação', 8, 6, 6),
(9, 18, 2, 3, 'Reprovado', 9, 8, 8),
(10, 6, 8, 8, 'Aprovado', 10, 10, 10),
(11, 4, 9, 7, 'Aprovado', 11, 1, 1),
(12, 9, 6, 6, 'Recuperação', 12, 3, 3),
(13, 14, 4, 2, 'Reprovado', 13, 5, 5),
(14, 3, 9, 8, 'Aprovado', 14, 7, 7),
(15, 7, 7, 6, 'Recuperação', 15, 9, 9),
(16, 19, 3, 4, 'Reprovado', 16, 2, 2),
(17, 1, 10, 9, 'Aprovado', 17, 4, 4),
(18, 11, 5, 5, 'Recuperação', 18, 6, 6),
(19, 16, 2, 3, 'Reprovado', 19, 8, 8),
(20, 5, 8, 8, 'Aprovado', 20, 10, 10);

-- Consultas
SELECT * FROM Aluno;
SELECT * FROM Curso;
SELECT * FROM Diciplina;
SELECT * FROM Professor;
SELECT * FROM Boletim;
EXEC sp_help 'Aluno';



Create table AreaAtuacao(
nomeArea Nvarchar(100) not null
);


ALTER TABLE AreaAtuacao
ADD id_area INT IDENTITY(1,1) NOT NULL;


alter table curso
 add Constraint FK_Curso_AreaAtuacao
 foreign key (id_area) references AreaAtuacao(id_area);

 select * from AreaAtuacao