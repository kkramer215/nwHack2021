-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 10, 2021 at 09:24 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fit_buddy`
--

-- --------------------------------------------------------

--
-- Table structure for table `gyms`
--

CREATE TABLE `gyms` (
  `ID` int(11) NOT NULL,
  `Name` char(100) DEFAULT NULL,
  `Location` char(100) DEFAULT NULL,
  `Phone_number` char(15) DEFAULT NULL,
  `monthly_membership` int(11) DEFAULT NULL,
  `24h` char(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `gyms`
--

INSERT INTO `gyms` (`ID`, `Name`, `Location`, `Phone_number`, `monthly_membership`, `24h`) VALUES
(1, 'Plat gym', 'UBC', '778-128-0561', 59, 'Yes'),
(2, 'Golds gym', 'UBC', '238-764-1256', 49, 'No'),
(3, 'Silver gym', 'UBC', '238-666-1678', 25, 'Yes'),
(4, 'Bronze gym', 'UBC', '778-824-9357', 15, 'No');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `Student_ID` int(11) NOT NULL,
  `Name` char(100) DEFAULT NULL,
  `Location` char(100) DEFAULT NULL,
  `Phone_number` char(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`Student_ID`, `Name`, `Location`, `Phone_number`) VALUES
(32, 'joe', 'UBC', '(778)522-1576'),
(234, 'agh', 'UBC', '(778)522-1576');

-- --------------------------------------------------------

--
-- Table structure for table `trainer`
--

CREATE TABLE `trainer` (
  `TrainerID` int(11) NOT NULL,
  `Name` char(100) NOT NULL,
  `Rating` float DEFAULT NULL,
  `GymID` int(11) DEFAULT NULL,
  `focus` char(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `trainer`
--

INSERT INTO `trainer` (`TrainerID`, `Name`, `Rating`, `GymID`, `focus`) VALUES
(1, 'Robert Barr', 4.2, 2, 'Cardio'),
(2, 'Samantha Woley', 4.6, 3, 'Strength'),
(3, 'Kevin Ngyuen', 5, 1, 'Endurance'),
(4, 'Melissa Wong', 3.9, 4, 'Cardio');

-- --------------------------------------------------------

--
-- Stand-in structure for view `trainers`
-- (See below for the actual view)
--
CREATE TABLE `trainers` (
`TrainerID` int(11)
,`Name` char(100)
,`Rating` float
,`focus` char(30)
,`GymID` int(11)
,`Gym` char(100)
);

-- --------------------------------------------------------

--
-- Structure for view `trainers`
--
DROP TABLE IF EXISTS `trainers`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `trainers`  AS SELECT `trainer`.`TrainerID` AS `TrainerID`, `trainer`.`Name` AS `Name`, `trainer`.`Rating` AS `Rating`, `trainer`.`focus` AS `focus`, `trainer`.`GymID` AS `GymID`, `gyms`.`Name` AS `Gym` FROM (`trainer` join `gyms`) WHERE `gyms`.`ID` = `trainer`.`GymID` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `gyms`
--
ALTER TABLE `gyms`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`Student_ID`);

--
-- Indexes for table `trainer`
--
ALTER TABLE `trainer`
  ADD PRIMARY KEY (`TrainerID`),
  ADD KEY `GymID` (`GymID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `trainer`
--
ALTER TABLE `trainer`
  ADD CONSTRAINT `trainer_ibfk_1` FOREIGN KEY (`GymID`) REFERENCES `gyms` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
