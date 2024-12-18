<?php
include('functions/userfunctions.php');
include('includes/header.php');

?>
<div class="py-3 bg-primary">
    <div class ="container">
        <h6 class = "text-white">
            <a href="index.php" class="text-white">
            Trang Chủ/
            </a>
            <a href="categories.php" class="text-white">
            Danh Mục
            </a>
        </h6>
            </div>
</div>
<div class="py-5">
    <div class="container">
        <div class="row">
            <div class="col-md-12">         
                <h1>Danh Mục</h1>
                <div class="row equal-height">
                    <?php
                    $categories = getAllActive("categories");
                    if(mysqli_num_rows($categories) > 0) {
                        foreach($categories as $item) {
                            ?> 
                           <div class="col-md-3 md-2">
                                    <a href="products.php?category=<?= $item['name'];?>" style="text-decoration: none;">
                                        <div class="card shadow bg-white mb-4" style="border: 1px solid #ddd; border-radius: 10px;">
                                            <div class="card-body">
                                                <img src="uploads/<?= $item['image'];?>" alt="" class="w-100">
                                                <h4 style="font-family: Arial, sans-serif; color: black; text-align: center;"><?= $item['name'];?></h4>
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
