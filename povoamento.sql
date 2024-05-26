USE temis_db;

-- DETETIVES
INSERT INTO Detetive (Id, Nome, DataNascimento) 
VALUES(0,'Rahyssa Ouro', '1990-04-01'),(1,'Sílvio Rebouças', '1995-02-09'),(2,'David Filgueiras', '1978-12-20'),(3,'Soraya MontAlverne', '1977-04-15'),(4,'Hossana Vides', '1976-05-05'),(5,'Santiago Matoso', '1995-02-06'),(6,'Mauri Carneiro', '1970-03-01'),(7,'Maksim Mena', '1999-02-10'),(8,'Mellyssa Laranjeira', '1975-10-27'),(9,'Hafsa Fartaria', '1996-12-08'),(10,'Kael Dantas', '1990-07-04'),(11,'Kaio Porciúncula', '1997-01-08'),(12,'Armando Soeiro', '1998-11-18'),(13,'Stela Frazão', '1986-06-04'),(14,'Kiari Guedelha', '1998-01-21');
INSERT INTO DetetiveTelefones (Detetive, Telefone) 
VALUES(0, '+351902419234'),(1, '+351998698167'),(2, '+351932472451'),(3, '+351979300291'),(4, '+351953311712'),(5, '+351901314359'),(6, '+351984243917'),(7, '+351976202700'),(8, '+351931755087'),(9, '+351901271801'),(10, '+351928427205'),(11, '+351998534543'),(12, '+351987917045'),(13, '+351920808550'),(14, '+351934085797');
INSERT INTO DetetiveEmails (Detetive, Email) 
VALUES(0, 'rahyssa_ouro71@temis.gr'),(1, 'silvio_reboucas79@temis.gr'),(2, 'david_filgueiras64@temis.gr'),(3, 'soraya_montalverne81@temis.gr'),(4, 'hossana_vides41@temis.gr'),(5, 'santiago_matoso70@temis.gr'),(6, 'mauri_carneiro79@temis.gr'),(7, 'maksim_mena26@temis.gr'),(8, 'mellyssa_laranjeira50@temis.gr'),(9, 'hafsa_fartaria54@temis.gr'),(10, 'kael_dantas30@temis.gr'),(11, 'kaio_porciuncula83@temis.gr'),(12, 'armando_soeiro93@temis.gr'),(13, 'stela_frazao46@temis.gr'),(14, 'kiari_guedelha79@temis.gr');

