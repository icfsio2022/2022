<?php
// Renvoie la liste de tous les articles, triés par identifiant décroissant
function getArticles()
{
    $bdd = new PDO('mysql:host=localhost;dbname=blog;charset=utf8', 'root', '');
    $articles = $bdd->query('select id, date, titre, contenu from article order by id desc');
    return $articles;
}