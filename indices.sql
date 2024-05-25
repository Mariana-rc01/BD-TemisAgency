-- ------------------------------------------------------------------
-- ÍNDICES
-- Criação, alteração e remoção de índices.
-- ------------------------------------------------------------------

-- Indicação da Base de Dados de Trabalho.
use temis_db;

--
-- Criação de índice (INDEX) sobre o atributo 'nome' da tabela 'Cliente'.
CREATE INDEX idx_cliente_nome ON Cliente (Nome);

--
-- Criação de índice (INDEX) sobre o atributo 'Cliente' da tabela 'ClienteTelefones'.
CREATE INDEX idx_cliente_telefones_cliente ON ClienteTelefones (Cliente);

--
-- Criação de índice (INDEX) sobre o atributo 'Cliente' da tabela 'ClienteEmails'.
CREATE INDEX idx_cliente_emails_cliente ON ClienteEmails (Cliente);


-- Criação de índice (INDEX) sobre o atributo 'valor' da tabela 'Pagamento'.
CREATE INDEX idx_pagamento_valor ON Pagamento (Valor);

--
-- Visualização dos índices definidos.
SHOW INDEX FROM Cliente;
SHOW INDEX FROM ClienteTelefones;
SHOW INDEX FROM ClienteEmails;

SHOW INDEX FROM Pagamento;

--
-- Remoção de todos os índices criados anteriormente.
DROP INDEX idx_cliente_nome ON Cliente;
DROP INDEX idx_cliente_telefones_cliente ON ClienteTelefones;
DROP INDEX idx_cliente_emails_cliente ON ClienteEmails;
DROP INDEX idx_pagamento_valor ON Pagamento;

--
-- Visualização de todos os índices criados sobre as tabelas da base de dados 'temis_db'.
-- Utilização de uma vista do sistema - INFORMATION_SCHEMA.STATISTICS
SELECT *
    FROM INFORMATION_SCHEMA.STATISTICS
    WHERE TABLE_SCHEMA = 'temis_db';