<?php
include('../config/dbcon.php');
include('../functions/myfunctions.php');

if (isset($_POST['add-category_btn'])) {
    $name = $_POST['name'];
    $description = $_POST['description'];
    $meta_title = $_POST['meta_title'];
    $meta_description = $_POST['meta_description'];
    $meta_keyword = $_POST['meta_keyword'];
    $status =isset ($_POST['status']) ? '1': '0';
    $popular = isset ($_POST['popular'])? '1': '0';

    $image = $_FILES['image']['name'];

    $path="../uploads";

    $image_ext = pathinfo($image, PATHINFO_EXTENSION);
    $filename = time() .'.'.$image_ext;

    $cate_query = "INSERT INTO categories(name, description, meta_title, meta_description, meta_keyword,status,popular,image)
     VALUES('$name','$description','$meta_title','$meta_description','$meta_keyword','$status','$popular','$filename')";

     $cate_query_run = mysqli_query($con, $cate_query);

     if ($cate_query_run) {
        move_uploaded_file($_FILES['image']['tmp_name'],$path.'/'.$filename);

        redirect("add-category.php","Thêm thành công");
     }
     else {
        redirect("add-category.php","Thêm thất bại");

     }

} 
else if (isset($_POST['update-category_btn'])){
   $category_id = $_POST['category_id'];
   $name = $_POST['name'];
    $description = $_POST['description'];
    $meta_title = $_POST['meta_title'];
    $meta_description = $_POST['meta_description'];
    $meta_keyword = $_POST['meta_keyword'];
    $status =isset ($_POST['status']) ? '1': '0';
    $popular = isset ($_POST['popular'])? '1': '0';
    $new_image = $_FILES['image']['name'];
    $old_image = $_POST['old_image'];

      if($new_image != ""){

      $update_filename = $new_image;
    }
      else {
         $update_filename = $old_image;
      }
      $path = "../uploads";
      $update_query = "UPDATE categories SET name ='$name',description ='$description',meta_title ='$meta_title',meta_description ='$meta_description',meta_keyword ='$meta_keyword',status ='$status',popular ='$popular',
      image ='$update_filename' WHERE id = '$category_id'";
      $update_query_run = mysqli_query($con,$update_query);

      if ($update_query_run) {
         if($_FILES['image']['name'] != "") {
            move_uploaded_file($_FILES['image']['tmp_name'],$path.'/'.$new_image);
            if(file_exists("../uploads/".$old_image)){
                unlink("../uploads/".$old_image);
            }
            redirect("edit-category.php?id=$category_id","Cập nhật thành công");
         }
         else{
            redirect("edit-category.php?id=$category_id","Cập nhật Thất Bại");
         }
      }
    }
