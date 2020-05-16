-- 1. Criar o banco de dados chamado Discoteca.
CREATE DATABASE discoteca;

-- 2. Criar as tabelas CDs e Musicas.
-- 3. Criar os relacionamentos (chaves estrangeiras / foreign keys) entre as tabelas CDs e Musicas.
USE discoteca;

CREATE TABLE CDs (
Codigo INT auto_increment PRIMARY KEY,
Nome VARCHAR(50) NOT NULL,
DataCompra DATE,
ValorPago DECIMAL (10,2),
LocalCompra VARCHAR(50)
);

CREATE TABLE Musicas (
CDs_Codigo INT,
Numero INT PRIMARY KEY,
Nome VARCHAR(50) NOT NULL,
Artista VARCHAR(50),
Tempo TIME,
FOREIGN KEY Musicas(CDs_Codigo) REFERENCES CDs(Codigo)
);

-- 4. Mostrar todos os CDs.
SELECT * FROM CDs;

-- 5. Mostrar os campos nome e data da compra dos CDs ordenados por nome.
SELECT Nome, DataCompra from CDs Order by Nome;

-- 6. Mostrar os campos nome e data da compra dos CDs classificados por data de compra em ordem decrescente.
SELECT Nome, DataCompra from CDs Order by DataCompra desc;

-- 7. Mostrar o total gasto com a compra dos CDs.
SELECT SUM(ValorPago) as Total from CDs;

-- 8. Mostrar todas as músicas (todos os campos) do CD de código igual a 1.
SELECT *FROM Musicas Where CDs_Codigo=1;

-- 9. Mostrar o nome dos CDs presentes na tabela e o nome de todas as músicas de cada CD ordenados por nome do CD.
SELECT CDs.Nome, Musicas.Nome
FROM CDs INNER JOIN Musicas ON CDs.Codigo = 	Musicas.CDs_Codigo ORDER BY 	CDs.Nome;

-- 10. Mostre o nome e o artista de todas músicas cadastradas.
SELECT Nome, Artista FROM Musicas;

-- 11. Mostre o tempo total de músicas cadastradas.
SELECT SUM(Tempo) as Total from Musicas;

-- 12. Mostre o número, nome e tempo das músicas do CD de código igual a 5 em ordem de número da música.
SELECT Numero, Nome, Tempo from Musicas Where CDs_Codigo=5 	Order by Numero;

-- 13. Mostre o tempo total de músicas por CD.
SELECT Numero, Tempo from Musicas Where CDs_Codigo Order 	by Numero;

-- 14. Mostre a quantidade de músicas cadastradas.
SELECT COUNT(*) AS QTD FROM Musicas;

-- 15. Mostre a média de duração das músicas cadastradas.
SELECT AVG(Tempo) AS MEDIA FROM Musicas;

-- 16. Mostre a quantidade de CDs.
SELECT COUNT(*) AS QTD FROM CDs;

-- 17. Mostre o nome das músicas dos artistas que terminados com “Jr.”.
SELECT Artista, CDs_Codigo FROM Musicas WHERE Artista LIKE 	'%Jr.' ORDER BY CDs_Codigo;

-- 18. Mostre a quantidade de músicas do CD com o nome iniciado com “Max”.
SELECT Nome, Artista, CDs_Codigo FROM Musicas WHERE Nome 	LIKE 	'MAX%' ORDER BY CDs_Codigo;

-- 19. Mostre o nome de todos CDs comprados em qualquer loja da “Ratke” e com valor de compra maior ou igual a 400.
SELECT Nome, ValorPago, LocalCompra FROM CDs 
WHERE ValorPago >= 400 AND
	LocalCompra LIKE '%Ratke%'
    ORDER BY ValorPago;

-- 20. Mostre uma listagem com as informações das músicas do CD mais recentemente comprado.
-- Para descobrir a compra mais recente
SELECT Codigo As CD_Codigo, MAX(DataCompra) As Comprado_Em
FROM CDs
GROUP BY Codigo
ORDER BY Comprado_Em DESC
LIMIT 1;
-- Para mostrar as informações do CD comprado
SELECT * FROM Musicas WHERE CDs_Codigo=112;
