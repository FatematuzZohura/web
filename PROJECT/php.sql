-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 25, 2022 at 12:54 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `php`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `getdoctors` (IN `dID` INT)  SELECT * FROM doctors WHERE ID = dID$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `appointment`
--

CREATE TABLE `appointment` (
  `Password` varchar(32) NOT NULL,
  `Phone` varchar(32) NOT NULL,
  `Age` int(11) NOT NULL,
  `Date` date NOT NULL,
  `Time` text NOT NULL,
  `Disease` text NOT NULL,
  `Doctor_Name` text NOT NULL,
  `Doctors_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `appointment`
--

INSERT INTO `appointment` (`Password`, `Phone`, `Age`, `Date`, `Time`, `Disease`, `Doctor_Name`, `Doctors_ID`) VALUES
('34221', '334546', 34, '0000-00-00', '8am', 'Covid', 'Sabbir', 5),
('4686', '01785464777', 87, '0000-00-00', '7pm', 'Covid', 'Karim', 7),
('46876', '019985464777', 67, '0000-00-00', '8am', 'Covid', 'Sabbir', 5),
('4688', '01785464773', 34, '0000-00-00', '5pm', 'Covid', 'Rahim', 6),
('57587', '376764868576', 34, '0000-00-00', '5pm', 'Covid', 'Karim', 7);

-- --------------------------------------------------------

--
-- Table structure for table `doctors`
--

CREATE TABLE `doctors` (
  `ID` int(11) NOT NULL,
  `Username` varchar(250) NOT NULL,
  `Password` varchar(32) NOT NULL,
  `Email` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `doctors`
--

INSERT INTO `doctors` (`ID`, `Username`, `Password`, `Email`) VALUES
(1, 'rishia', '20145', 'risha@gmail.com'),
(2, 'karim', '20146', 'karim@gmail.com'),
(3, 'Rahim', '20147', 'Rahim@gmail.com'),
(7, 'kami', '23454', 'kami@gmail.com'),
(9, 'Korobi', '35442', 'korobi@gmail.com'),
(21, 'Samiya', '34221', 'samiya@gmail.com');

--
-- Triggers `doctors`
--
DELIMITER $$
CREATE TRIGGER `Insertdoctors_tigg` AFTER INSERT ON `doctors` FOR EACH ROW INSERT INTO doctor_tigg VALUES(null,New.ID,"Inserted",Now())
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `deletedoctors_tigg` BEFORE DELETE ON `doctors` FOR EACH ROW INSERT INTO doctor_tigg VALUES(null,old.id,"Updated",Now())
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `updatedoctor_tigg` AFTER UPDATE ON `doctors` FOR EACH ROW INSERT INTO doctor_tigg VALUES(null,New.id,"Updated",Now())
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Stand-in structure for view `doctors_view`
-- (See below for the actual view)
--
CREATE TABLE `doctors_view` (
`total_doctor` bigint(21)
);

-- --------------------------------------------------------

--
-- Table structure for table `doctor_tigg`
--

CREATE TABLE `doctor_tigg` (
  `ID` int(11) NOT NULL,
  `doctors_id` int(11) NOT NULL,
  `actions` varchar(60) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `doctor_tigg`
--

INSERT INTO `doctor_tigg` (`ID`, `doctors_id`, `actions`, `date`) VALUES
(1, 15, 'Inserted', '2022-04-11 12:59:21'),
(2, 20, 'Updated', '2022-04-11 13:05:46'),
(3, 20, 'Updated', '2022-04-11 13:07:19'),
(4, 67, 'Inserted', '2022-04-11 13:29:54'),
(5, 67, 'Inserted', '2022-04-11 13:38:31'),
(6, 67, 'Inserted', '2022-04-11 13:40:52'),
(7, 67, 'Inserted', '2022-04-11 13:43:41'),
(8, 67, 'Inserted', '2022-04-12 00:38:18'),
(9, 67, 'Inserted', '2022-04-12 00:42:23'),
(10, 67, 'Updated', '2022-04-12 01:22:59'),
(11, 67, 'Updated', '2022-04-12 01:22:59'),
(12, 67, 'Updated', '2022-04-12 01:22:59'),
(13, 67, 'Updated', '2022-04-12 01:22:59'),
(14, 67, 'Updated', '2022-04-12 01:22:59'),
(15, 67, 'Updated', '2022-04-12 01:22:59'),
(16, 78, 'Inserted', '2022-04-12 09:39:10'),
(17, 56, 'Inserted', '2022-04-12 10:06:16'),
(18, 78, 'Updated', '2022-04-12 10:07:21'),
(19, 56, 'Updated', '2022-04-12 10:07:31');

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

CREATE TABLE `patient` (
  `Username` varchar(250) NOT NULL,
  `Password` varchar(32) NOT NULL,
  `Email` text NOT NULL,
  `Age` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `patient`
--

INSERT INTO `patient` (`Username`, `Password`, `Email`, `Age`) VALUES
('Mahin', '2018', 'mahin@gmail.com', 40),
('Any', '2019', 'any@gmail.com', 25),
('Sumiya', '2020', 'sumiya@gmail.com', 50),
('kami', '23454', 'kami@gmail.com', 67),
('Rima', '234546', 'rima@gmail.com', 87);

-- --------------------------------------------------------

--
-- Structure for view `doctors_view`
--
DROP TABLE IF EXISTS `doctors_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `doctors_view`  AS SELECT count(`doctors`.`ID`) AS `total_doctor` FROM `doctors` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointment`
--
ALTER TABLE `appointment`
  ADD PRIMARY KEY (`Password`),
  ADD KEY `Password` (`Password`),
  ADD KEY `Password_2` (`Password`),
  ADD KEY `Doctors_ID` (`Doctors_ID`);

--
-- Indexes for table `doctors`
--
ALTER TABLE `doctors`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `doctor_tigg`
--
ALTER TABLE `doctor_tigg`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`Password`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `doctor_tigg`
--
ALTER TABLE `doctor_tigg`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
