-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 16, 2019 at 11:46 PM
-- Server version: 10.1.32-MariaDB
-- PHP Version: 7.2.5

SET FOREIGN_KEY_CHECKS=0;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `multi_restaurants2`
--

-- --------------------------------------------------------

--
-- Table structure for table `app_settings`
--

DROP TABLE IF EXISTS `app_settings`;
CREATE TABLE IF NOT EXISTS `app_settings` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `app_settings_key_index` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=116 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Truncate table before insert `app_settings`
--

TRUNCATE TABLE `app_settings`;
--
-- Dumping data for table `app_settings`
--

INSERT INTO `app_settings` (`id`, `key`, `value`) VALUES
(7, 'date_format', 'l jS F Y (H:i:s)'),
(8, 'language', 'en'),
(17, 'is_human_date_format', '1'),
(18, 'app_name', 'Multi-Restaurants'),
(19, 'app_short_description', 'Manage Mobile Application'),
(20, 'mail_driver', 'smtp'),
(21, 'mail_host', 'smtp.mailtrap.io'),
(22, 'mail_port', '2525'),
(23, 'mail_username', 'cb1bbb56ad7b2e'),
(24, 'mail_password', 'b005c361fdcf5b'),
(25, 'mail_encryption', 'tls'),
(26, 'mail_from_address', '3c3ed03f69-5d3964@inbox.mailtrap.io'),
(27, 'mail_from_name', 'Hola'),
(30, 'timezone', 'America/Montserrat'),
(32, 'theme_contrast', 'light'),
(33, 'theme_color', 'primary'),
(34, 'app_logo', '020a2dd4-4277-425a-b450-426663f52633'),
(35, 'nav_color', 'navbar-light bg-white'),
(38, 'logo_bg_color', 'bg-white'),
(66, 'default_role', 'admin'),
(68, 'facebook_app_id', '518416208939727'),
(69, 'facebook_app_secret', '93649810f78fa9ca0d48972fee2a75cd'),
(71, 'twitter_app_id', 'twitter'),
(72, 'twitter_app_secret', 'twitter 1'),
(74, 'google_app_id', '527129559488-roolg8aq110p8r1q952fqa9tm06gbloe.apps.googleusercontent.com'),
(75, 'google_app_secret', 'FpIi8SLgc69ZWodk-xHaOrxn'),
(77, 'enable_google', '1'),
(78, 'enable_facebook', '1'),
(93, 'enable_stripe', '1'),
(94, 'stripe_key', 'pk_test_pltzOnX3zsUZMoTTTVUL4O41'),
(95, 'stripe_secret', 'sk_test_o98VZx3RKDUytaokX4My3a20'),
(101, 'custom_field_models.0', 'App\\Models\\User'),
(104, 'default_tax', '10'),
(107, 'default_currency', '$'),
(108, 'fixed_header', '0'),
(109, 'fixed_footer', '0'),
(110, 'fcm_key', 'AAAAHMZiAQA:APA91bEb71b5sN5jl-w_mmt6vLfgGY5-_CQFxMQsVEfcwO3FAh4-mk1dM6siZwwR3Ls9U0pRDpm96WN1AmrMHQ906GxljILqgU2ZB6Y1TjiLyAiIUETpu7pQFyicER8KLvM9JUiXcfWK'),
(111, 'enable_notifications', '1'),
(112, 'paypal_username', 'sb-z3gdq482047_api1.business.example.com'),
(113, 'paypal_password', 'JV2A7G4SEMLMZ565'),
(114, 'paypal_secret', 'AbMmSXVaig1ExpY3utVS3dcAjx7nAHH0utrZsUN6LYwPgo7wfMzrV5WZ'),
(115, 'enable_paypal', '1');

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

DROP TABLE IF EXISTS `carts`;
CREATE TABLE IF NOT EXISTS `carts` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `food_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `quantity` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `delivery_address_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `carts_food_id_foreign` (`food_id`),
  KEY `carts_user_id_foreign` (`user_id`),
  KEY `carts_delivery_address_id_foreign` (`delivery_address_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Truncate table before insert `carts`
--

TRUNCATE TABLE `carts`;
--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`id`, `food_id`, `user_id`, `quantity`, `delivery_address_id`, `created_at`, `updated_at`) VALUES
(21, 2, 19, 1, NULL, '2019-12-15 19:30:59', '2019-12-15 19:30:59');

-- --------------------------------------------------------

--
-- Table structure for table `cart_extras`
--

DROP TABLE IF EXISTS `cart_extras`;
CREATE TABLE IF NOT EXISTS `cart_extras` (
  `extra_id` int(10) UNSIGNED NOT NULL,
  `cart_id` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`extra_id`,`cart_id`),
  KEY `cart_extras_cart_id_foreign` (`cart_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Truncate table before insert `cart_extras`
--

TRUNCATE TABLE `cart_extras`;
-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(127) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Truncate table before insert `categories`
--

TRUNCATE TABLE `categories`;
--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Grains', '2019-08-29 21:54:23', '2019-10-18 11:38:04'),
(2, 'Sandwiches', '2019-08-29 22:32:04', '2019-08-29 22:32:04'),
(3, 'Vegetables', '2019-08-29 22:42:51', '2019-10-18 11:36:57'),
(4, 'Fruits', '2019-08-30 11:07:15', '2019-10-18 11:37:18'),
(5, 'Protein', '2019-08-30 11:07:38', '2019-10-18 11:37:32');

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

DROP TABLE IF EXISTS `currencies`;
CREATE TABLE IF NOT EXISTS `currencies` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(127) COLLATE utf8mb4_unicode_ci NOT NULL,
  `symbol` varchar(63) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `decimal_digits` tinyint(3) UNSIGNED NOT NULL,
  `rounding` tinyint(3) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Truncate table before insert `currencies`
--

TRUNCATE TABLE `currencies`;
--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `name`, `symbol`, `code`, `decimal_digits`, `rounding`, `created_at`, `updated_at`) VALUES
(1, 'US Dollar', '$', 'USD', 2, 0, '2019-10-22 14:50:48', '2019-10-22 14:50:48'),
(2, 'Euro', '€', 'EUR', 2, 0, '2019-10-22 14:51:39', '2019-10-22 14:51:39'),
(3, 'Indian Rupee', 'টকা', 'INR', 2, 0, '2019-10-22 14:52:50', '2019-10-22 14:52:50'),
(4, 'Indonesian Rupiah', 'Rp', 'IDR', 0, 0, '2019-10-22 14:53:22', '2019-10-22 14:53:22'),
(5, 'Brazilian Real', 'R$', 'BRL', 2, 0, '2019-10-22 14:54:00', '2019-10-22 14:54:00'),
(6, 'Cambodian Riel', '៛', 'KHR', 2, 0, '2019-10-22 14:55:51', '2019-10-22 14:55:51'),
(7, 'Vietnamese Dong', '₫', 'VND', 0, 0, '2019-10-22 14:56:26', '2019-10-22 14:56:26');

-- --------------------------------------------------------

--
-- Table structure for table `custom_fields`
--

DROP TABLE IF EXISTS `custom_fields`;
CREATE TABLE IF NOT EXISTS `custom_fields` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(127) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(56) COLLATE utf8mb4_unicode_ci NOT NULL,
  `values` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `disabled` tinyint(1) DEFAULT NULL,
  `required` tinyint(1) DEFAULT NULL,
  `in_table` tinyint(1) DEFAULT NULL,
  `bootstrap_column` tinyint(4) DEFAULT NULL,
  `order` tinyint(4) DEFAULT NULL,
  `custom_field_model` varchar(127) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Truncate table before insert `custom_fields`
--

TRUNCATE TABLE `custom_fields`;
--
-- Dumping data for table `custom_fields`
--

INSERT INTO `custom_fields` (`id`, `name`, `type`, `values`, `disabled`, `required`, `in_table`, `bootstrap_column`, `order`, `custom_field_model`, `created_at`, `updated_at`) VALUES
(4, 'phone', 'text', NULL, 0, 0, 0, 6, 2, 'App\\Models\\User', '2019-09-06 20:30:00', '2019-09-06 20:31:47'),
(5, 'bio', 'textarea', NULL, 0, 0, 0, 6, 1, 'App\\Models\\User', '2019-09-06 20:43:58', '2019-09-06 20:43:58'),
(6, 'address', 'text', NULL, 0, 0, 0, 6, 3, 'App\\Models\\User', '2019-09-06 20:49:22', '2019-09-06 20:49:22');

-- --------------------------------------------------------

--
-- Table structure for table `custom_field_values`
--

