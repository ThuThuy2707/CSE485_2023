<?php 
include '../../config/DBconn.php';

$error_message = ""; // Biến để lưu thông báo lỗi

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Kiểm tra và lấy dữ liệu từ $_POST
    $ma_bviet = isset($_POST['txtID']) ? mysqli_real_escape_string($conn, $_POST['txtID']) : '';
    $tieude = isset($_POST['txtTieuDe']) ? mysqli_real_escape_string($conn, $_POST['txtTieuDe']) : '';
    $ten_bhat = isset($_POST['txtTenBaiHat']) ? mysqli_real_escape_string($conn, $_POST['txtTenBaiHat']) : '';
    $ma_tloai = isset($_POST['txtMaTheLoai']) ? mysqli_real_escape_string($conn, $_POST['txtMaTheLoai']) : '';
    $tomtat = isset($_POST['txtTomTat']) ? mysqli_real_escape_string($conn, $_POST['txtTomTat']) : '';
    $noidung = isset($_POST['txtNoiDung']) ? mysqli_real_escape_string($conn, $_POST['txtNoiDung']) : '';
    $ma_tgia = isset($_POST['txtTacGia']) ? mysqli_real_escape_string($conn, $_POST['txtTacGia']) : '';
    $ngayviet = isset($_POST['txtNgayViet']) ? mysqli_real_escape_string($conn, $_POST['txtNgayViet']) : '';

    // Kiểm tra xem các trường có rỗng không
    if (empty($ma_bviet) || empty($tieude) || empty($ten_bhat) || empty($ma_tloai) || empty($tomtat) || empty($noidung) || empty($ma_tgia) || empty($ngayviet)) {
        $error_message = "Vui lòng nhập đầy đủ thông tin.";
    } else {
        // Kiểm tra xem ma_tgia có tồn tại trong bảng tacgia không
        $check_tacgia = "SELECT * FROM tacgia WHERE ma_tgia = '$ma_tgia'";
        $result_tacgia = mysqli_query($conn, $check_tacgia);

        if (mysqli_num_rows($result_tacgia) == 0) {
            $error_message = "Mã tác giả không tồn tại.";
        } else {
            // Thực hiện truy vấn cập nhật
            $sql_edit = "UPDATE baiviet SET tieude = '$tieude', ten_bhat = '$ten_bhat', ma_tloai = '$ma_tloai', tomtat = '$tomtat', noidung = '$noidung', ma_tgia = '$ma_tgia', ngayviet = '$ngayviet' WHERE ma_bviet = '$ma_bviet'";

            if (!mysqli_query($conn, $sql_edit)) {
                $error_message = "Lỗi cập nhật: " . mysqli_error($conn);
            } else {
                header("Location: article.php");
                exit(); // Dừng thực thi sau khi chuyển hướng
            }
        }
    }
}

// Đóng kết nối
$conn->close();
?>

<!-- Phần hiển thị thông báo lỗi -->
<?php if (!empty($error_message)) : ?>
    <div class="alert alert-danger"><?php echo $error_message; ?></div>
<?php endif; ?>
