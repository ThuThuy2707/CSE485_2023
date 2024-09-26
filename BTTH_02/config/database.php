<?php

class Database
{
    private $conn = null;

    public function __construct()
    {
        // B1. Kết nối DB Server
        try {
            $this->conn = new PDO('mysql:host=localhost;dbname=btth02_cse485;port=3306', 'root', '');
        } catch (PDOException $e) {
            echo $e->getMessage();
        }
    }

    public function getConn()
    {
        return $this->conn;
    }


}
?>