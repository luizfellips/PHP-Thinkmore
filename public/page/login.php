
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
            <form action="login.php" method="POST">
                <p id="fail-alert"> Credenciais incorretas, tente novamente. </p>
                <input type="text" name="Username" placeholder="Nome de usuário" autofocus>
                <input type="password" name="Password" placeholder="Sua senha">
                <input type="submit" value="Entrar">
            </form>
            <p>Ainda não criou uma conta? <a href="#">Criar conta</a></p>
        </div>
    </section>
</body>
<?php

if(isset($_POST["Username"]) && isset($_POST["Password"])){
   require_once("../../modules/dbauth/define_constants.php");
   require_once("../../modules/classes/Connection.php");
   include("../../modules/classes/LoginClass.php");

   try{

      $Connection = Connection::getConnection();
      $userCredentials = new LoginClass($Connection,$_POST["Username"],$_POST["Password"]);
      if($userCredentials->authenticate()){
         header("Location: index.php");
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