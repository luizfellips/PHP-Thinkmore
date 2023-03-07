<?php

class UserClass
{
    private $pdo;
    public $email;
    public $password;
    public $firstName;
    public $lastName;
    public $gender;

    public $modifiedDate;

    function __construct(PDO $pdo, $email, $password, $firstName, $lastName, $gender, $modifiedDate){
        $this->pdo = $pdo;
        $this->email = $email;
        $this->firstName = $firstName;
        $this->lastName = $lastName;
        $this->gender = $gender;
        $this->modifiedDate = $modifiedDate;
        $this->password = $this->SetHash($password);
    }

    public function SetHash($string){
        return $this->password = sha1($string);
    }

    public function CreateUser(){
        $sql = "EXEC RegisterTest :email,:password,:firstName,:lastName,:gender,:modifiedDate";
        $stmt = $this->pdo->prepare($sql);
        $stmt->bindValue(':email',$this->email);
        $stmt->bindValue(':password',$this->password);
        $stmt->bindValue(':firstName',$this->firstName);
        $stmt->bindValue(':lastName',$this->lastName);
        $stmt->bindValue(':gender',$this->gender);
        $stmt->bindValue(':modifiedDate',$this->modifiedDate);
        $stmt->execute();
        if($stmt){
            return true;
        }
        else{
            return false;
        }

    }


}
?>