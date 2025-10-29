--Cria~ção do Banco de dados
Create database TechStore2

Use techStore2
-- Criação da primeira tabela

Create table Produtos(
 ID INT IDENTITY (1,1)Primary Key,
 Nome VArchar(100) not null,
 Categoria Varchar(100) not null,
 Preco Decimal(10,2) not null,
 Estoque Int NOt null);

 --inserção de dados

 Insert into Produtos (Nome, Categoria, Preco, Estoque)
 VALUES
 ('Notebook Gamer', 'Notebook', 699.90, 12),
('Mouse RGB', 'Periféricos', 149.90, 80),
('Monitor 4k', 'Monitores', 1899.90, 10);

SELECT * FROM  Produtos

 
--\\\\\\\\\\\\\\\--\

UPDATE Produtos SET Preco = ROUND (Preco * 1.15,2) WHERE ID = 2;

--\\\\\\\\\\\\\\\\\\--

DELETE FROM Produtos WHERE ID = 3;

--\\\\\\\\\\\\\\\\\\\\\-
SELECT * FROM  Produtos

--\\\\\\\\\\\\\\\\\\\\\\\\\-

ALTER TABLE Produtos ADD Marca Varchar(50) NULL;
SELECT * FROM  Produtos

--\\\\\\\\\\\\\\\\\\\\\--

UPDATE Produtos
SET Marca = CASE ID
	when 1 then 'DELL'
	when 2 then 'Razer'
	else null
	end;

SELECT * FROM  Produtos


Create Table Clientes (
	ID INT IDENTITY (1,1) Primary Key,
	Nome VarCHar(100) not null,
	email VarCHar(50) not null,
	DataCadastro DateTime
	);


ALTER TABLE Clientes ADD Cidade Varchar(50) NULL; 
SELECT * FROM  Clientes


-- Etapa 8 - Criar a Tabela Clientes

-- Contaultar tabela Criada
select * from Clientes
-- Etapa 9 - Inserir valores da Tabela Clientes
insert into CLientes (nome, email, DataCadastro, Cidade) 
values
	('Joao', 'joao@gmail.com', getdate(),'Osasco'),
	('Tiago', 'tiago@gmail.com', getdate(),'Barueii');

INSERT INTO Clientes (nome, email, DataCadastro, Cidade) 
VALUES ('Carlos', 'carlos@gmail.com', GETDATE(), 'São Paulo');


-- Etapa 10 - Criar a tabela fornecedores
Create Table Fornecedores (
	ID INT IDENTITY (1,1) Primary Key,
	Nome VarCHar(100) not null,
	CNPJ VarCHar(18) not null,
	telefone varchar(20),
	email varchar(10)
	);
-- ALterar a quantidade de caracteres
alter table fornecedores
alter column email varchar(150) not null;
--select * from fornecedores
-- Criar atributo FornecedorIF na tabela produtos
Alter Table Produtos
add FornecedorID Int;
-- Inserir valores na tabela fornecedores
insert into Fornecedores (nome, cnpj, telefone, email)
values
('Distribuidor 1', '11.222.777/0001-99', '999999999', 'a@acom'),
('Distribuidor 2', '22.333.444/0001-09', '999999999', 'a@acom'),
('Distribuidor 3', '11.222.777/0001-99', '999999999', 'a@acom');
-- vincular os produtos existentes aos fornecedores
select * from fornecedores
update produtos
set FornecedorID = (select ID from Fornecedores
	where nome = 'Distribuidor 2')
	where ID = 2;
-- Consulta INNER JOIN
select
	produtos.nome,
	produtos.categoria,
	produtos.marca,
	fornecedores.nome,
	fornecedores.CNPJ
from Produtos produtos
join Fornecedores fornecedores
on produtos.marca = 'DELL';

CREATE TABLE Pedidos(
    ID INT IDENTITY(1,1) PRIMARY KEY,
    ClienteID   INT         NOT NULL,
    DataPedido  DATE        NOT NULL,
    ValorTotal  DECIMAL(10,2) NOT NULL,
    CONSTRAINT FK_Pedidos_Clientes
        FOREIGN KEY (ClienteID) REFERENCES Clientes(ID)
);

INSERT INTO Pedidos (ClienteID, DataPedido, ValorTotal) VALUES
(1, '2025-10-20',  259.90),
(2, '2025-10-21',  1299.00),
(3, '2025-10-22',  75.00);

INSERT INTO Pedidos (ClienteID, DataPedido, ValorTotal) VALUES
(1, '2025-10-21',  99.50);

select * from Pedidos




SELECT 
    P.ID AS PedidoID,
    P.DataPedido,
    P.ValorTotal,
    C.Nome AS Cliente,
    C.Cidade AS Cidade
FROM Pedidos P
INNER JOIN Clientes C ON P.ClienteID = C.ID
ORDER BY P.DataPedido ASC


UPDATE Clientes
SET Nome = 'Ana Souza'
WHERE Nome = 'Joao';

SELECT 
    P.ID AS PedidoID,
    P.DataPedido,
    P.ValorTotal
FROM Pedidos P
INNER JOIN Clientes C ON P.ClienteID = C.ID
WHERE c.Nome ='Ana Souza';



SELECT 
    C.Cidade,
    COUNT(P.ID) AS QtdePedidos,
    SUM(P.ValorTotal) AS TotalVendido
FROM Pedidos P
INNER JOIN Clientes C ON P.ClienteID = C.ID
GROUP BY C.Cidade
HAVING COUNT(P.ID) > 0
ORDER BY TotalVendido DESC




SELECT 
    P.ID AS PedidoID,
    P.DataPedido,
    P.ValorTotal,
    C.Nome AS Cliente
FROM Pedidos P
INNER JOIN Clientes C ON P.ClienteID = C.ID
WHERE P.ValorTotal > 200.00;


SELECT 
    C.Nome AS Cliente,
    MAX(P.ValorTotal) AS MaiorPedido
FROM Pedidos P
INNER JOIN Clientes C ON P.ClienteID = C.ID
GROUP BY C.Nome;
