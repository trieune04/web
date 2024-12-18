<?php 
include('includes/header.php'); 
include('../middleware/adminmiddleware.php');
?>
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <div class="card-body">
                    <h4>Thêm Danh Mục</h4>
                    <a href="category.php" class="btn btn-primary float-end fa">Quay Lại</a>
                </div>
                <div class="card-body">
                    <form action="code.php" method="POST" enctype="multipart/form-data">
                        <div class="row">
                            <div class="col-md-12">
                                <label for="">Tên</label>
                                <input type="text" name="name" class="form-control">
                            </div>
                            <div class="col-md-12">
                                <label for="">Thông Tin</label>
                                <textarea rows="3" name="description" class="form-control"></textarea>
                            </div>

                            
                            <div class="col-md-12">
                                <label for="">Hình Ảnh</label>
                                <input type="file" name="image" class="form-control">
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
                            <div class="col-md-6">
                                <label for="">Trạng Thái</label>
                                <input type="checkbox" name="status">
                            </div>
                            <div class="col-md-6">
                                <label for="">Phổ Biến</label>
                                <input type="checkbox" name="popular">
                            </div>
                            <div class="col-md-12">
                                <button type="submit" class="btn btn-primary" name="add-category_btn">Lưu</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<?php include('includes/footer.php'); ?>
