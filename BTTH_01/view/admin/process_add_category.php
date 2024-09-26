<?php 
include '../../config/DBconn.php';

$error_message = ""; // Biến để lưu thông báo lỗi

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $ma_tloai = mysqli_real_escape_string($conn, $_POST['txtId']);
    $ten_tloai = mysqli_real_escape_string($conn, $_POST['txtCatName']);

    // Kiểm tra xem tên thể loại có rỗng không
    if (empty($ten_tloai)) {
        $error_message = "Tên thể loại không được để trống.";
    } else {
        $sql_edit = "UPDATE theloai SET ten_tloai = '$ten_tloai' WHERE ma_tloai = '$ma_tloai'";

        if (!mysqli_query($conn, $sql_edit)) {
            die("Lỗi cập nhật: " . mysqli_error($conn));
        }

        header("Location: category.php");
        exit(); // Thêm exit sau header để đảm bảo không có mã nào được thực hiện sau khi chuyển hướng.
    }
}
?>
