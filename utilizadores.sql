-- ------------------------------------------------------------------
-- UTILIZADORES
-- Criação, alteração e remoção de utilizadores e os seus privilégios
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
-- Criação de dois clientes da Agência Témis
-- -----------------------------------------

-- Criação do cliente João Silva
CREATE USER 'joaoClienteTemis'@'localhost'
	IDENTIFIED BY 'ClienteJ4!';

-- Criação do cliente Maria Santos
CREATE USER 'mariaClienteTemis'@'localhost'
	IDENTIFIED BY 'ClienteM5!';

-- -----------------------------------------
-- Criação de dois detetives da Agência Témis
-- -----------------------------------------

-- Criação do detetive Armando Torres
CREATE USER 'armandoDetetiveTemis'@'localhost'
	IDENTIFIED BY 'DetetiveA1!';

-- Criação do detetive Marco Poirot
CREATE USER 'poirotDetetiveTemis'@'localhost'
	IDENTIFIED BY 'DetetiveM1!';

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

DROP USER 'joaoClienteTemis'@'localhost';
DROP USER 'mariaClienteTemis'@'localhost';

DROP USER 'armandoDetetiveTemis'@'localhost';
DROP USER 'poirotDetetiveTemis'@'localhost';

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

-- Definição de privilégios do utilizador 'elenaAdminTemis'
-- Permissão de acesso a todos os objetos da base de dados em 'localhost'
GRANT ALL PRIVILEGES ON temis_db.* TO 'elenaAdminTemis'@'localhost';

-- Definição de privilégios do utilizador 'alessandroAdminTemis'
-- Permissão de acesso a todos os objetos da base de dados em 'localhost'
GRANT ALL PRIVILEGES ON temis_db.* TO 'alessandroAdminTemis'@'localhost';

-- Falta atribuir os privilégios aos clientes, são necessários os procedimentos para isto

-- ------------------------------------------------------
-- Consulta dos privilégios atribuídos aos utilizadores:
-- ------------------------------------------------------

-- Consulta dos privilégios atribuídos ao utilizador 'elenaAdminTemis'
SHOW GRANTS FOR 'elenaAdminTemis'@'localhost';

-- Consulta dos privilégios atribuídos ao utilizador 'alessandroAdminTemis'
SHOW GRANTS FOR 'alessandroAdminTemis'@'localhost';

-- Consulta dos privilégios atribuídos ao utilizador 'joaoClienteTemis'
SHOW GRANTS FOR 'joaoClienteTemis'@'localhost';

-- Consulta dos privilégios atribuídos ao utilizador 'mariaClienteTemis'
SHOW GRANTS FOR 'mariaClienteTemis'@'localhost';

-- Consulta dos privilégios atribuídos ao utilizador 'armandoDetetiveTemis'
SHOW GRANTS FOR 'armandoDetetiveTemis'@'localhost';

-- Consulta dos privilégios atribuídos ao utilizador 'poirotDetetiveTemis'
SHOW GRANTS FOR 'poirotDetetiveTemis'@'localhost';

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

-- Remoção de todos os tipos de privilégios do cliente 'joaoClienteTemis'
REVOKE ALL PRIVILEGES, GRANT OPTION FROM 'joaoClienteTemis'@'localhost';

-- Remoção de todos os tipos de privilégios do cliente 'mariaClienteTemis'
REVOKE ALL PRIVILEGES, GRANT OPTION FROM 'mariaClienteTemis'@'localhost';

-- Remoção de todos os tipos de privilégios do detetive 'armandoDetetiveTemis'
REVOKE ALL PRIVILEGES, GRANT OPTION FROM 'armandoDetetiveTemis'@'localhost';

-- Remoção de todos os tipos de privilégios do detetive 'poirotDetetiveTemis'
REVOKE ALL PRIVILEGES, GRANT OPTION FROM 'poirotDetetiveTemis'@'localhost';

-- Remoção de todos os tipos de privilégios do utilizador 'astraeaUtilizadorTemis'
REVOKE ALL PRIVILEGES, GRANT OPTION FROM 'astraeaUtilizadorTemis'@'localhost';

-- Remoção de todos os tipos de privilégios do utilizador 'heraUtilizadorTemis'
REVOKE ALL PRIVILEGES, GRANT OPTION FROM 'heraUtilizadorTemis'@'localhost';
