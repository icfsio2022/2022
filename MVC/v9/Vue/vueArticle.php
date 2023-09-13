<?php $titre = "Mon Blog - " . $article['titre']; ?>
<?php ob_start(); ?>
<article>
    <header>
        <h1 class="titreArticle"><?= $article['titre'] ?></h1>
        <time><?= $article['date'] ?></time>
    </header>
    <p><?= $article['contenu'] ?></p>
</article>
<hr />
<header>
    <h1 id="titreReponses">Réponses à <?= $article['titre'] ?></h1>
</header>
<?php foreach ($commentaires as $commentaire): ?>
    <p><?= $commentaire['auteur'] ?> dit : </p>
    <p><?= $commentaire['contenu'] ?></p>
<?php endforeach; ?>
<?php $contenu = ob_get_clean(); ?>
<?php require 'gabarit.php'; ?>