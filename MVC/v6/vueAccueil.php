<?php $titre = 'Mon Blog'; ?>
<?php ob_start(); ?>
<?php foreach ($articles as $article): ?>
    <article>
        <header>
            <h1 class="titreArticle"><?= $article['titre'] ?></h1>
            <time><?= $article['date'] ?></time>
        </header>
        <p><?= $article['contenu'] ?></p>
    </article>
    <hr />
<?php endforeach; ?>
<?php $contenu = ob_get_clean(); ?>
<?php require 'gabarit.php'; ?>