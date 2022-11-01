-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 06, 2022 at 03:18 PM
-- Server version: 10.5.16-MariaDB
-- PHP Version: 7.3.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `id19581590_myproject`
--
CREATE DATABASE IF NOT EXISTS `id19581590_myproject` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE `id19581590_myproject`;

-- --------------------------------------------------------

--
-- Table structure for table `basket`
--

CREATE TABLE `basket` (
  `basket_id` int(11) NOT NULL,
  `basket_product_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `basket_product_quantity` int(11) NOT NULL,
  `basket_product_pricetotal` float NOT NULL,
  `basket_product_source` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `basket`
--

INSERT INTO `basket` (`basket_id`, `basket_product_id`, `basket_product_quantity`, `basket_product_pricetotal`, `basket_product_source`) VALUES
(69, '3', 3, 60, '1');

-- --------------------------------------------------------

--
-- Table structure for table `import_order`
--

CREATE TABLE `import_order` (
  `Import_order_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Import_product_pricetotal` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Import_date` date NOT NULL,
  `Import_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Import_source_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `import_order`
--

INSERT INTO `import_order` (`Import_order_id`, `Import_product_pricetotal`, `Import_date`, `Import_status`, `Import_source_id`) VALUES
('329ac180-17d1-11ed-a9e7-7520656f2450', '90', '2022-08-09', 'ส่งแล้ว', '2'),
('916268a0-17f7-11ed-87c2-1db6f49e10bb', '630', '2022-08-09', 'ส่งแล้ว', '1'),
('d305b8d0-1819-11ed-a3b9-712a28551b30', '390', '2022-08-10', 'ส่งแล้ว', '1'),
('1fe9d680-1a14-11ed-b973-69575302a577', '660', '2022-08-12', 'ส่งแล้ว', '2'),
('0750f0a0-1bbc-11ed-ae9d-d30a0cb85bbc', '800', '2022-08-14', 'ส่งแล้ว', '1'),
('d0d6f790-1c6f-11ed-950f-7563a9412445', '300', '2022-08-15', 'ส่งแล้ว', '1'),
('a4ca58c0-1c71-11ed-b605-633bf19d36d0', '300', '2022-08-15', 'สินค้ายังไม่ครบ', '1');

-- --------------------------------------------------------

--
-- Table structure for table `import_order_detail`
--

CREATE TABLE `import_order_detail` (
  `order_detail_id` int(11) NOT NULL,
  `basket_product_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `basket_product_quantity` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `basket_product_pricetotal` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `DateTime` date NOT NULL,
  `Import_order_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `import_order_detail`
--

INSERT INTO `import_order_detail` (`order_detail_id`, `basket_product_id`, `basket_product_quantity`, `basket_product_pricetotal`, `DateTime`, `Import_order_id`) VALUES
(4, '1', '4', '800', '2022-08-02', '3a135720-11cc-11ed-90a6-6550599aff2d'),
(5, '4', '4', '120', '2022-08-02', '3a135720-11cc-11ed-90a6-6550599aff2d'),
(6, '2', '4', '240', '2022-08-02', '9575cf80-11cc-11ed-9b61-8523dfdcf9b4'),
(7, '3', '3', '90', '2022-08-02', '9575cf80-11cc-11ed-9b61-8523dfdcf9b4'),
(29, '4', '1', '30', '2022-08-09', '329ac180-17d1-11ed-a9e7-7520656f2450'),
(30, '3', '2', '60', '2022-08-09', '329ac180-17d1-11ed-a9e7-7520656f2450'),
(31, '6', '1', '30', '2022-08-09', '916268a0-17f7-11ed-87c2-1db6f49e10bb'),
(32, '1', '3', '600', '2022-08-09', '916268a0-17f7-11ed-87c2-1db6f49e10bb'),
(35, '4', '3', '90', '2022-08-10', 'd305b8d0-1819-11ed-a3b9-712a28551b30'),
(36, '2', '3', '180', '2022-08-10', 'd305b8d0-1819-11ed-a3b9-712a28551b30'),
(37, '2', '2', '120', '2022-08-10', 'd305b8d0-1819-11ed-a3b9-712a28551b30'),
(38, '2', '1', '60', '2022-08-12', '1fe9d680-1a14-11ed-b973-69575302a577'),
(39, '1', '3', '600', '2022-08-12', '1fe9d680-1a14-11ed-b973-69575302a577'),
(41, '1', '4', '800', '2022-08-14', '0750f0a0-1bbc-11ed-ae9d-d30a0cb85bbc'),
(48, '2', '5', '300', '2022-08-15', 'd0d6f790-1c6f-11ed-950f-7563a9412445'),
(49, '2', '5', '300', '2022-08-15', 'a4ca58c0-1c71-11ed-b605-633bf19d36d0');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `product_id` int(11) NOT NULL,
  `product_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_detail` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_price` int(11) NOT NULL,
  `product_quantity` int(11) NOT NULL,
  `export_product` int(11) NOT NULL,
  `import_product` int(11) NOT NULL,
  `product_type_id` int(11) NOT NULL,
  `import_price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`product_id`, `product_name`, `product_detail`, `product_image`, `product_price`, `product_quantity`, `export_product`, `import_product`, `product_type_id`, `import_price`) VALUES
(2, 'sunsilk', 'ad', 'https://firebasestorage.googleapis.com/v0/b/bakery203.appspot.com/o/product_image%2F096a1ed0-2b44-437a-afab-22362adc0ad8_large.jpg?alt=media&token=79663d93-98d2-4389-8cda-1d04ef15f594', 60, 961, 54, 17, 3, 20),
(3, 'สบู่แคร์', '***คำอธิบาย**', 'https://firebasestorage.googleapis.com/v0/b/bakery203.appspot.com/o/product_image%2F186870-01-bath-hair-care.jpg?alt=media&token=b5316469-3f02-47f9-aef1-8d09a212f5fc', 30, 967, 31, 0, 3, 20),
(4, 'ฝอยขัดหม้อ', '***คำอธิบาย**', 'https://firebasestorage.googleapis.com/v0/b/bakery203.appspot.com/o/product_image%2F19_09_18_floor_01.jpg?alt=media&token=71a90e82-7bbc-4eca-b4d6-6f851db1832e', 30, 991, 13, 6, 3, 20),
(5, 'สบู่Lux', '***คำอธิบาย**', 'https://firebasestorage.googleapis.com/v0/b/bakery203.appspot.com/o/product_image%2F1d238b301ee81f2b99cab88744a98456.jpg?alt=media&token=a8c79607-9f1f-41cf-99f7-ccea4b79849d', 30, 993, 5, 0, 3, 20),
(6, 'น้ำปลาตราหอยหลอด', '***คำอธิบาย**', 'https://firebasestorage.googleapis.com/v0/b/bakery203.appspot.com/o/product_image%2F22_4.jpg?alt=media&token=ab13c2ef-c822-4844-8a44-67b4ddba344c', 30, 987, 11, 0, 2, 20),
(7, 'สบู่ตราprotect', '***คำอธิบาย**', 'https://firebasestorage.googleapis.com/v0/b/bakery203.appspot.com/o/product_image%2F298be91c6f134217b4a77ce6622fee57.jpg?alt=media&token=d1f5e148-496f-4fbf-9ae1-cf914d99ce58', 30, 998, 0, 0, 3, 20),
(8, 'น้ำปลาตราปลาหมึก', '***คำอธิบาย**', 'https://firebasestorage.googleapis.com/v0/b/bakery203.appspot.com/o/product_image%2F384333_010_Supermarket.jpg?alt=media&token=218bc789-112e-431f-a107-6cb55ead9cbd', 30, 985, 13, 0, 2, 20),
(9, 'ยาสีฟันตราSPARKEL', '***คำอธิบาย**', 'https://firebasestorage.googleapis.com/v0/b/bakery203.appspot.com/o/product_image%2F387478_00_Sparkle.jpg?alt=media&token=ad23e774-ab8e-441f-b54d-000f2db4dabc', 30, 994, 4, 0, 3, 20),
(10, 'น้ำปลาตราทิพรส', '***คำอธิบาย**', 'https://firebasestorage.googleapis.com/v0/b/bakery203.appspot.com/o/product_image%2F393899_010_Supermarket.jpg?alt=media&token=6eabaf1b-3dba-436b-b43b-a20769ab2401', 30, 994, 4, 0, 2, 20),
(11, 'Sunslik', '***คำอธิบาย**', 'https://firebasestorage.googleapis.com/v0/b/bakery203.appspot.com/o/product_image%2F3bdde077247c08cdfbd06e8c79faf1d2_tn.jpg?alt=media&token=158e1b8a-f631-4e20-a2d3-6f4614cc7a9e', 30, 992, 6, 0, 3, 20),
(12, 'สก๊อตไบร์ท', '***คำอธิบาย**', 'https://firebasestorage.googleapis.com/v0/b/bakery203.appspot.com/o/product_image%2F580700000133.jpg?alt=media&token=1f0ef7ca-0280-4b1c-a594-8ab91dc7723f', 30, 994, 4, 0, 3, 20),
(13, 'ข้าวไอยรา', 'คำอธิบาย', 'https://firebasestorage.googleapis.com/v0/b/bakery203.appspot.com/o/rice%2Frice1.png?alt=media&token=8ef03bc6-c0ba-4021-9190-24d6362fe7ae', 250, 931, 57, 0, 1, 200),
(14, 'ข้าวสุพรรณ์หงษ์', 'คำอธิบาย', 'https://firebasestorage.googleapis.com/v0/b/bakery203.appspot.com/o/rice%2Frice2.png?alt=media&token=f4f86c6e-3b7b-419d-9bf6-41e6e8d397ca', 250, 970, 28, 0, 5, 200),
(16, 'ข้าวตราฉัตร', 'คำอธิบาย', 'https://firebasestorage.googleapis.com/v0/b/bakery203.appspot.com/o/rice%2Frice3.png?alt=media&token=0d2129f3-1591-4bde-a7e0-5175116ecc98', 250, 981, 18, 0, 1, 200),
(17, 'ข้าวตราหอมมะลิ', 'คำอธิบาย', 'https://firebasestorage.googleapis.com/v0/b/bakery203.appspot.com/o/rice%2Frice3.png?alt=media&token=0d2129f3-1591-4bde-a7e0-5175116ecc98', 250, 998, 0, 0, 1, 200),
(19, 'ข้าวตราแสนดี1', 'คำอธิบาย', 'https://firebasestorage.googleapis.com/v0/b/bakery203.appspot.com/o/rice%2Frice4.png?alt=media&token=735d13a2-b3d3-48ef-9c50-4681780c9dfa', 250, 994, 4, 0, 1, 200),
(20, 'ข้าวตราฉัตรทอง', 'คำอธิบาย', 'https://firebasestorage.googleapis.com/v0/b/bakery203.appspot.com/o/rice%2Frice-1.png?alt=media&token=7ddc70e8-8b43-444d-af47-ca7aafe4a0c9', 250, 992, 6, 0, 1, 200),
(21, 'ข้าวตราไดรโนเสา', 'คำอธิบาย', 'https://firebasestorage.googleapis.com/v0/b/bakery203.appspot.com/o/rice%2F9cfeb5b2ba608cba80c9c895275b50c0.png?alt=media&token=5fdc143d-07ef-452a-a387-dc84678f98de', 250, 990, 8, 0, 1, 200),
(22, 'ข้าวตราทอง', 'คำอธิบาย', 'https://firebasestorage.googleapis.com/v0/b/bakery203.appspot.com/o/rice%2Ff530cd68edb2c035b74bec75de01bd53.png?alt=media&token=ceac8a93-2178-4e94-9754-40633c2e9dbe', 250, 975, 36, 0, 1, 200),
(28, 'nong', '111', 'https://firebasestorage.googleapis.com/v0/b/bakery203.appspot.com/o/product_image%2F0f71e54e-d772-4b06-b6f7-1a5c353288d08956141358626799334.jpg?alt=media&token=b52e09c3-5da6-4cfe-80fd-935b13aebf2c', 11, 11, 0, 0, 1, 100),
(29, 'asdasda', 'adasdad', 'https://firebasestorage.googleapis.com/v0/b/bakery203.appspot.com/o/product_image%2F957e27e5-06b9-4d50-8d0c-29c20104b4487466414898412810929.jpg?alt=media&token=8632482c-773d-4528-86e1-2e9d87b6902a', 111, 111, 0, 0, 1, 100);

-- --------------------------------------------------------

--
-- Table structure for table `product_promotion`
--

CREATE TABLE `product_promotion` (
  `product_id` int(11) NOT NULL,
  `promotion_id` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_promotion`
--

INSERT INTO `product_promotion` (`product_id`, `promotion_id`, `start_date`, `end_date`) VALUES
(2, 2, '2022-09-14', '2022-10-14'),
(13, 8, '2022-09-29', '2022-09-30');

-- --------------------------------------------------------

--
-- Table structure for table `product_type`
--

CREATE TABLE `product_type` (
  `product_type_id` int(11) NOT NULL,
  `product_type_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_type`
--

INSERT INTO `product_type` (`product_type_id`, `product_type_name`) VALUES
(0, 'ไม่ได้ระบุ'),
(1, 'ประเภทข้าวสาร'),
(2, 'ประเภทเครื่องปรุง'),
(3, 'ประเภทของใช้'),
(5, 'เครื่องเทศ');

-- --------------------------------------------------------

--
-- Table structure for table `promotion`
--

CREATE TABLE `promotion` (
  `promotion_id` int(11) NOT NULL,
  `promotion_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `promotion_value` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `promotion`
--

INSERT INTO `promotion` (`promotion_id`, `promotion_name`, `promotion_value`) VALUES
(2, 'โปรโมชั่น 10%', 10),
(5, 'ไม่มีโปรโมชั่น', 0),
(7, 'โปรโมชั่น 20%', 20),
(8, 'โปรโมชั่น 40%', 40),
(9, 'โปรโมชั่น 30%', 30);

-- --------------------------------------------------------

--
-- Table structure for table `rider`
--

CREATE TABLE `rider` (
  `rider_id` int(11) NOT NULL,
  `rider_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rider_surname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rider_phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rider_email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rider_password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rider_latitude` double NOT NULL,
  `rider_longtitude` double NOT NULL,
  `rider_role` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `rider`
--

INSERT INTO `rider` (`rider_id`, `rider_name`, `rider_surname`, `rider_phone`, `rider_email`, `rider_password`, `rider_latitude`, `rider_longtitude`, `rider_role`) VALUES
(1, 'ศุภกร', 'สิงหา', '0977855478', 'rider@gmail.com', '123456', 13.6468398, 100.6110799, 'rider'),
(2, 'admin', 'test', '0977855478', 'admin@gmail.com', '123456', 0, 0, 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `source`
--

CREATE TABLE `source` (
  `source_id` int(11) NOT NULL,
  `source_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `source_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `source_address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `source`
--

INSERT INTO `source` (`source_id`, `source_name`, `source_number`, `source_address`) VALUES
(1, 'ร้านA', '0815489785', '100หมู่2'),
(2, 'ร้านB', '0874567894', 'หมู่7'),
(3, 'ร้านC', '0874597854', 'หมู่4');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(255) NOT NULL COMMENT 'รหัสผู้ใช้',
  `user_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'ชื่อผู้ใช้',
  `user_surname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'นามสกุลผู้ใช้',
  `user_phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'เบอร์ผู้ใช้',
  `user_email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'อีเมลผู้ใช้',
  `user_password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'รหัสผู้ใช้',
  `user_latitude` double DEFAULT NULL,
  `user_longitude` double DEFAULT NULL,
  `user_role` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'ตำแหน่งผู้ใช้'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `user_name`, `user_surname`, `user_phone`, `user_email`, `user_password`, `user_latitude`, `user_longitude`, `user_role`) VALUES
(3, 'supakon', 'panjaiyne', '082222235', 'test2@gmail.com', '123456', 13.7681633, 100.6820733, 'customer'),
(9, 'ศุภกร', 'เเป้นใจเย็น', '0124537896', 'artart@gmail.com', '1234567', 13.6468477, 100.6110764, 'customer'),
(11, 'วชิรวิทย์', 'กลั่นกล้า', '0917301938', 'ten@gmail.com', '123456', 13.7681633, 100.6820733, 'customer'),
(12, 'art', 'supakon3', '0981381938', 'art3@gmail.com', '123456', 13.6468393, 100.6110738, 'customer');

-- --------------------------------------------------------

--
-- Table structure for table `user_basket`
--

CREATE TABLE `user_basket` (
  `user_basket_id` int(11) NOT NULL,
  `user_basket_product_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_basket_quantity` int(11) NOT NULL,
  `user_basket_price` int(11) NOT NULL,
  `user_basket_email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `basket_product_promotionname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `basket_product_promotionvalue` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_order`
--

CREATE TABLE `user_order` (
  `order_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'รหัสออเดอร์',
  `order_by` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'รหัสผู้สั่ง',
  `user_latitude` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'ืที่อยู่1',
  `user_longitude` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'ที่อยู่2',
  `order_responsible_person` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'คนรับงาน',
  `order_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'สถานะ',
  `order_date` date NOT NULL,
  `product_amount` int(11) NOT NULL,
  `total_price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_order`
--

INSERT INTO `user_order` (`order_id`, `order_by`, `user_latitude`, `user_longitude`, `order_responsible_person`, `order_status`, `order_date`, `product_amount`, `total_price`) VALUES
('4d6dfd50-39d3-11ed-94cd-a33720880aad', 'artart@gmail.com', '13.6468477', '100.6110764', 'rider@gmail.com', 'ส่งเรียบร้อย', '2022-09-22', 2, 770),
('43a2ad70-3a9b-11ed-964f-5f13de48d3a6', 'artart@gmail.com', '13.6468477', '100.6110764', 'ยังไม่มีคนรับผิดชอบ', 'รอการตอบกลับการยกเลิก', '2022-09-23', 1, 750),
('4db64940-401b-11ed-928f-c302784ed61e', 'artart@gmail.com', '13.6468477', '100.6110764', 'ยังไม่มีคนรับผิดชอบ', 'รายการที่ยกเลิก', '2022-09-30', 2, 1324),
('746a4690-401b-11ed-85bf-777da291668d', 'artart@gmail.com', '13.6468477', '100.6110764', 'rider@gmail.com', 'ส่งเรียบร้อย', '2022-09-30', 2, 276),
('c38b2b70-4081-11ed-b96e-0975aef20431', 'ten@gmail.com', '13.7681633', '100.6820733', 'rider@gmail.com', 'รายการที่ยกเลิก', '2022-09-30', 2, 216),
('dd75d800-4081-11ed-8d6b-299efd4a8d44', 'ten@gmail.com', '13.7681633', '100.6820733', 'rider@gmail.com', 'รายการที่ยกเลิก', '2022-09-30', 3, 1489),
('fcdd96a0-4082-11ed-8f1a-c717a09fdf71', 'ten@gmail.com', '13.7681633', '100.6820733', 'ยังไม่มีคนรับผิดชอบ', 'รายการที่ยกเลิก', '2022-09-30', 2, 240),
('124a9b90-4089-11ed-8ec3-e96186d77048', 'artart@gmail.com', '13.6468477', '100.6110764', 'ยังไม่มีคนรับผิดชอบ', 'รายการที่ยกเลิก', '2022-09-30', 1, 600),
('248c6dc0-44ac-11ed-89cc-1736aae761b5', 'artart@gmail.com', '13.6468477', '100.6110764', 'ยังไม่มีคนรับผิดชอบ', 'ยกเลิกโดยuser', '2022-10-05', 2, 1400),
('f18416a0-4571-11ed-85e0-8d34dcc4bfea', 'artart@gmail.com', '13.6468477', '100.6110764', 'ยังไม่มีคนรับผิดชอบ', 'รอการยืนยันการเเพ็คของ', '2022-10-06', 2, 1400),
('5f4cf260-4572-11ed-9899-c154522720ad', 'artart@gmail.com', '13.6468477', '100.6110764', 'rider@gmail.com', 'รายการที่ยกเลิก', '2022-10-06', 1, 250),
('2a2c42a0-4574-11ed-9193-8daa7780339d', 'artart@gmail.com', '13.6468477', '100.6110764', 'ยังไม่มีคนรับผิดชอบ', 'รอการยืนยันจาก Admin', '2022-10-06', 1, 250);

-- --------------------------------------------------------

--
-- Table structure for table `user_order_detail`
--

CREATE TABLE `user_order_detail` (
  `order_detail_id` int(11) NOT NULL,
  `order_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_amount` int(11) NOT NULL,
  `product_per_price` int(11) NOT NULL,
  `product_promotion_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_promotion_value` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_order_detail`
--

INSERT INTO `user_order_detail` (`order_detail_id`, `order_id`, `product_id`, `product_amount`, `product_per_price`, `product_promotion_name`, `product_promotion_value`) VALUES
(109, '4d6dfd50-39d3-11ed-94cd-a33720880aad', 2, 5, 60, 'โปรโมชั่น 10%', 10),
(110, '4d6dfd50-39d3-11ed-94cd-a33720880aad', 13, 2, 250, 'ไม่มีโปรโมชั่น', 0),
(111, '43a2ad70-3a9b-11ed-964f-5f13de48d3a6', 14, 3, 250, 'ไม่มีโปรโมชั่น', 0),
(112, '4db64940-401b-11ed-928f-c302784ed61e', 2, 6, 60, 'โปรโมชั่น 10%', 10),
(113, '4db64940-401b-11ed-928f-c302784ed61e', 13, 4, 250, 'ไม่มีโปรโมชั่น', 0),
(114, '746a4690-401b-11ed-85bf-777da291668d', 8, 2, 30, 'ไม่มีโปรโมชั่น', 0),
(115, '746a4690-401b-11ed-85bf-777da291668d', 2, 4, 60, 'โปรโมชั่น 10%', 10),
(116, 'c38b2b70-4081-11ed-b96e-0975aef20431', 10, 4, 30, 'ไม่มีโปรโมชั่น', 0),
(117, 'c38b2b70-4081-11ed-b96e-0975aef20431', 6, 4, 30, 'โปรโมชั่น 20%', 20),
(118, 'dd75d800-4081-11ed-8d6b-299efd4a8d44', 22, 5, 250, 'ไม่มีโปรโมชั่น', 0),
(119, 'dd75d800-4081-11ed-8d6b-299efd4a8d44', 3, 4, 30, 'ไม่มีโปรโมชั่น', 1),
(120, 'dd75d800-4081-11ed-8d6b-299efd4a8d44', 5, 4, 30, 'ไม่มีโปรโมชั่น', 0),
(121, 'fcdd96a0-4082-11ed-8f1a-c717a09fdf71', 8, 4, 30, 'ไม่มีโปรโมชั่น', 0),
(122, 'fcdd96a0-4082-11ed-8f1a-c717a09fdf71', 9, 4, 30, 'ไม่มีโปรโมชั่น', 0),
(123, '124a9b90-4089-11ed-8ec3-e96186d77048', 13, 4, 250, 'โปรโมชั่น 40%', 40),
(124, '248c6dc0-44ac-11ed-89cc-1736aae761b5', 16, 5, 250, 'ไม่มีโปรโมชั่น', 0),
(125, '248c6dc0-44ac-11ed-89cc-1736aae761b5', 8, 5, 30, 'ไม่มีโปรโมชั่น', 0),
(126, 'f18416a0-4571-11ed-85e0-8d34dcc4bfea', 6, 5, 30, 'ไม่มีโปรโมชั่น', 0),
(127, 'f18416a0-4571-11ed-85e0-8d34dcc4bfea', 16, 5, 250, 'ไม่มีโปรโมชั่น', 0),
(128, '5f4cf260-4572-11ed-9899-c154522720ad', 16, 1, 250, 'ไม่มีโปรโมชั่น', 0),
(129, '2a2c42a0-4574-11ed-9193-8daa7780339d', 16, 1, 250, 'ไม่มีโปรโมชั่น', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `basket`
--
ALTER TABLE `basket`
  ADD PRIMARY KEY (`basket_id`);

--
-- Indexes for table `import_order_detail`
--
ALTER TABLE `import_order_detail`
  ADD PRIMARY KEY (`order_detail_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `product_type`
--
ALTER TABLE `product_type`
  ADD PRIMARY KEY (`product_type_id`);

--
-- Indexes for table `promotion`
--
ALTER TABLE `promotion`
  ADD PRIMARY KEY (`promotion_id`);

--
-- Indexes for table `rider`
--
ALTER TABLE `rider`
  ADD PRIMARY KEY (`rider_id`);

--
-- Indexes for table `source`
--
ALTER TABLE `source`
  ADD PRIMARY KEY (`source_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `user_basket`
--
ALTER TABLE `user_basket`
  ADD PRIMARY KEY (`user_basket_id`);

--
-- Indexes for table `user_order_detail`
--
ALTER TABLE `user_order_detail`
  ADD PRIMARY KEY (`order_detail_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `basket`
--
ALTER TABLE `basket`
  MODIFY `basket_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT for table `import_order_detail`
--
ALTER TABLE `import_order_detail`
  MODIFY `order_detail_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `product_type`
--
ALTER TABLE `product_type`
  MODIFY `product_type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `promotion`
--
ALTER TABLE `promotion`
  MODIFY `promotion_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `rider`
--
ALTER TABLE `rider`
  MODIFY `rider_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `source`
--
ALTER TABLE `source`
  MODIFY `source_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(255) NOT NULL AUTO_INCREMENT COMMENT 'รหัสผู้ใช้', AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `user_basket`
--
ALTER TABLE `user_basket`
  MODIFY `user_basket_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=153;

--
-- AUTO_INCREMENT for table `user_order_detail`
--
ALTER TABLE `user_order_detail`
  MODIFY `order_detail_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=130;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
