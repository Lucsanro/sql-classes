USE faculdade;

INSERT INTO tbalunos 
(rgm, nome, sexo, email, dtnascto)
VALUES
(505, "Antonio Abravante", "M", "toni17@gmail.com","1987-02-15");

SELECT * FROM tbalunos;

Alter table tbalunos
	ADD idCurso INT;
    
ALTER TABLE tbalunos
	MODIFY idCurso INT NOT NULL;  -- Por ser constraint, não pode modificar a fk

-- Error Code: 1832. Cannot change column 'idCurso': 
-- used in a foreign key constraint 'fk_idCurso'	0,047 sec

    
DELETE FROM tbalunos
WHERE rgm > 0;

ALTER TABLE tbalunos
	ADD CONSTRAINT fk_idCurso
		FOREIGN KEY (idCurso) REFERENCES tbcursos(idCurso);	

ALTER TABLE tbalunos DROP COLUMN NOM_DA_MAE;

INSERT INTO tbalunos 
(rgm, nome, sexo, email, dtnascto, idCurso)
VALUES
(709, "Rafael Barante", "M", "barante@gmail.com","1978-04-15","1");

SELECT * FROM tbalunos;

 -- Error Code: 1452. Cannot add or update a child row: a foreign key constraint fails 
 -- (`faculdade`.`tbalunos`, CONSTRAINT `fk_idCurso` FOREIGN KEY (`idCurso`) 
 -- REFERENCES `tbcursos` (`idCurso`))	0,031 sec
 
INSERT INTO tbcursos
(idCurso, nome, duracao, periodo)
VALUES
("001", "Pedagogia", "8", "Noite");

INSERT INTO tbcursos
(nome, duracao, periodo)
VALUES
("ADS", "4", "Manhã");

INSERT INTO tbcursos
(nome, duracao, periodo)
VALUES
("Biologia", "8", "Tarde");

SELECT * FROM tbcursos;

INSERT INTO tbalunos 
(rgm, nome, sexo, email, dtnascto, idCurso)
VALUES
(709, "Hugo Nunes", "M", "hununes@gmail.com","1978-04-15","1"),
(256, "Cassia Ramos", "F", "cassia@gmail.com","1978-04-15","1");

SELECT * FROM tbalunos;

-- Exerício Customers e Orders

CREATE TABLE customers (
	customerNumber INT PRIMARY KEY AUTO_INCREMENT,
    customerName VARCHAR(30),
    contactLastName VARCHAR(30),
    contactFirstName VARCHAR(30),
    phone VARCHAR(10),
    adressLine1 VARCHAR(30),
    adressLine2 VARCHAR(30),
    city VARCHAR(20),
    state VARCHAR(20),
    postalCode VARCHAR(12),
    country VARCHAR(20),
    salesRepEmployeeNumber INT,
    creditLimit FLOAT
);

ALTER TABLE customers
	MODIFY creditLimit FLOAT(10,2);

SELECT * FROM customers;

CREATE TABLE orders (
	orderNumber INT PRIMARY KEY AUTO_INCREMENT,
    orderDate DATE,
    requiredDate DATE,
    shippedDate DATE,
    status CHAR(1),
    comments VARCHAR(20),
    customerNumber INT
    -- FOREIGN KEY orders(customerNumber) REFERENCES customers(customerNumber)
);

SELECT * FROM orders;

ALTER TABLE orders
	ADD CONSTRAINT fk_customerNumber
		FOREIGN KEY (customerNumber) REFERENCES customers(customerNumber);
        


    
    