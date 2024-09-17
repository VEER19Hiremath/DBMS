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
-- Database: `4thdbms`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `final_IA_mks` ()   BEGIN 
    DECLARE done INT DEFAULT FALSE;
    DECLARE USN_var VARCHAR(20);
    DECLARE Subcode_var VARCHAR(10);
    DECLARE SSID_var VARCHAR(5);
    DECLARE t1 INT;
    DECLARE t2 INT;
    DECLARE t3 INT;
    DECLARE mini INT;
    DECLARE avgr INT;

    DECLARE C_IAMARKS CURSOR FOR
        SELECT USN, Subcode, SSID, TEST1, TEST2, TEST3
        FROM IAMARKS1;

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN C_IAMARKS;

    the_loop: LOOP
        FETCH C_IAMARKS INTO USN_var, Subcode_var, SSID_var, t1, t2, t3;
        IF done THEN
            LEAVE the_loop;
        END IF;

        SET mini := LEAST(t1, t2, t3);
        SET avgr := (t1 + t2 + t3 - mini) / 2;

        UPDATE IAMARKS1
        SET FinalIA = avgr
        WHERE USN = USN_var AND Subcode = Subcode_var AND SSID = SSID_var;
    END LOOP;

    CLOSE C_IAMARKS;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `class1`
--

CREATE TABLE `class1` (
  `USN` varchar(20) NOT NULL,
  `SSID` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `class1`
--

INSERT INTO `class1` (`USN`, `SSID`) VALUES
('2bu21cs001', '5A'),
('2bu21cs002', '3B'),
('2bu21cs003', '7A'),
('2bu21cs004', '5A'),
('2bu21cs005', '3B');

-- --------------------------------------------------------

--
-- Table structure for table `iamarks1`
--

CREATE TABLE `iamarks1` (
  `USN` varchar(20) NOT NULL,
  `Subcode` varchar(10) NOT NULL,
  `SSID` varchar(5) NOT NULL,
  `Test1` int(11) DEFAULT NULL,
  `Test2` int(11) DEFAULT NULL,
  `Test3` int(11) DEFAULT NULL,
  `FinalIA` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `iamarks1`
--

INSERT INTO `iamarks1` (`USN`, `Subcode`, `SSID`, `Test1`, `Test2`, `Test3`, `FinalIA`) VALUES
('2bu21cs001', '21CS53', '5A', 10, 11, 12, 12),
('2bu21cs001', '21CS54', '2C', 8, 16, 20, 18),
('2bu21cs002', '21CS51', '4B', 7, 16, 18, 17),
('2bu21cs002', '21CS54', '3B', 15, 11, 12, 14),
('2bu21cs003', '21CS51', '7A', 16, 11, 12, 14);

-- --------------------------------------------------------

--
-- Table structure for table `semsec1`
--

CREATE TABLE `semsec1` (
  `SSID` varchar(5) NOT NULL,
  `Sem` int(11) DEFAULT NULL,
  `Sec` varchar(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `semsec1`
--

INSERT INTO `semsec1` (`SSID`, `Sem`, `Sec`) VALUES
('2C', 5, 'A'),
('3B', 3, 'B'),
('4B', 4, 'B'),
('4C', 4, 'C'),
('5A', 4, 'C'),
('7A', 7, 'A');

-- --------------------------------------------------------

--
-- Table structure for table `student1`
--

CREATE TABLE `student1` (
  `USN` varchar(20) NOT NULL,
  `SName` varchar(20) DEFAULT NULL,
  `Address` varchar(20) DEFAULT NULL,
  `Phone` varchar(10) DEFAULT NULL,
  `Gender` varchar(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `student1`
--

INSERT INTO `student1` (`USN`, `SName`, `Address`, `Phone`, `Gender`) VALUES
('2bu21cs001', 'Aditya', 'BGM', '9875698410', 'M'),
('2bu21cs002', 'Shubail', 'HUB', '8896557412', 'M'),
('2bu21cs003', 'Sumit', 'BGM', '7894759522', 'M'),
('2bu21cs004', 'Veeresh', 'BGM', '9485675521', 'M'),
('2bu21cs005', 'Vicky', 'BANG', '9538444404', 'M');

-- --------------------------------------------------------

--
-- Table structure for table `subject1`
--

CREATE TABLE `subject1` (
  `Subcode` varchar(10) NOT NULL,
  `Title` varchar(20) DEFAULT NULL,
  `Sem` int(11) DEFAULT NULL,
  `Credits` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `subject1`
--

INSERT INTO `subject1` (`Subcode`, `Title`, `Sem`, `Credits`) VALUES
('21CS51', 'ATCD', 5, 3),
('21CS52', 'DBMS', 5, 3),
('21CS53', 'CN', 5, 3),
('21CS54', 'AIML', 5, 3),
('21CS55', 'RMIPR', 5, 3);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_test1`
-- (See below for the actual view)
--
CREATE TABLE `v_test1` (
`SUBCODE` varchar(10)
,`TEST1` int(11)
);

-- --------------------------------------------------------

--
-- Structure for view `v_test1`
--
DROP TABLE IF EXISTS `v_test1`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_test1`  AS SELECT `iamarks1`.`Subcode` AS `SUBCODE`, `iamarks1`.`Test1` AS `TEST1` FROM `iamarks1` WHERE `iamarks1`.`USN` = '2bu21cs001''2bu21cs001'  ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `class1`
--
ALTER TABLE `class1`
  ADD PRIMARY KEY (`USN`,`SSID`);

--
-- Indexes for table `iamarks1`
--
ALTER TABLE `iamarks1`
  ADD PRIMARY KEY (`USN`,`Subcode`,`SSID`);

--
-- Indexes for table `semsec1`
--
ALTER TABLE `semsec1`
  ADD PRIMARY KEY (`SSID`);

--
-- Indexes for table `student1`
--
ALTER TABLE `student1`
  ADD PRIMARY KEY (`USN`);

--
-- Indexes for table `subject1`
--
ALTER TABLE `subject1`
  ADD PRIMARY KEY (`Subcode`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
