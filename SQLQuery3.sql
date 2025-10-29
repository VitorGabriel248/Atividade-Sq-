
CREATE DATABASE vendas;

USE vendas;

CREATE TABLE clientes (
    idCliente INT PRIMARY KEY,
    nome VARCHAR(100),
    cidade VARCHAR(100)
);

CREATE TABLE pedidos (
    idPedidos INT PRIMARY KEY,
    idCliente INT,
    produto VARCHAR(100),
    quantidade INT,
    dataPedido DATE,
    FOREIGN KEY (idCliente) REFERENCES clientes(idCliente)
);



INSERT INTO clientes (idCliente, nome, cidade) VALUES
(1, 'Ana Souza', 'São Paulo'),
(2, 'Carlos Lima', 'Rio de Janeiro'),
(3, 'Mariana Silva', 'Belo Horizonte');

-- Inserindo pedidos
INSERT INTO pedidos (idPedidos, idCliente, produto, quantidade, dataPedido) VALUES
(101, 1, 'Notebook', 2, '2025-10-01'),
(102, 2, 'Smartphone', 1, '2025-10-03'),
(103, 3, 'Monitor', 3, '2025-10-05'),
(104, 1, 'Teclado', 5, '2025-10-06');




SELECT 
    c.nome,
    c.cidade,
    p.produto,
    p.quantidade,
    p.dataPedido
FROM 
    clientes AS c
INNER JOIN 
    pedidos AS p 
ON 

c.idCliente = p.idCliente;
    
