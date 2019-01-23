CREATE DATABASE projeto_smarthome;
USE projeto_smarthome;
CREATE TABLE Equip( id int auto_increment primary key,
					nome varchar(50) not null);
                  
CREATE TABLE Param( id int auto_increment primary key,
					nome varchar(50) not null,
                    tipo varchar(15) not null);
                    
CREATE TABLE Equip_Param( id int auto_increment primary key,
						  id_equip int not null,
						  id_param int not null,
                          
                          foreign key(id_equip) references Equip(id),
						  foreign key(id_param) references Param(id));

CREATE TABLE Ambiente( id int auto_increment primary key,
					   nome varchar(50) not null,
					   capacidadePessoas int unsigned);

CREATE TABLE Instancia( id int auto_increment primary key,
						nome varchar(50) not null,
                        id_equip int not null,
                        id_ambiente int not null,
                        
                        foreign key(id_equip) references Equip(id),
                        foreign key(id_ambiente) references Ambiente(id));
                        
CREATE TABLE Valor( id int auto_increment primary key,
						  id_instancia int not null,
                          id_equip_param int not null,
                          valor varchar(50),
                          
                          foreign key(id_instancia) references Instancia(id),
                          foreign key(id_equip_param) references Equip_Param(id));
                          
CREATE TABLE Historico( id int auto_increment primary key,
						id_inst_valor int not null,
                        valorAnterior varchar(50),
                        valorNovo varchar(50),
                        quandoMudanca timestamp not null,
                        
                        foreign key(id_inst_valor) references Valor(id));


ALTER TABLE Ambiente change capacidadePessoas capacidadePessoas int unsigned not null;
ALTER TABLE Ambiente change capacidadePessoas capacidade_pessoas int unsigned not null;
ALTER TABLE Historico change quandoMudanca quandoMudanca timestamp default current_timestamp;
show tables;

INSERT INTO Equip (nome) values ('lampada');
INSERT INTO Equip (nome) values ('ar_condicionado');
INSERT INTO Equip (nome) values ('televisão');
UPDATE Equip SET nome = 'tv' where nome = 'televisão';
INSERT INTO Equip (nome) values ('cafeteira');
INSERT INTO Equip (nome) values ('carro');
INSERT INTO Equip (nome) values ('geladeira');
INSERT INTO Equip (nome) values ('torneira');
INSERT INTO Equip (nome) values ('chuveiro');
INSERT INTO Equip (nome) values ('torneira');
INSERT INTO Equip (nome) values ('chuveiro');
DELETE from Equip where id = 9;
DELETE from Equip where id = 10;
ALTER TABLE Equip AUTO_INCREMENT = 9;
INSERT INTO Equip (nome) values ('computador');
INSERT INTO Equip (nome) values ('acess_point');

SELECT * from Equip;

SHOW TABLES;
DESC Param;
INSERT INTO Param (nome,tipo) values ('status','Boolean');
INSERT INTO Param (nome,tipo) values ('temperatura','Integer');
INSERT INTO Param (nome,tipo) values ('modo','String');
INSERT INTO Param (nome,tipo) values ('swing','Boolean');
INSERT INTO Param (nome,tipo) values ('canal','Integer');
INSERT INTO Param (nome,tipo) values ('volume','Integer');
INSERT INTO Param (nome,tipo) values ('entrada','String');
INSERT INTO Param (nome,tipo) values ('qtd_cafe','Integer');
INSERT INTO Param (nome,tipo) values ('qtd_gasolina','Integer');
INSERT INTO Param (nome,tipo) values ('nivel_refrigeracao','Integer');
INSERT INTO Param (nome,tipo) values ('posicao_chave','String');

SELECT * from Param;

SHOW TABLES;
DESC Equip_Param;
INSERT INTO Equip_Param (id_equip,id_param) values (1,1);
INSERT INTO Equip_Param (id_equip,id_param) values (2,1);
INSERT INTO Equip_Param (id_equip,id_param) values (2,2);
INSERT INTO Equip_Param (id_equip,id_param) values (2,3);
INSERT INTO Equip_Param (id_equip,id_param) values (2,4);
INSERT INTO Equip_Param (id_equip,id_param) values (3,1);
INSERT INTO Equip_Param (id_equip,id_param) values (3,5);
INSERT INTO Equip_Param (id_equip,id_param) values (3,6);
INSERT INTO Equip_Param (id_equip,id_param) values (3,7);
INSERT INTO Equip_Param (id_equip,id_param) values (4,1);
INSERT INTO Equip_Param (id_equip,id_param) values (4,8);
INSERT INTO Equip_Param (id_equip,id_param) values (5,1);
INSERT INTO Equip_Param (id_equip,id_param) values (5,9);
INSERT INTO Equip_Param (id_equip,id_param) values (6,1);
INSERT INTO Equip_Param (id_equip,id_param) values (6,10);
INSERT INTO Equip_Param (id_equip,id_param) values (7,1);
INSERT INTO Equip_Param (id_equip,id_param) values (8,1);
INSERT INTO Equip_Param (id_equip,id_param) values (8,11);
INSERT INTO Equip_Param (id_equip,id_param) values (9,1);
INSERT INTO Equip_Param (id_equip,id_param) values (10,1);

