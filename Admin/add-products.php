<?php 
include('includes/header.php'); 
include('../middleware/adminmiddleware.php');
?>
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <div class="card-body">
                    <h4>Thêm Sản Phẩm</h4>
                    <a href="products.php" class="btn btn-primary float-end">Quay Lại</a>
                </div>
                <div class="card-body">
                    <form action="code.php" method="POST" enctype="multipart/form-data">
                        <div class="row">
                        <div class="col-md-6">
                                <label for="">Tìm Danh Mục</label>
                                <select name="category_id" class="form-select" >
                                    <option>Tìm Danh Mục</option>
                                    <?php 
                                        $categories = getAll("categories");
                                        if(mysqli_num_rows($categories) >0 ){
                                            foreach ($categories as $item) { 
                                                ?>
                                                 <option value="<?= $item['id']; ?>"><?= $item['name']; ?></option>
                                                 <?php
                                            }
                                        }
                                        else{
                                          
                                            echo "No categories available";

                                        }
                                    ?>   
                                    </select>
                            </div>
                            <div class="col-md-12">
                                <label for="">Tên</label>
                                <input type="text" name="name" class="form-control">
                            </div>
                            <div class="col-md-12">
                                <label for="">Thông Tin</label>
                                <textarea rows="3" name="small_description" class="form-control"></textarea>
                            </div>
                            <div class="col-md-12">
                                <label for="">Thông Tin Chi Tiết</label>
                                <textarea rows="3" name="description" class="form-control"></textarea>
                            </div>
                            <div class="col-md-12">
                                <label for="">Giá gốc</label>
                                <input type="text" name="original_price" class="form-control">
                            </div>
                            <div class="col-md-12">
                                <label for="">Giá Khuyến Mãi</label>
                                <input type="text" name="selling_price" class="form-control">
                            </div>
                            <div class="col-md-12">
                                <label for="">Hình Ảnh</label>
                                <input type="file" name="image" class="form-control">
                            </div>
                            <div class="row">
                            <div class="col-md-12">
                                <label for="">Số Lượng</label>
                                <input type="number" name="qty" class="form-control">
                            </div>
                            <div class="col-md-3">
                                <label for="">Trạng Thái</label>
                                <input type="checkbox" name="status">
                            </div>
                            <div class="col-md-3">
                                <label for="">Xu Hướng</label>
                                <input type="checkbox" name="trending">
                            </div>
                            </div>
                            <div class="col-md-12">
                                <label for="">Tiêu Đề</label>
                                <input type="text" name="meta_title" class="form-control">
                            </div>
                            <div class="col-md-12">
                                <label for="">Mô Tả</label>
                                <textarea rows="3" name="meta_description" class="form-control"></textarea>
                            </div>
                            <div class="col-md-12">
                                <label for="">Từ Khóa</label>
                                <textarea rows="3" name="meta_keyword" class="form-control"></textarea>
                            </div>
                           
                            <div class="col-md-12" style="margin-top: 10px;">
                                <button type="submit" class="btn btn-primary" name="add-product_btn">Lưu</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<?php include('includes/footer.php'); ?>