-- CLIENTES
INSERT INTO Cliente (Id, Nome) 
VALUES(0,'Anael da Costa'),(1,'Eduard Milheiro'),(2,'Nilton Paula'),(3,'Nicolau Barra'),(4,'Virgínia Vila-Chã'),(5,'Lara Lamego'),(6,'Erika Arouca'),(7,'Tiara Horta'),(8,'Erica Barreiros'),(9,'Rahyssa Freiria'),(10,'Noa Temes'),(11,'Brahim Pastana'),(12,'Rafaella Cabral'),(13,'Marvin Ferrão'),(14,'Hermano Grangeia'),(15,'Levi Estrela'),(16,'Lúcio Manso'),(17,'Albert Brandão'),(18,'Bogdan Noronha'),(19,'Kendra Mansilha'),(20,'Lucía Catela'),(21,'Brahim Batata'),(22,'Salomé Cachão'),(23,'Alonso Lobato'),(24,'Alisa Arantes'),(25,'Solange Modesto'),(26,'Ben Vigário'),(27,'Oscar Campos'),(28,'Jóni Vidal'),(29,'Jia Silvestre');
INSERT INTO ClienteTelefones (Cliente, Telefone) 
VALUES(0, '+351954032228'),(1, '+351948919081'),(2, '+351987746010'),(3, '+351910868363'),(4, '+351901821858'),(5, '+351940253257'),(6, '+351941837142'),(7, '+351963413959'),(8, '+351903752619'),(9, '+351946521372'),(10, '+351941977120'),(11, '+351906932082'),(12, '+351986922785'),(13, '+351942105163'),(14, '+351927740747'),(15, '+351997025349'),(16, '+351902710879'),(17, '+351944288741'),(18, '+351910824717'),(19, '+351988054264'),(20, '+351923803318'),(21, '+351948243364'),(22, '+351905921608'),(23, '+351933748371'),(24, '+351914078651'),(25, '+351999945599'),(26, '+351969391273'),(27, '+351958499290'),(28, '+351942635911'),(29, '+351972162325');
INSERT INTO ClienteEmails (Cliente, Email) 
VALUES(0, 'anael_da_costa72@sapo.pt'),(1, 'eduard_milheiro40@hotmail.com'),(2, 'nilton_paula46@sapo.pt'),(3, 'nicolau_barra98@icloud.com'),(4, 'virginia_vila-cha93@gmail.com'),(5, 'lara_lamego39@live.com'),(6, 'erika_arouca11@sapo.pt'),(7, 'tiara_horta51@outlook.com'),(8, 'erica_barreiros93@hotmail.com'),(9, 'rahyssa_freiria84@yahoo.com'),(10, 'noa_temes96@yahoo.com'),(11, 'brahim_pastana78@yahoo.com'),(12, 'rafaella_cabral84@icloud.com'),(13, 'marvin_ferrao78@outlook.com'),(14, 'hermano_grangeia85@gmail.com'),(15, 'levi_estrela82@sapo.pt'),(16, 'lucio_manso27@yahoo.com'),(17, 'albert_brandao27@mail.pt'),(18, 'bogdan_noronha81@live.com'),(19, 'kendra_mansilha49@gmail.com'),(20, 'lucia_catela56@outlook.com'),(21, 'brahim_batata59@outlook.com'),(22, 'salome_cachao37@gmail.com'),(23, 'alonso_lobato75@gmail.com'),(24, 'alisa_arantes65@mail.pt'),(25, 'solange_modesto63@icloud.com'),(26, 'ben_vigario53@hotmail.com'),(27, 'oscar_campos28@icloud.com'),(28, 'joni_vidal11@mail.pt'),(29, 'jia_silvestre9@gmail.com');

-- ARMAZÉNS
INSERT INTO Armazém (Id, Descrição, Lotação, Rua, Localidade, CódigoPostal) 
VALUES(0, 'Armazém 1', 650, 'Avenue des Champs-Élysées', 'Paris', '75008'),(1, 'Armazém 2', 817, 'Rua do Comércio', 'Lisboa', '1100-150'),(2, 'Armazém 3', 891, 'Rua da Boavista', 'Lisboa', '1200-062'),(3, 'Armazém 4', 656, 'Οδός Αγίου Δημητρίου', 'Patras', '262 21');

-- ESPECIALIZAÇÕES
INSERT INTO Especialização (id, designação) 
VALUES(0,'Homicídio'),(1,'Roubo'),(2,'Furto'),(3,'Burla'),(4,'Tráfico'),(5,'Violência doméstica'),(6,'Assédio'),(7,'Sequestro');

-- PAGAMENTOS
INSERT INTO Pagamento (Id, Valor, Método, DataPagamento) 
VALUES(0, 3813, 'Cheque', '2015-09-02'),(1, 1623, 'Cheque', '2017-05-02'),(2, 3748, 'Cheque', '2020-12-05'),(3, 1883, 'Dinheiro', '2011-03-07'),(4, 1635, 'Dinheiro', '2012-02-26'),(5, 1027, 'Dinheiro', '2012-10-16'),(6, 2182, 'Transferência bancária', '2010-05-17'),(7, 1845, 'Dinheiro', '2015-09-19'),(8, 2420, 'Transferência bancária', '2021-07-23'),(9, 1289, 'Cartão de Crédito', '2011-05-23'),(10, 1168, 'Dinheiro', '2014-02-21'),(11, 2232, 'Cheque', '2021-04-20'),(12, 2346, 'Cheque', '2016-11-14'),(13, 3991, 'Cartão de Crédito', '2012-06-12'),(14, 1946, 'Transferência bancária', '2014-08-18'),(15, 1846, 'Cartão de Crédito', '2020-04-21'),(16, 3956, 'Transferência bancária', '2019-06-15'),(17, 1371, 'Transferência bancária', '2018-09-26'),(18, 1054, 'Transferência bancária', '2017-10-24'),(19, 2152, 'Cartão de Crédito', '2015-11-27'),(20, 1092, 'Dinheiro', '2015-12-15'),(21, 3003, 'Cartão de Crédito', '2020-12-26'),(22, 1868, 'Cartão de Crédito', '2013-04-03'),(23, 1678, 'Cheque', '2013-11-23'),(24, 3075, 'Cheque', '2019-02-19'),(25, 3769, 'Cartão de Crédito', '2012-05-18'),(26, 1330, 'Cartão de Crédito', '2013-01-19'),(27, 1627, 'Dinheiro', '2015-09-10'),(28, 3911, 'Dinheiro', '2016-02-28'),(29, 3203, 'Cheque', '2017-09-28'),(30, 3535, 'Cheque', '2012-05-01');

