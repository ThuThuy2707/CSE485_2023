<?php 
    include '../../config/DBconn.php';

    if(isset($_GET['id'])){
        $ma_bviet = $_GET['id'];
    }

    $sql = "DELETE FROM baiviet WHERE ma_bviet = '$ma_bviet'";
    $conn->query($sql);
    header('Location: article.php');
?>