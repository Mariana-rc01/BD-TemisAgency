-- ------------------------------------------------------------------
-- U T I L I Z A D O R E S
-- Criação, alteração e remoção de utilizadores e os seus privilégios.
-- ------------------------------------------------------------------
USE temis_db;

-- ------------------------------------------------
-- Criação de dois administradores da Agência Témis
-- ------------------------------------------------

-- Criação do administrador Elena Leite
CREATE USER 'elenaAdminTemis'@'localhost'
	IDENTIFIED BY 'AdminE2!';

-- Criação do administrador Alessandro Pinheiro
CREATE USER 'alessandroAdminTemis'@'localhost'
	IDENTIFIED BY 'AdminA3!';

-- -----------------------------------------
-- Criação de dois detetives da Agência Témis
-- -----------------------------------------

-- Criação da detetive Telma Salgado
CREATE USER 'telmaDetetiveTemis'@'localhost'
	IDENTIFIED BY 'DetetiveT1!';

-- Criação do detetive Fernando Faia
CREATE USER 'fernandoDetetiveTemis'@'localhost'
	IDENTIFIED BY 'DetetiveF1!';

-- ----------------------------------------
-- Criação de Astraea Eos da Agência Témis
-- ----------------------------------------

-- Criação do utilizador Astraea Eos
CREATE USER 'astraeaUtilizadorTemis'@'localhost'
	IDENTIFIED BY 'UtilizadorA6!';

-- -------------------------------------------
-- Criação de Hera Demetrius da Agência Témis
-- -------------------------------------------

-- Criação do utilizador Hera Demetrius
CREATE USER 'heraUtilizadorTemis'@'localhost'
	IDENTIFIED BY 'UtilizadorH7!';

-- ------------------------------------
-- Remoção dos utilizadores do sistema
-- ------------------------------------

DROP USER 'elenaAdminTemis'@'localhost';
DROP USER 'alessandroAdminTemis'@'localhost';

DROP USER 'telmaDetetiveTemis'@'localhost';
DROP USER 'fernandoDetetiveTemis'@'localhost';

DROP USER 'astraeaUtilizadorTemis'@'localhost';

DROP USER 'heraUtilizadorTemis'@'localhost';

-- --------------------------------------------
-- Consulta dos utilizador criados no sistema:
-- --------------------------------------------

-- Caracterização geral de todos os utilizadores
SELECT *
	FROM mysql.user;
    
-- Apenas os nomes dos utilizadores e dos sistemas em que estão definidos
SELECT User, Host
	FROM mysql.user
    ORDER BY User;

-- --------------------------------------------
-- Atribuição de privilégios aos utilizadores:
-- --------------------------------------------

-- Atribuição dos privilégios dos utilizadores administradores:

-- Definição de privilégios do utilizador 'elenaAdminTemis'
-- Permissão de acesso a todos os objetos da base de dados em 'localhost'
GRANT ALL PRIVILEGES ON temis_db.* TO 'elenaAdminTemis'@'localhost';

-- Definição de privilégios do utilizador 'alessandroAdminTemis'
-- Permissão de acesso a todos os objetos da base de dados em 'localhost'
GRANT ALL PRIVILEGES ON temis_db.* TO 'alessandroAdminTemis'@'localhost';

-- Atribuição dos privilégios dos utilizadores detetives:

-- Vistas auxiliares:

CREATE VIEW CasosDetetive1 AS SELECT * FROM Caso INNER JOIN DetetiveCaso ON Caso.Id = DetetiveCaso.Caso WHERE DetetiveCaso.Detetive = 1;

CREATE VIEW CasosDetetive3 AS SELECT * FROM Caso INNER JOIN DetetiveCaso ON Caso.Id = DetetiveCaso.Caso WHERE DetetiveCaso.Detetive = 3;

-- Definição de privilégios do utilizador 'telmaDetetiveTemis'
-- Permissão de visualização e atualização de registos na vista relativa aos seus casos.
GRANT SELECT, UPDATE ON temis_db.CasosDetetive1 TO 'telmaDetetiveTemis'@'localhost';

-- Definição de privilégios do utilizador 'fernandoDetetiveTemis'
-- Permissão de visualização e atualização de registos na vista relativa aos seus casos.
GRANT SELECT, UPDATE ON temis_db.CasosDetetive3 TO 'fernandoDetetiveTemis'@'localhost';

-- ------------------------------------------------------
-- Consulta dos privilégios atribuídos aos utilizadores:
-- ------------------------------------------------------

-- Consulta dos privilégios atribuídos ao utilizador 'elenaAdminTemis'
SHOW GRANTS FOR 'elenaAdminTemis'@'localhost';

-- Consulta dos privilégios atribuídos ao utilizador 'alessandroAdminTemis'
SHOW GRANTS FOR 'alessandroAdminTemis'@'localhost';

-- Consulta dos privilégios atribuídos ao utilizador 'telmaDetetiveTemis'
SHOW GRANTS FOR 'telmaDetetiveTemis'@'localhost';

-- Consulta dos privilégios atribuídos ao utilizador 'poirotDetetiveTemis'
SHOW GRANTS FOR 'fernandoDetetiveTemis'@'localhost';

-- Consulta dos privilégios atribuídos ao utilizador 'astraeaUtilizadorTemis'
SHOW GRANTS FOR 'astraeaUtilizadorTemis'@'localhost';

-- Consulta dos privilégios atribuídos ao utilizador 'heraUtilizadorTemis'
SHOW GRANTS FOR 'heraUtilizadorTemis'@'localhost';

-- ------------------------------------------------------
-- Refrescamento dos privilégios dos utilizadores:
-- ------------------------------------------------------
FLUSH PRIVILEGES;

-- -----------------------------------------
-- Remoção de privilégios aos utilizadores:
-- -----------------------------------------

-- Remoção de todos os tipos de privilégios do administrador 'elenaAdminTemis'
REVOKE ALL PRIVILEGES, GRANT OPTION FROM 'elenaAdminTemis'@'localhost';

-- Remoção de todos os tipos de privilégios do administrador 'alessandroAdminTemis'
REVOKE ALL PRIVILEGES, GRANT OPTION FROM 'alessandroAdminTemis'@'localhost';

-- Remoção de todos os tipos de privilégios do detetive 'telmaDetetiveTemis'
REVOKE ALL PRIVILEGES, GRANT OPTION FROM 'telmaDetetiveTemis'@'localhost';

-- Remoção de todos os tipos de privilégios do detetive 'poirotDetetiveTemis'
REVOKE ALL PRIVILEGES, GRANT OPTION FROM 'fernandoDetetiveTemis'@'localhost';

-- Remoção de todos os tipos de privilégios do utilizador 'astraeaUtilizadorTemis'
REVOKE ALL PRIVILEGES, GRANT OPTION FROM 'astraeaUtilizadorTemis'@'localhost';

-- Remoção de todos os tipos de privilégios do utilizador 'heraUtilizadorTemis'
REVOKE ALL PRIVILEGES, GRANT OPTION FROM 'heraUtilizadorTemis'@'localhost';
