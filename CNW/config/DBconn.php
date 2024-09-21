<?php
// Thông tin kết nối MySQL
$servername = "localhost";    // Tên server (mặc định là localhost)
$username = "root";           // Tên người dùng MySQL (mặc định là root)
$password = "";               // Mật khẩu MySQL (mặc định là rỗng)
$dbname = "my_database";      // Tên cơ sở dữ liệu bạn đã tạo

// Tạo kết nối
$conn = new mysqli($servername, $username, $password, $dbname);

// Kiểm tra kết nối
if ($conn->connect_error) {
    die("Kết nối thất bại: " . $conn->connect_error);
}
echo "Kết nối thành công!";
?>