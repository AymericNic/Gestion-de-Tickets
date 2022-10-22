<?php 
require 'functions.php';
// Récuperation des valeurs depuis l'url
$id = $_GET["id"]; //2
$etat = $_GET["etat"]; //EC

$connexion = getBdd();
$requete = "UPDATE taches SET etat = '" . $etat . "' WHERE id = $id";
//UPDATE taches SET etat = 'EA' WHERE id='2' -> VRAI
//UPDATE taches SET etat = EA WHERE id = 2 -> FAUX

$resultat = $connexion->query($requete);

if($resultat){
    header("Location: index1.php");
    exit;
}else{
    echo "Impossible de changer l'état";
}