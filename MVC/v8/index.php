<?php
require('controleur.php');
try {
    if (isset($_GET['action'])) {
        if ($_GET['action'] == 'article') {
            if (isset($_GET['id'])) {
                $idArticle = intval($_GET['id']);
                if ($idArticle != 0)
                    article($idArticle);
                else
                    throw new Exception("Identifiant d'article non valide");
            } else
                throw new Exception("Identifiant d'article non défini");
        } else
            throw new Exception("Action non valide");
    } else {
        accueil(); // action par défaut
    }
} catch (Exception $e) {
    erreur($e->getMessage());
}