DROP TABLE IF EXISTS `custom_field_values`;
CREATE TABLE IF NOT EXISTS `custom_field_values` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `value` longtext COLLATE utf8mb4_unicode_ci,
  `view` longtext COLLATE utf8mb4_unicode_ci,
  `custom_field_id` int(10) UNSIGNED NOT NULL,
  `customizable_type` varchar(127) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customizable_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `custom_field_values_custom_field_id_foreign` (`custom_field_id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Truncate table before insert `custom_field_values`
--

TRUNCATE TABLE `custom_field_values`;
--
-- Dumping data for table `custom_field_values`
--

INSERT INTO `custom_field_values` (`id`, `value`, `view`, `custom_field_id`, `customizable_type`, `customizable_id`, `created_at`, `updated_at`) VALUES
(29, '+136 226 5669', '+136 226 5669', 4, 'App\\Models\\User', 18, '2019-09-06 20:52:30', '2019-09-06 20:52:30'),
(30, 'Lobortis mattis aliquam faucibus purus. Habitasse platea dictumst vestibulum rhoncus est pellentesque elit. Nunc vel risus commodo viverra maecenas accumsan lacus vel.', 'Lobortis mattis aliquam faucibus purus. Habitasse platea dictumst vestibulum rhoncus est pellentesque elit. Nunc vel risus commodo viverra maecenas accumsan lacus vel.', 5, 'App\\Models\\User', 18, '2019-09-06 20:52:30', '2019-10-16 18:32:35'),
(31, '2911 Corpening Drive South Lyon, MI 48178', '2911 Corpening Drive South Lyon, MI 48178', 6, 'App\\Models\\User', 18, '2019-09-06 20:52:30', '2019-10-16 18:32:35'),
(32, '+136 226 5660', '+136 226 5660', 4, 'App\\Models\\User', 1, '2019-09-06 20:53:58', '2019-09-27 07:12:04'),
(33, 'Faucibus ornare suspendisse sed nisi lacus sed. Pellentesque sit amet porttitor eget dolor morbi non arcu. Eu scelerisque felis imperdiet proin fermentum leo vel orci porta', 'Faucibus ornare suspendisse sed nisi lacus sed. Pellentesque sit amet porttitor eget dolor morbi non arcu. Eu scelerisque felis imperdiet proin fermentum leo vel orci porta', 5, 'App\\Models\\User', 1, '2019-09-06 20:53:58', '2019-10-16 18:23:53'),
(34, '569 Braxton Street Cortland, IL 60112', '569 Braxton Street Cortland, IL 60112', 6, 'App\\Models\\User', 1, '2019-09-06 20:53:58', '2019-10-16 18:23:53'),
(35, '+1 098-6543-236', '+1 098-6543-236', 4, 'App\\Models\\User', 19, '2019-10-15 16:21:32', '2019-10-17 22:21:43'),
(36, 'Aliquet porttitor lacus luctus accumsan tortor posuere ac ut. Tortor pretium viverra suspendisse', 'Aliquet porttitor lacus luctus accumsan tortor posuere ac ut. Tortor pretium viverra suspendisse', 5, 'App\\Models\\User', 19, '2019-10-15 16:21:32', '2019-10-17 22:21:12'),
(37, '1850 Big Elm Kansas City, MO 64106', '1850 Big Elm Kansas City, MO 64106', 6, 'App\\Models\\User', 19, '2019-10-15 16:21:32', '2019-10-17 22:21:43'),
(38, '+1 248-437-7610', '+1 248-437-7610', 4, 'App\\Models\\User', 20, '2019-10-16 18:31:46', '2019-10-16 18:31:46'),
(39, 'Faucibus ornare suspendisse sed nisi lacus sed. Pellentesque sit amet porttitor eget dolor morbi non arcu. Eu scelerisque felis imperdiet proin fermentum leo vel orci porta', 'Faucibus ornare suspendisse sed nisi lacus sed. Pellentesque sit amet porttitor eget dolor morbi non arcu. Eu scelerisque felis imperdiet proin fermentum leo vel orci porta', 5, 'App\\Models\\User', 20, '2019-10-16 18:31:46', '2019-10-16 18:31:46'),
(40, '1050 Frosty Lane Sidney, NY 13838', '1050 Frosty Lane Sidney, NY 13838', 6, 'App\\Models\\User', 20, '2019-10-16 18:31:46', '2019-10-16 18:31:46'),
(41, '+136 226 5669', '+136 226 5669', 4, 'App\\Models\\User', 22, '2019-12-15 17:49:44', '2019-12-15 17:49:44'),
(42, '<p>Short Bio</p>', 'Short Bio', 5, 'App\\Models\\User', 22, '2019-12-15 17:49:44', '2019-12-15 17:49:44'),
(43, '4722 Villa Drive', '4722 Villa Drive', 6, 'App\\Models\\User', 22, '2019-12-15 17:49:44', '2019-12-15 17:49:44');

-- --------------------------------------------------------

--
-- Table structure for table `delivery_addresses`
--

DROP TABLE IF EXISTS `delivery_addresses`;
CREATE TABLE IF NOT EXISTS `delivery_addresses` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` varchar(24) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(24) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_default` tinyint(1) DEFAULT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `delivery_addresses_user_id_foreign` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Truncate table before insert `delivery_addresses`
--

TRUNCATE TABLE `delivery_addresses`;
--
-- Dumping data for table `delivery_addresses`
--

INSERT INTO `delivery_addresses` (`id`, `description`, `address`, `latitude`, `longitude`, `is_default`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'Home Address', 'Rue de Dunkerque', '132', '6.584', 1, 19, '2019-12-06 14:30:23', '2019-12-06 15:23:20'),
(2, 'Work Address', '4722 Villa Drive', '136', '-122.086749655962', 0, 19, '2019-12-06 15:23:03', '2019-12-06 15:23:25'),
(3, 'Delivery Adr', '12 Adr City Hall New Work', NULL, NULL, 1, 20, '2019-12-15 18:18:47', '2019-12-15 18:18:47');

-- --------------------------------------------------------

--
-- Table structure for table `driver_restaurants`
--

DROP TABLE IF EXISTS `driver_restaurants`;
CREATE TABLE IF NOT EXISTS `driver_restaurants` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `restaurant_id` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`user_id`,`restaurant_id`),
  KEY `driver_restaurants_restaurant_id_foreign` (`restaurant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Truncate table before insert `driver_restaurants`
--

TRUNCATE TABLE `driver_restaurants`;
--
-- Dumping data for table `driver_restaurants`
--

INSERT INTO `driver_restaurants` (`user_id`, `restaurant_id`) VALUES
(22, 1),
(22, 2),
(22, 3),
(22, 4);

-- --------------------------------------------------------

--
-- Table structure for table `extras`
--

DROP TABLE IF EXISTS `extras`;
CREATE TABLE IF NOT EXISTS `extras` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(127) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double(8,2) NOT NULL DEFAULT '0.00',
  `food_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `extras_food_id_foreign` (`food_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Truncate table before insert `extras`
--

TRUNCATE TABLE `extras`;
--
-- Dumping data for table `extras`
--

INSERT INTO `extras` (`id`, `name`, `description`, `price`, `food_id`, `created_at`, `updated_at`) VALUES
(1, 'Tuna', '<p>Add some tuna</p>', 3.00, 1, '2019-08-30 11:39:50', '2019-08-30 11:39:50'),
(2, 'Unagi', '<p>Add some Unagi</p>', 5.00, 1, '2019-08-30 11:40:47', '2019-08-30 11:40:47'),
(3, 'Salmon', '<p>Add some Salmon</p>', 8.00, 7, '2019-08-30 11:41:34', '2019-10-18 10:52:30'),
(4, 'Mozzarella', '<p>Add some mozzarella </p>', 6.00, 2, '2019-10-09 12:22:04', '2019-10-16 18:50:53'),
(5, 'Mozzarella', 'Add some Mozzarella', 1.00, 3, '2019-10-17 22:10:01', '2019-10-17 22:10:01'),
(6, 'Vegetable oil', '<p>Add some&nbsp;vegetable oil</p>', 2.00, 3, '2019-10-18 10:53:34', '2019-10-18 10:53:34'),
(7, 'Vegetable oil', '<p>Add some vegetable oil</p>', 2.00, 4, '2019-10-18 10:54:11', '2019-10-18 10:54:11'),
(8, 'Vegetable oil', '<p>Add some&nbsp;</p>', 2.00, 5, '2019-10-18 10:54:37', '2019-10-18 10:54:37'),
(9, 'Tuna', '<p>Add some tuna</p>', 3.00, 3, '2019-10-18 11:38:44', '2019-10-18 11:38:44'),
(10, 'Tuna', '<p>Add some tuna</p>', 3.00, 5, '2019-10-18 11:39:15', '2019-10-18 11:39:15'),
(11, 'Mozzarella', '<p>Add some mozzarella</p>', 4.00, 7, '2019-10-18 11:39:46', '2019-10-18 11:39:46');

-- --------------------------------------------------------

--
-- Table structure for table `faqs`
--

DROP TABLE IF EXISTS `faqs`;
CREATE TABLE IF NOT EXISTS `faqs` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `question` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `answer` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `faq_category_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `faqs_faq_category_id_foreign` (`faq_category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Truncate table before insert `faqs`
--

TRUNCATE TABLE `faqs`;
--
-- Dumping data for table `faqs`
--

INSERT INTO `faqs` (`id`, `question`, `answer`, `faq_category_id`, `created_at`, `updated_at`) VALUES
(1, 'Amet aliquam id diam maecenas ultricies mi eget ?', 'Tellus cras adipiscing enim eu turpis. Facilisis magna etiam tempor orci eu lobortis. Nibh tellus molestie nunc non. Risus in hendrerit gravida rutrum quisque non tellus orci ac. Sagittis nisl rhoncus mattis rhoncus urna neque viverra justo.', 1, '2019-08-31 11:33:33', '2019-10-17 22:13:43'),
(2, 'Posuere sollicitudin aliquam ultrices?', 'Nulla porttitor massa id neque aliquam vestibulum morbi. Sed pulvinar proin gravida hendrerit. Ullamcorper a lacus vestibulum sed arcu non odio euismod.', 2, '2019-09-06 09:27:15', '2019-10-17 22:14:17'),
(3, 'Volutpat blandit aliquam etiam erat velit?', 'Nulla porttitor massa id neque aliquam vestibulum morbi. Sed pulvinar proin gravida hendrerit. Ullamcorper a lacus vestibulum sed arcu non odio euismod', 1, '2019-10-17 22:14:56', '2019-10-17 22:14:56'),
(4, '<p>Aliquet porttitor lacus luctus?<br></p>', '<p>Eget egestas purus viverra accumsan in nisl nisi. Posuere urna nec tincidunt praesent semper feugiat nibh sed pulvinar. Urna cursus eget nunc scelerisque viverra. Accumsan in nisl nisi scelerisque eu ultrices vitae auctor eu.<br></p>', 1, '2019-10-17 22:16:33', '2019-10-17 22:16:33'),
(5, '<p>Proin fermentum leo vel orci porta non pulvinar ?<br></p>', 'Facilisis mauris sit amet massa vitae tortor condimentum lacinia. Arcu dui vivamus arcu felis bibendum ut. Enim facilisis gravida neque convallis a cras semper auctor neque. Pellentesque elit eget gravida cum sociis natoque penatibus et. Massa massa ultricies mi quis. Diam donec adipiscing tristique risus nec feugiat. Id venenatis a condimentum vitae sapien pellentesque habitant morbi. Amet justo donec enim diam vulputate ut.', 2, '2019-10-17 22:17:03', '2019-10-17 22:17:03'),
(6, '<p>Lorem ipsum dolor sit amet<br></p>', '<p>Consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Duis tristique sollicitudin nibh sit amet commodo nulla. Nullam ac tortor vitae purus faucibus ornare. Odio morbi quis commodo odio aenean sed. Sit amet tellus cras adipiscing enim.&nbsp;<br></p>', 2, '2019-10-17 22:17:36', '2019-10-17 22:17:36'),
(7, '<p>Bibendum ut tristique et egestas?<br></p>', '<p>Consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Duis tristique sollicitudin nibh sit amet commodo nulla. Nullam ac tortor vitae purus faucibus ornare. Odio morbi quis commodo odio aenean sed. Sit amet tellus cras adipiscing enim.&nbsp;<br></p>', 3, '2019-10-17 22:18:06', '2019-10-17 22:18:06'),
(8, 'Viverra nam libero justo laoreet', '<p>Est placerat in egestas erat imperdiet sed euismod. Non quam lacus suspendisse faucibus interdum posuere lorem. Eget lorem dolor sed viverra ipsum nunc aliquet bibendum enim.<br></p>', 3, '2019-10-17 22:18:32', '2019-10-17 22:18:32'),
(9, 'Amet cursus sit amet dictum sit?', 'Est placerat in egestas erat imperdiet sed euismod. Non quam lacus suspendisse faucibus interdum posuere lorem. Eget lorem dolor sed viverra ipsum nunc aliquet bibendum enim.', 4, '2019-10-17 22:19:46', '2019-10-17 22:19:46');

-- --------------------------------------------------------

--
-- Table structure for table `faq_categories`
--

DROP TABLE IF EXISTS `faq_categories`;
CREATE TABLE IF NOT EXISTS `faq_categories` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(127) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Truncate table before insert `faq_categories`
--

TRUNCATE TABLE `faq_categories`;
--
-- Dumping data for table `faq_categories`
--

INSERT INTO `faq_categories` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Foods', '2019-08-31 11:31:52', '2019-08-31 11:31:52'),
(2, 'Services', '2019-08-31 11:32:03', '2019-08-31 11:32:03'),
(3, 'Delivery', '2019-08-31 11:32:11', '2019-08-31 11:32:11'),
(4, 'Misc', '2019-08-31 11:32:17', '2019-08-31 11:32:17');

-- --------------------------------------------------------

--
-- Table structure for table `favorites`
--

DROP TABLE IF EXISTS `favorites`;
CREATE TABLE IF NOT EXISTS `favorites` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `food_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `favorites_food_id_foreign` (`food_id`),
  KEY `favorites_user_id_foreign` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Truncate table before insert `favorites`
--

TRUNCATE TABLE `favorites`;
--
-- Dumping data for table `favorites`
--

INSERT INTO `favorites` (`id`, `food_id`, `user_id`, `created_at`, `updated_at`) VALUES
(3, 1, 18, '2019-08-30 15:31:52', '2019-08-30 15:31:53'),
(14, 2, 18, '2019-10-09 12:42:45', '2019-10-09 12:42:45'),
(16, 3, 1, '2019-10-17 22:22:26', '2019-10-17 22:22:26'),
(25, 1, 1, '2019-10-18 12:40:22', '2019-10-18 12:40:22'),
(26, 1, 19, '2019-12-15 19:15:03', '2019-12-15 19:15:03'),
(27, 5, 19, '2019-12-15 19:22:20', '2019-12-15 19:22:20');

-- --------------------------------------------------------

--
-- Table structure for table `favorite_extras`
--

DROP TABLE IF EXISTS `favorite_extras`;
CREATE TABLE IF NOT EXISTS `favorite_extras` (
  `extra_id` int(10) UNSIGNED NOT NULL,
  `favorite_id` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`extra_id`,`favorite_id`),
  KEY `favorite_extras_favorite_id_foreign` (`favorite_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Truncate table before insert `favorite_extras`
--

TRUNCATE TABLE `favorite_extras`;
--
-- Dumping data for table `favorite_extras`
--

INSERT INTO `favorite_extras` (`extra_id`, `favorite_id`) VALUES
(1, 25),
(1, 26),
(2, 3),
(2, 14),
(2, 25);

-- --------------------------------------------------------

--
-- Table structure for table `foods`
--

DROP TABLE IF EXISTS `foods`;
CREATE TABLE IF NOT EXISTS `foods` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(127) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double(8,2) NOT NULL DEFAULT '0.00',
  `discount_price` double(8,2) NOT NULL DEFAULT '0.00',
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `ingredients` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `weight` double(9,2) NOT NULL DEFAULT '0.00',
  `featured` tinyint(1) NOT NULL,
  `restaurant_id` int(10) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `foods_restaurant_id_foreign` (`restaurant_id`),
  KEY `foods_category_id_foreign` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Truncate table before insert `foods`
--

TRUNCATE TABLE `foods`;
--
-- Dumping data for table `foods`
--

INSERT INTO `foods` (`id`, `name`, `price`, `discount_price`, `description`, `ingredients`, `weight`, `featured`, `restaurant_id`, `category_id`, `created_at`, `updated_at`) VALUES
(1, 'American fried rice', 11.00, 0.00, '<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\\\'s standard dummy text ever since the 1500s<br></p>', '<p>Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.<br></p>', 193.00, 1, 2, 1, '2019-08-30 11:21:43', '2019-09-03 21:58:30'),
(2, 'Calas', 15.00, 0.00, 'Calas are dumplings composed primarily of cooked rice, yeast, sugar, eggs, and flour; the resulting batter is deep-fried. It is traditionally a breakfast dish, served with coffee or cafe au lait, and has a mention in most Creole cuisine cookbooks.', 'some ingredients', 634.00, 1, 1, 1, '2019-08-31 12:03:37', '2019-08-31 12:36:16'),
(3, 'Pizza Margherita', 8.00, 0.00, 'Tomato sauce, Firm mozzarella cheese, grated. Fresh soft mozzarella cheese, separated into small clumps. Fontina cheese, grated. Parmesan cheese, grated.', 'Tomato sauce, Firm mozzarella cheese, grated. Fresh soft mozzarella cheese, separated into small clumps. Fontina cheese, grated. Parmesan cheese, grated.', 200.00, 1, 1, 1, '2019-10-17 22:06:51', '2019-10-17 22:06:51'),
(4, 'Pizza Montanara', 6.20, 0.00, '<p>Tomato sauce, mozzarella, mushrooms, pepperoni, and Stracchino (soft cheese)<br></p>', '<p>Tomato sauce, mozzarella, mushrooms, pepperoni, and Stracchino (soft cheese)</p>', 290.50, 0, 1, 1, '2019-10-18 09:09:53', '2019-10-18 09:12:15'),
(5, 'Pizza Valtellina', 7.40, 0.00, 'Tomato sauce, mozzarella, bresaola, Parmesan flakes and rocket', 'Tomato sauce, mozzarella, bresaola, Parmesan flakes and rocket', 245.30, 0, 2, 1, '2019-10-18 09:15:19', '2019-10-18 09:15:19'),
(6, 'Pizza al Pesto', 4.80, 0.00, '<p>Tomato, mozzarella, Genoese pesto, pine nuts, and olives<br></p>', '<p>Tomato, mozzarella, Genoese pesto, pine nuts, and olives<br></p>', 240.00, 0, 3, 1, '2019-10-18 09:16:17', '2019-10-18 09:16:17'),
(7, 'Angel Hair', 10.99, 8.00, 'Angel hair is the thinnest type of pasta, made of long, very fine strands that cook quickly. Use delicate sauces with this narrow noodle, like a light tomato sauce or a broth, or simply cook it with butter and oil.', 'Angel hair is the thinnest type of pasta, made of long, very fine strands that cook quickly. Use delicate sauces with this narrow noodle, like a light tomato sauce or a broth, or simply cook it with butter and oil.', 320.00, 1, 3, 3, '2019-10-18 09:19:33', '2019-10-18 09:19:33'),
(8, 'Acini di Pepe', 11.99, 9.99, 'Sometimes referred to as pastina, acini di pepe means “small parts of the pepper” in Italian, alluding to its miniscule size and rounded shape, which makes it versatile enough to be welcome in a wide range of dishes. Make it the mainstay of a cold salad or sprinkle it into a piping hot soup.', 'Sometimes referred to as pastina, acini di pepe means “small parts of the pepper” in Italian, alluding to its miniscule size and rounded shape, which makes it versatile enough to be welcome in a wide range of dishes. Make it the mainstay of a cold salad o', 260.00, 1, 4, 3, '2019-10-18 09:36:17', '2019-10-18 09:36:17'),
(9, 'Pasta Pappardelle', 12.99, 10.99, 'A wide egg noodle with Tuscan origins, pappardelle is often served with hearty meat sauces, as in our decadent bolognese recipe.', 'A wide egg noodle with Tuscan origins, pappardelle is often served with hearty meat sauces, as in our decadent bolognese recipe.', 290.00, 0, 4, 3, '2019-10-18 09:47:46', '2019-10-18 09:47:46'),
(10, 'Pasta Campanelle', 13.99, 11.99, 'Literally meaning “bellflowers,” campanelle sports a very unique shape that’s great at capturing thick, creamy, or meaty sauces. And they work wonders in cheesy bowls, too.', 'Literally meaning “bellflowers,” campanelle sports a very unique shape that’s great at capturing thick, creamy, or meaty sauces. And they work wonders in cheesy bowls, too.', 190.00, 1, 3, 3, '2019-10-18 09:49:08', '2019-10-18 09:49:08'),
(11, 'Chicken Noodle Soup', 7.90, 0.00, 'This creamy cheese soup is delicious on a cold winter day!', '1/4 cup butter1 onion, chopped 1/4 cup all-purpose flour 3 cups chicken broth 3 cups milk 1 pound shredded Cheddar cheese Add all ingredients to list', 180.00, 1, 1, 3, '2019-10-18 09:52:28', '2019-10-18 09:52:28'),
(12, 'California Italian Wedding Soup', 8.60, 0.00, 'This is my variation of a standard recipe. I like fresh basil and a little lemon rind, so those are basically my only changes. This is a quick and easy soup with flavors that impress all.', '1/2 pound extra-lean ground beef1 egg, lightly beaten 2 tablespoons Italian-seasoned breadcrumbs1 tablespoon grated Parmesan cheese 2 tablespoons shredded fresh basil leaves1 tablespoon chopped Italian flat leaf parsley (optional) 2 green onions, sliced (', 170.00, 1, 3, 3, '2019-10-18 09:54:32', '2019-10-18 09:54:32'),
(13, 'Italian Sausage Soup', 9.99, 7.89, 'This soup embodies all the wonders of Italian cooking: Italian sausage, garlic, tomatoes and red wines. Serve with hot bread and salad for a delicious meal. Garnish with Parmesan cheese.', '1 pound sweet Italian sausage, casings removed1 cup chopped onion2 cloves garlic, minced5 cups beef broth1/2 cup water 1/2 cup red wine4 large tomatoes - peeled, seeded and chopped1 cup thinly sliced carrots1/2 tablespoon packed fresh basil leaves1/2 teas', 150.00, 1, 2, 3, '2019-10-18 09:57:54', '2019-10-18 09:57:54'),
(14, 'Big Smokey Burgers', 7.99, 0.00, '<p>I created this recipe while trying to recreate the best burger I had ever tasted at a restaurant in the Great Smoky Mountains of North Carolina. My family and I think these burgers are better! They are packed with flavor!<br></p>', '<ul><li>2 pounds ground beef sirloin</li><li>1/2 onion, grated1 tablespoon grill seasoning</li><li>1 tablespoon liquid smoke flavoring </li><li>2 tablespoons Worcestershire sauce </li><li>2 tablespoons minced garlic</li><li>1 table</li></ul>', 150.00, 1, 2, 2, '2019-10-18 10:01:09', '2019-10-18 10:46:40'),
(15, 'Juicy Lucy Burgers', 8.99, 0.00, '<p>A favorite of Minnesotans! The famous Juicy Lucy! Mmmm. So good. You MUST use American cheese on this to achieve the juiciness in the middle! I like sauteed mushrooms and onions on mine!<br></p>', '<ul><li><span style=\"font-size: 1rem;\">1/2 pounds ground beef</span></li><li><span style=\"font-size: 1rem;\">1 tablespoon Worcestershire sauce</span></li><li><span style=\"font-size: 1rem;\">3/4 teaspoon garlic salt</span></li><li><span style=\"font-size: 1re', 190.00, 1, 4, 2, '2019-10-18 10:49:36', '2019-10-18 10:49:36'),
(16, 'Cedar Planked Salmon', 16.30, 12.90, '<p>This is a dish my brother prepared for me in Seattle. It is by far the best salmon I\'ve ever eaten. I like to serve it with Asian-inspired rice and roasted asparagus.<br></p>', '<ul><li>3 (12 inch) untreated cedar planks</li><li>1/3 cup vegetable oil</li><li>1/2 tablespoons rice vinegar1 teaspoon sesame oil</li><li>1/3 cup soy sauce</li><li>1/4 cup chopped green onions</li><li>1 tablespoon grated fresh ginger root</li><li>1 teasp', 163.00, 1, 3, 1, '2019-10-18 10:51:51', '2019-10-18 10:51:51');

-- --------------------------------------------------------

--
-- Table structure for table `food_orders`
--

DROP TABLE IF EXISTS `food_orders`;
CREATE TABLE IF NOT EXISTS `food_orders` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `price` double(8,2) NOT NULL DEFAULT '0.00',
  `quantity` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `food_id` int(10) UNSIGNED NOT NULL,
  `order_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `food_orders_food_id_foreign` (`food_id`),
  KEY `food_orders_order_id_foreign` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Truncate table before insert `food_orders`
--

TRUNCATE TABLE `food_orders`;
--
-- Dumping data for table `food_orders`
--

INSERT INTO `food_orders` (`id`, `price`, `quantity`, `food_id`, `order_id`, `created_at`, `updated_at`) VALUES
(40, 15.00, 1, 2, 31, '2019-12-15 18:10:13', '2019-12-15 18:10:13'),
(41, 21.00, 1, 2, 31, '2019-12-15 18:10:13', '2019-12-15 18:10:13'),
(42, 6.20, 1, 4, 32, '2019-12-15 18:18:52', '2019-12-15 18:18:52'),
(43, 7.40, 1, 5, 33, '2019-12-15 18:19:47', '2019-12-15 18:19:47'),
(44, 11.00, 1, 1, 33, '2019-12-15 18:19:47', '2019-12-15 18:19:47'),
(45, 19.00, 1, 1, 34, '2019-12-15 18:55:29', '2019-12-15 18:55:29'),
(46, 15.00, 1, 2, 35, '2019-12-15 19:11:54', '2019-12-15 19:11:54'),
(47, 14.00, 1, 1, 38, '2019-12-15 19:15:55', '2019-12-15 19:15:55'),
(48, 11.00, 1, 1, 38, '2019-12-15 19:15:55', '2019-12-15 19:15:55');

-- --------------------------------------------------------

--
-- Table structure for table `food_order_extras`
--

DROP TABLE IF EXISTS `food_order_extras`;
CREATE TABLE IF NOT EXISTS `food_order_extras` (
  `food_order_id` int(10) UNSIGNED NOT NULL,
  `extra_id` int(10) UNSIGNED NOT NULL,
  `price` double(8,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`food_order_id`,`extra_id`),
  KEY `food_order_extras_extra_id_foreign` (`extra_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Truncate table before insert `food_order_extras`
--

TRUNCATE TABLE `food_order_extras`;
--
-- Dumping data for table `food_order_extras`
--

INSERT INTO `food_order_extras` (`food_order_id`, `extra_id`, `price`) VALUES
(41, 4, 0.00),
(45, 1, 0.00),
(45, 2, 0.00),
(47, 1, 0.00);

-- --------------------------------------------------------

--
-- Table structure for table `food_reviews`
--

DROP TABLE IF EXISTS `food_reviews`;
CREATE TABLE IF NOT EXISTS `food_reviews` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `review` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `rate` tinyint(3) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `food_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `food_reviews_user_id_foreign` (`user_id`),
  KEY `food_reviews_food_id_foreign` (`food_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Truncate table before insert `food_reviews`
--

TRUNCATE TABLE `food_reviews`;
--
-- Dumping data for table `food_reviews`
--

INSERT INTO `food_reviews` (`id`, `review`, `rate`, `user_id`, `food_id`, `created_at`, `updated_at`) VALUES
(1, '<p>Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.<br></p>', 4, 18, 1, '2019-08-30 11:37:44', '2019-08-30 11:37:44'),
(2, '<p>Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.<br></p>', 4, 1, 2, '2019-10-09 12:24:37', '2019-10-09 12:24:37'),
(3, '<p>Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.<br></p>', 4, 19, 3, '2019-10-17 22:12:11', '2019-10-17 22:12:11');

-- --------------------------------------------------------

--
-- Table structure for table `galleries`
--

DROP TABLE IF EXISTS `galleries`;
CREATE TABLE IF NOT EXISTS `galleries` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `restaurant_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `galleries_restaurant_id_foreign` (`restaurant_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Truncate table before insert `galleries`
--

TRUNCATE TABLE `galleries`;
--
-- Dumping data for table `galleries`
--

INSERT INTO `galleries` (`id`, `description`, `restaurant_id`, `created_at`, `updated_at`) VALUES
(1, '<p>Our Team</p>', 1, '2019-08-30 11:35:38', '2019-08-30 11:35:38'),
(2, '<p>Our Hall</p>', 1, '2019-08-31 16:00:43', '2019-08-31 16:01:06'),
(3, '<p>Our Tables</p>', 1, '2019-10-16 18:39:42', '2019-10-16 18:39:42'),
(4, '<p><span style=\"color: rgb(33, 37, 41);\">Our Team</span><br></p>', 2, '2019-10-16 18:40:20', '2019-10-16 18:40:20'),
(5, '<p><span style=\"color: rgb(33, 37, 41);\">Our Hall</span><br></p>', 2, '2019-10-16 18:40:38', '2019-10-16 18:40:38'),
(6, '<p><span style=\"color: rgb(33, 37, 41);\">Our Tables</span><br></p>', 2, '2019-10-16 18:40:56', '2019-10-16 18:40:56'),
(7, '<p><span style=\"color: rgb(33, 37, 41);\">Our Hall</span><br></p>', 3, '2019-10-16 18:41:41', '2019-10-16 18:41:41'),
(8, '<p><span style=\"color: rgb(33, 37, 41);\">Our Team</span><br></p>', 3, '2019-10-16 18:41:56', '2019-10-16 18:41:56'),
(9, '<p><span style=\"color: rgb(33, 37, 41);\">Our Tables</span><br></p>', 3, '2019-10-16 18:42:12', '2019-10-16 18:42:12'),
(10, '<p><span style=\"color: rgb(33, 37, 41);\">Our Hall</span><br></p>', 4, '2019-10-16 18:42:24', '2019-10-16 18:42:24'),
(11, '<p><span style=\"color: rgb(33, 37, 41);\">Our Teal</span><br></p>', 4, '2019-10-16 18:42:38', '2019-10-16 18:42:38');

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

DROP TABLE IF EXISTS `media`;
CREATE TABLE IF NOT EXISTS `media` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL,
  `collection_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mime_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `disk` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` int(10) UNSIGNED NOT NULL,
  `manipulations` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `custom_properties` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `responsive_images` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_column` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `media_model_type_model_id_index` (`model_type`,`model_id`)
) ENGINE=InnoDB AUTO_INCREMENT=152 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Truncate table before insert `media`
--

TRUNCATE TABLE `media`;
--
-- Dumping data for table `media`
--

INSERT INTO `media` (`id`, `model_type`, `model_id`, `collection_name`, `name`, `file_name`, `mime_type`, `disk`, `size`, `manipulations`, `custom_properties`, `responsive_images`, `order_column`, `created_at`, `updated_at`) VALUES
(17, 'App\\Models\\User', 7, 'avatar', 'type3 - Copie', 'type3---Copie.jpg', 'image/jpeg', 'public', 93699, '[]', '{\"uuid\":\"f23837ec-ec63-4a35-b9ca-4a2da1a136fa\",\"custom_headers\":[],\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 15, '2018-08-06 22:03:06', '2018-08-06 22:03:06'),
(32, 'App\\Models\\Upload', 18, 'avatar', 'user0', 'user0.jpg', 'image/jpeg', 'public', 27946, '[]', '{\"uuid\":\"f090bd7d-1e27-4832-8355-b9dd45c9e9ca\",\"custom_headers\":[],\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 30, '2019-08-27 14:58:03', '2019-08-27 14:58:04'),
(34, 'App\\Models\\Upload', 19, 'app_logo', 'ic_launcher', 'ic_launcher.png', 'image/png', 'public', 18944, '[]', '{\"uuid\":\"020a2dd4-4277-425a-b450-426663f52633\",\"custom_headers\":[],\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 32, '2019-08-27 14:59:08', '2019-08-27 14:59:09'),
(35, 'App\\Models\\Upload', 20, 'image', 'food3', 'food3.jpg', 'image/jpeg', 'public', 129114, '[]', '{\"uuid\":\"26337c68-3ba4-489d-b417-42f5617fbe10\",\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 33, '2019-08-29 21:54:21', '2019-08-29 21:54:21'),
(37, 'App\\Models\\Upload', 21, 'image', 'food5', 'food5.jpg', 'image/jpeg', 'public', 95713, '[]', '{\"uuid\":\"d6d948be-fb90-43bc-840e-fb0e1af2d253\",\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 35, '2019-08-29 22:32:01', '2019-08-29 22:32:02'),
(39, 'App\\Models\\Upload', 22, 'image', 'food0', 'food0.jpg', 'image/jpeg', 'public', 102282, '[]', '{\"uuid\":\"6131cae4-e0c1-495e-9c09-34ca3ce469f6\",\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 37, '2019-08-29 22:42:48', '2019-08-29 22:42:49'),
(42, 'App\\Models\\Upload', 23, 'image', 'food1', 'food1.jpg', 'image/jpeg', 'public', 138202, '[]', '{\"uuid\":\"f678c87b-5583-4a1c-bdec-4fbde1f3bdca\",\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 40, '2019-08-30 11:07:13', '2019-08-30 11:07:14'),
(44, 'App\\Models\\Upload', 24, 'image', 'food5', 'food5.jpg', 'image/jpeg', 'public', 95713, '[]', '{\"uuid\":\"8e79b31c-1f20-4d30-abee-30627dd707ea\",\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 42, '2019-08-30 11:07:36', '2019-08-30 11:07:36'),
(48, 'App\\Models\\Food', 1, 'image', 'food1', 'food1.jpg', 'image/jpeg', 'public', 138202, '[]', '{\"uuid\":\"f678c87b-5583-4a1c-bdec-4fbde1f3bdca\",\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 46, '2019-08-30 11:21:43', '2019-08-30 11:21:43'),
(52, 'App\\Models\\Upload', 25, 'image', 'food2', 'food2.jpg', 'image/jpeg', 'public', 89539, '[]', '{\"uuid\":\"02a2bd26-5f72-4089-a87a-2d0c1cad4e35\",\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 50, '2019-08-30 11:41:19', '2019-08-30 11:41:20'),
(54, 'App\\Models\\Food', 2, 'image', 'food2', 'food2.jpg', 'image/jpeg', 'public', 89539, '[]', '{\"uuid\":\"02a2bd26-5f72-4089-a87a-2d0c1cad4e35\",\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 52, '2019-08-31 12:03:37', '2019-08-31 12:03:37'),
(57, 'App\\Models\\Upload', 26, 'avatar', 'user1', 'user1.jpg', 'image/jpeg', 'public', 28974, '[]', '{\"uuid\":\"c0a791ea-33ed-4002-ac7d-267e08d740da\",\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 55, '2019-09-01 10:47:09', '2019-09-01 10:47:10'),
(59, 'App\\Models\\NotificationType', 1, 'image', 'food1', 'food1.jpg', 'image/jpeg', 'public', 138202, '[]', '{\"uuid\":\"f678c87b-5583-4a1c-bdec-4fbde1f3bdca\",\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 57, '2019-09-04 13:06:14', '2019-09-04 13:06:14'),
(60, 'App\\Models\\NotificationType', 2, 'image', 'food0', 'food0.jpg', 'image/jpeg', 'public', 102282, '[]', '{\"uuid\":\"6131cae4-e0c1-495e-9c09-34ca3ce469f6\",\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 58, '2019-09-04 13:06:36', '2019-09-04 13:06:36'),
(61, 'App\\Models\\NotificationType', 3, 'image', 'food2', 'food2.jpg', 'image/jpeg', 'public', 89539, '[]', '{\"uuid\":\"02a2bd26-5f72-4089-a87a-2d0c1cad4e35\",\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 59, '2019-09-04 13:07:10', '2019-09-04 13:07:10'),
(62, 'App\\Models\\User', 1, 'avatar', 'user0', 'user0.jpg', 'image/jpeg', 'public', 27946, '[]', '{\"uuid\":\"f090bd7d-1e27-4832-8355-b9dd45c9e9ca\",\"custom_headers\":[],\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 60, '2019-09-06 21:38:59', '2019-09-06 21:38:59'),
(65, 'App\\Models\\User', 19, 'avatar', 'api', 'api.png', 'image/png', 'public', 796, '[]', '{\"uuid\":\"$2y$10$MhJMEFqv6leUxN7oOApXHuUStBVmAbec.it7g1HRt63G7xdNwmmRK\",\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 63, '2019-10-12 21:31:27', '2019-10-12 21:31:28'),
(66, 'App\\Models\\User', 20, 'avatar', 'api', 'api.png', 'image/png', 'public', 1208, '[]', '{\"uuid\":\"$2y$10$dc7KCWO\\/WQfMEs\\/ulB7ycu\\/rjNGHd2li8rEw5O8bJL1KWAqJE9g0m\",\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 64, '2019-10-15 16:55:40', '2019-10-15 16:55:42'),
(67, 'App\\Models\\User', 18, 'avatar', 'user1', 'user1.jpg', 'image/jpeg', 'public', 28974, '[]', '{\"uuid\":\"c0a791ea-33ed-4002-ac7d-267e08d740da\",\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 65, '2019-10-16 18:32:09', '2019-10-16 18:32:09'),
(68, 'App\\Models\\Upload', 27, 'image', 'restaurant-3597677_1280', 'restaurant-3597677_1280.jpg', 'image/jpeg', 'public', 369963, '[]', '{\"uuid\":\"76a05190-0d7d-4b24-9100-ff78e0aa04dc\",\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 66, '2019-10-16 18:34:03', '2019-10-16 18:34:04'),
(69, 'App\\Models\\Restaurant', 2, 'image', 'restaurant-3597677_1280', 'restaurant-3597677_1280.jpg', 'image/jpeg', 'public', 369963, '[]', '{\"uuid\":\"76a05190-0d7d-4b24-9100-ff78e0aa04dc\",\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 67, '2019-10-16 18:34:20', '2019-10-16 18:34:20'),
(70, 'App\\Models\\Upload', 28, 'image', 'restaurant-2649620_1280', 'restaurant-2649620_1280.jpg', 'image/jpeg', 'public', 441524, '[]', '{\"uuid\":\"657d6464-130a-4805-aa97-d1b06f5809f5\",\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 68, '2019-10-16 18:35:31', '2019-10-16 18:35:32'),
(71, 'App\\Models\\Restaurant', 1, 'image', 'restaurant-2649620_1280', 'restaurant-2649620_1280.jpg', 'image/jpeg', 'public', 441524, '[]', '{\"uuid\":\"657d6464-130a-4805-aa97-d1b06f5809f5\",\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 69, '2019-10-16 18:35:34', '2019-10-16 18:35:34'),
(72, 'App\\Models\\Upload', 29, 'image', 'restaurant-449952_1280', 'restaurant-449952_1280.jpg', 'image/jpeg', 'public', 289736, '[]', '{\"uuid\":\"0a6b49a6-154a-407e-a864-42c22dcf751b\",\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 70, '2019-10-16 18:36:56', '2019-10-16 18:36:57'),
(73, 'App\\Models\\Restaurant', 3, 'image', 'restaurant-449952_1280', 'restaurant-449952_1280.jpg', 'image/jpeg', 'public', 289736, '[]', '{\"uuid\":\"0a6b49a6-154a-407e-a864-42c22dcf751b\",\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 71, '2019-10-16 18:37:18', '2019-10-16 18:37:18'),
(74, 'App\\Models\\Upload', 30, 'image', 'restaurant-1837150_1920', 'restaurant-1837150_1920.jpg', 'image/jpeg', 'public', 540709, '[]', '{\"uuid\":\"05801bad-536b-47cc-85db-cbd391fd5eab\",\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 72, '2019-10-16 18:37:57', '2019-10-16 18:37:58'),
(75, 'App\\Models\\Restaurant', 4, 'image', 'restaurant-1837150_1920', 'restaurant-1837150_1920.jpg', 'image/jpeg', 'public', 540709, '[]', '{\"uuid\":\"05801bad-536b-47cc-85db-cbd391fd5eab\",\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 73, '2019-10-16 18:38:18', '2019-10-16 18:38:18'),
(77, 'App\\Models\\Gallery', 2, 'image', 'restaurant-2649620_1280', 'restaurant-2649620_1280.jpg', 'image/jpeg', 'public', 441524, '[]', '{\"uuid\":\"657d6464-130a-4805-aa97-d1b06f5809f5\",\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 75, '2019-10-16 18:39:07', '2019-10-16 18:39:07'),
(78, 'App\\Models\\Gallery', 3, 'image', 'restaurant-3597677_1280', 'restaurant-3597677_1280.jpg', 'image/jpeg', 'public', 369963, '[]', '{\"uuid\":\"76a05190-0d7d-4b24-9100-ff78e0aa04dc\",\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 76, '2019-10-16 18:39:42', '2019-10-16 18:39:42'),
(79, 'App\\Models\\Gallery', 4, 'image', 'restaurant-1837150_1920', 'restaurant-1837150_1920.jpg', 'image/jpeg', 'public', 540709, '[]', '{\"uuid\":\"05801bad-536b-47cc-85db-cbd391fd5eab\",\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 77, '2019-10-16 18:40:20', '2019-10-16 18:40:20'),
(80, 'App\\Models\\Gallery', 5, 'image', 'restaurant-2649620_1280', 'restaurant-2649620_1280.jpg', 'image/jpeg', 'public', 441524, '[]', '{\"uuid\":\"657d6464-130a-4805-aa97-d1b06f5809f5\",\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 78, '2019-10-16 18:40:38', '2019-10-16 18:40:38'),
(81, 'App\\Models\\Gallery', 6, 'image', 'restaurant-3597677_1280', 'restaurant-3597677_1280.jpg', 'image/jpeg', 'public', 369963, '[]', '{\"uuid\":\"76a05190-0d7d-4b24-9100-ff78e0aa04dc\",\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 79, '2019-10-16 18:40:56', '2019-10-16 18:40:56'),
(82, 'App\\Models\\Gallery', 7, 'image', 'restaurant-1837150_1920', 'restaurant-1837150_1920.jpg', 'image/jpeg', 'public', 540709, '[]', '{\"uuid\":\"05801bad-536b-47cc-85db-cbd391fd5eab\",\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 80, '2019-10-16 18:41:41', '2019-10-16 18:41:41'),
(83, 'App\\Models\\Gallery', 8, 'image', 'restaurant-449952_1280', 'restaurant-449952_1280.jpg', 'image/jpeg', 'public', 289736, '[]', '{\"uuid\":\"0a6b49a6-154a-407e-a864-42c22dcf751b\",\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 81, '2019-10-16 18:41:56', '2019-10-16 18:41:56'),
(84, 'App\\Models\\Gallery', 9, 'image', 'restaurant-3597677_1280', 'restaurant-3597677_1280.jpg', 'image/jpeg', 'public', 369963, '[]', '{\"uuid\":\"76a05190-0d7d-4b24-9100-ff78e0aa04dc\",\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 82, '2019-10-16 18:42:12', '2019-10-16 18:42:12'),
(85, 'App\\Models\\Gallery', 10, 'image', 'restaurant-3597677_1280', 'restaurant-3597677_1280.jpg', 'image/jpeg', 'public', 369963, '[]', '{\"uuid\":\"76a05190-0d7d-4b24-9100-ff78e0aa04dc\",\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 83, '2019-10-16 18:42:24', '2019-10-16 18:42:24'),
(86, 'App\\Models\\Gallery', 11, 'image', 'restaurant-449952_1280', 'restaurant-449952_1280.jpg', 'image/jpeg', 'public', 289736, '[]', '{\"uuid\":\"0a6b49a6-154a-407e-a864-42c22dcf751b\",\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 84, '2019-10-16 18:42:38', '2019-10-16 18:42:38'),
(87, 'App\\Models\\Upload', 31, 'image', 'extra1', 'extra1.jpg', 'image/jpeg', 'public', 7578, '[]', '{\"uuid\":\"2dedc2c0-a47b-4bc6-a9dd-c36f41d8949b\",\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 85, '2019-10-16 18:49:08', '2019-10-16 18:49:08'),
(88, 'App\\Models\\Extra', 2, 'image', 'extra1', 'extra1.jpg', 'image/jpeg', 'public', 7578, '[]', '{\"uuid\":\"2dedc2c0-a47b-4bc6-a9dd-c36f41d8949b\",\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 86, '2019-10-16 18:49:15', '2019-10-16 18:49:15'),
(89, 'App\\Models\\Upload', 32, 'image', 'extra3', 'extra3.jpg', 'image/jpeg', 'public', 19323, '[]', '{\"uuid\":\"09f3a00a-d451-46d0-b200-f33fb09fcdf5\",\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 87, '2019-10-16 18:49:39', '2019-10-16 18:49:40'),
(90, 'App\\Models\\Extra', 1, 'image', 'extra3', 'extra3.jpg', 'image/jpeg', 'public', 19323, '[]', '{\"uuid\":\"09f3a00a-d451-46d0-b200-f33fb09fcdf5\",\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 88, '2019-10-16 18:49:46', '2019-10-16 18:49:46'),
(91, 'App\\Models\\Upload', 33, 'image', 'extra5', 'extra5.jpg', 'image/jpeg', 'public', 17578, '[]', '{\"uuid\":\"de3dbcd2-cbef-44ce-a63d-acdeba07f8db\",\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 89, '2019-10-16 18:50:11', '2019-10-16 18:50:13'),
(92, 'App\\Models\\Extra', 3, 'image', 'extra5', 'extra5.jpg', 'image/jpeg', 'public', 17578, '[]', '{\"uuid\":\"de3dbcd2-cbef-44ce-a63d-acdeba07f8db\",\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 90, '2019-10-16 18:50:16', '2019-10-16 18:50:16'),
(93, 'App\\Models\\Upload', 34, 'image', 'extra4', 'extra4.jpg', 'image/jpeg', 'public', 11839, '[]', '{\"uuid\":\"06a22ca5-b0d0-4037-84b8-de56544b5603\",\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 91, '2019-10-16 18:50:34', '2019-10-16 18:50:34'),
(94, 'App\\Models\\Extra', 4, 'image', 'extra4', 'extra4.jpg', 'image/jpeg', 'public', 11839, '[]', '{\"uuid\":\"06a22ca5-b0d0-4037-84b8-de56544b5603\",\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 92, '2019-10-16 18:50:53', '2019-10-16 18:50:53'),
(95, 'App\\Models\\Upload', 35, 'image', 'margherita-pizza-993274_1280', 'margherita-pizza-993274_1280.jpg', 'image/jpeg', 'public', 237678, '[]', '{\"uuid\":\"793eed7b-c814-441c-9bed-05f325a3c40f\",\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 93, '2019-10-17 22:04:25', '2019-10-17 22:04:27'),
(96, 'App\\Models\\Food', 3, 'image', 'margherita-pizza-993274_1280', 'margherita-pizza-993274_1280.jpg', 'image/jpeg', 'public', 237678, '[]', '{\"uuid\":\"793eed7b-c814-441c-9bed-05f325a3c40f\",\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 94, '2019-10-17 22:06:52', '2019-10-17 22:06:52'),
(97, 'App\\Models\\Extra', 5, 'image', 'extra4', 'extra4.jpg', 'image/jpeg', 'public', 11839, '[]', '{\"uuid\":\"06a22ca5-b0d0-4037-84b8-de56544b5603\",\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 95, '2019-10-17 22:10:01', '2019-10-17 22:10:01'),
(98, 'App\\Models\\Upload', 36, 'image', 'pizza-2000615_1280', 'pizza-2000615_1280.jpg', 'image/jpeg', 'public', 335428, '[]', '{\"uuid\":\"a261347a-3dfa-4d4d-86e9-85bd442a2b50\",\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 96, '2019-10-18 09:09:45', '2019-10-18 09:09:47'),
(99, 'App\\Models\\Food', 4, 'image', 'pizza-2000615_1280', 'pizza-2000615_1280.jpg', 'image/jpeg', 'public', 335428, '[]', '{\"uuid\":\"a261347a-3dfa-4d4d-86e9-85bd442a2b50\",\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 97, '2019-10-18 09:09:53', '2019-10-18 09:09:53'),
(100, 'App\\Models\\Upload', 37, 'image', 'pizza-2802332_1280', 'pizza-2802332_1280.jpg', 'image/jpeg', 'public', 450717, '[]', '{\"uuid\":\"fe38c3e7-6d6f-4b53-94aa-b1ebe5970854\",\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 98, '2019-10-18 09:14:17', '2019-10-18 09:14:18'),
(101, 'App\\Models\\Food', 5, 'image', 'pizza-2802332_1280', 'pizza-2802332_1280.jpg', 'image/jpeg', 'public', 450717, '[]', '{\"uuid\":\"fe38c3e7-6d6f-4b53-94aa-b1ebe5970854\",\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 99, '2019-10-18 09:15:19', '2019-10-18 09:15:19'),
(102, 'App\\Models\\Upload', 38, 'image', 'pizza-1081543_1280', 'pizza-1081543_1280.jpg', 'image/jpeg', 'public', 175543, '[]', '{\"uuid\":\"6b658af2-efff-40d0-ba94-58a545fcade7\",\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 100, '2019-10-18 09:15:35', '2019-10-18 09:15:35'),
(103, 'App\\Models\\Food', 6, 'image', 'pizza-1081543_1280', 'pizza-1081543_1280.jpg', 'image/jpeg', 'public', 175543, '[]', '{\"uuid\":\"6b658af2-efff-40d0-ba94-58a545fcade7\",\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 101, '2019-10-18 09:16:17', '2019-10-18 09:16:17'),
(104, 'App\\Models\\Upload', 39, 'image', 'pasta-712664_1280', 'pasta-712664_1280.jpg', 'image/jpeg', 'public', 261150, '[]', '{\"uuid\":\"9120de78-3d31-4934-9bdc-5199baee264d\",\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 102, '2019-10-18 09:19:19', '2019-10-18 09:19:20'),
(105, 'App\\Models\\Food', 7, 'image', 'pasta-712664_1280', 'pasta-712664_1280.jpg', 'image/jpeg', 'public', 261150, '[]', '{\"uuid\":\"9120de78-3d31-4934-9bdc-5199baee264d\",\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 103, '2019-10-18 09:19:33', '2019-10-18 09:19:33'),
(106, 'App\\Models\\Upload', 40, 'image', 'spaghetti-709337_1280', 'spaghetti-709337_1280.jpg', 'image/jpeg', 'public', 220613, '[]', '{\"uuid\":\"86e07703-c20b-4986-a401-c03f82203264\",\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 104, '2019-10-18 09:35:16', '2019-10-18 09:35:17'),
(107, 'App\\Models\\Food', 8, 'image', 'spaghetti-709337_1280', 'spaghetti-709337_1280.jpg', 'image/jpeg', 'public', 220613, '[]', '{\"uuid\":\"86e07703-c20b-4986-a401-c03f82203264\",\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 105, '2019-10-18 09:36:17', '2019-10-18 09:36:17'),
(108, 'App\\Models\\Upload', 41, 'image', 'spaghetti-3547078_1280', 'spaghetti-3547078_1280.jpg', 'image/jpeg', 'public', 226745, '[]', '{\"uuid\":\"c4483eb7-f84b-4791-925c-e257bbb8cf18\",\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 106, '2019-10-18 09:46:58', '2019-10-18 09:46:58'),
(109, 'App\\Models\\Food', 9, 'image', 'spaghetti-3547078_1280', 'spaghetti-3547078_1280.jpg', 'image/jpeg', 'public', 226745, '[]', '{\"uuid\":\"c4483eb7-f84b-4791-925c-e257bbb8cf18\",\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 107, '2019-10-18 09:47:46', '2019-10-18 09:47:46'),
(110, 'App\\Models\\Upload', 42, 'image', 'pasta-329521_1280', 'pasta-329521_1280.jpg', 'image/jpeg', 'public', 195843, '[]', '{\"uuid\":\"cd5f8506-d4b6-4dd8-908e-2e1a9f5e5ef9\",\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 108, '2019-10-18 09:48:30', '2019-10-18 09:48:31'),
(111, 'App\\Models\\Food', 10, 'image', 'pasta-329521_1280', 'pasta-329521_1280.jpg', 'image/jpeg', 'public', 195843, '[]', '{\"uuid\":\"cd5f8506-d4b6-4dd8-908e-2e1a9f5e5ef9\",\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 109, '2019-10-18 09:49:08', '2019-10-18 09:49:08'),
(112, 'App\\Models\\Upload', 43, 'image', 'soup-4115245_1280', 'soup-4115245_1280.jpg', 'image/jpeg', 'public', 222194, '[]', '{\"uuid\":\"6d450cd5-b522-4b0a-8925-966afc4a6872\",\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 110, '2019-10-18 09:51:04', '2019-10-18 09:51:04'),
(113, 'App\\Models\\Food', 11, 'image', 'soup-4115245_1280', 'soup-4115245_1280.jpg', 'image/jpeg', 'public', 222194, '[]', '{\"uuid\":\"6d450cd5-b522-4b0a-8925-966afc4a6872\",\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 111, '2019-10-18 09:52:28', '2019-10-18 09:52:28'),
(114, 'App\\Models\\Upload', 44, 'image', 'soup-918422_1280', 'soup-918422_1280.jpg', 'image/jpeg', 'public', 157729, '[]', '{\"uuid\":\"b7163204-acbc-41a5-adfd-df6e8c0a8f59\",\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 112, '2019-10-18 09:53:46', '2019-10-18 09:53:46'),
(115, 'App\\Models\\Food', 12, 'image', 'soup-918422_1280', 'soup-918422_1280.jpg', 'image/jpeg', 'public', 157729, '[]', '{\"uuid\":\"b7163204-acbc-41a5-adfd-df6e8c0a8f59\",\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 113, '2019-10-18 09:54:32', '2019-10-18 09:54:32'),
(116, 'App\\Models\\Upload', 45, 'image', 'soup-1503117_1280', 'soup-1503117_1280.jpg', 'image/jpeg', 'public', 240711, '[]', '{\"uuid\":\"91232db0-e160-419c-aa6b-c7705a6283d5\",\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 114, '2019-10-18 09:56:51', '2019-10-18 09:56:51'),
(117, 'App\\Models\\Food', 13, 'image', 'soup-1503117_1280', 'soup-1503117_1280.jpg', 'image/jpeg', 'public', 240711, '[]', '{\"uuid\":\"91232db0-e160-419c-aa6b-c7705a6283d5\",\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 115, '2019-10-18 09:57:54', '2019-10-18 09:57:54'),
(118, 'App\\Models\\Upload', 46, 'image', 'hamburger-993526_1280', 'hamburger-993526_1280.jpg', 'image/jpeg', 'public', 234359, '[]', '{\"uuid\":\"76184023-5516-4847-81e7-28e0e2b5e590\",\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 116, '2019-10-18 09:59:07', '2019-10-18 09:59:08'),
(119, 'App\\Models\\Food', 14, 'image', 'hamburger-993526_1280', 'hamburger-993526_1280.jpg', 'image/jpeg', 'public', 234359, '[]', '{\"uuid\":\"76184023-5516-4847-81e7-28e0e2b5e590\",\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 117, '2019-10-18 10:01:09', '2019-10-18 10:01:09'),
(120, 'App\\Models\\Upload', 47, 'image', 'hamburger-1414423_1280', 'hamburger-1414423_1280.jpg', 'image/jpeg', 'public', 295610, '[]', '{\"uuid\":\"f1fb4002-bca7-488e-b3a4-7c67e635ef21\",\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 118, '2019-10-18 10:48:10', '2019-10-18 10:48:10'),
(121, 'App\\Models\\Food', 15, 'image', 'hamburger-1414423_1280', 'hamburger-1414423_1280.jpg', 'image/jpeg', 'public', 295610, '[]', '{\"uuid\":\"f1fb4002-bca7-488e-b3a4-7c67e635ef21\",\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 119, '2019-10-18 10:49:36', '2019-10-18 10:49:36'),
(122, 'App\\Models\\Upload', 48, 'image', 'salmon-518032_1280', 'salmon-518032_1280.jpg', 'image/jpeg', 'public', 227975, '[]', '{\"uuid\":\"8e032da7-a5b7-4f6c-a02a-9a0902f81224\",\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 120, '2019-10-18 10:50:15', '2019-10-18 10:50:15'),
(123, 'App\\Models\\Food', 16, 'image', 'salmon-518032_1280', 'salmon-518032_1280.jpg', 'image/jpeg', 'public', 227975, '[]', '{\"uuid\":\"8e032da7-a5b7-4f6c-a02a-9a0902f81224\",\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 121, '2019-10-18 10:51:51', '2019-10-18 10:51:51'),
(124, 'App\\Models\\Upload', 49, 'image', 'extra7', 'extra7.jpg', 'image/jpeg', 'public', 10574, '[]', '{\"uuid\":\"be0393c4-d89d-4742-9d7c-a175b838c624\",\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 122, '2019-10-18 10:53:09', '2019-10-18 10:53:09'),
(125, 'App\\Models\\Extra', 6, 'image', 'extra7', 'extra7.jpg', 'image/jpeg', 'public', 10574, '[]', '{\"uuid\":\"be0393c4-d89d-4742-9d7c-a175b838c624\",\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 123, '2019-10-18 10:53:34', '2019-10-18 10:53:34'),
(126, 'App\\Models\\Extra', 7, 'image', 'extra7', 'extra7.jpg', 'image/jpeg', 'public', 10574, '[]', '{\"uuid\":\"be0393c4-d89d-4742-9d7c-a175b838c624\",\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 124, '2019-10-18 10:54:11', '2019-10-18 10:54:11'),
(127, 'App\\Models\\Extra', 8, 'image', 'extra7', 'extra7.jpg', 'image/jpeg', 'public', 10574, '[]', '{\"uuid\":\"be0393c4-d89d-4742-9d7c-a175b838c624\",\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 125, '2019-10-18 10:54:37', '2019-10-18 10:54:37'),
(128, 'App\\Models\\Upload', 50, 'image', 'apple', 'apple.svg', 'image/svg+xml', 'public', 2206, '[]', '{\"uuid\":\"d3ee0634-cb13-4184-8fd6-c9ee2d943f3b\",\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 126, '2019-10-18 11:01:29', '2019-10-18 11:01:29'),
(130, 'App\\Models\\Upload', 51, 'image', 'hamburguer-1', 'hamburguer-1.svg', 'image/svg+xml', 'public', 4161, '[]', '{\"uuid\":\"9f3a2ba1-50be-44f5-b01f-d0f50bc39b43\",\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 128, '2019-10-18 11:25:51', '2019-10-18 11:25:52'),
(131, 'App\\Models\\Category', 2, 'image', 'hamburguer-1', 'hamburguer-1.svg', 'image/svg+xml', 'public', 4161, '[]', '{\"uuid\":\"9f3a2ba1-50be-44f5-b01f-d0f50bc39b43\",\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 129, '2019-10-18 11:25:54', '2019-10-18 11:25:54'),
(132, 'App\\Models\\Upload', 52, 'image', 'milk', 'milk.svg', 'image/svg+xml', 'public', 3190, '[]', '{\"uuid\":\"99ee10c4-81a5-479e-95b1-23e7c35c9b95\",\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 130, '2019-10-18 11:26:48', '2019-10-18 11:26:48'),
(133, 'App\\Models\\Category', 1, 'image', 'milk', 'milk.svg', 'image/svg+xml', 'public', 3190, '[]', '{\"uuid\":\"99ee10c4-81a5-479e-95b1-23e7c35c9b95\",\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 131, '2019-10-18 11:26:50', '2019-10-18 11:26:50'),
(134, 'App\\Models\\Upload', 53, 'image', 'raspberry', 'raspberry.svg', 'image/svg+xml', 'public', 4987, '[]', '{\"uuid\":\"a54b4a31-ebfb-4a90-a57a-0e74d5c5b25f\",\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 132, '2019-10-18 11:27:16', '2019-10-18 11:27:16'),
(135, 'App\\Models\\Category', 4, 'image', 'raspberry', 'raspberry.svg', 'image/svg+xml', 'public', 4987, '[]', '{\"uuid\":\"a54b4a31-ebfb-4a90-a57a-0e74d5c5b25f\",\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 133, '2019-10-18 11:27:17', '2019-10-18 11:27:17'),
(136, 'App\\Models\\Upload', 54, 'image', 'cupcake-1', 'cupcake-1.svg', 'image/svg+xml', 'public', 4170, '[]', '{\"uuid\":\"321342a0-5c0a-4960-a082-52d92185dc01\",\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 134, '2019-10-18 11:28:06', '2019-10-18 11:28:06'),
(137, 'App\\Models\\Category', 5, 'image', 'cupcake-1', 'cupcake-1.svg', 'image/svg+xml', 'public', 4170, '[]', '{\"uuid\":\"321342a0-5c0a-4960-a082-52d92185dc01\",\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 135, '2019-10-18 11:28:08', '2019-10-18 11:28:08'),
(138, 'App\\Models\\Upload', 55, 'image', 'food', 'food.svg', 'image/svg+xml', 'public', 3483, '[]', '{\"uuid\":\"b5a61bc0-5b19-4236-8be5-39320cb41f37\",\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 136, '2019-10-18 11:29:57', '2019-10-18 11:29:58'),
(139, 'App\\Models\\Category', 3, 'image', 'food', 'food.svg', 'image/svg+xml', 'public', 3483, '[]', '{\"uuid\":\"b5a61bc0-5b19-4236-8be5-39320cb41f37\",\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 137, '2019-10-18 11:29:59', '2019-10-18 11:29:59'),
(140, 'App\\Models\\Extra', 9, 'image', 'extra3', 'extra3.jpg', 'image/jpeg', 'public', 19323, '[]', '{\"uuid\":\"09f3a00a-d451-46d0-b200-f33fb09fcdf5\",\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 138, '2019-10-18 11:38:44', '2019-10-18 11:38:44'),
(141, 'App\\Models\\Extra', 10, 'image', 'extra3', 'extra3.jpg', 'image/jpeg', 'public', 19323, '[]', '{\"uuid\":\"09f3a00a-d451-46d0-b200-f33fb09fcdf5\",\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 139, '2019-10-18 11:39:15', '2019-10-18 11:39:15'),
(142, 'App\\Models\\Extra', 11, 'image', 'extra4', 'extra4.jpg', 'image/jpeg', 'public', 11839, '[]', '{\"uuid\":\"06a22ca5-b0d0-4037-84b8-de56544b5603\",\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 140, '2019-10-18 11:39:46', '2019-10-18 11:39:46'),
(151, 'App\\Models\\User', 22, 'avatar', 'user0', 'user0.jpg', 'image/jpeg', 'public', 27946, '[]', '{\"uuid\":\"f090bd7d-1e27-4832-8355-b9dd45c9e9ca\",\"custom_headers\":[],\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 141, '2019-12-16 21:01:21', '2019-12-16 21:01:21');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Truncate table before insert `migrations`
--

TRUNCATE TABLE `migrations`;
--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2018_05_26_175145_create_permission_tables', 1),
(4, '2018_06_12_140344_create_media_table', 1),
(5, '2018_06_13_035117_create_uploads_table', 1),
(6, '2018_07_17_180731_create_settings_table', 1),
(7, '2018_07_24_211308_create_custom_fields_table', 1),
(8, '2018_07_24_211327_create_custom_field_values_table', 1),
(9, '2019_08_29_213821_create_restaurants_table', 1),
(10, '2019_08_29_213825_create_categories_table', 1),
(11, '2019_08_29_213829_create_faq_categories_table', 1),
(12, '2019_08_29_213833_create_order_statuses_table', 1),
(13, '2019_08_29_213837_create_foods_table', 1),
(14, '2019_08_29_213842_create_galleries_table', 1),
(15, '2019_08_29_213847_create_food_reviews_table', 1),
(16, '2019_08_29_213903_create_nutrition_table', 1),
(17, '2019_08_29_213907_create_extras_table', 1),
(18, '2019_08_29_213921_create_payments_table', 1),
(19, '2019_08_29_213926_create_faqs_table', 1),
(20, '2019_08_29_213940_create_restaurant_reviews_table', 1),
(21, '2019_08_30_152927_create_favorites_table', 1),
(22, '2019_08_31_111104_create_orders_table', 1),
(23, '2019_09_04_102720_create_notification_types_table', 1),
(24, '2019_09_04_103039_create_notifications_table', 1),
(25, '2019_09_04_153857_create_carts_table', 1),
(26, '2019_09_04_153858_create_favorite_extras_table', 1),
(27, '2019_09_04_153859_create_cart_extras_table', 1),
(28, '2019_09_04_153958_create_food_orders_table', 1),
(29, '2019_09_04_154957_create_food_order_extras_table', 1),
(30, '2019_09_04_163857_create_user_restaurants_table', 1),
(31, '2019_09_27_085111_add_braintree_columns', 1),
(32, '2019_09_27_085111_add_strip_columns', 1),
(33, '2019_10_22_144652_create_currencies_table', 1),
(34, '2019_11_23_144038_update_payment_table', 1),
(35, '2019_11_28_171510_add_device_token_column', 1),
(36, '2019_12_06_135751_create_delivery_addresses_table', 1),
(37, '2019_12_06_172144_add_delivery_address_id_orders_table', 1),
(38, '2019_12_06_172737_add_delivery_address_id_carts_table', 1),
(39, '2019_12_14_133333_add_delivery_boy_role', 1),
(40, '2019_12_14_134302_create_driver_restaurants_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

DROP TABLE IF EXISTS `model_has_permissions`;
CREATE TABLE IF NOT EXISTS `model_has_permissions` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_type_model_id_index` (`model_type`,`model_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Truncate table before insert `model_has_permissions`
--

TRUNCATE TABLE `model_has_permissions`;
-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

DROP TABLE IF EXISTS `model_has_roles`;
CREATE TABLE IF NOT EXISTS `model_has_roles` (
  `role_id` int(10) UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_type_model_id_index` (`model_type`,`model_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Truncate table before insert `model_has_roles`
--

TRUNCATE TABLE `model_has_roles`;
--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(2, 'App\\Models\\User', 1),
(3, 'App\\Models\\User', 18),
(4, 'App\\Models\\User', 19),
(4, 'App\\Models\\User', 20),
(5, 'App\\Models\\User', 22);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
CREATE TABLE IF NOT EXISTS `notifications` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notification_type_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `read` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notifications_notification_type_id_foreign` (`notification_type_id`),
  KEY `notifications_user_id_foreign` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Truncate table before insert `notifications`
--

TRUNCATE TABLE `notifications`;
--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `title`, `notification_type_id`, `user_id`, `read`, `created_at`, `updated_at`) VALUES
(1, 'New Notification Form hola', 2, 1, 1, '2019-09-04 13:10:55', '2019-09-04 13:10:55'),
(2, 'Notification from hola', 1, 18, 0, '2019-10-09 12:45:59', '2019-10-09 12:45:59'),
(3, 'Your order #31 was received successfully', 1, 19, 0, '2019-12-15 18:10:13', '2019-12-15 18:10:13'),
(4, 'Your order #32 was received successfully', 1, 20, 0, '2019-12-15 18:18:52', '2019-12-15 18:18:52'),
(5, 'Your order #33 was received successfully', 1, 20, 0, '2019-12-15 18:19:47', '2019-12-15 18:19:47'),
(6, 'Your order #34 was received successfully', 1, 19, 0, '2019-12-15 18:55:29', '2019-12-15 18:55:29'),
(7, 'Your order #35 was received successfully', 1, 19, 0, '2019-12-15 19:11:54', '2019-12-15 19:11:54'),
(8, 'Your order #36 was received successfully', 1, 19, 0, '2019-12-15 19:12:02', '2019-12-15 19:12:02'),
(9, 'Your order #37 was received successfully', 1, 19, 0, '2019-12-15 19:12:07', '2019-12-15 19:12:07'),
(10, 'Your order #38 was received successfully', 1, 19, 0, '2019-12-15 19:15:55', '2019-12-15 19:15:55'),
(11, 'Your order #38 was Delivered', 1, 19, 0, '2019-12-16 21:03:14', '2019-12-16 21:03:14'),
(12, 'Your order #35 was Ready', 1, 19, 0, '2019-12-16 21:03:36', '2019-12-16 21:03:36'),
(13, 'Order #35 was assigned to you', 2, 22, 0, '2019-12-16 21:03:38', '2019-12-16 21:03:38'),
(14, 'Order #32 was assigned to you', 2, 22, 0, '2019-12-16 21:03:54', '2019-12-16 21:03:54');

-- --------------------------------------------------------

--
-- Table structure for table `notification_types`
--

DROP TABLE IF EXISTS `notification_types`;
CREATE TABLE IF NOT EXISTS `notification_types` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Truncate table before insert `notification_types`
--

TRUNCATE TABLE `notification_types`;
--
-- Dumping data for table `notification_types`
--

INSERT INTO `notification_types` (`id`, `type`, `created_at`, `updated_at`) VALUES
(1, 'Order Done', '2019-09-04 13:06:13', '2019-09-04 13:06:13'),
(2, 'Payment Done', '2019-09-04 13:06:35', '2019-09-04 13:06:35'),
(3, 'New Foods', '2019-09-04 13:07:10', '2019-09-04 13:07:10');

-- --------------------------------------------------------

--
-- Table structure for table `nutrition`
--

DROP TABLE IF EXISTS `nutrition`;
CREATE TABLE IF NOT EXISTS `nutrition` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(127) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `food_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `nutrition_food_id_foreign` (`food_id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Truncate table before insert `nutrition`
--

TRUNCATE TABLE `nutrition`;
--
-- Dumping data for table `nutrition`
--

INSERT INTO `nutrition` (`id`, `name`, `quantity`, `food_id`, `created_at`, `updated_at`) VALUES
(1, 'Sugar', 100, 1, '2019-08-31 09:55:28', '2019-08-31 09:55:28'),
(2, 'Proteins', 20, 2, '2019-10-09 12:26:28', '2019-10-09 12:26:28'),
(3, 'Lipide', 63, 3, '2019-10-17 22:10:54', '2019-10-17 22:11:31'),
(4, 'Proteins', 100, 3, '2019-10-17 22:11:06', '2019-10-17 22:11:06'),
(5, 'Sugar', 14, 3, '2019-10-17 22:11:17', '2019-10-17 22:11:17'),
(6, 'Sugar', 100, 2, '2019-08-31 09:55:28', '2019-08-31 09:55:28'),
(7, 'Proteins', 20, 5, '2019-10-09 12:26:28', '2019-10-09 12:26:28'),
(8, 'Lipide', 63, 5, '2019-10-17 22:10:54', '2019-10-17 22:11:31'),
(9, 'Proteins', 100, 5, '2019-10-17 22:11:06', '2019-10-17 22:11:06'),
(10, 'Sugar', 14, 9, '2019-10-17 22:11:17', '2019-10-17 22:11:17'),
(11, 'Sugar', 100, 7, '2019-08-31 09:55:28', '2019-08-31 09:55:28'),
(12, 'Proteins', 20, 14, '2019-10-09 12:26:28', '2019-10-09 12:26:28'),
(13, 'Lipide', 63, 16, '2019-10-17 22:10:54', '2019-10-17 22:11:31'),
(14, 'Proteins', 100, 7, '2019-10-17 22:11:06', '2019-10-17 22:11:06'),
(15, 'Sugar', 14, 13, '2019-10-17 22:11:17', '2019-10-17 22:11:17'),
(16, 'Sugar', 100, 13, '2019-08-31 09:55:28', '2019-08-31 09:55:28'),
(17, 'Proteins', 20, 9, '2019-10-09 12:26:28', '2019-10-09 12:26:28'),
(18, 'Lipide', 63, 12, '2019-10-17 22:10:54', '2019-10-17 22:11:31'),
(19, 'Proteins', 100, 6, '2019-10-17 22:11:06', '2019-10-17 22:11:06'),
(20, 'Sugar', 14, 3, '2019-10-17 22:11:17', '2019-10-17 22:11:17'),
(21, 'Sugar', 100, 2, '2019-08-31 09:55:28', '2019-08-31 09:55:28'),
(22, 'Proteins', 20, 12, '2019-10-09 12:26:28', '2019-10-09 12:26:28'),
(23, 'Lipide', 63, 10, '2019-10-17 22:10:54', '2019-10-17 22:11:31'),
(24, 'Proteins', 100, 10, '2019-10-17 22:11:06', '2019-10-17 22:11:06'),
(25, 'Sugar', 14, 6, '2019-10-17 22:11:17', '2019-10-17 22:11:17'),
(26, 'Sugar', 100, 3, '2019-08-31 09:55:28', '2019-08-31 09:55:28'),
(27, 'Proteins', 20, 3, '2019-10-09 12:26:28', '2019-10-09 12:26:28'),
(28, 'Lipide', 63, 4, '2019-10-17 22:10:54', '2019-10-17 22:11:31'),
(29, 'Proteins', 100, 12, '2019-10-17 22:11:06', '2019-10-17 22:11:06'),
(30, 'Sugar', 14, 8, '2019-10-17 22:11:17', '2019-10-17 22:11:17'),
(31, 'Sugar', 100, 9, '2019-08-31 09:55:28', '2019-08-31 09:55:28'),
(32, 'Proteins', 20, 13, '2019-10-09 12:26:28', '2019-10-09 12:26:28'),
(33, 'Lipide', 63, 9, '2019-10-17 22:10:54', '2019-10-17 22:11:31'),
(34, 'Proteins', 100, 16, '2019-10-17 22:11:06', '2019-10-17 22:11:06'),
(35, 'Sugar', 14, 5, '2019-10-17 22:11:17', '2019-10-17 22:11:17'),
(36, 'Sugar', 100, 11, '2019-08-31 09:55:28', '2019-08-31 09:55:28'),
(37, 'Proteins', 20, 15, '2019-10-09 12:26:28', '2019-10-09 12:26:28'),
(38, 'Lipide', 63, 10, '2019-10-17 22:10:54', '2019-10-17 22:11:31'),
(39, 'Proteins', 100, 5, '2019-10-17 22:11:06', '2019-10-17 22:11:06'),
(40, 'Sugar', 14, 16, '2019-10-17 22:11:17', '2019-10-17 22:11:17');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(10) UNSIGNED NOT NULL,
  `order_status_id` int(10) UNSIGNED NOT NULL,
  `tax` double(5,2) NOT NULL DEFAULT '0.00',
  `hint` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `payment_id` int(10) UNSIGNED DEFAULT NULL,
  `delivery_address_id` int(10) UNSIGNED DEFAULT NULL,
  `driver_id` int(10) UNSIGNED DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `orders_user_id_foreign` (`user_id`),
  KEY `orders_order_status_id_foreign` (`order_status_id`),
  KEY `orders_payment_id_foreign` (`payment_id`),
  KEY `orders_delivery_address_id_foreign` (`delivery_address_id`),
  KEY `orders_driver_id_foreign` (`driver_id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Truncate table before insert `orders`
--

TRUNCATE TABLE `orders`;
--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `order_status_id`, `tax`, `hint`, `created_at`, `updated_at`, `payment_id`, `delivery_address_id`, `driver_id`) VALUES
(31, 19, 1, 10.00, '', '2019-12-15 18:10:13', '2019-12-15 19:32:00', 11, NULL, 22),
(32, 20, 1, 10.00, '', '2019-12-15 18:18:52', '2019-12-16 21:03:52', 12, 3, 22),
(33, 20, 1, 10.00, '', '2019-12-15 18:19:47', '2019-12-15 18:19:47', 13, 3, NULL),
(34, 19, 1, 10.00, '', '2019-12-15 18:55:29', '2019-12-15 18:55:29', 14, 1, NULL),
(35, 19, 3, 10.00, '', '2019-12-15 19:11:54', '2019-12-16 21:03:34', 15, 1, 22),
(38, 19, 5, 10.00, '', '2019-12-15 19:15:55', '2019-12-16 21:03:12', 18, 1, 22);

-- --------------------------------------------------------

--
-- Table structure for table `order_statuses`
--

DROP TABLE IF EXISTS `order_statuses`;
CREATE TABLE IF NOT EXISTS `order_statuses` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `status` varchar(127) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Truncate table before insert `order_statuses`
--

TRUNCATE TABLE `order_statuses`;
--
-- Dumping data for table `order_statuses`
--

INSERT INTO `order_statuses` (`id`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Order Received', '2019-08-30 15:39:28', '2019-10-15 17:03:14'),
(2, 'Preparing', '2019-10-15 17:03:50', '2019-10-15 17:03:50'),
(3, 'Ready', '2019-10-15 17:04:30', '2019-10-15 17:04:30'),
(4, 'On the Way', '2019-10-15 17:04:13', '2019-10-15 17:04:13'),
(5, 'Delivered', '2019-10-15 17:04:30', '2019-10-15 17:04:30');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Truncate table before insert `password_resets`
--

TRUNCATE TABLE `password_resets`;
-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
CREATE TABLE IF NOT EXISTS `payments` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `price` double(8,2) NOT NULL DEFAULT '0.00',
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `method` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `payments_user_id_foreign` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Truncate table before insert `payments`
--

TRUNCATE TABLE `payments`;
--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `price`, `description`, `user_id`, `created_at`, `updated_at`, `status`, `method`) VALUES
(11, 39.60, 'Order not paid yet', 19, '2019-12-15 18:10:13', '2019-12-15 18:10:13', 'Waiting for Client', 'Cash on Delivery'),
(12, 6.82, 'Order not paid yet', 20, '2019-12-15 18:18:52', '2019-12-15 18:18:52', 'Waiting for Client', 'Pay on Pickup'),
(13, 20.24, 'Order not paid yet', 20, '2019-12-15 18:19:47', '2019-12-15 18:19:47', 'Waiting for Client', 'Cash on Delivery'),
(14, 20.90, 'Order not paid yet', 19, '2019-12-15 18:55:29', '2019-12-15 18:55:29', 'Waiting for Client', 'Cash on Delivery'),
(15, 16.50, 'Order not paid yet', 19, '2019-12-15 19:11:54', '2019-12-16 21:03:38', 'Not Paid', 'Cash on Delivery'),
(18, 27.50, 'Order not paid yet', 19, '2019-12-15 19:15:55', '2019-12-16 21:03:15', 'Paid', 'Cash on Delivery');

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
CREATE TABLE IF NOT EXISTS `permissions` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'web',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=427 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Truncate table before insert `permissions`
--

TRUNCATE TABLE `permissions`;
--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`, `deleted_at`) VALUES
(140, 'permissions.index', 'web', '2018-07-21 18:37:03', '2018-07-21 18:37:03', NULL),
(141, 'permissions.create', 'web', '2018-07-21 18:37:03', '2018-07-21 18:37:03', NULL),
(142, 'permissions.store', 'web', '2018-07-21 18:37:03', '2018-07-21 18:37:03', NULL),
(143, 'permissions.show', 'web', '2018-07-21 18:37:03', '2018-07-21 18:37:03', NULL),
(144, 'permissions.edit', 'web', '2018-07-21 18:37:03', '2018-07-21 18:37:03', NULL),
(145, 'permissions.update', 'web', '2018-07-21 18:37:03', '2018-07-21 18:37:03', NULL),
(146, 'permissions.destroy', 'web', '2018-07-21 18:37:03', '2018-07-21 18:37:03', NULL),
(147, 'roles.index', 'web', '2018-07-21 18:37:03', '2018-07-21 18:37:03', NULL),
(148, 'roles.create', 'web', '2018-07-21 18:37:03', '2018-07-21 18:37:03', NULL),
(149, 'roles.store', 'web', '2018-07-21 18:37:03', '2018-07-21 18:37:03', NULL),
(150, 'roles.show', 'web', '2018-07-21 18:37:04', '2018-07-21 18:37:04', NULL),
(151, 'roles.edit', 'web', '2018-07-21 18:37:04', '2018-07-21 18:37:04', NULL),
(152, 'roles.update', 'web', '2018-07-21 18:37:04', '2018-07-21 18:37:04', NULL),
(153, 'roles.destroy', 'web', '2018-07-21 18:37:04', '2018-07-21 18:37:04', NULL),
(154, 'users.index', 'web', '2018-07-21 18:37:04', '2018-07-21 18:37:04', NULL),
(155, 'users.create', 'web', '2018-07-21 18:37:04', '2018-07-21 18:37:04', NULL),
(156, 'users.store', 'web', '2018-07-21 18:37:04', '2018-07-21 18:37:04', NULL),
(157, 'users.show', 'web', '2018-07-21 18:37:04', '2018-07-21 18:37:04', NULL),
(158, 'users.edit', 'web', '2018-07-21 18:37:04', '2018-07-21 18:37:04', NULL),
(159, 'users.update', 'web', '2018-07-21 18:37:04', '2018-07-21 18:37:04', NULL),
(160, 'users.destroy', 'web', '2018-07-21 18:37:04', '2018-07-21 18:37:04', NULL),
(161, 'users.profile', 'web', '2018-07-21 18:53:20', '2018-07-21 18:53:20', NULL),
(162, 'medias.create', 'web', '2018-07-21 18:53:20', '2018-07-21 18:53:20', NULL),
(165, 'medias.delete', 'web', '2018-07-21 18:53:21', '2018-07-21 18:53:21', NULL),
(166, 'medias', 'web', '2018-07-21 18:53:21', '2018-07-21 18:53:21', NULL),
(167, 'medias.delete-all', 'web', '2018-07-21 18:53:21', '2018-07-21 18:53:21', NULL),
(168, 'dashboard', 'web', '2018-07-21 18:53:21', '2018-07-21 18:53:21', NULL),
(171, 'app-settings', 'web', '2018-07-21 18:53:21', '2018-07-21 18:53:21', NULL),
(172, 'customFields.index', 'web', '2018-07-24 18:14:03', '2018-07-24 18:14:03', NULL),
(173, 'customFields.create', 'web', '2018-07-24 18:14:03', '2018-07-24 18:14:03', NULL),
(174, 'customFields.store', 'web', '2018-07-24 18:14:03', '2018-07-24 18:14:03', NULL),
(175, 'customFields.show', 'web', '2018-07-24 18:14:03', '2018-07-24 18:14:03', NULL),
(176, 'customFields.edit', 'web', '2018-07-24 18:14:03', '2018-07-24 18:14:03', NULL),
(177, 'customFields.update', 'web', '2018-07-24 18:14:04', '2018-07-24 18:14:04', NULL),
(178, 'customFields.destroy', 'web', '2018-07-24 18:14:04', '2018-07-24 18:14:04', NULL),
(179, 'users.login-as-user', 'web', '2018-07-29 16:49:09', '2018-07-29 16:49:09', NULL),
(187, 'restaurants.index', 'web', '2019-08-27 18:14:44', '2019-08-27 18:14:44', NULL),
(188, 'restaurants.create', 'web', '2019-08-27 18:14:44', '2019-08-27 18:14:44', NULL),
(189, 'restaurants.store', 'web', '2019-08-27 18:14:44', '2019-08-27 18:14:44', NULL),
(190, 'restaurants.show', 'web', '2019-08-27 18:14:44', '2019-08-27 18:14:44', NULL),
(191, 'restaurants.edit', 'web', '2019-08-27 18:14:44', '2019-08-27 18:14:44', NULL),
(192, 'restaurants.update', 'web', '2019-08-27 18:14:44', '2019-08-27 18:14:44', NULL),
(193, 'restaurants.destroy', 'web', '2019-08-27 18:14:45', '2019-08-27 18:14:45', NULL),
(194, 'categories.index', 'web', '2019-08-29 21:53:32', '2019-08-29 21:53:32', NULL),
(195, 'categories.create', 'web', '2019-08-29 21:53:32', '2019-08-29 21:53:32', NULL),
(196, 'categories.store', 'web', '2019-08-29 21:53:33', '2019-08-29 21:53:33', NULL),
(197, 'categories.show', 'web', '2019-08-29 21:53:33', '2019-08-29 21:53:33', NULL),
(198, 'categories.edit', 'web', '2019-08-29 21:53:33', '2019-08-29 21:53:33', NULL),
(199, 'categories.update', 'web', '2019-08-29 21:53:33', '2019-08-29 21:53:33', NULL),
(200, 'categories.destroy', 'web', '2019-08-29 21:53:33', '2019-08-29 21:53:33', NULL),
(201, 'faq_categories.index', 'web', '2019-08-29 21:53:33', '2019-08-29 21:53:33', NULL),
(202, 'faq_categories.create', 'web', '2019-08-29 21:53:33', '2019-08-29 21:53:33', NULL),
(203, 'faq_categories.store', 'web', '2019-08-29 21:53:33', '2019-08-29 21:53:33', NULL),
(204, 'faq_categories.show', 'web', '2019-08-29 21:53:33', '2019-08-29 21:53:33', NULL),
(205, 'faq_categories.edit', 'web', '2019-08-29 21:53:34', '2019-08-29 21:53:34', NULL),
(206, 'faq_categories.update', 'web', '2019-08-29 21:53:34', '2019-08-29 21:53:34', NULL),
(207, 'faq_categories.destroy', 'web', '2019-08-29 21:53:34', '2019-08-29 21:53:34', NULL),
(208, 'order_statuses.index', 'web', '2019-08-29 21:53:34', '2019-08-29 21:53:34', NULL),
(209, 'order_statuses.create', 'web', '2019-08-29 21:53:34', '2019-08-29 21:53:34', NULL),
(210, 'order_statuses.store', 'web', '2019-08-29 21:53:34', '2019-08-29 21:53:34', NULL),
(211, 'order_statuses.show', 'web', '2019-08-29 21:53:34', '2019-08-29 21:53:34', NULL),
(212, 'order_statuses.edit', 'web', '2019-08-29 21:53:34', '2019-08-29 21:53:34', NULL),
(213, 'order_statuses.update', 'web', '2019-08-29 21:53:34', '2019-08-29 21:53:34', NULL),
(214, 'order_statuses.destroy', 'web', '2019-08-29 21:53:34', '2019-08-29 21:53:34', NULL),
(215, 'foods.index', 'web', '2019-08-29 21:53:34', '2019-08-29 21:53:34', NULL),
(216, 'foods.create', 'web', '2019-08-29 21:53:34', '2019-08-29 21:53:34', NULL),
(217, 'foods.store', 'web', '2019-08-29 21:53:34', '2019-08-29 21:53:34', NULL),
(218, 'foods.show', 'web', '2019-08-29 21:53:34', '2019-08-29 21:53:34', NULL),
(219, 'foods.edit', 'web', '2019-08-29 21:53:35', '2019-08-29 21:53:35', NULL),
(220, 'foods.update', 'web', '2019-08-29 21:53:35', '2019-08-29 21:53:35', NULL),
(221, 'foods.destroy', 'web', '2019-08-29 21:53:35', '2019-08-29 21:53:35', NULL),
(222, 'galleries.index', 'web', '2019-08-29 21:53:35', '2019-08-29 21:53:35', NULL),
(223, 'galleries.create', 'web', '2019-08-29 21:53:35', '2019-08-29 21:53:35', NULL),
(224, 'galleries.store', 'web', '2019-08-29 21:53:35', '2019-08-29 21:53:35', NULL),
(225, 'galleries.show', 'web', '2019-08-29 21:53:35', '2019-08-29 21:53:35', NULL),
(226, 'galleries.edit', 'web', '2019-08-29 21:53:35', '2019-08-29 21:53:35', NULL),
(227, 'galleries.update', 'web', '2019-08-29 21:53:35', '2019-08-29 21:53:35', NULL),
(228, 'galleries.destroy', 'web', '2019-08-29 21:53:35', '2019-08-29 21:53:35', NULL),
(229, 'food_reviews.index', 'web', '2019-08-29 21:53:35', '2019-08-29 21:53:35', NULL),
(230, 'food_reviews.create', 'web', '2019-08-29 21:53:35', '2019-08-29 21:53:35', NULL),
(231, 'food_reviews.store', 'web', '2019-08-29 21:53:35', '2019-08-29 21:53:35', NULL),
(232, 'food_reviews.show', 'web', '2019-08-29 21:53:36', '2019-08-29 21:53:36', NULL),
(233, 'food_reviews.edit', 'web', '2019-08-29 21:53:36', '2019-08-29 21:53:36', NULL),
(235, 'food_reviews.destroy', 'web', '2019-08-29 21:53:36', '2019-08-29 21:53:36', NULL),
(236, 'orders.index', 'web', '2019-08-29 21:53:36', '2019-08-29 21:53:36', NULL),
(237, 'orders.create', 'web', '2019-08-29 21:53:36', '2019-08-29 21:53:36', NULL),
(238, 'orders.store', 'web', '2019-08-29 21:53:36', '2019-08-29 21:53:36', NULL),
(239, 'orders.show', 'web', '2019-08-29 21:53:36', '2019-08-29 21:53:36', NULL),
(240, 'orders.edit', 'web', '2019-08-29 21:53:36', '2019-08-29 21:53:36', NULL),
(241, 'orders.update', 'web', '2019-08-29 21:53:36', '2019-08-29 21:53:36', NULL),
(242, 'orders.destroy', 'web', '2019-08-29 21:53:36', '2019-08-29 21:53:36', NULL),
(243, 'carts.index', 'web', '2019-08-29 21:53:36', '2019-08-29 21:53:36', NULL),
(244, 'carts.create', 'web', '2019-08-29 21:53:37', '2019-08-29 21:53:37', NULL),
(245, 'carts.store', 'web', '2019-08-29 21:53:37', '2019-08-29 21:53:37', NULL),
(246, 'carts.show', 'web', '2019-08-29 21:53:37', '2019-08-29 21:53:37', NULL),
(247, 'carts.edit', 'web', '2019-08-29 21:53:37', '2019-08-29 21:53:37', NULL),
(248, 'carts.update', 'web', '2019-08-29 21:53:37', '2019-08-29 21:53:37', NULL),
(249, 'carts.destroy', 'web', '2019-08-29 21:53:37', '2019-08-29 21:53:37', NULL),
(250, 'nutrition.index', 'web', '2019-08-29 21:53:37', '2019-08-29 21:53:37', NULL),
(251, 'nutrition.create', 'web', '2019-08-29 21:53:37', '2019-08-29 21:53:37', NULL),
(252, 'nutrition.store', 'web', '2019-08-29 21:53:37', '2019-08-29 21:53:37', NULL),
(253, 'nutrition.show', 'web', '2019-08-29 21:53:37', '2019-08-29 21:53:37', NULL),
(254, 'nutrition.edit', 'web', '2019-08-29 21:53:38', '2019-08-29 21:53:38', NULL),
(255, 'nutrition.update', 'web', '2019-08-29 21:53:38', '2019-08-29 21:53:38', NULL),
(256, 'nutrition.destroy', 'web', '2019-08-29 21:53:38', '2019-08-29 21:53:38', NULL),
(257, 'extras.index', 'web', '2019-08-29 21:53:38', '2019-08-29 21:53:38', NULL),
(258, 'extras.create', 'web', '2019-08-29 21:53:38', '2019-08-29 21:53:38', NULL),
(259, 'extras.store', 'web', '2019-08-29 21:53:38', '2019-08-29 21:53:38', NULL),
(260, 'extras.show', 'web', '2019-08-29 21:53:38', '2019-08-29 21:53:38', NULL),
(261, 'extras.edit', 'web', '2019-08-29 21:53:38', '2019-08-29 21:53:38', NULL),
(262, 'extras.update', 'web', '2019-08-29 21:53:38', '2019-08-29 21:53:38', NULL),
(263, 'extras.destroy', 'web', '2019-08-29 21:53:38', '2019-08-29 21:53:38', NULL),
(264, 'favorites.index', 'web', '2019-08-29 21:53:38', '2019-08-29 21:53:38', NULL),
(265, 'favorites.create', 'web', '2019-08-29 21:53:38', '2019-08-29 21:53:38', NULL),
(266, 'favorites.store', 'web', '2019-08-29 21:53:39', '2019-08-29 21:53:39', NULL),
(267, 'favorites.show', 'web', '2019-08-29 21:53:39', '2019-08-29 21:53:39', NULL),
(268, 'favorites.edit', 'web', '2019-08-29 21:53:39', '2019-08-29 21:53:39', NULL),
(269, 'favorites.update', 'web', '2019-08-29 21:53:39', '2019-08-29 21:53:39', NULL),
(270, 'favorites.destroy', 'web', '2019-08-29 21:53:39', '2019-08-29 21:53:39', NULL),
(271, 'notifications.index', 'web', '2019-08-29 21:53:39', '2019-08-29 21:53:39', NULL),
(272, 'notifications.create', 'web', '2019-08-29 21:53:39', '2019-08-29 21:53:39', NULL),
(273, 'notifications.store', 'web', '2019-08-29 21:53:39', '2019-08-29 21:53:39', NULL),
(274, 'notifications.show', 'web', '2019-08-29 21:53:39', '2019-08-29 21:53:39', NULL),
(275, 'notifications.edit', 'web', '2019-08-29 21:53:39', '2019-08-29 21:53:39', NULL),
(276, 'notifications.update', 'web', '2019-08-29 21:53:39', '2019-08-29 21:53:39', NULL),
(277, 'notifications.destroy', 'web', '2019-08-29 21:53:39', '2019-08-29 21:53:39', NULL),
(278, 'payments.index', 'web', '2019-08-29 21:53:40', '2019-08-29 21:53:40', NULL),
(279, 'payments.create', 'web', '2019-08-29 21:53:40', '2019-08-29 21:53:40', NULL),
(280, 'payments.store', 'web', '2019-08-29 21:53:40', '2019-08-29 21:53:40', NULL),
(281, 'payments.show', 'web', '2019-08-29 21:53:40', '2019-08-29 21:53:40', NULL),
(282, 'payments.edit', 'web', '2019-08-29 21:53:40', '2019-08-29 21:53:40', NULL),
(283, 'payments.update', 'web', '2019-08-29 21:53:40', '2019-08-29 21:53:40', NULL),
(284, 'payments.destroy', 'web', '2019-08-29 21:53:40', '2019-08-29 21:53:40', NULL),
(285, 'faqs.index', 'web', '2019-08-29 21:53:40', '2019-08-29 21:53:40', NULL),
(286, 'faqs.create', 'web', '2019-08-29 21:53:40', '2019-08-29 21:53:40', NULL),
(287, 'faqs.store', 'web', '2019-08-29 21:53:41', '2019-08-29 21:53:41', NULL),
(288, 'faqs.show', 'web', '2019-08-29 21:53:41', '2019-08-29 21:53:41', NULL),
(289, 'faqs.edit', 'web', '2019-08-29 21:53:41', '2019-08-29 21:53:41', NULL),
(290, 'faqs.update', 'web', '2019-08-29 21:53:41', '2019-08-29 21:53:41', NULL),
(291, 'faqs.destroy', 'web', '2019-08-29 21:53:41', '2019-08-29 21:53:41', NULL),
(306, 'restaurant_reviews.index', 'web', '2019-08-29 21:53:42', '2019-08-29 21:53:42', NULL),
(307, 'restaurant_reviews.create', 'web', '2019-08-29 21:53:42', '2019-08-29 21:53:42', NULL),
(308, 'restaurant_reviews.store', 'web', '2019-08-29 21:53:43', '2019-08-29 21:53:43', NULL),
(309, 'restaurant_reviews.show', 'web', '2019-08-29 21:53:43', '2019-08-29 21:53:43', NULL),
(310, 'restaurant_reviews.edit', 'web', '2019-08-29 21:53:43', '2019-08-29 21:53:43', NULL),
(311, 'restaurant_reviews.update', 'web', '2019-08-29 21:53:43', '2019-08-29 21:53:43', NULL),
(312, 'restaurant_reviews.destroy', 'web', '2019-08-29 21:53:43', '2019-08-29 21:53:43', NULL),
(334, 'faqCategories.index', 'web', '2019-08-29 21:53:46', '2019-08-29 21:53:46', NULL),
(335, 'faqCategories.create', 'web', '2019-08-29 21:53:46', '2019-08-29 21:53:46', NULL),
(336, 'faqCategories.store', 'web', '2019-08-29 21:53:46', '2019-08-29 21:53:46', NULL),
(337, 'faqCategories.show', 'web', '2019-08-29 21:53:46', '2019-08-29 21:53:46', NULL),
(338, 'faqCategories.edit', 'web', '2019-08-29 21:53:46', '2019-08-29 21:53:46', NULL),
(339, 'faqCategories.update', 'web', '2019-08-29 21:53:46', '2019-08-29 21:53:46', NULL),
(340, 'faqCategories.destroy', 'web', '2019-08-29 21:53:46', '2019-08-29 21:53:46', NULL),
(341, 'orderStatuses.index', 'web', '2019-08-29 21:53:46', '2019-08-29 21:53:46', NULL),
(342, 'orderStatuses.create', 'web', '2019-08-29 21:53:47', '2019-08-29 21:53:47', NULL),
(343, 'orderStatuses.store', 'web', '2019-08-29 21:53:47', '2019-08-29 21:53:47', NULL),
(344, 'orderStatuses.show', 'web', '2019-08-29 21:53:47', '2019-08-29 21:53:47', NULL),
(345, 'orderStatuses.edit', 'web', '2019-08-29 21:53:47', '2019-08-29 21:53:47', NULL),
(346, 'orderStatuses.update', 'web', '2019-08-29 21:53:47', '2019-08-29 21:53:47', NULL),
(347, 'orderStatuses.destroy', 'web', '2019-08-29 21:53:47', '2019-08-29 21:53:47', NULL),
(348, 'foodReviews.index', 'web', '2019-08-29 21:53:47', '2019-08-29 21:53:47', NULL),
(349, 'foodReviews.create', 'web', '2019-08-29 21:53:47', '2019-08-29 21:53:47', NULL),
(350, 'foodReviews.store', 'web', '2019-08-29 21:53:47', '2019-08-29 21:53:47', NULL),
(351, 'foodReviews.show', 'web', '2019-08-29 21:53:48', '2019-08-29 21:53:48', NULL),
(352, 'foodReviews.edit', 'web', '2019-08-29 21:53:48', '2019-08-29 21:53:48', NULL),
(353, 'foodReviews.update', 'web', '2019-08-29 21:53:48', '2019-08-29 21:53:48', NULL),
(354, 'foodReviews.destroy', 'web', '2019-08-29 21:53:48', '2019-08-29 21:53:48', NULL),
(369, 'restaurantReviews.index', 'web', '2019-08-29 21:53:49', '2019-08-29 21:53:49', NULL),
(370, 'restaurantReviews.create', 'web', '2019-08-29 21:53:50', '2019-08-29 21:53:50', NULL),
(371, 'restaurantReviews.store', 'web', '2019-08-29 21:53:50', '2019-08-29 21:53:50', NULL),
(372, 'restaurantReviews.show', 'web', '2019-08-29 21:53:50', '2019-08-29 21:53:50', NULL),
(373, 'restaurantReviews.edit', 'web', '2019-08-29 21:53:50', '2019-08-29 21:53:50', NULL),
(374, 'restaurantReviews.update', 'web', '2019-08-29 21:53:50', '2019-08-29 21:53:50', NULL),
(375, 'restaurantReviews.destroy', 'web', '2019-08-29 21:53:50', '2019-08-29 21:53:50', NULL),
(397, 'notification_types.index', 'web', '2019-09-04 10:41:50', '2019-09-04 10:41:50', NULL),
(398, 'notification_types.create', 'web', '2019-09-04 10:41:50', '2019-09-04 10:41:50', NULL),
(399, 'notification_types.store', 'web', '2019-09-04 10:41:50', '2019-09-04 10:41:50', NULL),
(400, 'notification_types.show', 'web', '2019-09-04 10:41:51', '2019-09-04 10:41:51', NULL),
(401, 'notification_types.edit', 'web', '2019-09-04 10:41:51', '2019-09-04 10:41:51', NULL),
(402, 'notification_types.update', 'web', '2019-09-04 10:41:51', '2019-09-04 10:41:51', NULL),
(403, 'notification_types.destroy', 'web', '2019-09-04 10:41:51', '2019-09-04 10:41:51', NULL),
(404, 'notificationTypes.index', 'web', '2019-09-04 10:41:51', '2019-09-04 10:41:51', NULL),
(405, 'notificationTypes.create', 'web', '2019-09-04 10:41:51', '2019-09-04 10:41:51', NULL),
(406, 'notificationTypes.store', 'web', '2019-09-04 10:41:52', '2019-09-04 10:41:52', NULL),
(407, 'notificationTypes.show', 'web', '2019-09-04 10:41:52', '2019-09-04 10:41:52', NULL),
(408, 'notificationTypes.edit', 'web', '2019-09-04 10:41:52', '2019-09-04 10:41:52', NULL),
(409, 'notificationTypes.update', 'web', '2019-09-04 10:41:52', '2019-09-04 10:41:52', NULL),
(410, 'notificationTypes.destroy', 'web', '2019-09-04 10:41:52', '2019-09-04 10:41:52', NULL),
(411, 'payments.byMonth', 'web', '2019-10-22 17:35:45', '2019-10-22 17:35:45', NULL),
(412, 'currencies.index', 'web', '2019-10-22 17:39:33', '2019-10-22 17:39:33', NULL),
(413, 'currencies.create', 'web', '2019-10-22 17:39:33', '2019-10-22 17:39:33', NULL),
(414, 'currencies.store', 'web', '2019-10-22 17:39:33', '2019-10-22 17:39:33', NULL),
(415, 'currencies.show', 'web', '2019-10-22 17:39:34', '2019-10-22 17:39:34', NULL),
(416, 'currencies.edit', 'web', '2019-10-22 17:39:35', '2019-10-22 17:39:35', NULL),
(417, 'currencies.update', 'web', '2019-10-22 17:39:37', '2019-10-22 17:39:37', NULL),
(418, 'currencies.destroy', 'web', '2019-10-22 17:39:37', '2019-10-22 17:39:37', NULL),
(419, 'deliveryAddresses.index', 'web', '2019-10-22 17:39:33', '2019-10-22 17:39:33', NULL),
(420, 'deliveryAddresses.create', 'web', '2019-10-22 17:39:33', '2019-10-22 17:39:33', NULL),
(421, 'deliveryAddresses.store', 'web', '2019-10-22 17:39:33', '2019-10-22 17:39:33', NULL),
(422, 'deliveryAddresses.show', 'web', '2019-10-22 17:39:34', '2019-10-22 17:39:34', NULL),
(423, 'deliveryAddresses.edit', 'web', '2019-10-22 17:39:35', '2019-10-22 17:39:35', NULL),
(424, 'deliveryAddresses.update', 'web', '2019-10-22 17:39:37', '2019-10-22 17:39:37', NULL),
(425, 'deliveryAddresses.destroy', 'web', '2019-10-22 17:39:37', '2019-10-22 17:39:37', NULL),
(426, 'food_reviews.update', 'web', '2019-12-15 18:08:49', '2019-12-15 18:08:49', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `restaurants`
--

DROP TABLE IF EXISTS `restaurants`;
CREATE TABLE IF NOT EXISTS `restaurants` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(127) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `latitude` varchar(24) COLLATE utf8mb4_unicode_ci NOT NULL,
  `longitude` varchar(24) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `information` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Truncate table before insert `restaurants`
--

TRUNCATE TABLE `restaurants`;
--
-- Dumping data for table `restaurants`
--

INSERT INTO `restaurants` (`id`, `name`, `description`, `address`, `latitude`, `longitude`, `phone`, `mobile`, `information`, `created_at`, `updated_at`) VALUES
(1, 'Home Cooking Experience', 'Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', '3515 Rosewood Lane Manhattan, NY 10016', '37.42796133580664', '-122.085749655962', '+136 226 5669', '+163 525 9432', '<p>Monday - Thursday 10:00AM - 11:00PM</p><p>Friday - Sunday 12:00PM - 5:00AM</p>', '2019-08-30 10:51:04', '2019-12-15 17:51:02'),
(2, 'The Lonesome Dove', 'Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum', '2911 Corpening Drive South Lyon, MI 48178', '37.42196133580664', '-122.086749655962', '+136 226 5669', '+163 525 9432', '<p>Monday - Thursday 10:00AM - 11:00PM</p><p>Friday - Sunday 12:00PM - 5:00AM</p>', '2019-08-30 11:15:09', '2019-12-15 17:50:48'),
(3, 'Golden Palace', 'Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', '2572 George Avenue Mobile, AL 36608', '37.4226133580664', '-122.086759655962', '+136 226 5669', '+163 525 9432', '<p>Monday - Thursday 10:00AM - 11:00PM</p><p>Friday - Sunday 12:00PM - 5:00AM<br></p>', '2019-08-30 11:17:02', '2019-12-15 17:51:08'),
(4, 'La Perla Restaurant', '<p>Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum<br></p>', '360 Jody Road Chester Heights, PA 19017', '37.42196233580664', '-122.086743655962', '+136 226 5669', '+163 525 9432', '<p>Monday - Thursday 10:00AM - 11:00PM</p><p>Friday - Sunday 12:00PM - 5:00AM</p>', '2019-10-09 15:12:20', '2019-12-15 17:50:55');

-- --------------------------------------------------------

--
-- Table structure for table `restaurant_reviews`
--

DROP TABLE IF EXISTS `restaurant_reviews`;
CREATE TABLE IF NOT EXISTS `restaurant_reviews` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `review` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `rate` tinyint(3) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `restaurant_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `restaurant_reviews_user_id_foreign` (`user_id`),
  KEY `restaurant_reviews_restaurant_id_foreign` (`restaurant_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Truncate table before insert `restaurant_reviews`
--

TRUNCATE TABLE `restaurant_reviews`;
--
-- Dumping data for table `restaurant_reviews`
--

INSERT INTO `restaurant_reviews` (`id`, `review`, `rate`, `user_id`, `restaurant_id`, `created_at`, `updated_at`) VALUES
(1, '<p>European colonization of the Americas brought about the introduction of a large number of new ingredients</p>', 2, 18, 2, '2019-08-30 10:56:09', '2019-10-16 18:43:48'),
(2, '<p>Americas brought about the introduction of a large number of new ingredients<br></p>', 5, 1, 1, '2019-08-30 10:56:52', '2019-08-30 10:56:52'),
(3, 'Quis ipsum suspendisse ultrices gravida dictum fusce. Tempus quam pellentesque nec nam aliquam sem. Cras fermentum odio eu feugiat pretium.', 3, 18, 2, '2019-08-31 21:53:52', '2019-10-16 18:44:39'),
(4, 'Platea dictumst quisque sagittis purus. Odio eu feugiat pretium nibh ipsum consequat nisl vel.', 4, 19, 3, '2019-10-16 18:44:15', '2019-10-16 18:44:15'),
(5, 'Elementum nibh tellus molestie nunc non blandit. Risus nec feugiat in fermentum.', 2, 20, 4, '2019-10-16 18:45:54', '2019-10-16 18:45:54');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'web',
  `default` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Truncate table before insert `roles`
--

TRUNCATE TABLE `roles`;
--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `default`, `created_at`, `updated_at`, `deleted_at`) VALUES
(2, 'admin', 'web', 0, '2018-07-21 15:37:56', '2019-09-07 21:42:01', NULL),
(3, 'manager', 'web', 0, '2019-09-07 21:41:38', '2019-09-07 21:41:38', NULL),
(4, 'client', 'web', 1, '2019-09-07 21:41:54', '2019-09-07 21:41:54', NULL),
(5, 'driver', 'web', 0, '2019-12-15 17:50:21', '2019-12-15 17:50:21', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

DROP TABLE IF EXISTS `role_has_permissions`;
CREATE TABLE IF NOT EXISTS `role_has_permissions` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Truncate table before insert `role_has_permissions`
--

TRUNCATE TABLE `role_has_permissions`;
--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(140, 2),
(141, 2),
(142, 2),
(143, 2),
(144, 2),
(145, 2),
(146, 2),
(147, 2),
(148, 2),
(149, 2),
(150, 2),
(151, 2),
(152, 2),
(153, 2),
(154, 2),
(155, 2),
(156, 2),
(157, 2),
(158, 2),
(159, 2),
(160, 2),
(161, 2),
(161, 3),
(161, 4),
(161, 5),
(162, 2),
(165, 2),
(165, 3),
(165, 4),
(165, 5),
(166, 2),
(166, 3),
(167, 2),
(167, 3),
(167, 4),
(167, 5),
(168, 2),
(171, 2),
(172, 2),
(173, 2),
(174, 2),
(175, 2),
(176, 2),
(177, 2),
(178, 2),
(179, 2),
(187, 2),
(187, 3),
(188, 2),
(188, 3),
(189, 2),
(189, 3),
(191, 2),
(191, 3),
(192, 2),
(192, 3),
(193, 2),
(193, 3),
(194, 2),
(195, 2),
(196, 2),
(198, 2),
(199, 2),
(200, 2),
(201, 2),
(202, 2),
(203, 2),
(205, 2),
(206, 2),
(207, 2),
(208, 2),
(208, 3),
(208, 5),
(215, 2),
(215, 3),
(215, 4),
(216, 2),
(216, 3),
(217, 2),
(217, 3),
(219, 2),
(219, 3),
(220, 2),
(220, 3),
(221, 2),
(221, 3),
(222, 2),
(222, 3),
(223, 2),
(223, 3),
(224, 2),
(224, 3),
(225, 2),
(226, 2),
(226, 3),
(227, 2),
(227, 3),
(228, 2),
(228, 3),
(229, 2),
(230, 2),
(231, 2),
(233, 2),
(235, 2),
(236, 2),
(236, 3),
(236, 4),
(236, 5),
(237, 2),
(238, 2),
(239, 2),
(239, 4),
(239, 5),
(240, 2),
(240, 3),
(241, 2),
(241, 3),
(242, 2),
(242, 3),
(243, 2),
(243, 3),
(243, 4),
(244, 2),
(245, 2),
(247, 2),
(248, 2),
(249, 2),
(250, 2),
(250, 3),
(251, 2),
(251, 3),
(252, 2),
(252, 3),
(254, 2),
(254, 3),
(255, 2),
(255, 3),
(256, 2),
(256, 3),
(257, 2),
(257, 3),
(258, 2),
(258, 3),
(259, 2),
(259, 3),
(261, 2),
(261, 3),
(262, 2),
(262, 3),
(263, 2),
(263, 3),
(264, 2),
(264, 3),
(264, 4),
(265, 2),
(266, 2),
(268, 2),
(269, 2),
(270, 2),
(270, 3),
(270, 4),
(271, 2),
(271, 3),
(271, 4),
(271, 5),
(272, 2),
(273, 2),
(275, 2),
(276, 2),
(277, 2),
(278, 2),
(278, 3),
(278, 4),
(278, 5),
(279, 2),
(280, 2),
(282, 2),
(283, 2),
(284, 2),
(285, 2),
(285, 3),
(285, 4),
(286, 2),
(287, 2),
(289, 2),
(290, 2),
(291, 2),
(306, 2),
(306, 3),
(306, 4),
(307, 2),
(308, 2),
(310, 2),
(311, 2),
(312, 2),
(334, 2),
(335, 2),
(336, 2),
(338, 2),
(339, 2),
(340, 2),
(341, 2),
(341, 3),
(341, 5),
(348, 2),
(348, 3),
(348, 4),
(349, 2),
(350, 2),
(351, 3),
(351, 4),
(352, 2),
(353, 2),
(354, 2),
(369, 2),
(369, 3),
(369, 4),
(370, 2),
(371, 2),
(372, 2),
(373, 2),
(374, 2),
(375, 2),
(397, 2),
(398, 2),
(399, 2),
(401, 2),
(402, 2),
(403, 2),
(404, 2),
(405, 2),
(406, 2),
(408, 2),
(409, 2),
(410, 2),
(411, 2),
(412, 2),
(412, 3),
(412, 5),
(413, 2),
(414, 2),
(415, 2),
(416, 2),
(417, 2),
(418, 2),
(419, 2),
(420, 2),
(421, 2),
(423, 2),
(424, 2),
(425, 2),
(426, 2);

-- --------------------------------------------------------

--
-- Table structure for table `uploads`
--

DROP TABLE IF EXISTS `uploads`;
CREATE TABLE IF NOT EXISTS `uploads` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Truncate table before insert `uploads`
--

TRUNCATE TABLE `uploads`;
--
-- Dumping data for table `uploads`
--

INSERT INTO `uploads` (`id`, `uuid`, `created_at`, `updated_at`) VALUES
(8, 'EAAdrdunmO4ABACSwq2flTWo19A18jMv2fUUR3euzHLXjlPz95SK3RRDxvnObL19RL59CPxaMyflX258bWYZCpbuwMyXxDMdTmzMzZA7WXZCE8ZBGXRJH1Rz87lMV5Mqfi7OMS7UIZCP0J2Txfuac2zjBrbTCc2T5XwKKqhsBoAQZDZD', '2018-08-14 14:08:36', '2018-08-14 14:08:36'),
(11, 'EAAdrdunmO4ABAAVKObZAi8zGWwmxjMUpUxfMyEC2gdjKKuqZA4SbeapUGcjKTRly9JZCki9oXDtYZC9W6mqdcO0XctKTSCzeCFSwsz8NiDv6sF4Bih31qrleTINZCE0CpOCLxVw0x5gW8sTjWk9tz0ID0AN2zDdfpbDrPw6QJiAZDZD', '2018-08-14 14:36:08', '2018-08-14 14:36:08'),
(12, 'EAAdrdunmO4ABALuBgdIeYZAuAtatPZBZAt3ZAmRBmZA3rUUcDoNHwdZAgPUks2YK46UvjrwPxTdpixLVvaeFDFzTRTdcLFKYlUDDYeqta2dyaS6oaD1zXX5IPmqNNDvw3cqm8E1YZCYv5KdK99y5j7riAgZCS3biXgye2ANWYjCsbAZDZD', '2018-08-14 14:37:04', '2018-08-14 14:37:04'),
(18, 'f090bd7d-1e27-4832-8355-b9dd45c9e9ca', '2019-08-27 14:58:03', '2019-08-27 14:58:03'),
(19, '020a2dd4-4277-425a-b450-426663f52633', '2019-08-27 14:59:08', '2019-08-27 14:59:08'),
(20, '26337c68-3ba4-489d-b417-42f5617fbe10', '2019-08-29 21:54:21', '2019-08-29 21:54:21'),
(21, 'd6d948be-fb90-43bc-840e-fb0e1af2d253', '2019-08-29 22:32:00', '2019-08-29 22:32:00'),
(22, '6131cae4-e0c1-495e-9c09-34ca3ce469f6', '2019-08-29 22:42:48', '2019-08-29 22:42:48'),
(23, 'f678c87b-5583-4a1c-bdec-4fbde1f3bdca', '2019-08-30 11:07:13', '2019-08-30 11:07:13'),
(24, '8e79b31c-1f20-4d30-abee-30627dd707ea', '2019-08-30 11:07:36', '2019-08-30 11:07:36'),
(25, '02a2bd26-5f72-4089-a87a-2d0c1cad4e35', '2019-08-30 11:41:19', '2019-08-30 11:41:19'),
(26, 'c0a791ea-33ed-4002-ac7d-267e08d740da', '2019-09-01 10:47:09', '2019-09-01 10:47:09'),
(27, '76a05190-0d7d-4b24-9100-ff78e0aa04dc', '2019-10-16 18:34:03', '2019-10-16 18:34:03'),
(28, '657d6464-130a-4805-aa97-d1b06f5809f5', '2019-10-16 18:35:31', '2019-10-16 18:35:31'),
(29, '0a6b49a6-154a-407e-a864-42c22dcf751b', '2019-10-16 18:36:56', '2019-10-16 18:36:56'),
(30, '05801bad-536b-47cc-85db-cbd391fd5eab', '2019-10-16 18:37:57', '2019-10-16 18:37:57'),
(31, '2dedc2c0-a47b-4bc6-a9dd-c36f41d8949b', '2019-10-16 18:49:08', '2019-10-16 18:49:08'),
(32, '09f3a00a-d451-46d0-b200-f33fb09fcdf5', '2019-10-16 18:49:39', '2019-10-16 18:49:39'),
(33, 'de3dbcd2-cbef-44ce-a63d-acdeba07f8db', '2019-10-16 18:50:11', '2019-10-16 18:50:11'),
(34, '06a22ca5-b0d0-4037-84b8-de56544b5603', '2019-10-16 18:50:34', '2019-10-16 18:50:34'),
(35, '793eed7b-c814-441c-9bed-05f325a3c40f', '2019-10-17 22:04:25', '2019-10-17 22:04:25'),
(36, 'a261347a-3dfa-4d4d-86e9-85bd442a2b50', '2019-10-18 09:09:45', '2019-10-18 09:09:45'),
(37, 'fe38c3e7-6d6f-4b53-94aa-b1ebe5970854', '2019-10-18 09:14:17', '2019-10-18 09:14:17'),
(38, '6b658af2-efff-40d0-ba94-58a545fcade7', '2019-10-18 09:15:35', '2019-10-18 09:15:35'),
(39, '9120de78-3d31-4934-9bdc-5199baee264d', '2019-10-18 09:19:19', '2019-10-18 09:19:19'),
(40, '86e07703-c20b-4986-a401-c03f82203264', '2019-10-18 09:35:16', '2019-10-18 09:35:16'),
(41, 'c4483eb7-f84b-4791-925c-e257bbb8cf18', '2019-10-18 09:46:58', '2019-10-18 09:46:58'),
(42, 'cd5f8506-d4b6-4dd8-908e-2e1a9f5e5ef9', '2019-10-18 09:48:30', '2019-10-18 09:48:30'),
(43, '6d450cd5-b522-4b0a-8925-966afc4a6872', '2019-10-18 09:51:04', '2019-10-18 09:51:04'),
(44, 'b7163204-acbc-41a5-adfd-df6e8c0a8f59', '2019-10-18 09:53:46', '2019-10-18 09:53:46'),
(45, '91232db0-e160-419c-aa6b-c7705a6283d5', '2019-10-18 09:56:51', '2019-10-18 09:56:51'),
(46, '76184023-5516-4847-81e7-28e0e2b5e590', '2019-10-18 09:59:07', '2019-10-18 09:59:07'),
(47, 'f1fb4002-bca7-488e-b3a4-7c67e635ef21', '2019-10-18 10:48:10', '2019-10-18 10:48:10'),
(48, '8e032da7-a5b7-4f6c-a02a-9a0902f81224', '2019-10-18 10:50:15', '2019-10-18 10:50:15'),
(49, 'be0393c4-d89d-4742-9d7c-a175b838c624', '2019-10-18 10:53:09', '2019-10-18 10:53:09'),
(50, 'd3ee0634-cb13-4184-8fd6-c9ee2d943f3b', '2019-10-18 11:01:29', '2019-10-18 11:01:29'),
(51, '9f3a2ba1-50be-44f5-b01f-d0f50bc39b43', '2019-10-18 11:25:51', '2019-10-18 11:25:51'),
(52, '99ee10c4-81a5-479e-95b1-23e7c35c9b95', '2019-10-18 11:26:48', '2019-10-18 11:26:48'),
(53, 'a54b4a31-ebfb-4a90-a57a-0e74d5c5b25f', '2019-10-18 11:27:16', '2019-10-18 11:27:16'),
(54, '321342a0-5c0a-4960-a082-52d92185dc01', '2019-10-18 11:28:06', '2019-10-18 11:28:06'),
(55, 'b5a61bc0-5b19-4236-8be5-39320cb41f37', '2019-10-18 11:29:57', '2019-10-18 11:29:57');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `api_token` char(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `braintree_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paypal_email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stripe_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_brand` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_last_four` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trial_ends_at` timestamp NULL DEFAULT NULL,
  `device_token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_api_token_unique` (`api_token`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Truncate table before insert `users`
--

TRUNCATE TABLE `users`;
--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `api_token`, `remember_token`, `created_at`, `updated_at`, `braintree_id`, `paypal_email`, `stripe_id`, `card_brand`, `card_last_four`, `trial_ends_at`, `device_token`) VALUES
(1, 'Michael E. Quinn', 'admin@demo.com', '$2y$10$YOn/Xq6vfvi9oaixrtW8QuM2W0mawkLLqIxL.IoGqrsqOqbIsfBNu', 'PivvPlsQWxPl1bB5KrbKNBuraJit0PrUZekQUgtLyTRuyBq921atFtoR1HuA', 'T4PQhFvBcAA7k02f7ejq4I7z7QKKnvxQLV0oqGnuS6Ktz6FdWULrWrzZ3oYn', '2018-08-06 21:58:41', '2019-09-27 06:49:45', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(18, 'Barbara J. Glanz', 'manager@demo.com', '$2y$10$YOn/Xq6vfvi9oaixrtW8QuM2W0mawkLLqIxL.IoGqrsqOqbIsfBNu', 'tVSfIKRSX2Yn8iAMoUS3HPls84ycS8NAxO2dj2HvePbbr4WHorp4gIFRmFwB', '5nysjzVKI4LU92bjRqMUSYdOaIo1EcPC3pIMb6Tcj2KXSUMriGrIQ1iwRdd0', '2018-08-14 16:06:28', '2019-09-25 21:09:35', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(19, 'Charles W. Abeyta', 'client@demo.com', '$2y$10$EBubVy3wDbqNbHvMQwkj3OTYVitL8QnHvh/zV0ICVOaSbALy5dD0K', 'fXLu7VeYgXDu82SkMxlLPG1mCAXc4EBIx6O5isgYVIKFQiHah0xiOHmzNsBv', 'V6PIUfd8JdHT2zkraTlnBcRSINZNjz5Ou7N0WtUGRyaTweoaXKpSfij6UhqC', '2019-10-12 21:31:26', '2019-12-15 19:28:47', NULL, NULL, NULL, NULL, NULL, NULL, 'dTMfmPxjyTE:APA91bFbCynDTcaQ-o8gvfkGQVB8oUKvUsLm6DUgSH1hcxmfvUangE3Zl24PX11wnDDvAxNhmz_A9tp60VeoH3TLXaN-x7N9ipgoGcMtW3rCwW2jkfv0RirbbhY3S4MUF7Ejq4ZlcpnO'),
(20, 'Robert E. Brock', 'client1@demo.com', '$2y$10$pmdnepS1FhZUMqOaFIFnNO0spltJpziz3j13UqyEwShmLhokmuoei', 'Czrsk9rwD0c75NUPkzNXM2WvbxYHKj8p0nG29pjKT0PZaTgMVzuVyv4hOlte', NULL, '2019-10-15 16:55:39', '2019-10-16 18:31:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(22, 'Robert E. Brock', 'driver@demo.com', '$2y$10$T/jwzYDJfC8c9CdD5PbpuOKvEXlpv4.RR1jMT0PgIMT.fzeGw67JO', 'OuMsmU903WMcMhzAbuSFtxBekZVdXz66afifRo3YRCINi38jkXJ8rpN0FcfS', NULL, '2019-12-15 17:49:44', '2019-12-16 21:01:21', NULL, NULL, NULL, NULL, NULL, NULL, 'eRN8OcCW_Zg:APA91bECHClevd8nrH4rf71DzhV7NQz-QzFBjZpdkZRqhTuYBbmcMi3puU5abCwa34Z2sr1HuJYMgglS_ZO7repodrQUrDICAitH3bjJ_uVy_3qEjtu_xajBHuzbt0Lg7THt-xY47t5d');

-- --------------------------------------------------------

--
-- Table structure for table `user_restaurants`
--

DROP TABLE IF EXISTS `user_restaurants`;
CREATE TABLE IF NOT EXISTS `user_restaurants` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `restaurant_id` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`user_id`,`restaurant_id`),
  KEY `user_restaurants_restaurant_id_foreign` (`restaurant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Truncate table before insert `user_restaurants`
--

TRUNCATE TABLE `user_restaurants`;
--
-- Dumping data for table `user_restaurants`
--

INSERT INTO `user_restaurants` (`user_id`, `restaurant_id`) VALUES
(1, 2),
(1, 3),
(1, 4),
(18, 1);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_delivery_address_id_foreign` FOREIGN KEY (`delivery_address_id`) REFERENCES `delivery_addresses` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `carts_food_id_foreign` FOREIGN KEY (`food_id`) REFERENCES `foods` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `carts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `cart_extras`
--
ALTER TABLE `cart_extras`
  ADD CONSTRAINT `cart_extras_cart_id_foreign` FOREIGN KEY (`cart_id`) REFERENCES `carts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cart_extras_extra_id_foreign` FOREIGN KEY (`extra_id`) REFERENCES `extras` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `custom_field_values`
--
ALTER TABLE `custom_field_values`
  ADD CONSTRAINT `custom_field_values_custom_field_id_foreign` FOREIGN KEY (`custom_field_id`) REFERENCES `custom_fields` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `delivery_addresses`
--
ALTER TABLE `delivery_addresses`
  ADD CONSTRAINT `delivery_addresses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `driver_restaurants`
--
ALTER TABLE `driver_restaurants`
  ADD CONSTRAINT `driver_restaurants_restaurant_id_foreign` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `driver_restaurants_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `extras`
--
ALTER TABLE `extras`
  ADD CONSTRAINT `extras_food_id_foreign` FOREIGN KEY (`food_id`) REFERENCES `foods` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `faqs`
--
ALTER TABLE `faqs`
  ADD CONSTRAINT `faqs_faq_category_id_foreign` FOREIGN KEY (`faq_category_id`) REFERENCES `faq_categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `favorites`
--
ALTER TABLE `favorites`
  ADD CONSTRAINT `favorites_food_id_foreign` FOREIGN KEY (`food_id`) REFERENCES `foods` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `favorites_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `favorite_extras`
--
ALTER TABLE `favorite_extras`
  ADD CONSTRAINT `favorite_extras_extra_id_foreign` FOREIGN KEY (`extra_id`) REFERENCES `extras` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `favorite_extras_favorite_id_foreign` FOREIGN KEY (`favorite_id`) REFERENCES `favorites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `foods`
--
ALTER TABLE `foods`
  ADD CONSTRAINT `foods_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `foods_restaurant_id_foreign` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `food_orders`
--
ALTER TABLE `food_orders`
  ADD CONSTRAINT `food_orders_food_id_foreign` FOREIGN KEY (`food_id`) REFERENCES `foods` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `food_orders_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `food_order_extras`
--
ALTER TABLE `food_order_extras`
  ADD CONSTRAINT `food_order_extras_extra_id_foreign` FOREIGN KEY (`extra_id`) REFERENCES `extras` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `food_order_extras_food_order_id_foreign` FOREIGN KEY (`food_order_id`) REFERENCES `food_orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `food_reviews`
--
ALTER TABLE `food_reviews`
  ADD CONSTRAINT `food_reviews_food_id_foreign` FOREIGN KEY (`food_id`) REFERENCES `foods` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `food_reviews_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `galleries`
--
ALTER TABLE `galleries`
  ADD CONSTRAINT `galleries_restaurant_id_foreign` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_notification_type_id_foreign` FOREIGN KEY (`notification_type_id`) REFERENCES `notification_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `notifications_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `nutrition`
--
ALTER TABLE `nutrition`
  ADD CONSTRAINT `nutrition_food_id_foreign` FOREIGN KEY (`food_id`) REFERENCES `foods` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_delivery_address_id_foreign` FOREIGN KEY (`delivery_address_id`) REFERENCES `delivery_addresses` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `orders_driver_id_foreign` FOREIGN KEY (`driver_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `orders_order_status_id_foreign` FOREIGN KEY (`order_status_id`) REFERENCES `order_statuses` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orders_payment_id_foreign` FOREIGN KEY (`payment_id`) REFERENCES `payments` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `restaurant_reviews`
--
ALTER TABLE `restaurant_reviews`
  ADD CONSTRAINT `restaurant_reviews_restaurant_id_foreign` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `restaurant_reviews_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_restaurants`
--
ALTER TABLE `user_restaurants`
  ADD CONSTRAINT `user_restaurants_restaurant_id_foreign` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_restaurants_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
SET FOREIGN_KEY_CHECKS=1;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
