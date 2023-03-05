<?php

class LoginClass
{
    private $pdo;
    public $user;
    public $password;

    function __construct(PDO $pdo, $user, $password){
        $this->pdo = $pdo;
        $this->user = $user;
        $this->password = $this->SetHash($password);
    }

    public function SetHash($string){
        return $this->password = sha1($string);
    }

    public function authenticate(){
        $sqlstatement = "SELECT * FROM Usuario WHERE Login = :login AND password = :password";
        $stmt = $this->pdo->prepare($sqlstatement);
        $stmt->bindValue(':login', $this->user);
        $stmt->bindValue(':password', $this->password);
        $stmt->execute();
        $this->user = $stmt->fetch(PDO::FETCH_ASSOC);

        if ($this->user) {
            return true;
        } 
        else {
            return false;
        }
    }
}
?>