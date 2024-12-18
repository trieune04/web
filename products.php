<?php
include('functions/userfunctions.php');
include('includes/header.php');
$category_name = $_GET['category'];
$category_data = getNameActive("categories",$category_name);
$category = mysqli_fetch_array($category_data);
$cid = $category['id']
?>
<div class="py-3 bg-primary">
    <div class ="container">
        <h6 class = "text-white">
            <a href="categories.php" class="text-white">
            Trang Chủ/
            </a>
            <a href="categories.php" class="text-white">
            Danh Mục/
            </a>
            <?= $category['name'];?></h6>
</div>
</div>
<div class="py-5">
    <div class="container">
        <div class="row">
            <div class="col-md-12">         
                <h1><?= $category['name'];?></h1><hr>
                <div class="row equal-height">
                    <?php
                    $products = getProByCategory("$cid");
                    if(mysqli_num_rows($products) > 0) {
                        foreach($products as $item) {
                            ?> 
                           <div class="col-md-3 md-2">
                                <a href="product-view.php?product=<?= $item['name'];?>" style="text-decoration: none;">
                                    <div class="card shadow bg-white mb-4" style="border: 1px solid #ddd; border-radius: 10px;">
                                        <div class="card-body">
                                            <img src="uploads/<?= $item['image'];?>" alt="" class="w-100">
                                            <h4 style="font-family: Arial, sans-serif; color: black;"><?= $item['name'];?></h4>
                                            <h5 style="font-family: Arial, sans-serif; color: red;"><?= number_format($item['original_price'], 0, ',', '.') . " đ";?></h5>
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