-- Création d'un base de données
DROP DATABASE IF EXISTS biblio;
CREATE DATABASE biblio CHARACTER SET = utf8 COLLATE = utf8_general_ci;

-- Affichage des bases de données existantes
--SHOW DATABASES;

-- Connexion à une base de données
USE biblio;

-- Affichage des tables d'une bases de données
--SHOW TABLES;

-- Affichage du détail d'une table
--DESCRIBE [Table name];

-- Création de la table PAYS
CREATE TABLE pays (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(70) NOT NULL,
    iso CHAR(3) NOT NULL,
    UNIQUE(nom),
    UNIQUE(iso)
);

-- Création de la table adherent
CREATE TABLE adherent (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(70) NOT NULL,
    prenom VARCHAR(70),
    date_naissance DATE NOT NULL,
    date_adhesion DATE NOT NULL,
    telephone VARCHAR(20),
    mail VARCHAR(100),
    code_postal CHAR(20) NOT NULL,
    ville VARCHAR(70) NOT NULL,
    id_parent INT,
    id_pays INT,
    FOREIGN KEY (id_pays) REFERENCES pays(id) ON DELETE RESTRICT,
    FOREIGN KEY (id_parent) REFERENCES adherent(id) ON DELETE RESTRICT 
);
--ALTER TABLE adherent ADD FOREIGN KEY (id_pays) REFERENCES pays(id);
--ALTER TABLE adherent ADD FOREIGN KEY (id_parent) REFERENCES adherent(id);

-- Création de la table auteur
CREATE TABLE auteur (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(70) NOT NULL,
    prenom VARCHAR(70),
    date_naissance DATE,
    id_pays INT,
    FOREIGN KEY (id_pays) REFERENCES pays(id) ON DELETE RESTRICT
);

-- Création de la table editeur
CREATE TABLE editeur (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(70) NOT NULL,
    infos VARCHAR(255),
    id_pays INT,
    FOREIGN KEY (id_pays) REFERENCES pays(id) ON DELETE RESTRICT
);

CREATE TABLE media (
    id INT PRIMARY KEY AUTO_INCREMENT,
    titre VARCHAR(70) NOT NULL,
    description VARCHAR(255),
    date_edition DATE,
    id_editeur INT,
    FOREIGN KEY (id_editeur) REFERENCES editeur(id) ON DELETE RESTRICT
);

CREATE TABLE livre (
    id INT PRIMARY KEY AUTO_INCREMENT,
    ISBN VARCHAR(13) NOT NULL UNIQUE,
    nb_pages INT,
    id_media INT,
    FOREIGN KEY (id_media) REFERENCES media(id) ON DELETE RESTRICT
);

CREATE TABLE video (
    id INT PRIMARY KEY AUTO_INCREMENT,
    duree INT,
    id_media INT,
    FOREIGN KEY (id_media) REFERENCES media(id) ON DELETE RESTRICT
);

CREATE TABLE exemplaire (
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_media INT,
    dispo BOOLEAN NOT NULL DEFAULT 1,
    etat ENUM('Excellent','Bon','Moyen','Mauvais') NOT NULL,
    emplacement VARCHAR(255),
    date_acquisition DATE,
    total_prets INT,
    FOREIGN KEY (id_media) REFERENCES media(id) ON DELETE RESTRICT
);

CREATE TABLE pret (
    id_exemplaire INT NOT NULL,
    date_pret DATE NOT NULL,
    id_adherent INT NOT NULL,
    date_retour DATE NOT NULL,
    caution DECIMAL(12,2),
    PRIMARY KEY (id_exemplaire, date_pret),
    FOREIGN KEY (id_exemplaire) REFERENCES exemplaire(id) ON DELETE RESTRICT,
    FOREIGN KEY (id_adherent) REFERENCES adherent(id) ON DELETE RESTRICT
);

DELIMITER //
CREATE TRIGGER insert_pret
    AFTER INSERT ON pret
    FOR EACH ROW
BEGIN
    DECLARE nb INT;
    SELECT COUNT(*) INTO nb FROM pret WHERE id_exemplaire = NEW.id_exemplaire;
    UPDATE exemplaire SET total_prets = nb WHERE id = NEW.id_exemplaire;
END;
//

CREATE TRIGGER delete_pret
    AFTER DELETE ON pret
    FOR EACH ROW
BEGIN
    DECLARE nb INT;
    SELECT COUNT(*) INTO nb FROM pret WHERE id_exemplaire = OLD.id_exemplaire;
    UPDATE exemplaire SET total_prets = nb WHERE id = OLD.id_exemplaire;
END;
//

CREATE TRIGGER update_pret
    AFTER UPDATE ON pret
    FOR EACH ROW
BEGIN
    DECLARE nb INT;
    SELECT COUNT(*) INTO nb FROM pret WHERE id_exemplaire = NEW.id_exemplaire;
    UPDATE exemplaire SET total_prets = nb WHERE id = NEW.id_exemplaire;
END;
//

DELIMITER ;