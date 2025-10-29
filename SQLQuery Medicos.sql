create database ClinicaVida;

use ClinicaVida;

Create table Pacientes(
id_pacientes int primary key,
Nome Varchar(100),
CPF Char (14),
DataNac date,
Telefone Varchar (15)
);

Create table Medico(
id_medicos int primary key,
NomeMed Varchar(100),
Especialidade Varchar (50),
CRM varchar(10)
);



CREATE TABLE Consultas (
    id_consulta INT PRIMARY KEY,
    DataConsulta DATE,
    id_pacientes INT,
    id_medicos INT,

    CONSTRAINT fk_Consultas_pacientes
        FOREIGN KEY (id_pacientes) REFERENCES pacientes(id_pacientes),

    CONSTRAINT fk_Consultas_medicos
        FOREIGN KEY (id_medicos) REFERENCES medico(id_medicos)
);

Create Table Exames (
id_Exame int primary Key,
NomeExame Varchar(100),
Descricao Varchar(100)
)

select * from	Pacientes
select * from	Medico
select * from   Consultas
select * from	Exames

insert into Pacientes (id_pacientes,Nome,CPF,DataNac,Telefone)
values
(1,'Vitor','48878965439','1987-12-6','978547856')

INSERT INTO Pacientes (id_pacientes, Nome, CPF, DataNac, Telefone)
VALUES
(2, 'Lucas Pereira', '12345678901234', '1990-05-12', '11999990001'),
(3, 'Amanda Costa', '23456789012345', '1985-08-23', '11999990002'),
(4, 'Bruno Silva', '34567890123456', '2000-01-15', '11999990003'),
(5, 'Juliana Rocha', '45678901234567', '1995-11-30', '11999990004'),
(6, 'Carlos Eduardo', '56789012345678', '1988-03-05', '11999990005');


INSERT INTO Medico (id_medicos, NomeMed, Especialidade, CRM)
VALUES
(1, 'Dr. Fernanda Almeida', 'Cardiologia', 'CRM123456'),
(2, 'Dr. Rafael Torres', 'Ortopedia', 'CRM234567'),
(3, 'Dra. Marina Lopes', 'Pediatria', 'CRM345678'),
(4, 'Dr. João Batista', 'Dermatologia', 'CRM456789'),
(5, 'Dra. Carla Mendes', 'Neurologia', 'CRM567890');
