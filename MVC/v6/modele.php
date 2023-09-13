<?php
// Renvoie la liste de tous les articles, triés par identifiant décroissant
function getArticles()
{
    $bdd = getBdd();
    $articles = $bdd->query('select id, date, titre, contenu from article order by id desc');
    return $articles;
}

// Effectue la connexion à la BDD
// Instancie et renvoie l'objet PDO associé
function getBdd()
{
    $bdd = new PDO('mysql:host=localhost;dbname=blog;charset=utf8', 'root', '', array(PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION));
    return $bdd;
}