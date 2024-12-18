<?php 
include('functions/userfunctions.php'); 
include('includes/header.php'); 
include('includes/slider.php'); 
?>

<div class="py-5">
    <div class="container">
        <div class="card">
            <div class="card-body">
                <h1 class="text-center">DANH MỤC NỔI BẬT</h1>
                <div class="row">
                    <?php
                    // Lấy danh mục từ cơ sở dữ liệu
                    $categories = getAllCategories(); 
                    
                    if(mysqli_num_rows($categories) > 0) {
                        foreach($categories as $item) {
                            ?>
                            <div class="col-md-3 mb-4"> <!-- Thêm mb-4 để có khoảng cách dưới mỗi cột -->
                                <a href="products.php?category=<?= urlencode($item['name']); ?>" style="text-decoration: none;">
                                    <div class="card shadow bg-white" style="border: 1px solid #ddd; border-radius: 10px;">
                                        <div class="card-body">
                                            <!-- Hiển thị hình ảnh danh mục -->
                                            <img src="uploads/<?= htmlspecialchars($item['image']); ?>" alt="<?= htmlspecialchars($item['name']); ?>" class="w-100" style="border-radius: 5px;">
                                            <!-- Hiển thị tên danh mục -->
                                            <h4 class="mt-3" style="font-family: Arial, sans-serif; color: black; text-align: center;"><?= htmlspecialchars($item['name']); ?></h4>
                                        </div>
                                    </div>
                                </a>
                            </div>
                            <?php
                        }
                    } else {
                        echo "<p>Không có danh mục nào.</p>";
                    }
                    ?>
                </div>
            </div>
        </div>
        <br><hr><br>
        <div class="card">
            <div class="card-body" style="background-color: DeepPink;">
                <div>
                    <img src="assets/images/TDS-1200x120.png" alt="Sale Image" class="w-100">
                    <hr>
                </div>

                <div class="row">
                    <?php 
                    // Lọc các sản phẩm có trạng thái 'active'
                    $SaleProducts = getAllSale();
                    if(mysqli_num_rows($SaleProducts) > 0) {
                        foreach($SaleProducts as $item) {
                    ?> 
                    <div class="col-md-4 mb-4">
                        <a href="product-view.php?product=<?= urlencode($item['name']); ?>" style="text-decoration: none;">
                            <div class="card shadow bg-white mb-3" style="border: 1px solid #ddd; border-radius: 10px;">
                                <div class="card-body d-flex justify-content-center">
                                    <img src="uploads/<?= htmlspecialchars($item['image']); ?>" alt="<?= htmlspecialchars($item['name']); ?>" class="w-50">
                                    <div class="ms-3">
                                        <h4 style="font-family: Arial, sans-serif; color: black;"><?= htmlspecialchars($item['name']); ?></h4>
                                        <h5 style="font-family: Arial, sans-serif; color: black;"><s><?= number_format($item['original_price'], 0, ',', '.') . " đ"; ?></s></h5>
                                        <h5 style="font-family: Arial, sans-serif; color: red;"><?= number_format($item['selling_price'], 0, ',', '.') . " đ"; ?></h5>
                                    </div>
                                </div>
                            </div>
                        </a>
                    </div>
                    <?php
                        }
                    } else {
                        echo "<p>Không có sản phẩm nào.</p>";
                    }
                    ?>
                </div>

                <div class="row mt-3">
                    <div class="col-md-12 d-flex justify-content-between">
                        <button class="btn btn-primary text-start" style="background-color: white; color: black;" onclick="prevPage()"><</button>
                        <a href="all-product.php" class="btn btn-primary" style="background-color: white; color: black;">Xem tất cả ></a>
                        <button class="btn btn-primary text-end" style="background-color: white; color: black;" onclick="nextPage()">></button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Card section -->
<div class="why-choose-us py-5" style="background-color: #f8f9fa;">
    <div class="container">
        <h2 class="text-center mb-4" style="font-family: Arial, sans-serif; color: #343a40; font-size: 1.25rem;">Tại sao bạn nên dùng dịch vụ của chúng tôi?</h2>
        <div class="row row-cols-1 row-cols-md-4 g-4"> <!-- Thêm lớp Bootstrap row-cols-md-4 -->
            <?php
            $features = [
                ["icon" => "assets/images/icon-free-ship.png", "title" => "Miễn phí giao hàng 63 tỉnh", "subtitle" => "Free shipping (nội thành)"],
                ["icon" => "assets/images/icon-support-247.png", "title" => "Phục vụ 24/24", "subtitle" => "24-7 service"],
                ["icon" => "assets/images/icon-vat.png", "title" => "Giá đã gồm 10% VAT", "subtitle" => "Price include VAT"],
                ["icon" => "assets/images/icon-quick-delivery.png", "title" => "Giao nhanh trong 60 phút", "subtitle" => "60 minutes quick delivery"],
                ["icon" => "assets/images/icon-guarantee-smile.png", "title" => "Cam kết hài lòng 100%", "subtitle" => "100% guarantee smile"],
                ["icon" => "assets/images/icon-fresh-warranty.png", "title" => "Cam kết hoa tươi 3+ ngày", "subtitle" => "3+ days fresh warranty"],
                ["icon" => "assets/images/icon-postcard.png", "title" => "Tặng thiệp cao cấp", "subtitle" => "Free greeting cards"],
                ["icon" => "assets/images/icon-discount.png", "title" => "Giảm giá đến 10%", "subtitle" => "Receive 3-10% discount"],
            ];

            foreach ($features as $feature) {
                echo '
                <div class="col">
                    <div class="card shadow border-0">
                        <div class="card-body text-center" style="padding: 0.75rem;">
                            <img src="' . $feature['icon'] . '" alt="' . $feature['title'] . '" class="img-fluid mb-2" style="max-width: 40px;"> <!-- Kích thước icon -->
                            <h5 class="card-title" style="font-size: 1rem; font-weight: bold; line-height: 1.3;">' . $feature['title'] . '</h5>
                            <p class="card-text text-muted" style="font-size: 0.875rem; line-height: 1.2;">' . $feature['subtitle'] . '</p>
                        </div>
                    </div>
                </div>';
            }
            ?>
        </div>
    </div>
</div>

<?php include('includes/footer.php'); ?>

<script>
    let currentPage = 1; // Giả sử trang bắt đầu từ 1
    const totalSaleProducts = <?php echo mysqli_num_rows($SaleProducts); ?>; // Số lượng sản phẩm sale
    const totalPages = Math.ceil(totalSaleProducts / 6);  // Giả sử mỗi trang có 6 sản phẩm

    function nextPage() {
        if (currentPage < totalPages) {
            currentPage++;
            updatePage();
        }
    }

    function prevPage() {
        if (currentPage > 1) {
            currentPage--;
            updatePage();
        }
    }

    function updatePage() {
        // Ẩn tất cả các sản phẩm
        document.querySelectorAll('.col-md-4').forEach(element => {
            element.style.display = 'none';
        });

        // Hiển thị sản phẩm cho trang hiện tại
        const startIndex = (currentPage - 1) * 6; // Giả sử có 6 sản phẩm mỗi trang
        const endIndex = Math.min(startIndex + 6, totalSaleProducts);
        for (let i = startIndex; i < endIndex; i++) {
            document.querySelectorAll('.col-md-4')[i].style.display = 'block';
        }
    }

    updatePage(); // Cập nhật ban đầu
</script>
