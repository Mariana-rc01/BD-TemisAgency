-- ------------------------------------------------------------------
-- USERS
-- Criação, alteração e remoção de utilizadores e os seus privilégios
-- ------------------------------------------------------------------

USE temis_db;

-- ----------------------------------------------
-- Criação dos administradores da Base de Dados
-- ----------------------------------------------

-- Criação do utilizador 'marianaAdmin'
CREATE USER 'marianaAdmin'@'localhost'
	IDENTIFIED BY 'Marian0!';

-- Ficam aqui os vossos !

-- ------------------------------------------------
-- Criação de dois administradores da Agência Témis
-- ------------------------------------------------

-- Criação do administrador Elena Leite
CREATE USER 'elenaAdminTemis'@'localhost'
	IDENTIFIED BY 'AdminE2!';

-- Criação do administrador Alessandro Pinheiro
CREATE USER 'alessandroAdminTemis'@'localhost'
	IDENTIFIED BY 'AdminA3!';
    
-- ------------------------------------
-- Remoção dos utilizadores do sistema
-- ------------------------------------

DROP USER 'marianaAdmin'@'localhost';

DROP USER 'elenaAdminTemis'@'localhost';
DROP USER 'alessandroAdminTemis'@'localhost';

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

-- Definição de privilégios do utilizador 'marianaAdmin'
-- Permissão de acesso a todos os objetos da bases de dados em 'localhost'
GRANT ALL PRIVILEGES ON temis_db.* TO 'marianaAdmin'@'localhost';

-- Definição de privilégios do utilizador 'elenaAdminTemis'
-- Permissão de acesso a todos os objetos da base de dados em 'localhost'
GRANT ALL PRIVILEGES ON temis_db.* TO 'elenaAdminTemis'@'localhost';

-- Definição de privilégios do utilizador 'alessandroAdminTemis'
-- Permissão de acesso a todos os objetos da base de dados em 'localhost'
GRANT ALL PRIVILEGES ON temis_db.* TO 'alessandroAdminTemis'@'localhost';

-- ------------------------------------------------------
-- Consulta dos privilégios atribuídos aos utilizadores:
-- ------------------------------------------------------

-- Consulta dos privilégios atribuídos ao utilizador 'marianaAdmin'
SHOW GRANTS FOR 'marianaAdmin'@'localhost';

-- Consulta dos privilégios atribuídos ao utilizador 'elenaAdminTemis'
SHOW GRANTS FOR 'elenaAdminTemis'@'localhost';

-- Consulta dos privilégios atribuídos ao utilizador 'alessandroAdminTemis'
SHOW GRANTS FOR 'alessandroAdminTemis'@'localhost';

-- ------------------------------------------------------
-- Refrescamento dos privilégios dos utilizadores:
-- ------------------------------------------------------
FLUSH PRIVILEGES;

-- -----------------------------------------
-- Remoção de privilégios aos utilizadores:
-- -----------------------------------------

-- Remoção de privilégios para o utilizador 'marianaAdmin' sobre a base de dados em 'localhost'
REVOKE ALL PRIVILEGES, GRANT OPTION FROM 'marianaAdmin'@'localhost';

-- Remoção de todos os tipos de privilégios do administrador 'elenaAdminTemis'
REVOKE ALL PRIVILEGES, GRANT OPTION FROM 'elenaAdminTemis'@'localhost';

-- Remoção de todos os tipos de privilégios do administrador 'alessandroAdminTemis'
REVOKE ALL PRIVILEGES, GRANT OPTION FROM 'alessandroAdminTemis'@'localhost';
