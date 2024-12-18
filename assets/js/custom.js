$(document).ready(function() {

    $('.increment-btn').click(function(e) {
    e.preventDefault();

   var qty = $(this).closest('.product_data').find('.input-qty').val();
   
   var value = parseInt(qty, 10);
   value = isNaN(value) ? 0: value;
   if(value<10){
    value++;
    $(this).closest('.product_data').find('.input-qty').val(value);
   }
});
$('.decrement-btn').click(function(e) {
    e.preventDefault();

   var qty = $(this).closest('.product_data').find('.input-qty').val();
   
   var value = parseInt(qty, 10);
   value = isNaN(value) ? 0: value;
   if(value >1){
    value--;
    $(this).closest('.product_data').find('.input-qty').val(value);
   }
});
$('.addToCartBtn').click(function(e) {
    e.preventDefault();
   var qty = $(this).closest('.product_data').find('.input-qty').val();
    var prod_id = $(this).val();
    $.ajax({
        method:"POST",
        url:"functions/handlecart.php",
        data: {
            "prod_id": prod_id,
            "prod_qty": qty,
            "scope":"add"
        },
       
        success:function(response) {
            if(response == 201){
                alertify.success("Sản Phẩm Đã Được Thêm Vòa Giỏ Hàng");

            }
            else if(response == "existing"){
                alertify.success("Sản Phẩm Đã Có Trong Giỏ Hàng");

            }
            else if(response == 401){
                alertify.success("Đăng Nhập Để Tiếp Tục");

            }
            else if(response == 500){
                alertify.success("Lỗi");

            }
        }
    });
});

    $(document).on('click','.updateQty',function(){
        var qty = $(this).closest('.product_data').find('.input-qty').val();
        var prod_id = $(this).closest('.product_data').find('.prodID').val();

        $.ajax({
            method:"POST",
            url:"functions/handlecart.php",
            data: {
                "prod_id": prod_id,
                "prod_qty": qty,
                "scope":"update"
            },
           
            success:function(response) {
                // alert(response);
            }
       
    });
});
$(document).on('click','.deleteItem',function(){
    var cart_id = $(this).val();
    // alert(cart_id);
    $.ajax({
        method:"POST",
        url:"functions/handlecart.php",
        data: {
            "cart_id": cart_id,
            "scope":"delete"
        },
        success: function(response) {
            if(response == 200) {
                alertify.success("Đã Xóa Khỏi Giỏ Hàng");
                // Tải lại trang sau khi xóa sản phẩm thành công và hiển thị thông báo sau khi trang đã được tải lại hoàn toàn
                location.reload(function() {
                    alertify.success("Trang đã được tải lại!");
                });
            } else {
                alertify.error(response);
            }
        }
});
});
$('.updateQty').on('click', function() {
    // Thực hiện thay đổi số lượng sản phẩm

    // Load lại trang
    location.reload();
});
});


