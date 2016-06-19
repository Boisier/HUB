-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Dim 19 Juin 2016 à 20:35
-- Version du serveur :  5.7.9
-- Version de PHP :  7.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `stm`
--

-- --------------------------------------------------------

--
-- Structure de la table `links`
--

DROP TABLE IF EXISTS `links`;
CREATE TABLE IF NOT EXISTS `links` (
  `link_id` int(11) NOT NULL AUTO_INCREMENT,
  `line_a` int(11) NOT NULL,
  `station_a` int(11) NOT NULL,
  `platform_a` int(11) DEFAULT NULL,
  `line_b` int(11) NOT NULL,
  `station_b` int(11) NOT NULL,
  `platform_b` int(11) DEFAULT NULL,
  `link_value` int(11) NOT NULL,
  `link_comment` text,
  PRIMARY KEY (`link_id`),
  UNIQUE KEY `line_a` (`line_a`,`station_a`,`line_b`,`station_b`),
  KEY `station_a` (`station_a`),
  KEY `line_b` (`line_b`),
  KEY `station_b` (`station_b`)
) ENGINE=InnoDB AUTO_INCREMENT=324 DEFAULT CHARSET=latin1;

--
-- Contenu de la table `links`
--

INSERT INTO `links` (`link_id`, `line_a`, `station_a`, `platform_a`, `line_b`, `station_b`, `platform_b`, `link_value`, `link_comment`) VALUES
(1, 1, 1, NULL, 1, 2, NULL, 1, NULL),
(2, 1, 2, NULL, 1, 3, NULL, 2, NULL),
(3, 1, 3, NULL, 1, 67, NULL, 1, NULL),
(4, 1, 4, NULL, 1, 5, NULL, 1, NULL),
(5, 1, 5, NULL, 1, 6, NULL, 1, NULL),
(6, 1, 6, NULL, 1, 7, NULL, 2, NULL),
(7, 1, 7, NULL, 1, 8, NULL, 2, NULL),
(8, 2, 7, NULL, 2, 46, NULL, 1, NULL),
(9, 1, 8, NULL, 1, 9, NULL, 2, NULL),
(10, 1, 9, NULL, 1, 10, NULL, 2, NULL),
(11, 1, 10, NULL, 1, 11, NULL, 2, NULL),
(12, 1, 11, NULL, 1, 12, NULL, 2, NULL),
(13, 1, 12, NULL, 1, 13, NULL, 2, NULL),
(14, 1, 13, NULL, 1, 14, NULL, 2, NULL),
(15, 1, 14, NULL, 1, 15, NULL, 2, NULL),
(16, 2, 14, NULL, 2, 40, NULL, 2, NULL),
(17, 4, 14, NULL, 4, 65, NULL, 2, NULL),
(18, 1, 15, NULL, 1, 16, NULL, 2, NULL),
(19, 1, 16, NULL, 1, 17, NULL, 2, NULL),
(20, 1, 17, NULL, 1, 18, NULL, 2, NULL),
(21, 1, 18, NULL, 1, 19, NULL, 2, NULL),
(22, 1, 19, NULL, 1, 20, NULL, 2, NULL),
(23, 1, 20, NULL, 1, 21, NULL, 2, NULL),
(24, 1, 21, NULL, 1, 22, NULL, 2, NULL),
(25, 1, 22, NULL, 1, 23, NULL, 2, NULL),
(26, 1, 23, NULL, 1, 24, NULL, 2, NULL),
(27, 1, 24, NULL, 1, 25, NULL, 2, NULL),
(28, 1, 25, NULL, 1, 26, NULL, 2, NULL),
(29, 2, 27, NULL, 2, 28, NULL, 2, NULL),
(30, 2, 28, NULL, 2, 29, NULL, 2, NULL),
(31, 2, 29, NULL, 2, 30, NULL, 2, NULL),
(32, 2, 30, NULL, 2, 31, NULL, 2, NULL),
(33, 2, 31, NULL, 2, 32, NULL, 2, NULL),
(34, 2, 32, NULL, 2, 33, NULL, 2, NULL),
(35, 2, 33, NULL, 2, 34, NULL, 2, NULL),
(36, 2, 34, NULL, 2, 35, NULL, 2, NULL),
(37, 5, 34, NULL, 5, 62, NULL, 2, NULL),
(38, 2, 35, NULL, 2, 36, NULL, 2, NULL),
(39, 2, 36, NULL, 2, 37, NULL, 2, NULL),
(40, 2, 37, NULL, 2, 38, NULL, 2, NULL),
(41, 2, 38, NULL, 2, 39, NULL, 2, NULL),
(42, 2, 39, NULL, 2, 14, NULL, 2, NULL),
(43, 2, 40, NULL, 2, 41, NULL, 2, NULL),
(44, 2, 41, NULL, 2, 42, NULL, 2, NULL),
(45, 2, 42, NULL, 2, 43, NULL, 2, NULL),
(46, 2, 43, NULL, 2, 44, NULL, 2, NULL),
(47, 2, 44, NULL, 2, 45, NULL, 2, NULL),
(48, 2, 45, NULL, 2, 7, NULL, 2, NULL),
(49, 2, 46, NULL, 2, 47, NULL, 2, NULL),
(50, 2, 47, NULL, 2, 48, NULL, 2, NULL),
(51, 2, 48, NULL, 2, 49, NULL, 2, NULL),
(52, 2, 49, NULL, 2, 50, NULL, 2, NULL),
(53, 5, 49, NULL, 5, 56, NULL, 2, NULL),
(54, 2, 50, NULL, 2, 51, NULL, 2, NULL),
(55, 2, 51, NULL, 2, 52, NULL, 2, NULL),
(56, 2, 52, NULL, 2, 53, NULL, 2, NULL),
(57, 2, 53, NULL, 2, 54, NULL, 2, NULL),
(58, 2, 54, NULL, 2, 55, NULL, 2, NULL),
(59, 5, 56, NULL, 5, 68, NULL, 2, NULL),
(60, 5, 57, NULL, 5, 58, NULL, 2, NULL),
(61, 5, 58, NULL, 5, 59, NULL, 2, NULL),
(62, 5, 59, NULL, 5, 60, NULL, 2, NULL),
(63, 5, 60, NULL, 5, 61, NULL, 2, NULL),
(64, 5, 61, NULL, 5, 34, NULL, 2, NULL),
(65, 5, 62, NULL, 5, 63, NULL, 2, NULL),
(66, 5, 63, NULL, 5, 64, NULL, 2, NULL),
(67, 4, 65, NULL, 4, 66, NULL, 2, NULL),
(68, 1, 67, NULL, 1, 4, NULL, 1, NULL),
(69, 5, 68, NULL, 5, 57, NULL, 2, NULL),
(70, 1, 7, NULL, 2, 7, NULL, 2, NULL),
(71, 2, 34, NULL, 5, 34, NULL, 4, NULL),
(72, 2, 49, NULL, 5, 49, NULL, 2, NULL),
(75, 1, 14, NULL, 2, 14, NULL, 2, NULL),
(76, 1, 14, NULL, 4, 14, NULL, 3, NULL),
(77, 2, 14, NULL, 4, 14, NULL, 5, NULL),
(78, 6, 73, NULL, 6, 74, NULL, 2, NULL),
(79, 6, 74, NULL, 6, 75, NULL, 2, NULL),
(80, 6, 75, NULL, 6, 76, NULL, 2, NULL),
(81, 6, 76, NULL, 6, 77, NULL, 2, NULL),
(82, 6, 77, NULL, 6, 78, NULL, 2, NULL),
(83, 6, 78, NULL, 6, 79, 49, 2, NULL),
(84, 6, 79, 49, 6, 80, NULL, 2, NULL),
(85, 6, 80, NULL, 6, 81, NULL, 2, NULL),
(86, 6, 81, NULL, 6, 82, NULL, 2, NULL),
(87, 6, 82, NULL, 6, 83, NULL, 2, NULL),
(88, 6, 83, NULL, 6, 84, NULL, 2, NULL),
(89, 6, 84, NULL, 6, 85, NULL, 2, NULL),
(90, 6, 85, NULL, 6, 86, NULL, 2, NULL),
(91, 6, 86, NULL, 6, 87, 15, 2, NULL),
(92, 6, 87, 15, 6, 88, NULL, 2, NULL),
(93, 6, 88, NULL, 6, 89, NULL, 2, NULL),
(94, 6, 89, NULL, 6, 90, 33, 2, NULL),
(95, 6, 90, 33, 6, 91, NULL, 2, NULL),
(96, 6, 91, NULL, 6, 92, NULL, 2, NULL),
(97, 6, 92, NULL, 6, 93, 1, 2, NULL),
(98, 6, 93, 1, 6, 94, NULL, 2, NULL),
(99, 6, 94, NULL, 6, 95, NULL, 2, NULL),
(100, 6, 95, NULL, 6, 96, NULL, 2, NULL),
(101, 6, 96, NULL, 6, 97, NULL, 2, NULL),
(102, 7, 98, NULL, 7, 99, NULL, 2, NULL),
(103, 7, 99, NULL, 7, 79, 48, 2, NULL),
(104, 7, 79, 48, 7, 101, NULL, 2, NULL),
(105, 7, 101, NULL, 7, 102, NULL, 2, NULL),
(106, 7, 102, NULL, 7, 103, NULL, 2, NULL),
(109, 7, 105, NULL, 7, 106, NULL, 2, NULL),
(110, 7, 106, NULL, 7, 107, NULL, 2, NULL),
(111, 7, 107, NULL, 7, 108, NULL, 2, NULL),
(112, 7, 108, NULL, 7, 109, NULL, 2, NULL),
(113, 7, 109, NULL, 7, 110, NULL, 2, NULL),
(114, 7, 110, NULL, 7, 111, 27, 2, NULL),
(115, 7, 111, 27, 7, 112, NULL, 2, NULL),
(116, 7, 112, NULL, 7, 113, 41, 2, NULL),
(117, 7, 113, 41, 7, 114, 44, 2, NULL),
(118, 7, 114, 44, 7, 115, NULL, 2, NULL),
(119, 7, 115, NULL, 7, 116, NULL, 2, NULL),
(120, 7, 116, NULL, 7, 117, NULL, 2, NULL),
(121, 7, 117, NULL, 7, 118, NULL, 2, NULL),
(122, 7, 118, NULL, 7, 119, NULL, 2, NULL),
(123, 7, 119, NULL, 7, 120, NULL, 2, NULL),
(124, 7, 120, NULL, 7, 121, NULL, 2, NULL),
(125, 7, 121, NULL, 7, 122, NULL, 2, NULL),
(126, 7, 122, NULL, 7, 93, 2, 2, NULL),
(127, 7, 103, NULL, 7, 105, NULL, 2, NULL),
(128, 6, 79, 49, 7, 79, 48, 2, NULL),
(129, 6, 93, 1, 7, 93, 2, 2, NULL),
(130, 8, 123, NULL, 8, 124, NULL, 2, NULL),
(131, 8, 124, NULL, 8, 125, NULL, 2, NULL),
(132, 8, 125, NULL, 8, 126, NULL, 2, NULL),
(133, 8, 126, NULL, 8, 127, NULL, 2, NULL),
(134, 8, 127, NULL, 8, 128, NULL, 2, NULL),
(135, 8, 128, NULL, 8, 129, NULL, 2, NULL),
(136, 8, 129, NULL, 8, 105, NULL, 2, NULL),
(137, 8, 105, NULL, 8, 130, NULL, 2, NULL),
(138, 8, 130, NULL, 8, 131, 4, 2, NULL),
(139, 8, 131, 4, 8, 132, NULL, 2, NULL),
(140, 8, 132, NULL, 8, 133, 53, 2, NULL),
(141, 8, 133, 53, 8, 134, NULL, 2, NULL),
(142, 8, 134, NULL, 8, 135, NULL, 2, NULL),
(143, 8, 135, NULL, 8, 136, NULL, 2, NULL),
(144, 8, 136, NULL, 8, 137, 17, 17, NULL),
(145, 8, 137, 17, 8, 138, NULL, 2, NULL),
(146, 8, 138, NULL, 8, 139, NULL, 2, NULL),
(147, 8, 139, NULL, 8, 140, 37, 2, NULL),
(148, 8, 140, 37, 8, 141, NULL, 2, NULL),
(149, 8, 141, NULL, 8, 142, NULL, 2, NULL),
(150, 8, 142, NULL, 8, 119, NULL, 2, NULL),
(151, 8, 119, NULL, 8, 143, NULL, 2, NULL),
(152, 8, 143, NULL, 8, 144, NULL, 2, NULL),
(153, 8, 144, NULL, 8, 145, NULL, 2, NULL),
(154, 7, 105, NULL, 8, 105, NULL, 2, NULL),
(155, 7, 119, NULL, 8, 119, NULL, 2, NULL),
(156, 7, 131, 3, 8, 131, 4, 2, 'corr'),
(157, 9, 148, NULL, 9, 149, NULL, 2, NULL),
(160, 9, 146, NULL, 9, 147, NULL, 2, NULL),
(161, 9, 147, NULL, 9, 148, NULL, 2, NULL),
(162, 9, 149, NULL, 9, 150, 6, 2, NULL),
(163, 9, 150, 6, 9, 151, 8, 2, NULL),
(164, 9, 151, 8, 9, 152, NULL, 2, NULL),
(165, 9, 152, NULL, 9, 153, 9, 2, NULL),
(166, 9, 153, 9, 9, 154, NULL, 2, NULL),
(167, 9, 154, NULL, 9, 155, NULL, 2, NULL),
(168, 9, 155, NULL, 9, 156, NULL, 2, NULL),
(169, 9, 156, NULL, 9, 157, 12, 2, NULL),
(170, 9, 157, 12, 9, 158, NULL, 2, NULL),
(171, 9, 158, NULL, 9, 159, NULL, 2, NULL),
(172, 9, 150, 5, 11, 150, 6, 2, 'corr'),
(173, 9, 151, 8, 11, 151, 7, 2, 'corr'),
(174, 17, 87, 13, 20, 87, 16, 2, 'corr'),
(175, 17, 87, 13, 6, 87, 15, 2, ''),
(176, 17, 87, 13, 12, 87, 14, 2, ''),
(177, 12, 87, 14, 6, 87, 15, 2, ''),
(178, 12, 87, 14, 20, 87, 16, 2, ''),
(179, 6, 87, 15, 20, 87, 16, 2, ''),
(180, 9, 159, NULL, 9, 87, 15, 2, NULL),
(181, 9, 87, 15, 17, 87, 13, 2, NULL),
(182, 9, 87, 15, 12, 87, 14, 2, NULL),
(183, 9, 87, 15, 6, 87, 15, 2, NULL),
(184, 9, 87, 15, 20, 87, 16, 2, NULL),
(185, 9, 87, 15, 9, 160, NULL, 2, NULL),
(186, 9, 160, NULL, 9, 161, NULL, 2, NULL),
(187, 8, 137, 17, 9, 137, 18, 2, 'corr'),
(188, 9, 161, NULL, 9, 137, 18, 2, NULL),
(189, 9, 162, 19, 15, 162, 19, 2, NULL),
(190, 9, 162, 19, 14, 162, 20, 2, 'corr'),
(191, 15, 162, 19, 14, 162, 20, 2, NULL),
(192, 9, 137, 18, 9, 162, 19, 2, NULL),
(193, 9, 162, 19, 9, 163, NULL, 2, NULL),
(195, 9, 163, NULL, 9, 164, 22, 2, NULL),
(196, 9, 164, 22, 12, 164, 21, 2, 'corr'),
(198, 12, 164, 21, 9, 164, 22, 2, NULL),
(199, 9, 164, 22, 9, 165, 24, 2, NULL),
(200, 11, 165, 23, 10, 165, 26, 2, 'corr'),
(201, 9, 165, 24, 9, 111, 28, 2, NULL),
(202, 7, 111, 27, 9, 111, 28, 2, 'corr'),
(203, 9, 111, 28, 9, 166, NULL, 2, NULL),
(204, 9, 166, NULL, 9, 167, NULL, 2, NULL),
(205, 9, 167, NULL, 9, 168, NULL, 2, NULL),
(206, 9, 168, NULL, 9, 169, NULL, 2, NULL),
(207, 12, 170, 29, 10, 170, 29, 2, ''),
(208, 11, 170, 29, 10, 170, 29, 2, ''),
(209, 11, 170, 29, 12, 170, 30, 2, 'corr'),
(210, 10, 170, 29, 10, 171, NULL, 2, ''),
(211, 10, 171, NULL, 10, 172, NULL, 2, ''),
(212, 10, 173, 31, 16, 173, 32, 2, 'corr'),
(213, 10, 172, NULL, 10, 173, 31, 2, NULL),
(214, 10, 173, 31, 10, 174, NULL, 2, NULL),
(215, 6, 90, 33, 10, 90, 34, 2, 'corr'),
(216, 10, 174, NULL, 10, 90, 33, 2, NULL),
(217, 10, 90, 33, 10, 175, NULL, 2, NULL),
(218, 10, 175, NULL, 10, 176, NULL, 2, NULL),
(219, 10, 177, 35, 15, 177, 36, 2, 'corr'),
(220, 10, 176, NULL, 10, 177, 35, 2, NULL),
(221, 8, 140, 37, 17, 140, 40, 2, 'corr'),
(222, 10, 177, 35, 10, 140, 38, 2, NULL),
(223, 8, 140, 37, 10, 140, 38, 2, NULL),
(224, 10, 140, 38, 10, 178, NULL, 2, NULL),
(225, 10, 178, NULL, 10, 164, 21, 2, NULL),
(226, 10, 164, 21, 9, 164, 22, 2, NULL),
(227, 10, 164, 21, 10, 165, 26, 2, NULL),
(228, 10, 165, 26, 9, 165, 23, 2, NULL),
(229, 7, 113, 41, 12, 113, 42, 2, 'corr'),
(230, 10, 165, 26, 10, 113, 42, 2, NULL),
(231, 7, 114, 44, 13, 114, 43, 2, 'corr'),
(232, 10, 113, 42, 10, 114, 44, 2, NULL),
(233, 10, 114, 44, 10, 179, NULL, 2, NULL),
(234, 10, 179, NULL, 10, 180, NULL, 2, ''),
(235, 10, 180, NULL, 10, 181, NULL, 2, ''),
(236, 10, 181, NULL, 10, 182, NULL, 2, ''),
(237, 10, 182, NULL, 10, 183, NULL, 2, ''),
(238, 10, 183, NULL, 10, 184, NULL, 2, ''),
(239, 10, 184, NULL, 10, 185, NULL, 2, ''),
(240, 7, 113, 41, 10, 113, 42, 2, NULL),
(241, 7, 114, 44, 10, 114, 44, 2, NULL),
(242, 11, 93, 45, 7, 93, 2, 2, 'corr'),
(243, 6, 93, 1, 11, 93, 45, 2, NULL),
(244, 11, 93, 45, 11, 186, NULL, 2, NULL),
(245, 11, 186, NULL, 11, 187, NULL, 2, NULL),
(246, 11, 187, NULL, 11, 188, NULL, 2, NULL),
(247, 11, 188, NULL, 11, 189, NULL, 2, NULL),
(248, 11, 189, NULL, 11, 190, NULL, 2, NULL),
(249, 11, 190, NULL, 11, 191, NULL, 2, NULL),
(250, 11, 191, NULL, 11, 192, NULL, 2, NULL),
(251, 11, 192, NULL, 11, 193, NULL, 2, NULL),
(252, 11, 193, NULL, 11, 170, 29, 2, NULL),
(253, 11, 170, 29, 11, 194, NULL, 2, NULL),
(254, 11, 194, NULL, 11, 195, NULL, 2, NULL),
(255, 11, 195, NULL, 11, 196, NULL, 2, NULL),
(258, 11, 196, NULL, 11, 150, 6, 2, NULL),
(259, 11, 150, 6, 11, 151, 7, 2, NULL),
(260, 11, 151, 7, 11, 197, NULL, 2, NULL),
(261, 9, 153, 9, 11, 153, 10, 2, 'corr'),
(262, 11, 197, NULL, 11, 153, 10, 2, NULL),
(263, 11, 153, 10, 11, 198, NULL, 2, NULL),
(264, 11, 198, NULL, 11, 199, NULL, 2, NULL),
(265, 11, 199, NULL, 11, 200, NULL, 2, NULL),
(266, 16, 201, 46, 11, 201, 47, 2, 'corr'),
(267, 11, 200, NULL, 11, 201, 47, 2, NULL),
(268, 11, 201, 47, 11, 202, NULL, 2, ''),
(269, 11, 202, NULL, 11, 203, NULL, 2, ''),
(270, 11, 203, NULL, 11, 204, NULL, 2, ''),
(271, 11, 204, NULL, 11, 205, NULL, 2, ''),
(272, 11, 205, NULL, 11, 206, NULL, 2, ''),
(273, 11, 206, NULL, 11, 207, NULL, 2, ''),
(274, 11, 207, NULL, 11, 79, 50, 2, NULL),
(276, 11, 79, 50, 6, 79, 49, 2, NULL),
(277, 7, 79, 48, 11, 79, 50, 2, 'corr'),
(279, 12, 208, NULL, 12, 209, NULL, 2, NULL),
(280, 12, 209, NULL, 12, 210, NULL, 2, NULL),
(281, 12, 210, NULL, 12, 211, NULL, 2, NULL),
(282, 12, 211, NULL, 12, 212, NULL, 2, NULL),
(283, 12, 212, NULL, 12, 213, NULL, 2, NULL),
(284, 12, 214, NULL, 12, 215, NULL, 2, NULL),
(285, 12, 215, NULL, 12, 216, NULL, 2, NULL),
(286, 12, 216, NULL, 12, 217, NULL, 2, NULL),
(287, 12, 217, NULL, 12, 213, NULL, 2, NULL),
(288, 12, 213, NULL, 12, 218, NULL, 2, NULL),
(289, 12, 218, NULL, 12, 170, 30, 2, NULL),
(290, 12, 170, 30, 12, 219, NULL, 2, NULL),
(291, 12, 219, NULL, 12, 220, NULL, 2, NULL),
(292, 12, 220, NULL, 12, 221, NULL, 2, NULL),
(293, 12, 221, NULL, 12, 222, 51, 2, NULL),
(294, 12, 222, 51, 12, 223, NULL, 2, NULL),
(295, 12, 223, NULL, 12, 224, NULL, 2, NULL),
(296, 12, 222, 51, 16, 222, 52, 2, 'corr'),
(298, 12, 224, NULL, 12, 87, 14, 2, NULL),
(299, 12, 87, 14, 12, 225, NULL, 2, NULL),
(300, 12, 225, NULL, 12, 85, NULL, 2, NULL),
(301, 6, 85, NULL, 12, 85, NULL, 2, NULL),
(302, 12, 85, NULL, 12, 226, NULL, 2, NULL),
(303, 8, 133, 53, 14, 133, 54, 2, 'corr'),
(304, 8, 133, 53, 12, 133, 53, 2, NULL),
(305, 12, 133, 53, 14, 133, 54, 2, 'corr'),
(306, 12, 226, NULL, 12, 133, 53, 2, NULL),
(307, 12, 133, 53, 12, 227, NULL, 2, NULL),
(308, 12, 227, NULL, 12, 228, NULL, 2, NULL),
(309, 12, 228, NULL, 12, 229, NULL, 2, NULL),
(310, 12, 229, NULL, 12, 230, NULL, 2, NULL),
(311, 12, 230, NULL, 12, 164, 21, 2, NULL),
(312, 12, 232, 56, 13, 232, 55, 2, 'corr'),
(313, 12, 164, 21, 12, 231, NULL, 2, NULL),
(314, 12, 231, NULL, 12, 232, 56, 2, NULL),
(315, 12, 113, 42, 10, 113, 42, 2, NULL),
(316, 12, 232, 56, 12, 113, 42, 2, NULL),
(317, 12, 113, 42, 12, 233, NULL, 2, NULL),
(318, 12, 233, NULL, 12, 234, NULL, 2, NULL),
(319, 12, 234, NULL, 12, 235, NULL, 2, NULL),
(320, 12, 235, NULL, 12, 236, NULL, 2, NULL),
(321, 12, 236, NULL, 12, 237, NULL, 2, NULL),
(322, 12, 237, NULL, 12, 238, NULL, 2, NULL),
(323, 12, 238, NULL, 12, 239, NULL, 2, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `links_steps`
--

DROP TABLE IF EXISTS `links_steps`;
CREATE TABLE IF NOT EXISTS `links_steps` (
  `step_type` varchar(10) NOT NULL DEFAULT 'angle',
  `link_id` int(11) NOT NULL,
  `step_order` int(11) NOT NULL DEFAULT '0',
  `step_posx` int(11) NOT NULL,
  `step_posy` int(11) NOT NULL,
  UNIQUE KEY `link_id_2` (`link_id`,`step_order`),
  KEY `link_id` (`link_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `links_steps`
--

INSERT INTO `links_steps` (`step_type`, `link_id`, `step_order`, `step_posx`, `step_posy`) VALUES
('angle', 7, 0, 459, 1001),
('angle', 8, 0, 459, 1061),
('angle', 16, 0, 701, 819),
('angle', 17, 0, 754, 789),
('arc', 88, 1, 477, 707),
('arc', 94, 0, 818, 760),
('arc', 94, 4, 858, 760),
('arc', 95, 1, 907, 807),
('arc', 95, 4, 907, 848),
('arc', 96, 1, 947, 889),
('arc', 97, 1, 1047, 789),
('arc', 98, 1, 1076, 818),
('arc', 99, 1, 1140, 818),
('arc', 103, 1, 274, 622),
('arc', 110, 1, 497, 399),
('arc', 116, 1, 911, 399),
('arc', 118, 1, 952, 441),
('arc', 120, 1, 952, 532),
('arc', 122, 1, 1049, 629),
('arc', 125, 1, 1049, 760),
('arc', 138, 0, 522, 507),
('arc', 139, 0, 522, 548),
('arc', 142, 0, 619, 645),
('arc', 145, 0, 821, 645),
('arc', 147, 0, 880, 586),
('arc', 148, 0, 948, 586),
('arc', 149, 0, 1001, 639),
('arc', 157, 0, 684, 1055),
('arc', 163, 0, 684, 979),
('arc', 164, 0, 652, 947),
('arc', 165, 0, 594, 947),
('arc', 168, 0, 594, 821),
('arc', 170, 0, 674, 821),
('arc', 171, 0, 674, 768),
('arc', 180, 0, 713, 729),
('arc', 188, 0, 713, 652),
('arc', 192, 0, 790, 652),
('arc', 193, 0, 790, 530),
('arc', 199, 0, 837, 436),
('arc', 201, 0, 807, 406),
('arc', 203, 0, 736, 406),
('arc', 205, 0, 736, 325),
('arc', 210, 0, 822, 1014),
('arc', 211, 0, 870, 966),
('arc', 217, 0, 870, 753),
('arc', 220, 0, 956, 667),
('arc', 224, 0, 857, 568),
('arc', 225, 0, 857, 525),
('arc', 225, 5, 843, 510),
('arc', 230, 0, 844, 406),
('arc', 230, 1, 908, 406),
('arc', 232, 0, 940, 438),
('arc', 234, 0, 998, 381),
('arc', 237, 0, 1122, 381),
('arc', 244, 0, 1107, 858),
('arc', 250, 0, 931, 1034),
('arc', 255, 0, 730, 1034),
('arc', 260, 0, 649, 954),
('arc', 264, 0, 487, 954),
('arc', 267, 0, 416, 883),
('arc', 268, 0, 361, 883),
('arc', 271, 0, 250, 773),
('arc', 272, 0, 250, 655),
('arc', 274, 0, 332, 573),
('arc', 280, 0, 954, 1111),
('arc', 283, 0, 834, 1111),
('arc', 290, 0, 815, 1014),
('arc', 291, 0, 766, 966),
('arc', 293, 0, 766, 892),
('arc', 294, 0, 816, 892),
('arc', 294, 1, 816, 800),
('arc', 298, 0, 730, 714),
('arc', 300, 0, 571, 714),
('arc', 301, 0, 571, 714),
('arc', 306, 0, 571, 604),
('arc', 310, 0, 691, 481),
('arc', 313, 0, 864, 481),
('arc', 316, 0, 916, 429),
('arc', 317, 0, 916, 390),
('arc', 322, 0, 1055, 250);

-- --------------------------------------------------------

--
-- Structure de la table `metrolines`
--

DROP TABLE IF EXISTS `metrolines`;
CREATE TABLE IF NOT EXISTS `metrolines` (
  `line_id` int(11) NOT NULL AUTO_INCREMENT,
  `network_tag` varchar(5) NOT NULL,
  `line_type` varchar(5) DEFAULT NULL,
  `line_name` varchar(25) NOT NULL,
  `line_hex` varchar(7) NOT NULL,
  PRIMARY KEY (`line_id`),
  KEY `network_id` (`network_tag`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

--
-- Contenu de la table `metrolines`
--

INSERT INTO `metrolines` (`line_id`, `network_tag`, `line_type`, `line_name`, `line_hex`) VALUES
(0, 'MTL', NULL, 'WALK', '#FFFFFF'),
(1, 'MTL', NULL, 'GREEN', '#00A651'),
(2, 'MTL', NULL, 'ORANGE', '#F58221'),
(4, 'MTL', NULL, 'YELLOW', '#FFDD00'),
(5, 'MTL', NULL, 'BLUE', '#0071BB'),
(6, 'PRS', 'MTR', '1', '#FFCE00'),
(7, 'PRS', 'MTR', '2', '#0064b0'),
(8, 'PRS', 'MTR', '3', '#9f9825'),
(9, 'PRS', 'MTR', '4', '#c04191'),
(10, 'PRS', 'MTR', '5', '#f28e42'),
(11, 'PRS', 'MTR', '6', '#83c491'),
(12, 'PRS', 'MTR', '7', '#f3a4ba'),
(13, 'PRS', 'MTR', '7bis', '#83c491'),
(14, 'PRS', 'MTR', '8', '#ceadd2'),
(15, 'PRS', 'MTR', '9', '#d5c900'),
(16, 'PRS', 'MTR', '10', '#e3b32a'),
(17, 'PRS', 'MTR', '11', '#8d5e2a'),
(18, 'PRS', 'MTR', '12', '#00814f'),
(19, 'PRS', 'MTR', '13', '#98d4e2'),
(20, 'PRS', 'MTR', '14', '#662483');

-- --------------------------------------------------------

--
-- Structure de la table `networks`
--

DROP TABLE IF EXISTS `networks`;
CREATE TABLE IF NOT EXISTS `networks` (
  `network_tag` varchar(5) NOT NULL,
  `network_name` varchar(50) NOT NULL,
  `network_longname` varchar(150) NOT NULL,
  PRIMARY KEY (`network_tag`),
  UNIQUE KEY `network_tag` (`network_tag`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `networks`
--

INSERT INTO `networks` (`network_tag`, `network_name`, `network_longname`) VALUES
('MTL', 'Métro', 'Métro de Montréal'),
('PRS', 'Métropolitain', 'Métro de Paris');

-- --------------------------------------------------------

--
-- Structure de la table `platforms`
--

DROP TABLE IF EXISTS `platforms`;
CREATE TABLE IF NOT EXISTS `platforms` (
  `platform_id` int(11) NOT NULL AUTO_INCREMENT,
  `station_id` int(11) NOT NULL,
  `platform_posx` varchar(11) NOT NULL,
  `platform_posy` float NOT NULL,
  `platform_type` text,
  `display_pos` varchar(15) NOT NULL,
  PRIMARY KEY (`platform_id`)
) ENGINE=MyISAM AUTO_INCREMENT=57 DEFAULT CHARSET=latin1;

--
-- Contenu de la table `platforms`
--

INSERT INTO `platforms` (`platform_id`, `station_id`, `platform_posx`, `platform_posy`, `platform_type`, `display_pos`) VALUES
(1, 93, '1065', 807, NULL, ''),
(2, 93, '1080', 792, NULL, 'topright'),
(3, 131, '515', 525, NULL, 'left'),
(4, 131, '522', 525, NULL, 'left'),
(5, 150, '692', 996, NULL, 'topright'),
(6, 150, '684', 989, NULL, 'bottomleft'),
(7, 151, '663', 968, NULL, 'bottomleft'),
(8, 151, '668', 963, NULL, 'topright'),
(9, 153, '594', 940, NULL, 'topleft'),
(10, 153, '581', 954, NULL, 'topleft'),
(11, 157, '664', 828, NULL, 'bottom'),
(12, 157, '664', 821, NULL, 'top'),
(13, 87, '713', 721, '', 'bottomleft'),
(14, 87, '713', 714, '', 'bottomleft'),
(15, 87, '713', 707, '', 'bottomleft'),
(16, 87, '713', 701, '', 'bottomleft'),
(17, 137, '760', 645, NULL, 'top'),
(18, 137, '760', 652, NULL, ''),
(19, 162, '790', 572, '', 'top'),
(20, 162, '790', 578, '', 'bottomright'),
(21, 164, '843', 481, NULL, 'right'),
(22, 164, '837', 481, NULL, ''),
(23, 165, '821', 429, NULL, 'bottomleft'),
(24, 165, '829', 429, NULL, ''),
(25, 165, '838', 429, NULL, ''),
(26, 165, '843', 429, NULL, ''),
(27, 111, '773', 399, NULL, 'top'),
(28, 111, '773', 406, NULL, 'bottom'),
(29, 170, '822', 1034, NULL, 'bottomright'),
(30, 170, '815', 1034, NULL, 'bottomleft'),
(31, 173, '870', 922, NULL, 'topright'),
(32, 173, '865', 928, NULL, 'bottomleft'),
(33, 90, '870', 772, NULL, 'bottomleft'),
(34, 90, '870', 763, NULL, 'topright'),
(35, 177, '908', 619, NULL, 'topright'),
(36, 177, '903', 624, NULL, 'bottomleft'),
(37, 140, '890', 586, NULL, 'bottomright'),
(38, 140, '882.5', 593.5, NULL, 'bottomright'),
(39, 140, '877', 598, NULL, 'bottomright'),
(40, 140, '873', 603, NULL, 'bottomright'),
(41, 113, '916', 404, NULL, 'topright'),
(42, 113, '916', 414, NULL, 'bottomleft'),
(43, 114, '950', 429, NULL, 'right'),
(44, 114, '945', 433, NULL, 'bottomleft'),
(45, 93, '1060', 812, NULL, 'topleft'),
(46, 201, '371', 877, NULL, 'topleft'),
(47, 201, '371', 883, NULL, 'bottomleft'),
(48, 79, '338', 558, NULL, 'topright'),
(49, 79, '332', 563, NULL, ''),
(50, 79, '328', 568, NULL, 'topleft'),
(51, 222, '793', 892, NULL, 'bottom'),
(52, 222, '793', 885, NULL, 'top'),
(53, 133, '574', 601, NULL, 'topright'),
(54, 133, '569', 596, NULL, 'topleft'),
(55, 232, '911', 443, NULL, 'topleft'),
(56, 232, '906', 439, NULL, 'topleft');

-- --------------------------------------------------------

--
-- Structure de la table `stations`
--

DROP TABLE IF EXISTS `stations`;
CREATE TABLE IF NOT EXISTS `stations` (
  `station_id` int(11) NOT NULL AUTO_INCREMENT,
  `station_name` varchar(50) NOT NULL,
  `station_posx` int(11) NOT NULL DEFAULT '0',
  `station_posy` int(11) NOT NULL DEFAULT '0',
  `line_id` int(11) NOT NULL,
  `display_pos` varchar(15) NOT NULL,
  `display_cut` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`station_id`),
  KEY `line_id` (`line_id`)
) ENGINE=InnoDB AUTO_INCREMENT=240 DEFAULT CHARSET=latin1;

--
-- Contenu de la table `stations`
--

INSERT INTO `stations` (`station_id`, `station_name`, `station_posx`, `station_posy`, `line_id`, `display_pos`, `display_cut`) VALUES
(1, 'Angrignon', 398, 1182, 1, 'bottom', '0'),
(2, 'Monk', 428, 1152, 1, 'topleft', '0'),
(3, 'Jolicoeur', 459, 1124, 1, 'topleft', '0'),
(4, 'De L''Église', 519, 1122, 1, 'bottomright', '0'),
(5, 'Lasalle', 549, 1092, 1, 'right', '0'),
(6, 'Charlevoix', 520, 1062, 1, 'right', '0'),
(7, 'Lionel-Groulx', 489, 1031, 2, 'right', '0'),
(8, 'Atwater', 489, 971, 1, 'left', '0'),
(9, 'Guy-Concordia', 520, 940, 1, 'left', '0'),
(10, 'Peel', 550, 910, 1, 'left', '0'),
(11, 'McGill', 580, 879, 1, 'left', '0'),
(12, 'Place-des-Arts', 610, 849, 1, 'left', '0'),
(13, 'Saint-Laurent', 641, 819, 1, 'left', '0'),
(14, 'Berri-UQAM', 671, 789, 4, 'left', '0'),
(15, 'Beaudry', 710, 749, 1, 'right', '0'),
(16, 'Papineau', 737, 723, 1, 'right', '0'),
(17, 'Frontenac', 760, 697, 1, 'right', '0'),
(18, 'Préfontaine', 734, 667, 1, 'right', '0'),
(19, 'Joliette', 762, 637, 1, 'right', '0'),
(20, 'Pie-IX', 792, 607, 1, 'right', '0'),
(21, 'Viau', 821, 576, 1, 'right', '0'),
(22, 'Assomption', 794, 546, 1, 'right', '0'),
(23, 'Cadillac', 822, 516, 1, 'right', '0'),
(24, 'Langelier', 853, 485, 1, 'right', '0'),
(25, 'Radisson', 883, 455, 1, 'right', '0'),
(26, 'Honoré-Beaugrand', 914, 425, 1, 'top', '0'),
(27, 'Montmorency', 128, 425, 2, 'top', '0'),
(28, 'De la Concorde', 216, 425, 2, 'topright', '0'),
(29, 'Cartier', 307, 425, 2, 'right', '0'),
(30, 'Henri-Bourassa', 368, 485, 2, 'topright', '0'),
(31, 'Sauvé', 398, 516, 2, 'topright', '0'),
(32, 'Crémazie', 428, 546, 2, 'topright', '0'),
(33, 'Jarry', 459, 576, 2, 'topright', '0'),
(34, 'Jean-Talon', 489, 607, 5, 'left', '0'),
(35, 'Beaubien', 519, 637, 2, 'topright', '0'),
(36, 'Rosemont', 547, 665, 2, 'topright', '0'),
(37, 'Laurier', 575, 692, 2, 'topright', '0'),
(38, 'Mont-Royal', 603, 720, 2, 'topright', '0'),
(39, 'Sherbrooke', 630, 748, 2, 'topright', '0'),
(40, 'Champ-de-Mars', 671, 849, 2, 'right', '0'),
(41, 'Place-D''armes', 641, 880, 2, 'right', '0'),
(42, 'Square-Victoria-OACI', 610, 910, 2, 'right', '0'),
(43, 'Bonaventure', 580, 940, 2, 'right', '0'),
(44, 'Lucien-L''allier', 550, 971, 2, 'right', '0'),
(45, 'Georges-Vanier', 519, 1001, 2, 'right', '0'),
(46, 'Place-Saint-Henri', 429, 1031, 2, 'bottomleft', '0'),
(47, 'Vendôme', 398, 1001, 2, 'bottomleft', '0'),
(48, 'Villa-Maria', 368, 970, 2, 'bottomleft', '0'),
(49, 'Snowdon', 337, 940, 5, 'bottomleft', '0'),
(50, 'Côte-Sainte-Catherine', 307, 910, 2, 'bottomleft', '0'),
(51, 'Plamondon', 277, 879, 2, 'bottomleft', '0'),
(52, 'Namur', 246, 849, 2, 'bottomleft', '0'),
(53, 'De la Savane', 216, 819, 2, 'bottomleft', '0'),
(54, 'Du Collège', 186, 788, 2, 'bottomleft', '0'),
(55, 'Côte-Vertu', 156, 758, 2, 'top', '0'),
(56, 'Côte-des-Neiges', 368, 910, 5, 'bottomright', '0'),
(57, 'Édouard-Montpetit', 428, 849, 5, 'left', '0'),
(58, 'Outremont', 428, 789, 5, 'left', '0'),
(59, 'Acadie', 428, 728, 5, 'left', '0'),
(60, 'Parc', 428, 668, 5, 'left', '0'),
(61, 'De Castelnau', 459, 637, 5, 'left', '0'),
(62, 'Fabre', 519, 576, 5, 'bottomright', '0'),
(63, 'D''Iberville', 550, 546, 5, 'bottomright', '0'),
(64, 'Saint-Michel', 580, 515, 5, 'top', '0'),
(65, 'Jean-Drapeau', 774, 809, 4, 'topright', '0'),
(66, 'Longueuil-Université-de-Sherbrooke', 849, 809, 4, 'right', '10, 25'),
(67, 'Verdun', 489, 1151, 1, 'bottomright', '0'),
(68, 'Université-de-Montréal', 398, 879, 5, 'left', '12'),
(73, 'La Défense', 154, 385, 6, 'right', '0'),
(74, 'Esplanade de La Défense', 182, 413, 6, 'bottomleft', '9'),
(75, 'Pont de Neuilly', 207, 438, 6, 'bottomleft', '0'),
(76, 'Les Sablons', 232, 463, 6, 'bottomleft', '0'),
(77, 'Porte Maillot', 261, 491, 6, 'bottomleft', '0'),
(78, 'Argentine', 301, 532, 6, 'bottomleft', '0'),
(79, 'Charles de Gaulle Étoile', 338, 558, 6, 'topright', '8,18'),
(80, 'George V', 371, 602, 6, 'bottomleft', '0'),
(81, 'Franklin D. Roosevelt', 409, 639, 6, 'left', '9'),
(82, 'Champs Élysées Clemenceau', 436, 666, 6, 'bottomleft', '6,16'),
(83, 'Concorde', 459, 690, 6, 'right', '0'),
(84, 'Tuileries', 517, 707, 6, 'bottom', '0'),
(85, 'Palais Royal Musée du Louvre', 571, 707, 6, 'topleft', '13,22'),
(86, 'Louvre Rivoli', 615, 707, 6, 'top', '6'),
(87, 'Châtelet', 713, 721, 6, 'left', '0'),
(88, 'Hôtel de Ville', 767, 707, 6, 'right', '0'),
(89, 'St-Paul', 812, 753, 6, 'topright', '0'),
(90, 'Bastille', 870, 763, 6, 'topright', '0'),
(91, 'Gare de Lyon', 935, 876, 6, 'bottomright', '5'),
(92, 'Reuilly-Diderot', 989, 846, 6, 'right', '0'),
(93, 'Nation', 1060, 812, 6, 'bottomleft', '0'),
(94, 'Porte de Vincennes', 1123, 818, 6, 'bottom', '9'),
(95, 'St-Mandé', 1163, 841, 6, 'right', '0'),
(96, 'Bérault', 1192, 870, 6, 'left', '0'),
(97, 'Château de Vincennes', 1203, 881, 6, 'bottomright', '8'),
(98, 'Porte Dauphine', 221, 569, 7, 'topright', '6'),
(99, 'Victor Hugo', 267, 615, 7, 'bottomleft', '0'),
(101, 'Ternes', 367, 529, 7, 'topleft', '0'),
(102, 'Courcelles', 396, 500, 7, 'topleft', '0'),
(103, 'Monceau', 425, 470, 7, 'topleft', '0'),
(105, 'Villiers', 455, 441, 7, 'right', '0'),
(106, 'Rome', 487, 408, 7, 'bottomright', '0'),
(107, 'Place de Clichy', 528, 399, 7, 'bottomright', '6'),
(108, 'Blanche', 594, 399, 7, 'top', '0'),
(109, 'Pigalle', 661, 399, 7, 'bottomleft', '0'),
(110, 'Anvers', 712, 399, 7, 'bottom', '0'),
(111, 'Barbès Rochechouart', 773, 399, 7, 'top', '7'),
(112, 'La Chapelle', 839, 399, 7, 'topright', '0'),
(113, 'Stalingrad', 916, 404, 7, 'topright', '0'),
(114, 'Jaurès', 950, 429, 7, 'topright', '0'),
(115, 'Colonel Fabien', 952, 478, 7, 'right', '8'),
(116, 'Belleville', 952, 523, 7, 'left', '0'),
(117, 'Couronnes', 981, 561, 7, 'topright', '0'),
(118, 'Ménilmontant', 1016, 596, 7, 'topright', '0'),
(119, 'Père Lachaise', 1049, 639, 7, 'topright', '5'),
(120, 'Philippe Auguste', 1049, 674, 7, 'right', '9'),
(121, 'Alexandre Dumas', 1049, 719, 7, 'topleft', '10'),
(122, 'Avron', 1053, 764, 7, 'right', '0'),
(123, 'Pont de Levallois Bécon', 330, 316, 8, 'topleft', '17'),
(124, 'Anatole France', 346, 332, 8, 'bottomleft', '0'),
(125, 'Louise Michel', 362, 348, 8, 'bottomleft', '0'),
(126, 'Porte de Champerret', 378, 364, 8, 'bottomleft', '0'),
(127, 'Pereire', 401, 387, 8, 'topright', '0'),
(128, 'Wagram', 417, 403, 8, 'bottomleft', '0'),
(129, 'Malesherbes', 436, 422, 8, 'bottomleft', '0'),
(130, 'Europe', 488, 475, 8, 'bottomleft', '0'),
(131, 'Saint-Lazare', 515, 525, 8, 'left', '0'),
(132, 'Havre Caumartin', 545, 572, 8, 'left', '6'),
(133, 'Opéra', 574, 601, 8, 'right', '0'),
(134, 'Quatre Septembre', 603, 629, 8, 'topright', '0'),
(135, 'Bourse', 649, 645, 8, 'top', '0'),
(136, 'Sentier', 697, 645, 8, 'top', '0'),
(137, 'Réaumur Sébastopol', 760, 645, 8, 'top', '8'),
(138, 'Arts et Métiers', 833, 633, 8, 'topleft', '8'),
(139, 'Temple', 857, 609, 8, 'topleft', '0'),
(140, 'République', 890, 586, 8, 'bottomright', '0'),
(141, 'Parmentier', 984, 621, 8, 'bottomleft', '0'),
(142, 'Rue Saint-Maur', 1011, 639, 8, 'bottom', '4'),
(143, 'Gambetta', 1103, 639, 8, 'bottom', '0'),
(144, 'Porte de Bagnolet', 1159, 639, 8, 'bottomright', '6'),
(145, 'Gallieni', 1199, 639, 8, 'right', '0'),
(146, 'Mairie Montrouge', 645, 1128, 9, 'bottomleft', '7'),
(147, 'Porte d''Orléans', 645, 1094, 9, 'left', '6'),
(148, 'Alésia', 663, 1076, 9, 'topleft', '0'),
(149, 'Mouton Duvernet', 684, 1031, 9, 'left', '7'),
(150, 'Denfert Rochereau', 692, 996, 9, 'topright', '8'),
(151, 'Raspail', 663, 968, 9, 'bottomleft', '0'),
(152, 'Vavin', 633, 947, 9, 'top', '0'),
(153, 'Montparnasse Bienvenüe', 594, 940, 9, 'topleft', '13'),
(154, 'St-Placide', 594, 900, 9, 'left', '0'),
(155, 'Saint-Sulpice', 594, 857, 9, 'right', '0'),
(156, 'Saint Germain des-Prés', 609, 821, 9, 'topleft', '5,13'),
(157, 'Odéon', 664, 828, 9, '', '0'),
(158, 'Saint-Michel', 674, 799, 9, 'left', '0'),
(159, 'Cité', 692, 750, 9, 'topleft', '0'),
(160, 'Les halles', 713, 684, 9, 'left', '0'),
(161, 'Étienne Marcel', 713, 659, 9, 'left', '8'),
(162, 'Strasbourg Saint-Denis', 790, 572, 9, 'topright', '11'),
(163, 'Château d''Eau', 804, 516, 9, 'bottomright', '8'),
(164, 'Gare de l''Est', 843, 481, 9, 'bottomright', '5'),
(165, 'Gare du Nord', 821, 429, 9, 'left', '0'),
(166, 'Château Rouge', 736, 364, 9, 'right', '8'),
(167, 'Marcadet Poissonniers', 736, 337, 9, 'topright', '9'),
(168, 'Simplon', 717, 306, 9, 'right', '0'),
(169, 'Porte de Clignancourt', 697, 286, 9, 'left', '5'),
(170, 'Place d''Italie', 822, 1034, 10, 'topright', '6'),
(171, 'Campo Formio', 849, 986, 10, 'bottomright', '6'),
(172, 'Saint Marcel', 870, 959, 10, 'bottomright', '6'),
(173, 'Gare d''Austerlitz', 870, 922, 10, 'topright', '5'),
(174, 'Quai de la Rapée', 870, 860, 10, 'bottomleft', '8'),
(175, 'Bréguet Sabin', 899, 724, 10, 'bottomright', '8'),
(176, 'Richard Lenoir', 927, 696, 10, 'bottomright', '8'),
(177, 'Oberkampf', 908, 619, 10, 'topright', '0'),
(178, 'Jacques Bonsergeant', 857, 543, 10, 'right', '8'),
(179, 'Laumière', 975, 403, 10, 'bottomright', '0'),
(180, 'Ourcq', 1012, 381, 10, 'bottom', '0'),
(181, 'Porte de Pantin', 1060, 381, 10, 'bottom', '6'),
(182, 'Hoche', 1108, 381, 10, 'bottom', '0'),
(183, 'Église de Pantin', 1141, 361, 10, 'topleft', '0'),
(184, 'Raymond Queneau', 1164, 338, 10, 'topleft', '0'),
(185, 'Bobigny Pablo Picasso', 1199, 303, 10, 'topright', '8'),
(186, 'Picpus', 1103, 862, 11, 'left', '0'),
(187, 'Bel-Air', 1079, 886, 11, 'bottomright', '0'),
(188, 'Daumesnil', 1054, 911, 11, 'left', '0'),
(189, 'Dugommier', 1022, 942, 11, 'bottomright', '0'),
(190, 'Bercy', 995, 970, 11, 'left', '0'),
(191, 'Quai de la Gare', 950, 1015, 11, 'topleft', '5'),
(192, 'Chevaleret', 907, 1034, 11, 'top', '0'),
(193, 'Nationale', 865, 1034, 11, 'bottom', '0'),
(194, 'Corvisart', 787, 1034, 11, 'top', '0'),
(195, 'Glacière', 746, 1034, 11, 'bottom', '0'),
(196, 'Saint-Jacques', 712, 1017, 11, 'topright', '0'),
(197, 'Edgar Quinet', 609, 954, 11, 'bottom', '6'),
(198, 'Pasteur', 515, 954, 11, 'bottomright', '0'),
(199, 'Sèvre Levourbe', 467, 934, 11, 'bottomleft', '7'),
(200, 'Cambronne', 433, 900, 11, 'bottomleft', '0'),
(201, 'La Motte Picquet Grenelle', 371, 877, 11, 'topright', '9,17'),
(202, 'Dupleix', 325, 847, 11, 'topright', '0'),
(203, 'Bir-Hakeim', 292, 815, 11, 'right', '0'),
(204, 'Passy', 254, 777, 11, 'topright', '0'),
(205, 'Trocadéro', 250, 707, 11, 'bottomright', '0'),
(206, 'Boissière', 254, 651, 11, 'bottomright', '0'),
(207, 'Kléber', 294, 611, 11, 'bottomright', '0'),
(208, 'Mairie d''Ivry', 988, 1148, 12, 'bottomleft', '0'),
(209, 'Pierre et Marie Curie', 968, 1126, 12, 'bottomleft', '15'),
(210, 'Porte d''Ivry', 939, 1111, 12, 'top', '6'),
(211, 'Porte de Choisy', 896, 1111, 12, 'top', '6'),
(212, 'Porte d''Italie', 852, 1111, 12, 'top', '6'),
(213, 'Maison Blanche', 815, 1088, 12, 'left', '7'),
(214, 'Villejuif - Louis Aragon', 815, 1207, 12, 'right', '0'),
(215, 'Villejuif Paul Vaillant-Couturier', 815, 1178, 12, 'bottomright', '10'),
(216, 'Villejuif Léo Lagrange', 815, 1150, 12, 'bottomright', '10'),
(217, 'Le Kremlin Bicêtre', 815, 1121, 12, 'bottomright', '10'),
(218, 'Tolbiac', 815, 1062, 12, 'left', '10'),
(219, 'Les Gobelins', 792, 991, 12, 'topright', '4'),
(220, 'Censier Daubenton', 766, 957, 12, 'right', '8'),
(221, 'Place Monge', 766, 920, 12, 'right', '6'),
(222, 'Jussieu', 793, 892, 12, 'bottom', '0'),
(223, 'Sully Morland', 810, 795, 12, 'left', '6'),
(224, 'Pont Marie', 773, 757, 12, 'left', '0'),
(225, 'Pont Neuf', 652, 714, 12, 'bottomleft', '0'),
(226, 'Pyramides', 571, 651, 12, 'bottomleft', '0'),
(227, 'Chaussée d''Antin La Fayette', 603, 572, 12, 'topleft', '9,17'),
(228, 'Le Peletier', 660, 513, 12, 'bottomright', '0'),
(229, 'Cadet', 682, 490, 12, 'bottomright', '0'),
(230, 'Poissonnière', 747, 481, 12, 'bottom', '0'),
(231, 'Château Landon', 883, 462, 12, 'bottomright', '8'),
(232, 'Louis Blanc', 911, 443, 12, 'bottomright', '6'),
(233, 'Riquet', 926, 379, 12, 'right', '0'),
(234, 'Crimée', 946, 359, 12, 'right', '0'),
(235, 'Corentin Cariou', 966, 339, 12, 'right', '0'),
(236, 'Pte de la Villette', 991, 314, 12, 'right', '7'),
(237, 'Aubervilliers Pantin Quatre Chemins', 1021, 283, 12, 'topleft', '14,21'),
(238, 'Fort d''Aubervilliers', 1055, 241, 12, 'left', '5'),
(239, 'La Courneuve 8 Mai 1945', 1055, 202, 12, 'left', '13');

-- --------------------------------------------------------

--
-- Structure de la table `stations_specs`
--

DROP TABLE IF EXISTS `stations_specs`;
CREATE TABLE IF NOT EXISTS `stations_specs` (
  `station_id` int(11) NOT NULL,
  `spec_type` varchar(25) NOT NULL,
  `spec_value` text NOT NULL,
  UNIQUE KEY `station_id` (`station_id`,`spec_type`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `stations_specs`
--

INSERT INTO `stations_specs` (`station_id`, `spec_type`, `spec_value`) VALUES
(1, 'PARKING', '1'),
(1, 'TERMINUS', '1'),
(7, 'ELEVATOR', '2'),
(14, 'BUSTERMINAL', '1'),
(14, 'ELEVATOR', '2'),
(14, 'TERMINUS', '1'),
(26, 'TERMINUS', '1'),
(27, 'ELEVATOR', '2'),
(27, 'TERMINUS', '1'),
(28, 'ELEVATOR', '2'),
(28, 'MULTIMODAL', '1'),
(29, 'ELEVATOR', '2'),
(29, 'PARKING', '1'),
(30, 'ELEVATOR', '2'),
(31, 'MULTIMODAL', '1'),
(34, 'ELEVATOR', '2'),
(40, 'ELEVATOR', '2'),
(43, 'MULTIMODAL', '1'),
(43, 'TRAINSTATION', '1'),
(44, 'MULTIMODAL', '1'),
(47, 'MULTIMODAL', '1'),
(49, 'TERMINUS', '1'),
(52, 'PARKING', '1'),
(55, 'ELEVATOR', '2'),
(55, 'TERMINUS', '1'),
(60, 'MULTIMODAL', '1'),
(64, 'TERMINUS', '1'),
(66, 'TERMINUS', '1'),
(73, 'TERMINUS', '6'),
(93, 'CORR', ''),
(93, 'TERMINUS', '7-2'),
(97, 'TERMINUS', '6'),
(98, 'TERMINUS', '7');

-- --------------------------------------------------------

--
-- Structure de la table `walks`
--

DROP TABLE IF EXISTS `walks`;
CREATE TABLE IF NOT EXISTS `walks` (
  `line_a` int(11) NOT NULL,
  `station_a` int(11) NOT NULL,
  `line_b` int(11) NOT NULL,
  `station_b` int(11) NOT NULL,
  `walk_value` int(11) NOT NULL,
  UNIQUE KEY `link_a` (`line_a`,`station_a`,`line_b`,`station_b`),
  KEY `station_a` (`station_a`),
  KEY `station_b` (`station_b`),
  KEY `walks_ibfk_3` (`line_b`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `links`
--
ALTER TABLE `links`
  ADD CONSTRAINT `links_ibfk_1` FOREIGN KEY (`line_a`) REFERENCES `metrolines` (`line_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `links_ibfk_2` FOREIGN KEY (`station_a`) REFERENCES `stations` (`station_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `links_ibfk_3` FOREIGN KEY (`line_b`) REFERENCES `metrolines` (`line_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `links_ibfk_4` FOREIGN KEY (`station_b`) REFERENCES `stations` (`station_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `links_steps`
--
ALTER TABLE `links_steps`
  ADD CONSTRAINT `links_steps_ibfk_1` FOREIGN KEY (`link_id`) REFERENCES `links` (`link_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `metrolines`
--
ALTER TABLE `metrolines`
  ADD CONSTRAINT `metrolines_ibfk_1` FOREIGN KEY (`network_tag`) REFERENCES `networks` (`network_tag`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `stations`
--
ALTER TABLE `stations`
  ADD CONSTRAINT `stations_ibfk_1` FOREIGN KEY (`line_id`) REFERENCES `metrolines` (`line_id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Contraintes pour la table `stations_specs`
--
ALTER TABLE `stations_specs`
  ADD CONSTRAINT `stations_specs_ibfk_1` FOREIGN KEY (`station_id`) REFERENCES `stations` (`station_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `walks`
--
ALTER TABLE `walks`
  ADD CONSTRAINT `walks_ibfk_1` FOREIGN KEY (`line_a`) REFERENCES `metrolines` (`line_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `walks_ibfk_2` FOREIGN KEY (`station_a`) REFERENCES `stations` (`station_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `walks_ibfk_3` FOREIGN KEY (`line_b`) REFERENCES `metrolines` (`line_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `walks_ibfk_4` FOREIGN KEY (`station_b`) REFERENCES `stations` (`station_id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
