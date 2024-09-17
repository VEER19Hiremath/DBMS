-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 27, 2024 at 05:44 PM
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
-- Database: `2nddbms`
--

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `Customer_id` int(11) NOT NULL,
  `Cust_Name` varchar(20) DEFAULT NULL,
  `City` varchar(20) DEFAULT NULL,
  `Grade` int(11) DEFAULT NULL,
  `Salesman_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`Customer_id`, `Cust_Name`, `City`, `Grade`, `Salesman_id`) VALUES
(5004, 'Shubail', 'Belagavi', 3, 1001),
(5005, 'Vicky', 'Belagavi', 5, 1002);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `Ord_No` int(11) NOT NULL,
  `Purchase_Amt` float DEFAULT NULL,
  `Ord_Date` date DEFAULT NULL,
  `Customer_id` int(11) DEFAULT NULL,
  `Salesman_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`Ord_No`, `Purchase_Amt`, `Ord_Date`, `Customer_id`, `Salesman_id`) VALUES
(103, 10000, '2017-07-08', 5004, 1001),
(104, 5000, '2017-06-28', 5005, 1002);

-- --------------------------------------------------------

--
-- Table structure for table `salesman`
--

CREATE TABLE `salesman` (
  `Salesman_id` int(11) NOT NULL,
  `Name` varchar(20) DEFAULT NULL,
  `City` varchar(20) DEFAULT NULL,
  `Commission` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `salesman`
--

INSERT INTO `salesman` (`Salesman_id`, `Name`, `City`, `Commission`) VALUES
(1001, 'Ravi', 'Belagavi', 6),
(1002, 'Mantesh', 'Hubli', 5.2),
(1003, 'Pavan', 'Mumbai', 2.5),
(1004, 'Deepak', 'Delhi', 3.5);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_sal_ord`
-- (See below for the actual view)
--
CREATE TABLE `v_sal_ord` (
`ord_date` date
,`salesman_id` int(11)
,`name` varchar(20)
);

-- --------------------------------------------------------

--
-- Structure for view `v_sal_ord`
--
DROP TABLE IF EXISTS `v_sal_ord`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_sal_ord`  AS SELECT `o`.`Ord_Date` AS `ord_date`, `s`.`Salesman_id` AS `salesman_id`, `s`.`Name` AS `name` FROM (`salesman` `s` join `orders` `o`) WHERE `s`.`Salesman_id` = `o`.`Salesman_id` AND `o`.`Purchase_Amt` in (select max(`orders`.`Purchase_Amt`) from `orders` group by `orders`.`Ord_Date`)  ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`Customer_id`),
  ADD KEY `Salesman_id` (`Salesman_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`Ord_No`),
  ADD KEY `Customer_id` (`Customer_id`),
  ADD KEY `Salesman_id` (`Salesman_id`);

--
-- Indexes for table `salesman`
--
ALTER TABLE `salesman`
  ADD PRIMARY KEY (`Salesman_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`Salesman_id`) REFERENCES `salesman` (`Salesman_id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`Customer_id`) REFERENCES `customer` (`Customer_id`),
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`Salesman_id`) REFERENCES `salesman` (`Salesman_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
