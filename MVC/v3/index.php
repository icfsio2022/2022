<?php
// Accès aux données
$bdd = new PDO('mysql:host=localhost;dbname=blog;charset=utf8', 'root', '');
$articles = $bdd->query('select id, date, titre, contenu from article order by id desc');

// Affichage
require './vueAccueil.php';