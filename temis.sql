-- -----------------------------------------------------
-- Schema temis_db
-- -----------------------------------------------------
CREATE SCHEMA temis_db CHARACTER SET utf8 ;
USE temis_db;

-- -----------------------------------------------------
-- Table Cliente 
-- -----------------------------------------------------
CREATE TABLE Cliente (
   Id INT NOT NULL,
   Nome VARCHAR(75) NOT NULL,
  PRIMARY KEY ( Id ));



-- -----------------------------------------------------
-- Table ClienteTelefones
-- -----------------------------------------------------
CREATE TABLE ClienteTelefones  (
   Telefone  VARCHAR(15) NOT NULL,
   Cliente  INT NOT NULL,
  PRIMARY KEY ( Telefone ),
  CONSTRAINT  ClienteTelefones_Cliente
    FOREIGN KEY ( Cliente )
    REFERENCES Cliente  ( Id )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);



-- -----------------------------------------------------
-- Table ClienteEmails
-- -----------------------------------------------------
CREATE TABLE ClienteEmails  (
   Email VARCHAR(89) NOT NULL,
   Cliente INT NOT NULL,
  PRIMARY KEY ( Email ),
  CONSTRAINT  ClienteEmails_Cliente 
    FOREIGN KEY ( Cliente )
    REFERENCES  Cliente  ( Id )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);



-- -----------------------------------------------------
-- Table Detetive 
-- -----------------------------------------------------
CREATE TABLE Detetive  (
   Id INT NOT NULL,
   Nome VARCHAR(75) NOT NULL,
   DataNascimento  DATE NOT NULL,
  PRIMARY KEY ( Id ));



-- -----------------------------------------------------
-- Table DetetiveEmails 
-- -----------------------------------------------------
CREATE TABLE DetetiveEmails  (
   Email VARCHAR(89) NOT NULL,
   Detetive INT NOT NULL,
  PRIMARY KEY ( Email ),
  CONSTRAINT  DetetiveEmails_Detetive 
    FOREIGN KEY ( Detetive )
    REFERENCES  Detetive  ( Id )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);



-- -----------------------------------------------------
-- Table DetetiveTelefones 
-- -----------------------------------------------------
CREATE TABLE DetetiveTelefones  (
   Telefone  VARCHAR(15) NOT NULL,
   Detetive  INT NOT NULL,
  PRIMARY KEY ( Telefone ),
  CONSTRAINT  DetetiveTelefones_Detetive
    FOREIGN KEY ( Detetive )
    REFERENCES  Detetive  ( Id )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);



-- -----------------------------------------------------
-- Table Armazém 
-- -----------------------------------------------------
CREATE TABLE Armazém  (
   Id  INT NOT NULL,
   Descrição  VARCHAR(255) NOT NULL,
   Lotação  INT NOT NULL,
   Rua  VARCHAR(255) NOT NULL,
   Localidade  VARCHAR(30) NOT NULL,
   CódigoPostal  VARCHAR(15) NOT NULL,
  PRIMARY KEY ( Id ));



-- -----------------------------------------------------
-- Table Especialização 
-- -----------------------------------------------------
CREATE TABLE Especialização  (
   Id INT NOT NULL,
   Designação VARCHAR(50) NOT NULL,
  PRIMARY KEY ( Id ));



-- -----------------------------------------------------
-- Table Pagamento 
-- -----------------------------------------------------
CREATE TABLE Pagamento  (
   Id INT NOT NULL,
   Valor DECIMAL NOT NULL,
   Método VARCHAR(50) NOT NULL,
   DataPagamento  DATETIME NOT NULL,
  PRIMARY KEY ( Id ));

