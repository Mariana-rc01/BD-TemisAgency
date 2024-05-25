-- ------------------------------------------------------------------
-- VISTAS
-- Criação, alteração e remoção de vistas.
-- ------------------------------------------------------------------
-- Base de Dados de Trabalho.
USE temis_db;

--
-- VISTAS
CREATE VIEW DetetiveEmail AS
SELECT
    d.Id,
    d.Nome,
    d.DataNascimento,
    de.Email AS Email
FROM
    Detetive d
    JOIN DetetiveEmails de ON d.Id = de.Detetive;

--
DROP VIEW DetetiveEmail;
--

CREATE VIEW DetetiveTelefone AS
SELECT
    d.Id,
    d.Nome,
    d.DataNascimento,
    dt.Telefone AS Telefone
FROM
    Detetive d
    JOIN DetetiveTelefones dt ON d.Id = dt.Detetive;

--
DROP VIEW DetetiveTelefone;
--

CREATE VIEW DetetiveTelefoneEmail AS
SELECT
    d.Id,
    d.Nome,
    d.DataNascimento,
    de.Email AS Email,
    dt.Telefone AS Telefone
FROM
    Detetive d
    LEFT JOIN DetetiveEmails de ON d.Id = de.Detetive
    LEFT JOIN DetetiveTelefones dt ON d.Id = dt.Detetive;

--
DROP VIEW DetetiveTelefoneEmail;
--


CREATE VIEW AdministradorEmail AS
SELECT 
    a.Id,
    a.Nome,
    a.DataNascimento,
    ae.Email AS Email
FROM 
    Administrador a
JOIN 
    AdministradorEmails ae ON a.Id = ae.Administrador;

--
DROP VIEW AdministradorEmail;
--

CREATE VIEW AdministradorTelefone AS
SELECT 
    a.Id,
    a.Nome,
    a.DataNascimento,
    at.Telefone AS Telefone
FROM 
    Administrador a
JOIN 
    AdministradorTelefones at ON a.Id = at.Administrador;

--
DROP VIEW AdministradorTelefone;
--

CREATE VIEW AdministradorEmailTelefone AS
SELECT 
    a.Id,
    a.Nome,
    a.DataNascimento,
    ae.Email AS Email,
    at.Telefone AS Telefone
FROM 
    Administrador a
LEFT JOIN 
    AdministradorEmails ae ON a.Id = ae.Administrador
LEFT JOIN 
    AdministradorTelefones at ON a.Id = at.Administrador;

--
DROP VIEW AdministradorEmailTelefone;
--

-- Armazém

CREATE VIEW ArmazemInformação AS
SELECT 
    a.Id,
    a.Rua,
    a.Localidade,
    a.Lotação
FROM 
    Armazém AS a;

--
DROP VIEW ArmazemInformação;
--

-- Pagamento

CREATE VIEW PagamentoInfo AS
SELECT
    P.Id AS Pagamento,
    P.Valor AS Valor,
    C.Id AS Caso,
    CL.Nome AS Cliente
FROM
    Pagamento AS P
    LEFT JOIN Caso AS C ON C.Pagamento = P.Id
    LEFT JOIN Cliente AS CL ON CL.Id = C.Cliente;

--
DROP VIEW PagamentoInfo;
--

-- Utilização das vistas criadas anteriormente.
SELECT * FROM DetetiveEmail;

SELECT * FROM DetetiveTelefone;

SELECT * FROM DetetiveTelefoneEmail;

SELECT * FROM AdministradorEmail;

SELECT * FROM AdministradorTelefone;

SELECT * FROM AdministradorEmailTelefone;

SELECT * FROM ArmazemInformação;

SELECT * FROM PagamentoInfo;