SELECT * FROM Equip_Param;

SHOW TABLES;
DESC Ambiente;
INSERT INTO Ambiente (nome,capacidade_pessoas) values ('Sala',10);
INSERT INTO Ambiente (nome,capacidade_pessoas) values ('Cozinha',3);
INSERT INTO Ambiente (nome,capacidade_pessoas) values ('Garagem',15);
INSERT INTO Ambiente (nome,capacidade_pessoas) values ('Banheiro',2);
INSERT INTO Ambiente (nome,capacidade_pessoas) values ('Quarto 1',5);
INSERT INTO Ambiente (nome,capacidade_pessoas) values ('Quarto 2',5);

SELECT * FROM Ambiente;

SHOW TABLES;
DESC Instancia;
INSERT INTO Instancia (nome,id_equip,id_ambiente) values ('Lâmpada Central',1,1);
INSERT INTO Instancia (nome,id_equip,id_ambiente) values ('Lâmpada Frente',1,1);
INSERT INTO Instancia (nome,id_equip,id_ambiente) values ('Ar Central',2,1);
INSERT INTO Instancia (nome,id_equip,id_ambiente) values ('TVZona',3,1);
INSERT INTO Instancia (nome,id_equip,id_ambiente) values ('Kitchen Lamp',1,2);
INSERT INTO Instancia (nome,id_equip,id_ambiente) values ('My Coffee Maker',4,2);
INSERT INTO Instancia (nome,id_equip,id_ambiente) values ('Fridge',6,2);
INSERT INTO Instancia (nome,id_equip,id_ambiente) values ('Tap',7,2);
INSERT INTO Instancia (nome,id_equip,id_ambiente) values ('Lâmpada Garagem',1,3);
INSERT INTO Instancia (nome,id_equip,id_ambiente) values ('Carro 1',5,3);
INSERT INTO Instancia (nome,id_equip,id_ambiente) values ('Carro 2',5,3);
INSERT INTO Instancia (nome,id_equip,id_ambiente) values ('AP Externo',10,3);
INSERT INTO Instancia (nome,id_equip,id_ambiente) values ('Lâmpada Banheiro',1,4);
INSERT INTO Instancia (nome,id_equip,id_ambiente) values ('Chuveiro',8,4);
INSERT INTO Instancia (nome,id_equip,id_ambiente) values ('Torneira da Pia',7,4);
INSERT INTO Instancia (nome,id_equip,id_ambiente) values ('Lâmpada C1',1,5);
INSERT INTO Instancia (nome,id_equip,id_ambiente) values ('Ar Condic Q1',2,5);
INSERT INTO Instancia (nome,id_equip,id_ambiente) values ('TV Q1',3,5);
INSERT INTO Instancia (nome,id_equip,id_ambiente) values ('Lâmpada Q2',1,6);
INSERT INTO Instancia (nome,id_equip,id_ambiente) values ('Ar Condic Q2',2,6);
INSERT INTO Instancia (nome,id_equip,id_ambiente) values ('Laptop A',9,6);
INSERT INTO Instancia (nome,id_equip,id_ambiente) values ('Laptop B',9,6);
INSERT INTO Instancia (nome,id_equip,id_ambiente) values ('AP Interno',10,6);
UPDATE Instancia SET nome = 'Lâmpada Q1' where nome = 'Lâmpada C1';

SELECT * FROM Instancia;