-- CASOS
INSERT INTO Caso (Id, DataInício, DataFim, Estado, Especialização, Cliente, Pagamento) 
VALUES(0,'2015-09-02', NULL, 0, 1, 17, 0),(1,'2017-05-02', NULL, 0, 4, 8, 1),(2,'2020-12-05', '2021-07-15', 1, 4, 23, 2),(3,'2011-03-07', NULL, 0, 0, 5, 3),(4,'2012-02-26', NULL, 0, 4, 13, 4),(5,'2012-10-16', NULL, 0, 3, 8, 5),(6,'2010-05-17', '2013-11-01', 1, 6, 3, 6),(7,'2015-09-19', '2021-12-03', 1, 4, 3, 7),(8,'2021-07-23', NULL, 0, 3, 9, 8),(9,'2011-05-23', '2017-04-05', 1, 2, 6, 9),(10,'2014-02-21', NULL, 0, 3, 12, 10),(11,'2021-04-20', NULL, 0, 5, 2, 11),(12,'2016-11-14', '2019-02-15', 1, 7, 5, 12),(13,'2012-06-12', NULL, 0, 3, 22, 13),(14,'2014-08-18', '2020-06-18', 1, 3, 2, 14),(15,'2020-04-21', NULL, 0, 2, 22, 15),(16,'2019-06-15', NULL, 0, 4, 20, 16),(17,'2018-09-26', '2021-08-04', 1, 1, 14, 17),(18,'2017-10-24', NULL, 0, 0, 5, 18),(19,'2015-11-27', NULL, 0, 3, 4, 19),(20,'2015-12-15', '2016-01-13', 1, 2, 7, 20),(21,'2020-12-26', NULL, 0, 0, 6, 21),(22,'2013-04-03', '2018-01-11', 1, 6, 1, 22),(23,'2013-11-23', '2021-10-06', 1, 4, 2, 23),(24,'2019-02-19', NULL, 0, 7, 10, 24),(25,'2012-05-18', NULL, 0, 0, 0, 25),(26,'2013-01-19', NULL, 0, 0, 28, 26),(27,'2015-09-10', '2021-01-09', 1, 4, 17, 27),(28,'2016-02-28', NULL, 0, 1, 14, 28),(29,'2017-09-28', NULL, 0, 3, 25, 29),(30,'2012-05-01', '2021-04-04', 1, 6, 24, 30);

