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

--
-- Visualização dos índices definidos.
SHOW INDEX FROM Cliente;
SHOW INDEX FROM ClienteTelefones;
SHOW INDEX FROM ClienteEmails;

--
-- Remoção de todos os índices criados anteriormente.
DROP INDEX idx_cliente_nome ON Cliente;
DROP INDEX idx_cliente_telefones_cliente ON ClienteTelefones;
DROP INDEX idx_cliente_emails_cliente ON ClienteEmails;

--
-- Visualização de todos os índices criados sobre as tabelas da base de dados 'temis_db'.
-- Utilização de uma vista do sistema - INFORMATION_SCHEMA.STATISTICS
SELECT *
    FROM INFORMATION_SCHEMA.STATISTICS
    WHERE TABLE_SCHEMA = 'temis_db';