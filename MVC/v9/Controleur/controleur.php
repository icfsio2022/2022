<?php
require './Modele/modele.php';
// Affiche la liste de tous les articles du blog
function accueil()
{
    $articles = getArticles();
    require './Vue/vueAccueil.php';
}
// Affiche les détails sur un article
function article($idArticle)
{
    $article = getArticle($idArticle);
    $commentaires = getCommentaires($idArticle);
    require './Vue/vueArticle.php';
}
// Affiche une erreur
function erreur($msgErreur)
{
    require './Vue/vueErreur.php';
}