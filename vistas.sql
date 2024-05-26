-- ------------------------------------------------------------------
-- VISTAS
-- Criação, alteração e remoção de vistas.
-- ------------------------------------------------------------------
USE temis_db;

-- VISTAS

-- Detetive

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

-- Administrador

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

-- Caso

CREATE VIEW CasosInformação AS
SELECT e.Designação as Especialização, cl.Nome as Cliente, p.Valor as Pagamento, c.DataInício, c.DataFim FROM Caso c
    INNER JOIN Especialização e ON c.Especialização = e.Id
    INNER JOIN Cliente cl ON c.Cliente = cl.Id
    INNER JOIN Pagamento p ON c.Pagamento = p.Id
    ORDER BY c.DataInício DESC;

--
DROP VIEW CasosInformação;
--

-- Objeto

CREATE VIEW ObjetosInformação AS
SELECT o.Id, o.DataDeRecolha, o.Descrição, f.Fotos as Fotos, a.Id as Armazém, c.Id as Caso FROM Objeto o
		LEFT JOIN Fotos f ON o.Id = f.Objeto
		INNER JOIN Armazém a ON o.Armazém = a.Id
		INNER JOIN Caso c ON o.Caso = c.Id
		ORDER BY o.DataDeRecolha DESC;

--
DROP VIEW ObjetosInformação;
--

-- Cliente

CREATE VIEW ClientesInformação AS
SELECT c.Id, c.Nome, e.Emails as Emails, t.Telefones as Telefones FROM Cliente c
		LEFT JOIN Emails e ON e.Cliente = c.Id
		LEFT JOIN Telefones t ON t.Cliente = c.Id
		ORDER BY c.Id DESC;

--
DROP VIEW ClientesInformação;
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

SELECT * FROM CasosInformação;

SELECT * FROM ObjetosInformação;

SELECT * FROM ClientesInformação;