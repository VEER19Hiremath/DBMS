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
-- Database: `5thdbms`
--

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `Dno` int(20) NOT NULL,
  `Dname` varchar(20) NOT NULL,
  `MgrSSN` int(20) DEFAULT NULL,
  `MgrStartDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`Dno`, `Dname`, `MgrSSN`, `MgrStartDate`) VALUES
(1, 'CS', 100, '2024-02-24'),
(2, 'EC', 101, '2024-02-23'),
(3, 'EEE', 105, '2024-02-22'),
(4, 'Civil', 105, '2024-02-21'),
(5, 'Mechanical', 104, '2024-02-20');

-- --------------------------------------------------------

--
-- Table structure for table `dlocation`
--

CREATE TABLE `dlocation` (
  `Dno` int(20) NOT NULL,
  `Dloc` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `dlocation`
--

INSERT INTO `dlocation` (`Dno`, `Dloc`) VALUES
(1, 'New Building'),
(2, 'Old Building'),
(3, 'Academic Block'),
(4, 'P Block'),
(5, 'Main Building');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `SSN` int(20) NOT NULL,
  `Name` varchar(20) NOT NULL,
  `Address` varchar(20) NOT NULL,
  `Gender` varchar(20) NOT NULL,
  `Salary` int(20) NOT NULL,
  `SuperSSN` int(20) DEFAULT NULL,
  `Dno` int(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`SSN`, `Name`, `Address`, `Gender`, `Salary`, `SuperSSN`, `Dno`) VALUES
(100, 'veeresh', 'Bangalore', 'M', 600015, 100, 1),
(101, 'sumit', 'Mangalore', 'M', 600003, 101, 2),
(103, 'shubail', 'Pune', 'F', 600005, 105, 5),
(104, 'aditya', 'Bangalore', 'F', 600004, 103, 3),
(105, 'vicky', 'Belagavi', 'F', 600008, 104, 4);

-- --------------------------------------------------------

--
-- Table structure for table `project`
--

CREATE TABLE `project` (
  `Pno` int(20) NOT NULL,
  `Pname` varchar(20) NOT NULL,
  `Ploc` varchar(20) NOT NULL,
  `Dno` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `project`
--

INSERT INTO `project` (`Pno`, `Pname`, `Ploc`, `Dno`) VALUES
(11, 'Robotic', 'T Block', 1),
(12, 'IoT', 'P Block', 2),
(13, 'Cyber Security', 'F Block', 1),
(14, 'Steam Turbine', 'F block', 4),
(15, 'Library Management ', 'T Block', 1);

-- --------------------------------------------------------

--
-- Table structure for table `works_on`
--

CREATE TABLE `works_on` (
  `ESSN` int(20) NOT NULL,
  `Pno` int(20) NOT NULL,
  `Hours` time(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `works_on`
--

INSERT INTO `works_on` (`ESSN`, `Pno`, `Hours`) VALUES
(100, 12, '07:04:46.000000'),
(101, 13, '02:03:26.000000'),
(103, 11, '05:05:08.000000'),
(104, 11, '07:05:39.000000'),
(105, 15, '03:05:08.000000');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`Dno`),
  ADD KEY `ghm` (`MgrSSN`);

--
-- Indexes for table `dlocation`
--
ALTER TABLE `dlocation`
  ADD PRIMARY KEY (`Dloc`),
  ADD KEY `aaa` (`Dno`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`SSN`),
  ADD KEY `abc` (`Dno`),
  ADD KEY `ijk` (`SuperSSN`);

--
-- Indexes for table `project`
--
ALTER TABLE `project`
  ADD PRIMARY KEY (`Pno`),
  ADD KEY `pqr` (`Dno`);

--
-- Indexes for table `works_on`
--
ALTER TABLE `works_on`
  ADD PRIMARY KEY (`ESSN`,`Pno`),
  ADD KEY `sss` (`Pno`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `department`
--
ALTER TABLE `department`
  ADD CONSTRAINT `ghm` FOREIGN KEY (`MgrSSN`) REFERENCES `employee` (`SSN`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `dlocation`
--
ALTER TABLE `dlocation`
  ADD CONSTRAINT `aaa` FOREIGN KEY (`Dno`) REFERENCES `department` (`Dno`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `abc` FOREIGN KEY (`Dno`) REFERENCES `department` (`Dno`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ijk` FOREIGN KEY (`SuperSSN`) REFERENCES `employee` (`SSN`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `project`
--
ALTER TABLE `project`
  ADD CONSTRAINT `pqr` FOREIGN KEY (`Dno`) REFERENCES `department` (`Dno`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `works_on`
--
ALTER TABLE `works_on`
  ADD CONSTRAINT `mno` FOREIGN KEY (`ESSN`) REFERENCES `employee` (`SSN`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sss` FOREIGN KEY (`Pno`) REFERENCES `project` (`Pno`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
