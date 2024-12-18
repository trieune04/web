<?php

include('../functions/myfunctions.php');
if (isset($_SESSION['auth']))
{
    // Check if 'role_as' key exists in $_SESSION array
    if(isset($_SESSION['role_as']) && $_SESSION['role_as']== 1)
    {
        redirect("../index.php","Bạn Không Có Quyền Truy Cập Trang Admin");
    }
    }
else {
    redirect("../DangNhap.php","Tiếp Tục Đăng Nhập");
}
?>
