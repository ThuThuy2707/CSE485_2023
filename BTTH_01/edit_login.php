<?php
include 'config/DBconn.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Kiểm tra xem các trường đã được nhập hay chưa
    if (!empty($_POST['username']) && !empty($_POST['password'])) {
        $username = $_POST['username'];
        $user_password = $_POST['password'];

        $sql = "SELECT * FROM user WHERE username = '$username'";
        $result = $conn->query($sql)->fetch_assoc();

        if($result['user_password'] == $user_password){
            header('Location: view/admin/index.php');
            exit();
        }
        else{
            header('Location: loginn.php?message=error1');
        }
    } else {
        header('Location: loginn.php?message=error2');
    }
}
?>
