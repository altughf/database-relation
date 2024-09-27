-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
-- Sunucu sürümü: 8.0.39
-- PHP Sürümü: 8.2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

-- --------------------------------------------------------

CREATE TABLE `category_table` (
  `category_id` int NOT NULL,
  `category_user_id` int NOT NULL,
  `category_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `category_body` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `category_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

CREATE TABLE `comment_table` (
  `comment_id` int NOT NULL,
  `comment_user_id` int NOT NULL,
  `comment_status` enum('pending','approve') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'pending',
  `comment_content_id` int NOT NULL,
  `comment_text` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `comment_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

CREATE TABLE `contact_table` (
  `contact_message_id` int NOT NULL,
  `contact_user_id` int NOT NULL,
  `contact_message_status` enum('pending','approve') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'pending',
  `contact_user_subject` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `contact_user_message` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `contact_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

CREATE TABLE `content_table` (
  `content_id` int NOT NULL,
  `content_user_id` int NOT NULL,
  `content_category_id` int NOT NULL,
  `content_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `content_slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `content_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `content_image_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `content_body` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `content_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

CREATE TABLE `favorite_table` (
  `favorite_id` int NOT NULL,
  `favorite_user_id` int NOT NULL,
  `favorite_content_id` int NOT NULL,
  `favorite_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

CREATE TABLE `like_table` (
  `like_id` int NOT NULL,
  `like_user_id` int NOT NULL,
  `like_content_id` int NOT NULL,
  `like_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

CREATE TABLE `roles_table` (
  `role_id` int NOT NULL,
  `role_type` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `role_level` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

CREATE TABLE `user_table` (
  `user_id` int NOT NULL,
  `first_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `last_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `user_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `user_mail` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `user_password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `user_role_id` int NOT NULL DEFAULT '1',
  `user_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

ALTER TABLE `category_table`
  ADD PRIMARY KEY (`category_id`);

ALTER TABLE `comment_table`
  ADD PRIMARY KEY (`comment_id`),
  ADD KEY `comment_user_id` (`comment_user_id`),
  ADD KEY `comment_content_id` (`comment_content_id`);

ALTER TABLE `contact_table`
  ADD PRIMARY KEY (`contact_message_id`),
  ADD KEY `contact_user_id` (`contact_user_id`);

ALTER TABLE `content_table`
  ADD PRIMARY KEY (`content_id`),
  ADD KEY `content_table_ibfk_1` (`content_user_id`),
  ADD KEY `content_category_id` (`content_category_id`);

ALTER TABLE `favorite_table`
  ADD PRIMARY KEY (`favorite_id`),
  ADD KEY `favorite_user_id` (`favorite_user_id`),
  ADD KEY `favorite_content_id` (`favorite_content_id`);

ALTER TABLE `like_table`
  ADD PRIMARY KEY (`like_id`),
  ADD KEY `like_user_id` (`like_user_id`),
  ADD KEY `like_content_id` (`like_content_id`);

ALTER TABLE `roles_table`
  ADD PRIMARY KEY (`role_id`);

ALTER TABLE `user_table`
  ADD PRIMARY KEY (`user_id`);

ALTER TABLE `category_table`
  MODIFY `category_id` int NOT NULL AUTO_INCREMENT;

ALTER TABLE `comment_table`
  MODIFY `comment_id` int NOT NULL AUTO_INCREMENT;

ALTER TABLE `contact_table`
  MODIFY `contact_message_id` int NOT NULL AUTO_INCREMENT;

ALTER TABLE `content_table`
  MODIFY `content_id` int NOT NULL AUTO_INCREMENT;

ALTER TABLE `favorite_table`
  MODIFY `favorite_id` int NOT NULL AUTO_INCREMENT;

ALTER TABLE `like_table`
  MODIFY `like_id` int NOT NULL AUTO_INCREMENT;

ALTER TABLE `roles_table`
  MODIFY `role_id` int NOT NULL AUTO_INCREMENT;

ALTER TABLE `user_table`
  MODIFY `user_id` int NOT NULL AUTO_INCREMENT;

ALTER TABLE `comment_table`
  ADD CONSTRAINT `comment_table_ibfk_1` FOREIGN KEY (`comment_user_id`) REFERENCES `user_table` (`user_id`),
  ADD CONSTRAINT `comment_table_ibfk_2` FOREIGN KEY (`comment_content_id`) REFERENCES `content_table` (`content_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE `contact_table`
  ADD CONSTRAINT `contact_table_ibfk_1` FOREIGN KEY (`contact_user_id`) REFERENCES `user_table` (`user_id`);

ALTER TABLE `content_table`
  ADD CONSTRAINT `content_table_ibfk_1` FOREIGN KEY (`content_user_id`) REFERENCES `user_table` (`user_id`),
  ADD CONSTRAINT `content_table_ibfk_2` FOREIGN KEY (`content_category_id`) REFERENCES `category_table` (`category_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE `favorite_table`
  ADD CONSTRAINT `favorite_table_ibfk_1` FOREIGN KEY (`favorite_user_id`) REFERENCES `user_table` (`user_id`),
  ADD CONSTRAINT `favorite_table_ibfk_2` FOREIGN KEY (`favorite_content_id`) REFERENCES `content_table` (`content_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE `like_table`
  ADD CONSTRAINT `like_table_ibfk_1` FOREIGN KEY (`like_user_id`) REFERENCES `user_table` (`user_id`),
  ADD CONSTRAINT `like_table_ibfk_2` FOREIGN KEY (`like_content_id`) REFERENCES `content_table` (`content_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
