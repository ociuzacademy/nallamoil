-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3307
-- Generation Time: Jan 07, 2023 at 05:59 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_nallam`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add tbl_ user', 7, 'add_tbl_user'),
(26, 'Can change tbl_ user', 7, 'change_tbl_user'),
(27, 'Can delete tbl_ user', 7, 'delete_tbl_user'),
(28, 'Can view tbl_ user', 7, 'view_tbl_user'),
(29, 'Can add tbl_ product', 8, 'add_tbl_product'),
(30, 'Can change tbl_ product', 8, 'change_tbl_product'),
(31, 'Can delete tbl_ product', 8, 'delete_tbl_product'),
(32, 'Can view tbl_ product', 8, 'view_tbl_product'),
(33, 'Can add tbl_ report', 9, 'add_tbl_report'),
(34, 'Can change tbl_ report', 9, 'change_tbl_report'),
(35, 'Can delete tbl_ report', 9, 'delete_tbl_report'),
(36, 'Can view tbl_ report', 9, 'view_tbl_report'),
(37, 'Can add tbl_ complaint', 10, 'add_tbl_complaint'),
(38, 'Can change tbl_ complaint', 10, 'change_tbl_complaint'),
(39, 'Can delete tbl_ complaint', 10, 'delete_tbl_complaint'),
(40, 'Can view tbl_ complaint', 10, 'view_tbl_complaint'),
(41, 'Can add tbl_ feedback', 11, 'add_tbl_feedback'),
(42, 'Can change tbl_ feedback', 11, 'change_tbl_feedback'),
(43, 'Can delete tbl_ feedback', 11, 'delete_tbl_feedback'),
(44, 'Can view tbl_ feedback', 11, 'view_tbl_feedback'),
(45, 'Can add order_tb', 12, 'add_order_tb'),
(46, 'Can change order_tb', 12, 'change_order_tb'),
(47, 'Can delete order_tb', 12, 'delete_order_tb'),
(48, 'Can view order_tb', 12, 'view_order_tb'),
(49, 'Can add order_item_tb', 13, 'add_order_item_tb'),
(50, 'Can change order_item_tb', 13, 'change_order_item_tb'),
(51, 'Can delete order_item_tb', 13, 'delete_order_item_tb'),
(52, 'Can view order_item_tb', 13, 'view_order_item_tb'),
(53, 'Can add tbl_ cart', 14, 'add_tbl_cart'),
(54, 'Can change tbl_ cart', 14, 'change_tbl_cart'),
(55, 'Can delete tbl_ cart', 14, 'delete_tbl_cart'),
(56, 'Can view tbl_ cart', 14, 'view_tbl_cart'),
(57, 'Can add tbl_ review', 15, 'add_tbl_review'),
(58, 'Can change tbl_ review', 15, 'change_tbl_review'),
(59, 'Can delete tbl_ review', 15, 'delete_tbl_review'),
(60, 'Can view tbl_ review', 15, 'view_tbl_review'),
(61, 'Can add tb_payment', 16, 'add_tb_payment'),
(62, 'Can change tb_payment', 16, 'change_tb_payment'),
(63, 'Can delete tb_payment', 16, 'delete_tb_payment'),
(64, 'Can view tb_payment', 16, 'view_tb_payment');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(13, 'nallamapp', 'order_item_tb'),
(12, 'nallamapp', 'order_tb'),
(14, 'nallamapp', 'tbl_cart'),
(10, 'nallamapp', 'tbl_complaint'),
(11, 'nallamapp', 'tbl_feedback'),
(8, 'nallamapp', 'tbl_product'),
(9, 'nallamapp', 'tbl_report'),
(15, 'nallamapp', 'tbl_review'),
(7, 'nallamapp', 'tbl_user'),
(16, 'nallamapp', 'tb_payment'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2022-07-18 09:05:17.006292'),
(2, 'auth', '0001_initial', '2022-07-18 09:05:27.819910'),
(3, 'admin', '0001_initial', '2022-07-18 09:05:30.678074'),
(4, 'admin', '0002_logentry_remove_auto_add', '2022-07-18 09:05:30.761078'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2022-07-18 09:05:30.845083'),
(6, 'contenttypes', '0002_remove_content_type_name', '2022-07-18 09:05:32.930203'),
(7, 'auth', '0002_alter_permission_name_max_length', '2022-07-18 09:05:33.739249'),
(8, 'auth', '0003_alter_user_email_max_length', '2022-07-18 09:05:33.820253'),
(9, 'auth', '0004_alter_user_username_opts', '2022-07-18 09:05:33.856256'),
(10, 'auth', '0005_alter_user_last_login_null', '2022-07-18 09:05:34.126271'),
(11, 'auth', '0006_require_contenttypes_0002', '2022-07-18 09:05:34.137272'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2022-07-18 09:05:34.181274'),
(13, 'auth', '0008_alter_user_username_max_length', '2022-07-18 09:05:34.228277'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2022-07-18 09:05:34.273279'),
(15, 'auth', '0010_alter_group_name_max_length', '2022-07-18 09:05:34.330283'),
(16, 'auth', '0011_update_proxy_permissions', '2022-07-18 09:05:34.354284'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2022-07-18 09:05:34.403287'),
(18, 'sessions', '0001_initial', '2022-07-18 09:05:35.664359'),
(19, 'nallamapp', '0001_initial', '2022-07-19 05:56:54.463215'),
(20, 'nallamapp', '0002_tbl_user_user_type', '2022-07-19 06:19:52.629015'),
(21, 'nallamapp', '0003_tbl_product', '2022-07-21 06:08:14.392351'),
(22, 'nallamapp', '0004_tbl_product_status', '2022-07-21 06:12:58.157581'),
(23, 'nallamapp', '0005_tbl_product_discription', '2022-07-21 07:59:51.373359'),
(24, 'nallamapp', '0006_tbl_report', '2022-07-21 10:04:24.162107'),
(25, 'nallamapp', '0007_tbl_complaint', '2022-07-21 10:29:45.349215'),
(26, 'nallamapp', '0008_tbl_feedback', '2022-07-25 05:39:34.505659'),
(27, 'nallamapp', '0009_order_item_tb_order_tb_tbl_cart', '2022-07-27 09:48:14.760450'),
(28, 'nallamapp', '0010_auto_20220729_1011', '2022-07-29 04:41:42.400996'),
(29, 'nallamapp', '0011_auto_20220729_1023', '2022-07-29 04:53:36.354832'),
(30, 'nallamapp', '0012_tbl_review_user_id', '2022-07-29 04:55:25.755089'),
(31, 'nallamapp', '0013_tbl_review_status', '2022-07-29 11:44:18.716780'),
(32, 'nallamapp', '0014_delete_tbl_report', '2022-10-24 09:29:01.915774'),
(33, 'nallamapp', '0015_rename_status_order_item_tb_packing_status', '2022-10-24 09:37:47.520739'),
(34, 'nallamapp', '0016_tb_payment', '2022-10-24 09:50:57.706954'),
(35, 'nallamapp', '0017_delete_tbl_feedback', '2022-10-25 06:16:15.642211');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('00sk6k8lc6ewp0x3nleyr24gljg8fc7j', 'eyJpZCI6Mn0:1ot4e6:KDcEUjjVrucdVDEhztZHggY8f1CEFrSWjaOaYExl_z0', '2022-11-24 10:18:54.876967'),
('0rrvxas5dx4e8wrhzn0wqq8myxk7r638', 'eyJpZCI6M30:1osK7B:iBuSqmIIuaQsbT7YUcHeH3cSXmzDCLtK2FBU8Z0JCSE', '2022-11-22 08:37:49.445788'),
('9uetxxwakxb8qj7v5x9xiw51ngpph1st', 'e30:1olQFn:RnQ-NPcJF5IIHoHVbD3MfOxChfLYK42NGDfB2tx74Oo', '2022-11-03 07:46:11.549046'),
('b7q3lionsrsqadbtb5ml9chsq8wbp5vx', 'eyJpZCI6MX0:1oEUTP:I5UsSKhzwfwJuDnOcF8QtXlFcmw1LkesLzdIckVcf-Y', '2022-08-04 11:36:07.140960'),
('cv1pmdt0nqyhk9r62aw5m4yzw1a30oxj', 'e30:1osh2p:kvRyZd9NBiamilgy8cgt2Z_-noWevVJUvVDRzVjxuEg', '2022-11-23 09:06:51.981271'),
('dr5w8iu00xpnkh5q9wx5ixgdbu2x5utn', 'eyJpZCI6Mn0:1onDG5:AooqFzvDNb3fmg_OMnJq8Dv9USEQLqQQnIiv01Rl5H4', '2022-11-08 06:17:53.607136'),
('hy4jo0xcidkaovbga4pa4ibi94s97unf', 'eyJpZCI6M30:1omsFa:QTEjYm45LMLJr16DIN4n8cjExTqArmBuVo1kgj5fUNw', '2022-11-07 07:51:58.602274'),
('si99jodhkx2xzg7x0t18dzatzxwj7out', 'e30:1oIOKX:SQL2q4ak1I-ugEpbZy1smimTTINwwuqLo5hZUiNNQkw', '2022-08-15 05:51:05.727198'),
('supp94yx44t42ei4u6tnkvt02xgptz3z', 'eyJpZCI6MX0:1oGcaF:YltNLE5_ItSU0pJciRWk-r-1qAkhd41Fy08nOXNNFnE', '2022-08-10 08:39:59.787152');

-- --------------------------------------------------------

--
-- Table structure for table `nallamapp_order_item_tb`
--

CREATE TABLE `nallamapp_order_item_tb` (
  `id` bigint(20) NOT NULL,
  `total` varchar(30) NOT NULL,
  `date` varchar(100) NOT NULL,
  `time` varchar(100) NOT NULL,
  `payment_status` varchar(30) NOT NULL,
  `packing_status` varchar(30) NOT NULL,
  `cart_id_id` bigint(20) NOT NULL,
  `order_id_id` bigint(20) NOT NULL,
  `product_id_id` bigint(20) NOT NULL,
  `user_id_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `nallamapp_order_item_tb`
