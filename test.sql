-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jan 22, 2020 at 11:15 AM
-- Server version: 5.7.26
-- PHP Version: 7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `test`
--

-- --------------------------------------------------------

--
-- Table structure for table `question`
--

DROP TABLE IF EXISTS `question`;
CREATE TABLE IF NOT EXISTS `question` (
  `question_id` int(11) NOT NULL AUTO_INCREMENT,
  `questions` varchar(100) NOT NULL,
  `main_answer` enum('Animal','Bird') NOT NULL,
  PRIMARY KEY (`question_id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `question`
--

INSERT INTO `question` (`question_id`, `questions`, `main_answer`) VALUES
(1, 'Is Elephant Animal or Bird?', 'Animal'),
(2, 'Is Parrot Animal or Bird?', 'Bird'),
(3, 'Is Sparrow Animal or Bird?', 'Bird'),
(4, 'Is Leopard Animal or Bird?', 'Animal'),
(5, 'Is Camel Animal or Bird?', 'Animal'),
(6, 'Is Peakock Animal or Bird?', 'Bird'),
(7, 'Is Fox Animal or Bird?', 'Animal'),
(8, 'Is Lion Animal or Bird?', 'Animal'),
(9, 'Is Koel Animal or Bird?', 'Bird'),
(10, 'Is Bulbul Animal or Bird?', 'Bird'),
(11, 'Is Crow Animal or Bird?', 'Bird'),
(12, 'Is Tiger Animal or Bird?', 'Animal'),
(13, 'Is Monkey Animal or Bird?', 'Animal'),
(14, 'Is Buffalo Animal or Bird?', 'Animal'),
(16, 'Is Penguin Animal or Bird?', 'Animal'),
(17, 'Is Kingfisher Animal or Bird?', 'Bird'),
(18, 'Is Cuckoos Animal or Bird?', 'Bird'),
(19, 'Is Starfish Animal or Bird?', 'Animal'),
(20, 'Is Green Bee Eater Bird or Animal?', 'Bird'),
(21, 'Is Dog Animal or Bird?', 'Animal'),
(22, 'Is Turtle Animal or Bird?', 'Animal'),
(23, 'Is Rabbit Animal or Bird?', 'Animal'),
(24, 'Is Goldfish Animal or Bird?', 'Animal'),
(25, 'Is Mouse Animal or Bird?', 'Animal'),
(26, 'Is Deer Animal or Bird?', 'Animal'),
(27, 'Is Horse Animal or Bird?', 'Animal'),
(28, 'Is Goat Animal or Bird?', 'Animal'),
(29, 'Is Flamingo Animal or Bird?', 'Bird'),
(30, 'Is Woodpecker Animal or Bird?', 'Bird'),
(31, 'Is Ostrich Animal or Bird?', 'Bird'),
(32, 'Is Turkey Animal or Bird?', 'Bird'),
(33, 'Is Bald Eagle Animal or Bird?', 'Bird'),
(34, 'Is Raven Animal or Bird?', 'Bird'),
(35, 'Is Seagull Animal or Bird?', 'Bird'),
(36, 'Is Stork Animal or Bird?', 'Bird');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(50) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `user_name`) VALUES
(1, 'sagar'),
(2, 'hello'),
(3, 'sagar12'),
(4, 'Dhaval'),
(5, 'asasa'),
(6, 'wewewe'),
(7, 'uu'),
(8, 'sagar23'),
(9, 'hello21'),
(10, 'sagar123'),
(11, 'sagarh'),
(12, 'hello123'),
(13, 'Try');

-- --------------------------------------------------------

--
-- Table structure for table `user_ans`
--

DROP TABLE IF EXISTS `user_ans`;
CREATE TABLE IF NOT EXISTS `user_ans` (
  `user_ans_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `question_id` int(20) DEFAULT NULL,
  `user_answer` enum('Animal','Bird') NOT NULL,
  PRIMARY KEY (`user_ans_id`),
  KEY `user_id` (`user_id`),
  KEY `question_id` (`question_id`),
  KEY `answer` (`user_answer`)
) ENGINE=MyISAM AUTO_INCREMENT=174 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_ans`
--

INSERT INTO `user_ans` (`user_ans_id`, `user_id`, `question_id`, `user_answer`) VALUES
(1, 1, 31, 'Bird'),
(2, 1, 2, 'Bird'),
(3, 1, 36, 'Bird'),
(4, 1, 14, 'Bird'),
(5, 1, 30, 'Bird'),
(6, 1, 27, 'Bird'),
(7, 1, 33, 'Bird'),
(8, 1, 29, 'Bird'),
(9, 1, 23, 'Bird'),
(10, 1, 34, 'Bird'),
(11, 1, 19, 'Bird'),
(12, 1, 16, 'Bird'),
(13, 1, 6, 'Bird'),
(14, 1, 6, 'Bird'),
(15, 1, 26, 'Bird'),
(16, 1, 28, 'Bird'),
(17, 1, 8, 'Bird'),
(18, 1, 3, 'Bird'),
(19, 1, 7, 'Bird'),
(20, 1, 7, 'Bird'),
(21, 1, 5, 'Bird'),
(22, 1, 24, 'Bird'),
(23, 1, 11, 'Bird'),
(24, 1, 9, 'Bird'),
(25, 2, 21, 'Bird'),
(26, 2, 1, 'Bird'),
(27, 2, 18, 'Bird'),
(28, 2, 9, 'Bird'),
(29, 2, 20, 'Bird'),
(30, 2, 34, 'Bird'),
(31, 2, 6, 'Bird'),
(32, 2, 31, 'Bird'),
(33, 2, 23, 'Bird'),
(34, 2, 5, 'Bird'),
(35, 2, 5, 'Bird'),
(36, 2, 12, 'Bird'),
(37, 2, 4, 'Bird'),
(38, 2, 7, 'Bird'),
(39, 2, 16, 'Bird'),
(40, 2, 16, 'Bird'),
(41, 2, 26, 'Bird'),
(42, 2, 14, 'Bird'),
(43, 2, 30, 'Bird'),
(44, 2, 13, 'Bird'),
(45, 2, 11, 'Bird'),
(46, 2, 8, 'Bird'),
(47, 2, 22, 'Bird'),
(48, 2, 25, 'Bird'),
(49, 2, 19, 'Bird'),
(50, 3, 34, 'Bird'),
(51, 3, 17, 'Bird'),
(52, 3, 24, 'Bird'),
(53, 3, 24, 'Bird'),
(54, 3, 36, 'Bird'),
(55, 3, 33, 'Bird'),
(56, 3, 7, 'Bird'),
(57, 3, 5, 'Bird'),
(58, 3, 11, 'Bird'),
(59, 3, 21, 'Bird'),
(60, 3, 30, 'Bird'),
(61, 3, 20, 'Bird'),
(62, 3, 29, 'Bird'),
(63, 3, 2, 'Bird'),
(64, 3, 16, 'Bird'),
(65, 3, 22, 'Bird'),
(66, 3, 28, 'Bird'),
(67, 3, 9, 'Bird'),
(68, 3, 4, 'Bird'),
(69, 3, 23, 'Bird'),
(70, 3, 1, 'Bird'),
(71, 3, 31, 'Bird'),
(72, 3, 35, 'Bird'),
(73, 3, 25, 'Bird'),
(74, 4, 31, 'Bird'),
(75, 4, 31, 'Bird'),
(76, 4, 23, 'Bird'),
(77, 4, 11, 'Bird'),
(78, 4, 13, 'Bird'),
(79, 4, 7, 'Bird'),
(80, 4, 21, 'Bird'),
(81, 4, 12, 'Bird'),
(82, 4, 12, 'Bird'),
(83, 4, 19, 'Bird'),
(84, 4, 3, 'Bird'),
(85, 4, 8, 'Bird'),
(86, 4, 20, 'Bird'),
(87, 4, 1, 'Bird'),
(88, 4, 6, 'Bird'),
(89, 4, 29, 'Bird'),
(90, 4, 18, 'Bird'),
(91, 4, 26, 'Bird'),
(92, 4, 35, 'Bird'),
(93, 4, 10, 'Bird'),
(94, 4, 5, 'Bird'),
(95, 4, 34, 'Bird'),
(96, 4, 24, 'Bird'),
(97, 4, 27, 'Bird'),
(98, 4, 22, 'Bird'),
(99, 5, 7, 'Animal'),
(100, 5, 7, 'Bird'),
(101, 5, 19, 'Bird'),
(102, 5, 24, 'Bird'),
(103, 5, 20, 'Bird'),
(104, 5, 26, 'Bird'),
(105, 5, 6, 'Bird'),
(106, 5, 2, 'Bird'),
(107, 5, 28, 'Bird'),
(108, 5, 9, 'Bird'),
(109, 5, 3, 'Bird'),
(110, 5, 30, 'Bird'),
(111, 5, 5, 'Bird'),
(112, 5, 10, 'Bird'),
(113, 5, 31, 'Bird'),
(114, 5, 23, 'Bird'),
(115, 5, 33, 'Bird'),
(116, 5, 35, 'Bird'),
(117, 6, 29, 'Animal'),
(118, 7, 22, 'Animal'),
(119, 7, 3, 'Bird'),
(120, 7, 14, 'Bird'),
(121, 7, 6, 'Bird'),
(122, 7, 29, 'Bird'),
(123, 7, 30, 'Bird'),
(124, 7, 27, 'Bird'),
(125, 7, 13, 'Bird'),
(126, 7, 32, 'Bird'),
(127, 7, 31, 'Bird'),
(128, 7, 26, 'Bird'),
(129, 7, 16, 'Bird'),
(130, 7, 4, 'Bird'),
(131, 7, 1, 'Bird'),
(132, 7, 23, 'Bird'),
(133, 7, 25, 'Bird'),
(134, 7, 21, 'Bird'),
(135, 7, 19, 'Bird'),
(136, 8, 33, 'Bird'),
(137, 8, 32, 'Bird'),
(138, 8, 7, 'Bird'),
(139, 8, 12, 'Bird'),
(140, 8, 30, 'Bird'),
(141, 8, 8, 'Bird'),
(142, 8, 26, 'Bird'),
(143, 8, 13, 'Bird'),
(144, 8, 14, 'Bird'),
(145, 8, 29, 'Bird'),
(146, 8, 2, 'Bird'),
(147, 8, 10, 'Bird'),
(148, 8, 6, 'Bird'),
(149, 8, 3, 'Bird'),
(150, 8, 27, 'Bird'),
(151, 8, 18, 'Bird'),
(152, 8, 11, 'Bird'),
(153, 8, 17, 'Bird'),
(154, 8, 31, 'Bird'),
(155, 8, 35, 'Bird'),
(156, 8, 9, 'Bird'),
(157, 8, 36, 'Bird'),
(158, 8, 4, 'Bird'),
(159, 8, 19, 'Bird'),
(160, 8, 25, 'Bird'),
(161, 8, 1, 'Bird'),
(162, 8, 23, 'Bird'),
(163, 8, 28, 'Bird'),
(164, 8, 21, 'Bird'),
(165, 9, 20, 'Animal'),
(166, 9, 10, 'Bird'),
(167, 9, 25, 'Bird'),
(168, 9, 17, 'Bird'),
(169, 9, 11, 'Bird'),
(170, 9, 34, 'Bird'),
(171, 9, 33, 'Bird'),
(172, 9, 13, 'Animal'),
(173, 10, 1, 'Animal');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
