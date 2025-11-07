Create DataBase Locadora
use Locadora

Create table Clientes (
id_Clientes int Primary Key,
Nome varchar(100),
Email Varchar(100),
Telefone Char(13)
);

select * from Clientes

CREATE TABLE Filme_serie (
    id_Filme_serie INT PRIMARY KEY,
    titulo VARCHAR(150),
    id_Categoria INT,
    FOREIGN KEY (id_Categoria) REFERENCES Categoria (id_Categoria),
	precolocacao decimal(6,2)
);

select * from Filme_serie

 Create Table Categoria (
 id_Categoria int Primary key,
 NomeCategoria Varchar(100));

select * from Categoria

CREATE TABLE Locacoes (
    id_locacao INT PRIMARY KEY,
    id_Clientes INT,
    id_Filme_serie INT,
    precolocacao DECIMAL(6,2),
    dataLocacao DATE,
    status VARCHAR(20),
    FOREIGN KEY (id_Clientes) REFERENCES Clientes(id_Clientes),
    FOREIGN KEY (id_Filme_serie) REFERENCES Filme_serie(id_Filme_serie)
);
select * from Locacoes

CREATE TABLE Pagamentos (
    id_pagamento INT PRIMARY KEY,
    id_locacao INT,
    valor DECIMAL(6,2),
    data DATE,
    status VARCHAR(20),
    FOREIGN KEY (id_locacao) REFERENCES Locacoes(id_locacao)
);

select * from Clientes
select * from Categoria
select * from Filme_serie
select * from Locacoes
select * from Pagamentos

insert into Clientes (id_Clientes, Nome, Email, Telefone) Values
(1, 'Ana Souza', 'ana@email.com', '11999990001')

INSERT INTO Clientes (id_Clientes, Nome, Email, Telefone) VALUES
(2, 'Rafael Santos', 'rafael.santos@yahoo.com', '11981234567'),
(3, 'Juliana Costa', 'juliana.costa@outlook.com', '11999887766'),
(4, 'Lucas Almeida', 'lucas.almeida@gmail.com', '11991112233'),
(5, 'Mariana Ribeiro', 'mariana.ribeiro@hotmail.com', '11992223344'),
(6, 'Bruno Carvalho', 'bruno.carvalho@gmail.com', '11993334455'),
(7, 'Camila Martins', 'camila.martins@icloud.com', '11994445566'),
(8, 'Thiago Lima', 'thiago.lima@gmail.com', '11995556677'),
(9, 'Patrícia Souza', 'patricia.souza@yahoo.com', '11996667788'),
(10, 'André Pereira', 'andre.pereira@outlook.com', '11997778899'),
(11, 'Fernanda Oliveira', 'fernanda.oliveira@gmail.com', '11998889900');


INSERT INTO Categoria (id_Categoria, NomeCategoria) VALUES
(1, 'Ação'),
(2, 'Comédia'),
(3, 'Drama'),
(4, 'Suspense'),
(5, 'Documentário');

INSERT INTO Filme_serie (id_Filme_serie, titulo, id_Categoria, precolocacao) VALUES
(101, 'Missão Impossível', 1, 14.90),
(102, 'Se Beber, Não Case', 2, 12.50),
(103, 'A Espera de um Milagre', 3, 9.90),
(104, 'O Código Da Vinci', 4, 11.00),
(105, 'Planeta Terra', 5, 13.50),
(106, 'Velozes e Furiosos', 1, 10.00),
(107, 'As Branquelas', 2, 15.00),
(108, 'O Rei Leão', 3, 8.90),
(109, 'Corra!', 4, 16.20),
(110, 'Cosmos', 5, 12.00);

INSERT INTO Filme_serie (id_Filme_serie, titulo, id_Categoria, precolocacao) VALUES
(112, 'A Lenda do Samurai', 1, 13.90),
(113, 'Todo Mundo em Pânico', 2, 11.50),
(114, 'Milagre na Cela 7', 3, 9.50),
(115, 'A Ilha do Medo', 4, 14.20),
(116, 'História da Humanidade', 5, 12.80);


INSERT INTO Locacoes (id_locacao, id_Clientes, id_Filme_serie, precolocacao, dataLocacao, status) VALUES
(202, 2, 102, 12.50, '2025-11-02', 'pendente'),
(203, 3, 103, 9.90, '2025-11-03', 'recusado'),
(204, 4, 104, 11.00, '2025-11-04', 'aprovado'),
(205, 5, 105, 13.50, '2025-11-05', 'pendente'),
(206, 6, 106, 10.00, '2025-11-06', 'aprovado'),
(207, 7, 107, 15.00, '2025-11-07', 'aprovado'),
(208, 8, 108, 8.90, '2025-11-08', 'recusado'),
(209, 9, 109, 16.20, '2025-11-09', 'pendente'),
(210, 10, 110, 12.00, '2025-11-10', 'aprovado'),
(211, 11, 101, 14.90, '2025-11-11', 'aprovado');

INSERT INTO Locacoes (id_locacao, id_Clientes, id_Filme_serie, precolocacao, dataLocacao, status) VALUES
(212, 1, 101, 14.90, '2025-11-12', 'atrasada'),
(213, 2, 102, 12.50, '2025-11-13', 'atrasada'),
(214, 3, 103, 9.90, '2025-11-14', 'atrasada'),
(215, 4, 104, 11.00, '2025-11-15', 'atrasada'),
(216, 5, 105, 13.50, '2025-11-16', 'atrasada');


