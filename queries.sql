-- ------------------------------------------------------------------
-- QUERIES
-- Criação, alteração e remoção de utilizadores e os seus privilégios
-- ------------------------------------------------------------------

USE temis_db;

-- Estimar quanto gasta em média um cliente
SELECT AVG(media_pagamento) AS avg_media_pagamento
FROM (
    SELECT c.Nome AS nome_cliente, AVG(p.valor) AS media_pagamento
    FROM Cliente c
    JOIN Caso ca ON c.Id = ca.Cliente
    JOIN Pagamento p ON ca.Pagamento = p.Id
    GROUP BY c.Nome
);

-- Calcular os casos mais recorrentes por ordem de especialização
SELECT e.Designação AS descricao_especializacao, COUNT(c.Id) AS total_casos
FROM Caso c
JOIN Especialização e ON c.Especialização = e.Id
GROUP BY c.Especialização, e.Designação
ORDER BY total_casos DESC;

-- Listar os casos de um detetive.
SELECT *
FROM Caso
INNER JOIN DetetiveCaso ON Caso.Id = DetetiveCaso.Caso
WHERE DetetiveCaso.Detetive = 1;

-- Mostrar os casos ainda em curso (ativos) e os detetives que os estão a investigar
SELECT Caso.DataInício, Caso.Estado, Caso.Especialização, Caso.Cliente, Caso.Pagamento, DetetiveCaso.Detetive, Detetive.Id, Detetive.Nome
FROM Caso
INNER JOIN DetetiveCaso ON Caso.Id = DetetiveCaso.Caso
INNER JOIN Detetive ON DetetiveCaso.Detetive = Detetive.Id
WHERE Caso.Estado = 1;

-- Listar os armazéns por localidade
SELECT a.Id, a.Descrição FROM Armazém a
	WHERE a.Localidade = 'CidadeC';

-- Listar os armazéns por maior número de objetos guardados
SELECT Objeto.Armazém, Armazém.Descrição, Armazém.Localidade, COUNT(*) AS Objetos 
FROM Objeto 
INNER JOIN Armazém ON Objeto.Armazém = Armazém.Id 
GROUP BY Armazém 
ORDER BY Objetos DESC 