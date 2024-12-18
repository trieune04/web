<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đăng Nhập</title>
    <style>
        body {
            background-image: url('images/anh.jpg');
            background-size: cover;
            background-position: center;
            height: auto; 
            margin: 0; /* Loại bỏ margin mặc định của body */
            padding: 0; /* Loại bỏ padding mặc định của body */
        }
        .py-5 {
            padding-top: 5rem;
            padding-bottom: 5rem;
        }
        /* Thêm các kiểu CSS khác tại đây */
        .md-3 label {
            margin-bottom: 0.5rem; /* Khoảng cách giữa label và input */
        }
        .md-3 input[type="email"],
        .md-3 input[type="password"] {
            margin-bottom: 1rem; /* Khoảng cách giữa input và button */
        }
        .md-3 button {
            margin-top: 1rem; /* Khoảng cách giữa button và input */
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
    <div class="py-5 ">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-6">
                    <?php 
                        if(isset($_SESSION['message'])) {
                    ?>
                    <div class="alert alert-warning alert-dismissible fade show" role="alert">
                        <strong></strong> <?= $_SESSION['message'] ?>
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <?php
                        unset($_SESSION['message']);
                    }
                    ?>
                    <div class="card  ">
                        <div class="card-header">
                            <h4>Đăng Nhập</h4>
                        </div>
                        <div class="card-body">
                            <form action="functions/authcode.php" method="POST">
                                <div class="md-3">
                                    <label for="exampleInputEmail1">Email</label>
                                    <input type="email" name="email" class="form-control" placeholder="Nhập Email">
                                </div>
                                <div class="md-3">
                                    <label for="exampleInputPassword1">Mật Khẩu</label>
                                    <input type="password" name="password" class="form-control" placeholder="Nhập Mật Khẩu">
                                </div>
                                <button type="submit" name="dangnhap" class="btn btn-primary md-3">Đăng Nhập</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
   
</body>
</html>
<?php include('includes/footer.php'); ?>
