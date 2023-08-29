-- Création d'un base de données
CREATE DATABASE IF NOT EXISTS biblio CHARACTER SET = utf8 COLLATE = utf8_general_ci;

-- Affichage des bases de données existantes
SHOW DATABASES;

-- Connexion à une base de données
USE biblio;

-- Affichage des tables d'une bases de données
SHOW TABLES;

-- Affichage du détail d'une table
--DESCRIBE [Table name];

-- Création de la table PAYS
--DROP TABLE IF EXISTS pays;
CREATE TABLE pays (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(70) NOT NULL,
    iso CHAR(3) NOT NULL,
    UNIQUE(nom),
    UNIQUE(iso)
);

-- Création de la table AUTEUR
DROP TABLE IF EXISTS adherent;
CREATE TABLE adherent (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(70) NOT NULL,
    prenom VARCHAR(70),
    date_naissance DATE NOT NULL,
    date_adhesion DATE NOT NULL,
    telephone VARCHAR(20),
    mail VARCHAR(100),
    code_postal CHAR(5) NOT NULL,
    ville VARCHAR(70) NOT NULL,
    id_parent INT,
    id_pays INT,
    FOREIGN KEY (id_pays) REFERENCES pays(id),
    FOREIGN KEY (id_parent) REFERENCES adherent(id)
);
--ALTER TABLE adherent ADD FOREIGN KEY (id_pays) REFERENCES pays(id);
--ALTER TABLE adherent ADD FOREIGN KEY (id_parent) REFERENCES adherent(id);