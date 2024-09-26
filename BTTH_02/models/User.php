<?php
class User
{
    private $id;
    private $username;
    private $password;

    public function __construct($id, $username, $password)
    {
        $this->id = $id;
        $this->username = $username;
        $this->password = $password;
    }

    public function getID()
    {
        return $this->id;
    }
    public function getUserName()
    {
        return $this->username;
    }
    public function setUserName($username_new)
    {
        $this->username = $username_new;
    }
    public function getPassWord()
    {
        return $this->password;
    }
    public function setPassWord($password_new)
    {
        $this->password = $password_new;
    }

}
?>