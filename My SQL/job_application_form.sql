-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 13, 2022 at 03:45 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.0.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `job_application_form`
--

-- --------------------------------------------------------

--
-- Table structure for table `user_basic_detail`
--

CREATE TABLE `user_basic_detail` (
  `user_id` int(10) NOT NULL,
  `firstname` varchar(30) NOT NULL,
  `lastname` varchar(30) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `designation` varchar(50) DEFAULT NULL,
  `address1` varchar(30) NOT NULL,
  `address2` varchar(30) NOT NULL,
  `gender` varchar(30) NOT NULL,
  `zipcode` varchar(30) NOT NULL,
  `city` varchar(30) NOT NULL,
  `state` varchar(30) NOT NULL,
  `relationship` varchar(30) NOT NULL,
  `dob` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `user_eduction_detail`
--

CREATE TABLE `user_eduction_detail` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_exams` varchar(50) NOT NULL,
  `name_of_board` varchar(50) NOT NULL,
  `course_name` varchar(50) NOT NULL,
  `univercity` varchar(50) NOT NULL,
  `passing_year` int(4) NOT NULL,
  `user_percentage` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `user_language_known`
--

CREATE TABLE `user_language_known` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `language` varchar(50) NOT NULL,
  `read` varchar(30) NOT NULL,
  `write` varchar(30) NOT NULL,
  `speak` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `user_preferances`
--

CREATE TABLE `user_preferances` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `preferd_location` varchar(10) NOT NULL,
  `notice_period` varchar(10) NOT NULL,
  `expacted_ctc` varchar(10) NOT NULL,
  `current_ctc` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `user_referance_contact`
--

CREATE TABLE `user_referance_contact` (
  `id` int(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  `ref_name` varchar(30) NOT NULL,
  `ref_number` varchar(30) NOT NULL,
  `ref_relation` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `user_technology_knows`
--

CREATE TABLE `user_technology_knows` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `technology` varchar(20) NOT NULL,
  `technology_level` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `user_work_experience`
--

CREATE TABLE `user_work_experience` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `company_name` varchar(50) NOT NULL,
  `designation` varchar(50) NOT NULL,
  `from_date` date NOT NULL,
  `to_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `user_basic_detail`
--
ALTER TABLE `user_basic_detail`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `user_eduction_detail`
--
ALTER TABLE `user_eduction_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `user_language_known`
--
ALTER TABLE `user_language_known`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `user_preferances`
--
ALTER TABLE `user_preferances`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_referance_contact`
--
ALTER TABLE `user_referance_contact`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `user_technology_knows`
--
ALTER TABLE `user_technology_knows`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `user_work_experience`
--
ALTER TABLE `user_work_experience`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `user_id` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `user_basic_detail`
--
ALTER TABLE `user_basic_detail`
  MODIFY `user_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `user_eduction_detail`
--
ALTER TABLE `user_eduction_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `user_language_known`
--
ALTER TABLE `user_language_known`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `user_preferances`
--
ALTER TABLE `user_preferances`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `user_referance_contact`
--
ALTER TABLE `user_referance_contact`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `user_technology_knows`
--
ALTER TABLE `user_technology_knows`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `user_work_experience`
--
ALTER TABLE `user_work_experience`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `user_eduction_detail`
--
ALTER TABLE `user_eduction_detail`
  ADD CONSTRAINT `user_eduction_detail_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_basic_detail` (`user_id`);

--
-- Constraints for table `user_language_known`
--
ALTER TABLE `user_language_known`
  ADD CONSTRAINT `user_language_known_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_basic_detail` (`user_id`);

--
-- Constraints for table `user_referance_contact`
--
ALTER TABLE `user_referance_contact`
  ADD CONSTRAINT `user_referance_contact_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_basic_detail` (`user_id`);

--
-- Constraints for table `user_technology_knows`
--
ALTER TABLE `user_technology_knows`
  ADD CONSTRAINT `user_technology_knows_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_basic_detail` (`user_id`);

--
-- Constraints for table `user_work_experience`
--
ALTER TABLE `user_work_experience`
  ADD CONSTRAINT `user_work_experience_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_basic_detail` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
