<?php 
    include('functions/userfunctions.php');
    include('includes/header.php'); 
    include('authenticate.php'); 
?>
<div class="py-3 bg-primary">
    <div class="container">
        <h6 class="text-white">
            <a href="index.php" class="text-white">Trang Chủ/</a>
            <a href="checkout.php" class="text-white">Thanh Toán</a>
        </h6>
    </div>
</div>
<div class="py-5">
    <div class="container">
        <div class="card">
        <div class="card-body shadow">
            <form action="functions/placeorder.php" method="POST">
            <div class="row">
                <div class="col-md-7">
                <h5>Chi Tiết</h5><hr>
                <div class="row">
                <div class="col-md-6 mb-3">
                    <label class="fw-bold">Tên</label>
                    <input type="text" Name="name" required placeholder="Họ và Tên"class="form-control">
                </div>
                <div class="col-md-6 mb-3">
                    <label class="fw-bold">Email</label>
                    <input type="email" Name="email"required placeholder="Email"class="form-control">
                </div>
                <div class="col-md-6 mb-3">
                    <label class="fw-bold">SĐT</label>
                    <input type="text" Name="phone"required placeholder="Số Điện Thoại"class="form-control">
                </div>
                <div class="col-md-6 mb-3">
                    <label class="fw-bold">Mã Xác Nhận</label>
                    <input type="text" Name="pincode"required placeholder="Nhập Mã"class="form-control">
                </div>
                <div class="col-md-12 mb-3">
                    <label class="fw-bold">Địa Chỉ</label>
                    <textarea  Name="address"required class="form-control "rows="5"></textarea>
                </div>
                </div>
                </div>
                    <div class="col-md-5">
                        <h5>Chi Tiết Đơn Hàng</h5><hr>
                        <?php 
                            $items = getCartItems();
                            $totalPrice = 0;
                            if(is_array($items) || is_object($items)) {
                                foreach($items as $citem) {
                        ?>
                        <div class="mb-1 border">
                            <div class="row mb-3 align-items-center"> 
                                <div class="col-md-2 "> 
                                    <img src="uploads/<?= $citem['image']?>" alt="" width="60px" > 
                                </div>
                                <div class="col-md-5">
                                    <label ></label><?= $citem['name']?></label>
                                </div>
                                <div class="col-md-3">
                                <label><?= number_format($citem['selling_price'], 0, ',', '.') ?> đ</label>
                                </div>
                                <div class="col-md-2">
                                <label >x<?= $citem['prod_qty']?></label>
                                </div>
                            </div>
                        </div>
                        <?php
                        $totalPrice += $citem['selling_price'] * $citem['prod_qty'];
                                }
                            } 
                        ?>
                        <hr>
                        <h5>Tổng : <span class="float-right fw-bold"><?= number_format($totalPrice, 0, ',', '.') ?> đ</span></h5>
                            <div class="">
                                <input type="hidden" name="payment_mode" value="Thanh Toán Khi Nhận Hàng" >
                                <button type="submit" name="placeOrderBtn" class="btn btn-primary w-100">Thanh Toán</button>
                            </div>
                    </div>
                    </div>
                    </form>
                </div>
            </div>
            </div>
        
    </div>
</div>
<?php include('includes/footer.php'); ?>
