<?php 
    include '../../config/DBconn.php';

    if(isset($_GET['id'])){
        $ma_tloai = $_GET['id'];
    }

    // Kiểm tra xem mã tác giả có tồn tại trong bảng bài viết hay không
    $check_sql = "SELECT * FROM baiviet WHERE ma_tloai = '$ma_tloai'";
    $result = $conn->query($check_sql);

    if ($result->num_rows > 0) {
        // Chuyển hướng lại author.php với thông báo lỗi
        header('Location: category.php?message=error');
    } else {
        // Nếu không có bài viết liên kết, thực hiện xóa tác giả
        $sql = "DELETE FROM theloai WHERE ma_tloai = '$ma_tloai'";
        $conn->query($sql);
        header('Location: category.php?message=success');
    }

    $conn->close();
?>
