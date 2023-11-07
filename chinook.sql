-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:4306
-- Generation Time: Nov 02, 2023 at 10:21 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `chinook`
--

-- --------------------------------------------------------

--
-- Table structure for table `albums`
--

CREATE TABLE `albums` (
  `Album_id` int(11) NOT NULL,
  `Title` varchar(50) DEFAULT NULL,
  `Artist_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `artists`
--

CREATE TABLE `artists` (
  `Artist_id` int(11) NOT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `Location_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `Customer_id` int(11) NOT NULL,
  `Last_Name` varchar(50) DEFAULT NULL,
  `First_Name` varchar(50) DEFAULT NULL,
  `Company` varchar(50) DEFAULT NULL,
  `Phone` varchar(50) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `Employee_id` int(11) DEFAULT NULL,
  `Address` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `Employee_id` int(11) NOT NULL,
  `Last_Name` varchar(50) DEFAULT NULL,
  `First_Name` varchar(50) DEFAULT NULL,
  `Title` varchar(50) DEFAULT NULL,
  `ReportsTo` int(11) DEFAULT NULL,
  `BirthDate` date DEFAULT NULL,
  `HireDate` date DEFAULT NULL,
  `Address` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `Invoice_id` int(11) NOT NULL,
  `Customer_id` int(11) DEFAULT NULL,
  `InvoiceDate` date DEFAULT NULL,
  `BillingAddress` varchar(50) DEFAULT NULL,
  `Track_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `location`
--

CREATE TABLE `location` (
  `Location_id` int(11) NOT NULL,
  `City` varchar(50) DEFAULT NULL,
  `Country` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tracks`
--

CREATE TABLE `tracks` (
  `Track_id` int(11) NOT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `Album_id` int(11) DEFAULT NULL,
  `UnitPrice` decimal(10,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `albums`
--
ALTER TABLE `albums`
  ADD PRIMARY KEY (`Album_id`),
  ADD KEY `Artist_id` (`Artist_id`);

--
-- Indexes for table `artists`
--
ALTER TABLE `artists`
  ADD PRIMARY KEY (`Artist_id`),
  ADD KEY `Location_id` (`Location_id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`Customer_id`),
  ADD KEY `Employee_id` (`Employee_id`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`Employee_id`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`Invoice_id`),
  ADD KEY `Customer_id` (`Customer_id`),
  ADD KEY `Track_id` (`Track_id`);

--
-- Indexes for table `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`Location_id`);

--
-- Indexes for table `tracks`
--
ALTER TABLE `tracks`
  ADD PRIMARY KEY (`Track_id`),
  ADD KEY `Album_id` (`Album_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `albums`
--
ALTER TABLE `albums`
  ADD CONSTRAINT `albums_ibfk_1` FOREIGN KEY (`Artist_id`) REFERENCES `artists` (`Artist_id`);

--
-- Constraints for table `artists`
--
ALTER TABLE `artists`
  ADD CONSTRAINT `Location_id` FOREIGN KEY (`Location_id`) REFERENCES `location` (`Location_id`);

--
-- Constraints for table `customers`
--
ALTER TABLE `customers`
  ADD CONSTRAINT `customers_ibfk_1` FOREIGN KEY (`Employee_id`) REFERENCES `employee` (`Employee_id`);

--
-- Constraints for table `invoices`
--
ALTER TABLE `invoices`
  ADD CONSTRAINT `invoices_ibfk_1` FOREIGN KEY (`Customer_id`) REFERENCES `customers` (`Customer_id`),
  ADD CONSTRAINT `invoices_ibfk_2` FOREIGN KEY (`Track_id`) REFERENCES `tracks` (`Track_id`);

--
-- Constraints for table `tracks`
--
ALTER TABLE `tracks`
  ADD CONSTRAINT `tracks_ibfk_1` FOREIGN KEY (`Album_id`) REFERENCES `albums` (`Album_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
