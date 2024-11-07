-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 11, 2023 at 08:32 PM
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
-- Database: `moneycare`
--

-- --------------------------------------------------------

--
-- Table structure for table `expensecategories`
--

CREATE TABLE `expensecategories` (
  `id` int(11) NOT NULL,
  `category_name` varchar(50) NOT NULL,
  `userid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `expensecategories`
--

INSERT INTO `expensecategories` (`id`, `category_name`, `userid`) VALUES
(1, 'Water', 2),
(2, 'food', 2),
(3, 'Electricity', 2),
(4, 'internet', 2),
(5, 'water', 3),
(6, 'colthes', 3),
(8, 'food', 3),
(9, 'Transportation ', 3),
(10, 'Insurance', 3),
(11, 'Medical & Healthcare', 3),
(12, 'Recreation & Entertainment', 3),
(13, 'Electricity bill payment', 3),
(14, 'Miscellaneous', 3),
(15, 'Bussiness', 3),
(16, 'Bank loan', 3),
(17, 'food', 4),
(18, 'colthes', 4),
(19, 'Bank loan', 4),
(20, 'Electricity bill payment', 4),
(21, 'Medical & Healthcare', 4),
(22, 'food', 5),
(23, 'clothes', 5),
(24, 'payments', 5),
(25, 'food', 6),
(26, 'Bank loan', 6),
(27, 'food', 7),
(28, 'food', 8),
(29, 'payments', 9),
(30, 'Bank loan', 9),
(31, 'food', 10);

-- --------------------------------------------------------

--
-- Table structure for table `expenses`
--

CREATE TABLE `expenses` (
  `id` int(11) NOT NULL,
  `userid` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `category_name` varchar(50) NOT NULL,
  `description` text DEFAULT NULL,
  `amount` decimal(10,2) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `expenses`
--

INSERT INTO `expenses` (`id`, `userid`, `category_id`, `category_name`, `description`, `amount`, `date`) VALUES
(1, 2, 3, 'Electricity', '', 20000.00, '2023-08-11'),
(2, 2, 2, 'food', '', 30000.00, '2023-08-11'),
(3, 2, 1, 'Water', '', 10000.00, '2023-08-11'),
(4, 2, 4, 'internet', '', 15000.00, '2023-08-11'),
(5, 3, 5, 'water', '', 2000.00, '2023-08-11'),
(6, 3, 5, 'water', 'water bill', 2000.00, '2023-08-03'),
(7, 3, 13, 'Electricity bill payment', '', 5000.00, '2023-08-07'),
(8, 3, 9, 'Transportation ', '', 5000.00, '2023-08-08'),
(9, 3, 11, 'Medical & Healthcare', 'with medical testing', 3000.00, '2023-08-08'),
(10, 3, 8, 'food', '', 35000.00, '2023-08-08'),
(11, 3, 12, 'Recreation & Entertainment', 'trip', 5000.00, '2023-08-02'),
(12, 3, 10, 'Insurance', '', 2000.00, '2023-08-05'),
(13, 3, 14, 'Miscellaneous', '', 3000.00, '2023-08-06'),
(14, 3, 15, 'Bussiness', '', 10000.00, '2023-08-07'),
(15, 3, 16, 'Bank loan', '', 10000.00, '2023-08-07'),
(16, 4, 19, 'Bank loan', '', 50000.00, '2023-08-04'),
(17, 4, 17, 'food', '', 20000.00, '2023-08-02'),
(18, 4, 20, 'Electricity bill payment', '', 25000.00, '2023-08-06'),
(19, 4, 18, 'colthes', '', 7000.00, '2023-08-04'),
(20, 5, 22, 'food', '', 24000.00, '2023-08-03'),
(21, 5, 23, 'clothes', '', 12000.00, '2023-08-01'),
(22, 7, 27, 'food', '', 35000.00, '2023-08-11'),
(23, 8, 28, 'food', '', 30000.00, '2023-08-08'),
(24, 9, 29, 'payments', '', 10000.00, '2023-08-08'),
(25, 10, 31, 'food', '', 23000.00, '2023-08-11');

-- --------------------------------------------------------

--
-- Table structure for table `incomecategories`
--

CREATE TABLE `incomecategories` (
  `id` int(11) NOT NULL,
  `category_name` varchar(50) NOT NULL,
  `userid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `incomecategories`
--

INSERT INTO `incomecategories` (`id`, `category_name`, `userid`) VALUES
(1, 'salary', 2),
(2, 'store', 2),
(3, 'monthly salary', 3),
(4, 'Invest In Tea Estate.', 3),
(5, ' Rent House fee', 3),
(10, 'monthly salary', 4),
(11, 'monthly salary', 5),
(12, 'monthly salary', 6),
(13, 'monthly salary', 7),
(14, 'monthly salary', 8),
(15, 'monthly salary', 9),
(16, 'monthly salary', 10);

-- --------------------------------------------------------

--
-- Table structure for table `incomes`
--

CREATE TABLE `incomes` (
  `id` int(10) NOT NULL,
  `userid` int(10) DEFAULT NULL,
  `category_id` int(10) DEFAULT NULL,
  `category_name` varchar(50) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `amount` decimal(10,2) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `incomes`
--

INSERT INTO `incomes` (`id`, `userid`, `category_id`, `category_name`, `description`, `amount`, `date`) VALUES
(1, 2, 1, 'salary', 'Monthly salary', 70000.00, '2023-08-01'),
(2, 2, 2, 'store', '', 30000.00, '2023-08-11'),
(3, 3, 3, 'monthly salary', '', 100000.00, '2023-08-07'),
(4, 3, 4, 'Invest In Tea Estate.', 'monthly income', 60000.00, '2023-08-03'),
(5, 3, 5, ' Rent House fee', '', 40000.00, '2023-08-08'),
(6, 4, 10, 'monthly salary', '', 120000.00, '2023-08-01'),
(7, 5, 11, 'monthly salary', '', 180000.00, '2023-08-11'),
(8, 6, 12, 'monthly salary', '', 100000.00, '2023-08-01'),
(9, 7, 13, 'monthly salary', '', 89000.00, '2023-08-11'),
(10, 8, 14, 'monthly salary', '', 120000.00, '2023-08-11'),
(11, 9, 15, 'monthly salary', '', 90000.00, '2023-08-09'),
(12, 10, 16, 'monthly salary', '', 90000.00, '2023-08-11');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `userid` int(11) NOT NULL,
  `firstName` varchar(50) NOT NULL,
  `lastName` varchar(50) NOT NULL,
  `userName` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`userid`, `firstName`, `lastName`, `userName`, `password`, `role`) VALUES
(1, 'Admin', 'Admin', 'admin@admin', 'f6fdffe48c908deb0f4c3bd36c032e72', 'admin'),
(2, 'Tharindu', 'Deshapriya', 'tharindu@gmail.com', '6a204bd89f3c8348afd5c77c717a097a', 'customer'),
(3, 'Tharushi', 'vithanage', 'tharushididulani@gmail.com', '25d55ad283aa400af464c76d713c07ad', 'customer'),
(4, 'Yashoda', 'Alwis', 'alwis@gmail.com', '94b8cea57c49a3007225a0c70c475450', 'customer'),
(5, 'Fathima', 'Sameera', 'sameera@gmail.com', '6b4dccfb69c362b172bafdfc60c343e1', 'customer'),
(6, 'Nelaxana ', 'DHK', 'nelx@gmail.com', '8ddcff3a80f4189ca1c9d4d902c3c909', 'customer'),
(7, 'Dhanuka', 'Weerasingha', 'dhanu@gmail.com', 'ef800207a3648c7c1ef3e9fe544f17f0', 'customer'),
(8, 'Dinithi', 'Alwis', 'dinithialwis@gmail.com', 'b7e6923f6de66497d51789db0ef3571d', 'customer'),
(9, 'upeksha', 'malshani', 'upeksha@gmail.com', '3028879ab8d5c87dc023049fa5bb5c1a', 'customer'),
(10, 'Dedunu', 'Balasooriya', 'Dedunu@gmail.com', '78d1fe0f0064cf6654940c87d99d4456', 'customer');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `expensecategories`
--
ALTER TABLE `expensecategories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userid` (`userid`);

--
-- Indexes for table `expenses`
--
ALTER TABLE `expenses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userid` (`userid`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `incomecategories`
--
ALTER TABLE `incomecategories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `incomes`
--
ALTER TABLE `incomes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userid` (`userid`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`userid`),
  ADD UNIQUE KEY `userName` (`userName`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `expensecategories`
--
ALTER TABLE `expensecategories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `expenses`
--
ALTER TABLE `expenses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `incomecategories`
--
ALTER TABLE `incomecategories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `incomes`
--
ALTER TABLE `incomes`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `userid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `expenses`
--
ALTER TABLE `expenses`
  ADD CONSTRAINT `expenses_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`);

--
-- Constraints for table `incomes`
--
ALTER TABLE `incomes`
  ADD CONSTRAINT `incomes_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
