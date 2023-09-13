<?php
// Accès aux données
require './modele.php';
try {
    $articles = getArticles();
    // Affichage
    require './vueAccueil.php';
} 
catch (Exception $e) {
    $msgErreur = $e->getMessage();
    require 'vueErreur.php';
}