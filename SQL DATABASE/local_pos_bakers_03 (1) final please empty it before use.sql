-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 11, 2022 at 01:26 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 7.4.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `local_pos_bakers_03`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_type_id` int(11) DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `is_closed` tinyint(1) NOT NULL DEFAULT 0,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `account_transactions`
--

CREATE TABLE `account_transactions` (
  `id` int(10) UNSIGNED NOT NULL,
  `account_id` int(11) NOT NULL,
  `type` enum('debit','credit') COLLATE utf8mb4_unicode_ci NOT NULL,
  `sub_type` enum('opening_balance','fund_transfer','deposit') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` decimal(22,4) NOT NULL,
  `reff_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `operation_date` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `transaction_id` int(11) DEFAULT NULL,
  `transaction_payment_id` int(11) DEFAULT NULL,
  `transfer_transaction_id` int(11) DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `account_types`
--

CREATE TABLE `account_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_account_type_id` int(11) DEFAULT NULL,
  `business_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `activity_log`
--

CREATE TABLE `activity_log` (
  `id` int(10) UNSIGNED NOT NULL,
  `log_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject_id` int(11) DEFAULT NULL,
  `subject_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `business_id` int(11) DEFAULT NULL,
  `causer_id` int(11) DEFAULT NULL,
  `causer_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `properties` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `activity_log`
--

INSERT INTO `activity_log` (`id`, `log_name`, `description`, `subject_id`, `subject_type`, `business_id`, `causer_id`, `causer_type`, `properties`, `created_at`, `updated_at`) VALUES
(1, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-04-07 08:25:46', '2022-04-07 08:25:46'),
(2, 'default', 'added', 0, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":2198}}', '2022-04-07 09:16:36', '2022-04-07 09:16:36'),
(3, 'default', 'edited', 0, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":2198},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":\"2198.0000\"}}', '2022-04-07 09:18:51', '2022-04-07 09:18:51'),
(4, 'default', 'added', 0, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":300}}', '2022-04-07 09:21:11', '2022-04-07 09:21:11'),
(5, 'default', 'edited', 0, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":300},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":\"300.0000\"}}', '2022-04-07 09:21:38', '2022-04-07 09:21:38'),
(6, 'default', 'added', 0, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":2264}}', '2022-04-07 09:22:53', '2022-04-07 09:22:53'),
(7, 'default', 'added', 0, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":3550}}', '2022-04-07 09:23:35', '2022-04-07 09:23:35'),
(8, 'default', 'edited', 0, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":3550},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":\"3550.0000\"}}', '2022-04-07 09:25:07', '2022-04-07 09:25:07'),
(9, 'default', 'edited', 0, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":2264},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":\"2264.0000\"}}', '2022-04-07 09:26:22', '2022-04-07 09:26:22'),
(10, 'default', 'added', 0, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":300}}', '2022-04-07 09:27:55', '2022-04-07 09:27:55'),
(11, 'default', 'added', 0, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"payment_status\":\"due\"}}', '2022-04-07 09:32:00', '2022-04-07 09:32:00'),
(12, 'default', 'logout', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-04-07 10:15:41', '2022-04-07 10:15:41'),
(13, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-04-07 10:16:49', '2022-04-07 10:16:49'),
(14, 'default', 'added', 0, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":1600}}', '2022-04-07 10:17:27', '2022-04-07 10:17:27'),
(15, 'default', 'added', 0, 'App\\Contact', 1, 1, 'App\\User', '[]', '2022-04-07 10:23:38', '2022-04-07 10:23:38'),
(16, 'default', 'added', 0, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":3500}}', '2022-04-07 10:23:57', '2022-04-07 10:23:57'),
(17, 'default', 'added', 0, 'App\\Contact', 1, 1, 'App\\User', '[]', '2022-04-07 10:30:12', '2022-04-07 10:30:12'),
(18, 'default', 'added', 0, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":149}}', '2022-04-07 10:30:18', '2022-04-07 10:30:18'),
(19, 'default', 'added', 0, 'App\\Contact', 1, 1, 'App\\User', '[]', '2022-04-07 10:31:01', '2022-04-07 10:31:01'),
(20, 'default', 'added', 0, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":199}}', '2022-04-07 10:31:06', '2022-04-07 10:31:06'),
(21, 'default', 'added', 0, 'App\\Contact', 1, 1, 'App\\User', '[]', '2022-04-07 10:34:56', '2022-04-07 10:34:56'),
(22, 'default', 'added', 0, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":1499}}', '2022-04-07 10:35:04', '2022-04-07 10:35:04'),
(23, 'default', 'added', 0, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":99}}', '2022-04-07 10:38:13', '2022-04-07 10:38:13'),
(24, 'default', 'added', 0, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":2000}}', '2022-04-07 10:41:59', '2022-04-07 10:41:59'),
(25, 'default', 'added', 0, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":20000}}', '2022-04-07 10:48:17', '2022-04-07 10:48:17'),
(26, 'default', 'added', 0, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":200}}', '2022-04-07 11:44:59', '2022-04-07 11:44:59'),
(27, 'default', 'added', 0, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":199}}', '2022-04-07 11:45:08', '2022-04-07 11:45:08'),
(28, 'default', 'added', 0, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":99}}', '2022-04-07 11:45:16', '2022-04-07 11:45:16'),
(29, 'default', 'added', 0, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":99}}', '2022-04-07 11:45:41', '2022-04-07 11:45:41'),
(30, 'default', 'added', 0, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":800}}', '2022-04-07 11:45:54', '2022-04-07 11:45:54'),
(31, 'default', 'added', 0, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":698}}', '2022-04-07 11:46:03', '2022-04-07 11:46:03'),
(32, 'default', 'added', 0, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":698}}', '2022-04-07 11:46:12', '2022-04-07 11:46:12'),
(33, 'default', 'added', 0, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":797}}', '2022-04-07 11:46:20', '2022-04-07 11:46:20'),
(34, 'default', 'added', 0, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":249}}', '2022-04-07 11:46:50', '2022-04-07 11:46:50'),
(35, 'default', 'added', 0, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":99}}', '2022-04-07 11:47:19', '2022-04-07 11:47:19'),
(36, 'default', 'added', 0, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":398}}', '2022-04-07 11:47:29', '2022-04-07 11:47:29'),
(37, 'default', 'added', 0, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":498}}', '2022-04-07 11:48:02', '2022-04-07 11:48:02'),
(38, 'default', 'added', 0, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":249}}', '2022-04-07 11:48:10', '2022-04-07 11:48:10'),
(39, 'default', 'added', 0, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":348}}', '2022-04-07 11:48:19', '2022-04-07 11:48:19'),
(40, 'default', 'added', 0, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":448}}', '2022-04-07 11:48:32', '2022-04-07 11:48:32'),
(41, 'default', 'added', 0, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":448}}', '2022-04-07 11:48:39', '2022-04-07 11:48:39'),
(42, 'default', 'added', 0, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":998}}', '2022-04-07 11:48:47', '2022-04-07 11:48:47'),
(43, 'default', 'added', 0, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":348}}', '2022-04-07 11:48:57', '2022-04-07 11:48:57'),
(44, 'default', 'added', 0, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":447}}', '2022-04-07 11:49:06', '2022-04-07 11:49:06'),
(45, 'default', 'added', 0, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":797}}', '2022-04-07 11:49:14', '2022-04-07 11:49:14'),
(46, 'default', 'added', 0, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":597}}', '2022-04-07 11:49:23', '2022-04-07 11:49:23'),
(47, 'default', 'added', 0, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":1997}}', '2022-04-07 11:49:31', '2022-04-07 11:49:31'),
(48, 'default', 'added', 0, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":1498}}', '2022-04-07 11:49:40', '2022-04-07 11:49:40'),
(49, 'default', 'added', 0, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":798}}', '2022-04-07 11:49:49', '2022-04-07 11:49:49'),
(50, 'default', 'added', 0, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":1297}}', '2022-04-07 11:49:58', '2022-04-07 11:49:58'),
(51, 'default', 'added', 0, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":1228}}', '2022-04-07 11:50:07', '2022-04-07 11:50:07'),
(52, 'default', 'added', 0, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":1997}}', '2022-04-07 11:50:14', '2022-04-07 11:50:14'),
(53, 'default', 'added', 0, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":3046}}', '2022-04-07 11:50:37', '2022-04-07 11:50:37'),
(54, 'default', 'added', 0, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":2047}}', '2022-04-07 11:50:45', '2022-04-07 11:50:45'),
(55, 'default', 'added', 0, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":1178}}', '2022-04-07 11:50:54', '2022-04-07 11:50:54'),
(56, 'default', 'added', 0, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":848}}', '2022-04-07 11:51:03', '2022-04-07 11:51:03'),
(57, 'default', 'added', 0, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":1298}}', '2022-04-07 11:51:14', '2022-04-07 11:51:14'),
(58, 'default', 'added', 0, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":978}}', '2022-04-07 11:51:26', '2022-04-07 11:51:26'),
(59, 'default', 'added', 0, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":1548}}', '2022-04-07 11:51:34', '2022-04-07 11:51:34'),
(60, 'default', 'added', 0, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":649}}', '2022-04-07 11:51:45', '2022-04-07 11:51:45'),
(61, 'default', 'added', 0, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":999}}', '2022-04-07 11:51:50', '2022-04-07 11:51:50'),
(62, 'default', 'added', 0, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":499}}', '2022-04-07 11:51:57', '2022-04-07 11:51:57'),
(63, 'default', 'added', 0, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":299}}', '2022-04-07 11:52:03', '2022-04-07 11:52:03'),
(64, 'default', 'added', 0, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":679}}', '2022-04-07 11:52:12', '2022-04-07 11:52:12'),
(65, 'default', 'added', 0, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":549}}', '2022-04-07 11:52:22', '2022-04-07 11:52:22'),
(66, 'default', 'added', 0, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":1498}}', '2022-04-07 11:52:29', '2022-04-07 11:52:29'),
(67, 'default', 'added', 0, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":948}}', '2022-04-07 11:52:36', '2022-04-07 11:52:36'),
(68, 'default', 'added', 0, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":299}}', '2022-04-07 11:52:43', '2022-04-07 11:52:43'),
(69, 'default', 'added', 0, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":728}}', '2022-04-07 11:52:53', '2022-04-07 11:52:53'),
(70, 'default', 'added', 0, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":679}}', '2022-04-07 11:53:11', '2022-04-07 11:53:11'),
(71, 'default', 'added', 0, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":5088}}', '2022-04-07 11:53:29', '2022-04-07 11:53:29'),
(72, 'default', 'added', 0, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":2194}}', '2022-04-07 11:53:41', '2022-04-07 11:53:41'),
(73, 'default', 'added', 0, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":1863}}', '2022-04-07 11:53:51', '2022-04-07 11:53:51'),
(74, 'default', 'added', 0, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":3341}}', '2022-04-07 11:54:06', '2022-04-07 11:54:06'),
(75, 'default', 'added', 0, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":3662}}', '2022-04-07 11:54:19', '2022-04-07 11:54:19'),
(76, 'default', 'added', 0, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":1295}}', '2022-04-07 11:54:38', '2022-04-07 11:54:38'),
(77, 'default', 'added', 0, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":6458}}', '2022-04-07 11:54:57', '2022-04-07 11:54:57'),
(78, 'default', 'added', 0, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":7777}}', '2022-04-07 11:56:00', '2022-04-07 11:56:00'),
(79, 'default', 'added', 0, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":798}}', '2022-04-07 11:56:08', '2022-04-07 11:56:08'),
(80, 'default', 'added', 0, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":4383}}', '2022-04-07 11:56:21', '2022-04-07 11:56:21'),
(81, 'default', 'added', 0, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":4759}}', '2022-04-07 11:56:40', '2022-04-07 11:56:40'),
(82, 'default', 'added', 0, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":3642}}', '2022-04-07 11:56:55', '2022-04-07 11:56:55'),
(83, 'default', 'login', 1, 'App\\User', 1, 1, 'App\\User', '[]', '2022-04-08 10:53:30', '2022-04-08 10:53:30'),
(84, 'default', 'added', 0, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":299}}', '2022-04-08 11:08:30', '2022-04-08 11:08:30'),
(86, 'default', 'sell_deleted', 0, 'App\\Transaction', 1, 1, 'App\\User', '{\"id\":\"CB-1-1-79\",\"invoice_no\":\"0071\",\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"299.0000\"}}', '2022-04-08 11:11:34', '2022-04-08 11:11:34'),
(87, 'default', 'added', 0, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":299}}', '2022-04-08 11:12:31', '2022-04-08 11:12:31'),
(88, 'default', 'added', 0, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":398}}', '2022-04-08 11:12:48', '2022-04-08 11:12:48'),
(89, 'default', 'added', 0, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":99}}', '2022-04-08 11:12:56', '2022-04-08 11:12:56'),
(90, 'default', 'sell_deleted', 0, 'App\\Transaction', 1, 1, 'App\\User', '{\"id\":\"CE-1-1-82\",\"invoice_no\":\"0074\",\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"99.0000\"}}', '2022-04-08 11:13:08', '2022-04-08 11:13:08'),
(91, 'default', 'sell_deleted', 0, 'App\\Transaction', 1, 1, 'App\\User', '{\"id\":\"CD-1-1-81\",\"invoice_no\":\"0073\",\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"398.0000\"}}', '2022-04-08 11:13:55', '2022-04-08 11:13:55'),
(92, 'default', 'sell_deleted', 0, 'App\\Transaction', 1, 1, 'App\\User', '{\"id\":\"BY-1-1-76\",\"invoice_no\":\"0068\",\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"4383.0000\"}}', '2022-04-08 11:23:44', '2022-04-08 11:23:44'),
(93, 'default', 'added', 0, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":7495}}', '2022-04-08 11:40:10', '2022-04-08 11:40:10'),
(94, 'default', 'added', 0, 'App\\Transaction', 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":1000}}', '2022-04-08 11:40:33', '2022-04-08 11:40:33');

-- --------------------------------------------------------

--
-- Table structure for table `barcodes`
--

CREATE TABLE `barcodes` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `width` double(22,4) DEFAULT NULL,
  `height` double(22,4) DEFAULT NULL,
  `paper_width` double(22,4) DEFAULT NULL,
  `paper_height` double(22,4) DEFAULT NULL,
  `top_margin` double(22,4) DEFAULT NULL,
  `left_margin` double(22,4) DEFAULT NULL,
  `row_distance` double(22,4) DEFAULT NULL,
  `col_distance` double(22,4) DEFAULT NULL,
  `stickers_in_one_row` int(11) DEFAULT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `is_continuous` tinyint(1) NOT NULL DEFAULT 0,
  `stickers_in_one_sheet` int(11) DEFAULT NULL,
  `business_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `barcodes`
--

INSERT INTO `barcodes` (`id`, `name`, `description`, `width`, `height`, `paper_width`, `paper_height`, `top_margin`, `left_margin`, `row_distance`, `col_distance`, `stickers_in_one_row`, `is_default`, `is_continuous`, `stickers_in_one_sheet`, `business_id`, `created_at`, `updated_at`) VALUES
(1, '20 Labels per Sheet', 'Sheet Size: 8.5\" x 11\", Label Size: 4\" x 1\", Labels per sheet: 20', 4.0000, 1.0000, 8.5000, 11.0000, 0.5000, 0.1250, 0.0000, 0.1875, 2, 0, 0, 20, NULL, '2017-12-17 20:13:44', '2017-12-17 20:13:44'),
(2, '30 Labels per sheet', 'Sheet Size: 8.5\" x 11\", Label Size: 2.625\" x 1\", Labels per sheet: 30', 2.6250, 1.0000, 8.5000, 11.0000, 0.5000, 0.1880, 0.0000, 0.1250, 3, 0, 0, 30, NULL, '2017-12-17 20:04:39', '2017-12-17 20:10:40'),
(3, '32 Labels per sheet', 'Sheet Size: 8.5\" x 11\", Label Size: 2\" x 1.25\", Labels per sheet: 32', 2.0000, 1.2500, 8.5000, 11.0000, 0.5000, 0.2500, 0.0000, 0.0000, 4, 0, 0, 32, NULL, '2017-12-17 19:55:40', '2017-12-17 19:55:40'),
(4, '40 Labels per sheet', 'Sheet Size: 8.5\" x 11\", Label Size: 2\" x 1\", Labels per sheet: 40', 2.0000, 1.0000, 8.5000, 11.0000, 0.5000, 0.2500, 0.0000, 0.0000, 4, 0, 0, 40, NULL, '2017-12-17 19:58:40', '2017-12-17 19:58:40'),
(5, '50 Labels per Sheet', 'Sheet Size: 8.5\" x 11\", Label Size: 1.5\" x 1\", Labels per sheet: 50', 1.5000, 1.0000, 8.5000, 11.0000, 0.5000, 0.5000, 0.0000, 0.0000, 5, 0, 0, 50, NULL, '2017-12-17 19:51:10', '2017-12-17 19:51:10'),
(6, 'Continuous Rolls - 31.75mm x 25.4mm', 'Label Size: 31.75mm x 25.4mm, Gap: 3.18mm', 1.2500, 1.0000, 1.2500, 0.0000, 0.1250, 0.0000, 0.1250, 0.0000, 1, 0, 1, NULL, NULL, '2017-12-17 19:51:10', '2017-12-17 19:51:10');

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `id` int(10) UNSIGNED NOT NULL,
  `contact_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `waiter_id` int(10) UNSIGNED DEFAULT NULL,
  `table_id` int(10) UNSIGNED DEFAULT NULL,
  `correspondent_id` int(11) DEFAULT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `location_id` int(10) UNSIGNED NOT NULL,
  `booking_start` datetime NOT NULL,
  `booking_end` datetime NOT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `booking_status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `booking_note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `business`
--

CREATE TABLE `business` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_id` int(10) UNSIGNED NOT NULL,
  `secret_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `tax_number_1` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_label_1` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_number_2` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_label_2` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code_label_1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code_1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code_label_2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code_2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `default_sales_tax` int(10) UNSIGNED DEFAULT NULL,
  `default_profit_percent` double(5,2) NOT NULL DEFAULT 0.00,
  `owner_id` int(10) UNSIGNED NOT NULL,
  `time_zone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Asia/Kolkata',
  `fy_start_month` tinyint(4) NOT NULL DEFAULT 1,
  `accounting_method` enum('fifo','lifo','avco') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'fifo',
  `default_sales_discount` decimal(5,2) DEFAULT NULL,
  `sell_price_tax` enum('includes','excludes') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'includes',
  `logo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sku_prefix` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `enable_product_expiry` tinyint(1) NOT NULL DEFAULT 0,
  `expiry_type` enum('add_expiry','add_manufacturing') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'add_expiry',
  `on_product_expiry` enum('keep_selling','stop_selling','auto_delete') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'keep_selling',
  `stop_selling_before` int(11) NOT NULL COMMENT 'Stop selling expied item n days before expiry',
  `enable_tooltip` tinyint(1) NOT NULL DEFAULT 1,
  `purchase_in_diff_currency` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Allow purchase to be in different currency then the business currency',
  `purchase_currency_id` int(10) UNSIGNED DEFAULT NULL,
  `p_exchange_rate` decimal(20,3) NOT NULL DEFAULT 1.000,
  `transaction_edit_days` int(10) UNSIGNED NOT NULL DEFAULT 30,
  `stock_expiry_alert_days` int(10) UNSIGNED NOT NULL DEFAULT 30,
  `keyboard_shortcuts` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pos_settings` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `weighing_scale_setting` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'used to store the configuration of weighing scale',
  `enable_brand` tinyint(1) NOT NULL DEFAULT 1,
  `enable_category` tinyint(1) NOT NULL DEFAULT 1,
  `enable_sub_category` tinyint(1) NOT NULL DEFAULT 1,
  `enable_price_tax` tinyint(1) NOT NULL DEFAULT 1,
  `enable_purchase_status` tinyint(1) DEFAULT 1,
  `enable_lot_number` tinyint(1) NOT NULL DEFAULT 0,
  `default_unit` int(11) DEFAULT NULL,
  `enable_sub_units` tinyint(1) NOT NULL DEFAULT 0,
  `enable_racks` tinyint(1) NOT NULL DEFAULT 0,
  `enable_row` tinyint(1) NOT NULL DEFAULT 0,
  `enable_position` tinyint(1) NOT NULL DEFAULT 0,
  `enable_editing_product_from_purchase` tinyint(1) NOT NULL DEFAULT 1,
  `sales_cmsn_agnt` enum('logged_in_user','user','cmsn_agnt') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `item_addition_method` tinyint(1) NOT NULL DEFAULT 1,
  `enable_inline_tax` tinyint(1) NOT NULL DEFAULT 1,
  `currency_symbol_placement` enum('before','after') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'before',
  `enabled_modules` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_format` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'm/d/Y',
  `time_format` enum('12','24') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '24',
  `ref_no_prefixes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `theme_color` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `enable_rp` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'rp is the short form of reward points',
  `rp_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'rp is the short form of reward points',
  `amount_for_unit_rp` decimal(22,4) NOT NULL DEFAULT 1.0000 COMMENT 'rp is the short form of reward points',
  `min_order_total_for_rp` decimal(22,4) NOT NULL DEFAULT 1.0000 COMMENT 'rp is the short form of reward points',
  `max_rp_per_order` int(11) DEFAULT NULL COMMENT 'rp is the short form of reward points',
  `redeem_amount_per_unit_rp` decimal(22,4) NOT NULL DEFAULT 1.0000 COMMENT 'rp is the short form of reward points',
  `min_order_total_for_redeem` decimal(22,4) NOT NULL DEFAULT 1.0000 COMMENT 'rp is the short form of reward points',
  `min_redeem_point` int(11) DEFAULT NULL COMMENT 'rp is the short form of reward points',
  `max_redeem_point` int(11) DEFAULT NULL COMMENT 'rp is the short form of reward points',
  `rp_expiry_period` int(11) DEFAULT NULL COMMENT 'rp is the short form of reward points',
  `rp_expiry_type` enum('month','year') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'year' COMMENT 'rp is the short form of reward points',
  `email_settings` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sms_settings` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_labels` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `common_settings` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `business`
--

INSERT INTO `business` (`id`, `name`, `currency_id`, `secret_key`, `start_date`, `tax_number_1`, `tax_label_1`, `tax_number_2`, `tax_label_2`, `code_label_1`, `code_1`, `code_label_2`, `code_2`, `default_sales_tax`, `default_profit_percent`, `owner_id`, `time_zone`, `fy_start_month`, `accounting_method`, `default_sales_discount`, `sell_price_tax`, `logo`, `sku_prefix`, `enable_product_expiry`, `expiry_type`, `on_product_expiry`, `stop_selling_before`, `enable_tooltip`, `purchase_in_diff_currency`, `purchase_currency_id`, `p_exchange_rate`, `transaction_edit_days`, `stock_expiry_alert_days`, `keyboard_shortcuts`, `pos_settings`, `weighing_scale_setting`, `enable_brand`, `enable_category`, `enable_sub_category`, `enable_price_tax`, `enable_purchase_status`, `enable_lot_number`, `default_unit`, `enable_sub_units`, `enable_racks`, `enable_row`, `enable_position`, `enable_editing_product_from_purchase`, `sales_cmsn_agnt`, `item_addition_method`, `enable_inline_tax`, `currency_symbol_placement`, `enabled_modules`, `date_format`, `time_format`, `ref_no_prefixes`, `theme_color`, `created_by`, `enable_rp`, `rp_name`, `amount_for_unit_rp`, `min_order_total_for_rp`, `max_rp_per_order`, `redeem_amount_per_unit_rp`, `min_order_total_for_redeem`, `min_redeem_point`, `max_redeem_point`, `rp_expiry_period`, `rp_expiry_type`, `email_settings`, `sms_settings`, `custom_labels`, `common_settings`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Khan Restaurant', 91, 'XLM-8211', '2022-04-07', NULL, 'GST', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 1, 'Asia/Karachi', 1, 'fifo', '0.00', 'includes', '1649314518_Zinger-Burger-with-Fries.jpg', NULL, 0, 'add_expiry', 'keep_selling', 0, 1, 0, NULL, '1.000', 30, 30, '{\"pos\":{\"express_checkout\":\"shift+e\",\"pay_n_ckeckout\":\"shift+p\",\"draft\":\"shift+d\",\"cancel\":\"shift+c\",\"recent_product_quantity\":\"f2\",\"weighing_scale\":null,\"edit_discount\":\"shift+i\",\"edit_order_tax\":\"shift+t\",\"add_payment_row\":\"shift+r\",\"finalize_payment\":\"shift+f\",\"add_new_product\":\"f4\"}}', '{\"amount_rounding_method\":null,\"cmmsn_calculation_type\":\"invoice_value\",\"razor_pay_key_id\":null,\"razor_pay_key_secret\":null,\"stripe_public_key\":null,\"stripe_secret_key\":null,\"enable_transaction_date\":\"1\",\"inline_service_staff\":\"1\",\"print_on_suspend\":\"1\",\"show_pricing_on_product_sugesstion\":\"1\",\"cash_denominations\":null,\"disable_pay_checkout\":0,\"disable_draft\":0,\"disable_express_checkout\":0,\"hide_product_suggestion\":0,\"hide_recent_trans\":0,\"disable_discount\":0,\"disable_order_tax\":0,\"is_pos_subtotal_editable\":0}', '{\"label_prefix\":null,\"product_sku_length\":\"4\",\"qty_length\":\"3\",\"qty_length_decimal\":\"2\"}', 1, 1, 1, 1, 1, 0, NULL, 1, 0, 0, 0, 1, NULL, 1, 0, 'before', '[\"purchases\",\"add_sale\",\"pos_sale\",\"stock_transfers\",\"stock_adjustment\",\"expenses\",\"tables\",\"modifiers\",\"service_staff\",\"types_of_service\"]', 'm/d/Y', '24', '{\"purchase\":\"PO\",\"purchase_return\":null,\"purchase_order\":null,\"stock_transfer\":\"ST\",\"stock_adjustment\":\"SA\",\"sell_return\":\"CN\",\"expense\":\"EP\",\"contacts\":\"CO\",\"purchase_payment\":\"PP\",\"sell_payment\":\"SP\",\"expense_payment\":null,\"business_location\":\"BL\",\"username\":null,\"subscription\":null,\"draft\":null,\"sales_order\":null}', NULL, NULL, 0, NULL, '1.0000', '1.0000', NULL, '1.0000', '1.0000', NULL, NULL, NULL, 'year', '{\"mail_driver\":\"smtp\",\"mail_host\":null,\"mail_port\":null,\"mail_username\":null,\"mail_password\":null,\"mail_encryption\":null,\"mail_from_address\":null,\"mail_from_name\":null}', '{\"sms_service\":\"other\",\"nexmo_key\":null,\"nexmo_secret\":null,\"nexmo_from\":null,\"twilio_sid\":null,\"twilio_token\":null,\"twilio_from\":null,\"url\":null,\"send_to_param_name\":\"to\",\"msg_param_name\":\"text\",\"request_method\":\"post\",\"header_1\":null,\"header_val_1\":null,\"header_2\":null,\"header_val_2\":null,\"header_3\":null,\"header_val_3\":null,\"param_1\":null,\"param_val_1\":null,\"param_2\":null,\"param_val_2\":null,\"param_3\":null,\"param_val_3\":null,\"param_4\":null,\"param_val_4\":null,\"param_5\":null,\"param_val_5\":null,\"param_6\":null,\"param_val_6\":null,\"param_7\":null,\"param_val_7\":null,\"param_8\":null,\"param_val_8\":null,\"param_9\":null,\"param_val_9\":null,\"param_10\":null,\"param_val_10\":null}', '{\"payments\":{\"custom_pay_1\":null,\"custom_pay_2\":null,\"custom_pay_3\":null,\"custom_pay_4\":null,\"custom_pay_5\":null,\"custom_pay_6\":null,\"custom_pay_7\":null},\"contact\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null,\"custom_field_5\":null,\"custom_field_6\":null,\"custom_field_7\":null,\"custom_field_8\":null,\"custom_field_9\":null,\"custom_field_10\":null},\"product\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null},\"location\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null},\"user\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null},\"purchase\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null},\"purchase_shipping\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null,\"custom_field_5\":null},\"sell\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null},\"shipping\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null,\"custom_field_5\":null},\"types_of_service\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null,\"custom_field_5\":null,\"custom_field_6\":null}}', '{\"default_credit_limit\":null,\"default_datatable_page_entries\":\"25\"}', 1, '2022-04-07 07:25:19', '2022-04-07 09:59:18');

-- --------------------------------------------------------

--
-- Table structure for table `business_locations`
--

CREATE TABLE `business_locations` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `location_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `secret_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `landmark` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `zip_code` char(7) COLLATE utf8mb4_unicode_ci NOT NULL,
  `invoice_scheme_id` int(10) UNSIGNED NOT NULL,
  `invoice_layout_id` int(10) UNSIGNED NOT NULL,
  `sale_invoice_layout_id` int(11) DEFAULT NULL,
  `selling_price_group_id` int(11) DEFAULT NULL,
  `print_receipt_on_invoice` tinyint(1) DEFAULT 1,
  `receipt_printer_type` enum('browser','printer') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'browser',
  `printer_id` int(11) DEFAULT NULL,
  `mobile` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alternate_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `website` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `featured_products` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `default_payment_accounts` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field3` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field4` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `business_locations`
--

INSERT INTO `business_locations` (`id`, `business_id`, `location_id`, `secret_key`, `name`, `landmark`, `country`, `state`, `city`, `zip_code`, `invoice_scheme_id`, `invoice_layout_id`, `sale_invoice_layout_id`, `selling_price_group_id`, `print_receipt_on_invoice`, `receipt_printer_type`, `printer_id`, `mobile`, `alternate_number`, `email`, `website`, `featured_products`, `is_active`, `default_payment_accounts`, `custom_field1`, `custom_field2`, `custom_field3`, `custom_field4`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'BL0001', 'XLM-8211', 'Mehmaan Khana', '200 c block tajpura scheme', 'Pakistan', 'Punjab', 'Lahore', '54000', 1, 1, 1, NULL, 1, 'browser', NULL, '0320142536', '02345679', NULL, NULL, NULL, 1, '{\"cash\":{\"is_enabled\":\"1\"},\"card\":{\"is_enabled\":\"1\"},\"cheque\":{\"is_enabled\":\"1\"},\"bank_transfer\":{\"is_enabled\":\"1\"},\"other\":{\"is_enabled\":\"1\"},\"custom_pay_1\":{\"is_enabled\":\"1\"},\"custom_pay_2\":{\"is_enabled\":\"1\"},\"custom_pay_3\":{\"is_enabled\":\"1\"},\"custom_pay_4\":{\"is_enabled\":\"1\"},\"custom_pay_5\":{\"is_enabled\":\"1\"},\"custom_pay_6\":{\"is_enabled\":\"1\"},\"custom_pay_7\":{\"is_enabled\":\"1\"}}', NULL, NULL, NULL, NULL, NULL, '2022-04-07 07:25:20', '2022-04-07 07:04:45');

-- --------------------------------------------------------

--
-- Table structure for table `cash_registers`
--

CREATE TABLE `cash_registers` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ai_id` int(11) NOT NULL,
  `sync_status` bit(1) DEFAULT b'0',
  `business_id` int(10) UNSIGNED NOT NULL,
  `location_id` int(11) DEFAULT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `status` enum('close','open') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `closed_at` datetime DEFAULT NULL,
  `closing_amount` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `total_card_slips` int(11) NOT NULL DEFAULT 0,
  `total_cheques` int(11) NOT NULL DEFAULT 0,
  `denominations` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `closing_note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cash_registers`
--

INSERT INTO `cash_registers` (`id`, `ai_id`, `sync_status`, `business_id`, `location_id`, `user_id`, `status`, `closed_at`, `closing_amount`, `total_card_slips`, `total_cheques`, `denominations`, `closing_note`, `created_at`, `updated_at`) VALUES
('A-1-1-0', 1, b'1', 1, 1, 1, 'close', '2022-04-07 13:27:46', '0.0000', 0, 0, NULL, NULL, '2022-04-07 08:26:00', '2022-04-07 08:27:46'),
('C-1-1-2', 2, b'1', 1, 1, 1, 'close', '2022-04-07 14:35:37', '5162.0000', 0, 0, NULL, NULL, '2022-04-07 08:29:00', '2022-04-07 09:35:37'),
('D-1-1-3', 3, b'1', 1, 1, 1, 'close', '2022-04-07 15:17:42', '1600.0000', 0, 0, NULL, NULL, '2022-04-07 10:17:00', '2022-04-07 10:17:42'),
('E-1-1-4', 4, b'1', 1, 1, 1, 'close', '2022-04-07 15:25:35', '0.0000', 0, 0, NULL, NULL, '2022-04-07 10:23:00', '2022-04-07 10:25:35'),
('F-1-1-5', 5, b'1', 1, 1, 1, 'close', '2022-04-07 15:31:17', '348.0000', 0, 0, NULL, NULL, '2022-04-07 10:29:00', '2022-04-07 10:31:17'),
('G-1-1-6', 6, b'1', 1, 1, 1, 'close', '2022-04-07 15:35:23', '1499.0000', 0, 0, NULL, NULL, '2022-04-07 10:33:00', '2022-04-07 10:35:23'),
('H-1-1-7', 7, b'1', 1, 1, 1, 'close', '2022-04-07 15:42:13', '2099.0000', 0, 0, NULL, NULL, '2022-04-07 10:37:00', '2022-04-07 10:42:13'),
('I-1-1-8', 8, b'1', 1, 1, 1, 'close', '2022-04-07 15:48:27', '20000.0000', 0, 0, NULL, NULL, '2022-04-07 10:47:00', '2022-04-07 10:48:27'),
('J-1-1-9', 9, b'1', 1, 1, 1, 'close', '2022-04-07 16:57:33', '82358.0000', 0, 0, NULL, NULL, '2022-04-07 10:49:00', '2022-04-07 11:57:33'),
('K-1-1-10', 10, b'1', 1, 1, 1, 'close', '2022-04-08 16:40:48', '8794.0000', 0, 0, NULL, NULL, '2022-04-08 11:07:00', '2022-04-08 11:40:48'),
('L-1-1-11', 11, b'0', 1, 1, 1, 'open', NULL, '0.0000', 0, 0, NULL, NULL, '2022-04-08 11:52:00', '2022-04-08 11:52:54');

-- --------------------------------------------------------

--
-- Table structure for table `cash_register_transactions`
--

CREATE TABLE `cash_register_transactions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ai_id` int(11) NOT NULL,
  `sync_status` bit(1) DEFAULT b'0',
  `cash_register_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `pay_method` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` enum('debit','credit') COLLATE utf8mb4_unicode_ci NOT NULL,
  `transaction_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cash_register_transactions`
--

INSERT INTO `cash_register_transactions` (`id`, `ai_id`, `sync_status`, `cash_register_id`, `amount`, `pay_method`, `type`, `transaction_type`, `transaction_id`, `created_at`, `updated_at`) VALUES
('A-1-1-0', 1, b'1', 'C-1-1-2', '802.0000', 'cash', 'debit', 'refund', 'H-1-1-7', '2022-04-07 09:18:51', '2022-04-07 09:18:51'),
('AA-1-1-26', 26, b'1', 'J-1-1-9', '498.0000', 'cash', 'credit', 'sell', 'AH-1-1-33', '2022-04-07 11:48:02', '2022-04-07 11:48:02'),
('AB-1-1-27', 27, b'1', 'J-1-1-9', '249.0000', 'cash', 'credit', 'sell', 'AI-1-1-34', '2022-04-07 11:48:10', '2022-04-07 11:48:10'),
('AC-1-1-28', 28, b'1', 'J-1-1-9', '348.0000', 'cash', 'credit', 'sell', 'AJ-1-1-35', '2022-04-07 11:48:19', '2022-04-07 11:48:19'),
('AD-1-1-29', 29, b'1', 'J-1-1-9', '448.0000', 'cash', 'credit', 'sell', 'AK-1-1-36', '2022-04-07 11:48:32', '2022-04-07 11:48:32'),
('AE-1-1-30', 30, b'1', 'J-1-1-9', '448.0000', 'cash', 'credit', 'sell', 'AL-1-1-37', '2022-04-07 11:48:39', '2022-04-07 11:48:39'),
('AF-1-1-31', 31, b'1', 'J-1-1-9', '998.0000', 'cash', 'credit', 'sell', 'AM-1-1-38', '2022-04-07 11:48:47', '2022-04-07 11:48:47'),
('AG-1-1-32', 32, b'1', 'J-1-1-9', '348.0000', 'cash', 'credit', 'sell', 'AN-1-1-39', '2022-04-07 11:48:57', '2022-04-07 11:48:57'),
('AH-1-1-33', 33, b'1', 'J-1-1-9', '447.0000', 'cash', 'credit', 'sell', 'AO-1-1-40', '2022-04-07 11:49:06', '2022-04-07 11:49:06'),
('AI-1-1-34', 34, b'1', 'J-1-1-9', '797.0000', 'cash', 'credit', 'sell', 'AP-1-1-41', '2022-04-07 11:49:14', '2022-04-07 11:49:14'),
('AJ-1-1-35', 35, b'1', 'J-1-1-9', '597.0000', 'cash', 'credit', 'sell', 'AQ-1-1-42', '2022-04-07 11:49:23', '2022-04-07 11:49:23'),
('AK-1-1-36', 36, b'1', 'J-1-1-9', '1997.0000', 'cash', 'credit', 'sell', 'AR-1-1-43', '2022-04-07 11:49:31', '2022-04-07 11:49:31'),
('AL-1-1-37', 37, b'1', 'J-1-1-9', '1498.0000', 'cash', 'credit', 'sell', 'AS-1-1-44', '2022-04-07 11:49:40', '2022-04-07 11:49:40'),
('AM-1-1-38', 38, b'1', 'J-1-1-9', '798.0000', 'cash', 'credit', 'sell', 'AT-1-1-45', '2022-04-07 11:49:49', '2022-04-07 11:49:49'),
('AN-1-1-39', 39, b'1', 'J-1-1-9', '1297.0000', 'cash', 'credit', 'sell', 'AU-1-1-46', '2022-04-07 11:49:58', '2022-04-07 11:49:58'),
('AO-1-1-40', 40, b'1', 'J-1-1-9', '1228.0000', 'cash', 'credit', 'sell', 'AV-1-1-47', '2022-04-07 11:50:07', '2022-04-07 11:50:07'),
('AP-1-1-41', 41, b'1', 'J-1-1-9', '1997.0000', 'cash', 'credit', 'sell', 'AW-1-1-48', '2022-04-07 11:50:14', '2022-04-07 11:50:14'),
('AQ-1-1-42', 42, b'1', 'J-1-1-9', '3046.0000', 'cash', 'credit', 'sell', 'AX-1-1-49', '2022-04-07 11:50:37', '2022-04-07 11:50:37'),
('AR-1-1-43', 43, b'1', 'J-1-1-9', '2047.0000', 'cash', 'credit', 'sell', 'AY-1-1-50', '2022-04-07 11:50:45', '2022-04-07 11:50:45'),
('AS-1-1-44', 44, b'1', 'J-1-1-9', '1178.0000', 'cash', 'credit', 'sell', 'AZ-1-1-51', '2022-04-07 11:50:54', '2022-04-07 11:50:54'),
('AT-1-1-45', 45, b'1', 'J-1-1-9', '848.0000', 'cash', 'credit', 'sell', 'BA-1-1-52', '2022-04-07 11:51:03', '2022-04-07 11:51:03'),
('AU-1-1-46', 46, b'1', 'J-1-1-9', '1298.0000', 'cash', 'credit', 'sell', 'BB-1-1-53', '2022-04-07 11:51:14', '2022-04-07 11:51:14'),
('AV-1-1-47', 47, b'1', 'J-1-1-9', '978.0000', 'cash', 'credit', 'sell', 'BC-1-1-54', '2022-04-07 11:51:26', '2022-04-07 11:51:26'),
('AW-1-1-48', 48, b'1', 'J-1-1-9', '1548.0000', 'cash', 'credit', 'sell', 'BD-1-1-55', '2022-04-07 11:51:34', '2022-04-07 11:51:34'),
('AX-1-1-49', 49, b'1', 'J-1-1-9', '649.0000', 'cash', 'credit', 'sell', 'BE-1-1-56', '2022-04-07 11:51:45', '2022-04-07 11:51:45'),
('AY-1-1-50', 50, b'1', 'J-1-1-9', '999.0000', 'cash', 'credit', 'sell', 'BF-1-1-57', '2022-04-07 11:51:50', '2022-04-07 11:51:50'),
('AZ-1-1-51', 51, b'1', 'J-1-1-9', '499.0000', 'cash', 'credit', 'sell', 'BG-1-1-58', '2022-04-07 11:51:57', '2022-04-07 11:51:57'),
('BA-1-1-52', 52, b'1', 'J-1-1-9', '299.0000', 'cash', 'credit', 'sell', 'BH-1-1-59', '2022-04-07 11:52:03', '2022-04-07 11:52:03'),
('BB-1-1-53', 53, b'1', 'J-1-1-9', '679.0000', 'cash', 'credit', 'sell', 'BI-1-1-60', '2022-04-07 11:52:12', '2022-04-07 11:52:12'),
('BC-1-1-54', 54, b'1', 'J-1-1-9', '549.0000', 'cash', 'credit', 'sell', 'BJ-1-1-61', '2022-04-07 11:52:22', '2022-04-07 11:52:22'),
('BD-1-1-55', 55, b'1', 'J-1-1-9', '1498.0000', 'cash', 'credit', 'sell', 'BK-1-1-62', '2022-04-07 11:52:29', '2022-04-07 11:52:29'),
('BE-1-1-56', 56, b'1', 'J-1-1-9', '948.0000', 'cash', 'credit', 'sell', 'BL-1-1-63', '2022-04-07 11:52:36', '2022-04-07 11:52:36'),
('BF-1-1-57', 57, b'1', 'J-1-1-9', '299.0000', 'cash', 'credit', 'sell', 'BM-1-1-64', '2022-04-07 11:52:43', '2022-04-07 11:52:43'),
('BG-1-1-58', 58, b'1', 'J-1-1-9', '728.0000', 'cash', 'credit', 'sell', 'BN-1-1-65', '2022-04-07 11:52:53', '2022-04-07 11:52:53'),
('BH-1-1-59', 59, b'1', 'J-1-1-9', '679.0000', 'cash', 'credit', 'sell', 'BO-1-1-66', '2022-04-07 11:53:11', '2022-04-07 11:53:11'),
('BI-1-1-60', 60, b'1', 'J-1-1-9', '5088.0000', 'cash', 'credit', 'sell', 'BP-1-1-67', '2022-04-07 11:53:29', '2022-04-07 11:53:29'),
('BJ-1-1-61', 61, b'1', 'J-1-1-9', '2194.0000', 'cash', 'credit', 'sell', 'BQ-1-1-68', '2022-04-07 11:53:41', '2022-04-07 11:53:41'),
('BK-1-1-62', 62, b'1', 'J-1-1-9', '1863.0000', 'cash', 'credit', 'sell', 'BR-1-1-69', '2022-04-07 11:53:51', '2022-04-07 11:53:51'),
('BL-1-1-63', 63, b'1', 'J-1-1-9', '3341.0000', 'cash', 'credit', 'sell', 'BS-1-1-70', '2022-04-07 11:54:06', '2022-04-07 11:54:06'),
('BM-1-1-64', 64, b'1', 'J-1-1-9', '3662.0000', 'cash', 'credit', 'sell', 'BT-1-1-71', '2022-04-07 11:54:19', '2022-04-07 11:54:19'),
('BN-1-1-65', 65, b'1', 'J-1-1-9', '1295.0000', 'cash', 'credit', 'sell', 'BU-1-1-72', '2022-04-07 11:54:38', '2022-04-07 11:54:38'),
('BO-1-1-66', 66, b'1', 'J-1-1-9', '6458.0000', 'cash', 'credit', 'sell', 'BV-1-1-73', '2022-04-07 11:54:57', '2022-04-07 11:54:57'),
('BP-1-1-67', 67, b'1', 'J-1-1-9', '7777.0000', 'cash', 'credit', 'sell', 'BW-1-1-74', '2022-04-07 11:55:59', '2022-04-07 11:55:59'),
('BQ-1-1-68', 68, b'1', 'J-1-1-9', '798.0000', 'cash', 'credit', 'sell', 'BX-1-1-75', '2022-04-07 11:56:08', '2022-04-07 11:56:08'),
('BS-1-1-70', 70, b'1', 'J-1-1-9', '4759.0000', 'cash', 'credit', 'sell', 'BZ-1-1-77', '2022-04-07 11:56:40', '2022-04-07 11:56:40'),
('BT-1-1-71', 71, b'1', 'J-1-1-9', '3642.0000', 'cash', 'credit', 'sell', 'CA-1-1-78', '2022-04-07 11:56:55', '2022-04-07 11:56:55'),
('BU-1-1-72', 73, b'1', 'K-1-1-10', '299.0000', 'cash', 'credit', 'sell', 'CB-1-1-79', '2022-04-08 11:12:31', '2022-04-08 11:12:31'),
('BW-1-1-74', 76, b'1', 'K-1-1-10', '7495.0000', 'cash', 'credit', 'sell', 'CD-1-1-81', '2022-04-08 11:40:10', '2022-04-08 11:40:10'),
('BZ-1-1-77', 77, b'1', 'K-1-1-10', '1000.0000', 'cash', 'credit', 'sell', 'CG-1-1-84', '2022-04-08 11:40:33', '2022-04-08 11:40:33'),
('C-1-1-2', 2, b'1', 'C-1-1-2', '3000.0000', 'other', 'credit', 'sell', 'H-1-1-7', '2022-04-07 09:18:51', '2022-04-07 09:18:51'),
('D-1-1-3', 3, b'1', 'C-1-1-2', '300.0000', 'cash', 'credit', 'sell', 'I-1-1-8', '2022-04-07 09:21:38', '2022-04-07 09:21:38'),
('E-1-1-4', 4, b'1', 'C-1-1-2', '3550.0000', 'cash', 'credit', 'sell', 'K-1-1-10', '2022-04-07 09:25:07', '2022-04-07 09:25:07'),
('F-1-1-5', 5, b'1', 'C-1-1-2', '2264.0000', 'cash', 'credit', 'sell', 'J-1-1-9', '2022-04-07 09:26:22', '2022-04-07 09:26:22'),
('G-1-1-6', 6, b'1', 'C-1-1-2', '300.0000', 'cash', 'credit', 'sell', 'L-1-1-11', '2022-04-07 09:27:55', '2022-04-07 09:27:55'),
('H-1-1-7', 7, b'1', 'C-1-1-2', '450.0000', 'cash', 'debit', 'expense', 'M-1-1-12', '2022-04-07 09:32:00', '2022-04-07 09:32:00'),
('I-1-1-8', 8, b'1', 'D-1-1-3', '1600.0000', 'cash', 'credit', 'sell', 'N-1-1-13', '2022-04-07 10:17:27', '2022-04-07 10:17:27'),
('J-1-1-9', 9, b'1', 'F-1-1-5', '149.0000', 'cash', 'credit', 'sell', 'Q-1-1-16', '2022-04-07 10:30:18', '2022-04-07 10:30:18'),
('K-1-1-10', 10, b'1', 'F-1-1-5', '199.0000', 'cash', 'credit', 'sell', 'R-1-1-17', '2022-04-07 10:31:06', '2022-04-07 10:31:06'),
('L-1-1-11', 11, b'1', 'G-1-1-6', '1499.0000', 'cash', 'credit', 'sell', 'S-1-1-18', '2022-04-07 10:35:04', '2022-04-07 10:35:04'),
('M-1-1-12', 12, b'1', 'H-1-1-7', '99.0000', 'cash', 'credit', 'sell', 'T-1-1-19', '2022-04-07 10:38:13', '2022-04-07 10:38:13'),
('N-1-1-13', 13, b'1', 'H-1-1-7', '2000.0000', 'cash', 'credit', 'sell', 'U-1-1-20', '2022-04-07 10:41:59', '2022-04-07 10:41:59'),
('O-1-1-14', 14, b'1', 'I-1-1-8', '20000.0000', 'cash', 'credit', 'sell', 'V-1-1-21', '2022-04-07 10:48:17', '2022-04-07 10:48:17'),
('P-1-1-15', 15, b'1', 'J-1-1-9', '200.0000', 'cash', 'credit', 'sell', 'W-1-1-22', '2022-04-07 11:44:59', '2022-04-07 11:44:59'),
('Q-1-1-16', 16, b'1', 'J-1-1-9', '199.0000', 'cash', 'credit', 'sell', 'X-1-1-23', '2022-04-07 11:45:08', '2022-04-07 11:45:08'),
('R-1-1-17', 17, b'1', 'J-1-1-9', '99.0000', 'cash', 'credit', 'sell', 'Y-1-1-24', '2022-04-07 11:45:16', '2022-04-07 11:45:16'),
('S-1-1-18', 18, b'1', 'J-1-1-9', '99.0000', 'cash', 'credit', 'sell', 'Z-1-1-25', '2022-04-07 11:45:41', '2022-04-07 11:45:41'),
('T-1-1-19', 19, b'1', 'J-1-1-9', '800.0000', 'cash', 'credit', 'sell', 'AA-1-1-26', '2022-04-07 11:45:54', '2022-04-07 11:45:54'),
('U-1-1-20', 20, b'1', 'J-1-1-9', '698.0000', 'cash', 'credit', 'sell', 'AB-1-1-27', '2022-04-07 11:46:03', '2022-04-07 11:46:03'),
('V-1-1-21', 21, b'1', 'J-1-1-9', '698.0000', 'cash', 'credit', 'sell', 'AC-1-1-28', '2022-04-07 11:46:12', '2022-04-07 11:46:12'),
('W-1-1-22', 22, b'1', 'J-1-1-9', '797.0000', 'cash', 'credit', 'sell', 'AD-1-1-29', '2022-04-07 11:46:20', '2022-04-07 11:46:20'),
('X-1-1-23', 23, b'1', 'J-1-1-9', '249.0000', 'cash', 'credit', 'sell', 'AE-1-1-30', '2022-04-07 11:46:50', '2022-04-07 11:46:50'),
('Y-1-1-24', 24, b'1', 'J-1-1-9', '99.0000', 'cash', 'credit', 'sell', 'AF-1-1-31', '2022-04-07 11:47:19', '2022-04-07 11:47:19'),
('Z-1-1-25', 25, b'1', 'J-1-1-9', '398.0000', 'cash', 'credit', 'sell', 'AG-1-1-32', '2022-04-07 11:47:29', '2022-04-07 11:47:29');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `short_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) NOT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `category_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `business_id`, `short_code`, `parent_id`, `created_by`, `category_type`, `description`, `slug`, `deleted_at`, `created_at`, `updated_at`) VALUES
(2, 'CHAKHA MAKHA', 1, NULL, 0, 1, 'product', NULL, NULL, NULL, '2022-04-07 07:22:18', '2022-04-07 07:22:18'),
(3, 'SOUP SHOP', 1, NULL, 0, 1, 'product', NULL, NULL, NULL, '2022-04-07 07:22:19', '2022-04-07 07:22:19'),
(4, 'PASTA & CHOWMEIN', 1, NULL, 0, 1, 'product', NULL, NULL, NULL, '2022-04-07 07:22:19', '2022-04-07 07:22:19'),
(5, 'FAST FOOD', 1, NULL, 0, 1, 'product', NULL, NULL, NULL, '2022-04-07 07:22:19', '2022-04-07 07:22:19'),
(6, 'CHINA TOWN', 1, NULL, 0, 1, 'product', NULL, NULL, NULL, '2022-04-07 07:22:19', '2022-04-07 07:22:19'),
(7, 'CHAWAL SHAWAL', 1, NULL, 0, 1, 'product', NULL, NULL, NULL, '2022-04-07 07:22:19', '2022-04-07 07:22:19'),
(8, 'KARAHI SHARAHI', 1, NULL, 0, 1, 'product', NULL, NULL, NULL, '2022-04-07 07:22:19', '2022-04-07 07:22:19'),
(9, 'HANDI SHANDI', 1, NULL, 0, 1, 'product', NULL, NULL, NULL, '2022-04-07 07:22:19', '2022-04-07 07:22:19'),
(10, 'SALAD SHALAD', 1, NULL, 0, 1, 'product', NULL, NULL, NULL, '2022-04-07 07:22:19', '2022-04-07 07:22:19'),
(11, 'DHUAAN DHAAR', 1, NULL, 0, 1, 'product', NULL, NULL, NULL, '2022-04-07 07:22:19', '2022-04-07 07:22:19'),
(12, 'TANDOOR', 1, NULL, 0, 1, 'product', NULL, NULL, NULL, '2022-04-07 07:22:19', '2022-04-07 07:22:19'),
(13, 'BAR MENU', 1, NULL, 0, 1, 'product', NULL, NULL, NULL, '2022-04-07 07:22:19', '2022-04-07 07:22:19'),
(14, 'COLADA’S SPECIAL', 1, NULL, 13, 1, 'product', NULL, NULL, NULL, '2022-04-07 07:22:19', '2022-04-07 07:22:19'),
(15, 'SPECIAL SMOOTHIES', 1, NULL, 13, 1, 'product', NULL, NULL, NULL, '2022-04-07 07:22:19', '2022-04-07 07:22:19'),
(16, 'MARGRITAS', 1, NULL, 13, 1, 'product', NULL, NULL, NULL, '2022-04-07 07:22:19', '2022-04-07 07:22:19'),
(17, 'SLUSH', 1, NULL, 13, 1, 'product', NULL, NULL, NULL, '2022-04-07 07:22:19', '2022-04-07 07:22:19'),
(18, 'FRESH FRUITS SHAKES', 1, NULL, 13, 1, 'product', NULL, NULL, NULL, '2022-04-07 07:22:19', '2022-04-07 07:22:19'),
(19, 'FRESH JUICES', 1, NULL, 13, 1, 'product', NULL, NULL, NULL, '2022-04-07 07:22:19', '2022-04-07 07:22:19'),
(20, 'CHAI SPECIAL', 1, NULL, 13, 1, 'product', NULL, NULL, NULL, '2022-04-07 07:22:19', '2022-04-07 07:22:19');

-- --------------------------------------------------------

--
-- Table structure for table `categorizables`
--

CREATE TABLE `categorizables` (
  `category_id` int(11) NOT NULL,
  `categorizable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `categorizable_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ai_id` int(10) UNSIGNED NOT NULL,
  `sync_status` bit(1) NOT NULL DEFAULT b'0',
  `business_id` int(10) UNSIGNED NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `supplier_business_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prefix` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `middle_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `tax_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address_line_1` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address_line_2` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `mobile` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `landline` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alternate_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pay_term_number` int(11) DEFAULT NULL,
  `pay_term_type` enum('days','months') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `credit_limit` decimal(22,4) DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `balance` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `total_rp` int(11) NOT NULL DEFAULT 0 COMMENT 'rp is the short form of reward points',
  `total_rp_used` int(11) NOT NULL DEFAULT 0 COMMENT 'rp is the short form of reward points',
  `total_rp_expired` int(11) NOT NULL DEFAULT 0 COMMENT 'rp is the short form of reward points',
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `shipping_address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_custom_field_details` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_export` tinyint(1) NOT NULL DEFAULT 0,
  `export_custom_field_1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `export_custom_field_2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `export_custom_field_3` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `export_custom_field_4` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `export_custom_field_5` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `export_custom_field_6` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_group_id` int(11) DEFAULT NULL,
  `custom_field1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field3` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field4` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field5` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field6` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field7` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field8` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field9` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field10` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`id`, `ai_id`, `sync_status`, `business_id`, `type`, `supplier_business_name`, `name`, `prefix`, `first_name`, `middle_name`, `last_name`, `email`, `contact_id`, `contact_status`, `tax_number`, `city`, `state`, `country`, `address_line_1`, `address_line_2`, `zip_code`, `dob`, `mobile`, `landline`, `alternate_number`, `pay_term_number`, `pay_term_type`, `credit_limit`, `created_by`, `balance`, `total_rp`, `total_rp_used`, `total_rp_expired`, `is_default`, `shipping_address`, `shipping_custom_field_details`, `is_export`, `export_custom_field_1`, `export_custom_field_2`, `export_custom_field_3`, `export_custom_field_4`, `export_custom_field_5`, `export_custom_field_6`, `position`, `customer_group_id`, `custom_field1`, `custom_field2`, `custom_field3`, `custom_field4`, `custom_field5`, `custom_field6`, `custom_field7`, `custom_field8`, `custom_field9`, `custom_field10`, `deleted_at`, `created_at`, `updated_at`) VALUES
('1', 1, b'1', 1, 'customer', NULL, 'WALK IN Customer', NULL, 'WALK IN Customer', NULL, NULL, NULL, 'WO0001', 'active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '11111111111111111', NULL, NULL, NULL, NULL, '0.0000', 1, '0.0000', 0, 0, 0, 1, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-07 07:25:19', '2022-04-07 10:22:16'),
('2', 3, b'1', 1, 'supplier', NULL, 'Mayo', NULL, 'Mayo', NULL, NULL, 'pail@gmail.com', 'CO0003', 'active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0320415266', NULL, NULL, NULL, NULL, NULL, 1, '0.0000', 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-07 09:56:31', '2022-04-07 09:56:31'),
('5', 5, b'1', 1, 'customer', NULL, 'Shoiab', NULL, 'Shoiab', NULL, NULL, NULL, 'CO0004', 'active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0320415263', NULL, NULL, NULL, NULL, NULL, 1, '0.0000', 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-07 10:27:33', '2022-04-07 10:28:49'),
('6', 6, b'1', 1, 'customer', NULL, 'Zaib', NULL, 'Zaib', NULL, NULL, NULL, 'CO0005', 'active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0320415263', NULL, NULL, NULL, NULL, NULL, 1, '0.0000', 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-07 10:27:34', '2022-04-07 10:27:34'),
('7', 7, b'1', 1, 'customer', NULL, 'Ahsan', NULL, 'Ahsan', NULL, NULL, NULL, 'CO0006', 'active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '121+65+99879+', NULL, NULL, NULL, NULL, NULL, 1, '0.0000', 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-07 10:28:11', '2022-04-07 10:28:11'),
('E-1-1-4', 4, b'1', 1, 'customer', NULL, 'Jahan', NULL, 'Jahan', NULL, NULL, NULL, 'CO0001', 'active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '03165468\\/', NULL, NULL, NULL, NULL, NULL, 1, '0.0000', 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-07 10:23:38', '2022-04-07 10:23:38'),
('F-1-1-5', 8, b'1', 1, 'customer', NULL, 'Gul', NULL, 'Gul', NULL, NULL, NULL, 'CO0002', 'active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '111111111111111111111', NULL, NULL, NULL, NULL, NULL, 1, '0.0000', 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-07 10:30:12', '2022-04-07 10:30:12'),
('G-1-1-6', 9, b'1', 1, 'customer', NULL, 'Faham', NULL, 'Faham', NULL, NULL, NULL, 'CO0003', 'active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '222222222222222222', NULL, NULL, NULL, NULL, NULL, 1, '0.0000', 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-07 10:31:01', '2022-04-07 10:31:01'),
('H-1-1-7', 10, b'1', 1, 'customer', NULL, 'Zohan', NULL, 'Zohan', NULL, NULL, NULL, 'CO0004', 'active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '00000000000000', NULL, NULL, NULL, NULL, NULL, 1, '0.0000', 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-07 10:34:56', '2022-04-07 10:34:56');

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` int(10) UNSIGNED NOT NULL,
  `country` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `symbol` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `thousand_separator` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `decimal_separator` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `country`, `currency`, `code`, `symbol`, `thousand_separator`, `decimal_separator`, `created_at`, `updated_at`) VALUES
(1, 'Albania', 'Leke', 'ALL', 'Lek', ',', '.', NULL, NULL),
(2, 'America', 'Dollars', 'USD', '$', ',', '.', NULL, NULL),
(3, 'Afghanistan', 'Afghanis', 'AF', '؋', ',', '.', NULL, NULL),
(4, 'Argentina', 'Pesos', 'ARS', '$', ',', '.', NULL, NULL),
(5, 'Aruba', 'Guilders', 'AWG', 'ƒ', ',', '.', NULL, NULL),
(6, 'Australia', 'Dollars', 'AUD', '$', ',', '.', NULL, NULL),
(7, 'Azerbaijan', 'New Manats', 'AZ', 'ман', ',', '.', NULL, NULL),
(8, 'Bahamas', 'Dollars', 'BSD', '$', ',', '.', NULL, NULL),
(9, 'Barbados', 'Dollars', 'BBD', '$', ',', '.', NULL, NULL),
(10, 'Belarus', 'Rubles', 'BYR', 'p.', ',', '.', NULL, NULL),
(11, 'Belgium', 'Euro', 'EUR', '€', ',', '.', NULL, NULL),
(12, 'Beliz', 'Dollars', 'BZD', 'BZ$', ',', '.', NULL, NULL),
(13, 'Bermuda', 'Dollars', 'BMD', '$', ',', '.', NULL, NULL),
(14, 'Bolivia', 'Bolivianos', 'BOB', '$b', ',', '.', NULL, NULL),
(15, 'Bosnia and Herzegovina', 'Convertible Marka', 'BAM', 'KM', ',', '.', NULL, NULL),
(16, 'Botswana', 'Pula\'s', 'BWP', 'P', ',', '.', NULL, NULL),
(17, 'Bulgaria', 'Leva', 'BG', 'лв', ',', '.', NULL, NULL),
(18, 'Brazil', 'Reais', 'BRL', 'R$', ',', '.', NULL, NULL),
(19, 'Britain [United Kingdom]', 'Pounds', 'GBP', '£', ',', '.', NULL, NULL),
(20, 'Brunei Darussalam', 'Dollars', 'BND', '$', ',', '.', NULL, NULL),
(21, 'Cambodia', 'Riels', 'KHR', '៛', ',', '.', NULL, NULL),
(22, 'Canada', 'Dollars', 'CAD', '$', ',', '.', NULL, NULL),
(23, 'Cayman Islands', 'Dollars', 'KYD', '$', ',', '.', NULL, NULL),
(24, 'Chile', 'Pesos', 'CLP', '$', ',', '.', NULL, NULL),
(25, 'China', 'Yuan Renminbi', 'CNY', '¥', ',', '.', NULL, NULL),
(26, 'Colombia', 'Pesos', 'COP', '$', ',', '.', NULL, NULL),
(27, 'Costa Rica', 'Colón', 'CRC', '₡', ',', '.', NULL, NULL),
(28, 'Croatia', 'Kuna', 'HRK', 'kn', ',', '.', NULL, NULL),
(29, 'Cuba', 'Pesos', 'CUP', '₱', ',', '.', NULL, NULL),
(30, 'Cyprus', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(31, 'Czech Republic', 'Koruny', 'CZK', 'Kč', ',', '.', NULL, NULL),
(32, 'Denmark', 'Kroner', 'DKK', 'kr', ',', '.', NULL, NULL),
(33, 'Dominican Republic', 'Pesos', 'DOP ', 'RD$', ',', '.', NULL, NULL),
(34, 'East Caribbean', 'Dollars', 'XCD', '$', ',', '.', NULL, NULL),
(35, 'Egypt', 'Pounds', 'EGP', '£', ',', '.', NULL, NULL),
(36, 'El Salvador', 'Colones', 'SVC', '$', ',', '.', NULL, NULL),
(37, 'England [United Kingdom]', 'Pounds', 'GBP', '£', ',', '.', NULL, NULL),
(38, 'Euro', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(39, 'Falkland Islands', 'Pounds', 'FKP', '£', ',', '.', NULL, NULL),
(40, 'Fiji', 'Dollars', 'FJD', '$', ',', '.', NULL, NULL),
(41, 'France', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(42, 'Ghana', 'Cedis', 'GHS', '¢', ',', '.', NULL, NULL),
(43, 'Gibraltar', 'Pounds', 'GIP', '£', ',', '.', NULL, NULL),
(44, 'Greece', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(45, 'Guatemala', 'Quetzales', 'GTQ', 'Q', ',', '.', NULL, NULL),
(46, 'Guernsey', 'Pounds', 'GGP', '£', ',', '.', NULL, NULL),
(47, 'Guyana', 'Dollars', 'GYD', '$', ',', '.', NULL, NULL),
(48, 'Holland [Netherlands]', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(49, 'Honduras', 'Lempiras', 'HNL', 'L', ',', '.', NULL, NULL),
(50, 'Hong Kong', 'Dollars', 'HKD', '$', ',', '.', NULL, NULL),
(51, 'Hungary', 'Forint', 'HUF', 'Ft', ',', '.', NULL, NULL),
(52, 'Iceland', 'Kronur', 'ISK', 'kr', ',', '.', NULL, NULL),
(53, 'India', 'Rupees', 'INR', '₹', ',', '.', NULL, NULL),
(54, 'Indonesia', 'Rupiahs', 'IDR', 'Rp', ',', '.', NULL, NULL),
(55, 'Iran', 'Rials', 'IRR', '﷼', ',', '.', NULL, NULL),
(56, 'Ireland', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(57, 'Isle of Man', 'Pounds', 'IMP', '£', ',', '.', NULL, NULL),
(58, 'Israel', 'New Shekels', 'ILS', '₪', ',', '.', NULL, NULL),
(59, 'Italy', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(60, 'Jamaica', 'Dollars', 'JMD', 'J$', ',', '.', NULL, NULL),
(61, 'Japan', 'Yen', 'JPY', '¥', ',', '.', NULL, NULL),
(62, 'Jersey', 'Pounds', 'JEP', '£', ',', '.', NULL, NULL),
(63, 'Kazakhstan', 'Tenge', 'KZT', 'лв', ',', '.', NULL, NULL),
(64, 'Korea [North]', 'Won', 'KPW', '₩', ',', '.', NULL, NULL),
(65, 'Korea [South]', 'Won', 'KRW', '₩', ',', '.', NULL, NULL),
(66, 'Kyrgyzstan', 'Soms', 'KGS', 'лв', ',', '.', NULL, NULL),
(67, 'Laos', 'Kips', 'LAK', '₭', ',', '.', NULL, NULL),
(68, 'Latvia', 'Lati', 'LVL', 'Ls', ',', '.', NULL, NULL),
(69, 'Lebanon', 'Pounds', 'LBP', '£', ',', '.', NULL, NULL),
(70, 'Liberia', 'Dollars', 'LRD', '$', ',', '.', NULL, NULL),
(71, 'Liechtenstein', 'Switzerland Francs', 'CHF', 'CHF', ',', '.', NULL, NULL),
(72, 'Lithuania', 'Litai', 'LTL', 'Lt', ',', '.', NULL, NULL),
(73, 'Luxembourg', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(74, 'Macedonia', 'Denars', 'MKD', 'ден', ',', '.', NULL, NULL),
(75, 'Malaysia', 'Ringgits', 'MYR', 'RM', ',', '.', NULL, NULL),
(76, 'Malta', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(77, 'Mauritius', 'Rupees', 'MUR', '₨', ',', '.', NULL, NULL),
(78, 'Mexico', 'Pesos', 'MXN', '$', ',', '.', NULL, NULL),
(79, 'Mongolia', 'Tugriks', 'MNT', '₮', ',', '.', NULL, NULL),
(80, 'Mozambique', 'Meticais', 'MZ', 'MT', ',', '.', NULL, NULL),
(81, 'Namibia', 'Dollars', 'NAD', '$', ',', '.', NULL, NULL),
(82, 'Nepal', 'Rupees', 'NPR', '₨', ',', '.', NULL, NULL),
(83, 'Netherlands Antilles', 'Guilders', 'ANG', 'ƒ', ',', '.', NULL, NULL),
(84, 'Netherlands', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(85, 'New Zealand', 'Dollars', 'NZD', '$', ',', '.', NULL, NULL),
(86, 'Nicaragua', 'Cordobas', 'NIO', 'C$', ',', '.', NULL, NULL),
(87, 'Nigeria', 'Nairas', 'NGN', '₦', ',', '.', NULL, NULL),
(88, 'North Korea', 'Won', 'KPW', '₩', ',', '.', NULL, NULL),
(89, 'Norway', 'Krone', 'NOK', 'kr', ',', '.', NULL, NULL),
(90, 'Oman', 'Rials', 'OMR', '﷼', ',', '.', NULL, NULL),
(91, 'Pakistan', 'Rupees', 'PKR', '₨', ',', '.', NULL, NULL),
(92, 'Panama', 'Balboa', 'PAB', 'B/.', ',', '.', NULL, NULL),
(93, 'Paraguay', 'Guarani', 'PYG', 'Gs', ',', '.', NULL, NULL),
(94, 'Peru', 'Nuevos Soles', 'PE', 'S/.', ',', '.', NULL, NULL),
(95, 'Philippines', 'Pesos', 'PHP', 'Php', ',', '.', NULL, NULL),
(96, 'Poland', 'Zlotych', 'PL', 'zł', ',', '.', NULL, NULL),
(97, 'Qatar', 'Rials', 'QAR', '﷼', ',', '.', NULL, NULL),
(98, 'Romania', 'New Lei', 'RO', 'lei', ',', '.', NULL, NULL),
(99, 'Russia', 'Rubles', 'RUB', 'руб', ',', '.', NULL, NULL),
(100, 'Saint Helena', 'Pounds', 'SHP', '£', ',', '.', NULL, NULL),
(101, 'Saudi Arabia', 'Riyals', 'SAR', '﷼', ',', '.', NULL, NULL),
(102, 'Serbia', 'Dinars', 'RSD', 'Дин.', ',', '.', NULL, NULL),
(103, 'Seychelles', 'Rupees', 'SCR', '₨', ',', '.', NULL, NULL),
(104, 'Singapore', 'Dollars', 'SGD', '$', ',', '.', NULL, NULL),
(105, 'Slovenia', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(106, 'Solomon Islands', 'Dollars', 'SBD', '$', ',', '.', NULL, NULL),
(107, 'Somalia', 'Shillings', 'SOS', 'S', ',', '.', NULL, NULL),
(108, 'South Africa', 'Rand', 'ZAR', 'R', ',', '.', NULL, NULL),
(109, 'South Korea', 'Won', 'KRW', '₩', ',', '.', NULL, NULL),
(110, 'Spain', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(111, 'Sri Lanka', 'Rupees', 'LKR', '₨', ',', '.', NULL, NULL),
(112, 'Sweden', 'Kronor', 'SEK', 'kr', ',', '.', NULL, NULL),
(113, 'Switzerland', 'Francs', 'CHF', 'CHF', ',', '.', NULL, NULL),
(114, 'Suriname', 'Dollars', 'SRD', '$', ',', '.', NULL, NULL),
(115, 'Syria', 'Pounds', 'SYP', '£', ',', '.', NULL, NULL),
(116, 'Taiwan', 'New Dollars', 'TWD', 'NT$', ',', '.', NULL, NULL),
(117, 'Thailand', 'Baht', 'THB', '฿', ',', '.', NULL, NULL),
(118, 'Trinidad and Tobago', 'Dollars', 'TTD', 'TT$', ',', '.', NULL, NULL),
(119, 'Turkey', 'Lira', 'TRY', 'TL', ',', '.', NULL, NULL),
(120, 'Turkey', 'Liras', 'TRL', '£', ',', '.', NULL, NULL),
(121, 'Tuvalu', 'Dollars', 'TVD', '$', ',', '.', NULL, NULL),
(122, 'Ukraine', 'Hryvnia', 'UAH', '₴', ',', '.', NULL, NULL),
(123, 'United Kingdom', 'Pounds', 'GBP', '£', ',', '.', NULL, NULL),
(124, 'United States of America', 'Dollars', 'USD', '$', ',', '.', NULL, NULL),
(125, 'Uruguay', 'Pesos', 'UYU', '$U', ',', '.', NULL, NULL),
(126, 'Uzbekistan', 'Sums', 'UZS', 'лв', ',', '.', NULL, NULL),
(127, 'Vatican City', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(128, 'Venezuela', 'Bolivares Fuertes', 'VEF', 'Bs', ',', '.', NULL, NULL),
(129, 'Vietnam', 'Dong', 'VND', '₫', ',', '.', NULL, NULL),
(130, 'Yemen', 'Rials', 'YER', '﷼', ',', '.', NULL, NULL),
(131, 'Zimbabwe', 'Zimbabwe Dollars', 'ZWD', 'Z$', ',', '.', NULL, NULL),
(132, 'Iraq', 'Iraqi dinar', 'IQD', 'د.ع', ',', '.', NULL, NULL),
(133, 'Kenya', 'Kenyan shilling', 'KES', 'KSh', ',', '.', NULL, NULL),
(134, 'Bangladesh', 'Taka', 'BDT', '৳', ',', '.', NULL, NULL),
(135, 'Algerie', 'Algerian dinar', 'DZD', 'د.ج', ' ', '.', NULL, NULL),
(136, 'United Arab Emirates', 'United Arab Emirates dirham', 'AED', 'د.إ', ',', '.', NULL, NULL),
(137, 'Uganda', 'Uganda shillings', 'UGX', 'USh', ',', '.', NULL, NULL),
(138, 'Tanzania', 'Tanzanian shilling', 'TZS', 'TSh', ',', '.', NULL, NULL),
(139, 'Angola', 'Kwanza', 'AOA', 'Kz', ',', '.', NULL, NULL),
(140, 'Kuwait', 'Kuwaiti dinar', 'KWD', 'KD', ',', '.', NULL, NULL),
(141, 'Bahrain', 'Bahraini dinar', 'BHD', 'BD', ',', '.', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `customer_groups`
--

CREATE TABLE `customer_groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double(5,2) NOT NULL,
  `price_calculation_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'percentage',
  `selling_price_group_id` int(11) DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dashboard_configurations`
--

CREATE TABLE `dashboard_configurations` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `created_by` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `configuration` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `delete_sales`
--

CREATE TABLE `delete_sales` (
  `id` int(11) NOT NULL,
  `transaction_id` varchar(255) NOT NULL,
  `sync_status` bit(1) DEFAULT b'0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `delete_sales`
--

INSERT INTO `delete_sales` (`id`, `transaction_id`, `sync_status`) VALUES
(3, 'BY-1-1-76', b'0');

-- --------------------------------------------------------

--
-- Table structure for table `discounts`
--

CREATE TABLE `discounts` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `business_id` int(11) NOT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  `discount_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_amount` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `starts_at` datetime DEFAULT NULL,
  `ends_at` datetime DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `spg` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Applicable in specified selling price group only. Use of applicable_in_spg column is discontinued',
  `applicable_in_cg` tinyint(1) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `discount_variations`
--

CREATE TABLE `discount_variations` (
  `discount_id` int(11) NOT NULL,
  `variation_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `document_and_notes`
--

CREATE TABLE `document_and_notes` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(11) NOT NULL,
  `notable_id` int(11) NOT NULL,
  `notable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `heading` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_private` tinyint(1) NOT NULL DEFAULT 0,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `expense_categories`
--

CREATE TABLE `expense_categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `group_sub_taxes`
--

CREATE TABLE `group_sub_taxes` (
  `group_tax_id` int(10) UNSIGNED NOT NULL,
  `tax_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoice_layouts`
--

CREATE TABLE `invoice_layouts` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `header_text` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoice_no_prefix` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quotation_no_prefix` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoice_heading` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_heading_line1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_heading_line2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_heading_line3` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_heading_line4` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_heading_line5` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoice_heading_not_paid` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoice_heading_paid` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quotation_heading` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_total_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `round_off_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_due_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paid_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `show_client_id` tinyint(1) NOT NULL DEFAULT 0,
  `client_id_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `client_tax_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_time_format` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `show_time` tinyint(1) NOT NULL DEFAULT 1,
  `show_brand` tinyint(1) NOT NULL DEFAULT 0,
  `show_sku` tinyint(1) NOT NULL DEFAULT 1,
  `show_cat_code` tinyint(1) NOT NULL DEFAULT 1,
  `show_expiry` tinyint(1) NOT NULL DEFAULT 0,
  `show_lot` tinyint(1) NOT NULL DEFAULT 0,
  `show_image` tinyint(1) NOT NULL DEFAULT 0,
  `show_sale_description` tinyint(1) NOT NULL DEFAULT 0,
  `sales_person_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `show_sales_person` tinyint(1) NOT NULL DEFAULT 0,
  `table_product_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `table_qty_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `table_unit_price_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `table_subtotal_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cat_code_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `show_logo` tinyint(1) NOT NULL DEFAULT 0,
  `show_business_name` tinyint(1) NOT NULL DEFAULT 0,
  `show_location_name` tinyint(1) NOT NULL DEFAULT 1,
  `show_landmark` tinyint(1) NOT NULL DEFAULT 1,
  `show_city` tinyint(1) NOT NULL DEFAULT 1,
  `show_state` tinyint(1) NOT NULL DEFAULT 1,
  `show_zip_code` tinyint(1) NOT NULL DEFAULT 1,
  `show_country` tinyint(1) NOT NULL DEFAULT 1,
  `show_mobile_number` tinyint(1) NOT NULL DEFAULT 1,
  `show_alternate_number` tinyint(1) NOT NULL DEFAULT 0,
  `show_email` tinyint(1) NOT NULL DEFAULT 0,
  `show_tax_1` tinyint(1) NOT NULL DEFAULT 1,
  `show_tax_2` tinyint(1) NOT NULL DEFAULT 0,
  `show_barcode` tinyint(1) NOT NULL DEFAULT 0,
  `show_payments` tinyint(1) NOT NULL DEFAULT 0,
  `show_customer` tinyint(1) NOT NULL DEFAULT 0,
  `customer_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `commission_agent_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `show_commission_agent` tinyint(1) NOT NULL DEFAULT 0,
  `show_reward_point` tinyint(1) NOT NULL DEFAULT 0,
  `highlight_color` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `footer_text` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `module_info` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `common_settings` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `business_id` int(10) UNSIGNED NOT NULL,
  `show_qr_code` tinyint(1) NOT NULL DEFAULT 0,
  `qr_code_fields` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `design` varchar(190) COLLATE utf8mb4_unicode_ci DEFAULT 'classic',
  `cn_heading` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'cn = credit note',
  `cn_no_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cn_amount_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `table_tax_headings` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `show_previous_bal` tinyint(1) NOT NULL DEFAULT 0,
  `prev_bal_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `change_return_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_custom_fields` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_custom_fields` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location_custom_fields` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invoice_layouts`
--

INSERT INTO `invoice_layouts` (`id`, `name`, `header_text`, `invoice_no_prefix`, `quotation_no_prefix`, `invoice_heading`, `sub_heading_line1`, `sub_heading_line2`, `sub_heading_line3`, `sub_heading_line4`, `sub_heading_line5`, `invoice_heading_not_paid`, `invoice_heading_paid`, `quotation_heading`, `sub_total_label`, `discount_label`, `tax_label`, `total_label`, `round_off_label`, `total_due_label`, `paid_label`, `show_client_id`, `client_id_label`, `client_tax_label`, `date_label`, `date_time_format`, `show_time`, `show_brand`, `show_sku`, `show_cat_code`, `show_expiry`, `show_lot`, `show_image`, `show_sale_description`, `sales_person_label`, `show_sales_person`, `table_product_label`, `table_qty_label`, `table_unit_price_label`, `table_subtotal_label`, `cat_code_label`, `logo`, `show_logo`, `show_business_name`, `show_location_name`, `show_landmark`, `show_city`, `show_state`, `show_zip_code`, `show_country`, `show_mobile_number`, `show_alternate_number`, `show_email`, `show_tax_1`, `show_tax_2`, `show_barcode`, `show_payments`, `show_customer`, `customer_label`, `commission_agent_label`, `show_commission_agent`, `show_reward_point`, `highlight_color`, `footer_text`, `module_info`, `common_settings`, `is_default`, `business_id`, `show_qr_code`, `qr_code_fields`, `design`, `cn_heading`, `cn_no_label`, `cn_amount_label`, `table_tax_headings`, `show_previous_bal`, `prev_bal_label`, `change_return_label`, `product_custom_fields`, `contact_custom_fields`, `location_custom_fields`, `created_at`, `updated_at`) VALUES
(1, 'Default', NULL, 'Invoice No.', NULL, 'Invoice', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Subtotal', 'Discount', 'Tax', 'Total', NULL, 'Total Due', 'Total Paid', 0, NULL, NULL, 'Date', NULL, 1, 0, 1, 1, 0, 0, 0, 1, NULL, 0, 'Product', 'Quantity', 'Unit Price', 'Subtotal', NULL, '1649314714_Zinger-Burger-with-Fries.jpg', 1, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 0, 0, 1, 1, 'Customer', NULL, 0, 0, '#000000', '<p style=\"text-align: center;\"><em>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Thank you for visiting us</em></p>', NULL, '{\"proforma_heading\":null,\"sales_order_heading\":null,\"due_date_label\":null,\"total_quantity_label\":null,\"item_discount_label\":null,\"num_to_word_format\":\"international\",\"tax_summary_label\":null}', 1, 1, 0, NULL, 'slim', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2022-04-07 07:25:19', '2022-04-07 06:58:34');

-- --------------------------------------------------------

--
-- Table structure for table `invoice_schemes`
--

CREATE TABLE `invoice_schemes` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `scheme_type` enum('blank','year') COLLATE utf8mb4_unicode_ci NOT NULL,
  `prefix` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_number` int(11) DEFAULT NULL,
  `invoice_count` int(11) NOT NULL DEFAULT 0,
  `total_digits` int(11) DEFAULT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invoice_schemes`
--

INSERT INTO `invoice_schemes` (`id`, `business_id`, `name`, `scheme_type`, `prefix`, `start_number`, `invoice_count`, `total_digits`, `is_default`, `created_at`, `updated_at`) VALUES
(1, 1, 'Default', 'blank', NULL, 1, 76, 4, 1, '2022-04-07 07:25:19', '2022-04-08 11:40:33');

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

CREATE TABLE `media` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(11) NOT NULL,
  `file_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `uploaded_by` int(11) DEFAULT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_media_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_permissions`
--

INSERT INTO `model_has_permissions` (`permission_id`, `model_type`, `model_id`) VALUES
(80, 'App\\User', 2),
(99, 'App\\User', 3);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` int(10) UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\User', 1),
(2, 'App\\User', 2),
(3, 'App\\User', 3);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notification_templates`
--

CREATE TABLE `notification_templates` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(11) NOT NULL,
  `template_for` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_body` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sms_body` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `whatsapp_text` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cc` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bcc` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `auto_send` tinyint(1) NOT NULL DEFAULT 0,
  `auto_send_sms` tinyint(1) NOT NULL DEFAULT 0,
  `auto_send_wa_notif` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notification_templates`
--

INSERT INTO `notification_templates` (`id`, `business_id`, `template_for`, `email_body`, `sms_body`, `whatsapp_text`, `subject`, `cc`, `bcc`, `auto_send`, `auto_send_sms`, `auto_send_wa_notif`, `created_at`, `updated_at`) VALUES
(1, 1, 'new_sale', '\"<p>Dear {contact_name},<\\/p>\\r\\n\\r\\n                    <p>Your invoice number is {invoice_number}<br \\/>\\r\\n                    Total amount: {total_amount}<br \\/>\\r\\n                    Paid amount: {received_amount}<\\/p>\\r\\n\\r\\n                    <p>Thank you for shopping with us.<\\/p>\\r\\n\\r\\n                    <p>{business_logo}<\\/p>\\r\\n\\r\\n                    <p>&nbsp;<\\/p>\"', 'Dear {contact_name}, Thank you for shopping with us. {business_name}', NULL, 'Thank you from {business_name}', NULL, NULL, 0, 0, 0, '2022-04-07 07:25:20', '2022-04-07 07:25:20'),
(2, 1, 'payment_received', '\"<p>Dear {contact_name},<\\/p>\\r\\n\\r\\n                <p>We have received a payment of {received_amount}<\\/p>\\r\\n\\r\\n                <p>{business_logo}<\\/p>\"', 'Dear {contact_name}, We have received a payment of {received_amount}. {business_name}', NULL, 'Payment Received, from {business_name}', NULL, NULL, 0, 0, 0, '2022-04-07 07:25:20', '2022-04-07 07:25:20'),
(3, 1, 'payment_reminder', '\"<p>Dear {contact_name},<\\/p>\\r\\n\\r\\n                    <p>This is to remind you that you have pending payment of {due_amount}. Kindly pay it as soon as possible.<\\/p>\\r\\n\\r\\n                    <p>{business_logo}<\\/p>\"', 'Dear {contact_name}, You have pending payment of {due_amount}. Kindly pay it as soon as possible. {business_name}', NULL, 'Payment Reminder, from {business_name}', NULL, NULL, 0, 0, 0, '2022-04-07 07:25:20', '2022-04-07 07:25:20'),
(4, 1, 'new_booking', '\"<p>Dear {contact_name},<\\/p>\\r\\n\\r\\n                    <p>Your booking is confirmed<\\/p>\\r\\n\\r\\n                    <p>Date: {start_time} to {end_time}<\\/p>\\r\\n\\r\\n                    <p>Table: {table}<\\/p>\\r\\n\\r\\n                    <p>Location: {location}<\\/p>\\r\\n\\r\\n                    <p>{business_logo}<\\/p>\"', 'Dear {contact_name}, Your booking is confirmed. Date: {start_time} to {end_time}, Table: {table}, Location: {location}', NULL, 'Booking Confirmed - {business_name}', NULL, NULL, 0, 0, 0, '2022-04-07 07:25:20', '2022-04-07 07:25:20'),
(5, 1, 'new_order', '\"<p>Dear {contact_name},<\\/p>\\r\\n\\r\\n                    <p>We have a new order with reference number {order_ref_number}. Kindly process the products as soon as possible.<\\/p>\\r\\n\\r\\n                    <p>{business_name}<br \\/>\\r\\n                    {business_logo}<\\/p>\"', 'Dear {contact_name}, We have a new order with reference number {order_ref_number}. Kindly process the products as soon as possible. {business_name}', NULL, 'New Order, from {business_name}', NULL, NULL, 0, 0, 0, '2022-04-07 07:25:20', '2022-04-07 07:25:20'),
(6, 1, 'payment_paid', '\"<p>Dear {contact_name},<\\/p>\\r\\n\\r\\n                    <p>We have paid amount {paid_amount} again invoice number {order_ref_number}.<br \\/>\\r\\n                    Kindly note it down.<\\/p>\\r\\n\\r\\n                    <p>{business_name}<br \\/>\\r\\n                    {business_logo}<\\/p>\"', 'We have paid amount {paid_amount} again invoice number {order_ref_number}.\r\n                    Kindly note it down. {business_name}', NULL, 'Payment Paid, from {business_name}', NULL, NULL, 0, 0, 0, '2022-04-07 07:25:20', '2022-04-07 07:25:20'),
(7, 1, 'items_received', '\"<p>Dear {contact_name},<\\/p>\\r\\n\\r\\n                    <p>We have received all items from invoice reference number {order_ref_number}. Thank you for processing it.<\\/p>\\r\\n\\r\\n                    <p>{business_name}<br \\/>\\r\\n                    {business_logo}<\\/p>\"', 'We have received all items from invoice reference number {order_ref_number}. Thank you for processing it. {business_name}', NULL, 'Items received, from {business_name}', NULL, NULL, 0, 0, 0, '2022-04-07 07:25:20', '2022-04-07 07:25:20'),
(8, 1, 'items_pending', '\"<p>Dear {contact_name},<br \\/>\\r\\n                    This is to remind you that we have not yet received some items from invoice reference number {order_ref_number}. Please process it as soon as possible.<\\/p>\\r\\n\\r\\n                    <p>{business_name}<br \\/>\\r\\n                    {business_logo}<\\/p>\"', 'This is to remind you that we have not yet received some items from invoice reference number {order_ref_number} . Please process it as soon as possible.{business_name}', NULL, 'Items Pending, from {business_name}', NULL, NULL, 0, 0, 0, '2022-04-07 07:25:20', '2022-04-07 07:25:20'),
(9, 1, 'new_quotation', '\"<p>Dear {contact_name},<\\/p>\\r\\n\\r\\n                    <p>Your quotation number is {invoice_number}<br \\/>\\r\\n                    Total amount: {total_amount}<\\/p>\\r\\n\\r\\n                    <p>Thank you for shopping with us.<\\/p>\\r\\n\\r\\n                    <p>{business_logo}<\\/p>\\r\\n\\r\\n                    <p>&nbsp;<\\/p>\"', 'Dear {contact_name}, Thank you for shopping with us. {business_name}', NULL, 'Thank you from {business_name}', NULL, NULL, 0, 0, 0, '2022-04-07 07:25:20', '2022-04-07 07:25:20');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'profit_loss_report.view', 'web', '2022-03-15 01:49:01', NULL),
(2, 'direct_sell.access', 'web', '2022-03-15 01:49:01', NULL),
(3, 'product.opening_stock', 'web', '2022-03-15 01:49:08', '2022-03-15 01:49:08'),
(4, 'crud_all_bookings', 'web', '2022-03-15 01:49:08', '2022-03-15 01:49:08'),
(5, 'crud_own_bookings', 'web', '2022-03-15 01:49:08', '2022-03-15 01:49:08'),
(6, 'access_default_selling_price', 'web', '2022-03-15 01:49:09', '2022-03-15 01:49:09'),
(7, 'purchase.payments', 'web', '2022-03-15 01:49:09', '2022-03-15 01:49:09'),
(8, 'sell.payments', 'web', '2022-03-15 01:49:09', '2022-03-15 01:49:09'),
(9, 'edit_product_price_from_sale_screen', 'web', '2022-03-15 01:49:09', '2022-03-15 01:49:09'),
(10, 'edit_product_discount_from_sale_screen', 'web', '2022-03-15 01:49:09', '2022-03-15 01:49:09'),
(11, 'roles.view', 'web', '2022-03-15 01:49:09', '2022-03-15 01:49:09'),
(12, 'roles.create', 'web', '2022-03-15 01:49:09', '2022-03-15 01:49:09'),
(13, 'roles.update', 'web', '2022-03-15 01:49:09', '2022-03-15 01:49:09'),
(14, 'roles.delete', 'web', '2022-03-15 01:49:09', '2022-03-15 01:49:09'),
(15, 'account.access', 'web', '2022-03-15 01:49:10', '2022-03-15 01:49:10'),
(16, 'discount.access', 'web', '2022-03-15 01:49:10', '2022-03-15 01:49:10'),
(17, 'view_purchase_price', 'web', '2022-03-15 01:49:10', '2022-03-15 01:49:10'),
(18, 'view_own_sell_only', 'web', '2022-03-15 01:49:10', '2022-03-15 01:49:10'),
(19, 'edit_product_discount_from_pos_screen', 'web', '2022-03-15 01:49:15', '2022-03-15 01:49:15'),
(20, 'edit_product_price_from_pos_screen', 'web', '2022-03-15 01:49:15', '2022-03-15 01:49:15'),
(21, 'access_shipping', 'web', '2022-03-15 01:49:16', '2022-03-15 01:49:16'),
(22, 'purchase.update_status', 'web', '2022-03-15 01:49:16', '2022-03-15 01:49:16'),
(23, 'list_drafts', 'web', '2022-03-15 01:49:16', '2022-03-15 01:49:16'),
(24, 'list_quotations', 'web', '2022-03-15 01:49:16', '2022-03-15 01:49:16'),
(25, 'view_cash_register', 'web', '2022-03-15 01:49:17', '2022-03-15 01:49:17'),
(26, 'close_cash_register', 'web', '2022-03-15 01:49:17', '2022-03-15 01:49:17'),
(27, 'print_invoice', 'web', '2022-03-15 01:49:20', '2022-03-15 01:49:20'),
(28, 'user.view', 'web', '2022-03-15 01:49:23', NULL),
(29, 'user.create', 'web', '2022-03-15 01:49:23', NULL),
(30, 'user.update', 'web', '2022-03-15 01:49:23', NULL),
(31, 'user.delete', 'web', '2022-03-15 01:49:23', NULL),
(32, 'supplier.view', 'web', '2022-03-15 01:49:23', NULL),
(33, 'supplier.create', 'web', '2022-03-15 01:49:23', NULL),
(34, 'supplier.update', 'web', '2022-03-15 01:49:23', NULL),
(35, 'supplier.delete', 'web', '2022-03-15 01:49:23', NULL),
(36, 'customer.view', 'web', '2022-03-15 01:49:23', NULL),
(37, 'customer.create', 'web', '2022-03-15 01:49:23', NULL),
(38, 'customer.update', 'web', '2022-03-15 01:49:23', NULL),
(39, 'customer.delete', 'web', '2022-03-15 01:49:23', NULL),
(40, 'product.view', 'web', '2022-03-15 01:49:23', NULL),
(41, 'product.create', 'web', '2022-03-15 01:49:23', NULL),
(42, 'product.update', 'web', '2022-03-15 01:49:23', NULL),
(43, 'product.delete', 'web', '2022-03-15 01:49:23', NULL),
(44, 'purchase.view', 'web', '2022-03-15 01:49:23', NULL),
(45, 'purchase.create', 'web', '2022-03-15 01:49:23', NULL),
(46, 'purchase.update', 'web', '2022-03-15 01:49:23', NULL),
(47, 'purchase.delete', 'web', '2022-03-15 01:49:23', NULL),
(48, 'sell.view', 'web', '2022-03-15 01:49:23', NULL),
(49, 'sell.create', 'web', '2022-03-15 01:49:23', NULL),
(50, 'sell.update', 'web', '2022-03-15 01:49:23', NULL),
(51, 'sell.delete', 'web', '2022-03-15 01:49:23', NULL),
(52, 'purchase_n_sell_report.view', 'web', '2022-03-15 01:49:23', NULL),
(53, 'contacts_report.view', 'web', '2022-03-15 01:49:23', NULL),
(54, 'stock_report.view', 'web', '2022-03-15 01:49:23', NULL),
(55, 'tax_report.view', 'web', '2022-03-15 01:49:23', NULL),
(56, 'trending_product_report.view', 'web', '2022-03-15 01:49:23', NULL),
(57, 'register_report.view', 'web', '2022-03-15 01:49:23', NULL),
(58, 'sales_representative.view', 'web', '2022-03-15 01:49:23', NULL),
(59, 'expense_report.view', 'web', '2022-03-15 01:49:23', NULL),
(60, 'business_settings.access', 'web', '2022-03-15 01:49:23', NULL),
(61, 'barcode_settings.access', 'web', '2022-03-15 01:49:23', NULL),
(62, 'invoice_settings.access', 'web', '2022-03-15 01:49:23', NULL),
(63, 'brand.view', 'web', '2022-03-15 01:49:23', NULL),
(64, 'brand.create', 'web', '2022-03-15 01:49:23', NULL),
(65, 'brand.update', 'web', '2022-03-15 01:49:23', NULL),
(66, 'brand.delete', 'web', '2022-03-15 01:49:23', NULL),
(67, 'tax_rate.view', 'web', '2022-03-15 01:49:23', NULL),
(68, 'tax_rate.create', 'web', '2022-03-15 01:49:23', NULL),
(69, 'tax_rate.update', 'web', '2022-03-15 01:49:23', NULL),
(70, 'tax_rate.delete', 'web', '2022-03-15 01:49:23', NULL),
(71, 'unit.view', 'web', '2022-03-15 01:49:23', NULL),
(72, 'unit.create', 'web', '2022-03-15 01:49:23', NULL),
(73, 'unit.update', 'web', '2022-03-15 01:49:23', NULL),
(74, 'unit.delete', 'web', '2022-03-15 01:49:23', NULL),
(75, 'category.view', 'web', '2022-03-15 01:49:23', NULL),
(76, 'category.create', 'web', '2022-03-15 01:49:23', NULL),
(77, 'category.update', 'web', '2022-03-15 01:49:23', NULL),
(78, 'category.delete', 'web', '2022-03-15 01:49:23', NULL),
(79, 'expense.access', 'web', '2022-03-15 01:49:23', NULL),
(80, 'access_all_locations', 'web', '2022-03-15 01:49:23', NULL),
(81, 'dashboard.data', 'web', '2022-03-15 01:49:23', NULL),
(99, 'location.1', 'web', '2022-04-07 07:25:20', '2022-04-07 07:25:20');

-- --------------------------------------------------------

--
-- Table structure for table `printers`
--

CREATE TABLE `printers` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection_type` enum('network','windows','linux') COLLATE utf8mb4_unicode_ci NOT NULL,
  `capability_profile` enum('default','simple','SP2000','TEP-200M','P822D') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default',
  `char_per_line` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ip_address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `port` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `path` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `type` enum('single','variable','modifier','combo') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unit_id` int(11) UNSIGNED DEFAULT NULL,
  `sub_unit_ids` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `brand_id` int(10) UNSIGNED DEFAULT NULL,
  `category_id` int(10) UNSIGNED DEFAULT NULL,
  `sub_category_id` int(10) UNSIGNED DEFAULT NULL,
  `tax` int(10) UNSIGNED DEFAULT NULL,
  `tax_type` enum('inclusive','exclusive') COLLATE utf8mb4_unicode_ci NOT NULL,
  `enable_stock` tinyint(1) NOT NULL DEFAULT 0,
  `alert_quantity` decimal(22,4) DEFAULT NULL,
  `sku` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `barcode_type` enum('C39','C128','EAN13','EAN8','UPCA','UPCE') COLLATE utf8mb4_unicode_ci DEFAULT 'C128',
  `expiry_period` decimal(4,2) DEFAULT NULL,
  `expiry_period_type` enum('days','months') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `enable_sr_no` tinyint(1) NOT NULL DEFAULT 0,
  `weight` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_custom_field1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_custom_field2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_custom_field3` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_custom_field4` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `warranty_id` int(11) DEFAULT NULL,
  `is_inactive` tinyint(1) NOT NULL DEFAULT 0,
  `not_for_selling` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `business_id`, `type`, `unit_id`, `sub_unit_ids`, `brand_id`, `category_id`, `sub_category_id`, `tax`, `tax_type`, `enable_stock`, `alert_quantity`, `sku`, `barcode_type`, `expiry_period`, `expiry_period_type`, `enable_sr_no`, `weight`, `product_custom_field1`, `product_custom_field2`, `product_custom_field3`, `product_custom_field4`, `image`, `product_description`, `created_by`, `warranty_id`, `is_inactive`, `not_for_selling`, `created_at`, `updated_at`) VALUES
(1, 'Special Mehmaan Khana Fries', 1, 'single', 2, NULL, NULL, 2, NULL, NULL, 'inclusive', 0, NULL, 'SP01', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 1, NULL, 0, 1, '2022-04-07 07:22:20', '2022-04-07 07:22:20'),
(2, 'Fries With Garlic Mayo', 1, 'single', 2, NULL, NULL, 2, NULL, NULL, 'inclusive', 0, NULL, 'SP02', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 1, NULL, 0, 1, '2022-04-07 07:22:20', '2022-04-07 07:22:20'),
(3, 'Pizza Fries', 1, 'single', 2, NULL, NULL, 2, NULL, NULL, 'inclusive', 1, '0.0000', 'SP03', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '', NULL, 1, NULL, 0, 1, '2022-04-07 07:22:20', '2022-04-07 07:42:22'),
(4, 'Shami Kabab', 1, 'single', 2, NULL, NULL, 2, NULL, NULL, 'inclusive', 1, '0.0000', '0004', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '', NULL, 1, NULL, 0, 0, '2022-04-07 07:22:20', '2022-04-07 07:43:15'),
(5, 'Honey Wings 10 Pcs', 1, 'single', 2, NULL, NULL, 2, NULL, NULL, 'inclusive', 0, NULL, '0005', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 1, NULL, 0, 0, '2022-04-07 07:22:20', '2022-04-07 07:22:20'),
(6, 'Drumsticks 6pcs', 1, 'single', 2, NULL, NULL, 2, NULL, NULL, 'inclusive', 0, NULL, '0006', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 1, NULL, 0, 0, '2022-04-07 07:22:20', '2022-04-07 07:22:20'),
(7, 'Finger Fish', 1, 'variable', 2, NULL, NULL, 2, NULL, NULL, 'inclusive', 1, '0.0000', '0007', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '', NULL, 1, NULL, 0, 0, '2022-04-07 07:22:20', '2022-04-07 07:35:42'),
(8, 'Dhaka Chicken', 1, 'single', 2, NULL, NULL, 2, NULL, NULL, 'inclusive', 0, NULL, '0008', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 1, NULL, 0, 0, '2022-04-07 07:22:20', '2022-04-07 07:22:20'),
(9, 'Mehmaan Khana Special Soup(Half)', 1, 'single', 2, NULL, NULL, 3, NULL, NULL, 'inclusive', 0, NULL, '0009', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 1, NULL, 0, 0, '2022-04-07 07:22:20', '2022-04-07 07:22:20'),
(10, 'Hot & Sour Soup(Half)', 1, 'single', 2, NULL, NULL, 3, NULL, NULL, 'inclusive', 0, NULL, '0010', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 1, NULL, 0, 0, '2022-04-07 07:22:20', '2022-04-07 07:22:20'),
(11, 'Chicken Corn Soup(Half)', 1, 'single', 2, NULL, NULL, 3, NULL, NULL, 'inclusive', 0, NULL, '0011', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 1, NULL, 0, 0, '2022-04-07 07:22:20', '2022-04-07 07:22:20'),
(12, 'Thai Soup(Half)', 1, 'single', 2, NULL, NULL, 3, NULL, NULL, 'inclusive', 0, NULL, '0012', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 1, NULL, 0, 0, '2022-04-07 07:22:20', '2022-04-07 07:22:20'),
(13, 'Mehmaan Khana Special Soup(Full)', 1, 'single', 2, NULL, NULL, 3, NULL, NULL, 'inclusive', 0, NULL, '0013', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 1, NULL, 0, 0, '2022-04-07 07:22:20', '2022-04-07 07:22:20'),
(14, 'Hot & Sour Soup(Full)', 1, 'single', 2, NULL, NULL, 3, NULL, NULL, 'inclusive', 0, NULL, '0014', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 1, NULL, 0, 0, '2022-04-07 07:22:20', '2022-04-07 07:22:20'),
(15, 'Chicken Corn Soup(Full)', 1, 'single', 2, NULL, NULL, 3, NULL, NULL, 'inclusive', 0, NULL, '0015', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 1, NULL, 0, 0, '2022-04-07 07:22:20', '2022-04-07 07:22:20'),
(16, 'Thai Soup(Full)', 1, 'single', 2, NULL, NULL, 3, NULL, NULL, 'inclusive', 0, NULL, '0016', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 1, NULL, 0, 0, '2022-04-07 07:22:20', '2022-04-07 07:22:20'),
(17, 'Al-Fredo Pasta(Half)', 1, 'single', 2, NULL, NULL, 4, NULL, NULL, 'inclusive', 0, NULL, '0017', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 1, NULL, 0, 0, '2022-04-07 07:22:20', '2022-04-07 07:22:20'),
(18, 'Panini Pasta(Half)', 1, 'single', 2, NULL, NULL, 4, NULL, NULL, 'inclusive', 0, NULL, '0018', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 1, NULL, 0, 0, '2022-04-07 07:22:20', '2022-04-07 07:22:20'),
(19, 'Chicken Chowmein(Half)', 1, 'single', 2, NULL, NULL, 4, NULL, NULL, 'inclusive', 0, NULL, '0019', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 1, NULL, 0, 0, '2022-04-07 07:22:20', '2022-04-07 07:22:20'),
(20, 'Vegetable Chowmein(Half)', 1, 'single', 2, NULL, NULL, 4, NULL, NULL, 'inclusive', 0, NULL, '0020', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 1, NULL, 0, 0, '2022-04-07 07:22:20', '2022-04-07 07:22:20'),
(21, 'Al-Fredo Pasta(Full)', 1, 'single', 2, NULL, NULL, 4, NULL, NULL, 'inclusive', 0, NULL, '0021', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 1, NULL, 0, 0, '2022-04-07 07:22:20', '2022-04-07 07:22:20'),
(22, 'Panini Pasta(Full)', 1, 'single', 2, NULL, NULL, 4, NULL, NULL, 'inclusive', 0, NULL, '0022', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 1, NULL, 0, 0, '2022-04-07 07:22:20', '2022-04-07 07:22:20'),
(23, 'Chicken Chowmein(Full)', 1, 'single', 2, NULL, NULL, 4, NULL, NULL, 'inclusive', 0, NULL, '0023', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 1, NULL, 0, 0, '2022-04-07 07:22:20', '2022-04-07 07:22:20'),
(24, 'Vegetable Chowmein(Full)', 1, 'single', 2, NULL, NULL, 4, NULL, NULL, 'inclusive', 0, NULL, '0024', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 1, NULL, 0, 0, '2022-04-07 07:22:20', '2022-04-07 07:22:20'),
(25, 'Mehmaan Khana Sp. Grilled Burger', 1, 'single', 2, NULL, NULL, 5, NULL, NULL, 'inclusive', 0, NULL, '0025', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 1, NULL, 0, 0, '2022-04-07 07:22:20', '2022-04-07 07:22:20'),
(26, 'Chicken Petty Burger', 1, 'single', 2, NULL, NULL, 5, NULL, NULL, 'inclusive', 0, NULL, '0026', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 1, NULL, 0, 0, '2022-04-07 07:22:20', '2022-04-07 07:22:20'),
(27, 'Zinger Burger', 1, 'single', 2, NULL, NULL, 5, NULL, NULL, 'inclusive', 0, NULL, '0027', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 1, NULL, 0, 0, '2022-04-07 07:22:20', '2022-04-07 07:22:20'),
(28, 'Behari Roll', 1, 'single', 2, NULL, NULL, 5, NULL, NULL, 'inclusive', 0, NULL, '0028', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 1, NULL, 0, 0, '2022-04-07 07:22:20', '2022-04-07 07:22:20'),
(29, 'Malai Boti Roll', 1, 'single', 2, NULL, NULL, 5, NULL, NULL, 'inclusive', 0, NULL, '0029', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 1, NULL, 0, 0, '2022-04-07 07:22:20', '2022-04-07 07:22:20'),
(30, 'Kabab Roll', 1, 'single', 2, NULL, NULL, 5, NULL, NULL, 'inclusive', 0, NULL, '0030', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 1, NULL, 0, 0, '2022-04-07 07:22:20', '2022-04-07 07:22:20'),
(31, 'Chicken Cheesy Roll', 1, 'single', 2, NULL, NULL, 5, NULL, NULL, 'inclusive', 0, NULL, '0031', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 1, NULL, 0, 0, '2022-04-07 07:22:20', '2022-04-07 07:22:20'),
(32, 'Nuggets 10 Pcs', 1, 'single', 2, NULL, NULL, 5, NULL, NULL, 'inclusive', 0, NULL, '0032', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 1, NULL, 0, 0, '2022-04-07 07:22:20', '2022-04-07 07:22:20'),
(33, 'Hot Wings 10 Pcs', 1, 'single', 2, NULL, NULL, 5, NULL, NULL, 'inclusive', 0, NULL, '0033', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 1, NULL, 0, 0, '2022-04-07 07:22:20', '2022-04-07 07:22:20'),
(34, 'Chicken Manchurian', 1, 'single', 2, NULL, NULL, 6, NULL, NULL, 'inclusive', 0, NULL, '0034', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 1, NULL, 0, 0, '2022-04-07 07:22:20', '2022-04-07 07:22:20'),
(35, 'Chicken Chilli Dry', 1, 'single', 2, NULL, NULL, 6, NULL, NULL, 'inclusive', 0, NULL, '0035', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 1, NULL, 0, 0, '2022-04-07 07:22:20', '2022-04-07 07:22:20'),
(36, 'Chicken With Almonds', 1, 'single', 2, NULL, NULL, 6, NULL, NULL, 'inclusive', 0, NULL, '0036', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 1, NULL, 0, 0, '2022-04-07 07:22:20', '2022-04-07 07:22:20'),
(37, 'Chicken Pineapple Cherry', 1, 'single', 2, NULL, NULL, 6, NULL, NULL, 'inclusive', 0, NULL, '0037', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 1, NULL, 0, 0, '2022-04-07 07:22:20', '2022-04-07 07:22:20'),
(38, 'Mehmaan Khana Sp. Rice(Half)', 1, 'single', 2, NULL, NULL, 7, NULL, NULL, 'inclusive', 0, NULL, '0038', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 1, NULL, 0, 0, '2022-04-07 07:22:20', '2022-04-07 07:22:20'),
(39, 'Chicken Fried Rice(Half)', 1, 'single', 2, NULL, NULL, 7, NULL, NULL, 'inclusive', 0, NULL, '0039', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 1, NULL, 0, 0, '2022-04-07 07:22:20', '2022-04-07 07:22:20'),
(40, 'Egg Fried Rice(Half)', 1, 'single', 2, NULL, NULL, 7, NULL, NULL, 'inclusive', 0, NULL, '0040', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 1, NULL, 0, 0, '2022-04-07 07:22:20', '2022-04-07 07:22:20'),
(41, 'Vegetable Rice(Half)', 1, 'single', 2, NULL, NULL, 7, NULL, NULL, 'inclusive', 0, NULL, '0041', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 1, NULL, 0, 0, '2022-04-07 07:22:20', '2022-04-07 07:22:20'),
(42, 'Chicken Biryani(Half)', 1, 'single', 2, NULL, NULL, 7, NULL, NULL, 'inclusive', 0, NULL, '0042', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 1, NULL, 0, 0, '2022-04-07 07:22:20', '2022-04-07 07:22:20'),
(43, 'Mehmaan Khana Sp. Rice(Full)', 1, 'single', 2, NULL, NULL, 7, NULL, NULL, 'inclusive', 0, NULL, '0043', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 1, NULL, 0, 0, '2022-04-07 07:22:20', '2022-04-07 07:22:20'),
(44, 'Chicken Fried Rice(Full)', 1, 'single', 2, NULL, NULL, 7, NULL, NULL, 'inclusive', 0, NULL, '0044', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 1, NULL, 0, 0, '2022-04-07 07:22:20', '2022-04-07 07:22:20'),
(45, 'Egg Fried Rice(Full)', 1, 'single', 2, NULL, NULL, 7, NULL, NULL, 'inclusive', 0, NULL, '0045', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 1, NULL, 0, 0, '2022-04-07 07:22:20', '2022-04-07 07:22:20'),
(46, 'Vegetable Rice(Full)', 1, 'single', 2, NULL, NULL, 7, NULL, NULL, 'inclusive', 0, NULL, '0046', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 1, NULL, 0, 0, '2022-04-07 07:22:20', '2022-04-07 07:22:20'),
(47, 'Chicken Biryani(Full)', 1, 'single', 2, NULL, NULL, 7, NULL, NULL, 'inclusive', 0, NULL, '0047', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 1, NULL, 0, 0, '2022-04-07 07:22:20', '2022-04-07 07:22:20'),
(48, 'Mutton Karahi(Half)', 1, 'single', 2, NULL, NULL, 8, NULL, NULL, 'inclusive', 0, NULL, '0048', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 1, NULL, 0, 0, '2022-04-07 07:22:20', '2022-04-07 07:22:20'),
(49, 'Mutton Peshawari Karahi(Half)', 1, 'single', 2, NULL, NULL, 8, NULL, NULL, 'inclusive', 0, NULL, '0049', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 1, NULL, 0, 0, '2022-04-07 07:22:20', '2022-04-07 07:22:20'),
(50, 'Mutton White Karahi(Half)', 1, 'single', 2, NULL, NULL, 8, NULL, NULL, 'inclusive', 0, NULL, '0050', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 1, NULL, 0, 0, '2022-04-07 07:22:20', '2022-04-07 07:22:20'),
(51, 'Batair Karahi(Half)', 1, 'single', 2, NULL, NULL, 8, NULL, NULL, 'inclusive', 0, NULL, '0051', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 1, NULL, 0, 0, '2022-04-07 07:22:20', '2022-04-07 07:22:20'),
(52, 'Beef Karahi(Half)', 1, 'single', 2, NULL, NULL, 8, NULL, NULL, 'inclusive', 0, NULL, '`', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 1, NULL, 0, 0, '2022-04-07 07:22:20', '2022-04-07 07:22:20'),
(53, 'Chicken Karahi(Half)', 1, 'single', 2, NULL, NULL, 8, NULL, NULL, 'inclusive', 0, NULL, '0053', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 1, NULL, 0, 0, '2022-04-07 07:22:21', '2022-04-07 07:22:21'),
(54, 'Chicken White Karahi(Half)', 1, 'single', 2, NULL, NULL, 8, NULL, NULL, 'inclusive', 0, NULL, '0054', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 1, NULL, 0, 0, '2022-04-07 07:22:21', '2022-04-07 07:22:21'),
(55, 'Mehmaan Khana Sp Desi Murgh Karahi(Full)', 1, 'single', 2, NULL, NULL, 8, NULL, NULL, 'inclusive', 0, NULL, '0055', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 1, NULL, 0, 0, '2022-04-07 07:22:21', '2022-04-07 07:22:21'),
(56, 'Mutton Karahi(Full)', 1, 'single', 2, NULL, NULL, 8, NULL, NULL, 'inclusive', 0, NULL, '0056', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 1, NULL, 0, 0, '2022-04-07 07:22:21', '2022-04-07 07:22:21'),
(57, 'Mutton Peshawari Karahi(Full)', 1, 'single', 2, NULL, NULL, 8, NULL, NULL, 'inclusive', 0, NULL, '0057', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 1, NULL, 0, 0, '2022-04-07 07:22:21', '2022-04-07 07:22:21'),
(58, 'Mutton White Karahi(Full)', 1, 'single', 2, NULL, NULL, 8, NULL, NULL, 'inclusive', 0, NULL, '0058', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 1, NULL, 0, 0, '2022-04-07 07:22:21', '2022-04-07 07:22:21'),
(59, 'Batair Karahi(Full)', 1, 'single', 2, NULL, NULL, 8, NULL, NULL, 'inclusive', 0, NULL, '0059', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 1, NULL, 0, 0, '2022-04-07 07:22:21', '2022-04-07 07:22:21'),
(60, 'Beef Karahi(Full)', 1, 'single', 3, '[\"3\",\"4\"]', NULL, 8, NULL, NULL, 'inclusive', 0, '0.0000', '0060', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '1649316833_Zinger-Burger-with-Fries.jpg', NULL, 1, NULL, 0, 0, '2022-04-07 07:22:21', '2022-04-07 07:33:53'),
(61, 'Chicken Karahi(Full)', 1, 'single', 2, NULL, NULL, 8, NULL, NULL, 'inclusive', 0, NULL, '0061', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 1, NULL, 0, 0, '2022-04-07 07:22:21', '2022-04-07 07:22:21'),
(62, 'Chicken White Karahi(Full)', 1, 'single', 2, NULL, NULL, 8, NULL, NULL, 'inclusive', 0, NULL, '0062', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 1, NULL, 0, 0, '2022-04-07 07:22:21', '2022-04-07 07:22:21'),
(63, 'Matka Karahi(Full)', 1, 'single', 2, NULL, NULL, 8, NULL, NULL, 'inclusive', 0, NULL, '0063', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 1, NULL, 0, 0, '2022-04-07 07:22:21', '2022-04-07 07:22:21'),
(64, 'MEHMAN KHANA Sp. Chicken Handi', 1, 'single', 2, NULL, NULL, 9, NULL, NULL, 'inclusive', 0, NULL, '0064', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 1, NULL, 0, 0, '2022-04-07 07:22:21', '2022-04-07 07:22:21'),
(65, 'Chicken White Handi', 1, 'single', 2, NULL, NULL, 9, NULL, NULL, 'inclusive', 0, NULL, '0065', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 1, NULL, 0, 0, '2022-04-07 07:22:21', '2022-04-07 07:22:21'),
(66, 'Chicken Harri Mirch Handi', 1, 'single', 2, NULL, NULL, 9, NULL, NULL, 'inclusive', 0, NULL, '0066', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 1, NULL, 0, 0, '2022-04-07 07:22:21', '2022-04-07 07:22:21'),
(67, 'Chicken Bartha', 1, 'single', 2, NULL, NULL, 9, NULL, NULL, 'inclusive', 0, NULL, '0067', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 1, NULL, 0, 0, '2022-04-07 07:22:21', '2022-04-07 07:22:21'),
(68, 'Chicken Patyalla', 1, 'single', 2, NULL, NULL, 9, NULL, NULL, 'inclusive', 0, NULL, '0068', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 1, NULL, 0, 0, '2022-04-07 07:22:21', '2022-04-07 07:22:21'),
(69, 'Murgh Makkhan', 1, 'single', 2, NULL, NULL, 9, NULL, NULL, 'inclusive', 0, NULL, '0069', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 1, NULL, 0, 0, '2022-04-07 07:22:21', '2022-04-07 07:22:21'),
(70, 'Turkish Tikka Massala', 1, 'single', 2, NULL, NULL, 9, NULL, NULL, 'inclusive', 0, NULL, '0070', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 1, NULL, 0, 0, '2022-04-07 07:22:21', '2022-04-07 07:22:21'),
(71, 'Turkish Kabab Massala', 1, 'single', 2, NULL, NULL, 9, NULL, NULL, 'inclusive', 0, NULL, '0071', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 1, NULL, 0, 0, '2022-04-07 07:22:21', '2022-04-07 07:22:21'),
(72, 'Chicken Hyderabadi', 1, 'single', 2, NULL, NULL, 9, NULL, NULL, 'inclusive', 0, NULL, '0072', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 1, NULL, 0, 0, '2022-04-07 07:22:21', '2022-04-07 07:22:21'),
(73, 'Daal Maash', 1, 'single', 2, NULL, NULL, 9, NULL, NULL, 'inclusive', 0, NULL, '0073', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 1, NULL, 0, 0, '2022-04-07 07:22:21', '2022-04-07 07:22:21'),
(74, 'MEHMAAN KHANA Sp. Fruit Salad', 1, 'single', 2, NULL, NULL, 10, NULL, NULL, 'inclusive', 0, NULL, '0074', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 1, NULL, 0, 0, '2022-04-07 07:22:21', '2022-04-07 07:22:21'),
(75, 'Russian Salad', 1, 'single', 2, NULL, NULL, 10, NULL, NULL, 'inclusive', 0, NULL, '0075', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 1, NULL, 0, 0, '2022-04-07 07:22:21', '2022-04-07 07:22:21'),
(76, 'Kachumar Salad', 1, 'single', 2, NULL, NULL, 10, NULL, NULL, 'inclusive', 0, NULL, '0076', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 1, NULL, 0, 0, '2022-04-07 07:22:21', '2022-04-07 07:22:21'),
(77, 'Fresh Salad', 1, 'single', 2, NULL, NULL, 10, NULL, NULL, 'inclusive', 0, NULL, '0077', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 1, NULL, 0, 0, '2022-04-07 07:22:21', '2022-04-07 07:22:21'),
(78, 'Nestle Raita (Mint/Zeera)', 1, 'single', 2, NULL, NULL, 10, NULL, NULL, 'inclusive', 0, NULL, '0078', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 1, NULL, 0, 0, '2022-04-07 07:22:21', '2022-04-07 07:22:21'),
(79, 'Fresh Raita Zeera', 1, 'single', 2, NULL, NULL, 10, NULL, NULL, 'inclusive', 0, NULL, '0079', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 1, NULL, 0, 0, '2022-04-07 07:22:21', '2022-04-07 07:22:21'),
(80, 'Fresh Raita Mint', 1, 'single', 2, NULL, NULL, 10, NULL, NULL, 'inclusive', 0, NULL, '0080', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 1, NULL, 0, 0, '2022-04-07 07:22:21', '2022-04-07 07:22:21'),
(81, 'Kastoori Boti (4 Pcs)', 1, 'single', 2, NULL, NULL, 11, NULL, NULL, 'inclusive', 0, NULL, '0081', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 1, NULL, 0, 0, '2022-04-07 07:22:21', '2022-04-07 07:22:21'),
(82, 'Behari Boti (4 Pcs)', 1, 'single', 2, NULL, NULL, 11, NULL, NULL, 'inclusive', 0, NULL, '0082', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 1, NULL, 0, 0, '2022-04-07 07:22:21', '2022-04-07 07:22:21'),
(83, 'Malai Boti (4 Pcs)', 1, 'single', 2, NULL, NULL, 11, NULL, NULL, 'inclusive', 0, NULL, '0083', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 1, NULL, 0, 0, '2022-04-07 07:22:21', '2022-04-07 07:22:21'),
(84, 'Afghani Boti (4 Pcs)', 1, 'single', 2, NULL, NULL, 11, NULL, NULL, 'inclusive', 0, NULL, '0084', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 1, NULL, 0, 0, '2022-04-07 07:22:21', '2022-04-07 07:22:21'),
(85, 'Tikka Boti (4 Pcs)', 1, 'single', 2, NULL, NULL, 11, NULL, NULL, 'inclusive', 0, NULL, '0085', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 1, NULL, 0, 0, '2022-04-07 07:22:21', '2022-04-07 07:22:21'),
(86, 'Mehmaan Khana Special Boti (5pcs)', 1, 'single', 2, NULL, NULL, 11, NULL, NULL, 'inclusive', 0, NULL, '0086', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 1, NULL, 0, 0, '2022-04-07 07:22:21', '2022-04-07 07:22:21'),
(87, 'Reshmi Kabab (1 Seekh)', 1, 'single', 2, NULL, NULL, 11, NULL, NULL, 'inclusive', 0, NULL, '0087', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 1, NULL, 0, 0, '2022-04-07 07:22:21', '2022-04-07 07:22:21'),
(88, 'Makhmali Kabab (1 Seekh)', 1, 'single', 2, NULL, NULL, 11, NULL, NULL, 'inclusive', 0, NULL, '0088', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 1, NULL, 0, 0, '2022-04-07 07:22:21', '2022-04-07 07:22:21'),
(89, 'Pizza Kabab (1 Seekh)', 1, 'single', 2, NULL, NULL, 11, NULL, NULL, 'inclusive', 0, NULL, '0089', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 1, NULL, 0, 0, '2022-04-07 07:22:21', '2022-04-07 07:22:21'),
(90, 'Gola Kabab (1 Seekh)', 1, 'single', 2, NULL, NULL, 11, NULL, NULL, 'inclusive', 0, NULL, '0090', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 1, NULL, 0, 0, '2022-04-07 07:22:21', '2022-04-07 07:22:21'),
(91, 'Beef Kabab (1 Seekh)', 1, 'single', 2, NULL, NULL, 11, NULL, NULL, 'inclusive', 0, NULL, '0091', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 1, NULL, 0, 0, '2022-04-07 07:22:21', '2022-04-07 07:22:21'),
(92, 'Mutton Kabab (1 Seekh)', 1, 'single', 2, NULL, NULL, 11, NULL, NULL, 'inclusive', 0, NULL, '0092', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 1, NULL, 0, 0, '2022-04-07 07:22:21', '2022-04-07 07:22:21'),
(93, 'Fish Tikka (1 Seekh)', 1, 'single', 2, NULL, NULL, 11, NULL, NULL, 'inclusive', 0, NULL, '0093', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 1, NULL, 0, 0, '2022-04-07 07:22:21', '2022-04-07 07:22:21'),
(94, 'Qalmi Tikka (6 Pcs)', 1, 'single', 2, NULL, NULL, 11, NULL, NULL, 'inclusive', 0, NULL, '0094', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 1, NULL, 0, 0, '2022-04-07 07:22:21', '2022-04-07 07:22:21'),
(95, 'Batair Tikka (5 Pcs)', 1, 'single', 2, NULL, NULL, 11, NULL, NULL, 'inclusive', 0, NULL, '0095', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 1, NULL, 0, 0, '2022-04-07 07:22:21', '2022-04-07 07:22:21'),
(96, 'Grilled Fish (1-KG)', 1, 'single', 2, NULL, NULL, 11, NULL, NULL, 'inclusive', 0, NULL, '0096', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 1, NULL, 0, 0, '2022-04-07 07:22:21', '2022-04-07 07:22:21'),
(97, 'Tikka Piece (Leg)', 1, 'single', 2, NULL, NULL, 11, NULL, NULL, 'inclusive', 0, NULL, '0097', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 1, NULL, 0, 0, '2022-04-07 07:22:21', '2022-04-07 07:22:21'),
(98, 'Tikka Piece (Chest)', 1, 'single', 2, NULL, NULL, 11, NULL, NULL, 'inclusive', 0, NULL, '0098', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 1, NULL, 0, 0, '2022-04-07 07:22:21', '2022-04-07 07:22:21'),
(99, 'Behari Tikka Piece (Leg)', 1, 'single', 2, NULL, NULL, 11, NULL, NULL, 'inclusive', 0, NULL, '0099', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 1, NULL, 0, 0, '2022-04-07 07:22:21', '2022-04-07 07:22:21'),
(100, 'Behari Tikka Piece (Chest)', 1, 'single', 2, NULL, NULL, 11, NULL, NULL, 'inclusive', 0, NULL, '0100', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 1, NULL, 0, 0, '2022-04-07 07:22:21', '2022-04-07 07:22:21'),
(101, 'Malai Tikka Piece (Leg)', 1, 'single', 2, NULL, NULL, 11, NULL, NULL, 'inclusive', 0, NULL, '0101', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 1, NULL, 0, 0, '2022-04-07 07:22:21', '2022-04-07 07:22:21'),
(102, 'Malai Tikka Piece (Chest)', 1, 'single', 2, NULL, NULL, 11, NULL, NULL, 'inclusive', 0, NULL, '0102', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 1, NULL, 0, 0, '2022-04-07 07:22:21', '2022-04-07 07:22:21'),
(103, 'MEHMAAN KHANA Sp. Piece (Leg)', 1, 'single', 2, NULL, NULL, 11, NULL, NULL, 'inclusive', 0, NULL, '0103', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 1, NULL, 0, 0, '2022-04-07 07:22:21', '2022-04-07 07:22:21'),
(104, 'MEHMAAN KHANA Sp. Piece (Chest)', 1, 'single', 2, NULL, NULL, 11, NULL, NULL, 'inclusive', 0, NULL, '0104', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 1, NULL, 0, 0, '2022-04-07 07:22:21', '2022-04-07 07:22:21'),
(105, 'MEHMAAN KHANA Sp. Platter', 1, 'single', 2, NULL, NULL, 11, NULL, NULL, 'inclusive', 0, NULL, '0105', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 1, NULL, 0, 0, '2022-04-07 07:22:21', '2022-04-07 07:22:21'),
(106, 'MEHMAAN KHANA Sp. Jumbo platter', 1, 'single', 2, NULL, NULL, 11, NULL, NULL, 'inclusive', 0, NULL, '0106', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 1, NULL, 0, 0, '2022-04-07 07:22:21', '2022-04-07 07:22:21'),
(107, 'Roghani Naan', 1, 'single', 2, NULL, NULL, 12, NULL, NULL, 'inclusive', 0, NULL, '0107', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 1, NULL, 0, 0, '2022-04-07 07:22:21', '2022-04-07 07:22:21'),
(108, 'Garlic Naan', 1, 'single', 2, NULL, NULL, 12, NULL, NULL, 'inclusive', 0, NULL, '0108', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 1, NULL, 0, 0, '2022-04-07 07:22:21', '2022-04-07 07:22:21'),
(109, 'Kalwanji Naan', 1, 'single', 2, NULL, NULL, 12, NULL, NULL, 'inclusive', 0, NULL, '0109', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 1, NULL, 0, 0, '2022-04-07 07:22:21', '2022-04-07 07:22:21'),
(110, 'Achari Naan', 1, 'single', 2, NULL, NULL, 12, NULL, NULL, 'inclusive', 0, NULL, '0110', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 1, NULL, 0, 0, '2022-04-07 07:22:21', '2022-04-07 07:22:21'),
(111, 'Cheese Naan', 1, 'single', 2, NULL, NULL, 12, NULL, NULL, 'inclusive', 0, NULL, '0111', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 1, NULL, 0, 0, '2022-04-07 07:22:21', '2022-04-07 07:22:21'),
(112, 'Ginger Naan', 1, 'single', 2, NULL, NULL, 12, NULL, NULL, 'inclusive', 0, NULL, '0112', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 1, NULL, 0, 0, '2022-04-07 07:22:21', '2022-04-07 07:22:22'),
(113, 'Fajitaa Naan', 1, 'single', 2, NULL, NULL, 12, NULL, NULL, 'inclusive', 0, NULL, '0113', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 1, NULL, 0, 0, '2022-04-07 07:22:22', '2022-04-07 07:22:22'),
(114, 'Tikka Naan', 1, 'single', 2, NULL, NULL, 12, NULL, NULL, 'inclusive', 0, NULL, '0114', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 1, NULL, 0, 0, '2022-04-07 07:22:22', '2022-04-07 07:22:22'),
(115, 'Chicken Cheese Paratha', 1, 'single', 2, NULL, NULL, 12, NULL, NULL, 'inclusive', 0, NULL, '0115', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 1, NULL, 0, 0, '2022-04-07 07:22:22', '2022-04-07 07:22:22'),
(116, 'Pizza Paratha', 1, 'single', 2, NULL, NULL, 12, NULL, NULL, 'inclusive', 0, NULL, '0116', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 1, NULL, 0, 0, '2022-04-07 07:22:22', '2022-04-07 07:22:22'),
(117, 'Fajita Paratha', 1, 'single', 2, NULL, NULL, 12, NULL, NULL, 'inclusive', 0, NULL, '0117', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 1, NULL, 0, 0, '2022-04-07 07:22:22', '2022-04-07 07:22:22'),
(118, 'Tandoori Paratha', 1, 'single', 2, NULL, NULL, 12, NULL, NULL, 'inclusive', 0, NULL, '0118', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 1, NULL, 0, 0, '2022-04-07 07:22:22', '2022-04-07 07:22:22'),
(119, 'Chicken Paratha', 1, 'single', 2, NULL, NULL, 12, NULL, NULL, 'inclusive', 0, NULL, '0119', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 1, NULL, 0, 0, '2022-04-07 07:22:22', '2022-04-07 07:22:22'),
(120, 'Aloo Paratha', 1, 'single', 2, NULL, NULL, 12, NULL, NULL, 'inclusive', 0, NULL, '0120', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 1, NULL, 0, 0, '2022-04-07 07:22:22', '2022-04-07 07:22:22'),
(121, 'Achari Paratha', 1, 'single', 2, NULL, NULL, 12, NULL, NULL, 'inclusive', 0, NULL, '0121', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 1, NULL, 0, 0, '2022-04-07 07:22:22', '2022-04-07 07:22:22'),
(122, 'Rot', 1, 'single', 2, NULL, NULL, 12, NULL, NULL, 'inclusive', 0, NULL, '0122', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 1, NULL, 0, 0, '2022-04-07 07:22:22', '2022-04-07 07:22:22'),
(123, 'Pina Colada', 1, 'single', 2, NULL, NULL, 13, 14, NULL, 'inclusive', 0, NULL, '0123', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 1, NULL, 0, 0, '2022-04-07 07:22:22', '2022-04-07 07:22:22'),
(124, 'Strawberry Colada', 1, 'single', 2, NULL, NULL, 13, 14, NULL, 'inclusive', 0, NULL, '0124', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 1, NULL, 0, 0, '2022-04-07 07:22:22', '2022-04-07 07:22:22'),
(125, 'Blue Lagoon', 1, 'single', 2, NULL, NULL, 13, 14, NULL, 'inclusive', 0, NULL, '0125', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 1, NULL, 0, 0, '2022-04-07 07:22:22', '2022-04-07 07:22:22'),
(126, 'Berry Queen', 1, 'single', 2, NULL, NULL, 13, 14, NULL, 'inclusive', 0, NULL, '0126', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 1, NULL, 0, 0, '2022-04-07 07:22:22', '2022-04-07 07:22:22'),
(127, 'Maxberry', 1, 'single', 2, NULL, NULL, 13, 14, NULL, 'inclusive', 0, NULL, '0127', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 1, NULL, 0, 0, '2022-04-07 07:22:22', '2022-04-07 07:22:22'),
(128, 'Strawberry Smoothie', 1, 'single', 2, NULL, NULL, 13, 15, NULL, 'inclusive', 0, NULL, '0128', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 1, NULL, 0, 0, '2022-04-07 07:22:22', '2022-04-07 07:22:22'),
(129, 'Banana Smoothie', 1, 'single', 2, NULL, NULL, 13, 15, NULL, 'inclusive', 0, NULL, '0129', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 1, NULL, 0, 0, '2022-04-07 07:22:22', '2022-04-07 07:22:22'),
(130, 'Lychee Smoothie', 1, 'single', 2, NULL, NULL, 13, 15, NULL, 'inclusive', 0, NULL, '0130', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 1, NULL, 0, 0, '2022-04-07 07:22:22', '2022-04-07 07:22:22'),
(131, 'Pine Apple Smoothie', 1, 'single', 2, NULL, NULL, 13, 15, NULL, 'inclusive', 0, NULL, '0131', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 1, NULL, 0, 0, '2022-04-07 07:22:22', '2022-04-07 07:22:22'),
(132, 'Vanilla Smoothie', 1, 'single', 2, NULL, NULL, 13, 15, NULL, 'inclusive', 0, NULL, '0132', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 1, NULL, 0, 0, '2022-04-07 07:22:22', '2022-04-07 07:22:22'),
(133, 'Spanish Mint Margarita', 1, 'single', 2, NULL, NULL, 13, 16, NULL, 'inclusive', 0, NULL, '0133', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 1, NULL, 0, 0, '2022-04-07 07:22:22', '2022-04-07 07:22:22'),
(134, 'Blue Berry Margarita', 1, 'single', 2, NULL, NULL, 13, 16, NULL, 'inclusive', 0, NULL, '0134', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 1, NULL, 0, 0, '2022-04-07 07:22:22', '2022-04-07 07:22:22'),
(135, 'Strawberry Margarita', 1, 'single', 2, NULL, NULL, 13, 16, NULL, 'inclusive', 0, NULL, '0135', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 1, NULL, 0, 0, '2022-04-07 07:22:22', '2022-04-07 07:22:22'),
(136, 'Lemonade Margarita', 1, 'single', 2, NULL, NULL, 13, 16, NULL, 'inclusive', 0, NULL, '0136', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 1, NULL, 0, 0, '2022-04-07 07:22:22', '2022-04-07 07:22:22'),
(137, 'Strawberry Slush', 1, 'single', 2, NULL, NULL, 13, 17, NULL, 'inclusive', 0, NULL, '0137', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 1, NULL, 0, 0, '2022-04-07 07:22:22', '2022-04-07 07:22:22'),
(138, 'Blueberry Slush', 1, 'single', 2, NULL, NULL, 13, 17, NULL, 'inclusive', 0, NULL, '0138', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 1, NULL, 0, 0, '2022-04-07 07:22:22', '2022-04-07 07:22:22'),
(139, 'Lemonade Slush', 1, 'single', 2, NULL, NULL, 13, 17, NULL, 'inclusive', 0, NULL, '0139', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 1, NULL, 0, 0, '2022-04-07 07:22:22', '2022-04-07 07:22:22'),
(140, 'Pine Apple Slush', 1, 'single', 2, NULL, NULL, 13, 17, NULL, 'inclusive', 0, NULL, '0140', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 1, NULL, 0, 0, '2022-04-07 07:22:22', '2022-04-07 07:22:22'),
(141, 'Maxberry Slush', 1, 'single', 2, NULL, NULL, 13, 17, NULL, 'inclusive', 0, NULL, '0141', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 1, NULL, 0, 0, '2022-04-07 07:22:22', '2022-04-07 07:22:22'),
(142, 'Banana Shake', 1, 'single', 2, NULL, NULL, 13, 18, NULL, 'inclusive', 0, NULL, '0142', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 1, NULL, 0, 0, '2022-04-07 07:22:22', '2022-04-07 07:22:22'),
(143, 'Mango Shake', 1, 'single', 2, NULL, NULL, 13, 18, NULL, 'inclusive', 0, NULL, '0143', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 1, NULL, 0, 0, '2022-04-07 07:22:22', '2022-04-07 07:22:22'),
(144, 'Apple Shake', 1, 'single', 2, NULL, NULL, 13, 18, NULL, 'inclusive', 0, NULL, '0144', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 1, NULL, 0, 0, '2022-04-07 07:22:22', '2022-04-07 07:22:22'),
(145, 'Strawberry Shake', 1, 'single', 2, NULL, NULL, 13, 18, NULL, 'inclusive', 0, NULL, '0145', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 1, NULL, 0, 0, '2022-04-07 07:22:22', '2022-04-07 07:22:22'),
(146, 'Pine Apple Shake', 1, 'single', 2, NULL, NULL, 13, 18, NULL, 'inclusive', 0, NULL, '0146', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 1, NULL, 0, 0, '2022-04-07 07:22:22', '2022-04-07 07:22:22'),
(147, 'Cocktail Special Punch', 1, 'single', 2, NULL, NULL, 13, 18, NULL, 'inclusive', 0, NULL, '0147', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 1, NULL, 0, 0, '2022-04-07 07:22:22', '2022-04-07 07:22:22'),
(148, 'Khoya Khajoor Shake', 1, 'single', 2, NULL, NULL, 13, 18, NULL, 'inclusive', 0, NULL, '0148', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 1, NULL, 0, 0, '2022-04-07 07:22:22', '2022-04-07 07:22:22'),
(149, 'Badam Shake', 1, 'single', 2, NULL, NULL, 13, 18, NULL, 'inclusive', 0, NULL, '0149', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 1, NULL, 0, 0, '2022-04-07 07:22:22', '2022-04-07 07:22:22'),
(150, 'Kajoo Shake', 1, 'single', 2, NULL, NULL, 13, 18, NULL, 'inclusive', 0, NULL, '0150', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 1, NULL, 0, 0, '2022-04-07 07:22:22', '2022-04-07 07:22:22'),
(151, 'Injeer Shake', 1, 'single', 2, NULL, NULL, 13, 18, NULL, 'inclusive', 0, NULL, '0151', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 1, NULL, 0, 0, '2022-04-07 07:22:22', '2022-04-07 07:22:22'),
(152, 'Apple Juice', 1, 'single', 2, NULL, NULL, 13, 19, NULL, 'inclusive', 0, NULL, '0152', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 1, NULL, 0, 0, '2022-04-07 07:22:22', '2022-04-07 07:22:22'),
(153, 'Pine Apple Juice', 1, 'single', 2, NULL, NULL, 13, 19, NULL, 'inclusive', 0, NULL, '0153', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 1, NULL, 0, 0, '2022-04-07 07:22:22', '2022-04-07 07:22:22'),
(154, 'Anaar Juice', 1, 'single', 2, NULL, NULL, 13, 19, NULL, 'inclusive', 0, NULL, '0154', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 1, NULL, 0, 0, '2022-04-07 07:22:22', '2022-04-07 07:22:22'),
(155, 'Guava Juice', 1, 'single', 2, NULL, NULL, 13, 19, NULL, 'inclusive', 0, NULL, '0155', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 1, NULL, 0, 0, '2022-04-07 07:22:22', '2022-04-07 07:22:22'),
(156, 'Mehmaan Khana Special Chai', 1, 'single', 2, NULL, NULL, 13, 20, NULL, 'inclusive', 0, NULL, '0156', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 1, NULL, 0, 0, '2022-04-07 07:22:22', '2022-04-07 07:22:22'),
(157, 'Gurr Wali Chai', 1, 'single', 2, NULL, NULL, 13, 20, NULL, 'inclusive', 0, NULL, '0157', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 1, NULL, 0, 0, '2022-04-07 07:22:22', '2022-04-07 07:22:22'),
(158, 'Shakkar Wali Chai', 1, 'single', 2, NULL, NULL, 13, 20, NULL, 'inclusive', 0, NULL, '0158', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 1, NULL, 0, 0, '2022-04-07 07:22:22', '2022-04-07 07:22:22'),
(159, 'Kashmiri Chai', 1, 'single', 2, NULL, NULL, 13, 20, NULL, 'inclusive', 0, NULL, '0159', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 1, NULL, 0, 0, '2022-04-07 07:22:22', '2022-04-07 07:22:22'),
(160, 'Green Tea', 1, 'single', 2, NULL, NULL, 13, 20, NULL, 'inclusive', 0, NULL, '0160', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 1, NULL, 0, 0, '2022-04-07 07:22:22', '2022-04-07 07:22:22'),
(161, 'Peshawri Qawa', 1, 'single', 2, NULL, NULL, 13, 20, NULL, 'inclusive', 0, NULL, '0161', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 1, NULL, 0, 0, '2022-04-07 07:22:22', '2022-04-07 07:22:22'),
(162, 'Cold Drink', 1, 'single', 2, NULL, NULL, 13, 20, NULL, 'inclusive', 1, '0.0000', '0162', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '', NULL, 1, NULL, 0, 0, '2022-04-07 07:22:22', '2022-04-07 07:43:57'),
(163, 'Mineral Water', 1, 'single', 2, NULL, NULL, 13, 20, NULL, 'inclusive', 0, NULL, '0163', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 1, NULL, 0, 0, '2022-04-07 07:22:22', '2022-04-07 07:22:22'),
(164, 'Mineral Water Small', 1, 'single', 2, NULL, NULL, 13, 20, NULL, 'inclusive', 0, NULL, '0164', 'C128', NULL, NULL, 0, '', '', '', '', '', '', NULL, 1, NULL, 0, 0, '2022-04-07 07:22:22', '2022-04-07 07:22:22'),
(165, 'Extra Toping', 1, 'modifier', NULL, NULL, NULL, NULL, NULL, NULL, 'inclusive', 0, NULL, '0165', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-04-07 07:26:23', '2022-04-07 07:26:23'),
(166, 'Add on', 1, 'modifier', NULL, NULL, NULL, NULL, NULL, NULL, 'inclusive', 0, NULL, '0166', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-04-07 07:27:14', '2022-04-07 07:27:14'),
(167, 'Family Deal', 1, 'combo', 2, NULL, NULL, NULL, NULL, NULL, 'exclusive', 0, '0.0000', 'FD01', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2022-04-07 07:41:45', '2022-04-07 07:41:45');

-- --------------------------------------------------------

--
-- Table structure for table `product_locations`
--

CREATE TABLE `product_locations` (
  `product_id` int(11) NOT NULL,
  `location_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_locations`
--

INSERT INTO `product_locations` (`product_id`, `location_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(32, 1),
(33, 1),
(34, 1),
(35, 1),
(36, 1),
(37, 1),
(38, 1),
(39, 1),
(40, 1),
(41, 1),
(42, 1),
(43, 1),
(44, 1),
(45, 1),
(46, 1),
(47, 1),
(48, 1),
(49, 1),
(50, 1),
(51, 1),
(52, 1),
(53, 1),
(54, 1),
(55, 1),
(56, 1),
(57, 1),
(58, 1),
(59, 1),
(60, 1),
(61, 1),
(62, 1),
(63, 1),
(64, 1),
(65, 1),
(66, 1),
(67, 1),
(68, 1),
(69, 1),
(70, 1),
(71, 1),
(72, 1),
(73, 1),
(74, 1),
(75, 1),
(76, 1),
(77, 1),
(78, 1),
(79, 1),
(80, 1),
(81, 1),
(82, 1),
(83, 1),
(84, 1),
(85, 1),
(86, 1),
(87, 1),
(88, 1),
(89, 1),
(90, 1),
(91, 1),
(92, 1),
(93, 1),
(94, 1),
(95, 1),
(96, 1),
(97, 1),
(98, 1),
(99, 1),
(100, 1),
(101, 1),
(102, 1),
(103, 1),
(104, 1),
(105, 1),
(106, 1),
(107, 1),
(108, 1),
(109, 1),
(110, 1),
(111, 1),
(112, 1),
(113, 1),
(114, 1),
(115, 1),
(116, 1),
(117, 1),
(118, 1),
(119, 1),
(120, 1),
(121, 1),
(122, 1),
(123, 1),
(124, 1),
(125, 1),
(126, 1),
(127, 1),
(128, 1),
(129, 1),
(130, 1),
(131, 1),
(132, 1),
(133, 1),
(134, 1),
(135, 1),
(136, 1),
(137, 1),
(138, 1),
(139, 1),
(140, 1),
(141, 1),
(142, 1),
(143, 1),
(144, 1),
(145, 1),
(146, 1),
(147, 1),
(148, 1),
(149, 1),
(150, 1),
(151, 1),
(152, 1),
(153, 1),
(154, 1),
(155, 1),
(156, 1),
(157, 1),
(158, 1),
(159, 1),
(160, 1),
(161, 1),
(162, 1),
(163, 1),
(164, 1),
(167, 1);

-- --------------------------------------------------------

--
-- Table structure for table `product_racks`
--

CREATE TABLE `product_racks` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `location_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `rack` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `row` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_variations`
--

CREATE TABLE `product_variations` (
  `id` int(10) UNSIGNED NOT NULL,
  `variation_template_id` int(11) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `is_dummy` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_variations`
--

INSERT INTO `product_variations` (`id`, `variation_template_id`, `name`, `product_id`, `is_dummy`, `created_at`, `updated_at`) VALUES
(1, NULL, 'DUMMY', 1, 1, '2022-04-07 07:22:20', '2022-04-07 07:22:20'),
(2, NULL, 'DUMMY', 2, 1, '2022-04-07 07:22:20', '2022-04-07 07:22:20'),
(3, NULL, 'DUMMY', 3, 1, '2022-04-07 07:22:20', '2022-04-07 07:22:20'),
(4, NULL, 'DUMMY', 4, 1, '2022-04-07 07:22:20', '2022-04-07 07:22:20'),
(5, NULL, 'DUMMY', 5, 1, '2022-04-07 07:22:20', '2022-04-07 07:22:20'),
(6, NULL, 'DUMMY', 6, 1, '2022-04-07 07:22:20', '2022-04-07 07:22:20'),
(7, 1, 'fish', 7, 0, '2022-04-07 07:22:20', '2022-04-07 07:22:20'),
(8, NULL, 'DUMMY', 8, 1, '2022-04-07 07:22:20', '2022-04-07 07:22:20'),
(9, NULL, 'DUMMY', 9, 1, '2022-04-07 07:22:20', '2022-04-07 07:22:20'),
(10, NULL, 'DUMMY', 10, 1, '2022-04-07 07:22:20', '2022-04-07 07:22:20'),
(11, NULL, 'DUMMY', 11, 1, '2022-04-07 07:22:20', '2022-04-07 07:22:20'),
(12, NULL, 'DUMMY', 12, 1, '2022-04-07 07:22:20', '2022-04-07 07:22:20'),
(13, NULL, 'DUMMY', 13, 1, '2022-04-07 07:22:20', '2022-04-07 07:22:20'),
(14, NULL, 'DUMMY', 14, 1, '2022-04-07 07:22:20', '2022-04-07 07:22:20'),
(15, NULL, 'DUMMY', 15, 1, '2022-04-07 07:22:20', '2022-04-07 07:22:20'),
(16, NULL, 'DUMMY', 16, 1, '2022-04-07 07:22:20', '2022-04-07 07:22:20'),
(17, NULL, 'DUMMY', 17, 1, '2022-04-07 07:22:20', '2022-04-07 07:22:20'),
(18, NULL, 'DUMMY', 18, 1, '2022-04-07 07:22:20', '2022-04-07 07:22:20'),
(19, NULL, 'DUMMY', 19, 1, '2022-04-07 07:22:20', '2022-04-07 07:22:20'),
(20, NULL, 'DUMMY', 20, 1, '2022-04-07 07:22:20', '2022-04-07 07:22:20'),
(21, NULL, 'DUMMY', 21, 1, '2022-04-07 07:22:20', '2022-04-07 07:22:20'),
(22, NULL, 'DUMMY', 22, 1, '2022-04-07 07:22:20', '2022-04-07 07:22:20'),
(23, NULL, 'DUMMY', 23, 1, '2022-04-07 07:22:20', '2022-04-07 07:22:20'),
(24, NULL, 'DUMMY', 24, 1, '2022-04-07 07:22:20', '2022-04-07 07:22:20'),
(25, NULL, 'DUMMY', 25, 1, '2022-04-07 07:22:20', '2022-04-07 07:22:20'),
(26, NULL, 'DUMMY', 26, 1, '2022-04-07 07:22:20', '2022-04-07 07:22:20'),
(27, NULL, 'DUMMY', 27, 1, '2022-04-07 07:22:20', '2022-04-07 07:22:20'),
(28, NULL, 'DUMMY', 28, 1, '2022-04-07 07:22:20', '2022-04-07 07:22:20'),
(29, NULL, 'DUMMY', 29, 1, '2022-04-07 07:22:20', '2022-04-07 07:22:20'),
(30, NULL, 'DUMMY', 30, 1, '2022-04-07 07:22:20', '2022-04-07 07:22:20'),
(31, NULL, 'DUMMY', 31, 1, '2022-04-07 07:22:20', '2022-04-07 07:22:20'),
(32, NULL, 'DUMMY', 32, 1, '2022-04-07 07:22:20', '2022-04-07 07:22:20'),
(33, NULL, 'DUMMY', 33, 1, '2022-04-07 07:22:20', '2022-04-07 07:22:20'),
(34, NULL, 'DUMMY', 34, 1, '2022-04-07 07:22:20', '2022-04-07 07:22:20'),
(35, NULL, 'DUMMY', 35, 1, '2022-04-07 07:22:20', '2022-04-07 07:22:20'),
(36, NULL, 'DUMMY', 36, 1, '2022-04-07 07:22:20', '2022-04-07 07:22:20'),
(37, NULL, 'DUMMY', 37, 1, '2022-04-07 07:22:20', '2022-04-07 07:22:20'),
(38, NULL, 'DUMMY', 38, 1, '2022-04-07 07:22:20', '2022-04-07 07:22:20'),
(39, NULL, 'DUMMY', 39, 1, '2022-04-07 07:22:20', '2022-04-07 07:22:20'),
(40, NULL, 'DUMMY', 40, 1, '2022-04-07 07:22:20', '2022-04-07 07:22:20'),
(41, NULL, 'DUMMY', 41, 1, '2022-04-07 07:22:20', '2022-04-07 07:22:20'),
(42, NULL, 'DUMMY', 42, 1, '2022-04-07 07:22:20', '2022-04-07 07:22:20'),
(43, NULL, 'DUMMY', 43, 1, '2022-04-07 07:22:20', '2022-04-07 07:22:20'),
(44, NULL, 'DUMMY', 44, 1, '2022-04-07 07:22:20', '2022-04-07 07:22:20'),
(45, NULL, 'DUMMY', 45, 1, '2022-04-07 07:22:20', '2022-04-07 07:22:20'),
(46, NULL, 'DUMMY', 46, 1, '2022-04-07 07:22:20', '2022-04-07 07:22:20'),
(47, NULL, 'DUMMY', 47, 1, '2022-04-07 07:22:20', '2022-04-07 07:22:20'),
(48, NULL, 'DUMMY', 48, 1, '2022-04-07 07:22:20', '2022-04-07 07:22:20'),
(49, NULL, 'DUMMY', 49, 1, '2022-04-07 07:22:20', '2022-04-07 07:22:20'),
(50, NULL, 'DUMMY', 50, 1, '2022-04-07 07:22:20', '2022-04-07 07:22:20'),
(51, NULL, 'DUMMY', 51, 1, '2022-04-07 07:22:20', '2022-04-07 07:22:20'),
(52, NULL, 'DUMMY', 52, 1, '2022-04-07 07:22:20', '2022-04-07 07:22:20'),
(53, NULL, 'DUMMY', 53, 1, '2022-04-07 07:22:21', '2022-04-07 07:22:21'),
(54, NULL, 'DUMMY', 54, 1, '2022-04-07 07:22:21', '2022-04-07 07:22:21'),
(55, NULL, 'DUMMY', 55, 1, '2022-04-07 07:22:21', '2022-04-07 07:22:21'),
(56, NULL, 'DUMMY', 56, 1, '2022-04-07 07:22:21', '2022-04-07 07:22:21'),
(57, NULL, 'DUMMY', 57, 1, '2022-04-07 07:22:21', '2022-04-07 07:22:21'),
(58, NULL, 'DUMMY', 58, 1, '2022-04-07 07:22:21', '2022-04-07 07:22:21'),
(59, NULL, 'DUMMY', 59, 1, '2022-04-07 07:22:21', '2022-04-07 07:22:21'),
(60, NULL, 'DUMMY', 60, 1, '2022-04-07 07:22:21', '2022-04-07 07:22:21'),
(61, NULL, 'DUMMY', 61, 1, '2022-04-07 07:22:21', '2022-04-07 07:22:21'),
(62, NULL, 'DUMMY', 62, 1, '2022-04-07 07:22:21', '2022-04-07 07:22:21'),
(63, NULL, 'DUMMY', 63, 1, '2022-04-07 07:22:21', '2022-04-07 07:22:21'),
(64, NULL, 'DUMMY', 64, 1, '2022-04-07 07:22:21', '2022-04-07 07:22:21'),
(65, NULL, 'DUMMY', 65, 1, '2022-04-07 07:22:21', '2022-04-07 07:22:21'),
(66, NULL, 'DUMMY', 66, 1, '2022-04-07 07:22:21', '2022-04-07 07:22:21'),
(67, NULL, 'DUMMY', 67, 1, '2022-04-07 07:22:21', '2022-04-07 07:22:21'),
(68, NULL, 'DUMMY', 68, 1, '2022-04-07 07:22:21', '2022-04-07 07:22:21'),
(69, NULL, 'DUMMY', 69, 1, '2022-04-07 07:22:21', '2022-04-07 07:22:21'),
(70, NULL, 'DUMMY', 70, 1, '2022-04-07 07:22:21', '2022-04-07 07:22:21'),
(71, NULL, 'DUMMY', 71, 1, '2022-04-07 07:22:21', '2022-04-07 07:22:21'),
(72, NULL, 'DUMMY', 72, 1, '2022-04-07 07:22:21', '2022-04-07 07:22:21'),
(73, NULL, 'DUMMY', 73, 1, '2022-04-07 07:22:21', '2022-04-07 07:22:21'),
(74, NULL, 'DUMMY', 74, 1, '2022-04-07 07:22:21', '2022-04-07 07:22:21'),
(75, NULL, 'DUMMY', 75, 1, '2022-04-07 07:22:21', '2022-04-07 07:22:21'),
(76, NULL, 'DUMMY', 76, 1, '2022-04-07 07:22:21', '2022-04-07 07:22:21'),
(77, NULL, 'DUMMY', 77, 1, '2022-04-07 07:22:21', '2022-04-07 07:22:21'),
(78, NULL, 'DUMMY', 78, 1, '2022-04-07 07:22:21', '2022-04-07 07:22:21'),
(79, NULL, 'DUMMY', 79, 1, '2022-04-07 07:22:21', '2022-04-07 07:22:21'),
(80, NULL, 'DUMMY', 80, 1, '2022-04-07 07:22:21', '2022-04-07 07:22:21'),
(81, NULL, 'DUMMY', 81, 1, '2022-04-07 07:22:21', '2022-04-07 07:22:21'),
(82, NULL, 'DUMMY', 82, 1, '2022-04-07 07:22:21', '2022-04-07 07:22:21'),
(83, NULL, 'DUMMY', 83, 1, '2022-04-07 07:22:21', '2022-04-07 07:22:21'),
(84, NULL, 'DUMMY', 84, 1, '2022-04-07 07:22:21', '2022-04-07 07:22:21'),
(85, NULL, 'DUMMY', 85, 1, '2022-04-07 07:22:21', '2022-04-07 07:22:21'),
(86, NULL, 'DUMMY', 86, 1, '2022-04-07 07:22:21', '2022-04-07 07:22:21'),
(87, NULL, 'DUMMY', 87, 1, '2022-04-07 07:22:21', '2022-04-07 07:22:21'),
(88, NULL, 'DUMMY', 88, 1, '2022-04-07 07:22:21', '2022-04-07 07:22:21'),
(89, NULL, 'DUMMY', 89, 1, '2022-04-07 07:22:21', '2022-04-07 07:22:21'),
(90, NULL, 'DUMMY', 90, 1, '2022-04-07 07:22:21', '2022-04-07 07:22:21'),
(91, NULL, 'DUMMY', 91, 1, '2022-04-07 07:22:21', '2022-04-07 07:22:21'),
(92, NULL, 'DUMMY', 92, 1, '2022-04-07 07:22:21', '2022-04-07 07:22:21'),
(93, NULL, 'DUMMY', 93, 1, '2022-04-07 07:22:21', '2022-04-07 07:22:21'),
(94, NULL, 'DUMMY', 94, 1, '2022-04-07 07:22:21', '2022-04-07 07:22:21'),
(95, NULL, 'DUMMY', 95, 1, '2022-04-07 07:22:21', '2022-04-07 07:22:21'),
(96, NULL, 'DUMMY', 96, 1, '2022-04-07 07:22:21', '2022-04-07 07:22:21'),
(97, NULL, 'DUMMY', 97, 1, '2022-04-07 07:22:21', '2022-04-07 07:22:21'),
(98, NULL, 'DUMMY', 98, 1, '2022-04-07 07:22:21', '2022-04-07 07:22:21'),
(99, NULL, 'DUMMY', 99, 1, '2022-04-07 07:22:21', '2022-04-07 07:22:21'),
(100, NULL, 'DUMMY', 100, 1, '2022-04-07 07:22:21', '2022-04-07 07:22:21'),
(101, NULL, 'DUMMY', 101, 1, '2022-04-07 07:22:21', '2022-04-07 07:22:21'),
(102, NULL, 'DUMMY', 102, 1, '2022-04-07 07:22:21', '2022-04-07 07:22:21'),
(103, NULL, 'DUMMY', 103, 1, '2022-04-07 07:22:21', '2022-04-07 07:22:21'),
(104, NULL, 'DUMMY', 104, 1, '2022-04-07 07:22:21', '2022-04-07 07:22:21'),
(105, NULL, 'DUMMY', 105, 1, '2022-04-07 07:22:21', '2022-04-07 07:22:21'),
(106, NULL, 'DUMMY', 106, 1, '2022-04-07 07:22:21', '2022-04-07 07:22:21'),
(107, NULL, 'DUMMY', 107, 1, '2022-04-07 07:22:21', '2022-04-07 07:22:21'),
(108, NULL, 'DUMMY', 108, 1, '2022-04-07 07:22:21', '2022-04-07 07:22:21'),
(109, NULL, 'DUMMY', 109, 1, '2022-04-07 07:22:21', '2022-04-07 07:22:21'),
(110, NULL, 'DUMMY', 110, 1, '2022-04-07 07:22:21', '2022-04-07 07:22:21'),
(111, NULL, 'DUMMY', 111, 1, '2022-04-07 07:22:21', '2022-04-07 07:22:21'),
(112, NULL, 'DUMMY', 112, 1, '2022-04-07 07:22:22', '2022-04-07 07:22:22'),
(113, NULL, 'DUMMY', 113, 1, '2022-04-07 07:22:22', '2022-04-07 07:22:22'),
(114, NULL, 'DUMMY', 114, 1, '2022-04-07 07:22:22', '2022-04-07 07:22:22'),
(115, NULL, 'DUMMY', 115, 1, '2022-04-07 07:22:22', '2022-04-07 07:22:22'),
(116, NULL, 'DUMMY', 116, 1, '2022-04-07 07:22:22', '2022-04-07 07:22:22'),
(117, NULL, 'DUMMY', 117, 1, '2022-04-07 07:22:22', '2022-04-07 07:22:22'),
(118, NULL, 'DUMMY', 118, 1, '2022-04-07 07:22:22', '2022-04-07 07:22:22'),
(119, NULL, 'DUMMY', 119, 1, '2022-04-07 07:22:22', '2022-04-07 07:22:22'),
(120, NULL, 'DUMMY', 120, 1, '2022-04-07 07:22:22', '2022-04-07 07:22:22'),
(121, NULL, 'DUMMY', 121, 1, '2022-04-07 07:22:22', '2022-04-07 07:22:22'),
(122, NULL, 'DUMMY', 122, 1, '2022-04-07 07:22:22', '2022-04-07 07:22:22'),
(123, NULL, 'DUMMY', 123, 1, '2022-04-07 07:22:22', '2022-04-07 07:22:22'),
(124, NULL, 'DUMMY', 124, 1, '2022-04-07 07:22:22', '2022-04-07 07:22:22'),
(125, NULL, 'DUMMY', 125, 1, '2022-04-07 07:22:22', '2022-04-07 07:22:22'),
(126, NULL, 'DUMMY', 126, 1, '2022-04-07 07:22:22', '2022-04-07 07:22:22'),
(127, NULL, 'DUMMY', 127, 1, '2022-04-07 07:22:22', '2022-04-07 07:22:22'),
(128, NULL, 'DUMMY', 128, 1, '2022-04-07 07:22:22', '2022-04-07 07:22:22'),
(129, NULL, 'DUMMY', 129, 1, '2022-04-07 07:22:22', '2022-04-07 07:22:22'),
(130, NULL, 'DUMMY', 130, 1, '2022-04-07 07:22:22', '2022-04-07 07:22:22'),
(131, NULL, 'DUMMY', 131, 1, '2022-04-07 07:22:22', '2022-04-07 07:22:22'),
(132, NULL, 'DUMMY', 132, 1, '2022-04-07 07:22:22', '2022-04-07 07:22:22'),
(133, NULL, 'DUMMY', 133, 1, '2022-04-07 07:22:22', '2022-04-07 07:22:22'),
(134, NULL, 'DUMMY', 134, 1, '2022-04-07 07:22:22', '2022-04-07 07:22:22'),
(135, NULL, 'DUMMY', 135, 1, '2022-04-07 07:22:22', '2022-04-07 07:22:22'),
(136, NULL, 'DUMMY', 136, 1, '2022-04-07 07:22:22', '2022-04-07 07:22:22'),
(137, NULL, 'DUMMY', 137, 1, '2022-04-07 07:22:22', '2022-04-07 07:22:22'),
(138, NULL, 'DUMMY', 138, 1, '2022-04-07 07:22:22', '2022-04-07 07:22:22'),
(139, NULL, 'DUMMY', 139, 1, '2022-04-07 07:22:22', '2022-04-07 07:22:22'),
(140, NULL, 'DUMMY', 140, 1, '2022-04-07 07:22:22', '2022-04-07 07:22:22'),
(141, NULL, 'DUMMY', 141, 1, '2022-04-07 07:22:22', '2022-04-07 07:22:22'),
(142, NULL, 'DUMMY', 142, 1, '2022-04-07 07:22:22', '2022-04-07 07:22:22'),
(143, NULL, 'DUMMY', 143, 1, '2022-04-07 07:22:22', '2022-04-07 07:22:22'),
(144, NULL, 'DUMMY', 144, 1, '2022-04-07 07:22:22', '2022-04-07 07:22:22'),
(145, NULL, 'DUMMY', 145, 1, '2022-04-07 07:22:22', '2022-04-07 07:22:22'),
(146, NULL, 'DUMMY', 146, 1, '2022-04-07 07:22:22', '2022-04-07 07:22:22'),
(147, NULL, 'DUMMY', 147, 1, '2022-04-07 07:22:22', '2022-04-07 07:22:22'),
(148, NULL, 'DUMMY', 148, 1, '2022-04-07 07:22:22', '2022-04-07 07:22:22'),
(149, NULL, 'DUMMY', 149, 1, '2022-04-07 07:22:22', '2022-04-07 07:22:22'),
(150, NULL, 'DUMMY', 150, 1, '2022-04-07 07:22:22', '2022-04-07 07:22:22'),
(151, NULL, 'DUMMY', 151, 1, '2022-04-07 07:22:22', '2022-04-07 07:22:22'),
(152, NULL, 'DUMMY', 152, 1, '2022-04-07 07:22:22', '2022-04-07 07:22:22'),
(153, NULL, 'DUMMY', 153, 1, '2022-04-07 07:22:22', '2022-04-07 07:22:22'),
(154, NULL, 'DUMMY', 154, 1, '2022-04-07 07:22:22', '2022-04-07 07:22:22'),
(155, NULL, 'DUMMY', 155, 1, '2022-04-07 07:22:22', '2022-04-07 07:22:22'),
(156, NULL, 'DUMMY', 156, 1, '2022-04-07 07:22:22', '2022-04-07 07:22:22'),
(157, NULL, 'DUMMY', 157, 1, '2022-04-07 07:22:22', '2022-04-07 07:22:22'),
(158, NULL, 'DUMMY', 158, 1, '2022-04-07 07:22:22', '2022-04-07 07:22:22'),
(159, NULL, 'DUMMY', 159, 1, '2022-04-07 07:22:22', '2022-04-07 07:22:22'),
(160, NULL, 'DUMMY', 160, 1, '2022-04-07 07:22:22', '2022-04-07 07:22:22'),
(161, NULL, 'DUMMY', 161, 1, '2022-04-07 07:22:22', '2022-04-07 07:22:22'),
(162, NULL, 'DUMMY', 162, 1, '2022-04-07 07:22:22', '2022-04-07 07:22:22'),
(163, NULL, 'DUMMY', 163, 1, '2022-04-07 07:22:22', '2022-04-07 07:22:22'),
(164, NULL, 'DUMMY', 164, 1, '2022-04-07 07:22:22', '2022-04-07 07:22:22'),
(165, NULL, 'DUMMY', 165, 0, '2022-04-07 07:26:23', '2022-04-07 07:26:23'),
(166, NULL, 'DUMMY', 166, 0, '2022-04-07 07:27:14', '2022-04-07 07:27:14'),
(167, NULL, 'DUMMY', 167, 1, '2022-04-07 07:41:45', '2022-04-07 07:41:45');

-- --------------------------------------------------------

--
-- Table structure for table `purchase_lines`
--

CREATE TABLE `purchase_lines` (
  `id` int(10) UNSIGNED NOT NULL,
  `transaction_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `variation_id` int(10) UNSIGNED NOT NULL,
  `quantity` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `pp_without_discount` decimal(22,4) NOT NULL DEFAULT 0.0000 COMMENT 'Purchase price before inline discounts',
  `discount_percent` decimal(5,2) NOT NULL DEFAULT 0.00 COMMENT 'Inline discount percentage',
  `purchase_price` decimal(22,4) NOT NULL,
  `purchase_price_inc_tax` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `item_tax` decimal(22,4) NOT NULL COMMENT 'Tax for one quantity',
  `tax_id` int(10) UNSIGNED DEFAULT NULL,
  `purchase_order_line_id` int(11) DEFAULT NULL,
  `quantity_sold` decimal(22,4) NOT NULL DEFAULT 0.0000 COMMENT 'Quanity sold from this purchase line',
  `quantity_adjusted` decimal(22,4) NOT NULL DEFAULT 0.0000 COMMENT 'Quanity adjusted in stock adjustment from this purchase line',
  `quantity_returned` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `po_quantity_purchased` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `mfg_quantity_used` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `mfg_date` date DEFAULT NULL,
  `exp_date` date DEFAULT NULL,
  `lot_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_unit_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `purchase_lines`
--

INSERT INTO `purchase_lines` (`id`, `transaction_id`, `product_id`, `variation_id`, `quantity`, `pp_without_discount`, `discount_percent`, `purchase_price`, `purchase_price_inc_tax`, `item_tax`, `tax_id`, `purchase_order_line_id`, `quantity_sold`, `quantity_adjusted`, `quantity_returned`, `po_quantity_purchased`, `mfg_quantity_used`, `mfg_date`, `exp_date`, `lot_number`, `sub_unit_id`, `created_at`, `updated_at`) VALUES
(1, '0-1-1-A', 7, 7, '100.0000', '200.0000', '0.00', '200.0000', '200.0000', '0.0000', NULL, NULL, '100.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-04-07 07:36:37', '2022-04-07 10:48:17'),
(2, '2-1-1-C', 7, 8, '100.0000', '400.0000', '0.00', '400.0000', '400.0000', '0.0000', NULL, NULL, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-04-07 07:36:37', '2022-04-07 07:36:37'),
(3, '3-1-1-D', 7, 9, '100.0000', '800.0000', '0.00', '800.0000', '800.0000', '0.0000', NULL, NULL, '1.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-04-07 07:36:37', '2022-04-07 11:45:54'),
(4, '4-1-1-E', 3, 3, '100.0000', '349.0000', '0.00', '349.0000', '349.0000', '0.0000', NULL, NULL, '10.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-04-07 07:42:36', '2022-04-07 10:23:57'),
(5, '5-1-1-F', 4, 4, '100.0000', '79.0000', '0.00', '79.0000', '79.0000', '0.0000', NULL, NULL, '10.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-04-07 07:43:27', '2022-04-07 10:23:57'),
(6, '6-1-1-G', 162, 164, '100.0000', '60.0000', '0.00', '60.0000', '60.0000', '0.0000', NULL, NULL, '15.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-04-07 07:44:07', '2022-04-07 10:23:57'),
(7, '13-1-1-N', 7, 7, '100.0000', '200.0000', '0.00', '200.0000', '200.0000', '0.0000', NULL, NULL, '26.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-04-07 09:59:18', '2022-04-08 11:40:33'),
(8, '13-1-1-N', 7, 8, '100.0000', '400.0000', '0.00', '400.0000', '400.0000', '0.0000', NULL, NULL, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-04-07 09:59:18', '2022-04-07 09:59:18'),
(9, '13-1-1-N', 7, 9, '100.0000', '800.0000', '0.00', '800.0000', '800.0000', '0.0000', NULL, NULL, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2022-04-07 09:59:18', '2022-04-07 09:59:18');

-- --------------------------------------------------------

--
-- Table structure for table `reference_counts`
--

CREATE TABLE `reference_counts` (
  `id` int(10) UNSIGNED NOT NULL,
  `ref_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ref_count` int(11) NOT NULL,
  `business_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `reference_counts`
--

INSERT INTO `reference_counts` (`id`, `ref_type`, `ref_count`, `business_id`, `created_at`, `updated_at`) VALUES
(1, 'sell_payment', 78, 1, '2022-04-07 09:18:51', '2022-04-08 11:40:33'),
(2, 'expense', 1, 1, '2022-04-07 09:32:00', '2022-04-07 09:32:00'),
(3, 'contacts', 4, 1, '2022-04-07 10:23:37', '2022-04-07 10:34:56');

-- --------------------------------------------------------

--
-- Table structure for table `res_product_modifier_sets`
--

CREATE TABLE `res_product_modifier_sets` (
  `modifier_set_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL COMMENT 'Table use to store the modifier sets applicable for a product'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `res_product_modifier_sets`
--

INSERT INTO `res_product_modifier_sets` (`modifier_set_id`, `product_id`) VALUES
(165, 25),
(165, 27),
(166, 25),
(166, 27);

-- --------------------------------------------------------

--
-- Table structure for table `res_tables`
--

CREATE TABLE `res_tables` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `location_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `res_tables`
--

INSERT INTO `res_tables` (`id`, `business_id`, `location_id`, `name`, `description`, `created_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'T-1', 'Groud Floor', 1, NULL, '2022-04-07 07:25:15', '2022-04-07 07:25:15'),
(2, 1, 1, 'T-2', 'Family Hall', 1, NULL, '2022-04-07 07:25:33', '2022-04-07 07:25:33');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `is_service_staff` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `business_id`, `is_default`, `is_service_staff`, `created_at`, `updated_at`) VALUES
(1, 'Admin#1', 'web', 1, 1, 0, '2022-04-07 07:25:19', '2022-04-07 07:25:19'),
(2, 'Cashier#1', 'web', 1, 0, 0, '2022-04-07 07:25:19', '2022-04-07 07:25:19'),
(3, 'waiter#1', 'web', 1, 0, 1, '2022-04-07 07:52:37', '2022-04-07 07:52:37');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(25, 2),
(26, 2),
(48, 2),
(49, 2),
(50, 2),
(51, 2),
(82, 3);

-- --------------------------------------------------------

--
-- Table structure for table `selling_price_groups`
--

CREATE TABLE `selling_price_groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sell_line_warranties`
--

CREATE TABLE `sell_line_warranties` (
  `sell_line_id` int(11) NOT NULL,
  `warranty_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stock_adjustments_temp`
--

CREATE TABLE `stock_adjustments_temp` (
  `id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `stock_adjustment_lines`
--

CREATE TABLE `stock_adjustment_lines` (
  `id` int(10) UNSIGNED NOT NULL,
  `transaction_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `variation_id` int(10) UNSIGNED NOT NULL,
  `quantity` decimal(22,4) NOT NULL,
  `unit_price` decimal(22,4) DEFAULT NULL COMMENT 'Last purchase unit price',
  `removed_purchase_line` int(11) DEFAULT NULL,
  `lot_no_line_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `system`
--

CREATE TABLE `system` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `system`
--

INSERT INTO `system` (`id`, `key`, `value`) VALUES
(1, 'db_version', '4.5'),
(2, 'default_business_active_status', '1');

-- --------------------------------------------------------

--
-- Table structure for table `tax_rates`
--

CREATE TABLE `tax_rates` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double(22,4) NOT NULL,
  `is_tax_group` tinyint(1) NOT NULL DEFAULT 0,
  `for_tax_group` tinyint(1) NOT NULL DEFAULT 0,
  `created_by` int(10) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tax_rates`
--

INSERT INTO `tax_rates` (`id`, `business_id`, `name`, `amount`, `is_tax_group`, `for_tax_group`, `created_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'GST TAX', 16.0000, 0, 0, 1, NULL, '2022-04-07 07:24:26', '2022-04-07 07:24:38');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ai_id` int(11) NOT NULL,
  `sync_status` tinyint(1) NOT NULL DEFAULT 0,
  `business_id` int(10) UNSIGNED NOT NULL,
  `location_id` int(10) UNSIGNED DEFAULT NULL,
  `res_table_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'fields to restaurant module',
  `res_waiter_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'fields to restaurant module',
  `res_order_status` enum('received','cooked','served') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_type` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sub_status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_quotation` tinyint(1) NOT NULL DEFAULT 0,
  `payment_status` enum('paid','due','partial') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `adjustment_type` enum('normal','abnormal') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_group_id` int(11) DEFAULT NULL COMMENT 'used to add customer group while selling',
  `invoice_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ref_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `source` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subscription_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subscription_repeat_on` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_date` datetime NOT NULL,
  `total_before_tax` decimal(22,4) NOT NULL DEFAULT 0.0000 COMMENT 'Total before the purchase/invoice tax, this includeds the indivisual product tax',
  `tax_id` int(10) UNSIGNED DEFAULT NULL,
  `tax_amount` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `discount_type` enum('fixed','percentage') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_amount` decimal(22,4) DEFAULT 0.0000,
  `rp_redeemed` int(11) NOT NULL DEFAULT 0 COMMENT 'rp is the short form of reward points',
  `rp_redeemed_amount` decimal(22,4) NOT NULL DEFAULT 0.0000 COMMENT 'rp is the short form of reward points',
  `shipping_details` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delivered_to` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_charges` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `shipping_custom_field_1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_custom_field_2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_custom_field_3` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_custom_field_4` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_custom_field_5` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `additional_notes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `staff_note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_export` tinyint(1) NOT NULL DEFAULT 0,
  `export_custom_fields_info` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `round_off_amount` decimal(22,4) NOT NULL DEFAULT 0.0000 COMMENT 'Difference of rounded total and actual total',
  `additional_expense_key_1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `additional_expense_value_1` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `additional_expense_key_2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `additional_expense_value_2` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `additional_expense_key_3` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `additional_expense_value_3` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `additional_expense_key_4` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `additional_expense_value_4` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `final_total` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `expense_category_id` int(10) UNSIGNED DEFAULT NULL,
  `expense_for` int(10) UNSIGNED DEFAULT NULL,
  `commission_agent` int(11) DEFAULT NULL,
  `document` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_direct_sale` tinyint(1) NOT NULL DEFAULT 0,
  `is_suspend` tinyint(1) NOT NULL DEFAULT 0,
  `exchange_rate` decimal(20,3) NOT NULL DEFAULT 1.000,
  `total_amount_recovered` decimal(22,4) DEFAULT NULL COMMENT 'Used for stock adjustment.',
  `transfer_parent_id` int(11) DEFAULT NULL,
  `return_parent_id` int(11) DEFAULT NULL,
  `opening_stock_product_id` int(11) DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `prefer_payment_method` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prefer_payment_account` int(11) DEFAULT NULL,
  `sales_order_ids` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `purchase_order_ids` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field_1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field_2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field_3` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field_4` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `import_batch` int(11) DEFAULT NULL,
  `import_time` datetime DEFAULT NULL,
  `types_of_service_id` int(11) DEFAULT NULL,
  `packing_charge` decimal(22,4) DEFAULT NULL,
  `packing_charge_type` enum('fixed','percent') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `service_custom_field_1` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `service_custom_field_2` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `service_custom_field_3` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `service_custom_field_4` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `service_custom_field_5` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `service_custom_field_6` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_created_from_api` tinyint(1) NOT NULL DEFAULT 0,
  `rp_earned` int(11) NOT NULL DEFAULT 0 COMMENT 'rp is the short form of reward points',
  `order_addresses` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_recurring` tinyint(1) NOT NULL DEFAULT 0,
  `recur_interval` double(22,4) DEFAULT NULL,
  `recur_interval_type` enum('days','months','years') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `recur_repetitions` int(11) DEFAULT NULL,
  `recur_stopped_on` datetime DEFAULT NULL,
  `recur_parent_id` int(11) DEFAULT NULL,
  `invoice_token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pay_term_number` int(11) DEFAULT NULL,
  `pay_term_type` enum('days','months') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `selling_price_group_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `ai_id`, `sync_status`, `business_id`, `location_id`, `res_table_id`, `res_waiter_id`, `res_order_status`, `type`, `sub_type`, `status`, `sub_status`, `is_quotation`, `payment_status`, `adjustment_type`, `contact_id`, `customer_group_id`, `invoice_no`, `ref_no`, `source`, `subscription_no`, `subscription_repeat_on`, `transaction_date`, `total_before_tax`, `tax_id`, `tax_amount`, `discount_type`, `discount_amount`, `rp_redeemed`, `rp_redeemed_amount`, `shipping_details`, `shipping_address`, `shipping_status`, `delivered_to`, `shipping_charges`, `shipping_custom_field_1`, `shipping_custom_field_2`, `shipping_custom_field_3`, `shipping_custom_field_4`, `shipping_custom_field_5`, `additional_notes`, `staff_note`, `is_export`, `export_custom_fields_info`, `round_off_amount`, `additional_expense_key_1`, `additional_expense_value_1`, `additional_expense_key_2`, `additional_expense_value_2`, `additional_expense_key_3`, `additional_expense_value_3`, `additional_expense_key_4`, `additional_expense_value_4`, `final_total`, `expense_category_id`, `expense_for`, `commission_agent`, `document`, `is_direct_sale`, `is_suspend`, `exchange_rate`, `total_amount_recovered`, `transfer_parent_id`, `return_parent_id`, `opening_stock_product_id`, `created_by`, `prefer_payment_method`, `prefer_payment_account`, `sales_order_ids`, `purchase_order_ids`, `custom_field_1`, `custom_field_2`, `custom_field_3`, `custom_field_4`, `import_batch`, `import_time`, `types_of_service_id`, `packing_charge`, `packing_charge_type`, `service_custom_field_1`, `service_custom_field_2`, `service_custom_field_3`, `service_custom_field_4`, `service_custom_field_5`, `service_custom_field_6`, `is_created_from_api`, `rp_earned`, `order_addresses`, `is_recurring`, `recur_interval`, `recur_interval_type`, `recur_repetitions`, `recur_stopped_on`, `recur_parent_id`, `invoice_token`, `pay_term_number`, `pay_term_type`, `selling_price_group_id`, `created_at`, `updated_at`) VALUES
('4-1-1-E', 1, 1, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 12:42:36', '349.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '34900.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 3, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-07 07:42:36', '2022-04-07 07:42:36'),
('5-1-1-F', 2, 1, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 12:43:27', '79.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '7900.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 4, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-07 07:43:27', '2022-04-07 07:43:27'),
('0-1-1-A', 3, 1, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-31 12:36:00', '200.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, ',zcmlsms', NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '20000.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 7, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-07 07:36:36', '2022-04-07 07:36:36'),
('2-1-1-C', 4, 1, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-07 12:36:00', '400.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 'zzkspofkzfsmdf/lm,m', NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '40000.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 7, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-07 07:36:37', '2022-04-07 07:36:37'),
('3-1-1-D', 5, 1, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-07 12:36:00', '800.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 'D as,', NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '80000.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 7, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-07 07:36:37', '2022-04-07 07:36:37'),
('6-1-1-G', 6, 1, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-01 12:44:07', '60.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '6000.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 162, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-07 07:44:07', '2022-04-07 07:44:07'),
('H-1-1-7', 7, 1, 1, 1, 1, 3, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, '1', NULL, '0001', '', NULL, NULL, NULL, '2022-04-07 13:31:00', '2098.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, ',bbjhggggggggggggggggggggh', 'kgjhggkjg', 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '2198.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, '100.0000', 'fixed', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-07 09:16:36', '2022-04-07 09:18:51'),
('I-1-1-8', 8, 1, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, '1', NULL, '0002', '', NULL, NULL, NULL, '2022-04-07 14:19:00', '300.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '300.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-07 09:21:11', '2022-04-07 09:21:38'),
('J-1-1-9', 9, 1, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, '1', NULL, '0003', '', NULL, NULL, NULL, '2022-04-07 14:21:00', '2264.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '2264.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-07 09:22:53', '2022-04-07 09:26:22'),
('K-1-1-10', 10, 1, 1, 1, 1, 3, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, '1', NULL, '0004', '', NULL, NULL, NULL, '2022-04-07 14:22:00', '3500.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '3550.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '50.0000', 'fixed', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-07 09:23:35', '2022-04-07 09:25:07'),
('L-1-1-11', 11, 1, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, '1', NULL, '0005', '', NULL, NULL, NULL, '2022-04-07 14:27:00', '300.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '300.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-07 09:27:55', '2022-04-07 09:27:55'),
('M-1-1-12', 12, 1, 1, 1, NULL, NULL, NULL, 'expense', NULL, 'final', NULL, 0, 'partial', NULL, NULL, NULL, NULL, 'EP2022/0001', NULL, NULL, NULL, '2022-04-07 14:31:00', '500.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 'office food', NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '500.0000', NULL, 1, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-07 09:32:00', '2022-04-07 09:32:00'),
('N-1-1-13', 13, 1, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, '1', NULL, '0006', '', NULL, NULL, NULL, '2022-04-07 15:17:00', '1600.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1600.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-07 10:17:27', '2022-04-07 10:17:27'),
('13-1-1-N', 14, 1, 1, 1, NULL, NULL, NULL, 'purchase', NULL, 'received', NULL, 0, 'paid', NULL, '2', NULL, NULL, 'PO2022/0001', NULL, NULL, NULL, '2022-04-07 14:55:00', '140000.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '140000.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-07 09:59:18', '2022-04-07 09:59:18'),
('P-1-1-15', 15, 1, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'due', NULL, 'E-1-1-4', NULL, '0007', '', NULL, NULL, NULL, '2022-04-07 15:23:00', '3500.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '3500.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-07 10:23:57', '2022-04-07 10:23:57'),
('Q-1-1-16', 16, 1, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 'F-1-1-5', NULL, '0008', '', NULL, NULL, NULL, '2022-04-07 15:29:00', '149.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '149.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-07 10:30:18', '2022-04-07 10:30:18'),
('R-1-1-17', 17, 1, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 'G-1-1-6', NULL, '0009', '', NULL, NULL, NULL, '2022-04-07 15:30:00', '199.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '199.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-07 10:31:05', '2022-04-07 10:31:06'),
('S-1-1-18', 18, 1, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 'H-1-1-7', NULL, '0010', '', NULL, NULL, NULL, '2022-04-07 15:33:00', '1499.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1499.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-07 10:35:03', '2022-04-07 10:35:04'),
('T-1-1-19', 19, 1, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 'H-1-1-7', NULL, '0011', '', NULL, NULL, NULL, '2022-04-07 15:37:00', '99.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '99.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-07 10:38:13', '2022-04-07 10:38:13'),
('U-1-1-20', 20, 1, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, '1', NULL, '0012', '', NULL, NULL, NULL, '2022-04-07 15:38:00', '2000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '2000.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-07 10:41:59', '2022-04-07 10:41:59'),
('V-1-1-21', 21, 1, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, '1', NULL, '0013', '', NULL, NULL, NULL, '2022-04-07 15:47:00', '20000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '20000.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-07 10:48:17', '2022-04-07 10:48:17'),
('W-1-1-22', 22, 1, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, '1', NULL, '0014', '', NULL, NULL, NULL, '2022-04-07 15:49:00', '200.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '200.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-07 11:44:58', '2022-04-07 11:44:59'),
('X-1-1-23', 23, 1, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, '1', NULL, '0015', '', NULL, NULL, NULL, '2022-04-07 16:44:00', '199.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '199.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-07 11:45:07', '2022-04-07 11:45:08'),
('Y-1-1-24', 24, 1, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, '1', NULL, '0016', '', NULL, NULL, NULL, '2022-04-07 16:45:00', '99.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '99.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-07 11:45:16', '2022-04-07 11:45:16'),
('Z-1-1-25', 25, 1, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, '1', NULL, '0017', '', NULL, NULL, NULL, '2022-04-07 16:45:00', '99.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '99.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-07 11:45:41', '2022-04-07 11:45:41'),
('AA-1-1-26', 26, 1, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, '1', NULL, '0018', '', NULL, NULL, NULL, '2022-04-07 16:45:00', '800.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '800.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-07 11:45:54', '2022-04-07 11:45:54'),
('AB-1-1-27', 27, 1, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, '1', NULL, '0019', '', NULL, NULL, NULL, '2022-04-07 16:45:00', '698.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '698.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-07 11:46:03', '2022-04-07 11:46:03'),
('AC-1-1-28', 28, 1, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, '1', NULL, '0020', '', NULL, NULL, NULL, '2022-04-07 16:46:00', '698.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '698.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-07 11:46:12', '2022-04-07 11:46:12'),
('AD-1-1-29', 29, 1, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, '1', NULL, '0021', '', NULL, NULL, NULL, '2022-04-07 16:46:00', '797.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '797.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-07 11:46:20', '2022-04-07 11:46:20'),
('AE-1-1-30', 30, 1, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, '1', NULL, '0022', '', NULL, NULL, NULL, '2022-04-07 16:46:00', '249.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '249.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-07 11:46:50', '2022-04-07 11:46:50'),
('AF-1-1-31', 31, 1, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, '1', NULL, '0023', '', NULL, NULL, NULL, '2022-04-07 16:46:00', '99.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '99.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-07 11:47:19', '2022-04-07 11:47:19'),
('AG-1-1-32', 32, 1, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, '1', NULL, '0024', '', NULL, NULL, NULL, '2022-04-07 16:47:00', '398.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '398.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-07 11:47:29', '2022-04-07 11:47:29'),
('AH-1-1-33', 33, 1, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, '1', NULL, '0025', '', NULL, NULL, NULL, '2022-04-07 16:47:00', '498.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '498.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-07 11:48:02', '2022-04-07 11:48:02'),
('AI-1-1-34', 34, 1, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, '1', NULL, '0026', '', NULL, NULL, NULL, '2022-04-07 16:48:00', '249.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '249.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-07 11:48:10', '2022-04-07 11:48:10'),
('AJ-1-1-35', 35, 1, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, '1', NULL, '0027', '', NULL, NULL, NULL, '2022-04-07 16:48:00', '348.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '348.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-07 11:48:19', '2022-04-07 11:48:19'),
('AK-1-1-36', 36, 1, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, '1', NULL, '0028', '', NULL, NULL, NULL, '2022-04-07 16:48:00', '448.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '448.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-07 11:48:32', '2022-04-07 11:48:32'),
('AL-1-1-37', 37, 1, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, '1', NULL, '0029', '', NULL, NULL, NULL, '2022-04-07 16:48:00', '448.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '448.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-07 11:48:39', '2022-04-07 11:48:39'),
('AM-1-1-38', 38, 1, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, '1', NULL, '0030', '', NULL, NULL, NULL, '2022-04-07 16:48:00', '998.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '998.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-07 11:48:47', '2022-04-07 11:48:47'),
('AN-1-1-39', 39, 1, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, '1', NULL, '0031', '', NULL, NULL, NULL, '2022-04-07 16:48:00', '348.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '348.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-07 11:48:57', '2022-04-07 11:48:57'),
('AO-1-1-40', 40, 1, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, '1', NULL, '0032', '', NULL, NULL, NULL, '2022-04-07 16:48:00', '447.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '447.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-07 11:49:06', '2022-04-07 11:49:06'),
('AP-1-1-41', 41, 1, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, '1', NULL, '0033', '', NULL, NULL, NULL, '2022-04-07 16:49:00', '797.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '797.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-07 11:49:14', '2022-04-07 11:49:14'),
('AQ-1-1-42', 42, 1, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, '1', NULL, '0034', '', NULL, NULL, NULL, '2022-04-07 16:49:00', '597.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '597.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-07 11:49:23', '2022-04-07 11:49:23'),
('AR-1-1-43', 43, 1, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, '1', NULL, '0035', '', NULL, NULL, NULL, '2022-04-07 16:49:00', '1997.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1997.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-07 11:49:31', '2022-04-07 11:49:31'),
('AS-1-1-44', 44, 1, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, '1', NULL, '0036', '', NULL, NULL, NULL, '2022-04-07 16:49:00', '1498.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1498.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-07 11:49:40', '2022-04-07 11:49:40'),
('AT-1-1-45', 45, 1, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, '1', NULL, '0037', '', NULL, NULL, NULL, '2022-04-07 16:49:00', '798.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '798.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-07 11:49:49', '2022-04-07 11:49:49'),
('AU-1-1-46', 46, 1, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, '1', NULL, '0038', '', NULL, NULL, NULL, '2022-04-07 16:49:00', '1297.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1297.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-07 11:49:58', '2022-04-07 11:49:58'),
('AV-1-1-47', 47, 1, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, '1', NULL, '0039', '', NULL, NULL, NULL, '2022-04-07 16:49:00', '1228.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1228.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-07 11:50:07', '2022-04-07 11:50:07'),
('AW-1-1-48', 48, 1, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, '1', NULL, '0040', '', NULL, NULL, NULL, '2022-04-07 16:50:00', '1997.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1997.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-07 11:50:14', '2022-04-07 11:50:14'),
('AX-1-1-49', 49, 1, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, '1', NULL, '0041', '', NULL, NULL, NULL, '2022-04-07 16:50:00', '3046.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '3046.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-07 11:50:37', '2022-04-07 11:50:37'),
('AY-1-1-50', 50, 1, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, '1', NULL, '0042', '', NULL, NULL, NULL, '2022-04-07 16:50:00', '2047.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '2047.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-07 11:50:45', '2022-04-07 11:50:45'),
('AZ-1-1-51', 51, 1, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, '1', NULL, '0043', '', NULL, NULL, NULL, '2022-04-07 16:50:00', '1178.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1178.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-07 11:50:54', '2022-04-07 11:50:54'),
('BA-1-1-52', 52, 1, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, '1', NULL, '0044', '', NULL, NULL, NULL, '2022-04-07 16:50:00', '848.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '848.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-07 11:51:03', '2022-04-07 11:51:03'),
('BB-1-1-53', 53, 1, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, '1', NULL, '0045', '', NULL, NULL, NULL, '2022-04-07 16:51:00', '1298.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1298.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-07 11:51:14', '2022-04-07 11:51:14'),
('BC-1-1-54', 54, 1, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, '1', NULL, '0046', '', NULL, NULL, NULL, '2022-04-07 16:51:00', '978.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '978.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-07 11:51:26', '2022-04-07 11:51:26'),
('BD-1-1-55', 55, 1, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, '1', NULL, '0047', '', NULL, NULL, NULL, '2022-04-07 16:51:00', '1548.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1548.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-07 11:51:34', '2022-04-07 11:51:34'),
('BE-1-1-56', 56, 1, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, '1', NULL, '0048', '', NULL, NULL, NULL, '2022-04-07 16:51:00', '649.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '649.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-07 11:51:44', '2022-04-07 11:51:45'),
('BF-1-1-57', 57, 1, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, '1', NULL, '0049', '', NULL, NULL, NULL, '2022-04-07 16:51:00', '999.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '999.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-07 11:51:50', '2022-04-07 11:51:50'),
('BG-1-1-58', 58, 1, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, '1', NULL, '0050', '', NULL, NULL, NULL, '2022-04-07 16:51:00', '499.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '499.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-07 11:51:57', '2022-04-07 11:51:57'),
('BH-1-1-59', 59, 1, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, '1', NULL, '0051', '', NULL, NULL, NULL, '2022-04-07 16:51:00', '299.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '299.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-07 11:52:03', '2022-04-07 11:52:03'),
('BI-1-1-60', 60, 1, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, '1', NULL, '0052', '', NULL, NULL, NULL, '2022-04-07 16:52:00', '679.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '679.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-07 11:52:12', '2022-04-07 11:52:12'),
('BJ-1-1-61', 61, 1, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, '1', NULL, '0053', '', NULL, NULL, NULL, '2022-04-07 16:52:00', '549.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '549.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-07 11:52:22', '2022-04-07 11:52:22'),
('BK-1-1-62', 62, 1, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, '1', NULL, '0054', '', NULL, NULL, NULL, '2022-04-07 16:52:00', '1498.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1498.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-07 11:52:29', '2022-04-07 11:52:29'),
('BL-1-1-63', 63, 1, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, '1', NULL, '0055', '', NULL, NULL, NULL, '2022-04-07 16:52:00', '948.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '948.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-07 11:52:36', '2022-04-07 11:52:36'),
('BM-1-1-64', 64, 1, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, '1', NULL, '0056', '', NULL, NULL, NULL, '2022-04-07 16:52:00', '299.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '299.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-07 11:52:43', '2022-04-07 11:52:43'),
('BN-1-1-65', 65, 1, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, '1', NULL, '0057', '', NULL, NULL, NULL, '2022-04-07 16:52:00', '728.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '728.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-07 11:52:53', '2022-04-07 11:52:53'),
('BO-1-1-66', 66, 1, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, '1', NULL, '0058', '', NULL, NULL, NULL, '2022-04-07 16:52:00', '679.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '679.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-07 11:53:11', '2022-04-07 11:53:11'),
('BP-1-1-67', 67, 1, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, '1', NULL, '0059', '', NULL, NULL, NULL, '2022-04-07 16:53:00', '5088.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '5088.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-07 11:53:29', '2022-04-07 11:53:29'),
('BQ-1-1-68', 68, 1, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, '1', NULL, '0060', '', NULL, NULL, NULL, '2022-04-07 16:53:00', '2194.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '2194.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-07 11:53:41', '2022-04-07 11:53:41'),
('BR-1-1-69', 69, 1, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, '1', NULL, '0061', '', NULL, NULL, NULL, '2022-04-07 16:53:00', '1863.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1863.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-07 11:53:51', '2022-04-07 11:53:51');
INSERT INTO `transactions` (`id`, `ai_id`, `sync_status`, `business_id`, `location_id`, `res_table_id`, `res_waiter_id`, `res_order_status`, `type`, `sub_type`, `status`, `sub_status`, `is_quotation`, `payment_status`, `adjustment_type`, `contact_id`, `customer_group_id`, `invoice_no`, `ref_no`, `source`, `subscription_no`, `subscription_repeat_on`, `transaction_date`, `total_before_tax`, `tax_id`, `tax_amount`, `discount_type`, `discount_amount`, `rp_redeemed`, `rp_redeemed_amount`, `shipping_details`, `shipping_address`, `shipping_status`, `delivered_to`, `shipping_charges`, `shipping_custom_field_1`, `shipping_custom_field_2`, `shipping_custom_field_3`, `shipping_custom_field_4`, `shipping_custom_field_5`, `additional_notes`, `staff_note`, `is_export`, `export_custom_fields_info`, `round_off_amount`, `additional_expense_key_1`, `additional_expense_value_1`, `additional_expense_key_2`, `additional_expense_value_2`, `additional_expense_key_3`, `additional_expense_value_3`, `additional_expense_key_4`, `additional_expense_value_4`, `final_total`, `expense_category_id`, `expense_for`, `commission_agent`, `document`, `is_direct_sale`, `is_suspend`, `exchange_rate`, `total_amount_recovered`, `transfer_parent_id`, `return_parent_id`, `opening_stock_product_id`, `created_by`, `prefer_payment_method`, `prefer_payment_account`, `sales_order_ids`, `purchase_order_ids`, `custom_field_1`, `custom_field_2`, `custom_field_3`, `custom_field_4`, `import_batch`, `import_time`, `types_of_service_id`, `packing_charge`, `packing_charge_type`, `service_custom_field_1`, `service_custom_field_2`, `service_custom_field_3`, `service_custom_field_4`, `service_custom_field_5`, `service_custom_field_6`, `is_created_from_api`, `rp_earned`, `order_addresses`, `is_recurring`, `recur_interval`, `recur_interval_type`, `recur_repetitions`, `recur_stopped_on`, `recur_parent_id`, `invoice_token`, `pay_term_number`, `pay_term_type`, `selling_price_group_id`, `created_at`, `updated_at`) VALUES
('BS-1-1-70', 70, 1, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, '1', NULL, '0062', '', NULL, NULL, NULL, '2022-04-07 16:53:00', '3341.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '3341.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-07 11:54:05', '2022-04-07 11:54:06'),
('BT-1-1-71', 71, 1, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, '1', NULL, '0063', '', NULL, NULL, NULL, '2022-04-07 16:54:00', '3662.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '3662.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-07 11:54:19', '2022-04-07 11:54:19'),
('BU-1-1-72', 72, 1, 1, 1, 1, 3, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, '1', NULL, '0064', '', NULL, NULL, NULL, '2022-04-07 16:54:00', '1295.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1295.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, '0.0000', 'fixed', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-07 11:54:38', '2022-04-07 11:54:38'),
('BV-1-1-73', 73, 1, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, '1', NULL, '0065', '', NULL, NULL, NULL, '2022-04-07 16:54:00', '6458.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '6458.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', 'fixed', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-07 11:54:56', '2022-04-07 11:54:57'),
('BW-1-1-74', 74, 1, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, '1', NULL, '0066', '', NULL, NULL, NULL, '2022-04-07 16:54:00', '7777.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '7777.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', 'fixed', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-07 11:55:59', '2022-04-07 11:55:59'),
('BX-1-1-75', 75, 1, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, '1', NULL, '0067', '', NULL, NULL, NULL, '2022-04-07 16:56:00', '798.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '798.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', 'fixed', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-07 11:56:08', '2022-04-07 11:56:08'),
('BZ-1-1-77', 77, 1, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, '1', NULL, '0069', '', NULL, NULL, NULL, '2022-04-07 16:56:00', '4759.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '4759.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', 'fixed', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-07 11:56:40', '2022-04-07 11:56:40'),
('CA-1-1-78', 78, 1, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, '1', NULL, '0070', '', NULL, NULL, NULL, '2022-04-07 16:56:00', '3642.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '3642.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', 'fixed', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-07 11:56:55', '2022-04-07 11:56:55'),
('CB-1-1-79', 80, 1, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, '1', NULL, '0072', '', NULL, NULL, NULL, '2022-04-08 16:08:00', '299.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '299.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-08 11:12:31', '2022-04-08 11:12:31'),
('CD-1-1-81', 83, 1, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, '1', NULL, '0075', '', NULL, NULL, NULL, '2022-04-08 16:12:00', '7495.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '7495.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-08 11:40:10', '2022-04-08 11:40:10'),
('CG-1-1-84', 84, 1, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, '1', NULL, '0076', '', NULL, NULL, NULL, '2022-04-08 16:40:00', '1000.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', '1000.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2022-04-08 11:40:33', '2022-04-08 11:40:33');

-- --------------------------------------------------------

--
-- Table structure for table `transaction_payments`
--

CREATE TABLE `transaction_payments` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sync_status` bit(1) DEFAULT b'0',
  `transaction_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `business_id` int(11) DEFAULT NULL,
  `is_return` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Used during sales to return the change',
  `amount` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `method` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_transaction_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_holder_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_month` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_year` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_security` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cheque_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_account_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paid_on` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `paid_through_link` tinyint(1) NOT NULL DEFAULT 0,
  `gateway` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_advance` tinyint(1) NOT NULL DEFAULT 0,
  `payment_for` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `note` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `document` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_ref_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `ai_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transaction_payments`
--

INSERT INTO `transaction_payments` (`id`, `sync_status`, `transaction_id`, `business_id`, `is_return`, `amount`, `method`, `transaction_no`, `card_transaction_number`, `card_number`, `card_type`, `card_holder_name`, `card_month`, `card_year`, `card_security`, `cheque_number`, `bank_account_number`, `paid_on`, `created_by`, `paid_through_link`, `gateway`, `is_advance`, `payment_for`, `parent_id`, `note`, `document`, `payment_ref_no`, `account_id`, `created_at`, `updated_at`, `ai_id`) VALUES
('A-1-1-0', b'1', 'H-1-1-7', 1, 0, '3000.0000', 'other', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-07 14:18:51', 1, 0, NULL, 0, '1', NULL, NULL, NULL, 'SP2022/0001', NULL, '2022-04-07 09:18:51', '2022-04-07 09:18:51', 1),
('AA-1-1-26', b'1', 'AG-1-1-32', 1, 0, '398.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-07 16:47:29', 1, 0, NULL, 0, '1', NULL, NULL, NULL, 'SP2022/0026', NULL, '2022-04-07 11:47:29', '2022-04-07 11:47:29', 26),
('AB-1-1-27', b'1', 'AH-1-1-33', 1, 0, '498.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-07 16:48:02', 1, 0, NULL, 0, '1', NULL, NULL, NULL, 'SP2022/0027', NULL, '2022-04-07 11:48:02', '2022-04-07 11:48:02', 27),
('AC-1-1-28', b'1', 'AI-1-1-34', 1, 0, '249.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-07 16:48:10', 1, 0, NULL, 0, '1', NULL, NULL, NULL, 'SP2022/0028', NULL, '2022-04-07 11:48:10', '2022-04-07 11:48:10', 28),
('AD-1-1-29', b'1', 'AJ-1-1-35', 1, 0, '348.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-07 16:48:19', 1, 0, NULL, 0, '1', NULL, NULL, NULL, 'SP2022/0029', NULL, '2022-04-07 11:48:19', '2022-04-07 11:48:19', 29),
('AE-1-1-30', b'1', 'AK-1-1-36', 1, 0, '448.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-07 16:48:32', 1, 0, NULL, 0, '1', NULL, NULL, NULL, 'SP2022/0030', NULL, '2022-04-07 11:48:32', '2022-04-07 11:48:32', 30),
('AF-1-1-31', b'1', 'AL-1-1-37', 1, 0, '448.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-07 16:48:39', 1, 0, NULL, 0, '1', NULL, NULL, NULL, 'SP2022/0031', NULL, '2022-04-07 11:48:39', '2022-04-07 11:48:39', 31),
('AG-1-1-32', b'1', 'AM-1-1-38', 1, 0, '998.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-07 16:48:47', 1, 0, NULL, 0, '1', NULL, NULL, NULL, 'SP2022/0032', NULL, '2022-04-07 11:48:47', '2022-04-07 11:48:47', 32),
('AH-1-1-33', b'1', 'AN-1-1-39', 1, 0, '348.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-07 16:48:57', 1, 0, NULL, 0, '1', NULL, NULL, NULL, 'SP2022/0033', NULL, '2022-04-07 11:48:57', '2022-04-07 11:48:57', 33),
('AI-1-1-34', b'1', 'AO-1-1-40', 1, 0, '447.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-07 16:49:06', 1, 0, NULL, 0, '1', NULL, NULL, NULL, 'SP2022/0034', NULL, '2022-04-07 11:49:06', '2022-04-07 11:49:06', 34),
('AJ-1-1-35', b'1', 'AP-1-1-41', 1, 0, '797.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-07 16:49:14', 1, 0, NULL, 0, '1', NULL, NULL, NULL, 'SP2022/0035', NULL, '2022-04-07 11:49:14', '2022-04-07 11:49:14', 35),
('AK-1-1-36', b'1', 'AQ-1-1-42', 1, 0, '597.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-07 16:49:23', 1, 0, NULL, 0, '1', NULL, NULL, NULL, 'SP2022/0036', NULL, '2022-04-07 11:49:23', '2022-04-07 11:49:23', 36),
('AL-1-1-37', b'1', 'AR-1-1-43', 1, 0, '1997.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-07 16:49:31', 1, 0, NULL, 0, '1', NULL, NULL, NULL, 'SP2022/0037', NULL, '2022-04-07 11:49:31', '2022-04-07 11:49:31', 37),
('AM-1-1-38', b'1', 'AS-1-1-44', 1, 0, '1498.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-07 16:49:40', 1, 0, NULL, 0, '1', NULL, NULL, NULL, 'SP2022/0038', NULL, '2022-04-07 11:49:40', '2022-04-07 11:49:40', 38),
('AN-1-1-39', b'1', 'AT-1-1-45', 1, 0, '798.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-07 16:49:49', 1, 0, NULL, 0, '1', NULL, NULL, NULL, 'SP2022/0039', NULL, '2022-04-07 11:49:49', '2022-04-07 11:49:49', 39),
('AO-1-1-40', b'1', 'AU-1-1-46', 1, 0, '1297.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-07 16:49:58', 1, 0, NULL, 0, '1', NULL, NULL, NULL, 'SP2022/0040', NULL, '2022-04-07 11:49:58', '2022-04-07 11:49:58', 40),
('AP-1-1-41', b'1', 'AV-1-1-47', 1, 0, '1228.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-07 16:50:07', 1, 0, NULL, 0, '1', NULL, NULL, NULL, 'SP2022/0041', NULL, '2022-04-07 11:50:07', '2022-04-07 11:50:07', 41),
('AQ-1-1-42', b'1', 'AW-1-1-48', 1, 0, '1997.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-07 16:50:14', 1, 0, NULL, 0, '1', NULL, NULL, NULL, 'SP2022/0042', NULL, '2022-04-07 11:50:14', '2022-04-07 11:50:14', 42),
('AR-1-1-43', b'1', 'AX-1-1-49', 1, 0, '3046.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-07 16:50:37', 1, 0, NULL, 0, '1', NULL, NULL, NULL, 'SP2022/0043', NULL, '2022-04-07 11:50:37', '2022-04-07 11:50:37', 43),
('AS-1-1-44', b'1', 'AY-1-1-50', 1, 0, '2047.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-07 16:50:45', 1, 0, NULL, 0, '1', NULL, NULL, NULL, 'SP2022/0044', NULL, '2022-04-07 11:50:45', '2022-04-07 11:50:45', 44),
('AT-1-1-45', b'1', 'AZ-1-1-51', 1, 0, '1178.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-07 16:50:54', 1, 0, NULL, 0, '1', NULL, NULL, NULL, 'SP2022/0045', NULL, '2022-04-07 11:50:54', '2022-04-07 11:50:54', 45),
('AU-1-1-46', b'1', 'BA-1-1-52', 1, 0, '848.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-07 16:51:03', 1, 0, NULL, 0, '1', NULL, NULL, NULL, 'SP2022/0046', NULL, '2022-04-07 11:51:03', '2022-04-07 11:51:03', 46),
('AV-1-1-47', b'1', 'BB-1-1-53', 1, 0, '1298.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-07 16:51:14', 1, 0, NULL, 0, '1', NULL, NULL, NULL, 'SP2022/0047', NULL, '2022-04-07 11:51:14', '2022-04-07 11:51:14', 47),
('AW-1-1-48', b'1', 'BC-1-1-54', 1, 0, '978.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-07 16:51:26', 1, 0, NULL, 0, '1', NULL, NULL, NULL, 'SP2022/0048', NULL, '2022-04-07 11:51:26', '2022-04-07 11:51:26', 48),
('AX-1-1-49', b'1', 'BD-1-1-55', 1, 0, '1548.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-07 16:51:34', 1, 0, NULL, 0, '1', NULL, NULL, NULL, 'SP2022/0049', NULL, '2022-04-07 11:51:34', '2022-04-07 11:51:34', 49),
('AY-1-1-50', b'1', 'BE-1-1-56', 1, 0, '649.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-07 16:51:44', 1, 0, NULL, 0, '1', NULL, NULL, NULL, 'SP2022/0050', NULL, '2022-04-07 11:51:45', '2022-04-07 11:51:45', 50),
('AZ-1-1-51', b'1', 'BF-1-1-57', 1, 0, '999.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-07 16:51:50', 1, 0, NULL, 0, '1', NULL, NULL, NULL, 'SP2022/0051', NULL, '2022-04-07 11:51:50', '2022-04-07 11:51:50', 51),
('BA-1-1-52', b'1', 'BG-1-1-58', 1, 0, '499.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-07 16:51:57', 1, 0, NULL, 0, '1', NULL, NULL, NULL, 'SP2022/0052', NULL, '2022-04-07 11:51:57', '2022-04-07 11:51:57', 52),
('BB-1-1-53', b'1', 'BH-1-1-59', 1, 0, '299.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-07 16:52:03', 1, 0, NULL, 0, '1', NULL, NULL, NULL, 'SP2022/0053', NULL, '2022-04-07 11:52:03', '2022-04-07 11:52:03', 53),
('BC-1-1-54', b'1', 'BI-1-1-60', 1, 0, '679.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-07 16:52:12', 1, 0, NULL, 0, '1', NULL, NULL, NULL, 'SP2022/0054', NULL, '2022-04-07 11:52:12', '2022-04-07 11:52:12', 54),
('BD-1-1-55', b'1', 'BJ-1-1-61', 1, 0, '549.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-07 16:52:22', 1, 0, NULL, 0, '1', NULL, NULL, NULL, 'SP2022/0055', NULL, '2022-04-07 11:52:22', '2022-04-07 11:52:22', 55),
('BE-1-1-56', b'1', 'BK-1-1-62', 1, 0, '1498.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-07 16:52:29', 1, 0, NULL, 0, '1', NULL, NULL, NULL, 'SP2022/0056', NULL, '2022-04-07 11:52:29', '2022-04-07 11:52:29', 56),
('BF-1-1-57', b'1', 'BL-1-1-63', 1, 0, '948.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-07 16:52:36', 1, 0, NULL, 0, '1', NULL, NULL, NULL, 'SP2022/0057', NULL, '2022-04-07 11:52:36', '2022-04-07 11:52:36', 57),
('BG-1-1-58', b'1', 'BM-1-1-64', 1, 0, '299.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-07 16:52:43', 1, 0, NULL, 0, '1', NULL, NULL, NULL, 'SP2022/0058', NULL, '2022-04-07 11:52:43', '2022-04-07 11:52:43', 58),
('BH-1-1-59', b'1', 'BN-1-1-65', 1, 0, '728.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-07 16:52:53', 1, 0, NULL, 0, '1', NULL, NULL, NULL, 'SP2022/0059', NULL, '2022-04-07 11:52:53', '2022-04-07 11:52:53', 59),
('BI-1-1-60', b'1', 'BO-1-1-66', 1, 0, '679.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-07 16:53:11', 1, 0, NULL, 0, '1', NULL, NULL, NULL, 'SP2022/0060', NULL, '2022-04-07 11:53:11', '2022-04-07 11:53:11', 60),
('BJ-1-1-61', b'1', 'BP-1-1-67', 1, 0, '5088.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-07 16:53:29', 1, 0, NULL, 0, '1', NULL, NULL, NULL, 'SP2022/0061', NULL, '2022-04-07 11:53:29', '2022-04-07 11:53:29', 61),
('BK-1-1-62', b'1', 'BQ-1-1-68', 1, 0, '2194.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-07 16:53:41', 1, 0, NULL, 0, '1', NULL, NULL, NULL, 'SP2022/0062', NULL, '2022-04-07 11:53:41', '2022-04-07 11:53:41', 62),
('BL-1-1-63', b'1', 'BR-1-1-69', 1, 0, '1863.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-07 16:53:51', 1, 0, NULL, 0, '1', NULL, NULL, NULL, 'SP2022/0063', NULL, '2022-04-07 11:53:51', '2022-04-07 11:53:51', 63),
('BM-1-1-64', b'1', 'BS-1-1-70', 1, 0, '3341.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-07 16:54:05', 1, 0, NULL, 0, '1', NULL, NULL, NULL, 'SP2022/0064', NULL, '2022-04-07 11:54:05', '2022-04-07 11:54:05', 64),
('BN-1-1-65', b'1', 'BT-1-1-71', 1, 0, '3662.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-07 16:54:19', 1, 0, NULL, 0, '1', NULL, NULL, NULL, 'SP2022/0065', NULL, '2022-04-07 11:54:19', '2022-04-07 11:54:19', 65),
('BO-1-1-66', b'1', 'BU-1-1-72', 1, 0, '1295.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-07 16:54:38', 1, 0, NULL, 0, '1', NULL, NULL, NULL, 'SP2022/0066', NULL, '2022-04-07 11:54:38', '2022-04-07 11:54:38', 66),
('BP-1-1-67', b'1', 'BV-1-1-73', 1, 0, '6458.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-07 16:54:57', 1, 0, NULL, 0, '1', NULL, NULL, NULL, 'SP2022/0067', NULL, '2022-04-07 11:54:57', '2022-04-07 11:54:57', 67),
('BQ-1-1-68', b'1', 'BW-1-1-74', 1, 0, '7777.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-07 16:55:59', 1, 0, NULL, 0, '1', NULL, NULL, NULL, 'SP2022/0068', NULL, '2022-04-07 11:55:59', '2022-04-07 11:55:59', 68),
('BR-1-1-69', b'1', 'BX-1-1-75', 1, 0, '798.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-07 16:56:08', 1, 0, NULL, 0, '1', NULL, NULL, NULL, 'SP2022/0069', NULL, '2022-04-07 11:56:08', '2022-04-07 11:56:08', 69),
('BS-1-1-70', b'1', 'BY-1-1-76', 1, 0, '4383.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-07 16:56:21', 1, 0, NULL, 0, '1', NULL, NULL, NULL, 'SP2022/0070', NULL, '2022-04-07 11:56:21', '2022-04-07 11:56:21', 70),
('BT-1-1-71', b'1', 'BZ-1-1-77', 1, 0, '4759.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-07 16:56:40', 1, 0, NULL, 0, '1', NULL, NULL, NULL, 'SP2022/0071', NULL, '2022-04-07 11:56:40', '2022-04-07 11:56:40', 71),
('BU-1-1-72', b'1', 'CA-1-1-78', 1, 0, '3642.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-07 16:56:55', 1, 0, NULL, 0, '1', NULL, NULL, NULL, 'SP2022/0072', NULL, '2022-04-07 11:56:55', '2022-04-07 11:56:55', 72),
('BV-1-1-73', b'1', 'CB-1-1-79', 1, 0, '299.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-08 16:08:30', 1, 0, NULL, 0, '1', NULL, NULL, NULL, 'SP2022/0073', NULL, '2022-04-08 11:08:30', '2022-04-08 11:08:30', 73),
('BW-1-1-74', b'1', 'CB-1-1-79', 1, 0, '299.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-08 16:12:31', 1, 0, NULL, 0, '1', NULL, NULL, NULL, 'SP2022/0074', NULL, '2022-04-08 11:12:31', '2022-04-08 11:12:31', 74),
('BX-1-1-75', b'1', 'CD-1-1-81', 1, 0, '398.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-08 16:12:48', 1, 0, NULL, 0, '1', NULL, NULL, NULL, 'SP2022/0075', NULL, '2022-04-08 11:12:48', '2022-04-08 11:12:48', 75),
('BY-1-1-76', b'1', 'CE-1-1-82', 1, 0, '99.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-08 16:12:56', 1, 0, NULL, 0, '1', NULL, NULL, NULL, 'SP2022/0076', NULL, '2022-04-08 11:12:56', '2022-04-08 11:12:56', 76),
('BZ-1-1-77', b'1', 'CD-1-1-81', 1, 0, '7495.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-08 16:40:10', 1, 0, NULL, 0, '1', NULL, NULL, NULL, 'SP2022/0077', NULL, '2022-04-08 11:40:10', '2022-04-08 11:40:10', 77),
('C-1-1-2', b'1', 'H-1-1-7', 1, 1, '802.0000', 'cash', NULL, '', '', '', '', '', NULL, '', '', '', '2022-04-07 14:18:51', 1, 0, NULL, 0, '1', NULL, '', NULL, 'SP2022/0002', NULL, '2022-04-07 09:18:51', '2022-04-07 09:18:51', 2),
('CA-1-1-78', b'1', 'CG-1-1-84', 1, 0, '1000.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-08 16:40:33', 1, 0, NULL, 0, '1', NULL, NULL, NULL, 'SP2022/0078', NULL, '2022-04-08 11:40:33', '2022-04-08 11:40:33', 78),
('D-1-1-3', b'1', 'I-1-1-8', 1, 0, '300.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-07 14:21:38', 1, 0, NULL, 0, '1', NULL, NULL, NULL, 'SP2022/0003', NULL, '2022-04-07 09:21:38', '2022-04-07 09:21:38', 3),
('E-1-1-4', b'1', 'K-1-1-10', 1, 0, '3550.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-07 14:25:07', 1, 0, NULL, 0, '1', NULL, NULL, NULL, 'SP2022/0004', NULL, '2022-04-07 09:25:07', '2022-04-07 09:25:07', 4),
('F-1-1-5', b'1', 'J-1-1-9', 1, 0, '50000.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-07 14:26:22', 1, 0, NULL, 0, '1', NULL, NULL, NULL, 'SP2022/0005', NULL, '2022-04-07 09:26:22', '2022-04-07 09:26:22', 5),
('G-1-1-6', b'1', 'J-1-1-9', 1, 1, '47736.0000', 'cash', NULL, '', '', '', '', '', NULL, '', '', '', '2022-04-07 14:26:22', 1, 0, NULL, 0, '1', NULL, '', NULL, 'SP2022/0006', NULL, '2022-04-07 09:26:22', '2022-04-07 09:26:22', 6),
('H-1-1-7', b'1', 'L-1-1-11', 1, 0, '300.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-07 14:27:55', 1, 0, NULL, 0, '1', NULL, NULL, NULL, 'SP2022/0007', NULL, '2022-04-07 09:27:55', '2022-04-07 09:27:55', 7),
('I-1-1-8', b'1', 'M-1-1-12', 1, 0, '450.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-07 14:31:00', 1, 0, NULL, 0, NULL, NULL, NULL, NULL, 'SP2022/0008', NULL, '2022-04-07 09:32:00', '2022-04-07 09:32:00', 8),
('J-1-1-9', b'1', 'N-1-1-13', 1, 0, '1600.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-07 15:17:27', 1, 0, NULL, 0, '1', NULL, NULL, NULL, 'SP2022/0009', NULL, '2022-04-07 10:17:27', '2022-04-07 10:17:27', 9),
('K-1-1-10', b'1', 'Q-1-1-16', 1, 0, '149.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-07 15:30:18', 1, 0, NULL, 0, 'F-1-1-5', NULL, NULL, NULL, 'SP2022/0010', NULL, '2022-04-07 10:30:18', '2022-04-07 10:30:18', 10),
('L-1-1-11', b'1', 'R-1-1-17', 1, 0, '199.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-07 15:31:06', 1, 0, NULL, 0, 'G-1-1-6', NULL, NULL, NULL, 'SP2022/0011', NULL, '2022-04-07 10:31:06', '2022-04-07 10:31:06', 11),
('M-1-1-12', b'1', 'S-1-1-18', 1, 0, '1499.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-07 15:35:04', 1, 0, NULL, 0, 'H-1-1-7', NULL, NULL, NULL, 'SP2022/0012', NULL, '2022-04-07 10:35:04', '2022-04-07 10:35:04', 12),
('N-1-1-13', b'1', 'T-1-1-19', 1, 0, '99.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-07 15:38:13', 1, 0, NULL, 0, 'H-1-1-7', NULL, NULL, NULL, 'SP2022/0013', NULL, '2022-04-07 10:38:13', '2022-04-07 10:38:13', 13),
('O-1-1-14', b'1', 'U-1-1-20', 1, 0, '2000.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-07 15:41:59', 1, 0, NULL, 0, '1', NULL, NULL, NULL, 'SP2022/0014', NULL, '2022-04-07 10:41:59', '2022-04-07 10:41:59', 14),
('P-1-1-15', b'1', 'V-1-1-21', 1, 0, '20000.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-07 15:48:17', 1, 0, NULL, 0, '1', NULL, NULL, NULL, 'SP2022/0015', NULL, '2022-04-07 10:48:17', '2022-04-07 10:48:17', 15),
('Q-1-1-16', b'1', 'W-1-1-22', 1, 0, '200.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-07 16:44:59', 1, 0, NULL, 0, '1', NULL, NULL, NULL, 'SP2022/0016', NULL, '2022-04-07 11:44:59', '2022-04-07 11:44:59', 16),
('R-1-1-17', b'1', 'X-1-1-23', 1, 0, '199.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-07 16:45:07', 1, 0, NULL, 0, '1', NULL, NULL, NULL, 'SP2022/0017', NULL, '2022-04-07 11:45:07', '2022-04-07 11:45:07', 17),
('S-1-1-18', b'1', 'Y-1-1-24', 1, 0, '99.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-07 16:45:16', 1, 0, NULL, 0, '1', NULL, NULL, NULL, 'SP2022/0018', NULL, '2022-04-07 11:45:16', '2022-04-07 11:45:16', 18),
('T-1-1-19', b'1', 'Z-1-1-25', 1, 0, '99.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-07 16:45:41', 1, 0, NULL, 0, '1', NULL, NULL, NULL, 'SP2022/0019', NULL, '2022-04-07 11:45:41', '2022-04-07 11:45:41', 19),
('U-1-1-20', b'1', 'AA-1-1-26', 1, 0, '800.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-07 16:45:54', 1, 0, NULL, 0, '1', NULL, NULL, NULL, 'SP2022/0020', NULL, '2022-04-07 11:45:54', '2022-04-07 11:45:54', 20),
('V-1-1-21', b'1', 'AB-1-1-27', 1, 0, '698.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-07 16:46:03', 1, 0, NULL, 0, '1', NULL, NULL, NULL, 'SP2022/0021', NULL, '2022-04-07 11:46:03', '2022-04-07 11:46:03', 21),
('W-1-1-22', b'1', 'AC-1-1-28', 1, 0, '698.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-07 16:46:12', 1, 0, NULL, 0, '1', NULL, NULL, NULL, 'SP2022/0022', NULL, '2022-04-07 11:46:12', '2022-04-07 11:46:12', 22),
('X-1-1-23', b'1', 'AD-1-1-29', 1, 0, '797.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-07 16:46:20', 1, 0, NULL, 0, '1', NULL, NULL, NULL, 'SP2022/0023', NULL, '2022-04-07 11:46:20', '2022-04-07 11:46:20', 23),
('Y-1-1-24', b'1', 'AE-1-1-30', 1, 0, '249.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-07 16:46:50', 1, 0, NULL, 0, '1', NULL, NULL, NULL, 'SP2022/0024', NULL, '2022-04-07 11:46:50', '2022-04-07 11:46:50', 24),
('Z-1-1-25', b'1', 'AF-1-1-31', 1, 0, '99.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-07 16:47:19', 1, 0, NULL, 0, '1', NULL, NULL, NULL, 'SP2022/0025', NULL, '2022-04-07 11:47:19', '2022-04-07 11:47:19', 25);

-- --------------------------------------------------------

--
-- Table structure for table `transaction_sell_lines`
--

CREATE TABLE `transaction_sell_lines` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sync_status` bit(1) DEFAULT b'0',
  `transaction_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `variation_id` int(10) UNSIGNED NOT NULL,
  `quantity` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `quantity_returned` decimal(20,4) NOT NULL DEFAULT 0.0000,
  `unit_price_before_discount` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `unit_price` decimal(22,4) DEFAULT NULL COMMENT 'Sell price excluding tax',
  `line_discount_type` enum('fixed','percentage') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `line_discount_amount` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `unit_price_inc_tax` decimal(22,4) DEFAULT NULL COMMENT 'Sell price including tax',
  `item_tax` decimal(22,4) NOT NULL COMMENT 'Tax for one quantity',
  `tax_id` int(10) UNSIGNED DEFAULT NULL,
  `discount_id` int(11) DEFAULT NULL,
  `lot_no_line_id` int(11) DEFAULT NULL,
  `sell_line_note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `so_line_id` int(11) DEFAULT NULL,
  `so_quantity_invoiced` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `res_service_staff_id` int(11) DEFAULT NULL,
  `res_line_order_status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_sell_line_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'sell line id of parent',
  `children_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'Type of children for the parent, like modifier or combo',
  `sub_unit_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `ai_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transaction_sell_lines`
--

INSERT INTO `transaction_sell_lines` (`id`, `sync_status`, `transaction_id`, `product_id`, `variation_id`, `quantity`, `quantity_returned`, `unit_price_before_discount`, `unit_price`, `line_discount_type`, `line_discount_amount`, `unit_price_inc_tax`, `item_tax`, `tax_id`, `discount_id`, `lot_no_line_id`, `sell_line_note`, `so_line_id`, `so_quantity_invoiced`, `res_service_staff_id`, `res_line_order_status`, `parent_sell_line_id`, `children_type`, `sub_unit_id`, `created_at`, `updated_at`, `ai_id`) VALUES
('A-1-1-0', b'1', 'H-1-1-7', 60, 62, '1.0000', '0.0000', '1499.0000', '1499.0000', 'fixed', '0.0000', '1499.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', 3, 'received', NULL, '', NULL, '2022-04-07 09:16:36', '2022-04-07 09:18:51', 1),
('AA-1-1-26', b'1', 'N-1-1-13', 7, 7, '8.0000', '0.0000', '200.0000', '200.0000', 'fixed', '0.0000', '200.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-07 10:17:27', '2022-04-07 10:17:27', 26),
('AB-1-1-27', b'1', 'P-1-1-15', 167, 173, '1.0000', '0.0000', '3500.0000', '3500.0000', 'fixed', '0.0000', '3500.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-07 10:23:57', '2022-04-07 10:23:57', 27),
('AC-1-1-28', b'1', 'P-1-1-15', 3, 3, '5.0000', '0.0000', '500.6148', '500.6148', NULL, '0.0000', '500.6148', '0.0000', NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, 'AB-1-1-27', 'combo', NULL, '2022-04-07 10:23:57', '2022-04-07 10:23:57', 28),
('AD-1-1-29', b'1', 'P-1-1-15', 4, 4, '5.0000', '0.0000', '113.3197', '113.3197', NULL, '0.0000', '113.3197', '0.0000', NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, 'AB-1-1-27', 'combo', NULL, '2022-04-07 10:23:57', '2022-04-07 10:23:57', 29),
('AE-1-1-30', b'1', 'P-1-1-15', 162, 164, '5.0000', '0.0000', '86.0656', '86.0656', NULL, '0.0000', '86.0656', '0.0000', NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, 'AB-1-1-27', 'combo', NULL, '2022-04-07 10:23:57', '2022-04-07 10:23:57', 30),
('AF-1-1-31', b'1', 'Q-1-1-16', 142, 144, '1.0000', '0.0000', '149.0000', '149.0000', 'fixed', '0.0000', '149.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-07 10:30:18', '2022-04-07 10:30:18', 31),
('AG-1-1-32', b'1', 'R-1-1-17', 129, 131, '1.0000', '0.0000', '199.0000', '199.0000', 'fixed', '0.0000', '199.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-07 10:31:06', '2022-04-07 10:31:06', 32),
('AH-1-1-33', b'1', 'S-1-1-18', 59, 61, '1.0000', '0.0000', '1499.0000', '1499.0000', 'fixed', '0.0000', '1499.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-07 10:35:04', '2022-04-07 10:35:04', 33),
('AI-1-1-34', b'1', 'T-1-1-19', 121, 123, '1.0000', '0.0000', '99.0000', '99.0000', 'fixed', '0.0000', '99.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-07 10:38:13', '2022-04-07 10:38:13', 34),
('AJ-1-1-35', b'1', 'U-1-1-20', 7, 7, '10.0000', '0.0000', '200.0000', '200.0000', 'fixed', '0.0000', '200.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-07 10:41:59', '2022-04-07 10:41:59', 35),
('AK-1-1-36', b'1', 'V-1-1-21', 7, 7, '100.0000', '0.0000', '200.0000', '200.0000', 'fixed', '0.0000', '200.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-07 10:48:17', '2022-04-07 10:48:17', 36),
('AL-1-1-37', b'1', 'W-1-1-22', 7, 7, '1.0000', '0.0000', '200.0000', '200.0000', 'fixed', '0.0000', '200.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-07 11:44:58', '2022-04-07 11:44:58', 37),
('AM-1-1-38', b'1', 'X-1-1-23', 144, 146, '1.0000', '0.0000', '199.0000', '199.0000', 'fixed', '0.0000', '199.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-07 11:45:07', '2022-04-07 11:45:07', 38),
('AN-1-1-39', b'1', 'Y-1-1-24', 121, 123, '1.0000', '0.0000', '99.0000', '99.0000', 'fixed', '0.0000', '99.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-07 11:45:16', '2022-04-07 11:45:16', 39),
('AO-1-1-40', b'1', 'Z-1-1-25', 121, 123, '1.0000', '0.0000', '99.0000', '99.0000', 'fixed', '0.0000', '99.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-07 11:45:41', '2022-04-07 11:45:41', 40),
('AP-1-1-41', b'1', 'AA-1-1-26', 7, 9, '1.0000', '0.0000', '800.0000', '800.0000', 'fixed', '0.0000', '800.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-07 11:45:54', '2022-04-07 11:45:54', 41),
('AQ-1-1-42', b'1', 'AB-1-1-27', 95, 97, '1.0000', '0.0000', '599.0000', '599.0000', 'fixed', '0.0000', '599.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-07 11:46:03', '2022-04-07 11:46:03', 42),
('AR-1-1-43', b'1', 'AB-1-1-27', 120, 122, '1.0000', '0.0000', '99.0000', '99.0000', 'fixed', '0.0000', '99.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-07 11:46:03', '2022-04-07 11:46:03', 43),
('AS-1-1-44', b'1', 'AC-1-1-28', 95, 97, '1.0000', '0.0000', '599.0000', '599.0000', 'fixed', '0.0000', '599.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-07 11:46:12', '2022-04-07 11:46:12', 44),
('AT-1-1-45', b'1', 'AC-1-1-28', 120, 122, '1.0000', '0.0000', '99.0000', '99.0000', 'fixed', '0.0000', '99.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-07 11:46:12', '2022-04-07 11:46:12', 45),
('AU-1-1-46', b'1', 'AD-1-1-29', 17, 19, '1.0000', '0.0000', '299.0000', '299.0000', 'fixed', '0.0000', '299.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-07 11:46:20', '2022-04-07 11:46:20', 46),
('AV-1-1-47', b'1', 'AD-1-1-29', 120, 122, '1.0000', '0.0000', '99.0000', '99.0000', 'fixed', '0.0000', '99.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-07 11:46:20', '2022-04-07 11:46:20', 47),
('AW-1-1-48', b'1', 'AD-1-1-29', 154, 156, '1.0000', '0.0000', '399.0000', '399.0000', 'fixed', '0.0000', '399.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-07 11:46:20', '2022-04-07 11:46:20', 48),
('AX-1-1-49', b'1', 'AE-1-1-30', 84, 86, '1.0000', '0.0000', '249.0000', '249.0000', 'fixed', '0.0000', '249.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-07 11:46:50', '2022-04-07 11:46:50', 49),
('AY-1-1-50', b'1', 'AF-1-1-31', 120, 122, '1.0000', '0.0000', '99.0000', '99.0000', 'fixed', '0.0000', '99.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-07 11:47:19', '2022-04-07 11:47:19', 50),
('AZ-1-1-51', b'1', 'AG-1-1-32', 17, 19, '1.0000', '0.0000', '299.0000', '299.0000', 'fixed', '0.0000', '299.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-07 11:47:29', '2022-04-07 11:47:29', 51),
('BA-1-1-52', b'1', 'AG-1-1-32', 120, 122, '1.0000', '0.0000', '99.0000', '99.0000', 'fixed', '0.0000', '99.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-07 11:47:29', '2022-04-07 11:47:29', 52),
('BB-1-1-53', b'1', 'AH-1-1-33', 121, 123, '1.0000', '0.0000', '99.0000', '99.0000', 'fixed', '0.0000', '99.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-07 11:48:02', '2022-04-07 11:48:02', 53),
('BC-1-1-54', b'1', 'AH-1-1-33', 154, 156, '1.0000', '0.0000', '399.0000', '399.0000', 'fixed', '0.0000', '399.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-07 11:48:02', '2022-04-07 11:48:02', 54),
('BD-1-1-55', b'1', 'AI-1-1-34', 152, 154, '1.0000', '0.0000', '249.0000', '249.0000', 'fixed', '0.0000', '249.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-07 11:48:10', '2022-04-07 11:48:10', 55),
('BE-1-1-56', b'1', 'AJ-1-1-35', 142, 144, '1.0000', '0.0000', '149.0000', '149.0000', 'fixed', '0.0000', '149.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-07 11:48:19', '2022-04-07 11:48:19', 56),
('BF-1-1-57', b'1', 'AJ-1-1-35', 129, 131, '1.0000', '0.0000', '199.0000', '199.0000', 'fixed', '0.0000', '199.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-07 11:48:19', '2022-04-07 11:48:19', 57),
('BG-1-1-58', b'1', 'AK-1-1-36', 129, 131, '1.0000', '0.0000', '199.0000', '199.0000', 'fixed', '0.0000', '199.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-07 11:48:32', '2022-04-07 11:48:32', 58),
('BH-1-1-59', b'1', 'AK-1-1-36', 152, 154, '1.0000', '0.0000', '249.0000', '249.0000', 'fixed', '0.0000', '249.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-07 11:48:32', '2022-04-07 11:48:32', 59),
('BI-1-1-60', b'1', 'AL-1-1-37', 152, 154, '1.0000', '0.0000', '249.0000', '249.0000', 'fixed', '0.0000', '249.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-07 11:48:39', '2022-04-07 11:48:39', 60),
('BJ-1-1-61', b'1', 'AL-1-1-37', 129, 131, '1.0000', '0.0000', '199.0000', '199.0000', 'fixed', '0.0000', '199.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-07 11:48:39', '2022-04-07 11:48:39', 61),
('BK-1-1-62', b'1', 'AM-1-1-38', 120, 122, '1.0000', '0.0000', '99.0000', '99.0000', 'fixed', '0.0000', '99.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-07 11:48:47', '2022-04-07 11:48:47', 62),
('BL-1-1-63', b'1', 'AM-1-1-38', 51, 53, '1.0000', '0.0000', '899.0000', '899.0000', 'fixed', '0.0000', '899.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-07 11:48:47', '2022-04-07 11:48:47', 63),
('BM-1-1-64', b'1', 'AN-1-1-39', 149, 151, '1.0000', '0.0000', '249.0000', '249.0000', 'fixed', '0.0000', '249.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-07 11:48:57', '2022-04-07 11:48:57', 64),
('BN-1-1-65', b'1', 'AN-1-1-39', 120, 122, '1.0000', '0.0000', '99.0000', '99.0000', 'fixed', '0.0000', '99.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-07 11:48:57', '2022-04-07 11:48:57', 65),
('BO-1-1-66', b'1', 'AO-1-1-40', 121, 123, '1.0000', '0.0000', '99.0000', '99.0000', 'fixed', '0.0000', '99.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-07 11:49:06', '2022-04-07 11:49:06', 66),
('BP-1-1-67', b'1', 'AO-1-1-40', 120, 122, '1.0000', '0.0000', '99.0000', '99.0000', 'fixed', '0.0000', '99.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-07 11:49:06', '2022-04-07 11:49:06', 67),
('BQ-1-1-68', b'1', 'AO-1-1-40', 149, 151, '1.0000', '0.0000', '249.0000', '249.0000', 'fixed', '0.0000', '249.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-07 11:49:06', '2022-04-07 11:49:06', 68),
('BR-1-1-69', b'1', 'AP-1-1-41', 17, 19, '1.0000', '0.0000', '299.0000', '299.0000', 'fixed', '0.0000', '299.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-07 11:49:14', '2022-04-07 11:49:14', 69),
('BS-1-1-70', b'1', 'AP-1-1-41', 120, 122, '1.0000', '0.0000', '99.0000', '99.0000', 'fixed', '0.0000', '99.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-07 11:49:14', '2022-04-07 11:49:14', 70),
('BT-1-1-71', b'1', 'AP-1-1-41', 154, 156, '1.0000', '0.0000', '399.0000', '399.0000', 'fixed', '0.0000', '399.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-07 11:49:14', '2022-04-07 11:49:14', 71),
('BU-1-1-72', b'1', 'AQ-1-1-42', 149, 151, '1.0000', '0.0000', '249.0000', '249.0000', 'fixed', '0.0000', '249.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-07 11:49:23', '2022-04-07 11:49:23', 72),
('BV-1-1-73', b'1', 'AQ-1-1-42', 142, 144, '1.0000', '0.0000', '149.0000', '149.0000', 'fixed', '0.0000', '149.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-07 11:49:23', '2022-04-07 11:49:23', 73),
('BW-1-1-74', b'1', 'AQ-1-1-42', 129, 131, '1.0000', '0.0000', '199.0000', '199.0000', 'fixed', '0.0000', '199.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-07 11:49:23', '2022-04-07 11:49:23', 74),
('BX-1-1-75', b'1', 'AR-1-1-43', 144, 146, '1.0000', '0.0000', '199.0000', '199.0000', 'fixed', '0.0000', '199.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-07 11:49:31', '2022-04-07 11:49:31', 75),
('BY-1-1-76', b'1', 'AR-1-1-43', 17, 19, '1.0000', '0.0000', '299.0000', '299.0000', 'fixed', '0.0000', '299.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-07 11:49:31', '2022-04-07 11:49:31', 76),
('BZ-1-1-77', b'1', 'AR-1-1-43', 59, 61, '1.0000', '0.0000', '1499.0000', '1499.0000', 'fixed', '0.0000', '1499.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-07 11:49:31', '2022-04-07 11:49:31', 77),
('C-1-1-2', b'1', 'H-1-1-7', 27, 29, '1.0000', '0.0000', '199.0000', '199.0000', 'fixed', '0.0000', '199.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', 3, 'received', NULL, '', NULL, '2022-04-07 09:16:36', '2022-04-07 09:18:51', 2),
('CA-1-1-78', b'1', 'AS-1-1-44', 51, 53, '1.0000', '0.0000', '899.0000', '899.0000', 'fixed', '0.0000', '899.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-07 11:49:40', '2022-04-07 11:49:40', 78),
('CB-1-1-79', b'1', 'AS-1-1-44', 95, 97, '1.0000', '0.0000', '599.0000', '599.0000', 'fixed', '0.0000', '599.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-07 11:49:40', '2022-04-07 11:49:40', 79),
('CC-1-1-80', b'1', 'AT-1-1-45', 11, 13, '1.0000', '0.0000', '299.0000', '299.0000', 'fixed', '0.0000', '299.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-07 11:49:49', '2022-04-07 11:49:49', 80),
('CD-1-1-81', b'1', 'AT-1-1-45', 44, 46, '1.0000', '0.0000', '499.0000', '499.0000', 'fixed', '0.0000', '499.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-07 11:49:49', '2022-04-07 11:49:49', 81),
('CE-1-1-82', b'1', 'AU-1-1-46', 44, 46, '1.0000', '0.0000', '499.0000', '499.0000', 'fixed', '0.0000', '499.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-07 11:49:58', '2022-04-07 11:49:58', 82),
('CF-1-1-83', b'1', 'AU-1-1-46', 23, 25, '1.0000', '0.0000', '499.0000', '499.0000', 'fixed', '0.0000', '499.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-07 11:49:58', '2022-04-07 11:49:58', 83),
('CG-1-1-84', b'1', 'AU-1-1-46', 19, 21, '1.0000', '0.0000', '299.0000', '299.0000', 'fixed', '0.0000', '299.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-07 11:49:58', '2022-04-07 11:49:58', 84),
('CH-1-1-85', b'1', 'AV-1-1-47', 34, 36, '1.0000', '0.0000', '679.0000', '679.0000', 'fixed', '0.0000', '679.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-07 11:50:07', '2022-04-07 11:50:07', 85),
('CI-1-1-86', b'1', 'AV-1-1-47', 53, 55, '1.0000', '0.0000', '549.0000', '549.0000', 'fixed', '0.0000', '549.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-07 11:50:07', '2022-04-07 11:50:07', 86),
('CJ-1-1-87', b'1', 'AW-1-1-48', 61, 63, '1.0000', '0.0000', '999.0000', '999.0000', 'fixed', '0.0000', '999.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-07 11:50:14', '2022-04-07 11:50:14', 87),
('CK-1-1-88', b'1', 'AW-1-1-48', 44, 46, '1.0000', '0.0000', '499.0000', '499.0000', 'fixed', '0.0000', '499.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-07 11:50:14', '2022-04-07 11:50:14', 88),
('CL-1-1-89', b'1', 'AW-1-1-48', 23, 25, '1.0000', '0.0000', '499.0000', '499.0000', 'fixed', '0.0000', '499.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-07 11:50:14', '2022-04-07 11:50:14', 89),
('CM-1-1-90', b'1', 'AX-1-1-49', 44, 46, '1.0000', '0.0000', '499.0000', '499.0000', 'fixed', '0.0000', '499.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-07 11:50:37', '2022-04-07 11:50:37', 90),
('CN-1-1-91', b'1', 'AX-1-1-49', 61, 63, '2.0000', '0.0000', '999.0000', '999.0000', 'fixed', '0.0000', '999.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-07 11:50:37', '2022-04-07 11:50:37', 91),
('CO-1-1-92', b'1', 'AX-1-1-49', 53, 55, '1.0000', '0.0000', '549.0000', '549.0000', 'fixed', '0.0000', '549.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-07 11:50:37', '2022-04-07 11:50:37', 92),
('CP-1-1-93', b'1', 'AY-1-1-50', 44, 46, '1.0000', '0.0000', '499.0000', '499.0000', 'fixed', '0.0000', '499.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-07 11:50:45', '2022-04-07 11:50:45', 93),
('CQ-1-1-94', b'1', 'AY-1-1-50', 61, 63, '1.0000', '0.0000', '999.0000', '999.0000', 'fixed', '0.0000', '999.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-07 11:50:45', '2022-04-07 11:50:45', 94),
('CR-1-1-95', b'1', 'AY-1-1-50', 53, 55, '1.0000', '0.0000', '549.0000', '549.0000', 'fixed', '0.0000', '549.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-07 11:50:45', '2022-04-07 11:50:45', 95),
('CS-1-1-96', b'1', 'AZ-1-1-51', 72, 74, '1.0000', '0.0000', '679.0000', '679.0000', 'fixed', '0.0000', '679.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-07 11:50:54', '2022-04-07 11:50:54', 96),
('CT-1-1-97', b'1', 'AZ-1-1-51', 44, 46, '1.0000', '0.0000', '499.0000', '499.0000', 'fixed', '0.0000', '499.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-07 11:50:54', '2022-04-07 11:50:54', 97),
('CU-1-1-98', b'1', 'BA-1-1-52', 39, 41, '1.0000', '0.0000', '299.0000', '299.0000', 'fixed', '0.0000', '299.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-07 11:51:03', '2022-04-07 11:51:03', 98),
('CV-1-1-99', b'1', 'BA-1-1-52', 53, 55, '1.0000', '0.0000', '549.0000', '549.0000', 'fixed', '0.0000', '549.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-07 11:51:03', '2022-04-07 11:51:03', 99),
('CW-1-1-100', b'1', 'BB-1-1-53', 39, 41, '1.0000', '0.0000', '299.0000', '299.0000', 'fixed', '0.0000', '299.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-07 11:51:14', '2022-04-07 11:51:14', 100),
('CX-1-1-101', b'1', 'BB-1-1-53', 61, 63, '1.0000', '0.0000', '999.0000', '999.0000', 'fixed', '0.0000', '999.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-07 11:51:14', '2022-04-07 11:51:14', 101),
('CY-1-1-102', b'1', 'BC-1-1-54', 72, 74, '1.0000', '0.0000', '679.0000', '679.0000', 'fixed', '0.0000', '679.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-07 11:51:26', '2022-04-07 11:51:26', 102),
('CZ-1-1-103', b'1', 'BC-1-1-54', 11, 13, '1.0000', '0.0000', '299.0000', '299.0000', 'fixed', '0.0000', '299.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-07 11:51:26', '2022-04-07 11:51:26', 103),
('D-1-1-3', b'1', 'H-1-1-7', 165, 168, '1.0000', '0.0000', '50.0000', '50.0000', NULL, '0.0000', '50.0000', '0.0000', NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, 'C-1-1-2', 'modifier', NULL, '2022-04-07 09:16:36', '2022-04-07 09:18:51', 3),
('DA-1-1-104', b'1', 'BD-1-1-55', 61, 63, '1.0000', '0.0000', '999.0000', '999.0000', 'fixed', '0.0000', '999.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-07 11:51:34', '2022-04-07 11:51:34', 104),
('DB-1-1-105', b'1', 'BD-1-1-55', 53, 55, '1.0000', '0.0000', '549.0000', '549.0000', 'fixed', '0.0000', '549.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-07 11:51:34', '2022-04-07 11:51:34', 105),
('DC-1-1-106', b'1', 'BE-1-1-56', 35, 37, '1.0000', '0.0000', '649.0000', '649.0000', 'fixed', '0.0000', '649.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-07 11:51:44', '2022-04-07 11:51:44', 106),
('DD-1-1-107', b'1', 'BF-1-1-57', 61, 63, '1.0000', '0.0000', '999.0000', '999.0000', 'fixed', '0.0000', '999.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-07 11:51:50', '2022-04-07 11:51:50', 107),
('DE-1-1-108', b'1', 'BG-1-1-58', 44, 46, '1.0000', '0.0000', '499.0000', '499.0000', 'fixed', '0.0000', '499.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-07 11:51:57', '2022-04-07 11:51:57', 108),
('DF-1-1-109', b'1', 'BH-1-1-59', 11, 13, '1.0000', '0.0000', '299.0000', '299.0000', 'fixed', '0.0000', '299.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-07 11:52:03', '2022-04-07 11:52:03', 109),
('DG-1-1-110', b'1', 'BI-1-1-60', 72, 74, '1.0000', '0.0000', '679.0000', '679.0000', 'fixed', '0.0000', '679.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-07 11:52:12', '2022-04-07 11:52:12', 110),
('DH-1-1-111', b'1', 'BJ-1-1-61', 53, 55, '1.0000', '0.0000', '549.0000', '549.0000', 'fixed', '0.0000', '549.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-07 11:52:22', '2022-04-07 11:52:22', 111),
('DI-1-1-112', b'1', 'BK-1-1-62', 61, 63, '1.0000', '0.0000', '999.0000', '999.0000', 'fixed', '0.0000', '999.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-07 11:52:29', '2022-04-07 11:52:29', 112),
('DJ-1-1-113', b'1', 'BK-1-1-62', 44, 46, '1.0000', '0.0000', '499.0000', '499.0000', 'fixed', '0.0000', '499.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-07 11:52:29', '2022-04-07 11:52:29', 113),
('DK-1-1-114', b'1', 'BL-1-1-63', 11, 13, '1.0000', '0.0000', '299.0000', '299.0000', 'fixed', '0.0000', '299.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-07 11:52:36', '2022-04-07 11:52:36', 114),
('DL-1-1-115', b'1', 'BL-1-1-63', 35, 37, '1.0000', '0.0000', '649.0000', '649.0000', 'fixed', '0.0000', '649.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-07 11:52:36', '2022-04-07 11:52:36', 115),
('DM-1-1-116', b'1', 'BM-1-1-64', 39, 41, '1.0000', '0.0000', '299.0000', '299.0000', 'fixed', '0.0000', '299.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-07 11:52:43', '2022-04-07 11:52:43', 116),
('DN-1-1-117', b'1', 'BN-1-1-65', 26, 28, '1.0000', '0.0000', '179.0000', '179.0000', 'fixed', '0.0000', '179.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-07 11:52:53', '2022-04-07 11:52:53', 117),
('DO-1-1-118', b'1', 'BN-1-1-65', 53, 55, '1.0000', '0.0000', '549.0000', '549.0000', 'fixed', '0.0000', '549.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-07 11:52:53', '2022-04-07 11:52:53', 118),
('DP-1-1-119', b'1', 'BO-1-1-66', 72, 74, '1.0000', '0.0000', '679.0000', '679.0000', 'fixed', '0.0000', '679.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-07 11:53:11', '2022-04-07 11:53:11', 119),
('DQ-1-1-120', b'1', 'BP-1-1-67', 11, 13, '7.0000', '0.0000', '299.0000', '299.0000', 'fixed', '0.0000', '299.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-07 11:53:29', '2022-04-07 11:53:29', 120),
('DR-1-1-121', b'1', 'BP-1-1-67', 44, 46, '1.0000', '0.0000', '499.0000', '499.0000', 'fixed', '0.0000', '499.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-07 11:53:29', '2022-04-07 11:53:29', 121),
('DS-1-1-122', b'1', 'BP-1-1-67', 39, 41, '1.0000', '0.0000', '299.0000', '299.0000', 'fixed', '0.0000', '299.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-07 11:53:29', '2022-04-07 11:53:29', 122),
('DT-1-1-123', b'1', 'BP-1-1-67', 53, 55, '1.0000', '0.0000', '549.0000', '549.0000', 'fixed', '0.0000', '549.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-07 11:53:29', '2022-04-07 11:53:29', 123),
('DU-1-1-124', b'1', 'BP-1-1-67', 61, 63, '1.0000', '0.0000', '999.0000', '999.0000', 'fixed', '0.0000', '999.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-07 11:53:29', '2022-04-07 11:53:29', 124),
('DV-1-1-125', b'1', 'BP-1-1-67', 35, 37, '1.0000', '0.0000', '649.0000', '649.0000', 'fixed', '0.0000', '649.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-07 11:53:29', '2022-04-07 11:53:29', 125),
('DW-1-1-126', b'1', 'BQ-1-1-68', 154, 156, '1.0000', '0.0000', '399.0000', '399.0000', 'fixed', '0.0000', '399.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-07 11:53:41', '2022-04-07 11:53:41', 126),
('DX-1-1-127', b'1', 'BQ-1-1-68', 152, 154, '1.0000', '0.0000', '249.0000', '249.0000', 'fixed', '0.0000', '249.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-07 11:53:41', '2022-04-07 11:53:41', 127),
('DY-1-1-128', b'1', 'BQ-1-1-68', 129, 131, '1.0000', '0.0000', '199.0000', '199.0000', 'fixed', '0.0000', '199.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-07 11:53:41', '2022-04-07 11:53:41', 128),
('DZ-1-1-129', b'1', 'BQ-1-1-68', 149, 151, '1.0000', '0.0000', '249.0000', '249.0000', 'fixed', '0.0000', '249.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-07 11:53:41', '2022-04-07 11:53:41', 129),
('E-1-1-4', b'1', 'H-1-1-7', 165, 169, '1.0000', '0.0000', '50.0000', '50.0000', NULL, '0.0000', '50.0000', '0.0000', NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, 'C-1-1-2', 'modifier', NULL, '2022-04-07 09:16:36', '2022-04-07 09:18:51', 4),
('EA-1-1-130', b'1', 'BQ-1-1-68', 144, 146, '1.0000', '0.0000', '199.0000', '199.0000', 'fixed', '0.0000', '199.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-07 11:53:41', '2022-04-07 11:53:41', 130),
('EB-1-1-131', b'1', 'BQ-1-1-68', 51, 53, '1.0000', '0.0000', '899.0000', '899.0000', 'fixed', '0.0000', '899.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-07 11:53:41', '2022-04-07 11:53:41', 131),
('EC-1-1-132', b'1', 'BR-1-1-69', 110, 112, '1.0000', '0.0000', '69.0000', '69.0000', 'fixed', '0.0000', '69.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-07 11:53:51', '2022-04-07 11:53:51', 132),
('ED-1-1-133', b'1', 'BR-1-1-69', 121, 123, '1.0000', '0.0000', '99.0000', '99.0000', 'fixed', '0.0000', '99.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-07 11:53:51', '2022-04-07 11:53:51', 133),
('EE-1-1-134', b'1', 'BR-1-1-69', 84, 86, '1.0000', '0.0000', '249.0000', '249.0000', 'fixed', '0.0000', '249.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-07 11:53:51', '2022-04-07 11:53:51', 134),
('EF-1-1-135', b'1', 'BR-1-1-69', 21, 23, '1.0000', '0.0000', '499.0000', '499.0000', 'fixed', '0.0000', '499.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-07 11:53:51', '2022-04-07 11:53:51', 135),
('EG-1-1-136', b'1', 'BR-1-1-69', 152, 154, '1.0000', '0.0000', '249.0000', '249.0000', 'fixed', '0.0000', '249.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-07 11:53:51', '2022-04-07 11:53:51', 136),
('EH-1-1-137', b'1', 'BR-1-1-69', 154, 156, '1.0000', '0.0000', '399.0000', '399.0000', 'fixed', '0.0000', '399.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-07 11:53:51', '2022-04-07 11:53:51', 137),
('EI-1-1-138', b'1', 'BR-1-1-69', 17, 19, '1.0000', '0.0000', '299.0000', '299.0000', 'fixed', '0.0000', '299.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-07 11:53:51', '2022-04-07 11:53:51', 138),
('EJ-1-1-139', b'1', 'BS-1-1-70', 17, 19, '1.0000', '0.0000', '299.0000', '299.0000', 'fixed', '0.0000', '299.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-07 11:54:05', '2022-04-07 11:54:05', 139),
('EK-1-1-140', b'1', 'BS-1-1-70', 120, 122, '1.0000', '0.0000', '99.0000', '99.0000', 'fixed', '0.0000', '99.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-07 11:54:05', '2022-04-07 11:54:05', 140),
('EL-1-1-141', b'1', 'BS-1-1-70', 154, 156, '1.0000', '0.0000', '399.0000', '399.0000', 'fixed', '0.0000', '399.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-07 11:54:05', '2022-04-07 11:54:05', 141),
('EM-1-1-142', b'1', 'BS-1-1-70', 152, 154, '1.0000', '0.0000', '249.0000', '249.0000', 'fixed', '0.0000', '249.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-07 11:54:05', '2022-04-07 11:54:05', 142),
('EN-1-1-143', b'1', 'BS-1-1-70', 129, 131, '1.0000', '0.0000', '199.0000', '199.0000', 'fixed', '0.0000', '199.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-07 11:54:05', '2022-04-07 11:54:05', 143),
('EO-1-1-144', b'1', 'BS-1-1-70', 142, 144, '1.0000', '0.0000', '149.0000', '149.0000', 'fixed', '0.0000', '149.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-07 11:54:05', '2022-04-07 11:54:05', 144),
('EP-1-1-145', b'1', 'BS-1-1-70', 149, 151, '1.0000', '0.0000', '249.0000', '249.0000', 'fixed', '0.0000', '249.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-07 11:54:05', '2022-04-07 11:54:05', 145),
('EQ-1-1-146', b'1', 'BS-1-1-70', 144, 146, '1.0000', '0.0000', '199.0000', '199.0000', 'fixed', '0.0000', '199.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-07 11:54:05', '2022-04-07 11:54:05', 146),
('ER-1-1-147', b'1', 'BS-1-1-70', 59, 61, '1.0000', '0.0000', '1499.0000', '1499.0000', 'fixed', '0.0000', '1499.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-07 11:54:05', '2022-04-07 11:54:05', 147),
('ES-1-1-148', b'1', 'BT-1-1-71', 60, 62, '1.0000', '0.0000', '1499.0000', '1499.0000', 'fixed', '0.0000', '1499.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-07 11:54:19', '2022-04-07 11:54:19', 148),
('ET-1-1-149', b'1', 'BT-1-1-71', 52, 54, '1.0000', '0.0000', '599.0000', '599.0000', 'fixed', '0.0000', '599.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-07 11:54:19', '2022-04-07 11:54:19', 149),
('EU-1-1-150', b'1', 'BT-1-1-71', 82, 84, '1.0000', '0.0000', '199.0000', '199.0000', 'fixed', '0.0000', '199.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-07 11:54:19', '2022-04-07 11:54:19', 150),
('EV-1-1-151', b'1', 'BT-1-1-71', 28, 30, '2.0000', '0.0000', '269.0000', '269.0000', 'fixed', '0.0000', '269.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-07 11:54:19', '2022-04-07 11:54:19', 151),
('EW-1-1-152', b'1', 'BT-1-1-71', 134, 136, '1.0000', '0.0000', '119.0000', '119.0000', 'fixed', '0.0000', '119.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-07 11:54:19', '2022-04-07 11:54:19', 152),
('EX-1-1-153', b'1', 'BT-1-1-71', 126, 128, '1.0000', '0.0000', '249.0000', '249.0000', 'fixed', '0.0000', '249.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-07 11:54:19', '2022-04-07 11:54:19', 153),
('EY-1-1-154', b'1', 'BT-1-1-71', 99, 101, '1.0000', '0.0000', '210.0000', '210.0000', 'fixed', '0.0000', '210.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-07 11:54:19', '2022-04-07 11:54:19', 154),
('EZ-1-1-155', b'1', 'BT-1-1-71', 100, 102, '1.0000', '0.0000', '249.0000', '249.0000', 'fixed', '0.0000', '249.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-07 11:54:19', '2022-04-07 11:54:19', 155),
('F-1-1-5', b'1', 'H-1-1-7', 166, 170, '1.0000', '0.0000', '100.0000', '100.0000', NULL, '0.0000', '100.0000', '0.0000', NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, 'C-1-1-2', 'modifier', NULL, '2022-04-07 09:16:36', '2022-04-07 09:18:51', 5),
('FA-1-1-156', b'1', 'BU-1-1-72', 100, 102, '1.0000', '0.0000', '249.0000', '249.0000', 'fixed', '0.0000', '249.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-07 11:54:38', '2022-04-07 11:54:38', 156),
('FB-1-1-157', b'1', 'BU-1-1-72', 134, 136, '1.0000', '0.0000', '119.0000', '119.0000', 'fixed', '0.0000', '119.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-07 11:54:38', '2022-04-07 11:54:38', 157),
('FC-1-1-158', b'1', 'BU-1-1-72', 126, 128, '1.0000', '0.0000', '249.0000', '249.0000', 'fixed', '0.0000', '249.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-07 11:54:38', '2022-04-07 11:54:38', 158),
('FD-1-1-159', b'1', 'BU-1-1-72', 99, 101, '1.0000', '0.0000', '210.0000', '210.0000', 'fixed', '0.0000', '210.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-07 11:54:38', '2022-04-07 11:54:38', 159),
('FE-1-1-160', b'1', 'BU-1-1-72', 138, 140, '1.0000', '0.0000', '119.0000', '119.0000', 'fixed', '0.0000', '119.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-07 11:54:38', '2022-04-07 11:54:38', 160),
('FF-1-1-161', b'1', 'BU-1-1-72', 42, 44, '1.0000', '0.0000', '349.0000', '349.0000', 'fixed', '0.0000', '349.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-07 11:54:38', '2022-04-07 11:54:38', 161),
('FG-1-1-162', b'1', 'BV-1-1-73', 72, 74, '1.0000', '0.0000', '679.0000', '679.0000', 'fixed', '0.0000', '679.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-07 11:54:56', '2022-04-07 11:54:56', 162),
('FH-1-1-163', b'1', 'BV-1-1-73', 61, 63, '1.0000', '0.0000', '999.0000', '999.0000', 'fixed', '0.0000', '999.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-07 11:54:56', '2022-04-07 11:54:56', 163),
('FI-1-1-164', b'1', 'BV-1-1-73', 53, 55, '1.0000', '0.0000', '549.0000', '549.0000', 'fixed', '0.0000', '549.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-07 11:54:56', '2022-04-07 11:54:56', 164),
('FJ-1-1-165', b'1', 'BV-1-1-73', 34, 36, '1.0000', '0.0000', '679.0000', '679.0000', 'fixed', '0.0000', '679.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-07 11:54:56', '2022-04-07 11:54:56', 165),
('FK-1-1-166', b'1', 'BV-1-1-73', 37, 39, '1.0000', '0.0000', '749.0000', '749.0000', 'fixed', '0.0000', '749.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-07 11:54:56', '2022-04-07 11:54:56', 166),
('FL-1-1-167', b'1', 'BV-1-1-73', 26, 28, '1.0000', '0.0000', '179.0000', '179.0000', 'fixed', '0.0000', '179.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-07 11:54:57', '2022-04-07 11:54:57', 167),
('FM-1-1-168', b'1', 'BV-1-1-73', 68, 70, '1.0000', '0.0000', '699.0000', '699.0000', 'fixed', '0.0000', '699.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-07 11:54:57', '2022-04-07 11:54:57', 168),
('FN-1-1-169', b'1', 'BV-1-1-73', 119, 121, '1.0000', '0.0000', '149.0000', '149.0000', 'fixed', '0.0000', '149.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-07 11:54:57', '2022-04-07 11:54:57', 169),
('FO-1-1-170', b'1', 'BV-1-1-73', 11, 13, '1.0000', '0.0000', '299.0000', '299.0000', 'fixed', '0.0000', '299.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-07 11:54:57', '2022-04-07 11:54:57', 170),
('FP-1-1-171', b'1', 'BV-1-1-73', 44, 46, '1.0000', '0.0000', '499.0000', '499.0000', 'fixed', '0.0000', '499.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-07 11:54:57', '2022-04-07 11:54:57', 171),
('FQ-1-1-172', b'1', 'BV-1-1-73', 39, 41, '1.0000', '0.0000', '299.0000', '299.0000', 'fixed', '0.0000', '299.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-07 11:54:57', '2022-04-07 11:54:57', 172),
('FR-1-1-173', b'1', 'BV-1-1-73', 66, 68, '1.0000', '0.0000', '679.0000', '679.0000', 'fixed', '0.0000', '679.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-07 11:54:57', '2022-04-07 11:54:57', 173),
('FS-1-1-174', b'1', 'BW-1-1-74', 39, 41, '2.0000', '0.0000', '299.0000', '299.0000', 'fixed', '0.0000', '299.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-07 11:55:59', '2022-04-07 11:55:59', 174),
('FT-1-1-175', b'1', 'BW-1-1-74', 66, 68, '2.0000', '0.0000', '679.0000', '679.0000', 'fixed', '0.0000', '679.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-07 11:55:59', '2022-04-07 11:55:59', 175),
('FU-1-1-176', b'1', 'BW-1-1-74', 44, 46, '1.0000', '0.0000', '499.0000', '499.0000', 'fixed', '0.0000', '499.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-07 11:55:59', '2022-04-07 11:55:59', 176),
('FV-1-1-177', b'1', 'BW-1-1-74', 61, 63, '1.0000', '0.0000', '999.0000', '999.0000', 'fixed', '0.0000', '999.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-07 11:55:59', '2022-04-07 11:55:59', 177),
('FW-1-1-178', b'1', 'BW-1-1-74', 53, 55, '1.0000', '0.0000', '549.0000', '549.0000', 'fixed', '0.0000', '549.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-07 11:55:59', '2022-04-07 11:55:59', 178),
('FX-1-1-179', b'1', 'BW-1-1-74', 34, 36, '1.0000', '0.0000', '679.0000', '679.0000', 'fixed', '0.0000', '679.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-07 11:55:59', '2022-04-07 11:55:59', 179),
('FY-1-1-180', b'1', 'BW-1-1-74', 37, 39, '1.0000', '0.0000', '749.0000', '749.0000', 'fixed', '0.0000', '749.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-07 11:55:59', '2022-04-07 11:55:59', 180),
('FZ-1-1-181', b'1', 'BW-1-1-74', 68, 70, '2.0000', '0.0000', '699.0000', '699.0000', 'fixed', '0.0000', '699.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-07 11:55:59', '2022-04-07 11:55:59', 181),
('G-1-1-6', b'1', 'H-1-1-7', 166, 171, '1.0000', '0.0000', '100.0000', '100.0000', NULL, '0.0000', '100.0000', '0.0000', NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, 'C-1-1-2', 'modifier', NULL, '2022-04-07 09:16:36', '2022-04-07 09:18:51', 6),
('GA-1-1-182', b'1', 'BW-1-1-74', 11, 13, '1.0000', '0.0000', '299.0000', '299.0000', 'fixed', '0.0000', '299.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-07 11:55:59', '2022-04-07 11:55:59', 182),
('GB-1-1-183', b'1', 'BW-1-1-74', 35, 37, '1.0000', '0.0000', '649.0000', '649.0000', 'fixed', '0.0000', '649.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-07 11:55:59', '2022-04-07 11:55:59', 183),
('GC-1-1-184', b'1', 'BX-1-1-75', 11, 13, '1.0000', '0.0000', '299.0000', '299.0000', 'fixed', '0.0000', '299.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-07 11:56:08', '2022-04-07 11:56:08', 184),
('GD-1-1-185', b'1', 'BX-1-1-75', 44, 46, '1.0000', '0.0000', '499.0000', '499.0000', 'fixed', '0.0000', '499.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-07 11:56:08', '2022-04-07 11:56:08', 185),
('GL-1-1-193', b'1', 'BZ-1-1-77', 60, 62, '1.0000', '0.0000', '1499.0000', '1499.0000', 'fixed', '0.0000', '1499.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-07 11:56:40', '2022-04-07 11:56:40', 193),
('GM-1-1-194', b'1', 'BZ-1-1-77', 52, 54, '1.0000', '0.0000', '599.0000', '599.0000', 'fixed', '0.0000', '599.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-07 11:56:40', '2022-04-07 11:56:40', 194),
('GN-1-1-195', b'1', 'BZ-1-1-77', 82, 84, '1.0000', '0.0000', '199.0000', '199.0000', 'fixed', '0.0000', '199.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-07 11:56:40', '2022-04-07 11:56:40', 195),
('GO-1-1-196', b'1', 'BZ-1-1-77', 28, 30, '1.0000', '0.0000', '269.0000', '269.0000', 'fixed', '0.0000', '269.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-07 11:56:40', '2022-04-07 11:56:40', 196),
('GP-1-1-197', b'1', 'BZ-1-1-77', 134, 136, '1.0000', '0.0000', '119.0000', '119.0000', 'fixed', '0.0000', '119.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-07 11:56:40', '2022-04-07 11:56:40', 197),
('GQ-1-1-198', b'1', 'BZ-1-1-77', 126, 128, '1.0000', '0.0000', '249.0000', '249.0000', 'fixed', '0.0000', '249.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-07 11:56:40', '2022-04-07 11:56:40', 198),
('GR-1-1-199', b'1', 'BZ-1-1-77', 99, 101, '1.0000', '0.0000', '210.0000', '210.0000', 'fixed', '0.0000', '210.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-07 11:56:40', '2022-04-07 11:56:40', 199),
('GS-1-1-200', b'1', 'BZ-1-1-77', 100, 102, '1.0000', '0.0000', '249.0000', '249.0000', 'fixed', '0.0000', '249.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-07 11:56:40', '2022-04-07 11:56:40', 200),
('GT-1-1-201', b'1', 'BZ-1-1-77', 125, 127, '1.0000', '0.0000', '249.0000', '249.0000', 'fixed', '0.0000', '249.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-07 11:56:40', '2022-04-07 11:56:40', 201),
('GU-1-1-202', b'1', 'BZ-1-1-77', 138, 140, '1.0000', '0.0000', '119.0000', '119.0000', 'fixed', '0.0000', '119.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-07 11:56:40', '2022-04-07 11:56:40', 202),
('GV-1-1-203', b'1', 'BZ-1-1-77', 111, 113, '1.0000', '0.0000', '249.0000', '249.0000', 'fixed', '0.0000', '249.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-07 11:56:40', '2022-04-07 11:56:40', 203),
('GW-1-1-204', b'1', 'BZ-1-1-77', 67, 69, '1.0000', '0.0000', '749.0000', '749.0000', 'fixed', '0.0000', '749.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-07 11:56:40', '2022-04-07 11:56:40', 204),
('GX-1-1-205', b'1', 'CA-1-1-78', 60, 62, '1.0000', '0.0000', '1499.0000', '1499.0000', 'fixed', '0.0000', '1499.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-07 11:56:55', '2022-04-07 11:56:55', 205),
('GY-1-1-206', b'1', 'CA-1-1-78', 52, 54, '1.0000', '0.0000', '599.0000', '599.0000', 'fixed', '0.0000', '599.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-07 11:56:55', '2022-04-07 11:56:55', 206),
('GZ-1-1-207', b'1', 'CA-1-1-78', 82, 84, '1.0000', '0.0000', '199.0000', '199.0000', 'fixed', '0.0000', '199.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-07 11:56:55', '2022-04-07 11:56:55', 207),
('H-1-1-7', b'1', 'H-1-1-7', 166, 172, '1.0000', '0.0000', '100.0000', '100.0000', NULL, '0.0000', '100.0000', '0.0000', NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, 'C-1-1-2', 'modifier', NULL, '2022-04-07 09:16:36', '2022-04-07 09:18:51', 7),
('HA-1-1-208', b'1', 'CA-1-1-78', 28, 30, '1.0000', '0.0000', '269.0000', '269.0000', 'fixed', '0.0000', '269.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-07 11:56:55', '2022-04-07 11:56:55', 208),
('HB-1-1-209', b'1', 'CA-1-1-78', 134, 136, '1.0000', '0.0000', '119.0000', '119.0000', 'fixed', '0.0000', '119.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-07 11:56:55', '2022-04-07 11:56:55', 209),
('HC-1-1-210', b'1', 'CA-1-1-78', 126, 128, '1.0000', '0.0000', '249.0000', '249.0000', 'fixed', '0.0000', '249.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-07 11:56:55', '2022-04-07 11:56:55', 210),
('HD-1-1-211', b'1', 'CA-1-1-78', 99, 101, '1.0000', '0.0000', '210.0000', '210.0000', 'fixed', '0.0000', '210.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-07 11:56:55', '2022-04-07 11:56:55', 211),
('HE-1-1-212', b'1', 'CA-1-1-78', 100, 102, '1.0000', '0.0000', '249.0000', '249.0000', 'fixed', '0.0000', '249.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-07 11:56:55', '2022-04-07 11:56:55', 212),
('HF-1-1-213', b'1', 'CA-1-1-78', 125, 127, '1.0000', '0.0000', '249.0000', '249.0000', 'fixed', '0.0000', '249.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-07 11:56:55', '2022-04-07 11:56:55', 213),
('HG-1-1-214', b'1', 'CB-1-1-79', 17, 19, '1.0000', '0.0000', '299.0000', '299.0000', 'fixed', '0.0000', '299.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-08 11:12:31', '2022-04-08 11:12:31', 217),
('HK-1-1-218', b'1', 'CD-1-1-81', 60, 62, '5.0000', '0.0000', '1499.0000', '1499.0000', 'fixed', '0.0000', '1499.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-08 11:40:10', '2022-04-08 11:40:10', 221),
('HO-1-1-222', b'1', 'CG-1-1-84', 7, 7, '5.0000', '0.0000', '200.0000', '200.0000', 'fixed', '0.0000', '200.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-08 11:40:33', '2022-04-08 11:40:33', 222),
('I-1-1-8', b'1', 'I-1-1-8', 7, 7, '2.0000', '0.0000', '150.0000', '150.0000', 'fixed', '0.0000', '150.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', 3, 'received', NULL, '', NULL, '2022-04-07 09:21:11', '2022-04-07 09:21:38', 8),
('J-1-1-9', b'1', 'J-1-1-9', 31, 33, '1.0000', '0.0000', '269.0000', '269.0000', 'fixed', '0.0000', '269.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-07 09:22:53', '2022-04-07 09:26:22', 9),
('K-1-1-10', b'1', 'J-1-1-9', 26, 28, '1.0000', '0.0000', '179.0000', '179.0000', 'fixed', '0.0000', '179.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-07 09:22:53', '2022-04-07 09:26:22', 10),
('L-1-1-11', b'1', 'J-1-1-9', 25, 27, '1.0000', '0.0000', '399.0000', '399.0000', 'fixed', '0.0000', '399.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-07 09:22:53', '2022-04-07 09:26:22', 11),
('M-1-1-12', b'1', 'J-1-1-9', 32, 34, '1.0000', '0.0000', '349.0000', '349.0000', 'fixed', '0.0000', '349.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-07 09:22:53', '2022-04-07 09:26:22', 12),
('N-1-1-13', b'1', 'J-1-1-9', 33, 35, '1.0000', '0.0000', '349.0000', '349.0000', 'fixed', '0.0000', '349.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-07 09:22:53', '2022-04-07 09:26:22', 13),
('O-1-1-14', b'1', 'J-1-1-9', 28, 30, '1.0000', '0.0000', '269.0000', '269.0000', 'fixed', '0.0000', '269.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-07 09:22:53', '2022-04-07 09:26:22', 14),
('P-1-1-15', b'1', 'J-1-1-9', 165, 167, '1.0000', '0.0000', '50.0000', '50.0000', NULL, '0.0000', '50.0000', '0.0000', NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, 'L-1-1-11', 'modifier', NULL, '2022-04-07 09:22:53', '2022-04-07 09:26:22', 15),
('Q-1-1-16', b'1', 'J-1-1-9', 165, 168, '1.0000', '0.0000', '50.0000', '50.0000', NULL, '0.0000', '50.0000', '0.0000', NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, 'L-1-1-11', 'modifier', NULL, '2022-04-07 09:22:53', '2022-04-07 09:26:22', 16),
('R-1-1-17', b'1', 'J-1-1-9', 165, 169, '1.0000', '0.0000', '50.0000', '50.0000', NULL, '0.0000', '50.0000', '0.0000', NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, 'L-1-1-11', 'modifier', NULL, '2022-04-07 09:22:53', '2022-04-07 09:26:22', 17),
('S-1-1-18', b'1', 'J-1-1-9', 166, 170, '1.0000', '0.0000', '100.0000', '100.0000', NULL, '0.0000', '100.0000', '0.0000', NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, 'L-1-1-11', 'modifier', NULL, '2022-04-07 09:22:53', '2022-04-07 09:26:22', 18),
('T-1-1-19', b'1', 'J-1-1-9', 166, 171, '1.0000', '0.0000', '100.0000', '100.0000', NULL, '0.0000', '100.0000', '0.0000', NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, 'L-1-1-11', 'modifier', NULL, '2022-04-07 09:22:53', '2022-04-07 09:26:22', 19);
INSERT INTO `transaction_sell_lines` (`id`, `sync_status`, `transaction_id`, `product_id`, `variation_id`, `quantity`, `quantity_returned`, `unit_price_before_discount`, `unit_price`, `line_discount_type`, `line_discount_amount`, `unit_price_inc_tax`, `item_tax`, `tax_id`, `discount_id`, `lot_no_line_id`, `sell_line_note`, `so_line_id`, `so_quantity_invoiced`, `res_service_staff_id`, `res_line_order_status`, `parent_sell_line_id`, `children_type`, `sub_unit_id`, `created_at`, `updated_at`, `ai_id`) VALUES
('U-1-1-20', b'1', 'J-1-1-9', 166, 172, '1.0000', '0.0000', '100.0000', '100.0000', NULL, '0.0000', '100.0000', '0.0000', NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, 'L-1-1-11', 'modifier', NULL, '2022-04-07 09:22:53', '2022-04-07 09:26:22', 20),
('V-1-1-21', b'1', 'K-1-1-10', 167, 173, '1.0000', '0.0000', '3500.0000', '3500.0000', 'fixed', '0.0000', '3500.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', 3, 'received', NULL, '', NULL, '2022-04-07 09:23:35', '2022-04-07 09:25:07', 21),
('W-1-1-22', b'1', 'K-1-1-10', 3, 3, '5.0000', '0.0000', '500.6147', '500.6147', NULL, '0.0000', '500.6147', '0.0000', NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, 'V-1-1-21', 'combo', NULL, '2022-04-07 09:23:35', '2022-04-07 09:25:07', 22),
('X-1-1-23', b'1', 'K-1-1-10', 4, 4, '5.0000', '0.0000', '113.3197', '113.3197', NULL, '0.0000', '113.3197', '0.0000', NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, 'V-1-1-21', 'combo', NULL, '2022-04-07 09:23:35', '2022-04-07 09:25:07', 23),
('Y-1-1-24', b'1', 'K-1-1-10', 162, 164, '5.0000', '0.0000', '86.0656', '86.0656', NULL, '0.0000', '86.0656', '0.0000', NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, 'V-1-1-21', 'combo', NULL, '2022-04-07 09:23:35', '2022-04-07 09:25:07', 24),
('Z-1-1-25', b'1', 'L-1-1-11', 162, 164, '5.0000', '0.0000', '60.0000', '60.0000', 'fixed', '0.0000', '60.0000', '0.0000', NULL, NULL, NULL, '', NULL, '0.0000', NULL, NULL, NULL, '', NULL, '2022-04-07 09:27:55', '2022-04-07 09:27:55', 25);

-- --------------------------------------------------------

--
-- Table structure for table `transaction_sell_lines_purchase_lines`
--

CREATE TABLE `transaction_sell_lines_purchase_lines` (
  `id` int(10) UNSIGNED NOT NULL,
  `sell_line_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stock_adjustment_line_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'id from stock_adjustment_lines',
  `purchase_line_id` int(10) UNSIGNED NOT NULL COMMENT 'id from purchase_lines',
  `quantity` decimal(22,4) NOT NULL,
  `qty_returned` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transaction_sell_lines_purchase_lines`
--

INSERT INTO `transaction_sell_lines_purchase_lines` (`id`, `sell_line_id`, `stock_adjustment_line_id`, `purchase_line_id`, `quantity`, `qty_returned`, `created_at`, `updated_at`) VALUES
(1, 'I-1-1-8', NULL, 1, '2.0000', '0.0000', '2022-04-07 09:21:11', '2022-04-07 09:21:11'),
(2, 'W-1-1-22', NULL, 4, '5.0000', '0.0000', '2022-04-07 09:23:35', '2022-04-07 09:23:35'),
(3, 'X-1-1-23', NULL, 5, '5.0000', '0.0000', '2022-04-07 09:23:35', '2022-04-07 09:23:35'),
(4, 'Y-1-1-24', NULL, 6, '5.0000', '0.0000', '2022-04-07 09:23:35', '2022-04-07 09:23:35'),
(5, 'Z-1-1-25', NULL, 6, '5.0000', '0.0000', '2022-04-07 09:27:55', '2022-04-07 09:27:55'),
(6, 'AA-1-1-26', NULL, 1, '8.0000', '0.0000', '2022-04-07 10:17:27', '2022-04-07 10:17:27'),
(7, 'AC-1-1-28', NULL, 4, '5.0000', '0.0000', '2022-04-07 10:23:57', '2022-04-07 10:23:57'),
(8, 'AD-1-1-29', NULL, 5, '5.0000', '0.0000', '2022-04-07 10:23:57', '2022-04-07 10:23:57'),
(9, 'AE-1-1-30', NULL, 6, '5.0000', '0.0000', '2022-04-07 10:23:57', '2022-04-07 10:23:57'),
(10, 'AJ-1-1-35', NULL, 1, '10.0000', '0.0000', '2022-04-07 10:41:59', '2022-04-07 10:41:59'),
(11, 'AK-1-1-36', NULL, 1, '80.0000', '0.0000', '2022-04-07 10:48:17', '2022-04-07 10:48:17'),
(12, 'AK-1-1-36', NULL, 7, '20.0000', '0.0000', '2022-04-07 10:48:17', '2022-04-07 10:48:17'),
(13, 'AL-1-1-37', NULL, 7, '1.0000', '0.0000', '2022-04-07 11:44:59', '2022-04-07 11:44:59'),
(14, 'AP-1-1-41', NULL, 3, '1.0000', '0.0000', '2022-04-07 11:45:54', '2022-04-07 11:45:54'),
(15, 'HO-1-1-222', NULL, 7, '5.0000', '0.0000', '2022-04-08 11:40:33', '2022-04-08 11:40:33');

-- --------------------------------------------------------

--
-- Table structure for table `types_of_services`
--

CREATE TABLE `types_of_services` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `business_id` int(11) NOT NULL,
  `location_price_group` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `packing_charge` decimal(22,4) DEFAULT NULL,
  `packing_charge_type` enum('fixed','percent') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `enable_custom_fields` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `types_of_services`
--

INSERT INTO `types_of_services` (`id`, `name`, `description`, `business_id`, `location_price_group`, `packing_charge`, `packing_charge_type`, `enable_custom_fields`, `created_at`, `updated_at`) VALUES
(1, 'Home Delivery', NULL, 1, '{\"1\":\"0\"}', '50.0000', 'fixed', 0, '2022-04-07 08:28:40', '2022-04-07 08:28:40'),
(2, 'Dine Inn', 'dine Inn should be in open air', 1, '{\"1\":\"0\"}', '0.0000', 'fixed', 0, '2022-04-07 08:29:14', '2022-04-07 08:29:14');

-- --------------------------------------------------------

--
-- Table structure for table `units`
--

CREATE TABLE `units` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `actual_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `allow_decimal` tinyint(1) NOT NULL,
  `base_unit_id` int(11) DEFAULT NULL,
  `base_unit_multiplier` decimal(20,4) DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `units`
--

INSERT INTO `units` (`id`, `business_id`, `actual_name`, `short_name`, `allow_decimal`, `base_unit_id`, `base_unit_multiplier`, `created_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'Pieces', 'Pc(s)', 0, NULL, NULL, 1, NULL, '2022-04-07 07:25:19', '2022-04-07 07:25:19'),
(2, 1, 'SERVING', 'serve', 0, NULL, NULL, 1, NULL, '2022-04-07 07:00:43', '2022-04-07 07:00:43'),
(3, 1, 'Kilogram', 'kg', 1, NULL, NULL, 1, NULL, '2022-04-07 07:02:01', '2022-04-07 07:02:01'),
(4, 1, 'Gram', 'gm', 1, 3, '0.0010', 1, NULL, '2022-04-07 07:02:43', '2022-04-07 07:02:43');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user',
  `surname` char(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'en',
  `contact_no` char(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `business_id` int(10) UNSIGNED DEFAULT NULL,
  `max_sales_discount_percent` decimal(5,2) DEFAULT NULL,
  `allow_login` tinyint(1) NOT NULL DEFAULT 1,
  `status` enum('active','inactive','terminated') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `crm_contact_id` int(10) UNSIGNED DEFAULT NULL,
  `is_cmmsn_agnt` tinyint(1) NOT NULL DEFAULT 0,
  `cmmsn_percent` decimal(4,2) NOT NULL DEFAULT 0.00,
  `selected_contacts` tinyint(1) NOT NULL DEFAULT 0,
  `dob` date DEFAULT NULL,
  `gender` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `marital_status` enum('married','unmarried','divorced') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `blood_group` char(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_number` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alt_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `family_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fb_link` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twitter_link` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `social_media_1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `social_media_2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permanent_address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `current_address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `guardian_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field_1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field_2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field_3` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field_4` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_details` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_proof_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_proof_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `user_type`, `surname`, `first_name`, `last_name`, `username`, `email`, `password`, `language`, `contact_no`, `address`, `remember_token`, `business_id`, `max_sales_discount_percent`, `allow_login`, `status`, `crm_contact_id`, `is_cmmsn_agnt`, `cmmsn_percent`, `selected_contacts`, `dob`, `gender`, `marital_status`, `blood_group`, `contact_number`, `alt_number`, `family_number`, `fb_link`, `twitter_link`, `social_media_1`, `social_media_2`, `permanent_address`, `current_address`, `guardian_name`, `custom_field_1`, `custom_field_2`, `custom_field_3`, `custom_field_4`, `bank_details`, `id_proof_name`, `id_proof_number`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'user', NULL, 'fahad', NULL, 'fahad2022', 'fahad@gmail.com', '$2y$10$f9jLI73bJF94CnMTYZKYw.fCvW0FP9OOy3rJ5I6E//dr7S9WPZxte', 'en', NULL, NULL, 'EQg7nBQ5ek4GipUYCxb83TLT6mpU1S0BK0AXXQbShnCLTNz1uQrLPM3vqxYb', 1, NULL, 1, 'active', NULL, 0, '0.00', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-07 07:25:18', '2022-04-07 07:25:19'),
(2, 'user', NULL, 'Harry', NULL, 'harry123', 'h@gmail.com', '$2y$10$pRfb96bGTRmucyCTCdsguOcbcL.ovrIao2yzi4V4N6Ff7e98UxMdm', 'en', NULL, NULL, NULL, 1, NULL, 1, 'active', NULL, 0, '0.00', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"account_holder_name\":null,\"account_number\":null,\"bank_name\":null,\"bank_code\":null,\"branch\":null,\"tax_payer_id\":null}', NULL, NULL, NULL, '2022-04-07 07:54:25', '2022-04-07 07:54:25'),
(3, 'user', NULL, 'Paul', NULL, NULL, 'pail@gmail.com', NULL, 'en', NULL, NULL, NULL, 1, NULL, 0, 'active', NULL, 0, '0.00', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"account_holder_name\":null,\"account_number\":null,\"bank_name\":null,\"bank_code\":null,\"branch\":null,\"tax_payer_id\":null}', NULL, NULL, NULL, '2022-04-07 07:55:14', '2022-04-07 07:55:14');

-- --------------------------------------------------------

--
-- Table structure for table `user_contact_access`
--

CREATE TABLE `user_contact_access` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `contact_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `variations`
--

CREATE TABLE `variations` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `sub_sku` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_variation_id` int(10) UNSIGNED NOT NULL,
  `variation_value_id` int(11) DEFAULT NULL,
  `default_purchase_price` decimal(22,4) DEFAULT NULL,
  `dpp_inc_tax` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `profit_percent` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `default_sell_price` decimal(22,4) DEFAULT NULL,
  `sell_price_inc_tax` decimal(22,4) DEFAULT NULL COMMENT 'Sell price including tax',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `combo_variations` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Contains the combo variation details'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `variations`
--

INSERT INTO `variations` (`id`, `name`, `product_id`, `sub_sku`, `product_variation_id`, `variation_value_id`, `default_purchase_price`, `dpp_inc_tax`, `profit_percent`, `default_sell_price`, `sell_price_inc_tax`, `created_at`, `updated_at`, `deleted_at`, `combo_variations`) VALUES
(1, 'DUMMY', 1, 'SP01', 1, NULL, '399.0000', '399.0000', '0.0000', '399.0000', '399.0000', '2022-04-07 07:22:20', '2022-04-07 07:22:20', NULL, '[]'),
(2, 'DUMMY', 2, 'SP02', 2, NULL, '299.0000', '299.0000', '0.0000', '299.0000', '299.0000', '2022-04-07 07:22:20', '2022-04-07 07:22:20', NULL, '[]'),
(3, 'DUMMY', 3, 'SP03', 3, NULL, '349.0000', '349.0000', '0.0000', '349.0000', '349.0000', '2022-04-07 07:22:20', '2022-04-07 07:42:22', NULL, '[]'),
(4, 'DUMMY', 4, '0004', 4, NULL, '79.0000', '79.0000', '0.0000', '79.0000', '79.0000', '2022-04-07 07:22:20', '2022-04-07 07:43:15', NULL, '[]'),
(5, 'DUMMY', 5, '0005', 5, NULL, '479.0000', '479.0000', '0.0000', '479.0000', '479.0000', '2022-04-07 07:22:20', '2022-04-07 07:22:20', NULL, '[]'),
(6, 'DUMMY', 6, '0006', 6, NULL, '649.0000', '649.0000', '0.0000', '649.0000', '649.0000', '2022-04-07 07:22:20', '2022-04-07 07:22:20', NULL, '[]'),
(7, '250gm', 7, '0007-1', 7, 1, '200.0000', '200.0000', '0.0000', '200.0000', '200.0000', '2022-04-07 07:22:20', '2022-04-07 07:35:42', NULL, 'null'),
(8, '500gm', 7, '0007-2', 7, 2, '400.0000', '400.0000', '0.0000', '400.0000', '400.0000', '2022-04-07 07:22:20', '2022-04-07 07:35:42', NULL, 'null'),
(9, '1000gm', 7, '0007-3', 7, 3, '800.0000', '800.0000', '0.0000', '800.0000', '800.0000', '2022-04-07 07:22:20', '2022-04-07 07:35:42', NULL, 'null'),
(10, 'DUMMY', 8, '0008', 8, NULL, '749.0000', '749.0000', '0.0000', '749.0000', '749.0000', '2022-04-07 07:22:20', '2022-04-07 07:22:20', NULL, '[]'),
(11, 'DUMMY', 9, '0009', 9, NULL, '499.0000', '499.0000', '0.0000', '499.0000', '499.0000', '2022-04-07 07:22:20', '2022-04-07 07:22:20', NULL, '[]'),
(12, 'DUMMY', 10, '0010', 10, NULL, '299.0000', '299.0000', '0.0000', '299.0000', '299.0000', '2022-04-07 07:22:20', '2022-04-07 07:22:20', NULL, '[]'),
(13, 'DUMMY', 11, '0011', 11, NULL, '299.0000', '299.0000', '0.0000', '299.0000', '299.0000', '2022-04-07 07:22:20', '2022-04-07 07:22:20', NULL, '[]'),
(14, 'DUMMY', 12, '0012', 12, NULL, '299.0000', '299.0000', '0.0000', '299.0000', '299.0000', '2022-04-07 07:22:20', '2022-04-07 07:22:20', NULL, '[]'),
(15, 'DUMMY', 13, '0013', 13, NULL, '779.0000', '779.0000', '0.0000', '779.0000', '779.0000', '2022-04-07 07:22:20', '2022-04-07 07:22:20', NULL, '[]'),
(16, 'DUMMY', 14, '0014', 14, NULL, '499.0000', '499.0000', '0.0000', '499.0000', '499.0000', '2022-04-07 07:22:20', '2022-04-07 07:22:20', NULL, '[]'),
(17, 'DUMMY', 15, '0015', 15, NULL, '499.0000', '499.0000', '0.0000', '499.0000', '499.0000', '2022-04-07 07:22:20', '2022-04-07 07:22:20', NULL, '[]'),
(18, 'DUMMY', 16, '0016', 16, NULL, '499.0000', '499.0000', '0.0000', '499.0000', '499.0000', '2022-04-07 07:22:20', '2022-04-07 07:22:20', NULL, '[]'),
(19, 'DUMMY', 17, '0017', 17, NULL, '299.0000', '299.0000', '0.0000', '299.0000', '299.0000', '2022-04-07 07:22:20', '2022-04-07 07:22:20', NULL, '[]'),
(20, 'DUMMY', 18, '0018', 18, NULL, '299.0000', '299.0000', '0.0000', '299.0000', '299.0000', '2022-04-07 07:22:20', '2022-04-07 07:22:20', NULL, '[]'),
(21, 'DUMMY', 19, '0019', 19, NULL, '299.0000', '299.0000', '0.0000', '299.0000', '299.0000', '2022-04-07 07:22:20', '2022-04-07 07:22:20', NULL, '[]'),
(22, 'DUMMY', 20, '0020', 20, NULL, '299.0000', '299.0000', '0.0000', '299.0000', '299.0000', '2022-04-07 07:22:20', '2022-04-07 07:22:20', NULL, '[]'),
(23, 'DUMMY', 21, '0021', 21, NULL, '499.0000', '499.0000', '0.0000', '499.0000', '499.0000', '2022-04-07 07:22:20', '2022-04-07 07:22:20', NULL, '[]'),
(24, 'DUMMY', 22, '0022', 22, NULL, '499.0000', '499.0000', '0.0000', '499.0000', '499.0000', '2022-04-07 07:22:20', '2022-04-07 07:22:20', NULL, '[]'),
(25, 'DUMMY', 23, '0023', 23, NULL, '499.0000', '499.0000', '0.0000', '499.0000', '499.0000', '2022-04-07 07:22:20', '2022-04-07 07:22:20', NULL, '[]'),
(26, 'DUMMY', 24, '0024', 24, NULL, '499.0000', '499.0000', '0.0000', '499.0000', '499.0000', '2022-04-07 07:22:20', '2022-04-07 07:22:20', NULL, '[]'),
(27, 'DUMMY', 25, '0025', 25, NULL, '399.0000', '399.0000', '0.0000', '399.0000', '399.0000', '2022-04-07 07:22:20', '2022-04-07 07:22:20', NULL, '[]'),
(28, 'DUMMY', 26, '0026', 26, NULL, '179.0000', '179.0000', '0.0000', '179.0000', '179.0000', '2022-04-07 07:22:20', '2022-04-07 07:22:20', NULL, '[]'),
(29, 'DUMMY', 27, '0027', 27, NULL, '199.0000', '199.0000', '0.0000', '199.0000', '199.0000', '2022-04-07 07:22:20', '2022-04-07 07:22:20', NULL, '[]'),
(30, 'DUMMY', 28, '0028', 28, NULL, '269.0000', '269.0000', '0.0000', '269.0000', '269.0000', '2022-04-07 07:22:20', '2022-04-07 07:22:20', NULL, '[]'),
(31, 'DUMMY', 29, '0029', 29, NULL, '269.0000', '269.0000', '0.0000', '269.0000', '269.0000', '2022-04-07 07:22:20', '2022-04-07 07:22:20', NULL, '[]'),
(32, 'DUMMY', 30, '0030', 30, NULL, '269.0000', '269.0000', '0.0000', '269.0000', '269.0000', '2022-04-07 07:22:20', '2022-04-07 07:22:20', NULL, '[]'),
(33, 'DUMMY', 31, '0031', 31, NULL, '269.0000', '269.0000', '0.0000', '269.0000', '269.0000', '2022-04-07 07:22:20', '2022-04-07 07:22:20', NULL, '[]'),
(34, 'DUMMY', 32, '0032', 32, NULL, '349.0000', '349.0000', '0.0000', '349.0000', '349.0000', '2022-04-07 07:22:20', '2022-04-07 07:22:20', NULL, '[]'),
(35, 'DUMMY', 33, '0033', 33, NULL, '349.0000', '349.0000', '0.0000', '349.0000', '349.0000', '2022-04-07 07:22:20', '2022-04-07 07:22:20', NULL, '[]'),
(36, 'DUMMY', 34, '0034', 34, NULL, '679.0000', '679.0000', '0.0000', '679.0000', '679.0000', '2022-04-07 07:22:20', '2022-04-07 07:22:20', NULL, '[]'),
(37, 'DUMMY', 35, '0035', 35, NULL, '649.0000', '649.0000', '0.0000', '649.0000', '649.0000', '2022-04-07 07:22:20', '2022-04-07 07:22:20', NULL, '[]'),
(38, 'DUMMY', 36, '0036', 36, NULL, '749.0000', '749.0000', '0.0000', '749.0000', '749.0000', '2022-04-07 07:22:20', '2022-04-07 07:22:20', NULL, '[]'),
(39, 'DUMMY', 37, '0037', 37, NULL, '749.0000', '749.0000', '0.0000', '749.0000', '749.0000', '2022-04-07 07:22:20', '2022-04-07 07:22:20', NULL, '[]'),
(40, 'DUMMY', 38, '0038', 38, NULL, '379.0000', '379.0000', '0.0000', '379.0000', '379.0000', '2022-04-07 07:22:20', '2022-04-07 07:22:20', NULL, '[]'),
(41, 'DUMMY', 39, '0039', 39, NULL, '299.0000', '299.0000', '0.0000', '299.0000', '299.0000', '2022-04-07 07:22:20', '2022-04-07 07:22:20', NULL, '[]'),
(42, 'DUMMY', 40, '0040', 40, NULL, '299.0000', '299.0000', '0.0000', '299.0000', '299.0000', '2022-04-07 07:22:20', '2022-04-07 07:22:20', NULL, '[]'),
(43, 'DUMMY', 41, '0041', 41, NULL, '249.0000', '249.0000', '0.0000', '249.0000', '249.0000', '2022-04-07 07:22:20', '2022-04-07 07:22:20', NULL, '[]'),
(44, 'DUMMY', 42, '0042', 42, NULL, '349.0000', '349.0000', '0.0000', '349.0000', '349.0000', '2022-04-07 07:22:20', '2022-04-07 07:22:20', NULL, '[]'),
(45, 'DUMMY', 43, '0043', 43, NULL, '649.0000', '649.0000', '0.0000', '649.0000', '649.0000', '2022-04-07 07:22:20', '2022-04-07 07:22:20', NULL, '[]'),
(46, 'DUMMY', 44, '0044', 44, NULL, '499.0000', '499.0000', '0.0000', '499.0000', '499.0000', '2022-04-07 07:22:20', '2022-04-07 07:22:20', NULL, '[]'),
(47, 'DUMMY', 45, '0045', 45, NULL, '499.0000', '499.0000', '0.0000', '499.0000', '499.0000', '2022-04-07 07:22:20', '2022-04-07 07:22:20', NULL, '[]'),
(48, 'DUMMY', 46, '0046', 46, NULL, '399.0000', '399.0000', '0.0000', '399.0000', '399.0000', '2022-04-07 07:22:20', '2022-04-07 07:22:20', NULL, '[]'),
(49, 'DUMMY', 47, '0047', 47, NULL, '599.0000', '599.0000', '0.0000', '599.0000', '599.0000', '2022-04-07 07:22:20', '2022-04-07 07:22:20', NULL, '[]'),
(50, 'DUMMY', 48, '0048', 48, NULL, '1149.0000', '1149.0000', '0.0000', '1149.0000', '1149.0000', '2022-04-07 07:22:20', '2022-04-07 07:22:20', NULL, '[]'),
(51, 'DUMMY', 49, '0049', 49, NULL, '1249.0000', '1249.0000', '0.0000', '1249.0000', '1249.0000', '2022-04-07 07:22:20', '2022-04-07 07:22:20', NULL, '[]'),
(52, 'DUMMY', 50, '0050', 50, NULL, '1199.0000', '1199.0000', '0.0000', '1199.0000', '1199.0000', '2022-04-07 07:22:20', '2022-04-07 07:22:20', NULL, '[]'),
(53, 'DUMMY', 51, '0051', 51, NULL, '899.0000', '899.0000', '0.0000', '899.0000', '899.0000', '2022-04-07 07:22:20', '2022-04-07 07:22:20', NULL, '[]'),
(54, 'DUMMY', 52, '`', 52, NULL, '599.0000', '599.0000', '0.0000', '599.0000', '599.0000', '2022-04-07 07:22:21', '2022-04-07 07:22:21', NULL, '[]'),
(55, 'DUMMY', 53, '0053', 53, NULL, '549.0000', '549.0000', '0.0000', '549.0000', '549.0000', '2022-04-07 07:22:21', '2022-04-07 07:22:21', NULL, '[]'),
(56, 'DUMMY', 54, '0054', 54, NULL, '649.0000', '649.0000', '0.0000', '649.0000', '649.0000', '2022-04-07 07:22:21', '2022-04-07 07:22:21', NULL, '[]'),
(57, 'DUMMY', 55, '0055', 55, NULL, '1499.0000', '1499.0000', '0.0000', '1499.0000', '1499.0000', '2022-04-07 07:22:21', '2022-04-07 07:22:21', NULL, '[]'),
(58, 'DUMMY', 56, '0056', 56, NULL, '2099.0000', '2099.0000', '0.0000', '2099.0000', '2099.0000', '2022-04-07 07:22:21', '2022-04-07 07:22:21', NULL, '[]'),
(59, 'DUMMY', 57, '0057', 57, NULL, '2199.0000', '2199.0000', '0.0000', '2199.0000', '2199.0000', '2022-04-07 07:22:21', '2022-04-07 07:22:21', NULL, '[]'),
(60, 'DUMMY', 58, '0058', 58, NULL, '2299.0000', '2299.0000', '0.0000', '2299.0000', '2299.0000', '2022-04-07 07:22:21', '2022-04-07 07:22:21', NULL, '[]'),
(61, 'DUMMY', 59, '0059', 59, NULL, '1499.0000', '1499.0000', '0.0000', '1499.0000', '1499.0000', '2022-04-07 07:22:21', '2022-04-07 07:22:21', NULL, '[]'),
(62, 'DUMMY', 60, '0060', 60, NULL, '1499.0000', '1499.0000', '0.0000', '1499.0000', '1499.0000', '2022-04-07 07:22:21', '2022-04-07 07:33:53', NULL, '[]'),
(63, 'DUMMY', 61, '0061', 61, NULL, '999.0000', '999.0000', '0.0000', '999.0000', '999.0000', '2022-04-07 07:22:21', '2022-04-07 07:22:21', NULL, '[]'),
(64, 'DUMMY', 62, '0062', 62, NULL, '1199.0000', '1199.0000', '0.0000', '1199.0000', '1199.0000', '2022-04-07 07:22:21', '2022-04-07 07:22:21', NULL, '[]'),
(65, 'DUMMY', 63, '0063', 63, NULL, '1399.0000', '1399.0000', '0.0000', '1399.0000', '1399.0000', '2022-04-07 07:22:21', '2022-04-07 07:22:21', NULL, '[]'),
(66, 'DUMMY', 64, '0064', 64, NULL, '799.0000', '799.0000', '0.0000', '799.0000', '799.0000', '2022-04-07 07:22:21', '2022-04-07 07:22:21', NULL, '[]'),
(67, 'DUMMY', 65, '0065', 65, NULL, '679.0000', '679.0000', '0.0000', '679.0000', '679.0000', '2022-04-07 07:22:21', '2022-04-07 07:22:21', NULL, '[]'),
(68, 'DUMMY', 66, '0066', 66, NULL, '679.0000', '679.0000', '0.0000', '679.0000', '679.0000', '2022-04-07 07:22:21', '2022-04-07 07:22:21', NULL, '[]'),
(69, 'DUMMY', 67, '0067', 67, NULL, '749.0000', '749.0000', '0.0000', '749.0000', '749.0000', '2022-04-07 07:22:21', '2022-04-07 07:22:21', NULL, '[]'),
(70, 'DUMMY', 68, '0068', 68, NULL, '699.0000', '699.0000', '0.0000', '699.0000', '699.0000', '2022-04-07 07:22:21', '2022-04-07 07:22:21', NULL, '[]'),
(71, 'DUMMY', 69, '0069', 69, NULL, '679.0000', '679.0000', '0.0000', '679.0000', '679.0000', '2022-04-07 07:22:21', '2022-04-07 07:22:21', NULL, '[]'),
(72, 'DUMMY', 70, '0070', 70, NULL, '999.0000', '999.0000', '0.0000', '999.0000', '999.0000', '2022-04-07 07:22:21', '2022-04-07 07:22:21', NULL, '[]'),
(73, 'DUMMY', 71, '0071', 71, NULL, '799.0000', '799.0000', '0.0000', '799.0000', '799.0000', '2022-04-07 07:22:21', '2022-04-07 07:22:21', NULL, '[]'),
(74, 'DUMMY', 72, '0072', 72, NULL, '679.0000', '679.0000', '0.0000', '679.0000', '679.0000', '2022-04-07 07:22:21', '2022-04-07 07:22:21', NULL, '[]'),
(75, 'DUMMY', 73, '0073', 73, NULL, '249.0000', '249.0000', '0.0000', '249.0000', '249.0000', '2022-04-07 07:22:21', '2022-04-07 07:22:21', NULL, '[]'),
(76, 'DUMMY', 74, '0074', 74, NULL, '449.0000', '449.0000', '0.0000', '449.0000', '449.0000', '2022-04-07 07:22:21', '2022-04-07 07:22:21', NULL, '[]'),
(77, 'DUMMY', 75, '0075', 75, NULL, '399.0000', '399.0000', '0.0000', '399.0000', '399.0000', '2022-04-07 07:22:21', '2022-04-07 07:22:21', NULL, '[]'),
(78, 'DUMMY', 76, '0076', 76, NULL, '79.0000', '79.0000', '0.0000', '79.0000', '79.0000', '2022-04-07 07:22:21', '2022-04-07 07:22:21', NULL, '[]'),
(79, 'DUMMY', 77, '0077', 77, NULL, '59.0000', '59.0000', '0.0000', '59.0000', '59.0000', '2022-04-07 07:22:21', '2022-04-07 07:22:21', NULL, '[]'),
(80, 'DUMMY', 78, '0078', 78, NULL, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '2022-04-07 07:22:21', '2022-04-07 07:22:21', NULL, '[]'),
(81, 'DUMMY', 79, '0079', 79, NULL, '49.0000', '49.0000', '0.0000', '49.0000', '49.0000', '2022-04-07 07:22:21', '2022-04-07 07:22:21', NULL, '[]'),
(82, 'DUMMY', 80, '0080', 80, NULL, '59.0000', '59.0000', '0.0000', '59.0000', '59.0000', '2022-04-07 07:22:21', '2022-04-07 07:22:21', NULL, '[]'),
(83, 'DUMMY', 81, '0081', 81, NULL, '249.0000', '249.0000', '0.0000', '249.0000', '249.0000', '2022-04-07 07:22:21', '2022-04-07 07:22:21', NULL, '[]'),
(84, 'DUMMY', 82, '0082', 82, NULL, '199.0000', '199.0000', '0.0000', '199.0000', '199.0000', '2022-04-07 07:22:21', '2022-04-07 07:22:21', NULL, '[]'),
(85, 'DUMMY', 83, '0083', 83, NULL, '220.0000', '220.0000', '0.0000', '220.0000', '220.0000', '2022-04-07 07:22:21', '2022-04-07 07:22:21', NULL, '[]'),
(86, 'DUMMY', 84, '0084', 84, NULL, '249.0000', '249.0000', '0.0000', '249.0000', '249.0000', '2022-04-07 07:22:21', '2022-04-07 07:22:21', NULL, '[]'),
(87, 'DUMMY', 85, '0085', 85, NULL, '159.0000', '159.0000', '0.0000', '159.0000', '159.0000', '2022-04-07 07:22:21', '2022-04-07 07:22:21', NULL, '[]'),
(88, 'DUMMY', 86, '0086', 86, NULL, '279.0000', '279.0000', '0.0000', '279.0000', '279.0000', '2022-04-07 07:22:21', '2022-04-07 07:22:21', NULL, '[]'),
(89, 'DUMMY', 87, '0087', 87, NULL, '99.0000', '99.0000', '0.0000', '99.0000', '99.0000', '2022-04-07 07:22:21', '2022-04-07 07:22:21', NULL, '[]'),
(90, 'DUMMY', 88, '0088', 88, NULL, '139.0000', '139.0000', '0.0000', '139.0000', '139.0000', '2022-04-07 07:22:21', '2022-04-07 07:22:21', NULL, '[]'),
(91, 'DUMMY', 89, '0089', 89, NULL, '139.0000', '139.0000', '0.0000', '139.0000', '139.0000', '2022-04-07 07:22:21', '2022-04-07 07:22:21', NULL, '[]'),
(92, 'DUMMY', 90, '0090', 90, NULL, '259.0000', '259.0000', '0.0000', '259.0000', '259.0000', '2022-04-07 07:22:21', '2022-04-07 07:22:21', NULL, '[]'),
(93, 'DUMMY', 91, '0091', 91, NULL, '119.0000', '119.0000', '0.0000', '119.0000', '119.0000', '2022-04-07 07:22:21', '2022-04-07 07:22:21', NULL, '[]'),
(94, 'DUMMY', 92, '0092', 92, NULL, '179.0000', '179.0000', '0.0000', '179.0000', '179.0000', '2022-04-07 07:22:21', '2022-04-07 07:22:21', NULL, '[]'),
(95, 'DUMMY', 93, '0093', 93, NULL, '349.0000', '349.0000', '0.0000', '349.0000', '349.0000', '2022-04-07 07:22:21', '2022-04-07 07:22:21', NULL, '[]'),
(96, 'DUMMY', 94, '0094', 94, NULL, '779.0000', '779.0000', '0.0000', '779.0000', '779.0000', '2022-04-07 07:22:21', '2022-04-07 07:22:21', NULL, '[]'),
(97, 'DUMMY', 95, '0095', 95, NULL, '599.0000', '599.0000', '0.0000', '599.0000', '599.0000', '2022-04-07 07:22:21', '2022-04-07 07:22:21', NULL, '[]'),
(98, 'DUMMY', 96, '0096', 96, NULL, '799.0000', '799.0000', '0.0000', '799.0000', '799.0000', '2022-04-07 07:22:21', '2022-04-07 07:22:21', NULL, '[]'),
(99, 'DUMMY', 97, '0097', 97, NULL, '199.0000', '199.0000', '0.0000', '199.0000', '199.0000', '2022-04-07 07:22:21', '2022-04-07 07:22:21', NULL, '[]'),
(100, 'DUMMY', 98, '0098', 98, NULL, '239.0000', '239.0000', '0.0000', '239.0000', '239.0000', '2022-04-07 07:22:21', '2022-04-07 07:22:21', NULL, '[]'),
(101, 'DUMMY', 99, '0099', 99, NULL, '210.0000', '210.0000', '0.0000', '210.0000', '210.0000', '2022-04-07 07:22:21', '2022-04-07 07:22:21', NULL, '[]'),
(102, 'DUMMY', 100, '0100', 100, NULL, '249.0000', '249.0000', '0.0000', '249.0000', '249.0000', '2022-04-07 07:22:21', '2022-04-07 07:22:21', NULL, '[]'),
(103, 'DUMMY', 101, '0101', 101, NULL, '219.0000', '219.0000', '0.0000', '219.0000', '219.0000', '2022-04-07 07:22:21', '2022-04-07 07:22:21', NULL, '[]'),
(104, 'DUMMY', 102, '0102', 102, NULL, '259.0000', '259.0000', '0.0000', '259.0000', '259.0000', '2022-04-07 07:22:21', '2022-04-07 07:22:21', NULL, '[]'),
(105, 'DUMMY', 103, '0103', 103, NULL, '239.0000', '239.0000', '0.0000', '239.0000', '239.0000', '2022-04-07 07:22:21', '2022-04-07 07:22:21', NULL, '[]'),
(106, 'DUMMY', 104, '0104', 104, NULL, '279.0000', '279.0000', '0.0000', '279.0000', '279.0000', '2022-04-07 07:22:21', '2022-04-07 07:22:21', NULL, '[]'),
(107, 'DUMMY', 105, '0105', 105, NULL, '2499.0000', '2499.0000', '0.0000', '2499.0000', '2499.0000', '2022-04-07 07:22:21', '2022-04-07 07:22:21', NULL, '[]'),
(108, 'DUMMY', 106, '0106', 106, NULL, '3999.0000', '3999.0000', '0.0000', '3999.0000', '3999.0000', '2022-04-07 07:22:21', '2022-04-07 07:22:21', NULL, '[]'),
(109, 'DUMMY', 107, '0107', 107, NULL, '49.0000', '49.0000', '0.0000', '49.0000', '49.0000', '2022-04-07 07:22:21', '2022-04-07 07:22:21', NULL, '[]'),
(110, 'DUMMY', 108, '0108', 108, NULL, '69.0000', '69.0000', '0.0000', '69.0000', '69.0000', '2022-04-07 07:22:21', '2022-04-07 07:22:21', NULL, '[]'),
(111, 'DUMMY', 109, '0109', 109, NULL, '69.0000', '69.0000', '0.0000', '69.0000', '69.0000', '2022-04-07 07:22:21', '2022-04-07 07:22:21', NULL, '[]'),
(112, 'DUMMY', 110, '0110', 110, NULL, '69.0000', '69.0000', '0.0000', '69.0000', '69.0000', '2022-04-07 07:22:21', '2022-04-07 07:22:21', NULL, '[]'),
(113, 'DUMMY', 111, '0111', 111, NULL, '249.0000', '249.0000', '0.0000', '249.0000', '249.0000', '2022-04-07 07:22:21', '2022-04-07 07:22:21', NULL, '[]'),
(114, 'DUMMY', 112, '0112', 112, NULL, '69.0000', '69.0000', '0.0000', '69.0000', '69.0000', '2022-04-07 07:22:22', '2022-04-07 07:22:22', NULL, '[]'),
(115, 'DUMMY', 113, '0113', 113, NULL, '349.0000', '349.0000', '0.0000', '349.0000', '349.0000', '2022-04-07 07:22:22', '2022-04-07 07:22:22', NULL, '[]'),
(116, 'DUMMY', 114, '0114', 114, NULL, '349.0000', '349.0000', '0.0000', '349.0000', '349.0000', '2022-04-07 07:22:22', '2022-04-07 07:22:22', NULL, '[]'),
(117, 'DUMMY', 115, '0115', 115, NULL, '199.0000', '199.0000', '0.0000', '199.0000', '199.0000', '2022-04-07 07:22:22', '2022-04-07 07:22:22', NULL, '[]'),
(118, 'DUMMY', 116, '0116', 116, NULL, '275.0000', '275.0000', '0.0000', '275.0000', '275.0000', '2022-04-07 07:22:22', '2022-04-07 07:22:22', NULL, '[]'),
(119, 'DUMMY', 117, '0117', 117, NULL, '249.0000', '249.0000', '0.0000', '249.0000', '249.0000', '2022-04-07 07:22:22', '2022-04-07 07:22:22', NULL, '[]'),
(120, 'DUMMY', 118, '0118', 118, NULL, '59.0000', '59.0000', '0.0000', '59.0000', '59.0000', '2022-04-07 07:22:22', '2022-04-07 07:22:22', NULL, '[]'),
(121, 'DUMMY', 119, '0119', 119, NULL, '149.0000', '149.0000', '0.0000', '149.0000', '149.0000', '2022-04-07 07:22:22', '2022-04-07 07:22:22', NULL, '[]'),
(122, 'DUMMY', 120, '0120', 120, NULL, '99.0000', '99.0000', '0.0000', '99.0000', '99.0000', '2022-04-07 07:22:22', '2022-04-07 07:22:22', NULL, '[]'),
(123, 'DUMMY', 121, '0121', 121, NULL, '99.0000', '99.0000', '0.0000', '99.0000', '99.0000', '2022-04-07 07:22:22', '2022-04-07 07:22:22', NULL, '[]'),
(124, 'DUMMY', 122, '0122', 122, NULL, '10.0000', '10.0000', '0.0000', '10.0000', '10.0000', '2022-04-07 07:22:22', '2022-04-07 07:22:22', NULL, '[]'),
(125, 'DUMMY', 123, '0123', 123, NULL, '249.0000', '249.0000', '0.0000', '249.0000', '249.0000', '2022-04-07 07:22:22', '2022-04-07 07:22:22', NULL, '[]'),
(126, 'DUMMY', 124, '0124', 124, NULL, '249.0000', '249.0000', '0.0000', '249.0000', '249.0000', '2022-04-07 07:22:22', '2022-04-07 07:22:22', NULL, '[]'),
(127, 'DUMMY', 125, '0125', 125, NULL, '249.0000', '249.0000', '0.0000', '249.0000', '249.0000', '2022-04-07 07:22:22', '2022-04-07 07:22:22', NULL, '[]'),
(128, 'DUMMY', 126, '0126', 126, NULL, '249.0000', '249.0000', '0.0000', '249.0000', '249.0000', '2022-04-07 07:22:22', '2022-04-07 07:22:22', NULL, '[]'),
(129, 'DUMMY', 127, '0127', 127, NULL, '249.0000', '249.0000', '0.0000', '249.0000', '249.0000', '2022-04-07 07:22:22', '2022-04-07 07:22:22', NULL, '[]'),
(130, 'DUMMY', 128, '0128', 128, NULL, '199.0000', '199.0000', '0.0000', '199.0000', '199.0000', '2022-04-07 07:22:22', '2022-04-07 07:22:22', NULL, '[]'),
(131, 'DUMMY', 129, '0129', 129, NULL, '199.0000', '199.0000', '0.0000', '199.0000', '199.0000', '2022-04-07 07:22:22', '2022-04-07 07:22:22', NULL, '[]'),
(132, 'DUMMY', 130, '0130', 130, NULL, '199.0000', '199.0000', '0.0000', '199.0000', '199.0000', '2022-04-07 07:22:22', '2022-04-07 07:22:22', NULL, '[]'),
(133, 'DUMMY', 131, '0131', 131, NULL, '199.0000', '199.0000', '0.0000', '199.0000', '199.0000', '2022-04-07 07:22:22', '2022-04-07 07:22:22', NULL, '[]'),
(134, 'DUMMY', 132, '0132', 132, NULL, '199.0000', '199.0000', '0.0000', '199.0000', '199.0000', '2022-04-07 07:22:22', '2022-04-07 07:22:22', NULL, '[]'),
(135, 'DUMMY', 133, '0133', 133, NULL, '119.0000', '119.0000', '0.0000', '119.0000', '119.0000', '2022-04-07 07:22:22', '2022-04-07 07:22:22', NULL, '[]'),
(136, 'DUMMY', 134, '0134', 134, NULL, '119.0000', '119.0000', '0.0000', '119.0000', '119.0000', '2022-04-07 07:22:22', '2022-04-07 07:22:22', NULL, '[]'),
(137, 'DUMMY', 135, '0135', 135, NULL, '119.0000', '119.0000', '0.0000', '119.0000', '119.0000', '2022-04-07 07:22:22', '2022-04-07 07:22:22', NULL, '[]'),
(138, 'DUMMY', 136, '0136', 136, NULL, '119.0000', '119.0000', '0.0000', '119.0000', '119.0000', '2022-04-07 07:22:22', '2022-04-07 07:22:22', NULL, '[]'),
(139, 'DUMMY', 137, '0137', 137, NULL, '119.0000', '119.0000', '0.0000', '119.0000', '119.0000', '2022-04-07 07:22:22', '2022-04-07 07:22:22', NULL, '[]'),
(140, 'DUMMY', 138, '0138', 138, NULL, '119.0000', '119.0000', '0.0000', '119.0000', '119.0000', '2022-04-07 07:22:22', '2022-04-07 07:22:22', NULL, '[]'),
(141, 'DUMMY', 139, '0139', 139, NULL, '119.0000', '119.0000', '0.0000', '119.0000', '119.0000', '2022-04-07 07:22:22', '2022-04-07 07:22:22', NULL, '[]'),
(142, 'DUMMY', 140, '0140', 140, NULL, '119.0000', '119.0000', '0.0000', '119.0000', '119.0000', '2022-04-07 07:22:22', '2022-04-07 07:22:22', NULL, '[]'),
(143, 'DUMMY', 141, '0141', 141, NULL, '119.0000', '119.0000', '0.0000', '119.0000', '119.0000', '2022-04-07 07:22:22', '2022-04-07 07:22:22', NULL, '[]'),
(144, 'DUMMY', 142, '0142', 142, NULL, '149.0000', '149.0000', '0.0000', '149.0000', '149.0000', '2022-04-07 07:22:22', '2022-04-07 07:22:22', NULL, '[]'),
(145, 'DUMMY', 143, '0143', 143, NULL, '149.0000', '149.0000', '0.0000', '149.0000', '149.0000', '2022-04-07 07:22:22', '2022-04-07 07:22:22', NULL, '[]'),
(146, 'DUMMY', 144, '0144', 144, NULL, '199.0000', '199.0000', '0.0000', '199.0000', '199.0000', '2022-04-07 07:22:22', '2022-04-07 07:22:22', NULL, '[]'),
(147, 'DUMMY', 145, '0145', 145, NULL, '199.0000', '199.0000', '0.0000', '199.0000', '199.0000', '2022-04-07 07:22:22', '2022-04-07 07:22:22', NULL, '[]'),
(148, 'DUMMY', 146, '0146', 146, NULL, '199.0000', '199.0000', '0.0000', '199.0000', '199.0000', '2022-04-07 07:22:22', '2022-04-07 07:22:22', NULL, '[]'),
(149, 'DUMMY', 147, '0147', 147, NULL, '249.0000', '249.0000', '0.0000', '249.0000', '249.0000', '2022-04-07 07:22:22', '2022-04-07 07:22:22', NULL, '[]'),
(150, 'DUMMY', 148, '0148', 148, NULL, '199.0000', '199.0000', '0.0000', '199.0000', '199.0000', '2022-04-07 07:22:22', '2022-04-07 07:22:22', NULL, '[]'),
(151, 'DUMMY', 149, '0149', 149, NULL, '249.0000', '249.0000', '0.0000', '249.0000', '249.0000', '2022-04-07 07:22:22', '2022-04-07 07:22:22', NULL, '[]'),
(152, 'DUMMY', 150, '0150', 150, NULL, '299.0000', '299.0000', '0.0000', '299.0000', '299.0000', '2022-04-07 07:22:22', '2022-04-07 07:22:22', NULL, '[]'),
(153, 'DUMMY', 151, '0151', 151, NULL, '299.0000', '299.0000', '0.0000', '299.0000', '299.0000', '2022-04-07 07:22:22', '2022-04-07 07:22:22', NULL, '[]'),
(154, 'DUMMY', 152, '0152', 152, NULL, '249.0000', '249.0000', '0.0000', '249.0000', '249.0000', '2022-04-07 07:22:22', '2022-04-07 07:22:22', NULL, '[]'),
(155, 'DUMMY', 153, '0153', 153, NULL, '199.0000', '199.0000', '0.0000', '199.0000', '199.0000', '2022-04-07 07:22:22', '2022-04-07 07:22:22', NULL, '[]'),
(156, 'DUMMY', 154, '0154', 154, NULL, '399.0000', '399.0000', '0.0000', '399.0000', '399.0000', '2022-04-07 07:22:22', '2022-04-07 07:22:22', NULL, '[]'),
(157, 'DUMMY', 155, '0155', 155, NULL, '199.0000', '199.0000', '0.0000', '199.0000', '199.0000', '2022-04-07 07:22:22', '2022-04-07 07:22:22', NULL, '[]'),
(158, 'DUMMY', 156, '0156', 156, NULL, '79.0000', '79.0000', '0.0000', '79.0000', '79.0000', '2022-04-07 07:22:22', '2022-04-07 07:22:22', NULL, '[]'),
(159, 'DUMMY', 157, '0157', 157, NULL, '69.0000', '69.0000', '0.0000', '69.0000', '69.0000', '2022-04-07 07:22:22', '2022-04-07 07:22:22', NULL, '[]'),
(160, 'DUMMY', 158, '0158', 158, NULL, '69.0000', '69.0000', '0.0000', '69.0000', '69.0000', '2022-04-07 07:22:22', '2022-04-07 07:22:22', NULL, '[]'),
(161, 'DUMMY', 159, '0159', 159, NULL, '99.0000', '99.0000', '0.0000', '99.0000', '99.0000', '2022-04-07 07:22:22', '2022-04-07 07:22:22', NULL, '[]'),
(162, 'DUMMY', 160, '0160', 160, NULL, '49.0000', '49.0000', '0.0000', '49.0000', '49.0000', '2022-04-07 07:22:22', '2022-04-07 07:22:22', NULL, '[]'),
(163, 'DUMMY', 161, '0161', 161, NULL, '59.0000', '59.0000', '0.0000', '59.0000', '59.0000', '2022-04-07 07:22:22', '2022-04-07 07:22:22', NULL, '[]'),
(164, 'DUMMY', 162, '0162', 162, NULL, '60.0000', '60.0000', '0.0000', '60.0000', '60.0000', '2022-04-07 07:22:22', '2022-04-07 07:43:58', NULL, '[]'),
(165, 'DUMMY', 163, '0163', 163, NULL, '80.0000', '80.0000', '0.0000', '80.0000', '80.0000', '2022-04-07 07:22:22', '2022-04-07 07:22:22', NULL, '[]'),
(166, 'DUMMY', 164, '0164', 164, NULL, '45.0000', '45.0000', '0.0000', '45.0000', '45.0000', '2022-04-07 07:22:22', '2022-04-07 07:22:22', NULL, '[]'),
(167, 'Cheese', 165, '0165-1', 165, NULL, '50.0000', '50.0000', '0.0000', '50.0000', '50.0000', '2022-04-07 07:26:23', '2022-04-07 07:26:23', NULL, NULL),
(168, 'Mayo', 165, '0165-2', 165, NULL, '50.0000', '50.0000', '0.0000', '50.0000', '50.0000', '2022-04-07 07:26:23', '2022-04-07 07:26:23', NULL, NULL),
(169, 'Jalapeno', 165, '0165-3', 165, NULL, '50.0000', '50.0000', '0.0000', '50.0000', '50.0000', '2022-04-07 07:26:23', '2022-04-07 07:26:23', NULL, NULL),
(170, 'Mini Bun', 166, '0166-1', 166, NULL, '100.0000', '100.0000', '0.0000', '100.0000', '100.0000', '2022-04-07 07:27:14', '2022-04-07 07:27:14', NULL, NULL),
(171, 'Sauce', 166, '0166-2', 166, NULL, '100.0000', '100.0000', '0.0000', '100.0000', '100.0000', '2022-04-07 07:27:14', '2022-04-07 07:27:14', NULL, NULL),
(172, 'Ketchup', 166, '0166-3', 166, NULL, '100.0000', '100.0000', '0.0000', '100.0000', '100.0000', '2022-04-07 07:27:14', '2022-04-07 07:27:14', NULL, NULL),
(173, 'DUMMY', 167, 'FD01', 167, NULL, '2440.0000', '2440.0000', '43.4400', '3500.0000', '3500.0000', '2022-04-07 07:41:45', '2022-04-07 07:41:45', NULL, '[{\"variation_id\":\"3\",\"quantity\":5,\"unit_id\":\"2\"},{\"variation_id\":\"4\",\"quantity\":5,\"unit_id\":\"2\"},{\"variation_id\":\"164\",\"quantity\":5,\"unit_id\":\"2\"}]');

-- --------------------------------------------------------

--
-- Table structure for table `variation_group_prices`
--

CREATE TABLE `variation_group_prices` (
  `id` int(10) UNSIGNED NOT NULL,
  `variation_id` int(10) UNSIGNED NOT NULL,
  `price_group_id` int(10) UNSIGNED NOT NULL,
  `price_inc_tax` decimal(22,4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `variation_location_details`
--

CREATE TABLE `variation_location_details` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `product_variation_id` int(10) UNSIGNED NOT NULL COMMENT 'id from product_variations table',
  `variation_id` int(10) UNSIGNED NOT NULL COMMENT 'id from variation Value Template',
  `location_id` int(10) UNSIGNED NOT NULL,
  `qty_available` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `variation_location_details`
--

INSERT INTO `variation_location_details` (`id`, `product_id`, `product_variation_id`, `variation_id`, `location_id`, `qty_available`, `created_at`, `updated_at`) VALUES
(1, 7, 7, 7, 1, '84.0000', '2022-04-07 07:36:36', '2022-04-08 11:40:33'),
(2, 7, 7, 8, 1, '200.0000', '2022-04-07 07:36:36', '2022-04-07 07:36:36'),
(3, 7, 7, 9, 1, '199.0000', '2022-04-07 07:36:36', '2022-04-07 11:45:54'),
(4, 3, 3, 3, 1, '90.0000', '2022-04-07 07:42:36', '2022-04-07 10:23:57'),
(5, 4, 4, 4, 1, '90.0000', '2022-04-07 07:43:27', '2022-04-07 10:23:57'),
(6, 162, 162, 164, 1, '85.0000', '2022-04-07 07:44:07', '2022-04-07 10:23:57');

-- --------------------------------------------------------

--
-- Table structure for table `variation_templates`
--

CREATE TABLE `variation_templates` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `variation_templates`
--

INSERT INTO `variation_templates` (`id`, `name`, `business_id`, `created_at`, `updated_at`) VALUES
(1, 'fish', 1, '2022-04-07 07:22:18', '2022-04-07 07:22:18');

-- --------------------------------------------------------

--
-- Table structure for table `variation_value_templates`
--

CREATE TABLE `variation_value_templates` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `variation_template_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `variation_value_templates`
--

INSERT INTO `variation_value_templates` (`id`, `name`, `variation_template_id`, `created_at`, `updated_at`) VALUES
(1, '250gm', 1, '2022-04-07 07:22:19', '2022-04-07 07:22:19'),
(2, '500gm', 1, '2022-04-07 07:22:19', '2022-04-07 07:22:19'),
(3, '1000gm', 1, '2022-04-07 07:22:19', '2022-04-07 07:22:19');

-- --------------------------------------------------------

--
-- Table structure for table `warranties`
--

CREATE TABLE `warranties` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `business_id` int(11) NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `duration` int(11) NOT NULL,
  `duration_type` enum('days','months','years') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `accounts_business_id_index` (`business_id`),
  ADD KEY `accounts_account_type_id_index` (`account_type_id`),
  ADD KEY `accounts_created_by_index` (`created_by`);

--
-- Indexes for table `account_transactions`
--
ALTER TABLE `account_transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `account_transactions_account_id_index` (`account_id`),
  ADD KEY `account_transactions_transaction_id_index` (`transaction_id`),
  ADD KEY `account_transactions_transaction_payment_id_index` (`transaction_payment_id`),
  ADD KEY `account_transactions_transfer_transaction_id_index` (`transfer_transaction_id`),
  ADD KEY `account_transactions_created_by_index` (`created_by`),
  ADD KEY `account_transactions_type_index` (`type`),
  ADD KEY `account_transactions_sub_type_index` (`sub_type`),
  ADD KEY `account_transactions_operation_date_index` (`operation_date`);

--
-- Indexes for table `account_types`
--
ALTER TABLE `account_types`
  ADD PRIMARY KEY (`id`),
  ADD KEY `account_types_parent_account_type_id_index` (`parent_account_type_id`),
  ADD KEY `account_types_business_id_index` (`business_id`);

--
-- Indexes for table `activity_log`
--
ALTER TABLE `activity_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `activity_log_log_name_index` (`log_name`);

--
-- Indexes for table `barcodes`
--
ALTER TABLE `barcodes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `barcodes_business_id_foreign` (`business_id`);

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bookings_contact_id_foreign` (`contact_id`),
  ADD KEY `bookings_business_id_foreign` (`business_id`),
  ADD KEY `bookings_created_by_foreign` (`created_by`),
  ADD KEY `bookings_table_id_index` (`table_id`),
  ADD KEY `bookings_waiter_id_index` (`waiter_id`),
  ADD KEY `bookings_location_id_index` (`location_id`),
  ADD KEY `bookings_booking_status_index` (`booking_status`),
  ADD KEY `bookings_correspondent_id_index` (`correspondent_id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`),
  ADD KEY `brands_business_id_foreign` (`business_id`),
  ADD KEY `brands_created_by_foreign` (`created_by`);

--
-- Indexes for table `business`
--
ALTER TABLE `business`
  ADD PRIMARY KEY (`id`),
  ADD KEY `business_owner_id_foreign` (`owner_id`),
  ADD KEY `business_currency_id_foreign` (`currency_id`),
  ADD KEY `business_default_sales_tax_foreign` (`default_sales_tax`);

--
-- Indexes for table `business_locations`
--
ALTER TABLE `business_locations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `business_locations_business_id_index` (`business_id`),
  ADD KEY `business_locations_invoice_scheme_id_foreign` (`invoice_scheme_id`),
  ADD KEY `business_locations_invoice_layout_id_foreign` (`invoice_layout_id`),
  ADD KEY `business_locations_sale_invoice_layout_id_index` (`sale_invoice_layout_id`),
  ADD KEY `business_locations_selling_price_group_id_index` (`selling_price_group_id`),
  ADD KEY `business_locations_receipt_printer_type_index` (`receipt_printer_type`),
  ADD KEY `business_locations_printer_id_index` (`printer_id`);

--
-- Indexes for table `cash_registers`
--
ALTER TABLE `cash_registers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `AI_OFFLINE` (`ai_id`),
  ADD KEY `cash_registers_business_id_foreign` (`business_id`),
  ADD KEY `cash_registers_user_id_foreign` (`user_id`),
  ADD KEY `cash_registers_location_id_index` (`location_id`);

--
-- Indexes for table `cash_register_transactions`
--
ALTER TABLE `cash_register_transactions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `AI_OFFLINE` (`ai_id`),
  ADD KEY `cash_register_transactions_cash_register_id_foreign` (`cash_register_id`),
  ADD KEY `cash_register_transactions_transaction_id_index` (`transaction_id`),
  ADD KEY `cash_register_transactions_type_index` (`type`),
  ADD KEY `cash_register_transactions_transaction_type_index` (`transaction_type`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categories_business_id_foreign` (`business_id`),
  ADD KEY `categories_created_by_foreign` (`created_by`),
  ADD KEY `categories_parent_id_index` (`parent_id`);

--
-- Indexes for table `categorizables`
--
ALTER TABLE `categorizables`
  ADD KEY `categorizables_categorizable_type_categorizable_id_index` (`categorizable_type`,`categorizable_id`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `contacts_business_id_foreign` (`business_id`),
  ADD KEY `contacts_created_by_foreign` (`created_by`),
  ADD KEY `contacts_type_index` (`type`),
  ADD KEY `contacts_contact_status_index` (`contact_status`),
  ADD KEY `AI_OFFLINE` (`ai_id`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_groups`
--
ALTER TABLE `customer_groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_groups_business_id_foreign` (`business_id`),
  ADD KEY `customer_groups_created_by_index` (`created_by`),
  ADD KEY `customer_groups_price_calculation_type_index` (`price_calculation_type`),
  ADD KEY `customer_groups_selling_price_group_id_index` (`selling_price_group_id`);

--
-- Indexes for table `dashboard_configurations`
--
ALTER TABLE `dashboard_configurations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dashboard_configurations_business_id_foreign` (`business_id`);

--
-- Indexes for table `delete_sales`
--
ALTER TABLE `delete_sales`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `discounts`
--
ALTER TABLE `discounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `discounts_business_id_index` (`business_id`),
  ADD KEY `discounts_brand_id_index` (`brand_id`),
  ADD KEY `discounts_category_id_index` (`category_id`),
  ADD KEY `discounts_location_id_index` (`location_id`),
  ADD KEY `discounts_priority_index` (`priority`),
  ADD KEY `discounts_spg_index` (`spg`);

--
-- Indexes for table `discount_variations`
--
ALTER TABLE `discount_variations`
  ADD KEY `discount_variations_discount_id_index` (`discount_id`),
  ADD KEY `discount_variations_variation_id_index` (`variation_id`);

--
-- Indexes for table `document_and_notes`
--
ALTER TABLE `document_and_notes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `document_and_notes_business_id_index` (`business_id`),
  ADD KEY `document_and_notes_notable_id_index` (`notable_id`),
  ADD KEY `document_and_notes_created_by_index` (`created_by`);

--
-- Indexes for table `expense_categories`
--
ALTER TABLE `expense_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `expense_categories_business_id_foreign` (`business_id`);

--
-- Indexes for table `group_sub_taxes`
--
ALTER TABLE `group_sub_taxes`
  ADD KEY `group_sub_taxes_group_tax_id_foreign` (`group_tax_id`),
  ADD KEY `group_sub_taxes_tax_id_foreign` (`tax_id`);

--
-- Indexes for table `invoice_layouts`
--
ALTER TABLE `invoice_layouts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_layouts_business_id_foreign` (`business_id`);

--
-- Indexes for table `invoice_schemes`
--
ALTER TABLE `invoice_schemes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_schemes_business_id_foreign` (`business_id`),
  ADD KEY `invoice_schemes_scheme_type_index` (`scheme_type`);

--
-- Indexes for table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`),
  ADD KEY `media_model_type_model_id_index` (`model_type`,`model_id`),
  ADD KEY `media_business_id_index` (`business_id`),
  ADD KEY `media_uploaded_by_index` (`uploaded_by`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_type_model_id_index` (`model_type`,`model_id`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_type_model_id_index` (`model_type`,`model_id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Indexes for table `notification_templates`
--
ALTER TABLE `notification_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_personal_access_clients_client_id_index` (`client_id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `printers`
--
ALTER TABLE `printers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `printers_business_id_foreign` (`business_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_brand_id_foreign` (`brand_id`),
  ADD KEY `products_category_id_foreign` (`category_id`),
  ADD KEY `products_sub_category_id_foreign` (`sub_category_id`),
  ADD KEY `products_tax_foreign` (`tax`),
  ADD KEY `products_name_index` (`name`),
  ADD KEY `products_business_id_index` (`business_id`),
  ADD KEY `products_unit_id_index` (`unit_id`),
  ADD KEY `products_created_by_index` (`created_by`),
  ADD KEY `products_warranty_id_index` (`warranty_id`),
  ADD KEY `products_type_index` (`type`),
  ADD KEY `products_tax_type_index` (`tax_type`),
  ADD KEY `products_barcode_type_index` (`barcode_type`);

--
-- Indexes for table `product_locations`
--
ALTER TABLE `product_locations`
  ADD KEY `product_locations_product_id_index` (`product_id`),
  ADD KEY `product_locations_location_id_index` (`location_id`);

--
-- Indexes for table `product_racks`
--
ALTER TABLE `product_racks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_racks_business_id_index` (`business_id`),
  ADD KEY `product_racks_location_id_index` (`location_id`),
  ADD KEY `product_racks_product_id_index` (`product_id`);

--
-- Indexes for table `product_variations`
--
ALTER TABLE `product_variations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_variations_name_index` (`name`),
  ADD KEY `product_variations_product_id_index` (`product_id`);

--
-- Indexes for table `purchase_lines`
--
ALTER TABLE `purchase_lines`
  ADD PRIMARY KEY (`id`),
  ADD KEY `purchase_lines_transaction_id_foreign` (`transaction_id`),
  ADD KEY `purchase_lines_product_id_foreign` (`product_id`),
  ADD KEY `purchase_lines_variation_id_foreign` (`variation_id`),
  ADD KEY `purchase_lines_tax_id_foreign` (`tax_id`),
  ADD KEY `purchase_lines_sub_unit_id_index` (`sub_unit_id`),
  ADD KEY `purchase_lines_lot_number_index` (`lot_number`);

--
-- Indexes for table `reference_counts`
--
ALTER TABLE `reference_counts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reference_counts_business_id_index` (`business_id`);

--
-- Indexes for table `res_product_modifier_sets`
--
ALTER TABLE `res_product_modifier_sets`
  ADD KEY `res_product_modifier_sets_modifier_set_id_foreign` (`modifier_set_id`);

--
-- Indexes for table `res_tables`
--
ALTER TABLE `res_tables`
  ADD PRIMARY KEY (`id`),
  ADD KEY `res_tables_business_id_foreign` (`business_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `roles_business_id_foreign` (`business_id`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `selling_price_groups`
--
ALTER TABLE `selling_price_groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `selling_price_groups_business_id_foreign` (`business_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD UNIQUE KEY `sessions_id_unique` (`id`);

--
-- Indexes for table `stock_adjustment_lines`
--
ALTER TABLE `stock_adjustment_lines`
  ADD PRIMARY KEY (`id`),
  ADD KEY `stock_adjustment_lines_product_id_foreign` (`product_id`),
  ADD KEY `stock_adjustment_lines_variation_id_foreign` (`variation_id`),
  ADD KEY `stock_adjustment_lines_transaction_id_index` (`transaction_id`),
  ADD KEY `stock_adjustment_lines_lot_no_line_id_index` (`lot_no_line_id`);

--
-- Indexes for table `system`
--
ALTER TABLE `system`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tax_rates`
--
ALTER TABLE `tax_rates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tax_rates_business_id_foreign` (`business_id`),
  ADD KEY `tax_rates_created_by_foreign` (`created_by`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD UNIQUE KEY `AI_Offline` (`ai_id`),
  ADD KEY `transactions_tax_id_foreign` (`tax_id`),
  ADD KEY `transactions_business_id_index` (`business_id`),
  ADD KEY `transactions_type_index` (`type`),
  ADD KEY `transactions_contact_id_index` (`contact_id`),
  ADD KEY `transactions_transaction_date_index` (`transaction_date`),
  ADD KEY `transactions_created_by_index` (`created_by`),
  ADD KEY `transactions_location_id_index` (`location_id`),
  ADD KEY `transactions_expense_for_foreign` (`expense_for`),
  ADD KEY `transactions_expense_category_id_index` (`expense_category_id`),
  ADD KEY `transactions_sub_type_index` (`sub_type`),
  ADD KEY `transactions_return_parent_id_index` (`return_parent_id`),
  ADD KEY `type` (`type`),
  ADD KEY `transactions_status_index` (`status`),
  ADD KEY `transactions_sub_status_index` (`sub_status`),
  ADD KEY `transactions_res_table_id_index` (`res_table_id`),
  ADD KEY `transactions_res_waiter_id_index` (`res_waiter_id`),
  ADD KEY `transactions_res_order_status_index` (`res_order_status`),
  ADD KEY `transactions_payment_status_index` (`payment_status`),
  ADD KEY `transactions_discount_type_index` (`discount_type`),
  ADD KEY `transactions_commission_agent_index` (`commission_agent`),
  ADD KEY `transactions_transfer_parent_id_index` (`transfer_parent_id`),
  ADD KEY `transactions_types_of_service_id_index` (`types_of_service_id`),
  ADD KEY `transactions_packing_charge_type_index` (`packing_charge_type`),
  ADD KEY `transactions_recur_parent_id_index` (`recur_parent_id`),
  ADD KEY `transactions_selling_price_group_id_index` (`selling_price_group_id`);

--
-- Indexes for table `transaction_payments`
--
ALTER TABLE `transaction_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transaction_payments_transaction_id_foreign` (`transaction_id`),
  ADD KEY `transaction_payments_created_by_index` (`created_by`),
  ADD KEY `transaction_payments_parent_id_index` (`parent_id`),
  ADD KEY `AI_Offline` (`ai_id`);

--
-- Indexes for table `transaction_sell_lines`
--
ALTER TABLE `transaction_sell_lines`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transaction_sell_lines_product_id_foreign` (`product_id`),
  ADD KEY `transaction_sell_lines_variation_id_foreign` (`variation_id`),
  ADD KEY `transaction_sell_lines_tax_id_foreign` (`tax_id`),
  ADD KEY `transaction_sell_lines_children_type_index` (`children_type`),
  ADD KEY `transaction_sell_lines_parent_sell_line_id_index` (`parent_sell_line_id`),
  ADD KEY `transaction_sell_lines_line_discount_type_index` (`line_discount_type`),
  ADD KEY `transaction_sell_lines_discount_id_index` (`discount_id`),
  ADD KEY `transaction_sell_lines_lot_no_line_id_index` (`lot_no_line_id`),
  ADD KEY `transaction_sell_lines_sub_unit_id_index` (`sub_unit_id`),
  ADD KEY `AI_Offline` (`ai_id`);

--
-- Indexes for table `transaction_sell_lines_purchase_lines`
--
ALTER TABLE `transaction_sell_lines_purchase_lines`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sell_line_id` (`sell_line_id`),
  ADD KEY `stock_adjustment_line_id` (`stock_adjustment_line_id`),
  ADD KEY `purchase_line_id` (`purchase_line_id`);

--
-- Indexes for table `types_of_services`
--
ALTER TABLE `types_of_services`
  ADD PRIMARY KEY (`id`),
  ADD KEY `types_of_services_business_id_index` (`business_id`);

--
-- Indexes for table `units`
--
ALTER TABLE `units`
  ADD PRIMARY KEY (`id`),
  ADD KEY `units_business_id_foreign` (`business_id`),
  ADD KEY `units_created_by_foreign` (`created_by`),
  ADD KEY `units_base_unit_id_index` (`base_unit_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unique` (`username`),
  ADD KEY `users_business_id_foreign` (`business_id`),
  ADD KEY `users_user_type_index` (`user_type`),
  ADD KEY `users_crm_contact_id_foreign` (`crm_contact_id`);

--
-- Indexes for table `user_contact_access`
--
ALTER TABLE `user_contact_access`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_contact_access_user_id_index` (`user_id`),
  ADD KEY `user_contact_access_contact_id_index` (`contact_id`);

--
-- Indexes for table `variations`
--
ALTER TABLE `variations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `variations_product_id_foreign` (`product_id`),
  ADD KEY `variations_product_variation_id_foreign` (`product_variation_id`),
  ADD KEY `variations_name_index` (`name`),
  ADD KEY `variations_sub_sku_index` (`sub_sku`),
  ADD KEY `variations_variation_value_id_index` (`variation_value_id`);

--
-- Indexes for table `variation_group_prices`
--
ALTER TABLE `variation_group_prices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `variation_group_prices_variation_id_foreign` (`variation_id`),
  ADD KEY `variation_group_prices_price_group_id_foreign` (`price_group_id`);

--
-- Indexes for table `variation_location_details`
--
ALTER TABLE `variation_location_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `variation_location_details_location_id_foreign` (`location_id`),
  ADD KEY `variation_location_details_product_id_index` (`product_id`),
  ADD KEY `variation_location_details_product_variation_id_index` (`product_variation_id`),
  ADD KEY `variation_location_details_variation_id_index` (`variation_id`);

--
-- Indexes for table `variation_templates`
--
ALTER TABLE `variation_templates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `variation_templates_business_id_foreign` (`business_id`);

--
-- Indexes for table `variation_value_templates`
--
ALTER TABLE `variation_value_templates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `variation_value_templates_name_index` (`name`),
  ADD KEY `variation_value_templates_variation_template_id_index` (`variation_template_id`);

--
-- Indexes for table `warranties`
--
ALTER TABLE `warranties`
  ADD PRIMARY KEY (`id`),
  ADD KEY `warranties_business_id_index` (`business_id`),
  ADD KEY `warranties_duration_type_index` (`duration_type`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `account_transactions`
--
ALTER TABLE `account_transactions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `account_types`
--
ALTER TABLE `account_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `activity_log`
--
ALTER TABLE `activity_log`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=95;

--
-- AUTO_INCREMENT for table `barcodes`
--
ALTER TABLE `barcodes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `business`
--
ALTER TABLE `business`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `business_locations`
--
ALTER TABLE `business_locations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `cash_registers`
--
ALTER TABLE `cash_registers`
  MODIFY `ai_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `cash_register_transactions`
--
ALTER TABLE `cash_register_transactions`
  MODIFY `ai_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `ai_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=142;

--
-- AUTO_INCREMENT for table `customer_groups`
--
ALTER TABLE `customer_groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dashboard_configurations`
--
ALTER TABLE `dashboard_configurations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `delete_sales`
--
ALTER TABLE `delete_sales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `discounts`
--
ALTER TABLE `discounts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `document_and_notes`
--
ALTER TABLE `document_and_notes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `expense_categories`
--
ALTER TABLE `expense_categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoice_layouts`
--
ALTER TABLE `invoice_layouts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `invoice_schemes`
--
ALTER TABLE `invoice_schemes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `media`
--
ALTER TABLE `media`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notification_templates`
--
ALTER TABLE `notification_templates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100;

--
-- AUTO_INCREMENT for table `printers`
--
ALTER TABLE `printers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=168;

--
-- AUTO_INCREMENT for table `product_racks`
--
ALTER TABLE `product_racks`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_variations`
--
ALTER TABLE `product_variations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=168;

--
-- AUTO_INCREMENT for table `purchase_lines`
--
ALTER TABLE `purchase_lines`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `reference_counts`
--
ALTER TABLE `reference_counts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `res_tables`
--
ALTER TABLE `res_tables`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `selling_price_groups`
--
ALTER TABLE `selling_price_groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stock_adjustment_lines`
--
ALTER TABLE `stock_adjustment_lines`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `system`
--
ALTER TABLE `system`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tax_rates`
--
ALTER TABLE `tax_rates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `ai_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- AUTO_INCREMENT for table `transaction_payments`
--
ALTER TABLE `transaction_payments`
  MODIFY `ai_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;

--
-- AUTO_INCREMENT for table `transaction_sell_lines`
--
ALTER TABLE `transaction_sell_lines`
  MODIFY `ai_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=223;

--
-- AUTO_INCREMENT for table `transaction_sell_lines_purchase_lines`
--
ALTER TABLE `transaction_sell_lines_purchase_lines`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `types_of_services`
--
ALTER TABLE `types_of_services`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `units`
--
ALTER TABLE `units`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user_contact_access`
--
ALTER TABLE `user_contact_access`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `variations`
--
ALTER TABLE `variations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=174;

--
-- AUTO_INCREMENT for table `variation_group_prices`
--
ALTER TABLE `variation_group_prices`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
