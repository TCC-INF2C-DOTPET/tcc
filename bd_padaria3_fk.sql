USE MASTER 
IF EXISTS(SELECT * FROM SYS.databases WHERE NAME = 'bd_padaria3_fk')
DROP DATABASE bd_padaria3_fk
GO

CREATE DATABASE bd_padaria3_fk
GO

USE bd_padaria3_fk
GO

CREATE TABLE Usuario
( 
   id            INT IDENTITY,
   nome          VARCHAR(100)	NOT NULL,
   email         VARCHAR(100) UNIQUE 	NOT NULL,
   senha         VARCHAR(100)	NOT NULL,
   nivelAcesso   VARCHAR(10)    NULL, -- ADMIN, TECNICO ou USER
   foto			 VARBINARY(MAX) NULL,
   statusUsuario VARCHAR(20)    NOT NULL, -- ATIVO ou INATIVO ou TROCAR_SENHA

   PRIMARY KEY (id)
)
GO
INSERT Usuario (nome, email, senha, nivelAcesso, foto, statusUsuario)
VALUES ('Ana Sá', 'ana@email.com', 'MTIzNDU2Nzg=', 'ADMIN', null, 'ATIVO')

INSERT Usuario (nome, email, senha, nivelAcesso, foto, statusUsuario)
VALUES ('Ordnael Zurc', 'ordnael@email.com', 'MTIzNDU2Nzg=', 'USER', null, 'ATIVO')

CREATE TABLE Categoria
( 
   id      INT			IDENTITY,
   nomeCat VARCHAR(100) NOT NULL,

   PRIMARY KEY (id)
)
INSERT Categoria (nomeCat) values ('Algo')
INSERT Categoria (nomeCat) values ('Bagulho')
INSERT Categoria (nomeCat) values ('Coisa')
INSERT Categoria (nomeCat) values ('Treco')

CREATE TABLE Produto
( 
   id            INT IDENTITY,
   nome          VARCHAR(100)	NOT NULL,
   descricao     VARCHAR(400)	NOT NULL,
   preco         DECIMAL(10,2)	NOT NULL,
   categoria_id	 INT	NOT NULL, 
   foto			 VARBINARY(MAX) NULL,
   statusProduto VARCHAR(20)    NOT NULL, -- ATIVO ou INATIVO

   PRIMARY KEY (id),
   FOREIGN KEY (categoria_id) REFERENCES Categoria(id)
)
INSERT Produto (nome, descricao, preco, categoria_id, foto, statusProduto)
VALUES ('FooBar', 'O produto é muito bom', 2.99, 1, null, 'ATIVO')

select * from Usuario
select * from Categoria
select * from Produto
