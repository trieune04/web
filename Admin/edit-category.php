<?php 
include('../middleware/adminmiddleware.php');
include('includes/header.php'); 

?>
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <?php 
            if(isset($_GET['id'])){

           $id = $_GET['id'];
            $category = getByID("categories", $id);
            if(mysqli_num_rows($category) > 0){
               $data = mysqli_fetch_array($category);
            ?>
            <div class="card">
                <div class="card-head">
                    <h4>Sửa Danh Mục</h4>
                    <a href="category.php" class="btn btn-primary float-end">Trở Về</a>
                </div>
                <div class="card-body">
                    <form action="code.php" method="POST" enctype="multipart/form-data">
                        <div class="row">
                            <div class="col-md-12">
                                <input type="hidden" name = "category_id" value ="<?= $data['id']?>">
                                <label for="">Name</label>
                                <input type="text" name="name" value ="<?= $data['name']?>" class="form-control">
                            </div>
                            <!-- <div class="col-md-6">
                                <label for="">Slug</label>
                                <input type="text" name="slug" value ="<?= $data['slug']?>" class="form-control">
                            </div> -->
                            <div class="col-md-12">
                                <label for="">Description</label>
                                <textarea rows="3" name="description" class="form-control"><?= $data['description']?></textarea>
                            </div>

                            
                            <div class="col-md-12">
                                <label for="">Image</label>
                                <input type="file" name="image" class="form-control">
                                <input type="hidden" name = "old_image" value = "<?= $data['image']?>">
                                <img src="../uploads/<?= $data['image']?>" width="50px" height="50px" alt="">

                            </div>
                            <div class="col-md-12">
                                <label for="">Meta Title</label>
                                <input type="text" name="meta_title" value ="<?= $data['meta_title']?>" class="form-control">
                            </div>
                            <div class="col-md-12">
                                <label for="">Meta Description</label>
                                <textarea rows="3" name="meta_description" class="form-control"><?= $data['meta_description']?></textarea>
                            </div>
                            <div class="col-md-12">
                                <label for="">Meta Keywords</label>
                                <textarea rows="3" name="meta_keyword" class="form-control"><?= $data['meta_keyword']?></textarea>
                            </div>
                            <div class="col-md-6">
                                <label for="">Status</label>
                                <input type="checkbox" <?= $data['status'] ? "checked":""?> name="status">
                            </div>
                            <div class="col-md-6">
                                <label for="">Popular</label>
                                <input type="checkbox"  <?= $data['popular'] ? "checked":""?> name="popular">
                            </div>
                            <div class="col-md-12">
                                <button type="submit" class="btn btn-primary" name="update-category_btn">Cập Nhật</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <?php
            }
             else{
                 echo "Không tìm thấy dữ liệu";
             }
            }
            else {
                echo "Không có dữ liệu";
            } 
            ?>
        </div>
    </div>
</div>
<?php include('includes/footer.php'); ?>
