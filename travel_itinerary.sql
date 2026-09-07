-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 06, 2026 at 04:39 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `travel_itinerary`
--

-- --------------------------------------------------------

--
-- Table structure for table `destinations`
--

CREATE TABLE `destinations` (
  `id` int(10) UNSIGNED NOT NULL,
  `itinerary_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(150) NOT NULL,
  `country` varchar(150) DEFAULT NULL,
  `icon` varchar(100) DEFAULT NULL,
  `duration` varchar(100) DEFAULT NULL,
  `sort_order` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `destinations`
--

INSERT INTO `destinations` (`id`, `itinerary_id`, `name`, `country`, `icon`, `duration`, `sort_order`, `created_at`) VALUES
(4, 1, 'Zurich', 'Swiss', '📍', '2 Nights', 1, '2026-09-06 12:33:31'),
(5, 1, 'Zermatt', 'Swiss', '📍', '2 Nights', 2, '2026-09-06 12:33:54');

-- --------------------------------------------------------

--
-- Table structure for table `documents`
--

CREATE TABLE `documents` (
  `id` int(10) UNSIGNED NOT NULL,
  `itinerary_id` int(10) UNSIGNED NOT NULL,
  `document_type` enum('hotel_voucher','flight_ticket','car_ticket','train_ticket','transfer_voucher','other') NOT NULL DEFAULT 'other',
  `title` varchar(255) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `original_name` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `show_to_client` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `documents`
--

INSERT INTO `documents` (`id`, `itinerary_id`, `document_type`, `title`, `file_name`, `original_name`, `created_at`, `show_to_client`) VALUES
(2, 1, 'other', 'web', '8c685807fbc63ef856bc7ae8fa912bc37a68b4d8dc913cab.pdf', 'ticket.pdf', '2026-09-06 12:32:54', 1);

-- --------------------------------------------------------

--
-- Table structure for table `exclusions`
--

CREATE TABLE `exclusions` (
  `id` int(10) UNSIGNED NOT NULL,
  `itinerary_id` int(10) UNSIGNED NOT NULL,
  `item_text` text NOT NULL,
  `is_visible` tinyint(1) NOT NULL DEFAULT 1,
  `sort_order` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `show_to_client` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hotels`
--

CREATE TABLE `hotels` (
  `id` int(10) UNSIGNED NOT NULL,
  `itinerary_id` int(10) UNSIGNED NOT NULL,
  `destination_id` int(10) UNSIGNED NOT NULL,
  `hotel_name` varchar(255) NOT NULL,
  `room_type` varchar(255) DEFAULT NULL,
  `nights` int(10) NOT NULL DEFAULT 0,
  `photo` varchar(255) DEFAULT NULL,
  `details` text DEFAULT NULL,
  `sort_order` int(10) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hotels`
--

INSERT INTO `hotels` (`id`, `itinerary_id`, `destination_id`, `hotel_name`, `room_type`, `nights`, `photo`, `details`, `sort_order`, `created_at`, `updated_at`) VALUES
(4, 1, 4, 'hotel Zurich Resort', 'Deluxe room', 2, 'hotel_c67a9d835b81d4fd1d163a6561aa1d5b.jpg', NULL, 1, '2026-09-06 12:38:44', '2026-09-06 12:38:44'),
(5, 1, 5, 'hotel Zermatt Resort', 'Deluxe room', 2, 'hotel_f1c13ac69ef05184138b34a429ae0062.jpg', NULL, 2, '2026-09-06 13:35:09', '2026-09-06 13:35:09');

-- --------------------------------------------------------

--
-- Table structure for table `inclusions`
--

CREATE TABLE `inclusions` (
  `id` int(10) UNSIGNED NOT NULL,
  `itinerary_id` int(10) UNSIGNED NOT NULL,
  `item_text` text NOT NULL,
  `is_visible` tinyint(1) NOT NULL DEFAULT 1,
  `sort_order` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `show_to_client` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `itineraries`
--

CREATE TABLE `itineraries` (
  `id` int(10) UNSIGNED NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `destination` varchar(255) DEFAULT NULL,
  `country` varchar(150) DEFAULT NULL,
  `hero_image` varchar(255) DEFAULT NULL,
  `overview` text DEFAULT NULL,
  `duration_days` int(10) UNSIGNED DEFAULT NULL,
  `duration_nights` int(10) UNSIGNED DEFAULT NULL,
  `show_overview` tinyint(1) NOT NULL DEFAULT 1,
  `show_destinations` tinyint(1) NOT NULL DEFAULT 1,
  `show_itinerary` tinyint(1) NOT NULL DEFAULT 1,
  `show_hotels` tinyint(1) NOT NULL DEFAULT 1,
  `show_documents` tinyint(1) NOT NULL DEFAULT 1,
  `show_inclusions` tinyint(1) NOT NULL DEFAULT 1,
  `show_exclusions` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `itineraries`
--

INSERT INTO `itineraries` (`id`, `client_id`, `title`, `destination`, `country`, `hero_image`, `overview`, `duration_days`, `duration_nights`, `show_overview`, `show_destinations`, `show_itinerary`, `show_hotels`, `show_documents`, `show_inclusions`, `show_exclusions`, `created_at`, `updated_at`) VALUES
(1, 2, 'Switzerland Summer Escape', 'Switzerland', 'Switzerland', 'hero_0a2bd93644927a8f001f68fac41fada0.webp', 'Experience the beauty of Switzerland...', 7, 6, 1, 1, 1, 1, 1, 1, 1, '2026-09-06 07:00:19', '2026-09-06 07:00:19');

-- --------------------------------------------------------

--
-- Table structure for table `itinerary_days`
--

CREATE TABLE `itinerary_days` (
  `id` int(10) UNSIGNED NOT NULL,
  `itinerary_id` int(10) UNSIGNED NOT NULL,
  `day_number` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `date_label` varchar(100) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `details` text DEFAULT NULL,
  `sort_order` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `itinerary_days`
--

INSERT INTO `itinerary_days` (`id`, `itinerary_id`, `day_number`, `title`, `date_label`, `photo`, `details`, `sort_order`, `created_at`) VALUES
(2, 1, 1, 'ARRIVAL IN TBILISI', '15 October 2026', 'day_062aeef06cef117afedc78eed66cd6ba.webp', 'Upon arrival at Tbilisi International Airport, you will be welcomed and transferred to your hotel. After check-in, the remainder of the day is at leisure.\r\n\r\nOvernight stay in Tbilisi.', 1, '2026-09-06 12:37:23');

-- --------------------------------------------------------

--
-- Table structure for table `itinerary_items`
--

CREATE TABLE `itinerary_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `day_id` int(10) UNSIGNED NOT NULL,
  `item_text` text NOT NULL,
  `sort_order` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `itinerary_items`
--

INSERT INTO `itinerary_items` (`id`, `day_id`, `item_text`, `sort_order`, `created_at`) VALUES
(5, 2, 'Walk through the Old Town', 1, '2026-09-06 12:37:36'),
(6, 2, 'Visit Narikala Fortress', 2, '2026-09-06 12:37:46'),
(7, 2, 'Walk across the Bridge of Peace', 3, '2026-09-06 12:37:55'),
(8, 2, 'Explore the Abanotubani district', 4, '2026-09-06 12:38:03');

-- --------------------------------------------------------

--
-- Table structure for table `itinerary_users`
--

CREATE TABLE `itinerary_users` (
  `id` int(10) UNSIGNED NOT NULL,
  `itinerary_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `itinerary_users`
--

INSERT INTO `itinerary_users` (`id`, `itinerary_id`, `user_id`, `created_at`) VALUES
(1, 1, 2, '2026-09-06 11:08:53');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(150) NOT NULL,
  `email` varchar(190) DEFAULT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','client') NOT NULL DEFAULT 'client',
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `username`, `password`, `role`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Administrator', 'admin@example.com', 'admin', '$2y$10$Ks.WwD2cPCjOo3JQa.m8fOi92uNvyj2ZqGjlY/MJxxmI7/7Z5GwgG', 'admin', 1, '2026-09-06 06:46:13', '2026-09-06 06:46:13'),
(2, 'Rahul Patel', 'rahul@example.com', 'rahul', '$2y$10$YVqY2Uutfsj4d36icyA6dOsslZebruTb3B0b0kPTwWOi9xkhom1Vq', 'client', 1, '2026-09-06 06:53:43', '2026-09-06 06:53:43');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `destinations`
--
ALTER TABLE `destinations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_destination_itinerary` (`itinerary_id`);

--
-- Indexes for table `documents`
--
ALTER TABLE `documents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_document_itinerary` (`itinerary_id`);

--
-- Indexes for table `exclusions`
--
ALTER TABLE `exclusions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_exclusion_itinerary` (`itinerary_id`);

--
-- Indexes for table `hotels`
--
ALTER TABLE `hotels`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_hotels_itinerary` (`itinerary_id`),
  ADD KEY `idx_hotels_destination` (`destination_id`);

--
-- Indexes for table `inclusions`
--
ALTER TABLE `inclusions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_inclusion_itinerary` (`itinerary_id`);

--
-- Indexes for table `itineraries`
--
ALTER TABLE `itineraries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_itinerary_client` (`client_id`);

--
-- Indexes for table `itinerary_days`
--
ALTER TABLE `itinerary_days`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_day_itinerary` (`itinerary_id`);

--
-- Indexes for table `itinerary_items`
--
ALTER TABLE `itinerary_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_item_day` (`day_id`);

--
-- Indexes for table `itinerary_users`
--
ALTER TABLE `itinerary_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_itinerary_user` (`itinerary_id`,`user_id`),
  ADD KEY `idx_itinerary_users_itinerary` (`itinerary_id`),
  ADD KEY `idx_itinerary_users_user` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `destinations`
--
ALTER TABLE `destinations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `documents`
--
ALTER TABLE `documents`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `exclusions`
--
ALTER TABLE `exclusions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hotels`
--
ALTER TABLE `hotels`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `inclusions`
--
ALTER TABLE `inclusions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `itineraries`
--
ALTER TABLE `itineraries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `itinerary_days`
--
ALTER TABLE `itinerary_days`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `itinerary_items`
--
ALTER TABLE `itinerary_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `itinerary_users`
--
ALTER TABLE `itinerary_users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `destinations`
--
ALTER TABLE `destinations`
  ADD CONSTRAINT `fk_destination_itinerary` FOREIGN KEY (`itinerary_id`) REFERENCES `itineraries` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `documents`
--
ALTER TABLE `documents`
  ADD CONSTRAINT `fk_document_itinerary` FOREIGN KEY (`itinerary_id`) REFERENCES `itineraries` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `exclusions`
--
ALTER TABLE `exclusions`
  ADD CONSTRAINT `fk_exclusion_itinerary` FOREIGN KEY (`itinerary_id`) REFERENCES `itineraries` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `hotels`
--
ALTER TABLE `hotels`
  ADD CONSTRAINT `fk_hotels_destination` FOREIGN KEY (`destination_id`) REFERENCES `destinations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_hotels_itinerary` FOREIGN KEY (`itinerary_id`) REFERENCES `itineraries` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `inclusions`
--
ALTER TABLE `inclusions`
  ADD CONSTRAINT `fk_inclusion_itinerary` FOREIGN KEY (`itinerary_id`) REFERENCES `itineraries` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `itineraries`
--
ALTER TABLE `itineraries`
  ADD CONSTRAINT `fk_itinerary_client` FOREIGN KEY (`client_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `itinerary_days`
--
ALTER TABLE `itinerary_days`
  ADD CONSTRAINT `fk_day_itinerary` FOREIGN KEY (`itinerary_id`) REFERENCES `itineraries` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `itinerary_items`
--
ALTER TABLE `itinerary_items`
  ADD CONSTRAINT `fk_item_day` FOREIGN KEY (`day_id`) REFERENCES `itinerary_days` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `itinerary_users`
--
ALTER TABLE `itinerary_users`
  ADD CONSTRAINT `fk_itinerary_users_itinerary` FOREIGN KEY (`itinerary_id`) REFERENCES `itineraries` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_itinerary_users_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
