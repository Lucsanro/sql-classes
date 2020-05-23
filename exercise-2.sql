CREATE DATABASE IF NOT EXISTS BANCO DEFAULT CHARACTER SET latin1;

USE banco ;

-- -----------------------------------------------------
-- TABLE banco
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS banco (
  codigo INT NOT NULL,
  nome VARCHAR(20) NOT NULL,
  PRIMARY KEY (codigo));

-- -----------------------------------------------------
-- TABLE agencia
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS agencia (
  numero_agencia INT NOT NULL,
  endereco VARCHAR(40) NOT NULL,
  banco_codigo INT NOT NULL,
  PRIMARY KEY (numero_agencia),
  FOREIGN KEY (banco_codigo) REFERENCES banco (codigo)
);

-- -----------------------------------------------------
-- TABLE conta
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS conta (
  numero_conta CHAR(7) NOT NULL,
  saldo DECIMAL(10,2) NOT NULL,
  tipo_conta SMALLINT(6) NOT NULL,
  num_agencia INT(11) NULL,
  PRIMARY KEY (numero_conta),
  FOREIGN KEY (num_agencia) REFERENCES agencia (numero_agencia)
);

-- -----------------------------------------------------
-- TABLE cliente
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS cliente (
  cpf CHAR(14) NOT NULL,
  nome VARCHAR(20) NOT NULL,
  sexo CHAR(1) NOT NULL,
  endereco VARCHAR(40) NULL,
  PRIMARY KEY (cpf)
);

-- -----------------------------------------------------
-- TABLE historico
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS historico (
  data_inicio DATE NOT NULL,
  cpf_cliente CHAR(14) NOT NULL,
  num_conta CHAR(7) NOT NULL,
  FOREIGN KEY (cpf_cliente) REFERENCES cliente (cpf),
  FOREIGN KEY (num_conta) REFERENCES conta (numero_conta)
);

-- -----------------------------------------------------
-- TABLE telefone_cliente
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS telefone_cliente (
  telefone_cliente CHAR(13) NOT NULL,
  cpf_cli CHAR(14) NOT NULL,
  PRIMARY KEY (telefone_cliente),
  FOREIGN KEY (cpf_cli) REFERENCES cliente (cpf)
);

-- INSERT

INSERT INTO banco (codigo, nome) VALUES 
	 (1, "Banco do Brasil"),
     (4, "CEF");
     
INSERT INTO agencia (numero_agencia, endereco, banco_codigo) VALUES 
	 (0562, "Rua Joaquim Teixeira Alves, 1555", 4),
     (3153, "Av. Marcelino Pires, 1960", 1);

INSERT INTO cliente (cpf, nome, sexo, endereco) VALUES 
	 ("111.222.333-44", "Jennifer B Souza", "F", "Rua Cuiabá, 1050"),
     ("666.777.888-99", "Caetano K Lima", "M", "Rua Ivinhema, 879"),
     ("555.444.777-33", "Silvia Macedo", "F", "Rua Estados Unidos, 735");

INSERT INTO conta (numero_conta, saldo, tipo_conta, num_agencia) VALUES
	 ("86340-2", "763.05", 2, 3153),
     ("23584-7", "3879.12", 1, 0562);
     
INSERT INTO historico (data_inicio, num_conta, cpf_cliente) VALUES
	 ("1997-12-17", "23584-7", "111.222.333-44"),
     ("1997-12-17", "23584-7", "666.777.888-99"),
     ("2010-11-29", "86340-2", "555.444.777-33");
     
INSERT INTO telefone_cliente (cpf_cli, telefone_cliente) VALUES
	 ("111.222.333-44", "(67)3422-7788"),
     ("666.777.888-99", "(67)3423-9900"),
     ("666.777.888-99", "(67)8121-8833");
	
SELECT * FROM banco;
SELECT * FROM agencia;
SELECT * FROM cliente;
SELECT * FROM conta;
SELECT * FROM historico;
SELECT * FROM telefone_cliente;


