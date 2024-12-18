<?php 
include('functions/userfunctions.php'); 
include('includes/header.php'); 

?>
<div class="py-3 bg-primary">
    <div class ="container">
        <h6 class = "text-white">
            <a href="categories.php" class="text-white">
            Trang Chủ/
            </a>
            <a href="all-product.php" class="text-white">
            Tất Cả Sản Phẩm
        
            </a>
            
</div>
</div>
<div class="py-5">
    <div class="container">
        <div class="row">
            <div class="col-md-12">         
               
                <div class="row equal-height">
                    <?php
                    $All_products = getProByProduct();
                    if(mysqli_num_rows($All_products) > 0) {
                        foreach($All_products as $item) {
                            ?> 
                           <div class="col-md-3 md-2">
                                <a href="product-view.php?product=<?= $item['name'];?>" style="text-decoration: none;">
                                    <div class="card shadow bg-white mb-4" style="border: 1px solid #ddd; border-radius: 10px;">
                                        <div class="card-body">
                                            <img src="uploads/<?= $item['image'];?>" alt="" class="w-100">
                                            <h4 style="font-family: Arial, sans-serif; color: black;"><?= $item['name'];?></h4>
                                            <h5 style="font-family: Arial, sans-serif; color: black;"><?= number_format($item['original_price'], 0, ',', '.') . " đ";?></h5>
                                            <h5 style="font-family: Arial, sans-serif; color: red;"><?= number_format($item['selling_price'], 0, ',', '.') . " đ"; ?></h5>
                                        </div>
                                    </div>
                                </a>
                            </div>
                            <?php
                        }
                    } else {
                        echo "No categories available";
                    }
                    ?>
                </div>
            </div>
        </div>
    </div>
</div>
<?php include('includes/footer.php'); ?>