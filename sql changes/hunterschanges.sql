-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 24, 2025 at 08:14 PM
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
-- Database: `monster_hunter_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `hunters`
--

DROP TABLE IF EXISTS `Hunters`;
CREATE TABLE `Hunters` (
  `Hunter_ID` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `rank` varchar(20) DEFAULT 'Novice',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `favorite_game` varchar(50) DEFAULT 'Monster Hunter',
  `favorite_monster_id` int(11) DEFAULT NULL,
  `profile_picture` varchar(255) DEFAULT 'default_hunter.png',
  `rank_type` varchar(5) DEFAULT NULL,
  `rank_level` int(11) DEFAULT 1,
  `palico_name` varchar(50) DEFAULT 'Palico',
  `hunter_screenshot` varchar(255) DEFAULT NULL,
  `favorite_weapon` varchar(50) DEFAULT 'Great Sword'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hunters`
--

INSERT INTO `Hunters` (`Hunter_ID`, `username`, `password`, `rank`, `created_at`, `favorite_game`, `favorite_monster_id`, `profile_picture`, `rank_type`, `rank_level`, `palico_name`, `hunter_screenshot`, `favorite_weapon`) VALUES
(1, 'Zentai', '$2y$10$mO0YCXsasNgyThpaQXpXKeGtnkzZeNWcNfPv0bpk/rzCSRuayCX/a', 'Novice', '2025-12-24 17:26:36', 'Monster Hunter', NULL, 'default_hunter.png', NULL, 1, 'Palico', NULL, 'Great Sword'),
(2, 'Zentai_Kun', '$2y$10$uW8PO43MewwBExQdQvW2He.QgSd9a0Bj7xLTG/hwGHacZpS0BzVLi', 'Novice', '2025-12-24 17:28:20', 'Monster Hunter', NULL, 'default_hunter.png', NULL, 1, 'Palico', NULL, 'Great Sword'),
(3, 'ZentaiZeppeli', '$2y$10$jcAiviF8SOh/pvnTZ9ueDeKx4Ri0zOmjFZp4DrrcLCaLbsVw0DuwG', 'Hunter Rank 74', '2025-12-24 17:46:39', 'MH World: Iceborne', 9, 'default_hunter.png', NULL, 1, 'Palico', NULL, 'Great Sword'),
(4, 'ZentaiKennedy', '$2y$10$YRvHJkpDdJZghyTj34mR.e7JNfIvK.ZC0u8a6bsNnzj8XRqiqXVyO', 'Novice', '2025-12-24 17:56:28', 'MH World: Iceborne', 9, 'hunter_4_1766600386.png', 'MR', 54, 'Miso', 'shot_4_1766600386.png', 'Dual Blades');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `hunters`
--
ALTER TABLE `Hunters`
  ADD PRIMARY KEY (`Hunter_ID`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `fk_fav_monster` (`favorite_monster_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `hunters`
--
ALTER TABLE `Hunters`
  MODIFY `Hunter_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `hunters`
--
ALTER TABLE `Hunters`
  ADD CONSTRAINT `fk_fav_monster` FOREIGN KEY (`favorite_monster_id`) REFERENCES `Monster` (`Monster_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
