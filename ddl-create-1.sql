-- comando para exibir os bancos de dados;
SHOW DATABASES;
-- seleciona o banco
USE Information_schema;
-- mostra as tabelas daquele banco
SHOW TABLES;
-- retorna os registros
SELECT * FROM character_sets;
SELECT * FROM collations;

CREATE DATABASE IF NOT EXISTS faculdade
CHARACTER SET latin1
COLLATE latin1_swedish_ci;

-- apaga objeto faculdade
DROP DATABASE faculdade;

USE faculdade;

CREATE TABLE tbAlunos (
	rgm INT,
    nome VARCHAR(50),
    email VARCHAR(50),
    dtnascto DATE
);

DROP TABLE tbAlunos;

CREATE TABLE tbAlunos (
	rgm INT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL,
    dtnascto DATE NOT NULL
);

