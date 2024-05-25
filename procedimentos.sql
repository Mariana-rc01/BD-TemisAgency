-- -------------------------------------------------------------------------------
-- P R O C E D I M E N T O S
-- F U N C O E S
-- G A T I L H O S
-- Operações de Descrição de Dados.
-- Criação, alteração e remoção de gatilhos, procedimentos armazenados e funções.
-- -------------------------------------------------------------------------------
USE temis_db;



-- GATILHO (Trigger)
-- Verifica se o detetive a ser adicionado tem mais de 18 anos
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

