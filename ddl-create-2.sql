-- DDL (ALTER)

-- (ALTER - ADD / MODIFY)

-- ALTER ADD
ALTER TABLE tbalunos
ADD sexo CHAR(1)
AFTER nome;

USE faculdade;

SHOW TABLES;

SELECT * FROM tbalunos;

-- ALTER MODIFY
ALTER TABLE tbalunos
MODIFY sexo CHAR(1) NOT NULL
AFTER nome;

-- INSERT IN tbalunos
INSERT INTO tbalunos 
(rgm, nome, sexo, email, dtnascto)
VALUES

(202, "Pedro Souza", "M", "pedro@uol.com.br","1999-09-14");

SELECT * FROM faculdade.tbalunos;

-- CREATE table cursos
CREATE TABLE cursos (
	idCurso int auto_increment primary key,
    nome varchar(50) not null,
    duracao int not null,
    periodo varchar(30) not null
);