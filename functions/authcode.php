<?php
session_start();
include('../config/dbcon.php');
include('myfunctions.php');
if (isset($_POST['dangky'])) {
    $name = mysqli_real_escape_string($con, $_POST['name']);
    $phone = mysqli_real_escape_string($con, $_POST['phone']);
    $email = mysqli_real_escape_string($con, $_POST['email']);
    $password = mysqli_real_escape_string($con, $_POST['password']);
    $cpassword = mysqli_real_escape_string($con, $_POST['cpassword']);

    // Kiểm tra xem email đã tồn tại trong cơ sở dữ liệu chưa
    $check_email_query = "SELECT * FROM users WHERE email='$email'";
    $check_email_result = mysqli_query($con, $check_email_query);
    if (mysqli_num_rows($check_email_result) > 0) {
        $_SESSION['message'] = "Email đã được sử dụng. Vui lòng chọn email khác.";
        header("Location:../DangKy.php");
        exit();
    }

    if ($password == $cpassword) {
        $insert_query = "INSERT INTO users (name, phone, email, password, role_as) VALUES ('$name', '$phone', '$email', '$password', 1)";
        $insert_query_run = mysqli_query($con, $insert_query);
        if ($insert_query_run) {
            $_SESSION['message'] = "Đăng Ký Thành Công";
            header("Location:../DangNhap.php");
            exit();
        } else {
            $_SESSION["message"] = "Đăng Ký Thất Bại";
            header("Location:../DangKy.php");
            exit();
        }
    } else {
        $_SESSION['message'] = "Mật Khẩu Sai";
        header("Location:../DangKy.php");
        exit();
    }
}
else if(isset($_POST['dangnhap'])){
    $email = mysqli_real_escape_string($con, $_POST['email']);
    $password = mysqli_real_escape_string($con, $_POST['password']);

    // Thực hiện truy vấn để kiểm tra thông tin đăng nhập
    $login_query = "SELECT * FROM users WHERE email = '$email' AND password = '$password'";
    $login_query_run = mysqli_query($con, $login_query);

    // Kiểm tra xem có bản ghi nào khớp với thông tin đăng nhập không
    if(mysqli_num_rows($login_query_run) > 0){
        $_SESSION['auth'] = true;
        $userdata = mysqli_fetch_array($login_query_run);
        $userid =$userdata['id'];
        $username = $userdata['name'];
        $useremail = $userdata['email'];
        $role_as = $userdata['role_as'];
        
        $_SESSION['auth_user']=[
            'user_id' => $userid,
            'name'=>$username,
            'email'=>$useremail
        ];
      
        $_SESSION['role_as']=$role_as;
        if($role_as == 0){
            $_SESSION['message']="Admin";
        header("Location:../admin/index.php");
        }
        else{
            // $_SESSION['message']="";
            header("Location:../index.php");
        }
       
    }
    else{
        // Đăng nhập thất bại, thông báo và chuyển hướng lại trang đăng nhập
        $_SESSION['message'] = "Đăng Nhập Thất Bại";
        header("Location:../DangNhap.php");
        exit();
    }
}



?>
