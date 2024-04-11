SHOW DATABASES;
CREATE DATABASE IF NOT EXISTS Davide;

CREATE TABLE IF NOT EXISTS Davide.studente
(
	matricola VARCHAR(6) NOT NULL,
	nome VARCHAR(25) NOT NULL,
    cognome VARCHAR(25) NOT NULL,
    città_di_nascita VARCHAR(25) NOT NULL,
    città_di_residenza VARCHAR (25) NOT NULL,
    città_di_laurea VARCHAR(25) NOT NULL,
    PRIMARY KEY(matricola)
)ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS Davide.corso 
(
	codice VARCHAR(25) NOT NULL,
    nome VARCHAR(25) NOT NULL,
    ore_di_lezione INT NOT NULL,
    crediti_lezione INT NOT NULL,
    crediti_esercitazione INT NOT NULL,
    ore_esercitazione INT NOT NULL,
    docente VARCHAR (25) NOT NULL,
    PRIMARY KEY(codice)
)ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS Davide.esame
(
	matricola_studente VARCHAR(6) NOT NULL,
    codice_corso VARCHAR(10) NOT NULL,
    data_esame DATE NOT NULL,
    voto INT NOT NULL,
    CONSTRAINT fk_matricola
		FOREIGN KEY (matricola_studente)
        REFERENCES Davide.studente(matricola)
		ON UPDATE CASCADE
        ON DELETE RESTRICT,
    CONSTRAINT fk_codice
		FOREIGN KEY (codice_corso)
        REFERENCES Davide.corso(codice)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,
    PRIMARY KEY(matricola_studente,codice_corso)
)ENGINE=InnoDB;

-- ESERCIZIO AGGIUNGO COLUMNS
ALTER TABLE Davide.studente
	ADD COLUMN data_laurea DATE NULL DEFAULT NULL,
    ADD COLUMN titolo_tesi VARCHAR(120) NULL DEFAULT NULL;
ALTER TABLE Davide.esame
	ADD COLUMN lode boolean NULL DEFAULT false;
    
-- RINOMINO UNA TABLE
RENAME TABLE Davide.studente TO Davide.studente_iscritto;

-- ELIMINO LA TABELLA ESAME
DROP TABLE Davide.esame;

-- ELIMINO TUTTO
DROP SCHEMA Davide;

