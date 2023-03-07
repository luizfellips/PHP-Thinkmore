<?php

class LoginClass
{
    private $pdo;
    public $user;
    public $password;

    function __construct(PDO $pdo, $email, $password){
        $this->pdo = $pdo;
        $this->user = $email;
        $this->password = $this->SetHash($password);
    }

    public function SetHash($string){
        return $this->password = sha1($string);
    }

    public function authenticate(){
        $sqlstatement = "select t1.EmailAddress, t2.PasswordHash 
        from Person.EmailAddress as t1
        inner join Bank.Credentials t2 on t1.EntityID = t2.EntityID
        where t1.EmailAddress = :email and t2.PasswordHash = :password;
        ";
        $stmt = $this->pdo->prepare($sqlstatement);
        $stmt->bindValue(':email', $this->user);
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