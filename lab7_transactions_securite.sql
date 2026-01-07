-- creation de db :
CREATE DATABASE IF NOT EXISTS banque_demo;
USE banque_demo;
CREATE TABLE IF NOT EXISTS compte (
  id INT AUTO_INCREMENT PRIMARY KEY,
  titulaire VARCHAR(100) NOT NULL,
  solde DECIMAL(10,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB;
-- insertion :
INSERT INTO compte (titulaire, solde) VALUES ('ayman', 5000.00), ('imad', 900.00);
 select  *from  compte;
 
 -- transaction:
START TRANSACTION;
UPDATE compte SET solde = solde - 200.00 WHERE titulaire = 'ayman';
UPDATE compte SET solde = solde + 200.00 WHERE titulaire = 'imad';
COMMIT;
SELECT * FROM compte;

START TRANSACTION;
UPDATE compte SET solde = solde - 5000.00 WHERE titulaire = 'ayman';
ROLLBACK; 
SELECT * FROM compte;




CREATE USER IF NOT EXISTS 'ayman'@'localhost' IDENTIFIED BY 'mfbk9350';
GRANT SELECT, INSERT, UPDATE ON banque_demo.compte TO 'ayman'@'localhost';
REVOKE UPDATE ON banque_demo.compte FROM 'ayman'@'localhost';

SHOW GRANTS FOR 'ayman'@'localhost';

USE banque_demo;
START TRANSACTION;
SELECT * FROM compte WHERE titulaire = 'ayman' FOR UPDATE;
commit;


-- pour les testes: 

START TRANSACTION; SELECT * FROM compte WHERE titulaire = 'ayman' FOR UPDATE;

-- dans la ssesion2: 


USE banque_demo;
SET SQL_SAFE_UPDATES = 0 ; 
UPDATE compte SET solde = solde + 100 WHERE titulaire = 'ayman';


-- pour les test : 

UPDATE compte SET solde = solde + 10 WHERE titulaire = 'ayman';


DROP TABLE banque_demo.compte;
 