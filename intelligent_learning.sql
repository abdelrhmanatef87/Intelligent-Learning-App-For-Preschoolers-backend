-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 21, 2023 at 06:22 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `intelligent_learning`
--

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

CREATE TABLE `images` (
  `object Detection` varchar(255) NOT NULL,
  `object names` text NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `images`
--

INSERT INTO `images` (`object Detection`, `object names`, `user_id`) VALUES
('6728979received_image.jpg', 'dog', 16),
('7486247received_image.jpg', 'dog, bicycle, truck', 16),
('6179414received_image.jpg', 'laptop', 16),
('9515434received_image.jpg', 'car', 16),
('461843received_image.jpg', 'laptop', 16),
('9279671received_image.jpg', 'person, tie', 16);

-- --------------------------------------------------------

--
-- Table structure for table `ocr`
--

CREATE TABLE `ocr` (
  `image name` varchar(255) NOT NULL,
  `Recognized text` text NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `ocr`
--

INSERT INTO `ocr` (`image name`, `Recognized text`, `user_id`) VALUES
('7056295image_picker129101550.jpg', 'Shhl\nIt&#039;s a secretl', 16),
('6501204image_picker1066286590.png', 'IMAGE]\nTo TEXT:\nHOW To\nEXTRACT TEXT\nFROM AN IMAGE', 16),
('1992832image_picker241124620.png', 'Tomorrow, and\ntomorrow, and\ntomorrow; creeps\nin this petty pace\nfrom day to\nuntil the last\ndayhi-\nable of recorded\ntime. And all our\nyesterdays have\njighted fools the\nway to\ndusty', 16),
('7542545image_picker415172515.png', 'It was the best of\ntimes, it was the worst\nof times, it was the age\nof wisdom; it was the\nage of foolishness_', 16),
('7521011image_picker49023155.jpg', 'Questions\nTo ASK\nTEXT\nOVER', 16),
('6936848image_picker1783953177.jpg', 'Every path is\nthe right path.\n', 16);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `gender` varchar(255) NOT NULL,
  `review` text NOT NULL,
  `positive` float NOT NULL,
  `negative` float NOT NULL,
  `choose` int(11) NOT NULL,
  `complete` int(11) NOT NULL,
  `match` int(11) NOT NULL,
  `listen` int(11) NOT NULL,
  `read` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `gender`, `review`, `positive`, `negative`, `choose`, `complete`, `match`, `listen`, `read`) VALUES
(16, 'Ahmed', 'Ahmed@gmail.com', '123456', 'boy', 'Great app, but it could ', 0.99, 0.01, 33, 11, 16, 24, 6);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `images`
--
ALTER TABLE `images`
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `ocr`
--
ALTER TABLE `ocr`
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `images`
--
ALTER TABLE `images`
  ADD CONSTRAINT `images_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `ocr`
--
ALTER TABLE `ocr`
  ADD CONSTRAINT `ocr_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
