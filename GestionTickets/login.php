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
    <h1>Connexion</h1>
    <form method="POST" action="connect.php">
        <div class="mb-3">
            <label for="username" class="form-label">Identifiant</label>
            
            <input type="text" class="form-control" id="username" aria-describedby="infoUsername" name="username">

            <div id="infoUsername" class="form-text">Identifiant de connexion.</div>
        </div>
        <div class="mb-3">
            <label for="pass" class="form-label">Mot de passe</label>
            <input type="password" class="form-control" name="password">
        </div>
        <button type="submit" class="btn btn-primary">Se connecter</button>
        
    </form>
</body> 
</html>