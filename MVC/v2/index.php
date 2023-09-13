<!-- Accès aux données-->
<?php
$bdd = new PDO('mysql:host=localhost;dbname=blog;charset=utf8', 'root', '');
$articles = $bdd->query('select id, date, titre, contenu from article order by id desc');
?>

<!-- Affichage -->
<!doctype html>
<html lang="fr">

<head>
    <meta charset="utf-8" />
    <link rel="stylesheet" href="style.css" />
    <title>Mon Blog</title>
</head>

<body>
    <div id="global">
        <header>
            <a href="index.php">
                <h1 id="titreBlog">Mon Blog</h1>
            </a>
            <p>Je vous souhaite la bienvenue sur ce modeste blog.</p>
        </header>
        <div id="contenu">
            <?php foreach ($articles as $article): ?>
                <article>
                    <header>
                        <h1 class="titreArticle">
                            <?= $article['titre'] ?>
                        </h1>
                        <time>
                            <?= $article['date'] ?>
                        </time>
                    </header>
                    <p>
                        <?= $article['contenu'] ?>
                    </p>
                </article>
                <hr />
            <?php endforeach; ?>
        </div> <!-- #contenu -->
        <footer id="piedBlog">
            Blog réalisé avec PHP, HTML5 et CSS.
        </footer>
    </div> <!-- #global -->
</body>