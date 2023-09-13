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

// Renvoie les informations sur un article
function getArticle($idArticle)
{
    $bdd = getBdd();
    $article = $bdd->prepare('select id, date, titre, contenu from article where id=?');
    $article->execute(array($idArticle));
    if ($article->rowCount() == 1)
        return $article->fetch(); // Accès à la première ligne de résultat
    else
        throw new Exception("Aucun article ne correspond à l'identifiant '$idArticle'");
}

// Renvoie la liste des commentaires associés à un article
function getCommentaires($idArticle)
{
    $bdd = getBdd();
    $commentaires = $bdd->prepare('select id, date, auteur, contenu from commentaire where id_article=?');
    $commentaires->execute(array($idArticle));
    return $commentaires;
}