-- CASO ARQUIVOS
INSERT INTO CasoArquivo (Id, Título, DataAdição, Descrição, Caso) 
VALUES(0, 'Relatório de investigação', '2015-09-02', 'Relatório de investigação sobre o caso', 0),(1, 'Grelha de análise', '2017-05-02', 'Grelha de análise de evidências', 1),(2, 'Grelha de análise', '2017-05-02', 'Grelha de análise de evidências', 1),(3, 'Áudio de escuta', '2020-12-05', 'Áudio de escuta', 2),(4, 'Áudio de interrogatório', '2020-12-05', 'Áudio de interrogatório de evidências', 2),(5, 'Áudio de interrogatório', '2011-03-07', 'Áudio de interrogatório de evidências', 3),(6, 'Áudio de escuta', '2012-02-26', 'Áudio de escuta', 4),(7, 'Relatório de investigação', '2012-10-16', 'Relatório de investigação sobre o caso', 5),(8, 'Relatório de investigação', '2012-10-16', 'Relatório de investigação sobre o caso', 5),(9, 'Fotografias', '2012-10-16', 'Fotografias de evidências', 5),(10, 'Áudio de escuta', '2010-05-17', 'Áudio de escuta', 6),(11, 'Grelha de análise', '2015-09-19', 'Grelha de análise de evidências', 7),(12, 'Relatório de investigação', '2015-09-19', 'Relatório de investigação sobre o caso', 7),(13, 'Áudio de escuta', '2015-09-19', 'Áudio de escuta', 7),(14, 'Áudio de interrogatório', '2021-07-23', 'Áudio de interrogatório de evidências', 8),(15, 'Fotografias', '2021-07-23', 'Fotografias de evidências', 8),(16, 'Fotografias', '2011-05-23', 'Fotografias de evidências', 9),(17, 'Áudio de interrogatório', '2011-05-23', 'Áudio de interrogatório de evidências', 9),(18, 'Áudio de chamada', '2011-05-23', 'Áudio de chamada de evidências', 9),(19, 'Áudio de interrogatório', '2014-02-21', 'Áudio de interrogatório de evidências', 10),(20, 'Áudio de escuta', '2014-02-21', 'Áudio de escuta', 10),(21, 'Fotografias', '2021-04-20', 'Fotografias de evidências', 11),(22, 'Áudio de chamada', '2016-11-14', 'Áudio de chamada de evidências', 12),(23, 'Fotografias', '2016-11-14', 'Fotografias de evidências', 12),(24, 'Fotografias', '2016-11-14', 'Fotografias de evidências', 12),(25, 'Fotografias', '2012-06-12', 'Fotografias de evidências', 13),(26, 'Vídeos', '2014-08-18', 'Vídeos de evidências', 14),(27, 'Áudio de escuta', '2020-04-21', 'Áudio de escuta', 15),(28, 'Áudio de chamada', '2019-06-15', 'Áudio de chamada de evidências', 16),(29, 'Fotografias', '2018-09-26', 'Fotografias de evidências', 17),(30, 'Relatório de investigação', '2018-09-26', 'Relatório de investigação sobre o caso', 17),(31, 'Áudio de escuta', '2017-10-24', 'Áudio de escuta', 18),(32, 'Grelha de análise', '2017-10-24', 'Grelha de análise de evidências', 18),(33, 'Vídeos', '2015-11-27', 'Vídeos de evidências', 19),(34, 'Áudio de escuta', '2015-12-15', 'Áudio de escuta', 20),(35, 'Áudio de chamada', '2015-12-15', 'Áudio de chamada de evidências', 20),(36, 'Áudio de interrogatório', '2015-12-15', 'Áudio de interrogatório de evidências', 20),(37, 'Áudio de interrogatório', '2020-12-26', 'Áudio de interrogatório de evidências', 21),(38, 'Áudio de escuta', '2020-12-26', 'Áudio de escuta', 21),(39, 'Áudio de chamada', '2013-04-03', 'Áudio de chamada de evidências', 22),(40, 'Áudio de chamada', '2013-11-23', 'Áudio de chamada de evidências', 23),(41, 'Grelha de análise', '2019-02-19', 'Grelha de análise de evidências', 24),(42, 'Grelha de análise', '2019-02-19', 'Grelha de análise de evidências', 24),(43, 'Vídeos', '2012-05-18', 'Vídeos de evidências', 25),(44, 'Áudio de escuta', '2013-01-19', 'Áudio de escuta', 26),(45, 'Áudio de interrogatório', '2013-01-19', 'Áudio de interrogatório de evidências', 26),(46, 'Áudio de chamada', '2013-01-19', 'Áudio de chamada de evidências', 26),(47, 'Vídeos', '2015-09-10', 'Vídeos de evidências', 27),(48, 'Fotografias', '2016-02-28', 'Fotografias de evidências', 28),(49, 'Vídeos', '2016-02-28', 'Vídeos de evidências', 28),(50, 'Áudio de escuta', '2017-09-28', 'Áudio de escuta', 29),(51, 'Vídeos', '2012-05-01', 'Vídeos de evidências', 30),(52, 'Áudio de chamada', '2012-05-01', 'Áudio de chamada de evidências', 30);

