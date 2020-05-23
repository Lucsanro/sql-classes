-- QUESTION 1
ALTER TABLE cliente 
ADD COLUMN email VARCHAR(30) NOT NULL;

-- QUESTION 2
SELECT cpf, endereco FROM cliente WHERE nome = "Paulo A Lima";

-- QUESTION 3
SELECT numero_agencia, endereco FROM agencia WHERE banco_codigo = "1";

-- QUESTION 4
SELECT numero_conta, num_agencia, nome FROM cliente, historico, conta WHERE cpf=cpf_cliente AND num_conta = numero_conta;

-- QUESTION 5
SELECT * FROM cliente WHERE sexo = "M";

-- QUESTION 6
SELECT * FROM agencia, banco WHERE codigo = banco_codigo AND numero_agencia = 0562;

-- QUESTION 7
DELETE FROM conta WHERE numero_conta = "86340-2";

-- QUESTION 8
UPDATE agencia SET numero_agencia = 6342 WHERE numero_agencia = 0562;

-- QUESTION 9
UPDATE cliente SET email = "caetanolima@gmail.com" WHERE nome = "Caetano K Lima";

-- QUESTION 10
UPDATE conta SET saldo = saldo * 1.1 WHERE numero_conta = "23584-7";