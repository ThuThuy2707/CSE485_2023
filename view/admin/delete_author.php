<?php 
    include '../../config/DBconn.php';

    if(isset($_GET['id'])){
        $ma_tgia = $_GET['id'];
    }

    $sql = "DELETE FROM tacgia WHERE ma_tgia = '$ma_tgia'";
    $conn->query($sql);
    header('Location: author.php');
?>