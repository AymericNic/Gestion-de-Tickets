
<?php 
session_start();
require 'functions.php'; ?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://kit.fontawesome.com/cd1eb87d27.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/style.css">
    <title>Taches</title>
</head>
<body>
    <?php if(isset($_SESSION['username'])) : ?>
        <a href="logout.php">Déconnexion</a>
        <?php 
            $connexion = getBdd();
            //$connexion->query("insert into taches values (null,'Test de l application sur plusieurs niveaux','EA','A finir avant le 25 Février')");
            $resultat = $connexion->query("SELECT * FROM taches");
            $taches_tab = $resultat->fetchAll(PDO::FETCH_ASSOC);
        ?>
        <h1>Bonjour <?= $_SESSION['username'] ?>, Voici la liste des taches !</h1>
        <table class="table">
            <thead>
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">Nom</th>
                    <th scope="col">Etat</th>
                    <th scope="col">Actions</th>
                </tr>
            </thead>
            <tbody>
                <?php foreach($taches_tab as $tache) : ?>  
                    <tr>
                        <th><?= $tache["id"] ?></th>
                        <td><?= $tache["nom"] ?></td>
                        <td><?= displayEtat($tache['etat']); ?></td>
                        <td><?= displayActions($tache["id"], $tache["etat"]); ?><td>
                    </tr>
                <?php endforeach; ?>
            </tbody>
        </table>
    <?php else :  ?>
        <div class="alert alert-danger" role="alert">
            Vous n'etes pas connecté !
            <a href="login.php">Connectez vous</a>
        </div>

    <?php endif;  ?>
    <script src="js/bootstrap.js"></script>
</body>
</html>