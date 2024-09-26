<?php 
include '../../config/DBconn.php';

$error_message = ""; // Biến để lưu thông báo lỗi

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $ma_tgia = mysqli_real_escape_string($conn, $_POST['txtId']);
    $ten_tgia = mysqli_real_escape_string($conn, $_POST['txtCatName']);

    // Kiểm tra xem tên thể loại có rỗng không
    if (empty($ten_tgia)) {
        $error_message = "Tên thể loại không được để trống.";
    } else {
        $sql_edit = "UPDATE tacgia SET ten_tgia = '$ten_tgia' WHERE ma_tgia = '$ma_tgia'";

        if (!mysqli_query($conn, $sql_edit)) {
            die("Lỗi cập nhật: " . mysqli_error($conn));
        }

        header("Location: author.php");
        exit(); // Thêm exit sau header để đảm bảo không có mã nào được thực hiện sau khi chuyển hướng.
    }
}
?>
