-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 01, 2025 at 06:09 AM
-- Server version: 8.0.32
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pmv_invention_disclosure`
--

-- --------------------------------------------------------

--
-- Table structure for table `client`
--

CREATE TABLE `client` (
  `uuid` char(36) NOT NULL,
  `tenant_id` char(36) NOT NULL,
  `client_name` varchar(300) NOT NULL,
  `client_code` int NOT NULL,
  `is_active` tinyint DEFAULT NULL,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `client_division`
--

CREATE TABLE `client_division` (
  `id` char(36) NOT NULL,
  `division_name` varchar(300) DEFAULT NULL,
  `tenant_id` char(36) NOT NULL,
  `client_id` char(36) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` int NOT NULL,
  `name` varchar(300) DEFAULT NULL,
  `code` varchar(300) DEFAULT NULL,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `name`, `code`, `created_on`, `modified_on`) VALUES
(43, 'India', 'IN', '2025-03-04 07:58:49', '2025-03-04 07:58:49'),
(44, 'China', 'CN', '2025-03-04 07:58:49', '2025-03-04 07:58:49'),
(45, 'New Zealand', 'NZ', '2025-03-04 07:58:49', '2025-03-04 07:58:49'),
(46, 'Bangladesh', 'BD', '2025-03-04 07:58:49', '2025-03-04 07:58:49'),
(47, 'Canada', 'CA', '2025-03-04 07:58:49', '2025-03-04 07:58:49'),
(48, 'France', 'FR', '2025-03-04 07:58:49', '2025-03-04 07:58:49'),
(49, 'United State', 'US', '2025-03-04 07:58:49', '2025-03-04 07:58:49'),
(50, 'Singapore', 'SG', '2025-03-04 07:58:49', '2025-03-04 07:58:49'),
(51, 'Nepal', 'NP', '2025-03-04 07:58:49', '2025-03-04 07:58:49'),
(52, 'WIPO', 'WO', '2025-03-04 07:58:49', '2025-03-04 07:58:49'),
(53, 'Serbia', 'RS', '2025-03-04 07:58:49', '2025-03-04 07:58:49'),
(54, 'Australia', 'AU', '2025-03-04 07:58:49', '2025-03-04 07:58:49'),
(55, 'Finland', 'FI', '2025-03-04 07:58:49', '2025-03-04 07:58:49'),
(56, 'Indonesia', 'ID', '2025-03-04 07:58:49', '2025-03-04 07:58:49'),
(57, 'Brazil', 'BR', '2025-03-04 07:58:49', '2025-03-04 07:58:49'),
(58, 'Germany', 'DE', '2025-06-18 21:16:03', '2025-06-18 21:16:03'),
(59, 'Germany', 'DE', '2025-06-18 21:16:06', '2025-06-18 21:16:06'),
(60, 'JAPAN', 'JP', '2025-06-18 21:19:34', '2025-06-18 21:19:34');

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `uuid` char(36) NOT NULL,
  `tenant_id` char(36) NOT NULL,
  `client_id` char(36) NOT NULL,
  `department` varchar(300) NOT NULL,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `docket`
--

