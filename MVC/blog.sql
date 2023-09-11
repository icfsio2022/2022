-- Création de la base de données
DROP DATABASE IF EXISTS blog;
CREATE DATABASE blog CHARACTER SET utf8 COLLATE utf8_general_ci;

-- Connexion à la base de données
USE blog;

-- Création de la table "article"
DROP TABLE IF EXISTS article;
CREATE TABLE ARTICLE(
   id INT NOT NULL AUTO_INCREMENT,
   titre VARCHAR(50) NOT NULL,
   date DATETIME NOT NULL,
   contenu TEXT NOT NULL,
   PRIMARY KEY(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Création de la table "commentaire"
DROP TABLE IF EXISTS commentaire;
CREATE TABLE commentaire(
   id INT NOT NULL AUTO_INCREMENT,
   date DATETIME NOT NULL,
   auteur VARCHAR(50) NOT NULL,
   contenu TEXT NOT NULL,
   id_article INT NOT NULL,
   PRIMARY KEY(id),
   FOREIGN KEY(id_article) REFERENCES ARTICLE(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Insertion de données dans la table "article"
INSERT INTO article(date, titre, contenu) VALUES
(NOW(), 'Premier article', 'Bonjour monde ! Ceci est le premier article sur mon blog.');
INSERT INTO article(date, titre, contenu) VALUES
(NOW(), 'Au travail', 'Il faut enrichir ce blog dès maintenant.');

-- Insertion de données dans la table "commentaire"
INSERT INTO commentaire(date, auteur, contenu, id_article) values
(NOW(), 'A. Nonyme', 'Bravo pour ce début', 1);
INSERT INTO commentaire(date, auteur, contenu, id_article) values
(NOW(), 'Moi', 'Merci ! Je vais continuer sur ma lancée', 1);
