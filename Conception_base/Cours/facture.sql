DROP DATABASE IF EXISTS facture;
CREATE DATABASE facture;
USE facture;
CREATE TABLE facture(
    id INT PRIMARY KEY AUTO_INCREMENT,
    date DATE,
    total DECIMAL(12,8)
);
CREATE TABLE article(
    id INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(70),
    prix DECIMAL(12,8)
);
CREATE TABLE ligne(
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_facture INT,
    id_article INT,
    quantite INT,
    FOREIGN KEY (id_facture) REFERENCES facture(id),    
    FOREIGN KEY (id_article) REFERENCES article(id)
);

DELIMITER //
CREATE TRIGGER insert_ligne
    AFTER INSERT ON ligne
    FOR EACH ROW
BEGIN
    UPDATE facture SET total = total + (NEW.quantite*(SELECT prix FROM article WHERE id=NEW.id_article))
    WHERE id = NEW.id_facture;
END;
// DELIMITER;