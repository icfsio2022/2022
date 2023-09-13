<?php
// Accès aux données
require './modele.php';
$articles = getArticles();

// Affichage
require './vueAccueil.php';