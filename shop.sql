-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th12 06, 2024 lúc 04:08 PM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `shop`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `carts`
--

CREATE TABLE `carts` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `prod_id` int(11) NOT NULL,
  `prod_qty` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `carts`
--

INSERT INTO `carts` (`id`, `user_id`, `prod_id`, `prod_qty`, `created_at`) VALUES
(61, 5, 35, 3, '2024-12-06 14:49:12'),
(62, 5, 48, 4, '2024-12-06 14:50:48'),
(63, 5, 43, 4, '2024-12-06 14:51:10');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `popular` tinyint(4) NOT NULL DEFAULT 0,
  `image` varchar(255) NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `description`, `status`, `popular`, `image`, `meta_title`, `meta_description`, `meta_keyword`, `created_at`) VALUES
(15, 'HOA TÌNH YÊU', '', '', 0, 1, '15365_together.jpg', '', '', '', '2024-03-17 02:08:45'),
(16, 'HOA SINH NHẬT', '', '', 0, 1, '15557_vong-tay-yeu-thuong.jpg', '', '', '', '2024-03-19 09:53:22'),
(17, 'HOA MẪU MỚI', '', '', 0, 1, '12996_with-deepest-sympathy.jpg', '', '', '', '2024-03-20 15:23:43'),
(19, 'CÂY VĂN PHÒNG', '', '', 0, 1, '8174_trau-ba-cot-chau-su.jpg', '', '', '', '2024-03-21 14:42:42'),
(20, 'Hoa Chúc Mừng', '', '', 0, 0, '14927_no-luc-vuon-xa.jpg', '', '', '', '2024-11-17 13:52:17'),
(21, 'Hoa Chia Buồn', '', '', 0, 0, '13145_ke-chia-buon-03.jpg', '', '', '', '2024-11-17 13:52:36'),
(22, 'Kẹo Ngọt ', '', '', 0, 0, '13015_propose-heart-2.jpg', '', '', '', '2024-11-17 13:53:45'),
(23, 'Quà Tặng', '', '', 0, 0, '1731851756.jpg', '', '', '', '2024-11-17 13:55:56');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `tracking_no` varchar(255) NOT NULL,
  `user_id` int(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` int(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `pincode` int(255) NOT NULL,
  `total_price` int(255) NOT NULL,
  `payment_mode` varchar(255) NOT NULL,
  `payment_id` varchar(255) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `comments` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`id`, `tracking_no`, `user_id`, `name`, `email`, `phone`, `address`, `pincode`, `total_price`, `payment_mode`, `payment_id`, `status`, `comments`, `created_at`) VALUES
(18, 'madon860423525098', 1, 'Cao Quốc Kien', 'Kien2020@gmail.com', 123525098, 'Miền đất hứa, quận 1, tp hồ chí minh', 1, 650000, 'Thanh Toán Khi Nhận Hàng', '', 0, NULL, '2024-11-27 08:21:51'),
(19, 'madon740211226335', 1, 'bùi trương tuấn', 'chimxanh@gmail.com', 11226335, 'trái đất 7, vũ trụ 7', 10, 1180000, 'Thanh Toán Khi Nhận Hàng', '', 2, NULL, '2024-11-27 08:42:18'),
(20, 'madon570611226335', 9, 'Kaito kid', 'kid@gmail.com', 11226335, 'văn phòng thám tử mori', 2, 650000, 'Thanh Toán Khi Nhận Hàng', '', 1, NULL, '2024-11-27 08:45:25');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_items`
--

CREATE TABLE `order_items` (
  `id` int(11) NOT NULL,
  `order_id` int(255) NOT NULL,
  `prod_id` int(255) NOT NULL,
  `qty` int(255) NOT NULL,
  `price` int(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `prod_id`, `qty`, `price`, `created_at`) VALUES
(20, 18, 44, 1, 650000, '2024-11-27 08:21:51'),
(21, 19, 40, 1, 350000, '2024-11-27 08:42:19'),
(22, 19, 37, 1, 300000, '2024-11-27 08:42:19'),
(23, 19, 36, 1, 400000, '2024-11-27 08:42:19'),
(24, 19, 35, 1, 130000, '2024-11-27 08:42:19'),
(25, 20, 40, 1, 350000, '2024-11-27 08:45:25'),
(26, 20, 37, 1, 300000, '2024-11-27 08:45:25');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `small_description` varchar(5000) NOT NULL,
  `description` varchar(5000) NOT NULL,
  `original_price` int(11) NOT NULL,
  `selling_price` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `qty` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `trending` tinyint(4) NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `category_id`, `name`, `small_description`, `description`, `original_price`, `selling_price`, `image`, `qty`, `status`, `trending`, `meta_title`, `meta_description`, `meta_keyword`, `created_at`) VALUES
(35, 0, 'Shyly', 'Bó hoa tươi - Shyly', 'Hoa cẩm chướng hồng, với sắc thái tượng trưng cho lòng biết ơn và tình yêu, thường được chọn làm quà tặng trong Ngày của Mẹ để biểu dương tình mẫu tử. Sự ngọt ngào mà màu hồng mang lại cũng làm nó trở thành lựa chọn phổ biến để thể hiện tình yêu và sự qua', 150000, 130000, '1731847406.jpg', -1, 0, 1, 'Bó hoa tươi - Shyly', 'Hoa cẩm chướng hồng, với sắc thái tượng trưng cho lòng biết ơn và tình yêu, thường được chọn làm quà tặng trong Ngày của Mẹ để biểu dương tình mẫu tử. Sự ngọt ngào mà màu hồng mang lại cũng làm nó trở thành lựa chọn phổ biến để thể hiện tình yêu và sự qua', 'Bó hoa tươi - Shyly - 13236', '2024-11-17 12:43:26'),
(36, 0, 'Gold Love', 'Sản phẩm bao gồm:\r\nHoa baby : 1\r\nHồng vàng chùa : 15\r\nSản phẩm thực nhận có thể khác với hình đại diện trên website (đặc điểm thủ công và tính chất tự nhiên của hàng nông nghiệp)\r\nHoa giao nhanh 60 phút Hồ Chí Minh', 'Sản phẩm bạn đang chọn là sản phẩm được thiết kế đặc biệt!', 420000, 400000, '1731847645.jpg', -1, 0, 1, 'Bó hoa tươi ', 'Gold love ', 'Bó hoa tươi - Gold love - 15550', '2024-11-17 12:47:25'),
(37, 0, 'tinh yeu bat tu', 'Hoa cúc bất tử là biểu tượng của sự trường tồn và bền vững trong tình cảm, được nhiều người yêu thích vì ý nghĩa sâu sắc của nó. Loài hoa này thể hiện sự kiên cường và bất khuất trước những khó khăn, giống như tên gọi \"bất tử\" của nó. Dù trong gió mưa hay nghịch cảnh, hoa vẫn nở tươi, vươn lên mạnh mẽ. Trong tình yêu và tình bạn, hoa cúc bất tử đại diện cho lòng trung thành, sự thủy chung và mối quan hệ bền lâu, vượt qua thời gian và thử thách. Chính vì vậy, hoa cúc bất tử thường được tặng trong những dịp để bày tỏ lòng biết ơn và tôn vinh những mối quan hệ bền chặt, không bao giờ phai nhạt.', 'Sản phẩm bạn đang chọn là sản phẩm được thiết kế đặc biệt!', 350000, 300000, '1731847768.jpg', -2, 0, 1, '', '', 'Bó hoa tươi - Tình yêu bất tử - 15514', '2024-11-17 12:49:28'),
(38, 0, 'Tinh khiết', 'Sản phẩm bao gồm:\r\nHồng trắng cồ: 10\r\n', '', 300000, 277000, '1731847840.jpg', 0, 0, 1, '', '', 'Bó hoa tươi - Tinh khiết - 15548', '2024-11-17 12:50:40'),
(39, 0, 'Hồng mix (30 bông) ', '*Hồng Đà Lạt theo mùa\r\n*Hoa kèm bình men sứ màu ngẫu nhiên\r\nSản phẩm bao gồm:\r\nHồng mix màu ngẫu nhiên: 30', 'Hoa giao nhanh 60 phút Hồ Chí Minh\r\n\r\nLưu ý\r\nSản phẩm bạn đang chọn là sản phẩm được thiết kế đặc biệt!', 750000, 500000, '1731847987.jpg', 0, 0, 1, '', '', 'Bình hoa tươi - Hồng mix (30 bông) - 11530', '2024-11-17 12:53:07'),
(40, 0, 'Blink 2', 'Sản phẩm bao gồm:\r\nCúc Tana: 2\r\nHồng Hermosa: 12', 'Hoa giao nhanh 60 phút Hồ Chí Minh\r\n\r\nLưu ý\r\nSản phẩm bạn đang chọn là sản phẩm được thiết kế đặc biệt!', 377000, 350000, '1731848233.jpg', -2, 0, 1, '', '', 'Bó hoa tươi - Blink 2 - 15549', '2024-11-17 12:57:13'),
(41, 15, 'Tình đầu thơ ngây ', '', 'Sản phẩm bao gồm:\r\nCẩm chướng chùm hồng viền: 3\r\nCúc calimero hồng : 3\r\nHoa Sao tím: 1\r\nPink OHara: 1\r\n\r\nHoa giao nhanh 60 phút Hồ Chí Minh\r\nLưu ý\r\nSản phẩm bạn đang chọn là sản phẩm được thiết kế đặc biệt!', 275000, 250000, '1731849113.jpg', 0, 0, 1, '', '', 'Hoa tình yêu - Tình đầu thơ ngây - 13262', '2024-11-17 13:11:53'),
(43, 15, 'Người thương', '', 'Sản phẩm bao gồm:\r\nHoa thạch thảo trắng: 2\r\nHồng da: 10', 400000, 350000, '1731849429.jpg', 0, 0, 1, '', '', 'Hoa tình yêu - Người thương - 13372', '2024-11-17 13:17:09'),
(44, 15, 'Only rose premium', '', 'Sản phẩm bao gồm:\r\nHồng đỏ Pháp: 30', 800000, 650000, '1731849537.jpg', -1, 0, 1, '', '', 'Hoa tình yêu - Only rose premium 1 - 13254', '2024-11-17 13:18:57'),
(45, 15, 'Gửi ngàn lời yêu', '', 'Giỏ hoa được thiết kế từ hồng đỏ , cẩm chường đỏ...chứa đựng những thông điệp yêu thương mà người gửi dành cho người nhận.\r\nSản phẩm bao gồm:\r\nCẩm chướng đơn đỏ : 10\r\nCát tường trắng: 3\r\nHoa Sao tím: 1\r\nHồng đỏ Ecuador DL: 8', 600000, 600000, '1731849661.jpg', 0, 0, 1, '', '', 'Hoa tình yêu - Gửi ngàn lời yêu - 13116', '2024-11-17 13:19:51'),
(47, 16, 'Romance ', '', 'Sản phẩm bao gồm:\r\nHoa Sao tím: 1\r\nLá phụ khác: 7\r\nPurple Ohara : 18', 800000, 550000, '1731850344.jpg', 0, 0, 0, '', '', 'Hoa sinh nhật - Romance 3 - 12490', '2024-11-17 13:32:24'),
(48, 16, 'Chuyện của nắng', '', 'Sản phẩm bao gồm:\r\nCát tường nhật hồng: 1\r\nCúc rossi trắng: 4\r\nFree Spirit Rose (10): 6\r\nHoa baby : 1\r\nHồng trứng gà : 10', 800000, 750000, '1731850401.jpg', 0, 0, 0, '', '', 'Hoa sinh nhật - Chuyện của nắng - 13258', '2024-11-17 13:33:21'),
(49, 16, 'The greatest thing', '', 'Sản phẩm bao gồm:\r\nHoa baby : 4', 500000, 450000, '1731850474.jpg', 0, 0, 0, '', '', 'Hoa sinh nhật - The greatest thing - 13293', '2024-11-17 13:34:34'),
(50, 16, 'Tình đầu thơ ngây', '', 'Sản phẩm bao gồm:\r\nCẩm chướng chùm hồng viền: 3\r\nCúc calimero hồng : 3\r\nHoa Sao tím: 1\r\nPink OHara: 1', 275000, 250000, '1731850524.jpg', 0, 0, 0, '', '', 'Hoa sinh nhật - Tình đầu thơ ngây - 13262', '2024-11-17 13:35:24'),
(51, 17, 'Rạng rỡ', '', 'ƯU ĐÃI ĐẶC BIỆT\r\nTặng banner hoặc thiệp (trị giá 20.000đ - 50.000đ) miễn phí\r\nGiảm tiếp 3% cho đơn hàng Bạn tạo ONLINE lần thứ 2, 5% cho đơn hàng Bạn tạo ONLINE lần thứ 6 và 10% cho đơn hàng Bạn tạo ONLINE lần thứ 12.\r\nMiễn phí giao khu vực nội thành (chi tiết)\r\nGiao gấp trong vòng 2 giờ\r\nCam kết 100% hoàn lại tiền nếu Bạn không hài lòng\r\nCam kết hoa tươi trên 3 ngày', 1277000, 1200000, '1731851000.jpg', 0, 0, 0, '', '', 'Mẫu hoa mới - Rạng rỡ 2 - 12491', '2024-11-17 13:43:20'),
(52, 17, 'Gặp gỡ', '', 'Với tone màu hồng nhẹ nhàng, nữ tính. Bó hoa là món quà tuyệt vời dành tặng cho những bạn nữ yêu thích sự lãng mạn và tràn đầy yêu thương. Thích hợp tặng dịp sinh nhật, làm quen, kỷ niệm ...\r\nSản phẩm bao gồm:\r\nHoa baby : 0,5\r\nPink OHara: 1', 177000, 150000, '1731851079.jpg', 0, 0, 0, '', '', 'Mẫu hoa mới - Gặp gỡ - 5598', '2024-11-17 13:44:39'),
(54, 19, 'Cây hạnh phúc nội thất', '', 'Cây Hạnh phúc là một lựa chọn hoàn hảo để thêm một chút xanh mát cho bất kỳ không gian nào từ phòng khách, ban công, đến quán cà phê và văn phòng. Với vẻ ngoài tươi tốt và lớp lá xanh biếc, cây không chỉ làm đẹp không gian mà còn giúp cải thiện chất lượng không khí, mang lại cảm giác thư thái và dễ chịu. *** Lưu ý: SẢN PHẨM HIỆN CHỈ CUNG CẤP TẠI TP.HỒ CHÍ MINH', 1200000, 1100000, '1731851264.jpg', 0, 0, 0, '', '', 'Cây văn phòng - Cây hạnh phúc nội thất - 12200', '2024-11-17 13:47:44'),
(55, 19, 'Trầu bà cẩm thạch VP', '', 'Trầu bà cẩm thạch là một sự lựa chọn tuyệt vời để trang trí trong nhà, đặc biệt phù hợp cho những không gian nhỏ như góc phòng, kệ sách, nhà bếp hoặc phòng tắm. Với những lá có màu xanh và trắng đan xen kèm sức sống mãnh liệt, loại cây này không chỉ thêm một chút màu sắc tươi mới cho không gian mà còn có tác dụng thanh lọc không khí mang lại cảm giác thư giãn và tinh tế. *** Lưu ý: SẢN PHẨM HIỆN CHỈ CUNG CẤP TẠI KHU VỰC TP.HCM', 487000, 460000, '1731851453.jpg', 0, 0, 0, 'Cây văn phòng - Trầu bà cẩm thạch VP - 12923', 'ƯU ĐÃI ĐẶC BIỆT\r\nTặng banner hoặc thiệp (trị giá 20.000đ - 50.000đ) miễn phí\r\nGiảm tiếp 3% cho đơn hàng Bạn tạo ONLINE lần thứ 2, 5% cho đơn hàng Bạn tạo ONLINE lần thứ 6 và 10% cho đơn hàng Bạn tạo ONLINE lần thứ 12.\r\nMiễn phí giao khu vực nội thành (chi', 'Cây văn phòng - Trầu bà cẩm thạch VP - 12923', '2024-11-17 13:50:35'),
(56, 20, 'Tiếp bước', 'Sự kết hợp của màu xanh pastel nhẹ nhàng và các sắc trắng tạo nên một kệ hoa mang lại cảm giác tươi mát, trong lành và thanh khiết. Kệ hoa này biểu trưng cho sự khởi đầu mới mẻ và đầy hy vọng, là món quà tuyệt vời để chúc mừng những bước đi đầu tiên hoặc sự khởi động của một dự án quan trọng.', 'Sự kết hợp của màu xanh pastel nhẹ nhàng và các sắc trắng tạo nên một kệ hoa mang lại cảm giác tươi mát, trong lành và thanh khiết. Kệ hoa này biểu trưng cho sự khởi đầu mới mẻ và đầy hy vọng, là món quà tuyệt vời để chúc mừng những bước đi đầu tiên hoặc sự khởi động của một dự án quan trọng.\r\nSản phẩm bao gồm:\r\nCát tường trắng: 5\r\nCúc rossi trắng: 10\r\nHồng trắng cồ: 5\r\nĐồng tiền trắng nhí : 15', 777000, 750000, '1731852398.jpg', 0, 0, 0, '', '', 'Hoa chúc mừng - Tiếp bước - 15494', '2024-11-17 14:06:38'),
(57, 20, 'Hi vọng xanh', 'Màu xanh dương đậm trong kệ hoa này tượng trưng cho sự tin tưởng, trung thành và hi vọng. Đây là một lựa chọn hoàn hảo để gửi đi thông điệp về sự vững chắc và lòng quyết tâm trong công việc hoặc các dự án mới. Kệ hoa này phù hợp để chúc mừng các đối tác, đồng nghiệp với ý nghĩa mong muốn sự phát triển bền vững và niềm hi vọng đạt được thành công trong tương lai.', 'Màu xanh dương đậm trong kệ hoa này tượng trưng cho sự tin tưởng, trung thành và hi vọng. Đây là một lựa chọn hoàn hảo để gửi đi thông điệp về sự vững chắc và lòng quyết tâm trong công việc hoặc các dự án mới. Kệ hoa này phù hợp để chúc mừng các đối tác, đồng nghiệp với ý nghĩa mong muốn sự phát triển bền vững và niềm hi vọng đạt được thành công trong tương lai.\r\nSản phẩm bao gồm:\r\nCúc calimero trắng : 10\r\nCúc mẫu đơn xanh dương NK: 3\r\nHồng trắng cồ: 7\r\nĐồng tiền trắng nhí : 20', 877000, 850000, '1731852440.jpg', 0, 0, 0, '', '', 'Hoa chúc mừng - Hi vọng xanh - 15493', '2024-11-17 14:07:20'),
(58, 21, 'Chia Xa', 'Sản phẩm bao gồm:\r\nCúc lưới trắng : 15\r\nHoa Cúc Lưới Vàng : 5', 'Sản phẩm bao gồm:\r\nCúc lưới trắng : 15\r\nHoa Cúc Lưới Vàng : 5', 327000, 300000, '1731852504.jpg', 0, 0, 0, '', '', 'Hoa chia buồn - Chia xa - 12911', '2024-11-17 14:08:24'),
(59, 21, 'Bó hoa chia buồn ', 'Sản phẩm bao gồm:\r\nCúc lưới trắng : 3\r\nGreen bell: 3\r\nHoa thạch thảo trắng: 1\r\nHồng trắng cồ: 5\r\nMõm sói trắng : 5', 'Sản phẩm bao gồm:\r\nCúc lưới trắng : 3\r\nGreen bell: 3\r\nHoa thạch thảo trắng: 1\r\nHồng trắng cồ: 5\r\nMõm sói trắng : 5', 370000, 350000, '1731852549.jpg', 0, 0, 0, '', '', 'Hoa chia buồn - Bó hoa chia buồn - 14337', '2024-11-17 14:09:09'),
(60, 22, ' Chocolate truffle nâu 9', 'Hộp quà Valentine socola truffle 9 viên tươi với hương vị độc đáo từ Legendary chắc chắn sẽ khiến ai cũng “ mê như điếu đổ” bởi sự sang trọng, tinh tế. Đừng suy nghĩ nữa mà hãy đặt ngay một hộp quà socola truffle dành tặng cho người thương của mình.', 'Hộp quà Valentine socola truffle 9 viên tươi với hương vị độc đáo từ Legendary chắc chắn sẽ khiến ai cũng “ mê như điếu đổ” bởi sự sang trọng, tinh tế. Đừng suy nghĩ nữa mà hãy đặt ngay một hộp quà socola truffle dành tặng cho người thương của mình.', 347000, 320000, '1731852627.jpg', 0, 0, 1, '', '', 'Chocolate - Chocolate truffle nâu 9 - 12752', '2024-11-17 14:10:27'),
(61, 22, 'Bánh kem Tous les Jours Ganache 1', 'Lớp bánh bông lan xốp mềm kết hợp với lớp bột socola nâu ngọt dịu đã làm nên món bánh kem vô cùng hấp dẫn! Chiếc bánh kem này thực sự là món quà tuyệt vời và phù hợp để dành tặng cho các dịp chúc mừng. Hi vọng chiếc bánh kem Mocha 4 này sẽ làm tăng hương vị ngọt ngào cho cuộc sống của bạn và người thân yêu.', 'Lớp bánh bông lan xốp mềm kết hợp với lớp bột socola nâu ngọt dịu đã làm nên món bánh kem vô cùng hấp dẫn! Chiếc bánh kem này thực sự là món quà tuyệt vời và phù hợp để dành tặng cho các dịp chúc mừng. Hi vọng chiếc bánh kem Mocha 4 này sẽ làm tăng hương vị ngọt ngào cho cuộc sống của bạn và người thân yêu.', 532000, 505000, '1731852674.png', 0, 0, 0, '', '', 'Bánh kem Tous les Jours - Ganache 1 - 8453', '2024-11-17 14:11:14'),
(62, 23, ' Capybara má phồng (40cm)', 'Size: 40cm. Kèm rùa bông sau lưng', 'Size: 40cm. Kèm rùa bông sau lưng', 357000, 330000, '1731852746.jpg', 0, 0, 0, '', '', 'Gấu bông - Capybara má phồng (40cm) - 14414', '2024-11-17 14:12:26'),
(63, 23, 'Mèo trái thơm (40cm)', 'Size: 40cm', 'Size: 40cm', 347000, 320000, '1731852792.jpg', 0, 0, 0, '', '', 'Gấu bông - Mèo trái thơm (40cm) - 5381', '2024-11-17 14:13:12'),
(64, 15, 'Premium vase 3', 'Sản phẩm bao gồm:\r\nBaby nhuộm hồng nhạt NK: 1\r\nCúc mẫu đơn hồng đào NK : 12\r\nHồng ecuador explorer NK: 8\r\nHồng song hỷ cồ : 15', 'Tặng banner hoặc thiệp (trị giá 20.000đ - 50.000đ) miễn phí\r\nGiảm tiếp 3% cho đơn hàng Bạn tạo ONLINE lần thứ 2, 5% cho đơn hàng Bạn tạo ONLINE lần thứ 6 và 10% cho đơn hàng Bạn tạo ONLINE lần thứ 12.\r\nMiễn phí giao khu vực nội thành (chi tiết)\r\nGiao gấp trong vòng 2 giờ\r\nCam kết 100% hoàn lại tiền nếu Bạn không hài lòng\r\nCam kết hoa tươi trên 3 ngày', 3027000, 3000000, '1733125957.jpg', 0, 0, 0, 'Hoa tình yêu - Premium vase 3 - 13308', '', '13308', '2024-12-02 07:52:37'),
(65, 15, 'Hơn cả yêu ', 'Hạnh phúc 1 ngày sẽ đến, anh vững tin vào điều ấy. Vì bên anh, rất ấm áp đôi vòng tay này. Và nếu như đời giông bão, chỉ cần anh được bên em. Vì tình yêu cho anh thêm vững bước đi. Điều anh cần là được có em bên cùng nắm tay trải qua những điều ngọt ngào nhất trong cuộc đời. Tone màu hông pastel hiện đại sẽ là hộp hoa nổi bật và thích thú cho người nhận. Thích hợp tặng sinh nhật, kỷ niệm...', 'Sản phẩm bao gồm:\r\nCẩm chướng đơn đỏ : 5\r\nCát tường hồng viền: 3\r\nHồng da: 10\r\nHồng đỏ Ecuador DL: 20\r\nLan Moka đỏ: 2\r\nRed Elegance : 15\r\nSen đá chuỗi ngọc bi : 3', 1900000, 1800000, '1733126213.jpg', 0, 0, 1, 'Hoa tình yêu - Hơn cả yêu - 8290', '', '8290', '2024-12-02 07:56:53'),
(66, 15, 'Jolie ', 'Sản phẩm bao gồm:\r\nCúc calimero hồng : 10\r\nCúc mẫu đơn hồng nhạt DL : 5\r\nHoa baby : 2\r\nMõm sói song hỷ : 12\r\nPink OHara: 16', 'Sản phẩm bao gồm:\r\nCúc calimero hồng : 10\r\nCúc mẫu đơn hồng nhạt DL : 5\r\nHoa baby : 2\r\nMõm sói song hỷ : 12\r\nPink OHara: 16', 1600000, 1500000, '1733126327.jpg', 0, 0, 0, 'Hoa tình yêu - Jolie - 13242', '', 'Hoa tình yêu - Jolie - 13242', '2024-12-02 07:58:47'),
(67, 15, 'Only rose premium 3', 'Sản phẩm bao gồm:\r\nHồng tím cà: 30', 'Sản phẩm bao gồm:\r\nHồng tím cà: 30', 850000, 650000, '1733126401.jpg', 0, 0, 0, 'Only rose premium 3 - 13277', '', '\r\nHoa tình yêu - Only rose premium 3 - 13277', '2024-12-02 08:00:01'),
(68, 15, 'My Tana', 'Sản phẩm bao gồm:\r\nCúc Tana: 15', 'Sản phẩm bao gồm:\r\nCúc Tana: 15', 625000, 500000, '1733126591.jpg', 0, 0, 1, 'Hoa tình yêu - My Tana - 13291', 'ƯU ĐÃI ĐẶC BIỆT\r\nTặng banner hoặc thiệp (trị giá 20.000đ - 50.000đ) miễn phí\r\nGiảm tiếp 3% cho đơn hàng Bạn tạo ONLINE lần thứ 2, 5% cho đơn hàng Bạn tạo ONLINE lần thứ 6 và 10% cho đơn hàng Bạn tạo ONLINE lần thứ 12.\r\nMiễn phí giao khu vực nội thành (chi', 'Hoa tình yêu - My Tana - 13291', '2024-12-02 08:03:11'),
(69, 15, 'Purple Love', 'Hoa hồng tím là một trong loài hoa khá đặc biệt và hiếm thấy do đó ý nghĩa của nó cũng rất đặc biệt. Là bó hoa tình yêu tuyệt vời để bạn thể hiện tình cảm của mình trong những dịp đặc biệt, sẽ là món quà độc đáo và sang trọng trong tình yêu khi bạn muốn thể hiện tình cảm đặc biệt của mình dành cho người mà bạn yêu mến. Màu tím là màu của sự quyến rũ của tình yêu say mê\r\nSản phẩm bao gồm:\r\nHoa Sao tím: 5\r\nHồng tím cà: 100', 'Hoa hồng tím là một trong loài hoa khá đặc biệt và hiếm thấy do đó ý nghĩa của nó cũng rất đặc biệt. Là bó hoa tình yêu tuyệt vời để bạn thể hiện tình cảm của mình trong những dịp đặc biệt, sẽ là món quà độc đáo và sang trọng trong tình yêu khi bạn muốn thể hiện tình cảm đặc biệt của mình dành cho người mà bạn yêu mến. Màu tím là màu của sự quyến rũ của tình yêu say mê\r\nSản phẩm bao gồm:\r\nHoa Sao tím: 5\r\nHồng tím cà: 100', 2800000, 1800000, '1733127532.jpg', 0, 0, 0, 'Hoa tình yêu - Purple Love - 5384', 'Tặng banner hoặc thiệp (trị giá 20.000đ - 50.000đ) miễn phí\r\nGiảm tiếp 3% cho đơn hàng Bạn tạo ONLINE lần thứ 2, 5% cho đơn hàng Bạn tạo ONLINE lần thứ 6 và 10% cho đơn hàng Bạn tạo ONLINE lần thứ 12.\r\nMiễn phí giao khu vực nội thành (chi tiết)\r\nGiao gấp ', 'Hoa tình yêu - Purple Love - 5384', '2024-12-02 08:18:52'),
(70, 15, 'Trăm năm tình yêu', '\r\nSản phẩm bao gồm:\r\nHoa baby : 1\r\nHồng đỏ Pháp: 100', '\r\nSản phẩm bao gồm:\r\nHoa baby : 1\r\nHồng đỏ Pháp: 100', 2900000, 1900000, '1733128455.jpg', 0, 0, 0, 'Hoa tình yêu - Trăm năm tình yêu - 13278', 'Hoa tình yêu - Trăm năm tình yêu - 13278', 'Hoa tình yêu - Trăm năm tình yêu - 13278', '2024-12-02 08:34:15'),
(71, 15, 'Tím yêu thương', 'Hộp hoa \"Tím yêu thương\" là sự kết hợp ngọt ngào của hoa hồng tím và hoa hồng da, cẩm chướng. Thích hợp để gửi tặng đến những người mà bạn yêu thương nhất.\r\nSản phẩm bao gồm:\r\nCẩm chướng đơn tím : 5\r\nCúc calimero tím: 2\r\nHoa Sao tím: 3\r\nHồng da: 7\r\nHồng tím cà: 6', 'Hộp hoa \"Tím yêu thương\" là sự kết hợp ngọt ngào của hoa hồng tím và hoa hồng da, cẩm chướng. Thích hợp để gửi tặng đến những người mà bạn yêu thương nhất.\r\nSản phẩm bao gồm:\r\nCẩm chướng đơn tím : 5\r\nCúc calimero tím: 2\r\nHoa Sao tím: 3\r\nHồng da: 7\r\nHồng tím cà: 6', 550000, 500000, '1733128769.jpg', 0, 0, 0, '', '', '', '2024-12-02 08:39:29'),
(72, 15, 'Tin Yêu', 'Niềm tin và sự yêu thương chính là 2 yếu tố quyết định tình yêu của bạn có đi đến bến bờ hạnh phúc hay không. Vậy nên, từng giây phút hãy luôn nỗ lực tạo độ bền chặt cho tình yêu bằng sự tin yêu bạn nhé! Thỉnh thoảng cũng hãy tạo sự bất ngờ thú vị cho đối phương bằng việc tặng hoa, một hành động tuy nhỏ nhưng lại gia tăng sự hạnh phúc cho các cặp đôi.\r\nSản phẩm bao gồm:\r\nHoa baby : 1\r\nHồng da: 15\r\nMõm sói trắng : 6\r\nĐồng tiền hồng nhí : 12', 'Niềm tin và sự yêu thương chính là 2 yếu tố quyết định tình yêu của bạn có đi đến bến bờ hạnh phúc hay không. Vậy nên, từng giây phút hãy luôn nỗ lực tạo độ bền chặt cho tình yêu bằng sự tin yêu bạn nhé! Thỉnh thoảng cũng hãy tạo sự bất ngờ thú vị cho đối phương bằng việc tặng hoa, một hành động tuy nhỏ nhưng lại gia tăng sự hạnh phúc cho các cặp đôi.\r\nSản phẩm bao gồm:\r\nHoa baby : 1\r\nHồng da: 15\r\nMõm sói trắng : 6\r\nĐồng tiền hồng nhí : 12', 777000, 700000, '1733128867.png', 0, 0, 0, '', '', '', '2024-12-02 08:41:07'),
(73, 15, 'Vì em', 'Mỗi loại hoa Hồng mang một ý nghĩa thì \"Vì em\" chính là một món quà đến từ những bông Hồng tuyệt đẹp nhất mang theo thông điệp của những ý nghĩa bất ngờ. Đó là một cách tuyệt vời để khiến bữa sinh nhật được tỏa sáng, thêm gia vị cho những dịp kỉ niệm hay đơn giản chỉ muốn tạo nên những ngày đáng nhớ trong cuộc đời người tặng.\r\nSản phẩm bao gồm:\r\nCúc calimero trắng : 6\r\nHoa baby : 1\r\nHồng trứng gà : 10\r\nHồng đỏ ớt : 13\r\nMõm sói vàng: 6', 'Mỗi loại hoa Hồng mang một ý nghĩa thì \"Vì em\" chính là một món quà đến từ những bông Hồng tuyệt đẹp nhất mang theo thông điệp của những ý nghĩa bất ngờ. Đó là một cách tuyệt vời để khiến bữa sinh nhật được tỏa sáng, thêm gia vị cho những dịp kỉ niệm hay đơn giản chỉ muốn tạo nên những ngày đáng nhớ trong cuộc đời người tặng.\r\nSản phẩm bao gồm:\r\nCúc calimero trắng : 6\r\nHoa baby : 1\r\nHồng trứng gà : 10\r\nHồng đỏ ớt : 13\r\nMõm sói vàng: 6', 1150000, 1100000, '1733128942.jpg', 0, 0, 0, 'Hoa tình yêu - Vì em - 10688', 'Hoa tình yêu - Vì em - 10688', 'Hoa tình yêu - Vì em - 10688', '2024-12-02 08:42:22'),
(74, 15, 'Simple', 'Bó hoa \"Simple\" cực kì đơn giản từ màu hoa đến cách bó, thích hợp dành tặng những người yêu thích sự mộc mạc, giản dị.\r\nSản phẩm bao gồm:\r\nHoa baby : 1\r\nHồng trứng gà : 10\r\nĐinh lăng : 15', 'Bó hoa \"Simple\" cực kì đơn giản từ màu hoa đến cách bó, thích hợp dành tặng những người yêu thích sự mộc mạc, giản dị.\r\nSản phẩm bao gồm:\r\nHoa baby : 1\r\nHồng trứng gà : 10\r\nĐinh lăng : 15', 840000, 540000, '1733128996.jpg', 0, 0, 0, '', '', '', '2024-12-02 08:43:16'),
(75, 15, 'Gửi Người Tôi Yêu', 'Qua bàn tay thiết kế của các florist chuyên nghiệp, mẫu hoa Gửi Người Tôi Yêu đem lại một sắc thái hoàn toàn mới tạo cho người ngắm như đang thu mình lại giữa rừng hoa. Thích hợp gửi tặng người yêu, vợ/chồng trong các dịp kỉ niệm...\r\nSản phẩm bao gồm:\r\nCẩm chướng đơn hồng: 12\r\nHoa Sao tím: 2\r\nHồng da (50): 20\r\nHồng đỏ sa : 13', 'Qua bàn tay thiết kế của các florist chuyên nghiệp, mẫu hoa Gửi Người Tôi Yêu đem lại một sắc thái hoàn toàn mới tạo cho người ngắm như đang thu mình lại giữa rừng hoa. Thích hợp gửi tặng người yêu, vợ/chồng trong các dịp kỉ niệm...\r\nSản phẩm bao gồm:\r\nCẩm chướng đơn hồng: 12\r\nHoa Sao tím: 2\r\nHồng da (50): 20\r\nHồng đỏ sa : 13', 1150000, 850000, '1733129066.jpg', 0, 0, 0, '', '', '', '2024-12-02 08:44:26'),
(76, 15, 'Ngọc sắc', 'Giỏ hoa gam tím chủ đạo cực kì phù hợp gửi tặng những người phụ nữ bạn yêu thương trong các dịp lễ đặc biệt. Mỗi đoá hoa khoe sắc như cách mà bạn gửi gắm tâm tình của mình đến với người nhận. Hãy tạo thêm những kỉ niệm thật đáng nhớ với người bạn yêu quý nhé.\r\nSản phẩm bao gồm:\r\nCát tường hồng viền: 2\r\nCúc rossi hồng: 5\r\nHồng tím cà: 11\r\nPink OHara: 3', 'Giỏ hoa gam tím chủ đạo cực kì phù hợp gửi tặng những người phụ nữ bạn yêu thương trong các dịp lễ đặc biệt. Mỗi đoá hoa khoe sắc như cách mà bạn gửi gắm tâm tình của mình đến với người nhận. Hãy tạo thêm những kỉ niệm thật đáng nhớ với người bạn yêu quý nhé.\r\nSản phẩm bao gồm:\r\nCát tường hồng viền: 2\r\nCúc rossi hồng: 5\r\nHồng tím cà: 11\r\nPink OHara: 3', 900000, 850000, '1733129114.jpg', 0, 0, 0, '', '', '', '2024-12-02 08:45:14'),
(77, 15, 'Romantic heart', 'Dù Sài Gòn có hàng trăm hàng ngàn con đường nhưng anh luôn có hướng để quay về đó là nơi bình yên, là niềm vui mỗi ngày khi được nhìn thấy em, nấu những món ăn ngon cho em, dành tặng em những cành hoa tươi xinh. Hay những chiều thứ 7 có thời gian anh chở em trên con đường đầy lá thu bay, nhẹ nhàng nhưng ấm áp đến lạ.\r\nSản phẩm bao gồm:\r\nCúc mai trắng: 3\r\nHồng da: 7\r\nMõm sói song hỷ : 10\r\nĐồng tiền tua hồng nhạt: 6', 'Dù Sài Gòn có hàng trăm hàng ngàn con đường nhưng anh luôn có hướng để quay về đó là nơi bình yên, là niềm vui mỗi ngày khi được nhìn thấy em, nấu những món ăn ngon cho em, dành tặng em những cành hoa tươi xinh. Hay những chiều thứ 7 có thời gian anh chở em trên con đường đầy lá thu bay, nhẹ nhàng nhưng ấm áp đến lạ.\r\nSản phẩm bao gồm:\r\nCúc mai trắng: 3\r\nHồng da: 7\r\nMõm sói song hỷ : 10\r\nĐồng tiền tua hồng nhạt: 6', 570000, 500000, '1733129186.jpg', 0, 0, 0, '', '', '', '2024-12-02 08:46:26'),
(78, 15, 'Yêu xa', '\"My love for you remains unchanged despite the distance between us\" is the message of the this cute bouquet.\r\nWith the harmonious combination of pink roses and other flowers, \"KEEP MISSING YOU\" will be a perfect gift for your loved ones.\r\nSản phẩm bao gồm:\r\nHoa baby : 1\r\nHoa Sao tím: 1\r\nHoa sao vàng: 1\r\nHồng da: 3', '\"My love for you remains unchanged despite the distance between us\" is the message of the this cute bouquet.\r\nWith the harmonious combination of pink roses and other flowers, \"KEEP MISSING YOU\" will be a perfect gift for your loved ones.\r\nSản phẩm bao gồm:\r\nHoa baby : 1\r\nHoa Sao tím: 1\r\nHoa sao vàng: 1\r\nHồng da: 3', 250000, 200000, '1733129239.jpg', 0, 0, 0, '', '', '', '2024-12-02 08:47:19'),
(79, 15, 'Tình Yêu Vĩnh Cửu 2', 'Không có tình yêu vĩnh cửu mà chỉ có những giây phút vĩnh cửu của tình yêu. Giây phút ta bên nhau, luôn là những khoảnh khắc yêu thương nhất trong cuộc sống của anh. Bó hoa với 100 hoa hồng đỏ sẽ giúp bạn làm khoảnh khắc ấy càng thêm sâu sắc và sẽ là kỉ niệm không thể quên trong chuyện tình yêu của bạn\r\nSản phẩm bao gồm:\r\nHồng đỏ Pháp: 100\r\nLá bạc : 2', 'Không có tình yêu vĩnh cửu mà chỉ có những giây phút vĩnh cửu của tình yêu. Giây phút ta bên nhau, luôn là những khoảnh khắc yêu thương nhất trong cuộc sống của anh. Bó hoa với 100 hoa hồng đỏ sẽ giúp bạn làm khoảnh khắc ấy càng thêm sâu sắc và sẽ là kỉ niệm không thể quên trong chuyện tình yêu của bạn\r\nSản phẩm bao gồm:\r\nHồng đỏ Pháp: 100\r\nLá bạc : 2', 250000, 200000, '1733129381.jpg', 0, 0, 0, '', '', '', '2024-12-02 08:49:41'),
(80, 23, 'Capybara má phồng (40cm)', 'Size: 40cm. Kèm rùa bông sau lưng', 'Size: 40cm. Kèm rùa bông sau lưng', 330000, 300000, '1733130222.jpg', 0, 0, 0, '', '', '', '2024-12-02 09:03:42'),
(81, 23, 'Shiba Đầu Hoa Size 35cm', 'Chiều dài: 35cm', 'Chiều dài: 35cm', 310000, 300000, '1733130261.jpg', 0, 0, 0, '', '', '', '2024-12-02 09:04:21'),
(82, 23, 'Gấu lười', 'Kích cỡ: 80cm\r\n', 'Kích cỡ: 80cm\r\n', 430000, 400000, '1733130296.jpg', 0, 0, 0, '', '', '', '2024-12-02 09:04:56'),
(83, 23, 'Baby teddy nâu', 'Gấu baby teddy với lớp lông mềm mịn, khuôn mặt với biểu cảm vô cùng đáng yêu chắc hẳn sẽ là món quà đặc biệt dành tặng cho bạn bè, người thân vào những dịp sinh nhật hay tốt nghiệp.... LƯU Ý: SẢN PHẨM HIỆN ĐƯỢC HỖ TRỢ GIAO HÀNG TẠI KHU VỰC HCM. CÁC KV KHÁC, QUÝ KHÁCH VUI LÒNG LIÊN HỆ NHÂN VIÊN TƯ VẤN ĐỂ ĐƯỢC HỖ TRỢ ĐẶT VÀ GIAO HÀNG', 'Gấu baby teddy với lớp lông mềm mịn, khuôn mặt với biểu cảm vô cùng đáng yêu chắc hẳn sẽ là món quà đặc biệt dành tặng cho bạn bè, người thân vào những dịp sinh nhật hay tốt nghiệp.... LƯU Ý: SẢN PHẨM HIỆN ĐƯỢC HỖ TRỢ GIAO HÀNG TẠI KHU VỰC HCM. CÁC KV KHÁC, QUÝ KHÁCH VUI LÒNG LIÊN HỆ NHÂN VIÊN TƯ VẤN ĐỂ ĐƯỢC HỖ TRỢ ĐẶT VÀ GIAO HÀNG', 350000, 330000, '1733130329.jpg', 0, 0, 0, '', '', '', '2024-12-02 09:05:29'),
(84, 23, 'Baby teddy trắng ', 'Gấu baby teddy với lớp lông mềm mịn, khuôn mặt với biểu cảm vô cùng đáng yêu chắc hẳn sẽ là món quà đặc biệt dành tặng cho bạn bè, người thân vào những dịp sinh nhật hay tốt nghiệp.... LƯU Ý: SẢN PHẨM HIỆN ĐƯỢC HỖ TRỢ GIAO HÀNG TẠI KHU VỰC HCM. CÁC KV KHÁC, QUÝ KHÁCH VUI LÒNG LIÊN HỆ NHÂN VIÊN TƯ VẤN ĐỂ ĐƯỢC HỖ TRỢ ĐẶT VÀ GIAO HÀNG.', 'Gấu baby teddy với lớp lông mềm mịn, khuôn mặt với biểu cảm vô cùng đáng yêu chắc hẳn sẽ là món quà đặc biệt dành tặng cho bạn bè, người thân vào những dịp sinh nhật hay tốt nghiệp.... LƯU Ý: SẢN PHẨM HIỆN ĐƯỢC HỖ TRỢ GIAO HÀNG TẠI KHU VỰC HCM. CÁC KV KHÁC, QUÝ KHÁCH VUI LÒNG LIÊN HỆ NHÂN VIÊN TƯ VẤN ĐỂ ĐƯỢC HỖ TRỢ ĐẶT VÀ GIAO HÀNG.', 380000, 350000, '1733130371.jpg', 0, 0, 0, '', '', '', '2024-12-02 09:06:11'),
(85, 23, 'Teddy cá tính size 30', 'Chiều cao: 30cm', 'Chiều cao: 30cm', 200000, 160000, '1733130411.jpg', 0, 0, 0, '', '', '', '2024-12-02 09:06:51'),
(86, 23, 'Gấu Dano đứng', 'Chiều cao: 32 cm\r\n\r\nChất liệu: Len đan thủ công', 'Chiều cao: 32 cm\r\n\r\nChất liệu: Len đan thủ công', 550000, 570000, '1733130451.jpg', 0, 0, 0, '', '', '', '2024-12-02 09:07:31'),
(87, 23, 'Gấu cử nhân ', 'Kích thước sản phẩm: 20 x 25cm', 'Kích thước sản phẩm: 20 x 25cm', 250000, 220000, '1733130515.jpg', 0, 0, 1, '', '', '', '2024-12-02 09:08:35'),
(88, 16, 'Luxury vase 21', '\r\nSản phẩm bao gồm:\r\nCẩm chướng đơn hồng: 10\r\nCúc mẫu đơn hồng đậm NK : 2\r\nCúc mẫu đơn hồng đào NK : 4\r\nCúc mẫu đơn đỏ NK: 4\r\nHồng song hỷ cồ : 10', '\r\nSản phẩm bao gồm:\r\nCẩm chướng đơn hồng: 10\r\nCúc mẫu đơn hồng đậm NK : 2\r\nCúc mẫu đơn hồng đào NK : 4\r\nCúc mẫu đơn đỏ NK: 4\r\nHồng song hỷ cồ : 10', 2000000, 1800000, '1733130692.jpg', 0, 0, 0, '', '', '', '2024-12-02 09:11:32'),
(89, 16, 'Purple Love', 'Hoa hồng tím là một trong loài hoa khá đặc biệt và hiếm thấy do đó ý nghĩa của nó cũng rất đặc biệt. Là bó hoa tình yêu tuyệt vời để bạn thể hiện tình cảm của mình trong những dịp đặc biệt, sẽ là món quà độc đáo và sang trọng trong tình yêu khi bạn muốn thể hiện tình cảm đặc biệt của mình dành cho người mà bạn yêu mến. Màu tím là màu của sự quyến rũ của tình yêu say mê\r\nSản phẩm bao gồm:\r\nHoa Sao tím: 5\r\nHồng tím cà: 100', 'Hoa hồng tím là một trong loài hoa khá đặc biệt và hiếm thấy do đó ý nghĩa của nó cũng rất đặc biệt. Là bó hoa tình yêu tuyệt vời để bạn thể hiện tình cảm của mình trong những dịp đặc biệt, sẽ là món quà độc đáo và sang trọng trong tình yêu khi bạn muốn thể hiện tình cảm đặc biệt của mình dành cho người mà bạn yêu mến. Màu tím là màu của sự quyến rũ của tình yêu say mê\r\nSản phẩm bao gồm:\r\nHoa Sao tím: 5\r\nHồng tím cà: 100', 2800000, 1800000, '1733130739.jpg', 0, 0, 0, '', '', '', '2024-12-02 09:12:19'),
(90, 16, 'This song for you', 'Sản phẩm bao gồm:\r\nCẩm chướng đơn đỏ : 10\r\nChuỗi ngọc đỏ : 10\r\nGreen bell: 1\r\nHồng đỏ Ecuador DL: 12', 'Sản phẩm bao gồm:\r\nCẩm chướng đơn đỏ : 10\r\nChuỗi ngọc đỏ : 10\r\nGreen bell: 1\r\nHồng đỏ Ecuador DL: 12', 877000, 850000, '1733130789.jpg', 0, 0, 0, '', '', '', '2024-12-02 09:13:09'),
(91, 16, 'Party', 'Sản phẩm bao gồm:\r\nCúc calimero vàng nhụy nâu : 10\r\nHoa baby : 1\r\nHồng cam party: 15\r\nHồng trứng gà : 5', 'Sản phẩm bao gồm:\r\nCúc calimero vàng nhụy nâu : 10\r\nHoa baby : 1\r\nHồng cam party: 15\r\nHồng trứng gà : 5', 1000000, 950000, '1733130833.jpg', 0, 0, 1, '', '', '', '2024-12-02 09:13:53'),
(92, 16, 'Luxury vase 23', 'Sản phẩm bao gồm:\r\nCẩm chướng rainbow NK: 10\r\nCúc mẫu đơn xanh dương NK: 10\r\nCúc ping pong trắng : 10\r\nHoa baby : 1', 'Sản phẩm bao gồm:\r\nCẩm chướng rainbow NK: 10\r\nCúc mẫu đơn xanh dương NK: 10\r\nCúc ping pong trắng : 10\r\nHoa baby : 1', 1870000, 1800000, '1733130871.jpg', 0, 0, 0, '', '', '', '2024-12-02 09:14:31'),
(93, 16, 'Premium vase 2', 'Sản phẩm bao gồm:\r\nCúc mẫu đơn xanh dương nhạt DL : 5\r\nCúc mẫu đơn xanh dương NK: 5\r\nHồ điệp cắt cành tím: 2\r\nHồng ecuador explorer NK: 10\r\nLan Moka tím: 3', 'Sản phẩm bao gồm:\r\nCúc mẫu đơn xanh dương nhạt DL : 5\r\nCúc mẫu đơn xanh dương NK: 5\r\nHồ điệp cắt cành tím: 2\r\nHồng ecuador explorer NK: 10\r\nLan Moka tím: 3', 3600000, 3500000, '1733130916.jpg', 0, 0, 0, '', '', '', '2024-12-02 09:15:16'),
(94, 16, 'Premium vase 5', '*Lưu ý: Sản phẩm có sử dụng một số hoa hồng xếp cánh để tạo độ nở to đẹp. Quý khách nên cân nhắc trước khi đặt hàng.\r\nSản phẩm bao gồm:\r\nHồng ecuador explorer NK: 25\r\nRed Elegance : 15', '*Lưu ý: Sản phẩm có sử dụng một số hoa hồng xếp cánh để tạo độ nở to đẹp. Quý khách nên cân nhắc trước khi đặt hàng.\r\nSản phẩm bao gồm:\r\nHồng ecuador explorer NK: 25\r\nRed Elegance : 15', 5100000, 5000000, '1733130958.jpg', 0, 0, 0, '', '', '', '2024-12-02 09:15:58'),
(95, 16, 'Niềm hi vọng 2', 'Sản phẩm bao gồm:\r\nCúc calimero trắng : 10\r\nCúc mẫu đơn xanh dương NK: 7\r\nHoa baby : 2\r\nHồng trắng cồ: 5 (nhuộm xanh dương)', 'Sản phẩm bao gồm:\r\nCúc calimero trắng : 10\r\nCúc mẫu đơn xanh dương NK: 7\r\nHoa baby : 2\r\nHồng trắng cồ: 5 (nhuộm xanh dương)', 1600000, 1450000, '1733131027.jpg', 0, 0, 0, '', '', '', '2024-12-02 09:17:07'),
(96, 17, 'Ohara', '\r\nHoa baby : 1\r\nLá bạc : 3\r\nPink OHara: 20', '\r\nHoa baby : 1\r\nLá bạc : 3\r\nPink OHara: 20', 109500, 100000, '1733131366.jpg', 0, 0, 0, '', '', '', '2024-12-02 09:22:46'),
(97, 17, 'Lovely Morning ', 'Sản phẩm bao gồm:\r\nCát tường xanh: 3\r\nHoa Cúc Lưới Xanh: 3\r\nHồng vàng chùa : 10\r\nHướng dương : 3\r\nLan vũ nữ: 2\r\nThủy tiên vàng: 2', 'Sản phẩm bao gồm:\r\nCát tường xanh: 3\r\nHoa Cúc Lưới Xanh: 3\r\nHồng vàng chùa : 10\r\nHướng dương : 3\r\nLan vũ nữ: 2\r\nThủy tiên vàng: 2', 800000, 700000, '1733131409.jpg', 0, 0, 0, '', '', '', '2024-12-02 09:23:29'),
(98, 17, 'New energy', 'Sản phẩm bao gồm:\r\nCẩm chướng chùm vàng : 5\r\nHoa thạch thảo trắng: 2\r\nHướng dương : 3\r\nLá bạc : 1\r\nLá trúc nâu: 2', 'Sản phẩm bao gồm:\r\nCẩm chướng chùm vàng : 5\r\nHoa thạch thảo trắng: 2\r\nHướng dương : 3\r\nLá bạc : 1\r\nLá trúc nâu: 2', 350000, 300000, '1733131449.jpg', 0, 0, 0, '', '', '', '2024-12-02 09:24:09'),
(99, 17, 'Nỗ lực tiến bước', 'Sản phẩm bao gồm:\r\nHoa hạnh phúc : 15\r\nHồng đỏ sa : 50\r\nHướng dương : 10\r\nLá trầu bà : 10\r\nLá đuôi chồn : 10\r\nLan bò cạp : 15\r\nLan Moka đỏ: 10\r\nMôn xanh: 15\r\nTrúc bách hợp : 10\r\nĐồng tiền vàng : 40', 'Sản phẩm bao gồm:\r\nHoa hạnh phúc : 15\r\nHồng đỏ sa : 50\r\nHướng dương : 10\r\nLá trầu bà : 10\r\nLá đuôi chồn : 10\r\nLan bò cạp : 15\r\nLan Moka đỏ: 10\r\nMôn xanh: 15\r\nTrúc bách hợp : 10\r\nĐồng tiền vàng : 40', 500000, 450000, '1733131501.png', 0, 0, 0, '', '', '', '2024-12-02 09:25:01'),
(100, 17, 'Summer love', 'Sản phẩm bao gồm:\r\nCẩm chướng đơn cam : 4\r\nCát tường trắng: 5\r\nHồng capuchino: 5\r\nHồng Hoả Diệm: 5\r\nHồng trắng cồ: 5', 'Sản phẩm bao gồm:\r\nCẩm chướng đơn cam : 4\r\nCát tường trắng: 5\r\nHồng capuchino: 5\r\nHồng Hoả Diệm: 5\r\nHồng trắng cồ: 5', 625000, 600000, '1733131553.jpg', 0, 0, 0, '', '', '', '2024-12-02 09:25:53'),
(101, 17, 'Hồng sắc 3', 'Lan hồ điệp tượng trưng cho tình yêu thương thuần khiết và sự quý phái, sang trọng. Sản phẩm sẽ là món quà tuyệt vời dành cho người mà bạn yêu thương.\r\nSản phẩm bao gồm:\r\nHồ điệp hồng: 2', 'Lan hồ điệp tượng trưng cho tình yêu thương thuần khiết và sự quý phái, sang trọng. Sản phẩm sẽ là món quà tuyệt vời dành cho người mà bạn yêu thương.\r\nSản phẩm bao gồm:\r\nHồ điệp hồng: 2', 625000, 600000, '1733131618.jpg', 0, 0, 0, '', '', '', '2024-12-02 09:26:58'),
(102, 17, 'Tana Baby', 'Sản phẩm bao gồm:\r\nCúc Tana: 10\r\nHoa baby : 2', 'Sản phẩm bao gồm:\r\nCúc Tana: 10\r\nHoa baby : 2', 577000, 550000, '1733131657.jpg', 0, 0, 0, '', '', '', '2024-12-02 09:27:37'),
(103, 17, 'Mắt biếc', 'Sản phẩm bao gồm:\r\nCúc calimero trắng: 10\r\nCúc mẫu đơn xanh dương NK: 5\r\nGreen bell: 1\r\nHồng trắng cồ: 10', 'Sản phẩm bao gồm:\r\nCúc calimero trắng: 10\r\nCúc mẫu đơn xanh dương NK: 5\r\nGreen bell: 1\r\nHồng trắng cồ: 10', 1277000, 1200000, '1733131701.jpg', 0, 0, 0, '', '', '', '2024-12-02 09:28:21'),
(104, 17, 'Thuận lợi', 'Sản phẩm bao gồm:\r\nCẩm chướng đơn xanh bơ : 10\r\nHoa Cúc Lưới Vàng : 2\r\nHồng vàng chùa : 15\r\nLan Moka vàng nến: 10\r\nLys trắng đơn: 2\r\nMõm sói vàng: 10', 'Sản phẩm bao gồm:\r\nCẩm chướng đơn xanh bơ : 10\r\nHoa Cúc Lưới Vàng : 2\r\nHồng vàng chùa : 15\r\nLan Moka vàng nến: 10\r\nLys trắng đơn: 2\r\nMõm sói vàng: 10', 1600000, 1500000, '1733131767.jpg', 0, 0, 0, '', '', '', '2024-12-02 09:29:27'),
(105, 17, 'Chỉ mình em', 'Sản phẩm bao gồm:\r\nCẩm chướng chùm hồng nhạt : 5\r\nHoa baby : 1\r\nLá phụ khác: 5\r\nPink OHara: 1', 'Sản phẩm bao gồm:\r\nCẩm chướng chùm hồng nhạt : 5\r\nHoa baby : 1\r\nLá phụ khác: 5\r\nPink OHara: 1', 350000, 300000, '1733131808.jpg', 0, 0, 0, '', '', '', '2024-12-02 09:30:08'),
(106, 19, 'Kim tiền MSTO ', '', '', 950000, 900000, '1733131888.jpg', 0, 0, 0, '', '', '', '2024-12-02 09:31:28'),
(107, 19, 'Bàng singapore', 'Bàng Singapore hợp nhất với người mệnh Mộc. Trang trí bàng Singapore trong nhà sẽ tạo không khí làm việc hòa thuận, vui vẻ hơn. Trong phong thủy sẽ giúp tài chính của gia chủ ngày càng dồi dào, vững vàng. Ngoài ra, với hinh dáng sang trọng của mình, cây còn giúp tăng thêm vẻ đẹp cho căn phòng và khẳng định cá tính của người trồng.', 'Bàng Singapore hợp nhất với người mệnh Mộc. Trang trí bàng Singapore trong nhà sẽ tạo không khí làm việc hòa thuận, vui vẻ hơn. Trong phong thủy sẽ giúp tài chính của gia chủ ngày càng dồi dào, vững vàng. Ngoài ra, với hinh dáng sang trọng của mình, cây còn giúp tăng thêm vẻ đẹp cho căn phòng và khẳng định cá tính của người trồng.', 750000, 650000, '1733131931.jpg', 0, 0, 0, '', '', '', '2024-12-02 09:32:11'),
(108, 19, 'Đại phú gia 2', 'Cây đại phú gia có nguồn gốc từ các nước Đông Á. Mang ý nghĩa phong thủy là đem lại tiền tài, may mắn cho gia chủ. Cây được ưu chuộng trồng để làm cây cảnh trang trí nội thất hoặc tiểu cảnh trang trí trong nhà, sân vườn, sân thượng, ban công, hành lang. *** Lưu ý: SẢN PHẨM HIỆN CHỈ CUNG CẤP TẠI KHU VỰC TP.HCM', 'Cây đại phú gia có nguồn gốc từ các nước Đông Á. Mang ý nghĩa phong thủy là đem lại tiền tài, may mắn cho gia chủ. Cây được ưu chuộng trồng để làm cây cảnh trang trí nội thất hoặc tiểu cảnh trang trí trong nhà, sân vườn, sân thượng, ban công, hành lang. *** Lưu ý: SẢN PHẨM HIỆN CHỈ CUNG CẤP TẠI KHU VỰC TP.HCM', 887000, 880000, '1733131976.jpg', 0, 0, 0, '', '', '', '2024-12-02 09:32:56'),
(109, 19, 'Trầu Bà Thanh Xuân MSP30', 'Trầu Bà Thanh Xuân có đặc điểm lá lớn, tán lá rộng, màu xanh tươi tốt quanh năm tượng trưng cho tiền tài, giàu sang và mang đến nhiều may mắn. Trầu Bà Thanh Xuân là cây nội thất bền vì vậy còn được ví như mang lại sức khỏe cho gia chủ. Cây Trầu Bà Thanh Xuân trong thực nghiệm đã được chứng minh có thể làm giảm mức ô nhiễm ozone trong không gian nhỏ. Lá cây Trầu Bà Thanh Xuân có hương thơm đặc trưng rất tốt trong những môi trường nhỏ, không khí ít lưu thông.', 'Trầu Bà Thanh Xuân có đặc điểm lá lớn, tán lá rộng, màu xanh tươi tốt quanh năm tượng trưng cho tiền tài, giàu sang và mang đến nhiều may mắn. Trầu Bà Thanh Xuân là cây nội thất bền vì vậy còn được ví như mang lại sức khỏe cho gia chủ. Cây Trầu Bà Thanh Xuân trong thực nghiệm đã được chứng minh có thể làm giảm mức ô nhiễm ozone trong không gian nhỏ. Lá cây Trầu Bà Thanh Xuân có hương thơm đặc trưng rất tốt trong những môi trường nhỏ, không khí ít lưu thông.', 777000, 780000, '1733132032.png', 0, 0, 0, '', '', '', '2024-12-02 09:33:52'),
(110, 19, 'Kim tiền văn phòng', 'Cây Kim tiền mang đến cho gia chủ về tài lộc, may mắn, tiền tài, phú quý, giàu sang, sung túc, thịnh vượng. Từ “Kim” có nghĩa là phát tài, “Tiền” có nghĩa là giàu sang Phú Quý. Đặc biệt khi cây Kim tiền ra hoa đại diện vận may của gia chủ ngày càng phát, tiền tài, lợi lộc, may mắn cũng ngày càng nhiề', 'Cây Kim tiền mang đến cho gia chủ về tài lộc, may mắn, tiền tài, phú quý, giàu sang, sung túc, thịnh vượng. Từ “Kim” có nghĩa là phát tài, “Tiền” có nghĩa là giàu sang Phú Quý. Đặc biệt khi cây Kim tiền ra hoa đại diện vận may của gia chủ ngày càng phát, tiền tài, lợi lộc, may mắn cũng ngày càng nhiề', 977000, 950000, '1733132080.jpg', 0, 0, 0, '', '', '', '2024-12-02 09:34:40'),
(111, 19, 'Vạn lộc MST28', 'Cây Vạn Lộc tương trưng cho sự may mắn với rất nhiều màu sắc trên lá. Cây có tác dụng đem lại vận may và thịnh vượng cho con người vừa lọc không khí. Vì ý nghĩa may mắn và tài lộc cây được sử dụng làm quà biếu trong các dịp lễ hội như quà ra mắt, khai trương, tân gia hoặc quà tết.', 'Cây Vạn Lộc tương trưng cho sự may mắn với rất nhiều màu sắc trên lá. Cây có tác dụng đem lại vận may và thịnh vượng cho con người vừa lọc không khí. Vì ý nghĩa may mắn và tài lộc cây được sử dụng làm quà biếu trong các dịp lễ hội như quà ra mắt, khai trương, tân gia hoặc quà tết.', 677000, 650000, '1733132124.jpg', 0, 0, 0, '', '', '', '2024-12-02 09:35:24'),
(112, 19, 'Trầu bà MST28', 'Cây Trầu Bà có ý nghĩa phong thủy mang đến cho gia chủ may mắn, thành đạt và bình an. Cây phù hợp để phòng khách, trang trí văn phòng. Cây Trầu Bà có khả năng hút chất độc từ không khí, khí độc thải ra từ khói thuốc, xăng xe, bức xạ từ các thiết bị điện tử như điện thoại, máy tính, tivi. Đó là lý do tại sao nhiều gia đình lựa chọn.', 'Cây Trầu Bà có ý nghĩa phong thủy mang đến cho gia chủ may mắn, thành đạt và bình an. Cây phù hợp để phòng khách, trang trí văn phòng. Cây Trầu Bà có khả năng hút chất độc từ không khí, khí độc thải ra từ khói thuốc, xăng xe, bức xạ từ các thiết bị điện tử như điện thoại, máy tính, tivi. Đó là lý do tại sao nhiều gia đình lựa chọn.', 580000, 550000, '1733132166.png', 0, 0, 0, '', '', '', '2024-12-02 09:36:06'),
(113, 19, 'Ngọc ngân VP MST28', 'Vẻ đẹp hài hòa từ bộ rễ trắng muốt và phiến lá xanh đốm trắng dịu dàng, mướt mắt khiến ngọc ngân trở thành loại cây dành cho tình yêu. Ngọc ngân còn có tác dụng thanh lọc không khí, hút bụi và các chất độc hại bay lơ lửng trong không khí đem đến không gian trong lành, tươi mát.', 'Vẻ đẹp hài hòa từ bộ rễ trắng muốt và phiến lá xanh đốm trắng dịu dàng, mướt mắt khiến ngọc ngân trở thành loại cây dành cho tình yêu. Ngọc ngân còn có tác dụng thanh lọc không khí, hút bụi và các chất độc hại bay lơ lửng trong không khí đem đến không gian trong lành, tươi mát.', 628000, 600000, '1733132207.jpg', 0, 0, 0, '', '', '', '2024-12-02 09:36:47'),
(114, 19, 'Lưỡi Hổ MST22', 'Là một trong những loại cây có khả năng hấp thụ Co2 và nhả O2 vào ban đêm giúp cải thiện chất lượng không khí và giảm stress. Ở khía cạnh phong thủy, cây có tác dụng trừ tà, xua đuổi tiểu nhân và ngăn chặn năng lượng xấu xâm nhập. Lá Lưỡi Hổ luôn mọc thẳng đứng thể hiện sự quyết đoán và ý chí tiến lên.', 'Là một trong những loại cây có khả năng hấp thụ Co2 và nhả O2 vào ban đêm giúp cải thiện chất lượng không khí và giảm stress. Ở khía cạnh phong thủy, cây có tác dụng trừ tà, xua đuổi tiểu nhân và ngăn chặn năng lượng xấu xâm nhập. Lá Lưỡi Hổ luôn mọc thẳng đứng thể hiện sự quyết đoán và ý chí tiến lên.', 500000, 490000, '1733132261.jpg', 0, 0, 0, '', '', '', '2024-12-02 09:37:41'),
(115, 20, 'Congrats mini size 7', 'Sản phẩm bao gồm:\r\nCúc calimero vàng nhụy nâu : 5\r\nHồng trứng gà : 10\r\nHướng dương : 2\r\nLan vũ nữ: 5\r\nMôn xanh: 5', 'Sản phẩm bao gồm:\r\nCúc calimero vàng nhụy nâu : 5\r\nHồng trứng gà : 10\r\nHướng dương : 2\r\nLan vũ nữ: 5\r\nMôn xanh: 5', 825000, 800000, '1733132348.jpg', 0, 0, 0, '', '', '', '2024-12-02 09:39:08'),
(116, 20, 'Cát tài', 'Sản phẩm bao gồm:\r\nHồng đỏ ớt : 20\r\nMôn đỏ: 7\r\nRed Elegance : 5\r\nĐồng tiền đỏ : 20', 'Sản phẩm bao gồm:\r\nHồng đỏ ớt : 20\r\nMôn đỏ: 7\r\nRed Elegance : 5\r\nĐồng tiền đỏ : 20', 1027000, 1000000, '1733132458.jpg', 0, 0, 0, '', '', '', '2024-12-02 09:40:58'),
(117, 20, 'Congrats mini size 2', 'Sản phẩm bao gồm:\r\nCát tường nhật hồng: 2\r\nCúc calimero tím: 5\r\nHoa thạch thảo tím: 2\r\nHồng da: 5\r\nHồng đỏ sa : 12\r\nRed Elegance : 5\r\nĐồng tiền hồng nhí : 10', 'Sản phẩm bao gồm:\r\nCát tường nhật hồng: 2\r\nCúc calimero tím: 5\r\nHoa thạch thảo tím: 2\r\nHồng da: 5\r\nHồng đỏ sa : 12\r\nRed Elegance : 5\r\nĐồng tiền hồng nhí : 10', 950000, 900000, '1733132503.png', 0, 0, 0, '', '', '', '2024-12-02 09:41:43'),
(118, 20, 'Bright future', 'Sản phẩm bao gồm:\r\nCúc calimero trắng : 10\r\nHoa baby : 1\r\nHồng vàng chùa : 10\r\nLan Moka vàng nến: 10\r\nĐồng tiền vàng : 20', 'Sản phẩm bao gồm:\r\nCúc calimero trắng : 10\r\nHoa baby : 1\r\nHồng vàng chùa : 10\r\nLan Moka vàng nến: 10\r\nĐồng tiền vàng : 20', 1027000, 1000000, '1733132559.jpg', 0, 0, 0, '', '', '', '2024-12-02 09:42:39'),
(119, 20, 'Bước ngoặt mới', 'Sản phẩm bao gồm:\r\nCát tường trắng: 5\r\nCúc rossi trắng: 10\r\nHoa thạch thảo trắng: 3\r\nHồng Lạc Thần: 10\r\nHồng trắng cồ: 5\r\nĐồng tiền trắng nhí : 5', 'Sản phẩm bao gồm:\r\nCát tường trắng: 5\r\nCúc rossi trắng: 10\r\nHoa thạch thảo trắng: 3\r\nHồng Lạc Thần: 10\r\nHồng trắng cồ: 5\r\nĐồng tiền trắng nhí : 5', 877000, 800000, '1733132600.jpg', 0, 0, 0, '', '', '', '2024-12-02 09:43:20'),
(120, 20, 'Thắng lợi', 'Sản phẩm bao gồm:\r\nHồng đỏ sa : 20\r\nLan Moka vàng nến: 15\r\nMôn đỏ: 7', 'Sản phẩm bao gồm:\r\nHồng đỏ sa : 20\r\nLan Moka vàng nến: 15\r\nMôn đỏ: 7', 777000, 750000, '1733132632.jpg', 0, 0, 0, '', '', '', '2024-12-02 09:43:52'),
(121, 20, 'Vững tin', 'Sản phẩm bao gồm:\r\nLily vàng thơm : 3\r\nMõm sói hồng đậm: 10\r\nĐồng tiền vàng : 35', 'Sản phẩm bao gồm:\r\nLily vàng thơm : 3\r\nMõm sói hồng đậm: 10\r\nĐồng tiền vàng : 35', 800000, 750000, '1733132678.jpg', 0, 0, 0, '', '', '', '2024-12-02 09:44:38'),
(122, 20, 'Congratulations 2', 'Sản phẩm bao gồm:\r\nCát tường xanh: 15\r\nLá thuỷ trúc : 20\r\nMõm sói vàng: 20\r\nĐồng tiền vàng : 21', 'Sản phẩm bao gồm:\r\nCát tường xanh: 15\r\nLá thuỷ trúc : 20\r\nMõm sói vàng: 20\r\nĐồng tiền vàng : 21', 800000, 750000, '1733132716.png', 0, 0, 0, '', '', '', '2024-12-02 09:45:16'),
(123, 20, 'Kệ Chúc Mừng 07 ', 'Sản phẩm bao gồm:\r\nHoa Cúc Lưới Xanh: 20\r\nMôn đỏ: 10\r\nĐồng tiền cam (20): 30', 'Sản phẩm bao gồm:\r\nHoa Cúc Lưới Xanh: 20\r\nMôn đỏ: 10\r\nĐồng tiền cam (20): 30', 800000, 750000, '1733132762.jpg', 0, 0, 0, '', '', '', '2024-12-02 09:46:02'),
(124, 20, 'Hồng Phát', 'Sản phẩm bao gồm:\r\nCúc mai hồng: 20 (có thể thay sang cúc rossi hồng)\r\nHồng da cồ: 35\r\nHồng trắng cồ: 10\r\nMõm sói song hỷ : 24', 'Sản phẩm bao gồm:\r\nCúc mai hồng: 20 (có thể thay sang cúc rossi hồng)\r\nHồng da cồ: 35\r\nHồng trắng cồ: 10\r\nMõm sói song hỷ : 24', 1600000, 1450000, '1733132802.png', 0, 0, 0, '', '', '', '2024-12-02 09:46:42'),
(125, 21, 'Kệ lan thái tím', 'Sản phẩm bao gồm:\r\nLan Thái Tím: 24', 'Sản phẩm bao gồm:\r\nLan Thái Tím: 24', 777000, 750000, '1733132861.jpg', 0, 0, 0, '', '', '', '2024-12-02 09:47:41'),
(126, 21, 'Lời tạm biệt', 'Sản phẩm bao gồm:\r\nCát tường trắng: 4\r\nHoa baby : 1\r\nHoa Cúc Ping Pong Vàng : 7\r\nHồng trắng cồ: 12\r\nMõm sói trắng : 10', 'Sản phẩm bao gồm:\r\nCát tường trắng: 4\r\nHoa baby : 1\r\nHoa Cúc Ping Pong Vàng : 7\r\nHồng trắng cồ: 12\r\nMõm sói trắng : 10', 750000, 650000, '1733132894.jpg', 0, 0, 0, '', '', '', '2024-12-02 09:48:14'),
(127, 21, 'Phút Chia Ly ', 'Sản phẩm bao gồm:\r\nHoa Cúc Lưới Xanh: 8\r\nHoa Sao tím: 1\r\nHồng da: 25\r\nLily trắng: 3\r\nMõm sói trắng : 20\r\nMôn trắng: 7\r\nMôn xanh: 12', 'Sản phẩm bao gồm:\r\nHoa Cúc Lưới Xanh: 8\r\nHoa Sao tím: 1\r\nHồng da: 25\r\nLily trắng: 3\r\nMõm sói trắng : 20\r\nMôn trắng: 7\r\nMôn xanh: 12', 800000, 750000, '1733132927.jpg', 0, 0, 0, '', '', '', '2024-12-02 09:48:47'),
(128, 21, 'Thương nhớ 2', 'Sản phẩm bao gồm:\r\nLan Thái Tím: 36\r\nLily hồng: 1', 'Sản phẩm bao gồm:\r\nLan Thái Tím: 36\r\nLily hồng: 1', 1150000, 1000000, '1733132960.jpg', 0, 0, 0, '', '', '', '2024-12-02 09:49:20'),
(129, 21, 'Biệt Ly', 'Sản phẩm bao gồm:\r\nCẩm chướng đơn viền tím : 25\r\nCát tường tím viền : 8\r\nCúc trắng : 5\r\nHồng da: 10\r\nHồng tím cà: 10\r\nLan Moka tím: 5\r\nLan thái trắng: 3\r\nĐồng tiền trắng : 20', 'Sản phẩm bao gồm:\r\nCẩm chướng đơn viền tím : 25\r\nCát tường tím viền : 8\r\nCúc trắng : 5\r\nHồng da: 10\r\nHồng tím cà: 10\r\nLan Moka tím: 5\r\nLan thái trắng: 3\r\nĐồng tiền trắng : 20', 1980000, 1900000, '1733133033.jpg', 0, 0, 0, '', '', '', '2024-12-02 09:50:33'),
(130, 21, 'Lệ dâng', 'Sản phẩm bao gồm:\r\nCúc lưới tím : 9\r\nCúc trắng : 35\r\nHồng môn tím: 16\r\nMõm sói trắng : 10\r\nPurple Ohara : 18\r\nĐồng tiền trắng : 20', 'Sản phẩm bao gồm:\r\nCúc lưới tím : 9\r\nCúc trắng : 35\r\nHồng môn tím: 16\r\nMõm sói trắng : 10\r\nPurple Ohara : 18\r\nĐồng tiền trắng : 20', 1900000, 1800000, '1733133080.jpg', 0, 0, 0, '', '', '', '2024-12-02 09:51:20'),
(131, 21, 'Condolence 4', 'Sản phẩm bao gồm:\r\nCúc trắng : 15\r\nHoa thạch thảo trắng: 3\r\nHồng vàng ánh trăng : 16\r\nLan thái trắng: 8\r\nMôn xanh: 7', 'Sản phẩm bao gồm:\r\nCúc trắng : 15\r\nHoa thạch thảo trắng: 3\r\nHồng vàng ánh trăng : 16\r\nLan thái trắng: 8\r\nMôn xanh: 7', 1500000, 1400000, '1733133134.jpg', 0, 0, 0, '', '', '', '2024-12-02 09:52:14'),
(132, 21, ' Ly Biệt', 'Sản phẩm bao gồm:\r\nCát tường tím viền : 6\r\nCúc trắng : 20\r\nHoa Sao tím: 2\r\nHồng tím cà: 25\r\nMôn trắng: 8', 'Sản phẩm bao gồm:\r\nCát tường tím viền : 6\r\nCúc trắng : 20\r\nHoa Sao tím: 2\r\nHồng tím cà: 25\r\nMôn trắng: 8', 1600000, 1500000, '1733133176.jpg', 0, 0, 0, '', '', '', '2024-12-02 09:52:56'),
(133, 21, 'Kệ Chia Buồn 02', 'Sản phẩm bao gồm:\r\nCúc calimero tím: 20\r\nCúc lưới trắng : 14\r\nĐồng tiền trắng : 16', 'Sản phẩm bao gồm:\r\nCúc calimero tím: 20\r\nCúc lưới trắng : 14\r\nĐồng tiền trắng : 16', 750000, 650000, '1733133224.jpg', 0, 0, 0, '', '', '', '2024-12-02 09:53:44'),
(134, 21, 'Hạ trắng', 'Sản phẩm bao gồm:\r\nLan thái trắng: 40\r\nĐinh lăng : 10', 'Sản phẩm bao gồm:\r\nLan thái trắng: 40\r\nĐinh lăng : 10', 1200000, 1000000, '1733133263.jpg', 0, 0, 0, '', '', '', '2024-12-02 09:54:23'),
(135, 22, 'Sweet love 15', 'Trong chiếc hộp ấy là những viên “kẹo” sô cô la hình tròn ngộ nghĩnh nhưng rất “sang” đáng yêu đến nỗi bạn không nỡ cắn. Đây là hộp sô cô la quà tặng hộp 15 viên tươi bạn sẽ được thưởng thức nhiều vị sô cô la độc đáo từ những hương vị truyền thống như: rượu Cherry, rượu Rhum nho, cà phê, rượu Capuchino, dừa … hay những hương vị độc đáo phá cách như chanh dây, chanh dây Rhum, quế và bơ hạt điều … và kể cả những hương vị đậm chất quê hương như gừng, gừng Rhum, sả, sả ớt, ớt, chuối trần bì, chuối bơ đậu phộng, gạo lức.', 'Trong chiếc hộp ấy là những viên “kẹo” sô cô la hình tròn ngộ nghĩnh nhưng rất “sang” đáng yêu đến nỗi bạn không nỡ cắn. Đây là hộp sô cô la quà tặng hộp 15 viên tươi bạn sẽ được thưởng thức nhiều vị sô cô la độc đáo từ những hương vị truyền thống như: rượu Cherry, rượu Rhum nho, cà phê, rượu Capuchino, dừa … hay những hương vị độc đáo phá cách như chanh dây, chanh dây Rhum, quế và bơ hạt điều … và kể cả những hương vị đậm chất quê hương như gừng, gừng Rhum, sả, sả ớt, ớt, chuối trần bì, chuối bơ đậu phộng, gạo lức.', 500000, 490000, '1733133364.jpg', 0, 0, 0, '', '', '', '2024-12-02 09:56:04'),
(136, 22, 'Chocolatle big box 36', '', '', 970000, 950000, '1733133403.jpg', 0, 0, 0, '', '', '', '2024-12-02 09:56:43'),
(137, 22, 'Love brownie choco 2', 'Lớp bánh bông lan xốp mềm, bên ngoài được phủ bởi lớp socola nâu beo béo làm nên món bánh kem vô cùng hấp dẫn! Chiếc bánh kem với cách trang trí đơn giản nhưng vô cũng bắt mắt sẽ thực sự là món quà tuyệt vời và phù hợp để dành tặng cho các dịp chúc mừng. Hi vọng chiếc bánh kem này sẽ làm tăng hương vị ngọt ngào cho cuộc sống của bạn.\r\n\r\nSize bánh: 19cm\r\nLưu ý: Sản phẩm cần đặt trước 72 tiếng', 'Lớp bánh bông lan xốp mềm, bên ngoài được phủ bởi lớp socola nâu beo béo làm nên món bánh kem vô cùng hấp dẫn! Chiếc bánh kem với cách trang trí đơn giản nhưng vô cũng bắt mắt sẽ thực sự là món quà tuyệt vời và phù hợp để dành tặng cho các dịp chúc mừng. Hi vọng chiếc bánh kem này sẽ làm tăng hương vị ngọt ngào cho cuộc sống của bạn.\r\n\r\nSize bánh: 19cm\r\nLưu ý: Sản phẩm cần đặt trước 72 tiếng', 950000, 900000, '1733133455.png', 0, 0, 0, '', '', '', '2024-12-02 09:57:35'),
(138, 22, 'Bánh kem Tous les Jours - Magic 4 ', 'Lớp bánh bông lan xốp mềm, phần sốt dâu tây tươi chua ngọt, kết hợp với vị trái cây thanh nhẹ làm nên món bánh kem vô cùng hấp dẫn! Chiếc bánh kem với cách trang trí đơn giản nhưng vô cũng bắt mắt sẽ thực sự là món quà tuyệt vời và phù hợp để dành tặng cho các dịp chúc mừng. Hi vọng chiếc bánh kem này sẽ làm tăng hương vị ngọt ngào cho cuộc sống của bạn.\r\n\r\nSize bánh: 25cm\r\nLưu ý: Sản phẩm cần đặt trước 72 tiếng', 'Lớp bánh bông lan xốp mềm, phần sốt dâu tây tươi chua ngọt, kết hợp với vị trái cây thanh nhẹ làm nên món bánh kem vô cùng hấp dẫn! Chiếc bánh kem với cách trang trí đơn giản nhưng vô cũng bắt mắt sẽ thực sự là món quà tuyệt vời và phù hợp để dành tặng cho các dịp chúc mừng. Hi vọng chiếc bánh kem này sẽ làm tăng hương vị ngọt ngào cho cuộc sống của bạn.\r\n\r\nSize bánh: 25cm\r\nLưu ý: Sản phẩm cần đặt trước 72 tiếng', 830000, 750000, '1733133505.png', 0, 0, 0, '', '', '', '2024-12-02 09:58:25');
INSERT INTO `products` (`id`, `category_id`, `name`, `small_description`, `description`, `original_price`, `selling_price`, `image`, `qty`, `status`, `trending`, `meta_title`, `meta_description`, `meta_keyword`, `created_at`) VALUES
(139, 22, 'Bánh kem Tous les Jours - Propose heart 1', 'Kiểu dáng trái tim đáng yêu, lớp bánh bông lan xốp mềm kết hợp với phần kem tươi beo béo đã làm nên món bánh kem vô cùng hấp dẫn! Chiếc bánh kem này thực sự là món quà tuyệt vời và phù hợp để dành tặng cho các dịp chúc mừng. Hi vọng chiếc bánh kem này sẽ làm tăng hương vị ngọt ngào cho cuộc sống của bạn.\r\n\r\nSize bánh: 16cm', 'Kiểu dáng trái tim đáng yêu, lớp bánh bông lan xốp mềm kết hợp với phần kem tươi beo béo đã làm nên món bánh kem vô cùng hấp dẫn! Chiếc bánh kem này thực sự là món quà tuyệt vời và phù hợp để dành tặng cho các dịp chúc mừng. Hi vọng chiếc bánh kem này sẽ làm tăng hương vị ngọt ngào cho cuộc sống của bạn.\r\n\r\nSize bánh: 16cm', 530000, 500000, '1733133550.png', 0, 0, 0, '', '', '', '2024-12-02 09:59:10'),
(140, 22, 'Bánh kem Tous les Jours - Rainbow cake', 'Bánh kem bông lan cầu vồng với các loại hương vị trà xanh, dâu, việt quất, chuối và kem tươi.\r\n\r\nSize bánh: 19cm\r\nLưu ý: Sản phẩm cần đặt trước 24 tiếng', 'Bánh kem bông lan cầu vồng với các loại hương vị trà xanh, dâu, việt quất, chuối và kem tươi.\r\n\r\nSize bánh: 19cm\r\nLưu ý: Sản phẩm cần đặt trước 24 tiếng', 650000, 600000, '1733133590.jpg', 0, 0, 0, '', '', '', '2024-12-02 09:59:50'),
(141, 22, 'Bánh kem Brodard - Bánh passio cheese mousse 16cm', 'Size 16cm', 'Size 16cm', 600000, 550000, '1733133637.jpg', 0, 0, 0, '', '', '', '2024-12-02 10:00:37'),
(142, 22, 'Bánh kem Brodard - Bánh kem sữa tươi 20cm ', 'Size 20x7 cm', 'Size 20x7 cm', 660000, 600000, '1733133679.jpg', 0, 0, 0, '', '', '', '2024-12-02 10:01:19'),
(143, 22, 'Bánh kem Brodard - Bánh kem trái cây sữa tươi 20cm', '', '', 650000, 600000, '1733133728.jpg', 0, 0, 0, '', '', '', '2024-12-02 10:02:08'),
(144, 22, 'Bánh kem Brodard - Bánh tiramisu white 16cm', '16cm', '16cm', 577000, 550000, '1733133768.jpg', 0, 0, 0, '', '', '', '2024-12-02 10:02:48'),
(145, 22, 'Bánh kem Brodard - Bánh kem trái cây sữa tươi ', '', '', 650000, 600000, '1733133820.jpg', 0, 0, 0, '', '', '', '2024-12-02 10:03:40');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` int(11) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `role_as` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `phone`, `password`, `created_at`, `role_as`) VALUES
(1, 'Kiên', '2205ct0053@gmail.com', 0, '05122004', '2024-03-10 04:05:59', 1),
(2, 'Thắng', '2205ct0029@gmail.com', 0, '25072004', '2024-03-10 11:29:00', 0),
(3, 'Toàn', '2205ct0016@gmail.com', 0, '08042004', '2024-03-18 04:24:49', 0),
(4, 'Nam', '2205ct0078@gmail.com', 0, '24052003', '2024-03-18 04:32:10', 0),
(9, 'Kaito kid', 'kid@gmail.com', 0, 'kid123', '2024-11-27 08:43:17', 1);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `carts`
--
ALTER TABLE `carts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT cho bảng `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=146;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
