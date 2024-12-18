<?php 

if (session_status() === PHP_SESSION_NONE) {
    session_start();
}
include('config/dbcon.php');
function getAllActive($table)
{
    global $con;
    $query = "SELECT * FROM $table WHERE status ='0'";
    return $query_run = mysqli_query($con, $query);
}
function getAllSale()
{
    global $con;
    $query = "SELECT * FROM products WHERE trending ='1'";
    return $query_run = mysqli_query($con, $query);
}
function getAllCategories(){
    global $con;
    $query = "SELECT * FROM categories WHERE popular ='1'";
    return $query_run = mysqli_query($con, $query);
}

function getNameActive($table,$name)

{
    global $con;
    $query = "SELECT * FROM $table WHERE name = '$name'AND status ='0'LIMIT 1";
    return $query_run = mysqli_query($con, $query);
}

function getProByCategory($category_id){
    global $con;
    $query = "SELECT * FROM products WHERE category_id = '$category_id'AND status ='0'";
    return $query_run = mysqli_query($con, $query);
}
function getProByProduct(){
    global $con;
    $query = "SELECT * FROM products WHERE trending ='1'";
    return $query_run = mysqli_query($con, $query);
}
function getIDActive($table,$id)

{
    global $con;
    $query = "SELECT * FROM $table WHERE id = '$id'AND status ='0'";
    return $query_run = mysqli_query($con, $query);
}
function getCartItems(){
    global $con;
   
  
        $userId =  $_SESSION['auth_user']['user_id'];
        $query = "SELECT c.id as cid, c.prod_id ,c.prod_qty,p.id as pid, p.name,p.image,p.selling_price  
                    FROM carts c, products p WHERE c.prod_id=p.id AND c.user_id='$userId' ORDER BY c.id DESC";
        return $query_run = mysqli_query($con, $query);
   
}
function getOrders(){
    global $con;
    $userId =  $_SESSION['auth_user']['user_id'];
    $query = "SELECT * FROM orders WHERE user_id = '$userId'ORDER BY id DESC";
    return $query_run = mysqli_query($con, $query);
}

function checkTrackingNovalid($trackingNo){
    global $con;
    $userId =  $_SESSION['auth_user']['user_id'];
    $query = "SELECT * FROM orders WHERE tracking_no = '$trackingNo' AND user_id = '$userId' ";
    return  mysqli_query($con, $query);
}   
function redirect($url, $message) {
    $_SESSION['message'] = $message;
    header("Location: $url");
    exit(0);
}

?>