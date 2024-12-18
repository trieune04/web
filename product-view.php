<?php
include('functions/userfunctions.php');
include('includes/header.php');

if(isset($_GET['product']))
{   
  $product_name = $_GET['product'];
  $product_data = getNameActive("products",$product_name);
  $product = mysqli_fetch_array($product_data);

  if($product){
    ?>
    <div class="py-3 bg-primary">
        <div class="container">
            <h6 class="text-white">
                <a href="categories.php" class="text-white">Trang Chủ/</a>
                <a href="categories.php" class="text-white">Danh Mục/</a>
                <?= $product['name'];?>
            </h6>
        </div>
    </div>
    <div class="bg-light py-4">
        <div class="container product_data mt-3">
            <div class="row">
                <div class="col-md-4">
                    <div class="shadow">
                        <img src="uploads/<?= $product['image']; ?>" alt="" class="w-100">
                    </div>
                    <div class="row mt-3">
                        <div class="col-md-6">
                            <h5><strong>Giá:</strong> <s><?= number_format($product['original_price'], 0, ',', '.'); ?> đ</s></h5>
                        </div>
                        <div class="col-md-6">
                            <h5><strong>KM:</strong> <span class="text-danger"> <?= number_format($product['selling_price'], 0, ',', '.'); ?> đ</span></h5>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-4">
                            <div class="input-group mb-3" style="width:130px">
                                <button class="input-group-text decrement-btn">-</button>
                                <input type="text" class="form-control text-center input-qty bg-white" value="1" disabled >
                                <button class="input-group-text increment-btn">+</button>
                            </div>
                        </div>
                    </div>
                    <div class="row mt-3">
                        <div class="col-md-6">
                            <button class="btn btn-primary px-4 addToCartBtn" value="<?= $product['id']?>" > <i class="fa fa-shopping-cart me-2"></i>+ Giỏ Hàng </button>
                        </div>
                        <div class="col-md-6">
                            <button class="btn btn-danger px-4"><a href="cart.php" class="text-white">Mua Ngay </a></button>
                        </div>
                    </div>
                </div>
                
                <div class="col-md-8">
                    <h4><?= $product['name']; ?></h4><hr>
                    <h5>Thông Tin Sản Phẩm:</h5><hr>
                    <div class="product-description" style="max-height: 100px; overflow: hidden; border: 1px solid #ccc; padding: 10px; border-radius: 5px;">
                        <?php
                        $description_parts = explode("\n", $product['description']);
                        foreach($description_parts as $part) {
                            $colon_position = strpos($part, ':');
                            if ($colon_position !== false) {
                                $before_colon = substr($part, 0, $colon_position);
                                $after_colon = substr($part, $colon_position + 1);
                                echo "<div><strong>$before_colon:</strong> $after_colon</div>";
                            } else {
                                echo "<div>$part</div>";
                            }
                        }
                        ?>
                    </div>
                    <button class="btn btn-link mt-2" id="toggleDescriptionBtn" onclick="toggleDescription()">Xem thêm</button>
                </div>
            </div>
        </div>
    </div>
    <script>
        function toggleDescription() {
            var description = document.querySelector('.product-description');
            var btn = document.getElementById('toggleDescriptionBtn');

            if (description.style.maxHeight === 'none') {
                description.style.maxHeight = '100px';
                btn.textContent = 'Xem thêm';
            } else {
                description.style.maxHeight = 'none';
                btn.textContent = 'Thu gọn';
            }
        }
    </script>
    <?php
  }
  else{
    echo "No product found";
  }
}
else{
    echo "No product selected";
}
include('includes/footer.php');
?>