-- CASO ARQUIVO ANEXO
INSERT INTO CasoArquivoAnexo (Id, Anexo, Arquivo) 
VALUES(0, 'relatorio.pdf', 0),(1, 'grelha.pdf', 1),(2, 'grelha.pdf', 1),(3, 'analise.docx', 2),(4, 'analise.docx', 2),(5, 'captura.mp3', 3),(6, 'escuta.wav', 3),(7, 'captura.mp3', 4),(8, 'captura.mp3', 5),(9, 'captura.mp3', 5),(10, 'captura.mp3', 6),(11, 'investigacao.docx', 7),(12, 'investigacao.docx', 8),(13, 'investigacao.docx', 8),(14, '06.jpg', 9),(15, 'escuta.wav', 10),(16, 'captura.mp3', 10),(17, 'analise.docx', 11),(18, 'analise.docx', 11),(19, 'investigacao.docx', 12),(20, 'investigacao.docx', 12),(21, 'captura.mp3', 13),(22, 'captura.mp3', 13),(23, 'captura.mp3', 14),(24, 'captura.mp3', 14),(25, '05.jpeg', 15),(26, '01.png', 16),(27, 'escuta.wav', 17),(28, 'escuta.wav', 17),(29, 'captura.mp3', 18),(30, 'escuta.wav', 18),(31, 'escuta.wav', 19),(32, 'escuta.wav', 20),(33, 'escuta.wav', 20),(34, '03.jpg', 21),(35, '01.png', 21),(36, 'captura.mp3', 22),(37, 'escuta.wav', 22),(38, '02.jpeg', 23),(39, '05.jpeg', 23),(40, '06.jpg', 24),(41, '05.jpeg', 25),(42, '03.jpg', 25),(43, 'captura.mp4', 26),(44, 'captura.mp3', 27),(45, 'escuta.wav', 28),(46, '03.jpg', 29),(47, '05.jpeg', 29),(48, 'relatorio.pdf', 30),(49, 'relatorio.pdf', 30),(50, 'escuta.wav', 31),(51, 'captura.mp3', 31),(52, 'analise.docx', 32),(53, 'grelha.pdf', 32),(54, 'captura.mp4', 33),(55, 'captura.mp3', 34),(56, 'captura.mp3', 34),(57, 'chamada.mp3', 35),(58, 'escuta.wav', 36),(59, 'captura.mp3', 37),(60, 'escuta.wav', 37),(61, 'escuta.wav', 38),(62, 'captura.mp3', 38),(63, 'escuta.wav', 39),(64, 'escuta.wav', 40),(65, 'chamada.mp3', 40),(66, 'analise.docx', 41),(67, 'analise.docx', 41),(68, 'analise.docx', 42),(69, 'captura.mp4', 43),(70, 'video.mp4', 43),(71, 'escuta.wav', 44),(72, 'escuta.wav', 45),(73, 'escuta.wav', 45),(74, 'escuta.wav', 46),(75, 'escuta.wav', 46),(76, 'video.mp4', 47),(77, 'video.mp4', 47),(78, '06.jpg', 48),(79, 'captura.mp4', 49),(80, 'captura.mp4', 49),(81, 'captura.mp3', 50),(82, 'video.mp4', 51),(83, 'captura.mp4', 51),(84, 'captura.mp3', 52),(85, 'chamada.mp3', 52);

-- OBJETOS
INSERT INTO Objeto (Id, DataRecolha, Descrição, Armazém, Caso) 
VALUES
(1, '1973-10-05' ,'Comprimidos', 1, 7),
(2, '1992-12-09' ,'Comprimidos', 0, 13),
(3, '1979-10-27' ,'Cd riscado', 2, 19),
(4, '1973-01-12' ,'Lâmpada queimada', 3, 12),
(5, '1979-12-20' ,'Carta de amor', 3, 23),
(6, '1994-10-26' ,'Lâmpada queimada', 3, 6),
(7, '1975-04-06' ,'Frasco de perfume', 2, 22),
(8, '1985-07-18' ,'Borracha', 3, 13),
(9, '1971-05-25' ,'Óculos de sol', 0, 28),
(10, '1984-12-15' ,'Facas de cozinha', 2, 17),
(11, '1991-12-07' ,'Filme de câmera', 1, 11);