--

INSERT INTO `nallamapp_order_item_tb` (`id`, `total`, `date`, `time`, `payment_status`, `packing_status`, `cart_id_id`, `order_id_id`, `product_id_id`, `user_id_id`) VALUES
(1, '2000', '2022-07-28', '11:31:32', 'paid', 'completed', 1, 1, 3, 1),
(3, '1050', '2022-07-30', '09:54:42', 'paid', 'pending', 5, 2, 2, 1),
(4, '200', '2022-07-30', '10:04:53', 'paid', 'completed', 6, 3, 4, 1),
(6, '4550', '2022-10-20', '12:04:34', 'Refunded', 'Cancelled Order', 9, 5, 5, 1),
(8, '550', '2022-11-08', '13:19:52', 'paid', 'completed', 11, 8, 2, 1),
(9, '550', '2022-11-09', '14:26:40', 'paid', 'completed', 12, 9, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `nallamapp_order_tb`
--

CREATE TABLE `nallamapp_order_tb` (
  `id` bigint(20) NOT NULL,
  `product_id` varchar(30) NOT NULL,
  `payment` varchar(30) NOT NULL,
  `date` varchar(100) NOT NULL,
  `time` varchar(100) NOT NULL,
  `total` varchar(30) NOT NULL,
  `payment_status` varchar(30) NOT NULL,
  `status` varchar(30) NOT NULL,
  `cart_id` varchar(30) NOT NULL,
  `user_id_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `nallamapp_order_tb`
--

INSERT INTO `nallamapp_order_tb` (`id`, `product_id`, `payment`, `date`, `time`, `total`, `payment_status`, `status`, `cart_id`, `user_id_id`) VALUES
(1, '[3, 1]', '2000', '2022-07-28', '11:31:32', '', 'paid', 'pending', '[1, 3]', 1),
(2, '[2]', '1050', '2022-07-30', '09:54:42', '', 'paid', 'pending', '[5]', 1),
(3, '[4]', '200', '2022-07-30', '10:04:53', '', 'paid', 'pending', '[6]', 1),
(4, '[1]', '1244', '2022-10-20', '11:53:05', '', 'paid', 'pending', '[8]', 1),
(5, '[5]', '4550', '2022-10-20', '12:04:34', '', 'paid', 'pending', '[9]', 1),
(6, '[1]', '1244', '2022-10-25', '11:07:18', '', 'paid', 'pending', '[10]', 1),
(7, '[1]', '1244', '2022-10-25', '11:10:00', '', 'paid', 'pending', '[10]', 1),
(8, '[2]', '550', '2022-11-08', '13:19:52', '', 'paid', 'pending', '[11]', 1),
(9, '[2]', '550', '2022-11-09', '14:26:40', '', 'paid', 'pending', '[12]', 1);

-- --------------------------------------------------------

--
-- Table structure for table `nallamapp_tbl_cart`
--

CREATE TABLE `nallamapp_tbl_cart` (
  `id` bigint(20) NOT NULL,
  `quantity` varchar(30) NOT NULL,
  `total` varchar(30) NOT NULL,
  `status` varchar(10) NOT NULL,
  `product_id_id` bigint(20) NOT NULL,
  `user_id_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `nallamapp_tbl_cart`
--

INSERT INTO `nallamapp_tbl_cart` (`id`, `quantity`, `total`, `status`, `product_id_id`, `user_id_id`) VALUES
(1, '3', '450', 'paid', 3, 1),
(5, '2', '1000', 'paid', 2, 1),
(6, '1', '150', 'paid', 4, 1),
(9, '3', '4500', 'paid', 5, 1),
(11, '1', '500', 'paid', 2, 1),
(12, '1', '500', 'paid', 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `nallamapp_tbl_complaint`
--

CREATE TABLE `nallamapp_tbl_complaint` (
  `id` bigint(20) NOT NULL,
  `date` varchar(100) NOT NULL,
  `sub` varchar(100) NOT NULL,
  `complaint` varchar(100) NOT NULL,
  `status` varchar(100) NOT NULL,
  `reply` varchar(100) NOT NULL,
  `user_id_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `nallamapp_tbl_complaint`
--

INSERT INTO `nallamapp_tbl_complaint` (`id`, `date`, `sub`, `complaint`, `status`, `reply`, `user_id_id`) VALUES
(1, '2022-07-21 16:03:36.732449', 'salary not enough', 'we are not a satisfied salary here', 'replied', 'ok will check', 3);

-- --------------------------------------------------------

--
-- Table structure for table `nallamapp_tbl_product`
--

CREATE TABLE `nallamapp_tbl_product` (
  `id` bigint(20) NOT NULL,
  `img` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `qty` varchar(100) NOT NULL,
  `price` varchar(100) NOT NULL,
  `status` varchar(100) NOT NULL,
  `discription` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `nallamapp_tbl_product`
--

INSERT INTO `nallamapp_tbl_product` (`id`, `img`, `name`, `qty`, `price`, `status`, `discription`) VALUES
(2, 'pic/_thumb6_TfUvqEz.jpg', 'coconut', '100', '500', 'pending', 'best for any time jakdjkhds'),
(3, 'pic/17.png', 'Kera Oil', '100', '150', 'pending', 'best quality for always klfkf'),
(4, 'pic/23.jpg', 'coconut drinks', '100', '150', 'pending', 'super for all cooking fdjfd'),
(5, 'pic/3.png', 'Rice', '100 ', '1500', 'pending', 'good rice for ever ,best qualuty');

-- --------------------------------------------------------

--
-- Table structure for table `nallamapp_tbl_review`
--

CREATE TABLE `nallamapp_tbl_review` (
  `id` bigint(20) NOT NULL,
  `review` varchar(100) NOT NULL,
  `reply` varchar(100) NOT NULL,
  `product_id_id` bigint(20) DEFAULT NULL,
  `user_id_id` bigint(20) DEFAULT NULL,
  `status` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `nallamapp_tbl_review`
--

INSERT INTO `nallamapp_tbl_review` (`id`, `review`, `reply`, `product_id_id`, `user_id_id`, `status`) VALUES
(1, 'not good', 'ghghghg', 3, 1, 'replied'),
(2, 'not good', 'fdfdfdfdf', 3, 1, 'replied'),
(3, 'dfd', 'okkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk', 3, 1, 'replied'),
(4, 'not good', '', 3, 1, 'pending'),
(5, 'gooood', '', 4, 1, 'pending'),
(6, 'too much', '', 4, 1, 'pending');

-- --------------------------------------------------------

--
-- Table structure for table `nallamapp_tbl_user`
--

CREATE TABLE `nallamapp_tbl_user` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `address` varchar(100) NOT NULL,
  `phone` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `pswd` varchar(100) NOT NULL,
  `status` varchar(100) NOT NULL,
  `user_type` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `nallamapp_tbl_user`
--

INSERT INTO `nallamapp_tbl_user` (`id`, `name`, `address`, `phone`, `email`, `pswd`, `status`, `user_type`) VALUES
(1, 'liya p s', 'Thrissur,kerala,8989', '9766767665', 'liya@gmail.com', '123', 'pending', 'user'),
(2, '', '', '', 'admin@gmail.com', 'admin', '', 'admin'),
(3, 'sona jayson', 'Thrissur', '966565656', 'sona@gmail.com', '123', 'approved', 'staff');

-- --------------------------------------------------------

--
-- Table structure for table `nallamapp_tb_payment`
--

CREATE TABLE `nallamapp_tb_payment` (
  `id` bigint(20) NOT NULL,
  `date` varchar(100) NOT NULL,
  `total_amt` varchar(100) NOT NULL,
  `card_name` varchar(100) NOT NULL,
  `card_number` varchar(100) NOT NULL,
  `card_cvv` varchar(100) NOT NULL,
  `card_expdate` varchar(100) NOT NULL,
  `pay_status` varchar(100) NOT NULL,
  `order_id_id` bigint(20) NOT NULL,
  `product_id_id` bigint(20) NOT NULL,
  `user_id_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `nallamapp_tb_payment`
--

INSERT INTO `nallamapp_tb_payment` (`id`, `date`, `total_amt`, `card_name`, `card_number`, `card_cvv`, `card_expdate`, `pay_status`, `order_id_id`, `product_id_id`, `user_id_id`) VALUES
(2, '2022-11-08', '550', 'ere', '111111111111', '123', '1988', 'paid', 8, 2, 1),
(3, '2022-11-09', '550', 'hhhhjjh', '222222222222', '123', '1988', 'paid', 9, 2, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `nallamapp_order_item_tb`
--
ALTER TABLE `nallamapp_order_item_tb`
  ADD PRIMARY KEY (`id`),
  ADD KEY `nallamapp_order_item_cart_id_id_46d28fa1_fk_nallamapp` (`cart_id_id`),
  ADD KEY `nallamapp_order_item_order_id_id_c0acdf03_fk_nallamapp` (`order_id_id`),
  ADD KEY `nallamapp_order_item_product_id_id_677cd071_fk_nallamapp` (`product_id_id`),
  ADD KEY `nallamapp_order_item_user_id_id_0d7bb1c8_fk_nallamapp` (`user_id_id`);

--
-- Indexes for table `nallamapp_order_tb`
--
ALTER TABLE `nallamapp_order_tb`
  ADD PRIMARY KEY (`id`),
  ADD KEY `nallamapp_order_tb_user_id_id_2640dc0d_fk_nallamapp_tbl_user_id` (`user_id_id`);

--
-- Indexes for table `nallamapp_tbl_cart`
--
ALTER TABLE `nallamapp_tbl_cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `nallamapp_tbl_cart_product_id_id_fada6e7a_fk_nallamapp` (`product_id_id`),
  ADD KEY `nallamapp_tbl_cart_user_id_id_5cbffa7d_fk_nallamapp_tbl_user_id` (`user_id_id`);

--
-- Indexes for table `nallamapp_tbl_complaint`
--
ALTER TABLE `nallamapp_tbl_complaint`
  ADD PRIMARY KEY (`id`),
  ADD KEY `nallamapp_tbl_compla_user_id_id_8cf6d727_fk_nallamapp` (`user_id_id`);

--
-- Indexes for table `nallamapp_tbl_product`
--
ALTER TABLE `nallamapp_tbl_product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `nallamapp_tbl_review`
--
ALTER TABLE `nallamapp_tbl_review`
  ADD PRIMARY KEY (`id`),
  ADD KEY `nallamapp_tbl_review_product_id_id_5179045e_fk_nallamapp` (`product_id_id`),
  ADD KEY `nallamapp_tbl_review_user_id_id_d8b63fa5_fk_nallamapp` (`user_id_id`);

--
-- Indexes for table `nallamapp_tbl_user`
--
ALTER TABLE `nallamapp_tbl_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `nallamapp_tb_payment`
--
ALTER TABLE `nallamapp_tb_payment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `nallamapp_tb_payment_order_id_id_53759f97_fk_nallamapp` (`order_id_id`),
  ADD KEY `nallamapp_tb_payment_product_id_id_ab6ed624_fk_nallamapp` (`product_id_id`),
  ADD KEY `nallamapp_tb_payment_user_id_id_94b6b674_fk_nallamapp` (`user_id_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `nallamapp_order_item_tb`
--
ALTER TABLE `nallamapp_order_item_tb`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `nallamapp_order_tb`
--
ALTER TABLE `nallamapp_order_tb`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `nallamapp_tbl_cart`
--
ALTER TABLE `nallamapp_tbl_cart`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `nallamapp_tbl_complaint`
--
ALTER TABLE `nallamapp_tbl_complaint`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `nallamapp_tbl_product`
--
ALTER TABLE `nallamapp_tbl_product`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `nallamapp_tbl_review`
--
ALTER TABLE `nallamapp_tbl_review`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `nallamapp_tbl_user`
--
ALTER TABLE `nallamapp_tbl_user`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `nallamapp_tb_payment`
--
ALTER TABLE `nallamapp_tb_payment`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `nallamapp_order_item_tb`
--
ALTER TABLE `nallamapp_order_item_tb`
  ADD CONSTRAINT `nallamapp_order_item_cart_id_id_46d28fa1_fk_nallamapp` FOREIGN KEY (`cart_id_id`) REFERENCES `nallamapp_tbl_cart` (`id`),
  ADD CONSTRAINT `nallamapp_order_item_order_id_id_c0acdf03_fk_nallamapp` FOREIGN KEY (`order_id_id`) REFERENCES `nallamapp_order_tb` (`id`),
  ADD CONSTRAINT `nallamapp_order_item_product_id_id_677cd071_fk_nallamapp` FOREIGN KEY (`product_id_id`) REFERENCES `nallamapp_tbl_product` (`id`),
  ADD CONSTRAINT `nallamapp_order_item_user_id_id_0d7bb1c8_fk_nallamapp` FOREIGN KEY (`user_id_id`) REFERENCES `nallamapp_tbl_user` (`id`);

--
-- Constraints for table `nallamapp_order_tb`
--
ALTER TABLE `nallamapp_order_tb`
  ADD CONSTRAINT `nallamapp_order_tb_user_id_id_2640dc0d_fk_nallamapp_tbl_user_id` FOREIGN KEY (`user_id_id`) REFERENCES `nallamapp_tbl_user` (`id`);

--
-- Constraints for table `nallamapp_tbl_cart`
--
ALTER TABLE `nallamapp_tbl_cart`
  ADD CONSTRAINT `nallamapp_tbl_cart_product_id_id_fada6e7a_fk_nallamapp` FOREIGN KEY (`product_id_id`) REFERENCES `nallamapp_tbl_product` (`id`),
  ADD CONSTRAINT `nallamapp_tbl_cart_user_id_id_5cbffa7d_fk_nallamapp_tbl_user_id` FOREIGN KEY (`user_id_id`) REFERENCES `nallamapp_tbl_user` (`id`);

--
-- Constraints for table `nallamapp_tbl_complaint`
--
ALTER TABLE `nallamapp_tbl_complaint`
  ADD CONSTRAINT `nallamapp_tbl_compla_user_id_id_8cf6d727_fk_nallamapp` FOREIGN KEY (`user_id_id`) REFERENCES `nallamapp_tbl_user` (`id`);

--
-- Constraints for table `nallamapp_tbl_review`
--
ALTER TABLE `nallamapp_tbl_review`
  ADD CONSTRAINT `nallamapp_tbl_review_product_id_id_5179045e_fk_nallamapp` FOREIGN KEY (`product_id_id`) REFERENCES `nallamapp_tbl_product` (`id`),
  ADD CONSTRAINT `nallamapp_tbl_review_user_id_id_d8b63fa5_fk_nallamapp` FOREIGN KEY (`user_id_id`) REFERENCES `nallamapp_tbl_user` (`id`);

--
-- Constraints for table `nallamapp_tb_payment`
--
ALTER TABLE `nallamapp_tb_payment`
  ADD CONSTRAINT `nallamapp_tb_payment_order_id_id_53759f97_fk_nallamapp` FOREIGN KEY (`order_id_id`) REFERENCES `nallamapp_order_tb` (`id`),
  ADD CONSTRAINT `nallamapp_tb_payment_product_id_id_ab6ed624_fk_nallamapp` FOREIGN KEY (`product_id_id`) REFERENCES `nallamapp_tbl_product` (`id`),
  ADD CONSTRAINT `nallamapp_tb_payment_user_id_id_94b6b674_fk_nallamapp` FOREIGN KEY (`user_id_id`) REFERENCES `nallamapp_tbl_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
