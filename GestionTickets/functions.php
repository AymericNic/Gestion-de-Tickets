<?php 
/**
 * @return PDO Objet de connexion à la BD
 */

function getBdd() {
    $host="127.0.0.1";
    $bdd = "roille";
    $user = "root";
    $mdp = "";

    return new PDO("mysql:host=$host;dbname=$bdd;charset=utf8",
        "$user", "$mdp", array(PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION));
}
function displayActions($id, $etat){
    $html = '';
    if($etat != 'EA') {
        $html .= "<a href='changeEtat.php?etat=EA&id=" . $id . "'><i class='ico fas fa-pause-circle'></i></a>";
    }

    if($etat != 'EC') {
        $html .= "<a href='changeEtat.php?etat=EC&id=" . $id . "'><i class='ico fas fa-arrow-circle-right'></i></a>";
    }

    if($etat != 'T') {
        $html .= "<a href='changeEtat.php?etat=T&id=" . $id . "'><i class='ico fas fa-check-circle'></i></a>";
    }
    return $html;
}
function displayEtat($etat){
    $html = '';
    switch ($etat) {
        case 'EA':
            $html = "<span class='badge rounded-pill bg-primary'>En attente</span>";
            break;
        case 'EC':
            $html = "<span class='badge rounded-pill bg-warning'>En cours</span>";
            break;
        case 'T':
            $html = "<span class='badge rounded-pill bg-success'>Terminé</span>";
            break;
    }
    return $html;
}