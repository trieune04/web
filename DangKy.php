<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đăng Ký</title>
    <style>
        body {
    background-image: url('images/anh.jpg');
    background-size: cover;
    background-position: center;
    height: auto; 
}
    </style>
    <!-- Liên kết đến file CSS của bạn -->
    <link rel="stylesheet" href="assets/css/style.css">
</head>
<body>
    <?php 
        session_start();
        include('includes/header.php');
    ?>
    <div class="py-5">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-6">
                    <?php 
                        if(isset($_SESSION['message'])) {
                    ?>
                    <div class="alert alert-warning alert-dismissible fade show" role="alert">
                        <strong>Lỗi!</strong> <?= $_SESSION['message'] ?>
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <?php
                        unset($_SESSION['message']);
                    }
                    ?>
                    <div class="card">
                        <div class="card-header">
                            <h4>Đăng Ký</h4>
                        </div>
                        <div class="card-body">
                            <form action="functions/authcode.php" method="POST">
                                <div class="md-3">
                                    <label class="form-lable">Họ Tên</label>
                                    <input type="text" name="name" class="form-control" placeholder="Nhập Họ Tên">
                                </div>
                                <div class="md-3">
                                    <label class="form-lable">Số Điện Thoại</label>
                                    <input type="number" name="sdt" class="form-control" placeholder="Nhập SĐT">
                                </div>
                                <div class="md-3">
                                    <label for="exampleInputEmail1">Email</label>
                                    <input type="email" name="email" class="form-control" placeholder="Nhập Email">
                                </div>
                                <div class="md-3">
                                    <label for="exampleInputPassword1">Mật Khẩu</label>
                                    <input type="password" name="password" class="form-control" placeholder="Nhập Mật Khẩu">
                                </div>
                                <div class="md-3">
                                    <label class="form-lable">Nhập Lại Mật Khẩu</label>
                                    <input type="password" name="cpassword" class="form-control" placeholder="Xác Nhận Mật Khẩu">
                                </div>
                                <div class="col-md-11" style="margin-top: 10px;">
                                <button type="submit" name="dangky" class="btn btn-primary md-3">Đăng Ký</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <?php include('includes/footer.php'); ?>
</body>
</html>