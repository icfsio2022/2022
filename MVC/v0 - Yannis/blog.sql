//
CREATE DATABASE IF NOT EXISTS blog CHARSET=utf8 COLLATE=utf8_general_ci;

USE blog;

CREATE TABLE Article(
   id_article INT,
   auteur VARCHAR(70),
   date_article DATETIME,
   titre VARCHAR(100) NOT NULL,
   contenu TEXT NOT NULL,
   PRIMARY KEY(id_article)
);

CREATE TABLE Commentaire(
   id_comentaire INT,
   date_commentaire DATETIME,
   auteur VARCHAR(70) NOT NULL,
   contenu TEXT NOT NULL,
   id_article INT NOT NULL,
   PRIMARY KEY(id_comentaire),
   FOREIGN KEY(id_article) REFERENCES Article(id_article)
);
