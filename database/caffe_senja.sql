-- SQL Export for Cafe Senja
-- Database: caffe_senja

SET FOREIGN_KEY_CHECKS = 0;

-- 1. Table Structures
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin', 'user') DEFAULT 'user',
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `nama_kategori` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `menus`;
CREATE TABLE `menus` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `category_id` bigint UNSIGNED DEFAULT NULL,
  `nama_menu` varchar(255) NOT NULL,
  `harga` int NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `deskripsi` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `menus_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint UNSIGNED NOT NULL,
  `rincian_pesanan` text NOT NULL,
  `catatan` text DEFAULT NULL,
  `total_harga` int NOT NULL,
  `status` enum('pending', 'selesai') DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `sarans`;
CREATE TABLE `sarans` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `pesan` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 2. Data Seeding
INSERT INTO `users` (`id`, `name`, `email`, `password`, `role`, `created_at`, `updated_at`) VALUES
(1, 'Admin Caffe Senja', 'adminsenja@gmail.com', '$2y$12$2o3A6GCoBurKVJr.9nkTl.kYUzqpJriO.YS0LPkF1sbr6DoIopxc.', 'admin', NOW(), NOW()),
(2, 'Guest (User)', 'guest@gmail.com', '$2y$12$JgmJ/BmK1kVKMHLiduvKj.cXFP/jV6Ao4O2LK8ZPSJbSZXIwyWTOi', 'user', NOW(), NOW()),
(3, 'Adelia Rahmawati', 'adel@gmail.com', '$2y$12$FaEHm/RCK.k0ZAgIs2K6h.gVkR8x5rdynCfDozisL.lKjOFUcS75u', 'user', NOW(), NOW());

INSERT INTO `categories` (`id`, `nama_kategori`, `created_at`, `updated_at`) VALUES
(1, 'Coffee', NOW(), NOW()),
(2, 'Non-Coffee', NOW(), NOW());

INSERT INTO `menus` (`id`, `category_id`, `nama_menu`, `harga`, `deskripsi`, `created_at`, `updated_at`) VALUES
(1, 1, 'Kopi Senja', 15000, 'Kopi susu gula aren', NOW(), NOW()),
(2, 2, 'Matcha Latte', 18000, 'Minuman teh hijau murni', NOW(), NOW()),
(3, 1, 'Americano', 11000, 'Kopi hitam murni', NOW(), NOW());

SET FOREIGN_KEY_CHECKS = 1;
