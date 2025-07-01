-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 01, 2025 at 05:58 AM
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
-- Database: `pmv_dr`
--

-- --------------------------------------------------------

--
-- Table structure for table `activation_details`
--

CREATE TABLE `activation_details` (
  `id` int NOT NULL,
  `docket_id` int NOT NULL,
  `activated_by` char(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `activation_date` datetime NOT NULL,
  `comments` text,
  `is_current_review` tinyint(1) DEFAULT '1',
  `ranking_status_id` int NOT NULL DEFAULT '1' COMMENT '1 - YET TO START, 2 - IN-PROGRESS, 3 - COMPLETED',
  `tenant_id` char(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `client_id` char(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `created_on` datetime NOT NULL,
  `modified_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `activity_logs`
--

CREATE TABLE `activity_logs` (
  `id` int NOT NULL,
  `docket_id` int NOT NULL,
  `message` text NOT NULL,
  `added_by` char(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `tenant_id` char(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `client_id` char(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `created_on` datetime NOT NULL,
  `modified_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `client`
--

CREATE TABLE `client` (
  `uuid` char(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `client_name` varchar(100) NOT NULL,
  `client_code` int NOT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `tenant_id` char(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `created_on` datetime NOT NULL,
  `modified_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `uuid` char(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `department` varchar(100) NOT NULL,
  `tenant_id` char(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `client_id` char(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `created_on` datetime NOT NULL,
  `modified_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `department_criteria_mapping`
--

CREATE TABLE `department_criteria_mapping` (
  `id` int NOT NULL,
  `department_id` char(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `parent_criteria_id` int NOT NULL,
  `created_on` datetime NOT NULL,
  `modified_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `docket`
--

CREATE TABLE `docket` (
  `id` int NOT NULL,
  `uuid` char(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `manual_docket_number` varchar(100) DEFAULT NULL,
  `system_generated_docket_number` varchar(100) DEFAULT NULL,
  `title` varchar(300) NOT NULL,
  `client_id` char(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `department_id` char(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `added_by` char(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `patent_agent_id` char(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `first_filing_date` datetime DEFAULT NULL,
  `date_of_public_disclosure` datetime DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `archived` tinyint(1) DEFAULT '0',
  `is_sent_to_drafting` tinyint(1) DEFAULT '0',
  `drafting_link` varchar(300) DEFAULT NULL,
  `first_filing_country_id` int NOT NULL,
  `tenant_id` char(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `created_on` datetime NOT NULL,
  `modified_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `docket_attachment_mapping`
--

CREATE TABLE `docket_attachment_mapping` (
  `id` int NOT NULL,
  `docket_id` int NOT NULL,
  `uploaded_by` char(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `location` varchar(255) NOT NULL,
  `tenant_id` char(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `client_id` char(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `created_on` datetime NOT NULL,
  `modified_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `docket_inventors_mapping`
--

CREATE TABLE `docket_inventors_mapping` (
  `id` int NOT NULL,
  `docket_id` int NOT NULL,
  `inventor_id` char(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `created_on` datetime NOT NULL,
  `modified_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `docket_keywords_mapping`
--

CREATE TABLE `docket_keywords_mapping` (
  `id` int NOT NULL,
  `docket_id` int NOT NULL,
  `keyword_id` int NOT NULL,
  `added_by` char(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `tenant_id` char(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `client_id` char(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `created_on` datetime NOT NULL,
  `modified_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `docket_reviewers_mapping`
--

CREATE TABLE `docket_reviewers_mapping` (
  `id` int NOT NULL,
  `docket_id` int NOT NULL,
  `reviewer_id` char(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `created_on` datetime NOT NULL,
  `modified_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `docket_status_mapping`
--

CREATE TABLE `docket_status_mapping` (
  `id` int NOT NULL,
  `docket_id` int NOT NULL,
  `current_status_id` int NOT NULL,
  `current_status_date` datetime NOT NULL,
  `source_id` int DEFAULT NULL,
  `comment` text,
  `added_by` char(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `is_current` tinyint(1) DEFAULT '1',
  `activation_id` int DEFAULT NULL,
  `tenant_id` char(36) NOT NULL,
  `client_id` char(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `created_on` datetime NOT NULL,
  `modified_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `keywords`
--

CREATE TABLE `keywords` (
  `id` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `tenant_id` char(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `client_id` char(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `created_on` datetime NOT NULL,
  `modified_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `outside_agent_ranking_details`
--

CREATE TABLE `outside_agent_ranking_details` (
  `id` int NOT NULL,
  `activation_id` int NOT NULL,
  `selected_criteria_id` int NOT NULL,
  `created_on` datetime NOT NULL,
  `modified_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `ranking_criteria`
--

CREATE TABLE `ranking_criteria` (
  `id` int NOT NULL,
  `criteria_name` varchar(255) NOT NULL,
  `parent_id` int DEFAULT NULL,
  `criteria_points` int DEFAULT NULL,
  `visibility` tinyint(1) DEFAULT '1',
  `created_on` datetime NOT NULL,
  `modified_on` datetime NOT NULL,
  `deletedAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `ranking_criteria`
--

INSERT INTO `ranking_criteria` (`id`, `criteria_name`, `parent_id`, `criteria_points`, `visibility`, `created_on`, `modified_on`, `deletedAt`) VALUES
(1, 'Economic Impact ( EI )', NULL, 0, 1, '2025-03-07 08:24:21', '2025-03-07 08:24:21', NULL),
(2, 'No Opinion', 1, 1, 1, '2025-03-07 08:24:21', '2025-03-07 08:24:21', NULL),
(3, 'Low or unknown commercial interest in product/process/application.', 1, 1, 1, '2025-03-07 08:24:21', '2025-03-07 08:24:21', NULL),
(4, 'Covers products/processes expected to generate less than $50MM/year in sales and/or actual licensing revenue.Covers products/processes expected to generate less than $50MM/year in sales and/or actual licensing revenue.', 1, 1, 1, '2025-03-07 08:24:21', '2025-03-07 08:24:21', NULL),
(5, 'Covers products/processes expected to generate in excess of $50MM/year in sales and/or actual licensing revenue.', 1, 1, 1, '2025-03-07 08:24:21', '2025-03-07 08:24:21', NULL),
(6, 'Competency project', 1, 1, 1, '2025-03-07 08:24:21', '2025-03-07 08:24:21', NULL),
(7, 'Market Interests ( MI )', NULL, 0, 1, '2025-03-07 08:24:21', '2025-03-07 08:24:21', NULL),
(8, 'Criteria 1', 7, 1, 1, '2025-03-07 08:24:21', '2025-03-07 08:24:21', NULL),
(9, 'Criteria 2', 7, 1, 1, '2025-03-07 08:24:21', '2025-03-07 08:24:21', NULL),
(10, 'Criteria 3', 7, 1, 1, '2025-03-07 08:24:21', '2025-03-07 08:24:21', NULL),
(11, 'Criteria 4', 7, 1, 1, '2025-03-07 08:24:21', '2025-03-07 08:24:21', NULL),
(12, 'Criteria 5', 7, 1, 1, '2025-03-07 08:24:21', '2025-03-07 08:24:21', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ranking_status`
--

CREATE TABLE `ranking_status` (
  `id` int NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `ranking_status`
--

INSERT INTO `ranking_status` (`id`, `name`) VALUES
(1, 'YET TO START'),
(2, 'IN-PROGRESS'),
(3, 'COMPLETED');

-- --------------------------------------------------------

--
-- Table structure for table `review_details`
--

CREATE TABLE `review_details` (
  `id` int NOT NULL,
  `activation_id` int NOT NULL,
  `reviewer_id` char(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `comments` text,
  `created_on` datetime NOT NULL,
  `modified_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `review_ranking_details`
--

CREATE TABLE `review_ranking_details` (
  `id` int NOT NULL,
  `review_details_id` int NOT NULL,
  `selected_criteria_id` int NOT NULL,
  `created_on` datetime NOT NULL,
  `modified_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int NOT NULL,
  `role` varchar(50) NOT NULL,
  `created_on` datetime NOT NULL,
  `modified_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `role`, `created_on`, `modified_on`) VALUES
(1, 'Admin', '2025-03-07 08:26:50', '2025-03-07 08:26:50'),
(2, 'Executive', '2025-03-07 08:26:50', '2025-03-07 08:26:50'),
(3, 'Inventor', '2025-03-07 08:26:50', '2025-03-07 08:26:50'),
(4, 'Patent Agent', '2025-03-07 08:26:50', '2025-03-07 08:26:50'),
(5, 'Paralegal', '2025-03-07 08:26:50', '2025-03-07 08:26:50'),
(6, 'Manager(Internal)', '2025-03-07 08:26:50', '2025-03-07 08:26:50'),
(7, 'Drafter', '2025-03-07 08:26:50', '2025-03-07 08:26:50'),
(8, 'Analyst', '2025-03-07 08:26:50', '2025-03-07 08:26:50'),
(9, 'Outside Agent', '2025-03-07 08:26:50', '2025-03-07 08:26:50'),
(10, 'Reviewer', '2025-03-07 08:26:50', '2025-03-07 08:26:50');

-- --------------------------------------------------------

--
-- Table structure for table `status`
--

CREATE TABLE `status` (
  `id` int NOT NULL,
  `status` varchar(100) NOT NULL,
  `created_on` datetime NOT NULL,
  `modified_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `status`
--

INSERT INTO `status` (`id`, `status`, `created_on`, `modified_on`) VALUES
(1, 'Abandoned', '2025-03-07 08:27:21', '2025-03-07 08:27:21'),
(2, 'Rated To File', '2025-03-07 08:27:21', '2025-03-07 08:27:21'),
(3, 'Hold', '2025-03-07 08:27:21', '2025-03-07 08:27:21'),
(4, 'Rated To Publish', '2025-03-07 08:27:21', '2025-03-07 08:27:21'),
(5, 'Open', '2025-03-07 08:27:21', '2025-03-07 08:27:21'),
(6, 'Trade Secret', '2025-03-07 08:27:21', '2025-03-07 08:27:21'),
(7, 'Not Yet Rated', '2025-03-07 08:27:21', '2025-03-07 08:27:21'),
(8, 'Active', '2025-03-07 08:27:21', '2025-03-07 08:27:21'),
(9, 'Complete', '2025-03-07 08:27:21', '2025-03-07 08:27:21');

-- --------------------------------------------------------

--
-- Table structure for table `status_history`
--

CREATE TABLE `status_history` (
  `id` int NOT NULL,
  `docket_id` int NOT NULL,
  `status_id` int NOT NULL,
  `created_on` datetime NOT NULL,
  `modified_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `status_source`
--

CREATE TABLE `status_source` (
  `id` int NOT NULL,
  `name` varchar(50) NOT NULL,
  `created_on` datetime NOT NULL,
  `modified_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `status_source`
--

INSERT INTO `status_source` (`id`, `name`, `created_on`, `modified_on`) VALUES
(1, 'Internal', '2024-08-23 17:28:28', '2024-08-23 17:28:28'),
(2, 'External', '2024-08-23 17:28:28', '2024-08-23 17:28:28'),
(3, 'Memotech', '2024-08-23 17:28:28', '2024-08-23 17:28:28');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `uuid` char(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `contact` varchar(255) DEFAULT NULL,
  `inactive` tinyint(1) DEFAULT '0',
  `tenant_id` char(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `created_on` datetime NOT NULL,
  `modified_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`uuid`, `first_name`, `last_name`, `full_name`, `email`, `address`, `contact`, `inactive`, `tenant_id`, `created_on`, `modified_on`) VALUES
('bf255bcc-e2db-4d47-8e3e-5b8b7b4f105d', 'Admin', 'Tekip', 'Admin Tekip', 'admin.tekip@example.com', NULL, NULL, 0, 'df234305-8a47-4b4d-8efb-716a6b695428', '2025-06-23 23:30:26', '2025-06-23 23:30:26');

-- --------------------------------------------------------

--
-- Table structure for table `user_tenant_client_mapping`
--

CREATE TABLE `user_tenant_client_mapping` (
  `id` int NOT NULL,
  `user_id` char(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `tenant_id` char(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `client_id` char(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `created_on` datetime NOT NULL,
  `modified_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activation_details`
--
ALTER TABLE `activation_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `docket_id` (`docket_id`),
  ADD KEY `activated_by` (`activated_by`),
  ADD KEY `ranking_status_id` (`ranking_status_id`);

--
-- Indexes for table `activity_logs`
--
ALTER TABLE `activity_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `docket_id` (`docket_id`),
  ADD KEY `added_by` (`added_by`);

--
-- Indexes for table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`uuid`),
  ADD UNIQUE KEY `client_name` (`client_name`),
  ADD UNIQUE KEY `client_code` (`client_code`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`uuid`);

--
-- Indexes for table `department_criteria_mapping`
--
ALTER TABLE `department_criteria_mapping`
  ADD PRIMARY KEY (`id`),
  ADD KEY `department_id` (`department_id`),
  ADD KEY `parent_criteria_id` (`parent_criteria_id`);

--
-- Indexes for table `docket`
--
ALTER TABLE `docket`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_id` (`client_id`),
  ADD KEY `department_id` (`department_id`),
  ADD KEY `added_by` (`added_by`),
  ADD KEY `patent_agent_id` (`patent_agent_id`);

--
-- Indexes for table `docket_attachment_mapping`
--
ALTER TABLE `docket_attachment_mapping`
  ADD PRIMARY KEY (`id`),
  ADD KEY `docket_id` (`docket_id`),
  ADD KEY `uploaded_by` (`uploaded_by`);

--
-- Indexes for table `docket_inventors_mapping`
--
ALTER TABLE `docket_inventors_mapping`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `docketId_inventorId` (`docket_id`,`inventor_id`),
  ADD KEY `inventor_id` (`inventor_id`);

--
-- Indexes for table `docket_keywords_mapping`
--
ALTER TABLE `docket_keywords_mapping`
  ADD PRIMARY KEY (`id`),
  ADD KEY `docket_id` (`docket_id`),
  ADD KEY `keyword_id` (`keyword_id`),
  ADD KEY `added_by` (`added_by`);

--
-- Indexes for table `docket_reviewers_mapping`
--
ALTER TABLE `docket_reviewers_mapping`
  ADD PRIMARY KEY (`id`),
  ADD KEY `docket_id` (`docket_id`),
  ADD KEY `reviewer_id` (`reviewer_id`);

--
-- Indexes for table `docket_status_mapping`
--
ALTER TABLE `docket_status_mapping`
  ADD PRIMARY KEY (`id`),
  ADD KEY `docket_id` (`docket_id`),
  ADD KEY `current_status_id` (`current_status_id`),
  ADD KEY `source_id` (`source_id`),
  ADD KEY `added_by` (`added_by`),
  ADD KEY `activation_id` (`activation_id`);

--
-- Indexes for table `keywords`
--
ALTER TABLE `keywords`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `outside_agent_ranking_details`
--
ALTER TABLE `outside_agent_ranking_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `activation_id` (`activation_id`),
  ADD KEY `selected_criteria_id` (`selected_criteria_id`);

--
-- Indexes for table `ranking_criteria`
--
ALTER TABLE `ranking_criteria`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent_id` (`parent_id`);

--
-- Indexes for table `ranking_status`
--
ALTER TABLE `ranking_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `review_details`
--
ALTER TABLE `review_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `activation_id` (`activation_id`),
  ADD KEY `reviewer_id` (`reviewer_id`);

--
-- Indexes for table `review_ranking_details`
--
ALTER TABLE `review_ranking_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `review_details_id` (`review_details_id`),
  ADD KEY `selected_criteria_id` (`selected_criteria_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `status_history`
--
ALTER TABLE `status_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `docket_id` (`docket_id`),
  ADD KEY `status_id` (`status_id`);

--
-- Indexes for table `status_source`
--
ALTER TABLE `status_source`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
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
-- AUTO_INCREMENT for table `activation_details`
--
ALTER TABLE `activation_details`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `activity_logs`
--
ALTER TABLE `activity_logs`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `department_criteria_mapping`
--
ALTER TABLE `department_criteria_mapping`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

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
-- AUTO_INCREMENT for table `docket_inventors_mapping`
--
ALTER TABLE `docket_inventors_mapping`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `docket_keywords_mapping`
--
ALTER TABLE `docket_keywords_mapping`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `docket_reviewers_mapping`
--
ALTER TABLE `docket_reviewers_mapping`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `docket_status_mapping`
--
ALTER TABLE `docket_status_mapping`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `keywords`
--
ALTER TABLE `keywords`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `outside_agent_ranking_details`
--
ALTER TABLE `outside_agent_ranking_details`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ranking_criteria`
--
ALTER TABLE `ranking_criteria`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `ranking_status`
--
ALTER TABLE `ranking_status`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `review_details`
--
ALTER TABLE `review_details`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `review_ranking_details`
--
ALTER TABLE `review_ranking_details`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `status`
--
ALTER TABLE `status`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `status_history`
--
ALTER TABLE `status_history`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `status_source`
--
ALTER TABLE `status_source`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user_tenant_client_mapping`
--
ALTER TABLE `user_tenant_client_mapping`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `activation_details`
--
ALTER TABLE `activation_details`
  ADD CONSTRAINT `activation_details_ibfk_10` FOREIGN KEY (`docket_id`) REFERENCES `docket` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `activation_details_ibfk_11` FOREIGN KEY (`activated_by`) REFERENCES `users` (`uuid`) ON UPDATE CASCADE,
  ADD CONSTRAINT `activation_details_ibfk_12` FOREIGN KEY (`ranking_status_id`) REFERENCES `ranking_status` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `activity_logs`
--
ALTER TABLE `activity_logs`
  ADD CONSTRAINT `activity_logs_ibfk_7` FOREIGN KEY (`docket_id`) REFERENCES `docket` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `activity_logs_ibfk_8` FOREIGN KEY (`added_by`) REFERENCES `users` (`uuid`) ON UPDATE CASCADE;

--
-- Constraints for table `department_criteria_mapping`
--
ALTER TABLE `department_criteria_mapping`
  ADD CONSTRAINT `department_criteria_mapping_ibfk_7` FOREIGN KEY (`department_id`) REFERENCES `department` (`uuid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `department_criteria_mapping_ibfk_8` FOREIGN KEY (`parent_criteria_id`) REFERENCES `ranking_criteria` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `docket`
--
ALTER TABLE `docket`
  ADD CONSTRAINT `docket_ibfk_13` FOREIGN KEY (`client_id`) REFERENCES `client` (`uuid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `docket_ibfk_14` FOREIGN KEY (`department_id`) REFERENCES `department` (`uuid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `docket_ibfk_15` FOREIGN KEY (`added_by`) REFERENCES `users` (`uuid`) ON UPDATE CASCADE,
  ADD CONSTRAINT `docket_ibfk_16` FOREIGN KEY (`patent_agent_id`) REFERENCES `users` (`uuid`) ON UPDATE CASCADE;

--
-- Constraints for table `docket_attachment_mapping`
--
ALTER TABLE `docket_attachment_mapping`
  ADD CONSTRAINT `docket_attachment_mapping_ibfk_7` FOREIGN KEY (`docket_id`) REFERENCES `docket` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `docket_attachment_mapping_ibfk_8` FOREIGN KEY (`uploaded_by`) REFERENCES `users` (`uuid`) ON UPDATE CASCADE;

--
-- Constraints for table `docket_inventors_mapping`
--
ALTER TABLE `docket_inventors_mapping`
  ADD CONSTRAINT `docket_inventors_mapping_ibfk_7` FOREIGN KEY (`docket_id`) REFERENCES `docket` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `docket_inventors_mapping_ibfk_8` FOREIGN KEY (`inventor_id`) REFERENCES `users` (`uuid`) ON UPDATE CASCADE;

--
-- Constraints for table `docket_keywords_mapping`
--
ALTER TABLE `docket_keywords_mapping`
  ADD CONSTRAINT `docket_keywords_mapping_ibfk_10` FOREIGN KEY (`docket_id`) REFERENCES `docket` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `docket_keywords_mapping_ibfk_11` FOREIGN KEY (`keyword_id`) REFERENCES `keywords` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `docket_keywords_mapping_ibfk_12` FOREIGN KEY (`added_by`) REFERENCES `users` (`uuid`) ON UPDATE CASCADE;

--
-- Constraints for table `docket_reviewers_mapping`
--
ALTER TABLE `docket_reviewers_mapping`
  ADD CONSTRAINT `docket_reviewers_mapping_ibfk_7` FOREIGN KEY (`docket_id`) REFERENCES `docket` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `docket_reviewers_mapping_ibfk_8` FOREIGN KEY (`reviewer_id`) REFERENCES `users` (`uuid`) ON UPDATE CASCADE;

--
-- Constraints for table `docket_status_mapping`
--
ALTER TABLE `docket_status_mapping`
  ADD CONSTRAINT `docket_status_mapping_ibfk_16` FOREIGN KEY (`docket_id`) REFERENCES `docket` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `docket_status_mapping_ibfk_17` FOREIGN KEY (`current_status_id`) REFERENCES `status` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `docket_status_mapping_ibfk_18` FOREIGN KEY (`source_id`) REFERENCES `status_source` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `docket_status_mapping_ibfk_19` FOREIGN KEY (`added_by`) REFERENCES `users` (`uuid`) ON UPDATE CASCADE,
  ADD CONSTRAINT `docket_status_mapping_ibfk_20` FOREIGN KEY (`activation_id`) REFERENCES `activation_details` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `outside_agent_ranking_details`
--
ALTER TABLE `outside_agent_ranking_details`
  ADD CONSTRAINT `outside_agent_ranking_details_ibfk_7` FOREIGN KEY (`activation_id`) REFERENCES `activation_details` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `outside_agent_ranking_details_ibfk_8` FOREIGN KEY (`selected_criteria_id`) REFERENCES `ranking_criteria` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `ranking_criteria`
--
ALTER TABLE `ranking_criteria`
  ADD CONSTRAINT `ranking_criteria_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `ranking_criteria` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `review_details`
--
ALTER TABLE `review_details`
  ADD CONSTRAINT `review_details_ibfk_7` FOREIGN KEY (`activation_id`) REFERENCES `activation_details` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `review_details_ibfk_8` FOREIGN KEY (`reviewer_id`) REFERENCES `users` (`uuid`) ON UPDATE CASCADE;

--
-- Constraints for table `review_ranking_details`
--
ALTER TABLE `review_ranking_details`
  ADD CONSTRAINT `review_ranking_details_ibfk_7` FOREIGN KEY (`review_details_id`) REFERENCES `review_details` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `review_ranking_details_ibfk_8` FOREIGN KEY (`selected_criteria_id`) REFERENCES `ranking_criteria` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `status_history`
--
ALTER TABLE `status_history`
  ADD CONSTRAINT `status_history_ibfk_7` FOREIGN KEY (`docket_id`) REFERENCES `docket` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `status_history_ibfk_8` FOREIGN KEY (`status_id`) REFERENCES `status` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_tenant_client_mapping`
--
ALTER TABLE `user_tenant_client_mapping`
  ADD CONSTRAINT `user_tenant_client_mapping_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`uuid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_tenant_client_mapping_ibfk_2` FOREIGN KEY (`client_id`) REFERENCES `client` (`uuid`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
