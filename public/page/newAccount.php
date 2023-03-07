<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../css/newAccount.css">
    <title>Criar conta</title>
</head>
<body>
    <section class="area-credentials">
        <div class="credentials">
            <div>
            <img src="../img/toppng.com-gear-icon-white-white-cogs-icon-384x369.png" alt="">
            </div>
            <form action="newAccount.php" method="post">
                <div class="first-form-block">
                    <p id="general-fail-alert">Insira credenciais válidas.</p>
                    <p id="password-fail-alert">As senhas não são iguais! Tente novamente.</p>
                    <input type="text" name="Email" placeholder="Seu e-mail" autofocus>
                    <input type="password" name="Password" placeholder="Sua senha">
                    <input type="password" name="ConfirmPassword" placeholder="Confirme sua senha">
                </div>
                <div class="second-form-block">
                    <input type="text" name="FirstName" placeholder="Seu primeiro nome">
                    <input type="text" name="LastName" placeholder="Seu último nome">
                    <select name="Gender" id="genderSelect" placeholder="Seu gênero">
                        <option value="M">Masculino</option>
                        <option value="F">Feminino</option>
                        <option value="NB">Não-binário</option>
                        <option value="">Prefiro não dizer</option>
                    </select>
                </div>
                <div class="buttons">
                    <input type="submit" value="Criar">
                    <a href="index.php">Voltar</a>
                </div>

            </form>

        </div>
    </section>
</body>
<?php 
if(isset($_POST["Email"]) && 
isset($_POST["Password"]) && 
isset($_POST["ConfirmPassword"]) &&
isset($_POST["FirstName"]) && 
isset($_POST["LastName"]) && 
isset($_POST["Gender"])){
    if($_POST["Password"] != $_POST["ConfirmPassword"]){
        echo '<script>document.getElementById("password-fail-alert").style.display = "block" </script>';
    }
    require_once("../../modules/dbauth/define_constants.php");
    require_once("../../modules/classes/Connection.php");
    include("../../modules/classes/UserClass.php");

    $Connection = Connection::getConnection();

    $_email = $_POST["Email"];
    $_password = $_POST["Password"];
    $_firstName = $_POST["FirstName"];
    $_lastName = $_POST["LastName"];
    $_gender = $_POST["Gender"];
    date_default_timezone_set("America/Sao_Paulo");
    $_modifiedDate = date("Y-m-d H:i:s");
    $newUser = new UserClass($Connection,$_email,$_password,$_firstName,$_lastName,$_gender,$_modifiedDate);
    if($newUser->CreateUser()){
        $Message = urlencode("true");
        header("Location: index.php?Message=".$Message);
    }
    else{
        echo "<script> console.log('um erro ocorreu'); </script>";
    }

}

?>
</html>