<?php
include 'config/DBconn.php'; // Kết nối CSDL

$error_msg = "";
// Kiểm tra nếu người dùng gửi form
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $username = $_POST['username'];
    $user_password = $_POST['password'];

    // Kiểm tra giá trị POST
    if (empty($username) || empty($user_password)) {
        $error_msg = "Vui lòng nhập đầy đủ thông tin!";
    } else {
        // Truy vấn để tìm user theo username
        $sql = "SELECT * FROM user WHERE username = '$username' AND user_password = '$password'";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param("s", $username); // Đảm bảo số lượng biến và loại dữ liệu khớp

        if (!$stmt->execute()) {
            echo "Lỗi truy vấn: " . $stmt->error;
        } else {
            $result = $stmt->get_result();

            if ($result->num_rows > 0) {
                $user = $result->fetch_assoc();
                // So sánh mật khẩu (đã được mã hóa)
                if (password_verify($user_password, $user['user_password'])) {
                    // Nếu đăng nhập thành công, chuyển hướng sang trang khác
                    header("Location: login.php"); // Chuyển hướng sang 'dashboard.php'
                    exit(); // Dừng thực thi mã sau khi chuyển hướng
                } else {
                    $error_msg = "Sai mật khẩu!";
                }
            } else {
                $error_msg = "Không tìm thấy người dùng!";
            }
        }
        $stmt->close();
    }
}
header("Location: ../../admin/index.php");
$conn->close();
?>
