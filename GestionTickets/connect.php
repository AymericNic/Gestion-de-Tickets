<?php session_start(); ?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://kit.fontawesome.com/cd1eb87d27.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/style.css">
    <title>Login</title>
</head>
<body>
<?php 
require 'functions.php';
$username  = $_POST['username'];
$pass  = $_POST['password'];


$connexion = getBdd();

$requete = "SELECT * FROM commerciaux WHERE username = '" . $username . "' AND password = '" . $pass . "'";

$resultat = $connexion->query($requete);

if($resultat->rowCount() > 0){
    $user = $resultat->fetch();
    $_SESSION["username"] = $user["username"];
    header("Location: index1.php");
}else{
    echo '<div class="alert alert-danger" role="alert"> Cette identifiant ou mot de passe n\'existe pas! </div>
    
    <a href="login.php">Retour à la page de connexion</a>   ';
}
?>
<script src="js/bootstrap.js"></script>
</body>
</html>