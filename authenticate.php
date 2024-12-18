<?php
if (session_status() === PHP_SESSION_NONE) {
    session_start();
} // Bắt buộc phải bắt đầu session trước khi sử dụng $_SESSION

// Kiểm tra nếu $_SESSION['auth'] không tồn tại hoặc là false
if (!isset($_SESSION['auth']) || $_SESSION['auth'] !== true) {
    redirect("DangNhap.php",'Đăng Nhập Để Tiếp Tục');
}
// Điều gì đó xảy ra nếu đã xác thực, bạn có thể đặt mã của bạn ở đây

?>