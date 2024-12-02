
/* Si forniscono due opzioni di caricamento dei dati: 
	A) tramite LOAD DATA
    B) tramite INSERT INTO
    scommentare ciò che interessa
*/    

-- =============  INIZIO LOAD DATA   =============================
/* 				- setup permessi -
bisogna impostare dei privilegi per abilitare il caricamento dei dati in DB, altrimenti si riceve un Errore.
Error 2068: LOAD DATA LOCAL INFILE file request rejected due to restrictions on access.
*/
USE CambiaNome;
SET GLOBAL local_infile=1;					    -- Questa set qui è tardiva in ambiente MySQL Workbench. 
												-- Sostituire con l'impostazione della connessione locale  server-DB
												-- E' un bug della versione 8.0.12 e successive, fino ad almeno al 8.0.36
SHOW GLOBAL VARIABLES LIKE 'local_infile'; 		-- Deve ritornare 'local_infile', 'ON'
/*
Edit the connection settings in MySQL Workbench.
Under the Advanced tab, add the following option to the connector options in the others window:
OPT_LOCAL_INFILE=1
*/

LOAD DATA LOCAL INFILE 
'tuaPath/ToysGroup/Country.csv'								-- !!!  imposta il tuo percorso !!!
INTO TABLE Country  										-- load the csv data to my_table
FIELDS TERMINATED BY ';'  									-- field separator
LINES TERMINATED BY '\r\n'  								-- line ending
IGNORE 1 ROWS;  											-- ignore the header line

LOAD DATA LOCAL INFILE
'tuaPath/ToysGroup/Customer.csv'
INTO TABLE Customer
FIELDS TERMINATED BY ';'  						
LINES TERMINATED BY '\r\n'  					
IGNORE 1 ROWS;  								

LOAD DATA LOCAL INFILE 
'tuaPath/ToysGroup/Customer.csv'
INTO TABLE Product
FIELDS TERMINATED BY ';'  						
LINES TERMINATED BY '\r\n'  					
IGNORE 1 ROWS;  								

LOAD DATA LOCAL INFILE 
'tuaPath/ToysGroup/Customer.csv'
INTO TABLE Sales
FIELDS TERMINATED BY ';'  						
LINES TERMINATED BY '\r\n'  					
IGNORE 1 ROWS;  								


