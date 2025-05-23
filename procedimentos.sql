-- -------------------------------------------------------------------------------
-- P R O C E D I M E N T O S
-- F U N Ç Õ E S
-- G A T I L H O S
-- Operações de Descrição de Dados.
-- Criação, alteração e remoção de gatilhos, procedimentos armazenados e funções.
-- -------------------------------------------------------------------------------
USE temis_db;

-- S T O R E D  P R O C E D U R E S

-- Criação do procedimento "spTopEspecializacoesDetetive".
-- Procedimento que retorna as especializações de um detetive ordenadas por quantidade de casos.
-- DROP PROCEDURE spTopEspecializacoesDetetive;
DELIMITER $$
CREATE PROCEDURE spTopEspecializacoesDetetive(DetetiveId INT)
    BEGIN
        SELECT
        e.Designação,
        COUNT(e.Designação) AS Total
        FROM
        DetetiveCaso dc
        INNER JOIN Caso c ON dc.Caso = c.Id
        INNER JOIN Especialização e ON c.Especialização = e.Id
        WHERE dc.Detetive = DetetiveId
        GROUP BY c.Especialização
        ORDER BY COUNT(c.Especialização) DESC;
    END $$

-- Exemplo de chamada ao procedimento "spTopEspecializacoesDetetive":
-- CALL spTopEspecializacoesDetetive(<IdDetetive>);

-- Criação do procedimento "spCalculaTop5FaturacaoMensal".
-- Procedimento que retorna os 5 meses com maior faturação de um dado ano.
-- DROP PROCEDURE spCalculaTop5FaturacaoMensal;
DELIMITER $$
CREATE PROCEDURE spCalculaTop5FaturacaoMensal(Ano INT)
BEGIN
    WITH FaturacaoMensal AS (
        SELECT
            mes AS Mes,
            MONTHNAME(CONCAT(Ano, '-', mes, '-01')) AS Nome,
            fuCalculaFaturaçãoMensal(mes, Ano) AS Faturacao
        FROM
            (SELECT 1 AS mes
            UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4
            UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7
            UNION ALL SELECT 8 UNION ALL SELECT 9 UNION ALL SELECT 10
            UNION ALL SELECT 11 UNION ALL SELECT 12) AS Meses
    )

    SELECT Nome as Mes, Faturacao
    FROM FaturacaoMensal
    ORDER BY Faturacao DESC
    LIMIT 5;

END $$

-- Exemplo de chamada ao procedimento "spCalculaTop5FaturacaoMensal":
-- CALL spCalculaTop5FaturacaoMensal(<Ano>);

-- F U N C T I O N S

-- Criação da função "fuFecharCaso".
-- Função que fecha um caso e retorna a sua data de fim.
-- DROP FUNCTION fuFecharCaso;
DELIMITER $$
CREATE FUNCTION fuFecharCaso(CasoId INT) RETURNS DATE DETERMINISTIC
    BEGIN
       UPDATE Caso SET DataFim = NOW(), Estado = 1 WHERE Id = CasoId;
       RETURN (SELECT Caso.DataFim from Caso WHERE Id = CasoId);
    END $$

-- Exemplo de chamada à função "fuFecharCaso":
-- SELECT fuFecharCaso(<IdCaso>);

-- Criação da função "fuCalculaFaturaçãoMensal".
-- Função que calcula a faturação mensal de um dado mês num dado ano.
-- DROP FUNCTION fuCalculaFaturaçãoMensal;
DELIMITER $$
CREATE FUNCTION fuCalculaFaturaçãoMensal(Mes INT, Ano INT) RETURNS DECIMAL DETERMINISTIC
    BEGIN
        DECLARE Resultado DECIMAL;
        SET Resultado = (SELECT SUM(Pagamento.Valor) FROM Pagamento WHERE YEAR(DataPagamento) = Ano AND MONTH(DataPagamento) = Mes);
        IF ISNULL(Resultado) THEN
            SET Resultado = 0;
        END IF;
        RETURN Resultado;
    END $$

-- Exemplo de chamada à função "fuCalculaFaturaçãoMensal":
-- SELECT fuCalculaFaturaçãoMensal(<Mês>, <Ano>);

-- T R I G G E R S

