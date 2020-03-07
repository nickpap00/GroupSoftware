-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Feb 13, 2020 at 12:45 AM
-- Server version: 5.6.21
-- PHP Version: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `projectdb`
-- Author(s): James Kitt, Zain Habib
--

-- --------------------------------------------------------
--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
`userID` int(11) NOT NULL,
  `firstName` varchar(255) NOT NULL,
  `username` varchar(40) DEFAULT NULL,
  `password` varchar(40) NOT NULL,
  `accessID` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`userID`, `firstName`, `username`, `password`, `accessID`) VALUES
(1, 'Aaron', 'gamemaster1', 'e74b595aff7c289c373d0c17798aa94ddb7c4278', 1),
(2, 'Saleh', 'student1', 'student', 0),
(3, 'Zain', 'zh290', '3eac329c208657f1d240cf5a24f32c084d8c2557', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tours`
--

CREATE TABLE IF NOT EXISTS `tours` (
  `tourID` INT(11) AUTO_INCREMENT,
    `creatorID` INT(11) NOT NULL,
    `creationDate` DATE NOT NULL,
    `tourRoute` VARCHAR(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tables`
--
INSERT INTO `tours` (`tourID`, `creatorID`,  `creationDate`, `tourRoute`) VALUES
(1,1, `2020-02-11`,`1,5,17,6,3`);

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE IF NOT EXISTS `bookings` (
  `bookingID` INT(11) AUTO_INCREMENT,
      `tourID` INT(11) NOT NULL,
      `userID` INT(11) UNIQUE NULL,
      `bookingDate` DATETIME NOT NULL,
      `lastLocation` INT DEFAULT -1,
      `score` INT
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bookings`
--
INSERT INTO `bookings` (`bookingID`, `tourID`, `userID`, `bookingDate`,
  `lastLocation`, `score`) VALUES
  (1, 1, 2, `2020-02-13`, 5, 17);

-- --------------------------------------------------------

--
-- Indexes for dumped tables
--


--
-- Indexes for table `users`
--
ALTER TABLE `users`
 ADD PRIMARY KEY (`userID`), ADD UNIQUE KEY `Username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--


--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
MODIFY `userID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `tours`
--
ALTER TABLE `tours`
MODIFY `tourID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
MODIFY `bookingID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
