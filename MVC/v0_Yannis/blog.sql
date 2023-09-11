//
CREATE DATABASE IF NOT EXISTS blog CHARSET=utf8 COLLATE=utf8_general_ci;

USE blog;

CREATE TABLE Article(
   id INT,
   auteur VARCHAR(70),
   date DATETIME,
   titre VARCHAR(100) NOT NULL,
   contenu TEXT NOT NULL,
   PRIMARY KEY(id_article)
);

CREATE TABLE Commentaire(
   id INT,
   date DATETIME,
   auteur VARCHAR(70) NOT NULL,
   contenu TEXT NOT NULL,
   id_article INT NOT NULL,
   PRIMARY KEY(id_comentaire),
   FOREIGN KEY(id_article) REFERENCES Article(id_article)
);