-- Criação do gatilho "tgAdicionarDetetive".
-- Verifica se o detetive a ser adicionado tem mais de 18 anos.
-- DROP TRIGGER tgAdicionarDetetive;
DELIMITER $$
CREATE TRIGGER tgAdicionarDetetive
BEFORE INSERT ON Detetive
FOR EACH ROW
BEGIN
    DECLARE dataNascimento DATE;
    DECLARE idade INT;

    -- Extrair data de nascimento
    SET dataNascimento = NEW.DataNascimento;

    -- Calcular idade
    SET idade = TIMESTAMPDIFF(YEAR, dataNascimento, CURDATE());

    -- Verificar se a idade é menor que 18 (caso positivo, cancelar a inserção)
    IF idade < 18 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'O detetive deve ter pelo menos 18 anos.';
    END IF;
END $$

-- T R A N S A C T I O N S

-- Criação do procedimento "spAdicionarDetetive" que recorre a uma transação.
-- Procedimento que adiciona um detetive e os respetivos dados de contacto (separados por vírgulas) à base de dados.
-- DROP PROCEDURE spAdicionarDetetive;
DELIMITER $$
CREATE PROCEDURE spAdicionarDetetive(
    IN Id INT,
    IN Nome VARCHAR(75),
    IN Nascimento DATE,
    IN Emails VARCHAR(250),
    IN Telefones VARCHAR(250),
    OUT Resultado VARCHAR(200)
)
AdicionarDetetive:BEGIN
    -- Declaração de variáveis de controlo e de um handler para deteção da ocorrência de exceções SQL
    DECLARE Erro TINYINT DEFAULT 0;
    DECLARE Email VARCHAR(250);
    DECLARE Telefone VARCHAR(250);
    DECLARE EmailPos INT DEFAULT 1;
    DECLARE TelefonePos INT DEFAULT 1;
    DECLARE EmailTamanho INT;
    DECLARE TelefoneTamanho INT;
    DECLARE EmailPosFinal INT;
    DECLARE TelefonePosFinal INT;
    DECLARE CONTINUE HANDLER
        FOR SQLEXCEPTION
            SET Erro = 1;

    -- Início da transação
    START TRANSACTION;

    -- Inserção na tabela Detetive
    INSERT INTO Detetive
        (Id, Nome, DataNascimento)
        VALUES
        (Id, Nome, Nascimento);
    IF Erro = 1 THEN
        -- Interrupção da transação
        ROLLBACK;
        SET Resultado = 'Erro na inserção na tabela Detetive.';
        LEAVE AdicionarDetetive;
    END IF;

    -- Inserção dos emails na tabela DetetiveEmails
    SET EmailTamanho = CHAR_LENGTH(Emails);
    WHILE EmailPos <= EmailTamanho DO
        SET EmailPosFinal = INSTR(SUBSTRING(Emails FROM EmailPos), ',');
        IF EmailPosFinal = 0 THEN
            SET EmailPosFinal = EmailTamanho - EmailPos + 1;
        END IF;
        SET Email = TRIM(SUBSTRING(Emails, EmailPos, EmailPosFinal - 1));
        INSERT INTO DetetiveEmails (Detetive, Email) VALUES (Id, Email);
        IF Erro = 1 THEN
            ROLLBACK;
            SET Resultado = 'Erro na inserção na tabela DetetiveEmails.';
            LEAVE AdicionarDetetive;
        END IF;
        SET EmailPos = EmailPos + EmailPosFinal;
    END WHILE;

    -- Inserção dos telefones na tabela DetetiveTelefones
    SET TelefoneTamanho = CHAR_LENGTH(Telefones);
    WHILE TelefonePos <= TelefoneTamanho DO
        SET TelefonePosFinal = INSTR(SUBSTRING(Telefones FROM TelefonePos), ',');
        IF TelefonePosFinal = 0 THEN
            SET TelefonePosFinal = TelefoneTamanho - TelefonePos + 1;
        END IF;
        SET Telefone = TRIM(SUBSTRING(Telefones, TelefonePos, TelefonePosFinal - 1));
        INSERT INTO DetetiveTelefones (Detetive, Telefone) VALUES (Id, Telefone);
        IF Erro = 1 THEN
            ROLLBACK;
            SET Resultado = 'Erro na inserção na tabela DetetiveTelefones.';
            LEAVE AdicionarDetetive;
        END IF;
        SET TelefonePos = TelefonePos + TelefonePosFinal;
    END WHILE;

    -- Confirmação da transação
    COMMIT;
    SET Resultado = 'Detetive adicionado com sucesso.';
END$$

-- Exemplo de chamada ao procedimento "spAdicionarDetetive":
-- CALL spAdicionarDetetive(<Id>, <Nome>, <Data Nascimento>, <Email,Email,... >, <Telefone,Telefone,... >, @Resultado);
-- SELECT @Resultado;