-- OBJETO FOTOS
INSERT INTO ObjetoFotos (Id, Foto, Objeto) 
VALUES
(1, 'comprimidos.png', 1),
(2, 'comprimidos.jpg', 2),
(3, 'cd_riscado.jpg', 3),
(4, 'lâmpada_queimada.jpeg', 4),
(5, 'carta_de_amor.png', 5),
(6, 'lâmpada_queimada.jpeg', 6),
(7, 'frasco_de_perfume.jpeg', 7),
(8, 'borracha.png', 8),
(9, 'óculos_de_sol.jpg', 9),
(10, 'facas_de_cozinha.jpg', 10),
(11, 'filme_de_câmera.jpeg', 11);

-- ADMINISTRADORES
INSERT INTO Administrador (Id, Nome, DataNascimento) 
VALUES(0,'Cátia Rebimbas', '1985-04-23'),(1,'Brahim Álvaro', '1982-11-13'),(2,'Lyah Vigário', '1972-06-10'),(3,'Zaqueu Pederneiras', '1993-07-18'),(4,'Ary Teixeira', '1979-09-17'),(5,'Kaya Mascarenhas', '1971-09-13'),(6,'Tiara Canejo', '1975-03-11'),(7,'Nicola Medina', '1983-03-15'),(8,'Verónica Trindade', '1971-11-11'),(9,'Samir Paz', '1989-11-14');
INSERT INTO AdministradorTelefones (Administrador, Telefone) 
VALUES(0, '+351903933514'),(1, '+351952950652'),(2, '+351996407941'),(3, '+351913683786'),(4, '+351908352391'),(5, '+351913650892'),(6, '+351957187754'),(7, '+351984162497'),(8, '+351908452553'),(9, '+351942175298');
INSERT INTO AdministradorEmails (Administrador, Email) 
VALUES(0, 'catia_rebimbas93@temis.gr'),(1, 'brahim_alvaro97@temis.gr'),(2, 'lyah_vigario99@temis.gr'),(3, 'zaqueu_pederneiras54@temis.gr'),(4, 'ary_teixeira5@temis.gr'),(5, 'kaya_mascarenhas38@temis.gr'),(6, 'tiara_canejo94@temis.gr'),(7, 'nicola_medina70@temis.gr'),(8, 'veronica_trindade27@temis.gr'),(9, 'samir_paz28@temis.gr');

-- ADMINISTRADOR ARMAZÉNS
INSERT INTO ArmazémAdministrador (Armazém, Administrador) 
VALUES(0, 1),(1, 5),(2, 8);
INSERT INTO PagamentoAdministrador (Pagamento, Administrador) 
VALUES(0, 8),(1, 2),(2, 0),(3, 5),(4, 3),(5, 9),(6, 8),(7, 8),(8, 7),(9, 3),(10, 6),(11, 8),(12, 2),(13, 5),(14, 8),(15, 3),(16, 4),(17, 5),(18, 2),(19, 4),(20, 4),(21, 6),(22, 9),(23, 1),(24, 1),(25, 3),(26, 5),(27, 7),(28, 3),(29, 1),(30, 0);

-- DETETIVE ADMINISTRADOR
INSERT INTO DetetiveAdministrador (Detetive, Administrador) 
VALUES(0, 9),(1, 6),(2, 0),(3, 1),(4, 8),(5, 7),(6, 2),(7, 2),(8, 5),(9, 1),(10, 5),(11, 9),(12, 5),(13, 1),(14, 9);

-- DETETIVE CASO
INSERT INTO DetetiveCaso (Detetive, Caso) 
VALUES(0, 0),(3, 1),(12, 2),(11, 3),(0, 4),(6, 5),(9, 6),(1, 7),(5, 8),(14, 9),(0, 10),(5, 11),(9, 12),(14, 13),(0, 14),(0, 15),(1, 16),(10, 17),(8, 18),(4, 19),(6, 20),(2, 21),(12, 22),(13, 23),(10, 24),(10, 25),(2, 26),(9, 27),(12, 28),(12, 29),(2, 30);
INSERT INTO CasoAdministrador (Caso, Administrador) 
VALUES(0, 4),(1, 4),(2, 2),(3, 6),(4, 6),(5, 2),(6, 2),(7, 4),(8, 8),(9, 6),(10, 8),(11, 8),(12, 3),(13, 6),(14, 4),(15, 3),(16, 9),(17, 8),(18, 9),(19, 2),(20, 2),(21, 6),(22, 1),(23, 4),(24, 8),(25, 9),(26, 1),(27, 8),(28, 5),(29, 2),(30, 2);