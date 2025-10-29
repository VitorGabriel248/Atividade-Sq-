use techStore;
 
create table produtos(
id_produtos int primary key,
nome varchar(100),
categoria varchar(50),
preco decimal (10 ,2),
estoque int,
);
 
 
/* essa e tabela produtos */
 
 
 
insert into produtos (id_produtos, nome, categoria, preco, estoque)
values
(1, 'Notebook Gamer XZ500', 'Computadores', 4899.90, 15),
(2, 'Mouse Óptico RGB Pro', 'Periféricos', 149.99, 50),
(3, 'Monitor LED 27" 4K', 'Monitores', 1299.00, 20),
(4, 'Teclado Mecânico MK2', 'Periféricos', 299.90, 35),
(5, 'Headset Gamer Surround', 'Áudio', 399.50, 25);
 
/*insert feito */
 
/*select * from produtos*/
/*foi acrescentado outro valor  no produto 1*/
update produtos
set preco = 4599.90
where id_produtos = 1;
 
 
/*sera descontinuado o produto 2*/
 
 
delete from produtos
where id_produtos = 2;
/*linha 2 foi excluida*/
x
SELECT * FROM produtos;
 
 

 
 
/* tabela foi excluida*/
 
create table clientes (
id_cliente int primary key,
nome varchar (100),
Email varchar (50),
Dt_Cadastro date,
);
 
 
INSERT INTO clientes (id_cliente, nome, email, Dt_Cadastro) VALUES
(1, 'João Silva', 'joao.silva@email.com', '2025-10-01'),
(2, 'Maria Oliveira', 'maria.oliveira@email.com', '2025-10-05');
 
 select * from clientes
 
 
SELECT 
    p.preco, 
    p.categoria,
    c.nome,
    c.email
FROM produtos AS p, clientes AS c;
 
 
/*
create table produtos(
id_produtos int primary key,
nome varchar(100),
categoria varchar(50),
preco decimal (10 ,2),
estoque int,
);*/