else if(isset($_POST['delete_category_btn']))
{
   $category_id = mysqli_real_escape_string($con,$_POST['category_id']);
   $category_query = "SELECT * FROM categories WHERE id= '$category_id'";
   $cate_query_run = mysqli_query($con,$category_query);
   $category_data = mysqli_fetch_array($cate_query_run);
   $image = $category_data['image'];
   $delete_query = "DELETE FROM categories WHERE id = '$category_id'";
   $delete_query_run = mysqli_query($con,$delete_query);

   if ($delete_query_run) {
      if(file_exists("../uploads/".$image)){
         unlink("../uploads/".$image);
     }
      redirect("category.php","Xóa thành công");
   }
   else {
      redirect("category.php","Xóa thất bại");
   }
}
else if(isset($_POST["add-product_btn"])){
   $category_id = $_POST['category_id'];
   $name = $_POST['name'];
   $small_description = $_POST['small_description'];
   $original_price = $_POST['original_price'];
   $selling_price = $_POST['selling_price'];
   $qty = $_POST['qty'];
    $description = $_POST['description'];
    $meta_title = $_POST['meta_title'];
    $meta_description = $_POST['meta_description'];
    $meta_keyword = $_POST['meta_keyword'];
    $status =isset ($_POST['status']) ? '1': '0';
    $trending = isset ($_POST['trending'])? '1': '0';

    $image = $_FILES['image']['name'];

    $path="../uploads";

    $image_ext = pathinfo($image, PATHINFO_EXTENSION);
    $filename = time() .'.'.$image_ext;
    $product_query = "INSERT INTO products(category_id,name,small_description,original_price,selling_price,qty,description,meta_title,meta_description,meta_keyword,status,trending,image)
     VALUES('$category_id','$name','$small_description','$original_price','$selling_price','$qty','$description','$meta_title','$meta_description','$meta_keyword','$status','$trending','$filename')";
     $product_query_run = mysqli_query($con, $product_query);
     if ($product_query_run) {
        move_uploaded_file($_FILES['image']['tmp_name'],$path.'/'.$filename);
        redirect("add-products.php","Thêm thành công");
     } else {
       redirect("add-products.php","Thêm thất bại");
     }
}
else if(isset($_POST['update_product_btn'])){
   $product_id = $_POST['product_id'];
   $category_id = $_POST['category_id'];
   $name = $_POST['name'];
   $small_description = $_POST['small_description'];
   $original_price = $_POST['original_price'];
   $selling_price = $_POST['selling_price'];
   $qty = $_POST['qty'];
    $description = $_POST['description'];
    $meta_title = $_POST['meta_title'];
    $meta_description = $_POST['meta_description'];
    $meta_keyword = $_POST['meta_keyword'];
    $status =isset ($_POST['status']) ? '1': '0';
    $trending = isset ($_POST['trending'])? '1': '0';
   
    $path = "../uploads";
    $new_image = $_FILES['image']['name'];
    $old_image = $_POST['old_image'];

    if($new_image != "")
    {
      $image_ext = pathinfo($new_image, PATHINFO_EXTENSION);
      $update_filename = time().'.'.$image_ext;

}
else {
    $update_filename = $old_image;
}
   $update_product_query = "UPDATE products SET name ='$name',small_description = '$small_description',original_price = '$original_price',selling_price = '$selling_price',
    qty = '$qty',description = '$description',meta_title = '$meta_title',meta_description = '$meta_description',meta_keyword ='$meta_keyword',status = '$status',trending = '$trending',image = '$update_filename' WHERE id = '$product_id'";
    $update_product_query_run = mysqli_query($con,$update_product_query);

    if($update_product_query_run){
      if($_FILES['image']['name'] != ""){
         move_uploaded_file($_FILES['image']['tmp_name'],$path.'/'.$update_filename);

         if(file_exists("../uploads/".$old_image))
         {
            unlink("../uploads/".$old_image);
         }
         redirect("edit-product.php?id=$product_id","Cập nhật thành công");
      }
      else{
         redirect("edit-product.php?id=$product_id","Cập nhật thất bại");
       }
    }
    
}

else if(isset($_POST['delete_product_btn'])){
   $product_id = mysqli_real_escape_string($con,$_POST['product_id']);
   $product_query = "SELECT * FROM products WHERE id= '$product_id'";
   $product_query_run = mysqli_query($con,$product_query);
   $product_data = mysqli_fetch_array($product_query_run);
   $image = $product_data['image'];
   $delete_query = "DELETE FROM products WHERE id = '$product_id'";
   $delete_query_run = mysqli_query($con,$delete_query);

   if ($delete_query_run) {
      if(file_exists("../uploads/".$image)){
         unlink("../uploads/".$image);
     }
       redirect("products.php","Xóa thành công");
      
   }
   else {
       redirect("products.php","Xóa thất bại");
      
   }
}
else if(isset($_POST['update_order_btn'])){
   $track_no = $_POST['tracking_no'];
   $order_status = $_POST['order_status'];

   $updateOrder_query = "UPDATE orders SET status='$order_status' WHERE tracking_no='$track_no'";
   $updateOrder_query_run = mysqli_query($con,$updateOrder_query);
   redirect("view-order.php?t=$track_no","Cập nhật thành công");

   
}
else{
   header('Location: ../index.php') ;
}

?>