SHOW TABLES;
DESC Valor;
INSERT INTO Valor (id_instancia,id_equip_param,valor) values (1,1,'0');
INSERT INTO Valor (id_instancia,id_equip_param,valor) values (2,1,'0');
INSERT INTO Valor (id_instancia,id_equip_param,valor) values (3,2,'0');
INSERT INTO Valor (id_instancia,id_equip_param,valor) values (3,3,'17');
INSERT INTO Valor (id_instancia,id_equip_param,valor) values (3,4,'Auto');
INSERT INTO Valor (id_instancia,id_equip_param,valor) values (3,5,'0');
INSERT INTO Valor (id_instancia,id_equip_param,valor) values (4,6,'0');
INSERT INTO Valor (id_instancia,id_equip_param,valor) values (4,7,'11');
INSERT INTO Valor (id_instancia,id_equip_param,valor) values (4,8,'30');
INSERT INTO Valor (id_instancia,id_equip_param,valor) values (4,9,'HDMI');
INSERT INTO Valor (id_instancia,id_equip_param,valor) values (5,1,'0');
INSERT INTO Valor (id_instancia,id_equip_param,valor) values (6,10,'0');
INSERT INTO Valor (id_instancia,id_equip_param,valor) values (6,11,'0');
INSERT INTO Valor (id_instancia,id_equip_param,valor) values (7,14,'0');
INSERT INTO Valor (id_instancia,id_equip_param,valor) values (7,15,'5');
INSERT INTO Valor (id_instancia,id_equip_param,valor) values (8,16,'0');
INSERT INTO Valor (id_instancia,id_equip_param,valor) values (9,1,'0');
INSERT INTO Valor (id_instancia,id_equip_param,valor) values (10,12,'0');
INSERT INTO Valor (id_instancia,id_equip_param,valor) values (10,13,'100');
INSERT INTO Valor (id_instancia,id_equip_param,valor) values (11,12,'0');
INSERT INTO Valor (id_instancia,id_equip_param,valor) values (11,13,'100');
INSERT INTO Valor (id_instancia,id_equip_param,valor) values (12,20,'0');
INSERT INTO Valor (id_instancia,id_equip_param,valor) values (13,1,'0');
INSERT INTO Valor (id_instancia,id_equip_param,valor) values (14,17,'0');
INSERT INTO Valor (id_instancia,id_equip_param,valor) values (14,18,'VERÃO');
INSERT INTO Valor (id_instancia,id_equip_param,valor) values (15,16,'0');

INSERT INTO Valor (id_instancia,id_equip_param,valor) values (16,1,'0');
INSERT INTO Valor (id_instancia,id_equip_param,valor) values (17,2,'0');
INSERT INTO Valor (id_instancia,id_equip_param,valor) values (17,3,'17');
INSERT INTO Valor (id_instancia,id_equip_param,valor) values (17,4,'AUTO');
INSERT INTO Valor (id_instancia,id_equip_param,valor) values (17,5,'0');
INSERT INTO Valor (id_instancia,id_equip_param,valor) values (18,6,'0');
INSERT INTO Valor (id_instancia,id_equip_param,valor) values (18,7,'11');
INSERT INTO Valor (id_instancia,id_equip_param,valor) values (18,8,'30');
INSERT INTO Valor (id_instancia,id_equip_param,valor) values (18,9,'HDMI');
INSERT INTO Valor (id_instancia,id_equip_param,valor) values (19,1,'0');
INSERT INTO Valor (id_instancia,id_equip_param,valor) values (20,2,'0');
INSERT INTO Valor (id_instancia,id_equip_param,valor) values (20,3,'17');
INSERT INTO Valor (id_instancia,id_equip_param,valor) values (20,4,'AUTO');
INSERT INTO Valor (id_instancia,id_equip_param,valor) values (20,5,'0');
INSERT INTO Valor (id_instancia,id_equip_param,valor) values (21,19,'0');
INSERT INTO Valor (id_instancia,id_equip_param,valor) values (22,19,'0');
INSERT INTO Valor (id_instancia,id_equip_param,valor) values (23,20,'0');
UPDATE Valor SET valor = 'AUTO' where id_instancia = 3 AND id_equip_param = 4;

SELECT * FROM Valor;






#CONSULTAS

#consulta1
SELECT COUNT(*)
FROM Instancia AS I INNER JOIN Equip AS E ON (E.id = I.id_equip)
WHERE E.nome = 'lampada';

#consulta2
SELECT I.nome, E.nome
FROM Instancia AS I INNER JOIN Ambiente as A INNER JOIN Equip AS E
ON (I.id_ambiente = A.id AND E.id = I.id_equip)
WHERE A.nome = 'Cozinha';

#consulta3
SELECT I.nome as objeto, E.nome as tipo, P.nome as parametro, V.valor as valor, A.nome as ambiente
FROM  Equip_Param as Z INNER JOIN Param as P ON (Z.id_param = P.id AND P.tipo = 'Boolean')
INNER JOIN Equip as E ON (E.id = Z.id_equip)
INNER JOIN Instancia as I ON (E.id = I.id_equip)
INNER JOIN Valor as V ON (I.id = V.id_instancia AND Z.id = V.id_equip_param)
INNER JOIN Ambiente as A ON (I.id_ambiente = A.id);


