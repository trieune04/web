<?php include('includes/header.php'); 
      include('../middleware/adminmiddleware.php');
    ?>
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-header">
                            <h4>Sản Phẩm</h4>
                            
                        </div>
                        <div class="card-body" id = "products_table">
                            <table  class="table table-bordered table-striped">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Tên</th>
                                        <th>Hình Ảnh</th>
                                        <th>Trạng Thái</th>
                                        <th>Sửa</th>
                                        <th>Xóa</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php 
                                        $product = getAll("products");
                                        if(mysqli_num_rows($product) >0){
                                        foreach($product as $item){
                                            ?>
                                            <tr>
                                                <td> <?= $item['id']; ?></td>
                                                <td> <?= $item['name']; ?></td>
                                                <td>
                                                    <img src="../uploads/<?= $item['image']; ?>" width="50px" height = "50px" alt="<?= $item['name']; ?>">
                                                </td>
                                                <td> <?= $item['status'] == '0'? "Visibale":"Hidden" ?>
                                        </td>
                                        <td>
                                            <a href="edit-product.php?id=<?= $item['id']; ?>" class="btn btn-sm btn-primary">Sửa</a>

                                        </td>
                                        <td>
                                        <form action="code.php" method="POST">
                                                <input type="hidden" name="product_id" value="<?= $item['id']; ?>">
                                                <button type="submit" class="btn btn-sm btn-danger" name ="delete_product_btn">Xóa</button>
                                            </form>
                                        </td>
                                            </tr>
                                            <?php
                                        }
                                        }
                                        else{
                                            echo "No records found";
                                        }
                                    
                                 ?>
                                </tbody>
                            </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

<?php include('includes/footer.php'); ?>
