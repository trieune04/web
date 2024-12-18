<?php
include('includes/header.php');
include('config/dbcon.php');

// Lấy dữ liệu từ form tìm kiếm
$query = isset($_GET['query']) ? $_GET['query'] : '';
$sort = isset($_GET['sort']) ? $_GET['sort'] : 'name_asc'; // Mặc định sắp xếp theo tên A-Z
$page = isset($_GET['page']) ? $_GET['page'] : 1;
$items_per_page = 6; // Số sản phẩm hiển thị mỗi trang
$offset = ($page - 1) * $items_per_page; // Vị trí bắt đầu cho trang hiện tại

// Lọc và sắp xếp truy vấn
$query_sql = "SELECT * FROM products WHERE name LIKE '%$query%' OR small_description LIKE '%$query%' OR description LIKE '%$query%'";

// Xử lý sắp xếp
switch ($sort) {
    case 'price_asc':
        $query_sql .= " ORDER BY selling_price ASC";
        break;
    case 'price_desc':
        $query_sql .= " ORDER BY selling_price DESC";
        break;
    case 'name_asc':
        $query_sql .= " ORDER BY name ASC";
        break;
    case 'name_desc':
        $query_sql .= " ORDER BY name DESC";
        break;
    default:
        $query_sql .= " ORDER BY name ASC"; // Mặc định sắp xếp theo tên A-Z
}

// Truy vấn để lấy tổng số sản phẩm tìm thấy
$total_query = "SELECT COUNT(*) AS total FROM products WHERE name LIKE '%$query%' OR small_description LIKE '%$query%' OR description LIKE '%$query%'";
$total_result = mysqli_query($con, $total_query);
$total_row = mysqli_fetch_assoc($total_result);
$total_items = $total_row['total'];
$total_pages = ceil($total_items / $items_per_page);

// Truy vấn sản phẩm với phân trang
$query_sql .= " LIMIT $offset, $items_per_page";
$result = mysqli_query($con, $query_sql);
?>

<div class="container py-5">
    <h2>Kết Quả Tìm Kiếm: "<?= htmlspecialchars($query); ?>"</h2>
    <p>Số lượng kết quả tìm thấy: <?= $total_items; ?> sản phẩm</p>

    <!-- Form chọn sắp xếp -->
    <form action="search.php" method="GET">
        <div class="row">
            <div class="col-md-6">
                <input type="text" name="query" value="<?= htmlspecialchars($query); ?>" class="form-control" placeholder="Tìm sản phẩm...">
            </div>
            <div class="col-md-3">
                <select name="sort" class="form-select">
                    <option value="name_asc" <?= ($sort == 'name_asc') ? 'selected' : ''; ?>>Tên A-Z</option>
                    <option value="name_desc" <?= ($sort == 'name_desc') ? 'selected' : ''; ?>>Tên Z-A</option>
                    <option value="price_asc" <?= ($sort == 'price_asc') ? 'selected' : ''; ?>>Giá từ thấp đến cao</option>
                    <option value="price_desc" <?= ($sort == 'price_desc') ? 'selected' : ''; ?>>Giá từ cao đến thấp</option>
                </select>
            </div>
            <div class="col-md-3">
                <button type="submit" class="btn btn-primary">Tìm</button>
            </div>
        </div>
    </form>

    <!-- Danh sách sản phẩm -->
    <div class="row mt-4">
        <?php 
        if (mysqli_num_rows($result) > 0) {
            while ($product = mysqli_fetch_assoc($result)) {
                ?>
                <!-- Chuyển toàn bộ phần hiển thị vào một link (bao gồm hình ảnh và thông tin sản phẩm) -->
                <div class="col-md-4 mb-4">
                    <a href="product-view.php?product=<?= $product['name']; ?>" class="card" style="text-decoration: none;">
                        <div class="card-body text-center">
                            <!-- Hiển thị hình ảnh sản phẩm với kích thước lớn -->
                            <img src="uploads/<?= $product['image']; ?>" alt="<?= $product['name']; ?>" class="card-img-top" style="height: 300px; width: 100%; object-fit: cover;">

                            <!-- Gạch ngang giữa hình ảnh và tên giá -->
                            <hr style="border: 1px solid #ddd; margin: 15px 0;">

                            <!-- Hiển thị tên sản phẩm -->
                            <h5 class="card-title" style="color: black;"><?= $product['name']; ?></h5>

                            <!-- Hiển thị giá sản phẩm -->
                            <p class="card-text" style="color: red; font-weight: bold;"><?= number_format($product['selling_price'], 0, ',', '.') . " đ"; ?></p>
                        </div>
                    </a>
                </div>
                <?php
            }
        } else {
            echo "<p>Không tìm thấy sản phẩm nào.</p>";
        }
        ?>
    </div>

    <!-- Phân trang -->
    <div class="row">
        <div class="col-md-12">
            <nav aria-label="Page navigation">
                <ul class="pagination justify-content-center">
                    <?php if ($page > 1) { ?>
                        <li class="page-item">
                            <a class="page-link" href="?query=<?= urlencode($query); ?>&sort=<?= $sort; ?>&page=<?= $page - 1; ?>" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                    <?php } else { ?>
                        <li class="page-item disabled">
                            <a class="page-link" href="#" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                    <?php } ?>

                    <?php for ($i = 1; $i <= $total_pages; $i++) { ?>
                        <li class="page-item <?= ($i == $page) ? 'active' : ''; ?>">
                            <a class="page-link" href="?query=<?= urlencode($query); ?>&sort=<?= $sort; ?>&page=<?= $i; ?>"><?= $i; ?></a>
                        </li>
                    <?php } ?>

                    <?php if ($page < $total_pages) { ?>
                        <li class="page-item">
                            <a class="page-link" href="?query=<?= urlencode($query); ?>&sort=<?= $sort; ?>&page=<?= $page + 1; ?>" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                    <?php } else { ?>
                        <li class="page-item disabled">
                            <a class="page-link" href="#" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                    <?php } ?>
                </ul>
            </nav>
        </div>
    </div>
</div>

<?php include('includes/footer.php'); ?>
