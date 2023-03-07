
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../css/login.css">
    <title>Login</title>
    
</head>
<body>
    <section class="area-login">
        <div class="login">
            <div>
                <img src="../img/toppng.com-gear-icon-white-white-cogs-icon-384x369.png" alt="">
            </div>
            <form action="index.php" method="POST">
                <p id="success-message"> Conta criada com sucesso! </p>
                <p id="fail-alert"> Credenciais incorretas, tente novamente. </p>
                <input type="text" name="Username" placeholder="Nome de usuário" required autofocus>
                <input type="password" name="Password" placeholder="Sua senha" required>
                <input type="submit" value="Entrar">
            </form>
            <p>Ainda não criou uma conta? <a href="newAccount.php">Criar conta</a></p>
        </div>
    </section>
</body>
<?php
if(isset($_GET['userCreated'])){
    echo '<script>
        document.getElementById("success-message").style.display = "block";
         document.getElementsByClassName("login")[0].style.height = "360px";
    </script>';
}

if(isset($_POST["Username"]) && isset($_POST["Password"])){
   require_once("../../modules/dbauth/define_constants.php");
   require_once("../../modules/dbauth/Connection.php");
   include("../../modules/classes/LoginClass.php");

   try{

      $Connection = Connection::getConnection();
      $userCredentials = new LoginClass($Connection,$_POST["Username"],$_POST["Password"]);
      if($userCredentials->authenticate()){
         header("Location: menu.php");
         exit;
      }
      else{
         echo '<script>
         
         document.getElementById("fail-alert").style.display = "block";
         document.getElementsByClassName("login")[0].style.height = "360px";


         </script>';
      }
      
}

   catch(Exception $e){

      echo $e->getMessage();
      exit;

   }
}
?>

</html>