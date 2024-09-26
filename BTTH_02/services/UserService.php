<?php
require_once('config/database.php');
require_once('models/User.php');
class UserService
{

    public function getAll($sql)
    {
        $database = new Database;
        $pdo = $database->getConn();   //khởi tạo đối tượng PDO
        $stmt = $pdo->query($sql);

        $users = [];
        while ($row = $stmt->fetch()) {
            $user = new User($row['id'], $row['username'], $row['password']);
            array_push($users, $user);
        }
        $pdo = null; //đóng kết nối
        return $users;
    }

    public function getById($arguments)
    {
        $database = new Database;
        $pdo = $database->getConn();   //khởi tạo đối tượng PDO
        $stmt = $pdo->prepare('SELECT * FROM users WHERE id = :id');
        $stmt->execute($arguments);

        $row = $stmt->fetch();
        $user = new User($row['id'], $row['username'], $row['password']);

        $pdo = null; //đóng kết nối
        return $user;
    }
}
?>