#consulta4
UPDATE Valor SET valor = 58 WHERE id=21;

SELECT I.nome, V.valor
FROM 
Param as P INNER JOIN Equip_Param as Z ON (P.nome = 'qtd_gasolina' AND Z.id_param = P.id) INNER JOIN
Equip AS E INNER JOIN Instancia AS I INNER JOIN Valor AS V ON (E.nome = 'carro' AND E.id = I.id_equip AND I.id = V.id_instancia AND V.id_equip_param = Z.id)
ORDER BY V.valor DESC;

SELECT I.nome, V.valor
FROM Param as P INNER JOIN Equip_Param as Z ON (P.nome = 'qtd_gasolina' AND Z.id_param = P.id)
INNER JOIN
(Equip AS E INNER JOIN Instancia AS I INNER JOIN Valor AS V ON (E.nome = 'carro' AND E.id = I.id_equip AND I.id = V.id_instancia))
ON (V.id_equip_param = Z.id)
ORDER BY V.Valor DESC;

UPDATE Valor SET valor = 100 WHERE id=21;

#consulta5
UPDATE Valor SET valor = 20 where id = 29;

SELECT MAX(valor) FROM
(SELECT DISTINCT valor FROM
(SELECT I.id, I.nome, I.id_ambiente, V.id as id_valor, V.valor
FROM 
Param as P INNER JOIN Equip_Param as Z ON (P.nome = 'temperatura' AND P.id =  Z.id_param)
INNER JOIN
(Equip AS E INNER JOIN Instancia AS I INNER JOIN Valor AS V ON (E.nome = 'ar_condicionado' AND E.id = I.id_equip AND I.id = V.id_instancia))
ON (V.id_equip_param = Z.id)) as Temp1)
as Temp2;

UPDATE Valor SET valor = 17 where id = 29;


############################################################
# CONSULTA EXTRA #

UPDATE Valor SET valor = 17 where id = 4;
UPDATE Valor SET valor = 20 where id = 29;
UPDATE Valor SET valor = 19 where id = 38;
UPDATE Valor SET valor = 0 where id = 3;
UPDATE Valor SET valor = 1 where id = 28;
UPDATE Valor SET valor = 1 where id = 37;

SELECT id1 as id, nome1 as nome, id_ambiente1 as id_ambiente, id_valor2 as id_valor, valor2 as valorTEMPERATURA FROM(

(SELECT I.id as id1, I.nome as nome1 , I.id_ambiente as id_ambiente1, V.id as id_valor1, V.valor as valor1
FROM 
(Equip AS E INNER JOIN Instancia AS I INNER JOIN Valor AS V ON (E.nome = 'ar_condicionado' AND E.id = I.id_equip AND I.id = V.id_instancia))
INNER JOIN
(Param as P INNER JOIN Equip_Param as Z ON (P.nome = 'status' AND P.id =  Z.id_param))
ON (V.id_equip_param = Z.id)
) as Resultado1

INNER JOIN

(SELECT I.id as id2, I.nome as nome2, I.id_ambiente id_ambiente2, V.id as id_valor2, V.valor as valor2
FROM 
(Equip AS E INNER JOIN Instancia AS I INNER JOIN Valor AS V ON (E.nome = 'ar_condicionado' AND E.id = I.id_equip AND I.id = V.id_instancia))
INNER JOIN
(Param as P INNER JOIN Equip_Param as Z ON (P.nome = 'temperatura' AND P.id =  Z.id_param))
ON (V.id_equip_param = Z.id)
) as Resultado2

ON (id1 = id2 AND valor1 = 1)

);

UPDATE Valor SET valor = 17 where id = 4;
UPDATE Valor SET valor = 17 where id = 29;
UPDATE Valor SET valor = 17 where id = 38;
UPDATE Valor SET valor = 0 where id = 3;
UPDATE Valor SET valor = 0 where id = 28;
UPDATE Valor SET valor = 0 where id = 37;

############################################################
CREATE TRIGGER TRIGGERHIST AFTER UPDATE ON Valor
FOR EACH ROW
	INSERT INTO Historico(id_inst_valor,valorAnterior,valorNovo,quandoMudanca)
	VALUES (NEW.id,OLD.valor,NEW.valor,NOW());

UPDATE Valor SET valor = 25 where id = 4;
UPDATE Valor SET valor = 17 where id = 4;

SELECT * FROM Historico;


#DROP TRIGGER TRIGGERHIST;