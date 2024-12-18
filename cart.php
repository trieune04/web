<?php 
    include('functions/userfunctions.php');
    include('includes/header.php'); 
    include('authenticate.php'); 
?>

<div class="py-3 bg-primary">
    <div class="container">
        <h6 class="text-white">
            <a href="index.php" class="text-white">Trang Chủ/</a>
            <a href="cart.php" class="text-white">Giỏ Hàng</a>
        </h6>
    </div>
</div>
<div class="py-5">
    <div class="container">
        <div class="">
            <div class="row">
                <div class="col-md-12">
                    <?php 
                    $items = getCartItems();
                    if (is_array($items) || is_object($items)) {
                        if (mysqli_num_rows($items) > 0) {
                    ?>
                    <div class="row mb-4"> 
                        <div class="col-md-2">
                            <h6>Sản Phẩm</h6>
                        </div>
                        <div class="col-md-3"></div>
                        <div class="col-md-3">
                            <h6>Giá</h6>
                        </div>
                        <div class="col-md-2">
                            <h6>Số Lượng</h6>
                        </div>
                        <div class="col-md-2">
                            <h6>Xóa</h6>
                        </div>
                    </div>
                    <div id="mycart">
                        <?php  
                        foreach ($items as $citem) {
                        ?>
                        <div class="card product_data shadow-sm mb-2 mx-auto">
                            <div class="row mb-3 align-items-center"> 
                                <div class="col-md-2 text-center"> 
                                    <img src="uploads/<?= $citem['image']?>" alt="" width="80px" class="mx-auto d-block"> 
                                </div>
                                <div class="col-md-3">
                                    <h5><?= $citem['name']?></h5>
                                </div>
                                <div class="col-md-3 btn-sm">
                                    <h5><?= number_format($citem['selling_price'], 0, ',', '.') ?> đ</h5>
                                </div>
                                <div class="col-md-2">
                                    <input type="hidden" class="prodID" value="<?= $citem['prod_id'] ?>">
                                    <div class="input-group mb-3" style="width:130px">
                                        <button class="input-group-text decrement-btn updateQty">-</button>
                                        <input type="text" class="form-control text-center input-qty bg-white" value="<?= $citem['prod_qty']?>" disabled>
                                        <button class="input-group-text increment-btn updateQty">+</button>
                                    </div>
                                </div>
                                <div class="col-md-2">
                                    <button class="btn btn-danger btn-sm deleteItem" value="<?= $citem['cid'] ?>">
                                        <i class="fa fa-trash mr-2"></i>Xóa
                                    </button>
                                </div>
                            </div>
                        </div>
                        <?php
                        }
                        ?>
                    </div>
                    <div class="float-right">
                        <a href="checkout.php" class="btn btn-primary">Thanh Toán</a>
                    </div>
                    <?php
                        } else {
                    ?>
                    <div class="card card-body text-center shadow ">
                        <h4 class="py-3">Giỏ Hàng Trống</h4>
                    </div>
                    <?php
                        }
                    } 
                    ?>
                </div>
            </div>
        </div>
    </div>
</div>
<?php include('includes/footer.php'); ?>
