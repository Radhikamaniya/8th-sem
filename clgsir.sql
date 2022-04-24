-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 24, 2022 at 04:48 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `clgsir`
--

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE `address` (
  `AddressId` int(10) UNSIGNED NOT NULL,
  `Street` varchar(80) NOT NULL,
  `City` varchar(50) NOT NULL,
  `State` varchar(50) NOT NULL,
  `Zip` varchar(10) NOT NULL,
  `CustomerId` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `address`
--

INSERT INTO `address` (`AddressId`, `Street`, `City`, `State`, `Zip`, `CustomerId`) VALUES
(19, 'uyt', 'tfrds', 'gtfd1sss', '765', 1),
(20, 'uyt', 'tfrds', 'gtfd', '765', 1),
(21, 'uyt', 'tfrds12', 'gtfd123', '765', 1),
(22, 'uyt', 'tfrds', 'gtfd', '765', 1),
(23, 'uyt', 'tfrds12', 'gtfd123', '765', 1),
(24, 'uyt', 'hgf', 'hgf', '765', 1),
(25, 'uyt', 'tfrds', 's', '765', 1),
(26, 'uu', 'uu', 'uuu', '999', 1),
(27, 'uyt', 'tfrds', 'gtfd1s', '765', 1),
(28, 'efff', 'erdsd', 'wd', '876543', 1),
(29, 'dv', 'vvcx', 'cxc', '56', 21);

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `CustomerID` int(10) UNSIGNED NOT NULL,
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`CustomerID`, `FirstName`, `LastName`) VALUES
(1, 'radhika', 'maniya'),
(20, 'firstName', ' lastName'),
(21, 'Vikram', 'Sampat'),
(22, 'Vikram1', 'Sampat1'),
(23, 'Vikram', 'Sampat'),
(24, 'Vikram1', 'Sampat1'),
(25, 'Vikram', 'Sampat'),
(26, 'Vikram1', 'Sampat1'),
(27, 'Vikram', 'Sampat'),
(28, 'Vikram1', 'Sampat1'),
(29, 'Vikram123', 'Sampat123'),
(30, 'Vikram123', 'Sampat123'),
(31, 'Vikram123', 'Sampat123');

-- --------------------------------------------------------

--
-- Table structure for table `cust_subs`
--

CREATE TABLE `cust_subs` (
  `CustomerId` int(10) UNSIGNED NOT NULL,
  `SubscriptionId` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cust_subs`
--

INSERT INTO `cust_subs` (`CustomerId`, `SubscriptionId`) VALUES
(28, 7),
(28, 6),
(28, 8);

-- --------------------------------------------------------

--
-- Table structure for table `subscription`
--

CREATE TABLE `subscription` (
  `SubscriptionId` int(10) UNSIGNED NOT NULL,
  `Title` varchar(45) NOT NULL,
  `Type` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subscription`
--

INSERT INTO `subscription` (`SubscriptionId`, `Title`, `Type`) VALUES
(6, 'good', 'type'),
(7, 'good1', 'type1'),
(8, 'good2', 'type2');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`AddressId`),
  ADD KEY `fkcustadd` (`CustomerId`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`CustomerID`);

--
-- Indexes for table `cust_subs`
--
ALTER TABLE `cust_subs`
  ADD KEY `fk_cust_custsubs` (`CustomerId`),
  ADD KEY `fk_subs_custsubs` (`SubscriptionId`);

--
-- Indexes for table `subscription`
--
ALTER TABLE `subscription`
  ADD PRIMARY KEY (`SubscriptionId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `address`
--
ALTER TABLE `address`
  MODIFY `AddressId` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `CustomerID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `cust_subs`
--
ALTER TABLE `cust_subs`
  MODIFY `CustomerId` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `subscription`
--
ALTER TABLE `subscription`
  MODIFY `SubscriptionId` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `address`
--
ALTER TABLE `address`
  ADD CONSTRAINT `fkcustadd` FOREIGN KEY (`CustomerId`) REFERENCES `customer` (`CustomerID`);

--
-- Constraints for table `cust_subs`
--
ALTER TABLE `cust_subs`
  ADD CONSTRAINT `fk_cust_custsubs` FOREIGN KEY (`CustomerId`) REFERENCES `customer` (`CustomerID`),
  ADD CONSTRAINT `fk_subs_custsubs` FOREIGN KEY (`SubscriptionId`) REFERENCES `subscription` (`SubscriptionId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
