<?php
if (session_status() === PHP_SESSION_NONE) {
    session_start();
}
include('../config/dbcon.php');

if (isset($_SESSION['auth'])) {
    if (isset($_POST['scope'])) {
        $scope = $_POST['scope'];
        
        switch ($scope) {
            case "add":
                $prod_id = $_POST['prod_id'];
                $prod_qty = $_POST['prod_qty'];
                $user_id = $_SESSION['auth_user']['user_id'];

                // Kiểm tra sản phẩm có trong giỏ hàng hay chưa
                $check_existing_cart = "SELECT * FROM carts WHERE prod_id ='$prod_id' AND user_id = '$user_id'";
                $check_existing_cart_run = mysqli_query($con, $check_existing_cart);
                
                if (mysqli_num_rows($check_existing_cart_run) > 0) {
                    // Sản phẩm đã có trong giỏ hàng, cập nhật số lượng
                    $update_qty_query = "UPDATE carts SET prod_qty = prod_qty + '$prod_qty' WHERE prod_id = '$prod_id' AND user_id = '$user_id'";
                    $update_qty_run = mysqli_query($con, $update_qty_query);
                    if ($update_qty_run) {
                        echo "existing"; // Đã cập nhật số lượng sản phẩm trong giỏ hàng
                    } else {
                        echo 500; // Lỗi cập nhật số lượng
                    }
                } else {
                    // Sản phẩm chưa có trong giỏ hàng, thêm mới
                    $insert_query = "INSERT INTO carts (user_id, prod_id, prod_qty) VALUES ('$user_id', '$prod_id', '$prod_qty')";
                    $insert_query_run = mysqli_query($con, $insert_query);
                    if ($insert_query_run) {
                        echo 201; // Sản phẩm đã được thêm vào giỏ hàng
                    } else {
                        echo 500; // Lỗi thêm sản phẩm vào giỏ hàng
                    }
                }
                break;

            case "update":
                $prod_id = $_POST['prod_id'];
                $prod_qty = $_POST['prod_qty'];
                $user_id = $_SESSION['auth_user']['user_id'];

                // Kiểm tra sản phẩm có trong giỏ hàng hay chưa
                $check_existing_cart = "SELECT * FROM carts WHERE prod_id ='$prod_id' AND user_id = '$user_id'";
                $check_existing_cart_run = mysqli_query($con, $check_existing_cart);
                if (mysqli_num_rows($check_existing_cart_run) > 0) {
                    // Cập nhật số lượng sản phẩm
                    $update_query = "UPDATE carts SET prod_qty ='$prod_qty' WHERE prod_id ='$prod_id' AND user_id = '$user_id'";
                    $update_query_run = mysqli_query($con, $update_query);
                    if ($update_query_run) {
                        echo 200; // Thành công
                    } else {
                        echo 500; // Lỗi
                    }
                } else {
                    echo "loi"; // Sản phẩm không tồn tại trong giỏ hàng
                }
                break;

            case "delete":
                $cart_id = $_POST['cart_id'];
                $user_id = $_SESSION['auth_user']['user_id'];

                // Kiểm tra sản phẩm trong giỏ hàng
                $check_existing_cart = "SELECT * FROM carts WHERE id ='$cart_id' AND user_id = '$user_id'";
                $check_existing_cart_run = mysqli_query($con, $check_existing_cart);
                if (mysqli_num_rows($check_existing_cart_run) > 0) {
                    // Xóa sản phẩm khỏi giỏ hàng
                    $delete_query = "DELETE FROM carts WHERE id = '$cart_id'";
                    $delete_query_run = mysqli_query($con, $delete_query);
                    if ($delete_query_run) {
                        echo 200; // Thành công
                    } else {
                        echo "loi"; // Lỗi xóa sản phẩm
                    }
                } else {
                    echo "loi"; // Sản phẩm không tồn tại trong giỏ hàng
                }
                break;

            default:
                echo 500; // Lỗi không xác định
        }
    }
} else {
    echo 401; // Chưa đăng nhập
}
?>
