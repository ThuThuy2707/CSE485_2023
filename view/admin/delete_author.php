<?php 
    include '../../config/DBconn.php';

    if(isset($_GET['id'])){
        $ma_tgia = $_GET['id'];
    }

    // Kiểm tra xem mã tác giả có tồn tại trong bảng bài viết hay không
    $check_sql = "SELECT * FROM baiviet WHERE ma_tgia = '$ma_tgia'";
    $result = $conn->query($check_sql);

    if ($result->num_rows > 0) {
        // Chuyển hướng lại author.php với thông báo lỗi
        header('Location: author.php?message=error');
    } else {
        // Nếu không có bài viết liên kết, thực hiện xóa tác giả
        $sql = "DELETE FROM tacgia WHERE ma_tgia = '$ma_tgia'";
        $conn->query($sql);
        header('Location: author.php?message=success');
    }

    $conn->close();
?>
