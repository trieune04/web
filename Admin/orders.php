<?php 
    include('../middleware/adminmiddleware.php');
    include('includes/header.php'); 
   
?>
<div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-header bg-primary">
                            <h4 class="text-white">Đơn Hàng
                                <a href="order-history.php" class ="btn btn-warning float-end">Lịch Sử</a>
                            </h4>
                            
                        </div>
                        <div class="card-body">
                    <table class="table table-bordered table-striped">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Tên</th>
                                <th>Mã Đơn</th>
                                <th>Thành Tiền</th>
                                <th>Ngày</th>
                                <th>Chi Tiết</th>
                            </tr>
                        </thead>
                        <tbody>
                                 <?php 
                                    $orders =getAllOrders();
                                    if(mysqli_num_rows($orders)>0)
                                    {
                                        foreach($orders as $item){
                                            ?>
                                             <tr>
                                                <td> <?= $item['id'];?> </td>
                                                <td> <?= $item['name'];?> </td>
                                                <td> <?= $item['tracking_no'];?> </td>
                                                <td> <?= number_format($item['total_price'], 0, ',', '.') ?> đ </td>
                                                <td> <?= $item['created_at'];?> </td>
                                                <td>
                                                    <a href="view-order.php?t=<?= $item['tracking_no'];?>" class="btn btn-primary">Xem Chi Tiết</a>
                                                </td>
                                            </tr>
                                            <?php
                                        }
                                    }else{
                                        ?>
                                             <tr>
                                                <td colspan="5"> No </td>
                                            </tr>
                                            <?php
                                    }
                                ?>
                           
                        </tbody>
                    </table>
                    
                </div>
            </div>
        </div>
    </div>
</div>
<?php include('includes/footer.php'); ?>

