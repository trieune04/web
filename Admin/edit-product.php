<?php 
include('includes/header.php'); 
include('../middleware/adminmiddleware.php');
?>
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <?php 
                if(isset($_GET['id'])){
                    $id = $_GET['id'];
                    $product = getByID("products", $id);
                    if(mysqli_num_rows($product) > 0){
                        $data = mysqli_fetch_array($product);
                        ?>
                            <div class="card">
                <div class="card-head">
                    <h4>Thêm Sản Phẩm</h4>
                    <a href="category.php" class="btn btn-primary float-end">Trở Về</a>
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
                                                 <option value="<?= $item['id']; ?>" <?= $data['category_id'] == $item['id']?'selected':''?>     ><?= $item['name']; ?></option>
                                                 <?php
                                            }
                                        }
                                        else{
                                          
                                            echo "No categories available";

                                        }
                                    ?>   
                                    </select>
                                    <input type="hidden" name="product_id"value="<?= $data['id']; ?>" >
                            </div>
                            <div class="col-md-12">
                                <label for="">Name</label>
                                <input type="text" name="name" value="<?= $data['name']; ?>" class="form-control">
                            </div>
                            <div class="col-md-12">
                                <label for="">Small Description</label>
                                <textarea rows="3" name="small_description" class="form-control"><?= $data['small_description']; ?></textarea>
                            </div>
                            <div class="col-md-12">
                                <label for="">Description</label>
                                <textarea rows="3" name="description" class="form-control"><?= $data['description']; ?></textarea>
                            </div>
                            <div class="col-md-12">
                                <label for="">original price</label>
                                <input type="text" name="original_price" value="<?= $data['original_price']; ?>" class="form-control">
                            </div>
                            <div class="col-md-12">
                                <label for="">selling price</label>
                                <input type="text" name="selling_price" value="<?= $data['selling_price']; ?>" class="form-control">
                            </div>
                            <div class="col-md-12">
                                <label for="">Image</label>
                                <input type="hidden" name = "old_image" value="<?= $data['image']; ?>">
                                <input type="file" name="image" class="form-control">
                                <img src="../uploads/<?= $data['image']; ?>" alt=""height= "50px" width="50px">
                            </div>
                            <div class="row">
                            <div class="col-md-12">
                                <label for="">Quantity</label>
                                <input type="number" name="qty" value="<?= $data['qty']; ?>" class="form-control">
                            </div>
                            <div class="col-md-3">
                                <label for="">Status</label>
                                <input type="checkbox" name="status" <?= $data['status'] == '0'?'':'checked' ?>>
                            </div>
                            <div class="col-md-3">
                                <label for="">trending</label>
                                <input type="checkbox" name="trending"<?= $data['trending'] == '0'?'':'checked' ?>>
                            </div>
                            </div>
                            <div class="col-md-12">
                                <label for="">Meta Title</label>
                                <input type="text" name="meta_title" value="<?= $data['meta_title']; ?>" class="form-control">
                            </div>
                            <div class="col-md-12">
                                <label for="">Meta Description</label>
                                <textarea rows="3" name="meta_description" class="form-control"><?= $data['meta_description']; ?></textarea>
                            </div>
                            <div class="col-md-12">
                                <label for="">Meta Keywords</label>
                                <textarea rows="3" name="meta_keyword" class="form-control"><?= $data['meta_keyword']; ?></textarea>
                            </div>
                           
                            <div class="col-md-12">
                                <button type="submit" class="btn btn-primary" name="update_product_btn">Lưu</button>
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
                else{
                    echo "Không tìm thấy dữ liệu";
                }
            ?>
            
        </div>
    </div>
</div>
<?php include('includes/footer.php'); ?>