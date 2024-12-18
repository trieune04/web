    <!-- Optional JavaScript -->
		<script src = "assets/js/jquery-3.7.1.min.js"></script>
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src = "assets/js/bootstrap.min.js"></script>
  <script src = "assets/js/custom.js"></script>
  <script src = "assets/js/owl.carousel.min.js"></script>


  <script src="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>

  <script>

   alertify.set('notifier','position', 'top-center');

    <?php 
    if(isset($_SESSION['message'])) { 
      ?>
    
  alertify.success('<?= $_SESSION['message']; ?>');
  <?php 
     unset($_SESSION['message']);
    }
  ?>
      </script>

<!-- Footer Section -->
<div class="py-5 bg-dark">
    <div class="container">
        <div class="row">
            <!-- Shop Information -->
            <div class="col-md-3 mb-4">
                <h4 class="text-white">THÔNG TIN VỀ SHOP</h4>
                <div class="is-divider small mb-3"></div>
                <a href="index.php" class="text-white d-block mb-2"><i class="fa fa-angle-right"></i> Trang Chủ</a>
                <a href="#" class="text-white d-block mb-2"><i class="fa fa-angle-right"></i> Thông Tin</a>
                <a href="cart.php" class="text-white d-block mb-2"><i class="fa fa-angle-right"></i> Giỏ Hàng</a>
            </div>

            <!-- Contact Information & Social Media -->
            <div class="col-md-3 mb-4">
                <h4 class="text-white">Kết nối với chúng tôi</h4>
                <div class="is-divider small mb-3"></div>
                <div class="social-icons mb-4">
                    <a href="https://facebook.com" target="_blank" class="text-white mb-2 d-block">
                        <img src="assets/images/fb-ico.png" alt="Facebook" style="width: 40px; height: 40px; vertical-align: middle;"> Facebook
                    </a>
                    <a href="https://zalo.me" target="_blank" class="text-white mb-2 d-block">
                        <img src="assets/images/Icon_Zalo.png" alt="Zalo" style="width: 40px; height: 40px; vertical-align: middle;"> Zalo
                    </a>
                    <a href="https://instagram.com" target="_blank" class="text-white mb-2 d-block">
                        <img src="assets/images/instagram-icon.png" alt="Instagram" style="width: 40px; height: 40px; vertical-align: middle;"> Instagram
                    </a>
                </div>
                <!-- Shop Address and Phone -->
                <h5 class="text-white">Liên Hệ</h5>
                <p class="text-white">
                    Địa chỉ: 736 Đ. Nguyễn Trãi, Phường 11, Quận 5, Hồ Chí Minh, Việt Nam<br>
                    Điện thoại: <a href="tel:0123456789" class="text-white">0123 456 789</a>
                </p>
            </div>

            <!-- Google Map Location -->
            <div class="col-md-6">
                <h4 class="text-white">Vị trí cửa hàng</h4>
                <div class="is-divider small mb-3"></div>
                <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d7839.511726896418!2d106.65780347509468!3d10.753289459619943!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752ef6ca551517%3A0xc331bdcaa0992e4b!2zNzM2IMSQLiBOZ3V54buFbiBUcsOjaSwgUGjGsOG7nW5nIDExLCBRdeG6rW4gNSwgSOG7kyBDaMOtIE1pbmgsIFZp4buHdCBOYW0!5e0!3m2!1svi!2sus!4v1731838504248!5m2!1svi!2sus" width="100%" height="250" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
            </div>
        </div>
    </div>
</div>

<!-- Footer Copyright -->
<div class="py-2 bg-primary">
    <div class="text-center">
        <p class="mb-0 text-white">Copyright ©2024, FlowerShop, All rights reserved</p>
    </div>
</div>

<!-- Thêm Font Awesome CSS cho icon -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
