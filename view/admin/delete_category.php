<?php 
    include '../../config/DBconn.php';

    if(isset($_GET['id'])){
        $ma_tloai = $_GET['id'];
    }

    $sql = "DELETE FROM theloai WHERE ma_tloai = '$ma_tloai'";
    $conn->query($sql);
    header('Location: category.php');
?>