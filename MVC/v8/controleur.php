<?php
require 'modele.php';
// Affiche la liste de tous les articles du blog
function accueil()
{
    $articles = getArticles();
    require 'vueAccueil.php';
}
// Affiche les détails sur un article
function article($idArticle)
{
    $article = getArticle($idArticle);
    $commentaires = getCommentaires($idArticle);
    require 'vueArticle.php';
}
// Affiche une erreur
function erreur($msgErreur)
{
    require 'vueErreur.php';
}