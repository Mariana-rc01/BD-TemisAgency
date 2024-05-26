-- ------------------------------------------------------------------
-- ÍNDICES
-- Criação, alteração e remoção de índices.
-- ------------------------------------------------------------------

-- Indicação da Base de Dados de Trabalho.
use temis_db;

--
-- Criação de índice (INDEX) sobre o atributo 'DataInício' da tabela 'Caso'.
CREATE INDEX idxCasoDataInício ON Caso (DataInício);

--
-- Criação de índice (INDEX) sobre o atributo 'Estado' da tabela 'Caso'.
CREATE INDEX idxCasoEstado ON Caso (Estado);

--
-- Criação de índice (INDEX) sobre o atributo 'nome' da tabela 'Cliente'.
CREATE INDEX idxClienteNome ON Cliente (Nome);

--
-- Criação de índice (INDEX) sobre o atributo 'Cliente' da tabela 'ClienteTelefones'.
CREATE INDEX idxClienteTelefonesCliente ON ClienteTelefones (Cliente);

--
-- Criação de índice (INDEX) sobre o atributo 'Cliente' da tabela 'ClienteEmails'.
CREATE INDEX idxClienteEmailsCliente ON ClienteEmails (Cliente);

--
-- Criação de índice (INDEX) sobre o atributo 'nome' da tabela 'Detetive'.
CREATE INDEX idxDetetiveNome ON Detetive (Nome);

--
-- Criação de índice (INDEX) sobre o atributo 'Detetive' da tabela 'DetetiveTelefones'.
CREATE INDEX idxDetetiveTelefonesDetetive ON DetetiveTelefones (Detetive);

--
-- Criação de índice (INDEX) sobre o atributo 'Detetive' da tabela 'DetetiveEmails'.
CREATE INDEX idxDetetiveEmailsDetetive ON DetetiveEmails (Detetive);


-- Criação de índice (INDEX) sobre o atributo 'valor' da tabela 'Pagamento'.
CREATE INDEX idxPagamentoValor ON Pagamento (Valor);

--
-- Visualização dos índices definidos.
SHOW INDEX FROM Caso;

SHOW INDEX FROM Cliente;
SHOW INDEX FROM ClienteTelefones;
SHOW INDEX FROM ClienteEmails;

SHOW INDEX FROM Detetive;
SHOW INDEX FROM DetetiveTelefones;
SHOW INDEX FROM DetetiveEmails;

SHOW INDEX FROM Pagamento;

--
-- Remoção de todos os índices criados anteriormente.
DROP INDEX idxCasoDataInício ON Caso;
DROP INDEX idxCasoEstado ON Caso;
DROP INDEX idxClienteNome ON Cliente;
DROP INDEX idxClienteTelefonesCliente ON ClienteTelefones;
DROP INDEX idxClienteEmailsCliente ON ClienteEmails;
DROP INDEX idxDetetiveNome ON Detetive;
DROP INDEX idxDetetiveTelefonesDetetive ON DetetiveTelefones;
DROP INDEX idxDetetiveEmailsDetetive ON DetetiveEmails;
DROP INDEX idxPagamentoValor ON Pagamento;

--
-- Visualização de todos os índices criados sobre as tabelas da base de dados 'temis_db'.
-- Utilização de uma vista do sistema - INFORMATION_SCHEMA.STATISTICS
SELECT *
    FROM INFORMATION_SCHEMA.STATISTICS
    WHERE TABLE_SCHEMA = 'temis_db';