CREATE TABLE `docket` (
  `id` int NOT NULL,
  `uuid` char(36) NOT NULL,
  `manual_docket_number` varchar(300) DEFAULT NULL,
  `system_generated_docket_number` varchar(300) NOT NULL,
  `title` varchar(300) NOT NULL,
  `first_filing_date` timestamp(6) NULL DEFAULT NULL,
  `date_of_public_disclosure` timestamp(6) NULL DEFAULT NULL,
  `temp_number` int NOT NULL,
  `client_id` char(36) NOT NULL,
  `client_division_id` char(36) DEFAULT NULL,
  `status_id` int DEFAULT NULL,
  `department_id` char(36) NOT NULL,
  `added_by` char(36) DEFAULT NULL,
  `current_status_date` timestamp(6) NULL DEFAULT NULL,
  `deleted` tinyint NOT NULL DEFAULT '0',
  `archived` tinyint NOT NULL DEFAULT '0',
  `archive_date` timestamp(6) NULL DEFAULT NULL,
  `archived_by` char(36) DEFAULT NULL,
  `send_for_review` tinyint DEFAULT '0',
  `dr_link` varchar(300) DEFAULT NULL,
  `annuity_timeline` timestamp(6) NULL DEFAULT NULL,
  `deadline_for_filing` timestamp(6) NULL DEFAULT NULL,
  `filing_entity_id` int DEFAULT NULL,
  `filing_maintenance_cost` decimal(20,10) DEFAULT NULL,
  `filing_type_id` int DEFAULT NULL,
  `first_filing_country_id` int DEFAULT NULL,
  `foreign_license_required` tinyint NOT NULL DEFAULT '0',
  `appid` char(36) DEFAULT NULL,
  `tenant_id` char(36) NOT NULL,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `docket_attachment_mapping`
--

CREATE TABLE `docket_attachment_mapping` (
  `id` int NOT NULL,
  `docket_id` int DEFAULT NULL,
  `uploaded_by` char(36) DEFAULT NULL,
  `location` varchar(300) DEFAULT NULL,
  `file_name` varchar(300) DEFAULT NULL,
  `tenant_id` char(36) NOT NULL,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `client_id` char(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `docket_logs`
--

CREATE TABLE `docket_logs` (
  `id` int NOT NULL,
  `logs` varchar(500) NOT NULL,
  `docket_id` int NOT NULL,
  `added_by` char(36) NOT NULL,
  `added_date` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `tenant_id` char(36) NOT NULL,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `client_id` char(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `docket_user_role_mapping`
--

CREATE TABLE `docket_user_role_mapping` (
  `id` int NOT NULL,
  `user_id` char(36) NOT NULL,
  `role_id` int NOT NULL,
  `docket_id` int NOT NULL,
  `deleted` tinyint NOT NULL DEFAULT '0',
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `filing_entity_type`
--

CREATE TABLE `filing_entity_type` (
  `id` int NOT NULL,
  `name` varchar(300) DEFAULT NULL,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `filing_entity_type`
--

INSERT INTO `filing_entity_type` (`id`, `name`, `created_on`, `modified_on`) VALUES
(1, 'Small', '2025-06-17 11:00:06', '2025-06-17 11:00:06'),
(2, 'Large', '2025-06-17 11:00:06', '2025-06-17 11:00:06'),
(3, 'Micro', '2025-06-17 11:00:06', '2025-06-17 11:00:06'),
(4, 'Individual', '2025-06-17 11:00:06', '2025-06-17 11:00:06'),
(5, 'Startup', '2025-06-17 11:00:06', '2025-06-17 11:00:06'),
(6, 'Others', '2025-06-17 11:00:06', '2025-06-17 11:00:06');

-- --------------------------------------------------------

--
-- Table structure for table `filing_type`
--

CREATE TABLE `filing_type` (
  `id` int NOT NULL,
  `name` varchar(300) DEFAULT NULL,
  `code` varchar(300) DEFAULT NULL,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `filing_type`
--

INSERT INTO `filing_type` (`id`, `name`, `code`, `created_on`, `modified_on`) VALUES
(1, 'Provisional', 'P', '2025-03-07 07:52:57', '2025-03-07 07:52:57'),
(2, 'Non-Provisional', 'NP', '2025-03-07 07:52:57', '2025-03-07 07:52:57'),
(3, 'PCT Application', 'PCT', '2025-03-07 07:52:57', '2025-03-07 07:52:57');

-- --------------------------------------------------------

--
-- Table structure for table `foreign_filing_countries`
--

CREATE TABLE `foreign_filing_countries` (
  `id` int NOT NULL,
  `country_id` int NOT NULL,
  `docket_id` int NOT NULL,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `id` int NOT NULL,
  `role` varchar(300) NOT NULL,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id`, `role`, `created_on`, `modified_on`) VALUES
(1, 'App-admin', '2025-03-07 07:54:31', '2025-03-07 07:54:31'),
(2, 'Executive', '2025-03-07 07:54:31', '2025-03-07 07:54:31'),
(3, 'Inventor', '2025-03-07 07:54:31', '2025-03-07 07:54:31'),
(4, 'Patent Agent', '2025-03-07 07:54:31', '2025-03-07 07:54:31'),
(5, 'Paralegal', '2025-03-07 07:54:31', '2025-03-07 07:54:31'),
(6, 'Manager(Internal)', '2025-03-07 07:54:31', '2025-03-07 07:54:31'),
(7, 'Drafter', '2025-03-07 07:54:31', '2025-03-07 07:54:31'),
(8, 'Analyst', '2025-03-07 07:54:31', '2025-03-07 07:54:31'),
(9, 'Outside Agent', '2025-03-07 07:54:31', '2025-03-07 07:54:31'),
(10, 'Reviewer', '2025-03-07 07:54:31', '2025-03-07 07:54:31'),
(11, 'App-user', '2025-03-07 07:54:31', '2025-03-07 07:54:31');

-- --------------------------------------------------------

--
-- Table structure for table `status`
--

CREATE TABLE `status` (
  `id` int NOT NULL,
  `status` varchar(300) NOT NULL,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `status`
--

INSERT INTO `status` (`id`, `status`, `created_on`, `modified_on`) VALUES
(1, 'Abandoned', '2025-03-07 07:55:43', '2025-03-07 07:55:54'),
(2, 'Rated To File', '2025-03-07 07:55:43', '2025-03-07 07:55:54'),
(3, 'Hold', '2025-03-07 07:55:43', '2025-03-07 07:55:54'),
(4, 'Rated To Publish', '2025-03-07 07:55:43', '2025-03-07 07:55:54'),
(5, 'Open', '2025-03-07 07:55:43', '2025-03-07 07:55:54'),
(6, 'Trade Secret', '2025-03-07 07:55:43', '2025-03-07 07:55:54'),
(7, 'Not Yet Rated', '2025-03-07 07:55:43', '2025-03-07 07:55:54'),
(8, 'Active', '2025-03-07 07:55:43', '2025-03-07 07:55:54'),
(9, 'Complete', '2025-03-07 07:55:43', '2025-03-07 07:55:54');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `full_name` varchar(300) NOT NULL,
  `uuid` char(36) NOT NULL,
  `first_name` varchar(300) NOT NULL,
  `last_name` varchar(300) NOT NULL,
  `tenant_id` char(36) NOT NULL,
  `deleted` tinyint NOT NULL DEFAULT '0',
  `inactive` tinyint NOT NULL DEFAULT '0',
  `address` varchar(300) DEFAULT NULL,
  `contact` varchar(300) DEFAULT NULL,
  `email` varchar(300) DEFAULT NULL,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`full_name`, `uuid`, `first_name`, `last_name`, `tenant_id`, `deleted`, `inactive`, `address`, `contact`, `email`, `created_on`, `modified_on`) VALUES
('Admin Tekip', '48d3dec2-5630-11f0-b52d-1c1b0dc95d26', 'Admin', 'Tekip', 'df234305-8a47-4b4d-8efb-716a6b695428', 0, 0, NULL, NULL, 'admin@tekip.com', '2025-07-01 04:03:02', '2025-07-01 04:03:02');

-- --------------------------------------------------------

--
-- Table structure for table `user_tenant_client_mapping`
--

CREATE TABLE `user_tenant_client_mapping` (
  `id` int NOT NULL,
  `user_id` char(36) NOT NULL,
  `tenant_id` char(36) NOT NULL,
  `client_id` char(36) NOT NULL,
  `active` tinyint NOT NULL,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`uuid`);

--
-- Indexes for table `client_division`
--
ALTER TABLE `client_division`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_id` (`client_id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`uuid`),
  ADD KEY `client_id` (`client_id`);

--
-- Indexes for table `docket`
--
ALTER TABLE `docket`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_id` (`client_id`),
  ADD KEY `status_id` (`status_id`),
  ADD KEY `department_id` (`department_id`),
  ADD KEY `added_by` (`added_by`),
  ADD KEY `archived_by` (`archived_by`),
  ADD KEY `client_division_id` (`client_division_id`),
  ADD KEY `filing_entity_id` (`filing_entity_id`),
  ADD KEY `filing_type_id` (`filing_type_id`),
  ADD KEY `first_filing_country_id` (`first_filing_country_id`);

--
-- Indexes for table `docket_attachment_mapping`
--
ALTER TABLE `docket_attachment_mapping`
  ADD PRIMARY KEY (`id`),
  ADD KEY `docket_id` (`docket_id`),
  ADD KEY `uploaded_by` (`uploaded_by`);

--
-- Indexes for table `docket_logs`
--
ALTER TABLE `docket_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `added_by` (`added_by`),
  ADD KEY `docket_id` (`docket_id`);

--
-- Indexes for table `docket_user_role_mapping`
--
ALTER TABLE `docket_user_role_mapping`
  ADD PRIMARY KEY (`id`),
  ADD KEY `docket_user_role_mapping_ibfk_1` (`docket_id`),
  ADD KEY `docket_user_role_mapping_ibfk_2` (`role_id`),
  ADD KEY `docket_user_role_mapping_ibfk_3` (`user_id`);

--
-- Indexes for table `filing_entity_type`
--
ALTER TABLE `filing_entity_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `filing_type`
--
ALTER TABLE `filing_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `foreign_filing_countries`
--
ALTER TABLE `foreign_filing_countries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `country_id` (`country_id`),
  ADD KEY `docket_id` (`docket_id`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`uuid`);

--
-- Indexes for table `user_tenant_client_mapping`
--
ALTER TABLE `user_tenant_client_mapping`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `client_id` (`client_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `docket`
--
ALTER TABLE `docket`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `docket_attachment_mapping`
--
ALTER TABLE `docket_attachment_mapping`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `docket_logs`
--
ALTER TABLE `docket_logs`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `docket_user_role_mapping`
--
ALTER TABLE `docket_user_role_mapping`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `filing_entity_type`
--
ALTER TABLE `filing_entity_type`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `filing_type`
--
ALTER TABLE `filing_type`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `foreign_filing_countries`
--
ALTER TABLE `foreign_filing_countries`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `status`
--
ALTER TABLE `status`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `user_tenant_client_mapping`
--
ALTER TABLE `user_tenant_client_mapping`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `client_division`
--
ALTER TABLE `client_division`
  ADD CONSTRAINT `client_division_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `client` (`uuid`);

--
-- Constraints for table `department`
--
ALTER TABLE `department`
  ADD CONSTRAINT `department_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `client` (`uuid`);

--
-- Constraints for table `docket`
--
ALTER TABLE `docket`
  ADD CONSTRAINT `docket_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `client` (`uuid`),
  ADD CONSTRAINT `docket_ibfk_2` FOREIGN KEY (`status_id`) REFERENCES `status` (`id`),
  ADD CONSTRAINT `docket_ibfk_3` FOREIGN KEY (`department_id`) REFERENCES `department` (`uuid`),
  ADD CONSTRAINT `docket_ibfk_4` FOREIGN KEY (`added_by`) REFERENCES `user` (`uuid`),
  ADD CONSTRAINT `docket_ibfk_5` FOREIGN KEY (`archived_by`) REFERENCES `user` (`uuid`),
  ADD CONSTRAINT `docket_ibfk_6` FOREIGN KEY (`client_division_id`) REFERENCES `client_division` (`id`),
  ADD CONSTRAINT `docket_ibfk_7` FOREIGN KEY (`filing_entity_id`) REFERENCES `filing_entity_type` (`id`),
  ADD CONSTRAINT `docket_ibfk_8` FOREIGN KEY (`filing_type_id`) REFERENCES `filing_type` (`id`),
  ADD CONSTRAINT `docket_ibfk_9` FOREIGN KEY (`first_filing_country_id`) REFERENCES `countries` (`id`);

--
-- Constraints for table `docket_attachment_mapping`
--
ALTER TABLE `docket_attachment_mapping`
  ADD CONSTRAINT `docket_attachment_mapping_ibfk_1` FOREIGN KEY (`docket_id`) REFERENCES `docket` (`id`),
  ADD CONSTRAINT `docket_attachment_mapping_ibfk_2` FOREIGN KEY (`uploaded_by`) REFERENCES `user` (`uuid`);

--
-- Constraints for table `docket_logs`
--
ALTER TABLE `docket_logs`
  ADD CONSTRAINT `docket_logs_ibfk_1` FOREIGN KEY (`added_by`) REFERENCES `user` (`uuid`),
  ADD CONSTRAINT `docket_logs_ibfk_2` FOREIGN KEY (`docket_id`) REFERENCES `docket` (`id`);

--
-- Constraints for table `docket_user_role_mapping`
--
ALTER TABLE `docket_user_role_mapping`
  ADD CONSTRAINT `docket_user_role_mapping_ibfk_1` FOREIGN KEY (`docket_id`) REFERENCES `docket` (`id`),
  ADD CONSTRAINT `docket_user_role_mapping_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`),
  ADD CONSTRAINT `docket_user_role_mapping_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `user` (`uuid`);

--
-- Constraints for table `foreign_filing_countries`
--
ALTER TABLE `foreign_filing_countries`
  ADD CONSTRAINT `foreign_filing_countries_ibfk_1` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`),
  ADD CONSTRAINT `foreign_filing_countries_ibfk_2` FOREIGN KEY (`docket_id`) REFERENCES `docket` (`id`);

--
-- Constraints for table `user_tenant_client_mapping`
--
ALTER TABLE `user_tenant_client_mapping`
  ADD CONSTRAINT `user_tenant_client_mapping_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `client` (`uuid`),
  ADD CONSTRAINT `user_tenant_client_mapping_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`uuid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
