-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 27, 2024 at 05:45 PM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `3rddbmds`
--

-- --------------------------------------------------------

--
-- Table structure for table `actor`
--

CREATE TABLE `actor` (
  `Act_id` int(11) NOT NULL,
  `Act_Name` varchar(20) DEFAULT NULL,
  `Act_Gender` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `actor`
--

INSERT INTO `actor` (`Act_id`, `Act_Name`, `Act_Gender`) VALUES
(101, 'Brad Pitt', 'male'),
(102, 'Leonardo Dicaprio', 'male'),
(103, 'Charlie Chaplin', 'male'),
(104, 'Angelina Jolie', 'female'),
(105, 'Kristen Stewart', 'female');

-- --------------------------------------------------------

--
-- Table structure for table `director`
--

CREATE TABLE `director` (
  `Dir_id` int(11) NOT NULL,
  `Dir_Name` varchar(20) DEFAULT NULL,
  `Dir_Phone` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `director`
--

INSERT INTO `director` (`Dir_id`, `Dir_Name`, `Dir_Phone`) VALUES
(201, 'Christopher Nolan', 2147483647),
(202, 'David Fincher', 2147483647),
(203, 'Hitchcock', 2147483647),
(204, 'Steven Spielberg', 2147483647),
(205, 'Quentin Tarantino', 2147483647);

-- --------------------------------------------------------

--
-- Table structure for table `movies`
--

CREATE TABLE `movies` (
  `Mov_id` int(11) NOT NULL,
  `Mov_Title` varchar(20) DEFAULT NULL,
  `Mov_Year` int(11) DEFAULT NULL,
  `Mov_Lang` varchar(20) DEFAULT NULL,
  `Dir_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `movies`
--

INSERT INTO `movies` (`Mov_id`, `Mov_Title`, `Mov_Year`, `Mov_Lang`, `Dir_id`) VALUES
(301, 'M1', 1999, 'Eng', 201),
(302, 'M2', 2016, 'Eng', 201),
(303, 'M3', 2017, 'Eng', 202),
(304, 'M4', 2010, 'Eng', 202),
(305, 'M5', 2016, 'Eng', 202),
(306, 'M6', 1996, 'Eng', 203),
(307, 'M7', 1997, 'Eng', 203),
(308, 'M8', 2012, 'Eng', 204),
(309, 'M9', 2016, 'Eng', 204),
(310, 'M10', 2017, 'Eng', 205),
(311, 'M11', 2015, 'Eng', 205);

-- --------------------------------------------------------

--
-- Table structure for table `movie_cast`
--

CREATE TABLE `movie_cast` (
  `Act_id` int(11) NOT NULL,
  `Mov_id` int(11) NOT NULL,
  `Role` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `movie_cast`
--

INSERT INTO `movie_cast` (`Act_id`, `Mov_id`, `Role`) VALUES
(101, 301, 'M'),
(101, 302, 'M'),
(101, 304, 'M'),
(101, 307, 'M'),
(101, 311, 'M'),
(102, 303, 'M'),
(102, 309, 'M'),
(103, 305, 'M'),
(103, 306, 'M'),
(103, 308, 'M'),
(104, 303, 'S'),
(105, 302, 'M');

-- --------------------------------------------------------

--
-- Table structure for table `rating`
--

CREATE TABLE `rating` (
  `Mov_id` int(11) NOT NULL,
  `Rev_Stars` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `rating`
--

INSERT INTO `rating` (`Mov_id`, `Rev_Stars`) VALUES
(301, 3.5),
(302, 0.5),
(303, 4.5),
(304, 0.5),
(305, 2.5),
(306, 3.5),
(307, 2),
(308, 5),
(309, 5),
(310, 4),
(311, 4.5);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `actor`
--
ALTER TABLE `actor`
  ADD PRIMARY KEY (`Act_id`);

--
-- Indexes for table `director`
--
ALTER TABLE `director`
  ADD PRIMARY KEY (`Dir_id`);

--
-- Indexes for table `movies`
--
ALTER TABLE `movies`
  ADD PRIMARY KEY (`Mov_id`),
  ADD KEY `Dir_id` (`Dir_id`);

--
-- Indexes for table `movie_cast`
--
ALTER TABLE `movie_cast`
  ADD PRIMARY KEY (`Act_id`,`Mov_id`);

--
-- Indexes for table `rating`
--
ALTER TABLE `rating`
  ADD PRIMARY KEY (`Mov_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `movies`
--
ALTER TABLE `movies`
  ADD CONSTRAINT `movies_ibfk_1` FOREIGN KEY (`Dir_id`) REFERENCES `director` (`Dir_id`);

--
-- Constraints for table `rating`
--
ALTER TABLE `rating`
  ADD CONSTRAINT `rating_ibfk_1` FOREIGN KEY (`Mov_id`) REFERENCES `movies` (`Mov_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