INSERT INTO Pagamentos (id_pagamento, id_locacao, valor, data, status) VALUES
(2, 202, 12.50, '2025-11-02', 'pendente'),
(3, 203, 9.90, '2025-11-03', 'recusado'),
(4, 204, 11.00, '2025-11-04', 'aprovado'),
(5, 205, 13.50, '2025-11-05', 'pendente'),
(6, 206, 10.00, '2025-11-06', 'aprovado'),
(7, 207, 15.00, '2025-11-07', 'aprovado'),
(8, 208, 8.90, '2025-11-08', 'recusado'),
(9, 209, 16.20, '2025-11-09', 'pendente'),
(10, 210, 12.00, '2025-11-10', 'aprovado'),
(11, 211, 14.90, '2025-11-11', 'aprovado');


SELECT 
    L.id_locacao,
    C.Nome AS Cliente,
    F.titulo AS Filme,
    L.status
FROM Locacoes L
INNER JOIN Clientes C ON L.id_Clientes = C.id_Clientes
INNER JOIN Filme_serie F ON L.id_Filme_serie = F.id_Filme_serie;

SELECT 
    C.id_Clientes,
    C.Nome,
    L.id_locacao,
    L.status
FROM Clientes C
LEFT JOIN Locacoes L ON C.id_Clientes = L.id_Clientes;

SELECT 
    Cat.id_Categoria,
    Cat.NomeCategoria,
    F.titulo AS Filme
FROM Categoria Cat
RIGHT JOIN Filme_serie F ON Cat.id_Categoria = F.id_Categoria;


SELECT *
FROM Locacoes
WHERE status = 'atrasada';


SELECT 
    C.Nome AS Cliente,
    COUNT(L.id_locacao) AS TotalLocacoes
FROM Clientes C
LEFT JOIN Locacoes L ON C.id_Clientes = L.id_Clientes
GROUP BY C.Nome;

SELECT 
    titulo,
    precolocacao
FROM Filme_serie
ORDER BY precolocacao DESC;


SELECT 
    F.id_Filme_serie,
    F.titulo
FROM Filme_serie F
LEFT JOIN Locacoes L ON F.id_Filme_serie = L.id_Filme_serie
WHERE L.id_locacao IS NULL;


UPDATE Locacoes
SET status = 'atrasada'
WHERE id_locacao = 202;


ALTER TABLE Clientes
ADD CPF CHAR(14);

INSERT INTO Clientes (id_Clientes, Nome, Email, Telefone) VALUES
(12, 'João Mendes', 'joao.mendes@gmail.com', '11990001122'),
(13, 'Larissa Silva', 'larissa.silva@hotmail.com', '11991112233'),
(14, 'Carlos Eduardo', 'carlos.eduardo@outlook.com', '11992223344'),
(15, 'Beatriz Lima', 'beatriz.lima@yahoo.com', '11993334455');

INSERT INTO Categoria (id_Categoria, NomeCategoria) VALUES
(6, 'Romance'),
(7, 'Fantasia'),
(8, 'Terror'),
(9, 'Aventura'),
(10, 'Musical'),
(11, 'Biografia'),
(12, 'Histórico'),
(13, 'Animação'),
(14, 'Esporte'),
(15, 'Ficção Científica');

INSERT INTO Pagamentos (id_pagamento, id_locacao, valor, data, status) VALUES
(12, 212, 14.90, '2025-11-12', 'aprovado'),
(13, 213, 12.50, '2025-11-13', 'pendente'),
(14, 214, 9.90, '2025-11-14', 'recusado'),
(15, 215, 11.00, '2025-11-15', 'aprovado');


UPDATE Clientes SET CPF = '123.456.789-00' WHERE id_Clientes = 1;
UPDATE Clientes SET CPF = '234.567.890-11' WHERE id_Clientes = 2;
UPDATE Clientes SET CPF = '345.678.901-22' WHERE id_Clientes = 3;
UPDATE Clientes SET CPF = '456.789.012-33' WHERE id_Clientes = 4;
UPDATE Clientes SET CPF = '567.890.123-44' WHERE id_Clientes = 5;
UPDATE Clientes SET CPF = '678.901.234-55' WHERE id_Clientes = 6;
UPDATE Clientes SET CPF = '789.012.345-66' WHERE id_Clientes = 7;
UPDATE Clientes SET CPF = '890.123.456-77' WHERE id_Clientes = 8;
UPDATE Clientes SET CPF = '901.234.567-88' WHERE id_Clientes = 9;
UPDATE Clientes SET CPF = '012.345.678-99' WHERE id_Clientes = 10;
UPDATE Clientes SET CPF = '222.333.444-55' WHERE id_Clientes = 12;
UPDATE Clientes SET CPF = '333.444.555-66' WHERE id_Clientes = 13;
UPDATE Clientes SET CPF = '444.555.666-77' WHERE id_Clientes = 14;
UPDATE Clientes SET CPF = '555.666.777-88' WHERE id_Clientes = 15;