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