-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 27, 2024 at 03:21 PM
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
-- Database: `1stdbms`
--
CREATE DATABASE IF NOT EXISTS `1stdbms` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `1stdbms`;

-- --------------------------------------------------------

--
-- Table structure for table `book`
--

CREATE TABLE `book` (
  `Book_id` int(11) NOT NULL,
  `Title` varchar(10) DEFAULT NULL,
  `Publisher_Name` varchar(10) DEFAULT NULL,
  `Pub_Year` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `book`
--

INSERT INTO `book` (`Book_id`, `Title`, `Publisher_Name`, `Pub_Year`) VALUES
(101, 'DBMS', 'Pearson', 2010),
(102, 'CN', 'IEEE', 2010),
(103, 'ADA', 'Springer', 2010),
(104, 'Java', 'Pearson', 2011),
(105, 'CG', 'Tata', 2010);

-- --------------------------------------------------------

--
-- Table structure for table `book_authors`
--

CREATE TABLE `book_authors` (
  `Book_id` int(11) NOT NULL,
  `Author_Name` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `book_authors`
--

INSERT INTO `book_authors` (`Book_id`, `Author_Name`) VALUES
(101, 'Sumit'),
(101, 'Veeresh'),
(102, 'shubail'),
(103, 'vicky'),
(104, 'herbert'),
(105, 'Richy');

-- --------------------------------------------------------

--
-- Table structure for table `book_copies`
--

CREATE TABLE `book_copies` (
  `Book_id` int(11) DEFAULT NULL,
  `Branch_id` int(11) DEFAULT NULL,
  `No_of_Copies` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `book_copies`
--

INSERT INTO `book_copies` (`Book_id`, `Branch_id`, `No_of_Copies`) VALUES
(101, 1, 10),
(107, 3, 5),
(102, 1, 5),
(103, 1, 10),
(104, 1, 20),
(105, 1, 5);

-- --------------------------------------------------------

--
-- Table structure for table `book_lending`
--

CREATE TABLE `book_lending` (
  `Book_id` int(11) NOT NULL,
  `Branch_id` int(11) NOT NULL,
  `Card_No` int(11) NOT NULL,
  `Date_Out` date DEFAULT NULL,
  `Due_Date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `book_lending`
--

INSERT INTO `book_lending` (`Book_id`, `Branch_id`, `Card_No`, `Date_Out`, `Due_Date`) VALUES
(101, 1, 501, '2017-08-20', '2017-09-20'),
(101, 1, 504, '2017-01-02', '2017-02-02'),
(102, 1, 502, '2017-08-18', '2017-09-18'),
(102, 1, 504, '2017-04-21', '2017-05-21'),
(103, 1, 503, '2017-07-20', '2017-08-20'),
(103, 1, 504, '2017-06-02', '2017-06-02'),
(104, 1, 504, '2017-02-20', '2017-03-20'),
(105, 2, 505, '2017-01-11', '2017-02-11');

-- --------------------------------------------------------

--
-- Table structure for table `library_branch`
--

CREATE TABLE `library_branch` (
  `Branch_id` int(11) NOT NULL,
  `Branch_Name` varchar(10) DEFAULT NULL,
  `Address` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `library_branch`
--

INSERT INTO `library_branch` (`Branch_id`, `Branch_Name`, `Address`) VALUES
(1, 'CS', 'Dept CSE'),
(2, 'EE', 'Dept EEE'),
(3, 'EC', 'Dept ECE'),
(4, 'CV', 'Dept CIC'),
(5, 'ME', 'Dept MEC');

-- --------------------------------------------------------

--
-- Table structure for table `publisher`
--

CREATE TABLE `publisher` (
  `Name` varchar(10) NOT NULL,
  `Address` varchar(20) DEFAULT NULL,
  `Phone` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `publisher`
--

INSERT INTO `publisher` (`Name`, `Address`, `Phone`) VALUES
('ACM', 'Belagavi India', 2147483647),
('IEEE', 'Bangalore India', 2147483647),
('Pearson', 'Mumbai India', 2147483647),
('Springer', 'Delhi India', 2147483647),
('Tata', 'Huballi India', 2147483647);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_bk_cp`
-- (See below for the actual view)
--

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_pub`
-- (See below for the actual view)
--


-- --------------------------------------------------------

--
-- Structure for view `v_bk_cp`
--


--
-- Indexes for dumped tables
--

--
-- Indexes for table `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`Book_id`);

--
-- Indexes for table `book_authors`
--
ALTER TABLE `book_authors`
  ADD PRIMARY KEY (`Book_id`,`Author_Name`);

--
-- Indexes for table `book_lending`
--
ALTER TABLE `book_lending`
  ADD PRIMARY KEY (`Book_id`,`Branch_id`,`Card_No`);

--
-- Indexes for table `library_branch`
--
ALTER TABLE `library_branch`
  ADD PRIMARY KEY (`Branch_id`);

--
-- Indexes for table `publisher`
--
ALTER TABLE `publisher`
  ADD PRIMARY KEY (`Name`);
--