-- -----------------------------------------------------
-- Table Caso 
-- -----------------------------------------------------
CREATE TABLE Caso  (
   Id  INT NOT NULL,
   DataInício  DATETIME NOT NULL,
   DataFim  DATETIME NULL,
   Estado  TINYINT NOT NULL,
   Especialização  INT NOT NULL,
   Cliente  INT NOT NULL,
   Pagamento  INT NOT NULL,
  PRIMARY KEY ( Id ),
  CONSTRAINT  Especialização 
    FOREIGN KEY ( Especialização )
    REFERENCES  Especialização  ( Id )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT  Cliente 
    FOREIGN KEY ( Cliente )
    REFERENCES  Cliente  ( Id )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT  Caso_Pagamento 
    FOREIGN KEY ( Pagamento )
    REFERENCES  Pagamento  ( Id )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table Objeto 
-- -----------------------------------------------------
CREATE TABLE Objeto  (
   Id  INT NOT NULL,
   DataRecolha  DATETIME NOT NULL,
   Descrição  VARCHAR(45) NULL,
   Armazém  INT NOT NULL,
   Caso  INT NOT NULL,
  PRIMARY KEY ( Id ),
  CONSTRAINT  ObjetoArmazém_Armazém 
    FOREIGN KEY ( Armazém )
    REFERENCES  Armazém  ( Id )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT  Caso 
    FOREIGN KEY ( Caso )
    REFERENCES  Caso  ( Id )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);



-- -----------------------------------------------------
-- Table  ObjetoFotos 
-- -----------------------------------------------------
CREATE TABLE ObjetoFotos  (
   Id INT NOT NULL,
   Foto  LONGBLOB NOT NULL,
   Objeto  INT NOT NULL,
  PRIMARY KEY ( Id ),
  CONSTRAINT  Objeto 
    FOREIGN KEY ( Objeto )
    REFERENCES  Objeto  ( Id )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);



-- -----------------------------------------------------
-- Table  Administrador 
-- -----------------------------------------------------
CREATE TABLE Administrador  (
   Id  INT NOT NULL,
   Nome  VARCHAR(75) NOT NULL,
   DataNascimento  DATE NOT NULL,
  PRIMARY KEY ( Id ));



-- -----------------------------------------------------
-- Table  AdministradorEmails 
-- -----------------------------------------------------
CREATE TABLE AdministradorEmails  (
   Email  VARCHAR(89) NOT NULL,
   Administrador  INT NOT NULL,
  PRIMARY KEY ( Email ),
  CONSTRAINT  AdministradorEmails_Administrador 
    FOREIGN KEY ( Administrador )
    REFERENCES  Administrador  ( Id )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);



-- -----------------------------------------------------
-- Table  AdministradorTelefones 
-- -----------------------------------------------------
CREATE TABLE AdministradorTelefones  (
   Telefone  VARCHAR(15) NOT NULL,
   Administrador  INT NOT NULL,
  PRIMARY KEY ( Telefone ),
  CONSTRAINT  AdministradorTelefones_Administrador 
    FOREIGN KEY ( Administrador )
    REFERENCES  Administrador  ( Id )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);



-- -----------------------------------------------------
-- Table  ArmazémAdministrador 
-- -----------------------------------------------------
CREATE TABLE ArmazémAdministrador  (
   Administrador  INT NOT NULL,
   Armazém  INT NOT NULL,
  PRIMARY KEY ( Administrador ,  Armazém ),
  CONSTRAINT  ArmazémAdministrador_Armazém 
    FOREIGN KEY ( Armazém )
    REFERENCES  Armazém  ( Id )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT  ArmazémAdministrador_Administrador 
    FOREIGN KEY ( Administrador )
    REFERENCES  Administrador  ( Id )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);



-- -----------------------------------------------------
-- Table  PagamentoAdministrador 
-- -----------------------------------------------------
CREATE TABLE PagamentoAdministrador  (
   Pagamento  INT NOT NULL,
   Administrador  INT NOT NULL,
  PRIMARY KEY ( Pagamento ,  Administrador ),
  CONSTRAINT  PagamentoAdministrador_Pagamento 
    FOREIGN KEY ( Pagamento )
    REFERENCES  Pagamento  ( Id )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT  PagamentoAdministrador_Administrador
    FOREIGN KEY ( Administrador )
    REFERENCES  Administrador  ( Id )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);



-- -----------------------------------------------------
-- Table  DetetiveAdministrador 
-- -----------------------------------------------------
CREATE TABLE DetetiveAdministrador  (
   Detetive  INT NOT NULL,
   Administrador  INT NOT NULL,
  PRIMARY KEY ( Detetive ,  Administrador ),
  CONSTRAINT  Detetive 
    FOREIGN KEY ( Detetive )
    REFERENCES  Detetive  ( Id )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT  Administrador 
    FOREIGN KEY ( Administrador )
    REFERENCES  Administrador  ( Id )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);



-- -----------------------------------------------------
-- Table  CasoArquivo 
-- -----------------------------------------------------
CREATE TABLE CasoArquivo  (
   Id  INT NOT NULL,
   Título  VARCHAR(75) NOT NULL,
   DataAdição  DATETIME NOT NULL,
   Descrição  VARCHAR(255) NULL,
   Caso  INT NOT NULL,
  PRIMARY KEY ( Id ),
  CONSTRAINT  CasoArquivo_Caso 
    FOREIGN KEY ( Caso )
    REFERENCES  Caso  ( Id )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);



-- -----------------------------------------------------
-- Table  CasoArquivoAnexo 
-- -----------------------------------------------------
CREATE TABLE CasoArquivoAnexo  (
   Id INT NOT NULL,
   Anexo  LONGBLOB NOT NULL,
   Arquivo  INT NOT NULL,
  PRIMARY KEY ( Id ),
  CONSTRAINT  CasoArquivoAnexo_CasoArquivo 
    FOREIGN KEY ( Arquivo )
    REFERENCES  CasoArquivo  ( Id )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);



-- -----------------------------------------------------
-- Table  DetetiveCaso 
-- -----------------------------------------------------
CREATE TABLE DetetiveCaso  (
   Detetive  INT NOT NULL,
   Caso  INT NOT NULL,
  PRIMARY KEY ( Detetive ,  Caso ),
  CONSTRAINT  DetetiveCaso_Detetive 
    FOREIGN KEY ( Detetive )
    REFERENCES  Detetive  ( Id )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT  DetetiveCaso_Caso 
    FOREIGN KEY ( Caso )
    REFERENCES  Caso  ( Id )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);



-- -----------------------------------------------------
-- Table  CasoAdministrador 
-- -----------------------------------------------------
CREATE TABLE CasoAdministrador  (
   Caso  INT NOT NULL,
   Administrador  INT NOT NULL,
  PRIMARY KEY ( Caso ,  Administrador ),
  CONSTRAINT  CasoAdministrador_Caso 
    FOREIGN KEY ( Caso )
    REFERENCES  Caso  ( Id )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT  CasoAdministrador_Administrador 
    FOREIGN KEY ( Administrador )
    REFERENCES  Administrador  ( Id )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);