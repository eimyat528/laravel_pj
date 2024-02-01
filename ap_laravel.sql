-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 01, 2024 at 05:48 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ap_laravel`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'tech', NULL, NULL),
(2, 'health', '2024-01-26 07:41:49', '2024-01-26 07:41:49');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2024_01_24_064420_create_posts_table', 1),
(6, '2024_01_26_073513_create_categories_table', 2),
(7, '2024_01_26_073851_add_category_id_to_posts_table', 2),
(8, '2014_10_12_200000_add_two_factor_columns_to_users_table', 3),
(9, '2024_01_27_044649_create_sessions_table', 3),
(10, '2024_01_27_080206_add_user_id_to_posts_table', 4),
(11, '2024_01_31_042420_create_notifications_table', 5);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) NOT NULL,
  `type` varchar(255) NOT NULL,
  `notifiable_type` varchar(255) NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` text NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('d28fe7ae-76db-4236-80df-b27715b78a34', 'App\\Notifications\\PostCreatedNotification', 'App\\Models\\User', 1, '[]', NULL, '2024-01-30 22:00:01', '2024-01-30 22:00:01'),
('d5527c99-959a-4ebf-8080-7f87342eb169', 'App\\Notifications\\PostCreatedNotification', 'App\\Models\\User', 1, '[]', NULL, '2024-01-30 21:56:36', '2024-01-30 21:56:36'),
('f78649bb-2eed-46c1-a10e-9d0f3667c0f8', 'App\\Notifications\\PostCreatedNotification', 'App\\Models\\User', 1, '[]', NULL, '2024-01-30 22:48:22', '2024-01-30 22:48:22');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `category_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `name`, `description`, `created_at`, `updated_at`, `category_id`, `user_id`) VALUES
(2, 'name 1', 'desc 1', '2024-01-25 01:02:55', '2024-01-25 01:02:55', 1, 1),
(3, 'name 2', 'desc 2', '2024-01-25 01:03:21', '2024-01-25 01:03:21', 2, 1),
(9, 'name 3', 'desc 3', '2024-01-26 21:27:25', '2024-01-26 21:27:25', 1, 2),
(10, 'name 4 up', 'desc 4 up', '2024-01-26 21:31:36', '2024-01-26 21:38:00', 1, 3),
(11, 'T-shirt', 'erwetwe', '2024-01-29 21:59:40', '2024-01-29 21:59:40', 2, 1),
(18, 'admin', 'tutueyery', '2024-01-30 02:49:05', '2024-01-30 02:49:05', 2, 1),
(19, 'sgteui75', '6ui65y6', '2024-01-30 02:50:33', '2024-01-30 02:50:33', 1, 1),
(20, 'sgteui75wrtwt', '6ui65y6qrqwr', '2024-01-30 02:51:52', '2024-01-30 02:51:52', 1, 1),
(21, 'tujrtujtre', 'eryearye', '2024-01-30 03:04:30', '2024-01-30 03:04:30', 2, 1),
(22, 'post 1', 'wettywytw', '2024-01-30 03:11:36', '2024-01-30 03:11:36', 2, 1),
(23, 'post 8', 'rywyw', '2024-01-30 03:20:28', '2024-01-30 03:20:28', 2, 1),
(24, 'post 10', 'tutriurtir', '2024-01-30 04:10:13', '2024-01-30 04:10:13', 2, 1),
(25, 'qtqyt43', '36346251241', '2024-01-30 20:50:47', '2024-01-30 20:50:47', 1, 1),
(26, 'poat 12', 'qwrrqr', '2024-01-30 22:50:24', '2024-01-30 22:50:24', 1, 1),
(27, 'poat 1ui', 'qwrrqrp', '2024-01-30 22:50:54', '2024-01-30 22:50:54', 2, 1),
(28, 'truiuii', 'uwrtuwtuyw', '2024-01-30 22:51:39', '2024-01-30 22:51:39', 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` text NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('BnvT0mkGrGfUU1tiMumzAXgHG7vJK6Iap6bG7sYZ', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoicURReDRabmlnVFVtT3JtTHV2Yk1RTWJ1UkgxcTV5dmh0VUU2N2lwZyI7czozOiJ1cmwiO2E6MDp7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjIxOiJodHRwOi8vMTI3LjAuMC4xOjgwMDAiO31zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO30=', 1706690578);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `two_factor_secret` text DEFAULT NULL,
  `two_factor_recovery_codes` text DEFAULT NULL,
  `two_factor_confirmed_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `two_factor_confirmed_at`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'pIZljZSVhQ', 'ei@gmail.com', NULL, '$2y$10$DLAudSqTIV7cNcfHse2oeOWJwxvMNGvzy8ZoiovYq6qJkWmj9EE/O', NULL, NULL, NULL, NULL, NULL, NULL),
(2, 'Ank54yggNh', 'mimi@gmail.com', NULL, '$2y$10$7JCQLrm9ILlM.xLBocp7kOYMJo5h.rnGh1M24qMjDa7Rlvqzw0OrW', NULL, NULL, NULL, NULL, NULL, NULL),
(3, 'A13mhybgwn', 'admin@gmail.com', NULL, '$2y$10$vBcT/7.7/kVSosuFrMIkFO5Fe1kD/kdlZunUDLNN50J3G7CWTT5y6', NULL, NULL, NULL, NULL, NULL, NULL),
(4, 'Aliyah Ferry', 'jeromy19@example.net', '2024-01-24 01:29:20', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'hS0Aa6r1Ck', '2024-01-24 01:29:21', '2024-01-24 01:29:21'),
(5, 'Sydni Brown PhD', 'bettie.oberbrunner@example.com', '2024-01-24 01:29:20', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'kle8LduW6l', '2024-01-24 01:29:21', '2024-01-24 01:29:21'),
(6, 'Jakob Satterfield', 'kelli.will@example.com', '2024-01-24 01:29:20', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'Now3wDQUzW', '2024-01-24 01:29:21', '2024-01-24 01:29:21'),
(7, 'Jakayla Quitzon IV', 'ghessel@example.net', '2024-01-24 01:29:20', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'Zhe4t9rFGc', '2024-01-24 01:29:21', '2024-01-24 01:29:21'),
(8, 'Emma Cartwright', 'arunte@example.org', '2024-01-24 01:29:20', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'mWefMxipUi', '2024-01-24 01:29:21', '2024-01-24 01:29:21'),
(9, 'Vincent Leuschke', 'deckow.sandra@example.org', '2024-01-24 01:29:20', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'B4IdPP1mn7', '2024-01-24 01:29:21', '2024-01-24 01:29:21'),
(10, 'Kaya Ledner', 'hauck.karina@example.org', '2024-01-24 01:29:20', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'wUFfpn7449', '2024-01-24 01:29:21', '2024-01-24 01:29:21'),
(11, 'Bobby Gleichner', 'cierra53@example.com', '2024-01-24 01:29:20', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'pMDcVZoXUt', '2024-01-24 01:29:21', '2024-01-24 01:29:21'),
(12, 'Jaclyn O\'Connell', 'michaela01@example.com', '2024-01-24 01:29:20', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'yWHJZMEOYO', '2024-01-24 01:29:21', '2024-01-24 01:29:21'),
(13, 'Danial Bode', 'dave75@example.org', '2024-01-24 01:29:20', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'n83HVu4e5M', '2024-01-24 01:29:21', '2024-01-24 01:29:21'),
(14, 'Aliyah Dicki', 'erica.weber@example.com', '2024-01-24 01:29:20', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'txxeNJVrwu', '2024-01-24 01:29:21', '2024-01-24 01:29:21'),
(15, 'Kyler Ondricka V', 'fay92@example.org', '2024-01-24 01:29:20', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'Q0kMnt21Pv', '2024-01-24 01:29:21', '2024-01-24 01:29:21'),
(16, 'Ashly Connelly', 'leuschke.lenny@example.org', '2024-01-24 01:29:20', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'RyePHQYZ2i', '2024-01-24 01:29:21', '2024-01-24 01:29:21'),
(17, 'Dr. Leon Schmitt', 'cecile66@example.com', '2024-01-24 01:29:20', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, '0qZfT8IWpq', '2024-01-24 01:29:21', '2024-01-24 01:29:21'),
(18, 'Katherine Marks', 'jessie33@example.com', '2024-01-24 01:29:20', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'sW4qx2g4So', '2024-01-24 01:29:21', '2024-01-24 01:29:21'),
(19, 'Gracie Smitham', 'drew91@example.com', '2024-01-24 01:29:20', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'tabEWuHQZf', '2024-01-24 01:29:21', '2024-01-24 01:29:21'),
(20, 'Jose Maggio I', 'lockman.georgiana@example.net', '2024-01-24 01:29:20', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'zkdgLKkYVz', '2024-01-24 01:29:21', '2024-01-24 01:29:21'),
(21, 'Cielo Gutkowski', 'breanne.wilderman@example.org', '2024-01-24 01:29:20', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, '9t8doQFiZC', '2024-01-24 01:29:21', '2024-01-24 01:29:21'),
(22, 'Helena Tillman DDS', 'jarrell.littel@example.org', '2024-01-24 01:29:20', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'rmahyDd4SQ', '2024-01-24 01:29:21', '2024-01-24 01:29:21'),
(23, 'Miss Alisha Aufderhar', 'sage22@example.com', '2024-01-24 01:29:20', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'XA0HFcK5wY', '2024-01-24 01:29:21', '2024-01-24 01:29:21');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
