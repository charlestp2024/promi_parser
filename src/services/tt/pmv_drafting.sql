-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 01, 2025 at 06:00 AM
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
-- Database: `pmv_drafting`
--

-- --------------------------------------------------------

--
-- Table structure for table `actions`
--

CREATE TABLE `actions` (
  `id` int NOT NULL,
  `staged_id` int DEFAULT NULL,
  `messages` varchar(300) DEFAULT NULL,
  `order_id` int DEFAULT NULL,
  `attachment_mandatory` tinyint DEFAULT NULL,
  `reminder_config` tinyint DEFAULT NULL,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `actions`
--

INSERT INTO `actions` (`id`, `staged_id`, `messages`, `order_id`, `attachment_mandatory`, `reminder_config`, `created_on`, `modified_on`) VALUES
(1, 1, 'Received complete idf', 1, 1, 0, '2025-03-07 10:20:35', '2025-03-07 10:20:35'),
(2, 1, 'Call with inventor', 2, 1, 0, '2025-03-07 10:20:35', '2025-03-07 10:20:35'),
(3, 1, 'Patentabilty report', 3, 1, 0, '2025-03-07 10:20:35', '2025-03-07 10:20:35'),
(4, 1, 'Discuss with inventor', 4, 1, 0, '2025-03-07 10:20:35', '2025-03-07 10:20:35'),
(5, 1, 'Receive additional information', 5, 1, 0, '2025-03-07 10:20:35', '2025-03-07 10:20:35'),
(6, 1, 'Identify filing type', 6, 0, 0, '2025-03-07 10:20:35', '2025-03-07 10:20:35'),
(7, 1, 'Priority filing (Y/N)', 7, NULL, 1, '2025-03-07 10:20:35', '2025-03-07 10:20:35'),
(8, 2, 'Draft claims', 8, 1, 0, '2025-03-07 10:20:35', '2025-03-07 10:20:35'),
(9, 2, 'Inventor review', 9, 1, 0, '2025-03-07 10:20:35', '2025-03-07 10:20:35'),
(10, 2, 'Inventor signoff', 10, 0, 0, '2025-03-07 10:20:35', '2025-03-07 10:20:35'),
(11, 2, 'Get additional info', 11, 1, 0, '2025-03-07 10:20:35', '2025-03-07 10:20:35'),
(12, 2, 'Draft spec', 12, 1, 0, '2025-03-07 10:20:35', '2025-03-07 10:20:35'),
(13, 2, 'Inventor review', 13, 1, 0, '2025-03-07 10:20:35', '2025-03-07 10:20:35'),
(14, 2, 'Inventor signoff', 14, 0, 0, '2025-03-07 10:20:35', '2025-03-07 10:20:35'),
(15, 3, 'Based on type of filing', 15, 0, 0, '2025-03-07 10:20:35', '2025-03-07 10:20:35'),
(16, 3, 'Receive filing forms', 16, 1, 0, '2025-03-07 10:20:35', '2025-03-07 10:20:35'),
(17, 3, 'Franking', 17, 1, 0, '2025-03-07 10:20:35', '2025-03-07 10:20:35'),
(18, 4, 'Filing at patent office', 18, 1, 0, '2025-03-07 10:20:35', '2025-03-07 10:20:35'),
(19, 5, 'Prepare invoice', 20, 1, 0, '2025-03-07 10:20:35', '2025-03-07 10:20:35'),
(20, 5, 'Payment confirmation', 21, 1, 0, '2025-03-07 10:20:35', '2025-03-07 10:20:35'),
(21, 5, 'Close sub-docket', 22, 0, 0, '2025-03-07 10:20:35', '2025-03-07 10:20:35'),
(22, 4, 'Received filing receipt', 19, 1, 0, '2025-03-07 10:20:35', '2025-03-07 10:20:35');

-- --------------------------------------------------------

--
-- Table structure for table `action_input_config`
--

CREATE TABLE `action_input_config` (
  `id` int NOT NULL,
  `label` varchar(300) DEFAULT NULL,
  `mandatory` tinyint NOT NULL DEFAULT '0',
  `type` varchar(300) DEFAULT NULL,
  `placeholder` varchar(300) DEFAULT NULL,
  `sub_text` varchar(300) DEFAULT NULL,
  `btn_label` varchar(300) DEFAULT NULL,
  `no_data_label` varchar(300) DEFAULT NULL,
  `order_no` int NOT NULL,
  `attachment_required` tinyint NOT NULL DEFAULT '0',
  `reminder_config` tinyint NOT NULL DEFAULT '0',
  `action_id` int NOT NULL,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `action_input_config`
--

INSERT INTO `action_input_config` (`id`, `label`, `mandatory`, `type`, `placeholder`, `sub_text`, `btn_label`, `no_data_label`, `order_no`, `attachment_required`, `reminder_config`, `action_id`, `created_on`, `modified_on`) VALUES
(1, 'Upload file', 1, 'file', 'Choose file', NULL, 'Choose', 'No files selected yet', 1, 1, 0, 1, '2025-03-07 10:21:09', '2025-03-07 10:21:09'),
(2, 'Comments', 0, 'text', 'Type comments here', NULL, NULL, NULL, 2, 0, 0, 1, '2025-03-07 10:21:09', '2025-03-07 10:21:09'),
(3, 'Upload file', 1, 'file', 'Choose file', NULL, 'Choose', 'No files selected yet', 1, 1, 0, 2, '2025-03-07 10:21:09', '2025-03-07 10:21:09'),
(4, 'Comments', 0, 'text', 'Type comments here', NULL, NULL, NULL, 2, 0, 0, 2, '2025-03-07 10:21:09', '2025-03-07 10:21:09'),
(5, 'Upload file', 1, 'file', 'Choose file', NULL, 'Choose', 'No files selected yet', 1, 1, 0, 3, '2025-03-07 10:21:09', '2025-03-07 10:21:09'),
(6, 'Comments', 0, 'text', 'Type comments here', NULL, NULL, NULL, 2, 0, 0, 3, '2025-03-07 10:21:09', '2025-03-07 10:21:09'),
(7, 'Upload file', 1, 'file', 'Choose file', NULL, 'Choose', 'No files selected yet', 1, 1, 0, 4, '2025-03-07 10:21:09', '2025-03-07 10:21:09'),
(8, 'Comments', 0, 'text', 'Type comments here', NULL, NULL, NULL, 2, 0, 0, 4, '2025-03-07 10:21:09', '2025-03-07 10:21:09'),
(9, 'Upload file', 1, 'file', 'Choose file', NULL, 'Choose', 'No files selected yet', 1, 1, 0, 5, '2025-03-07 10:21:09', '2025-03-07 10:21:09'),
(10, 'Comments', 0, 'text', 'Type comments here', NULL, NULL, NULL, 2, 0, 0, 5, '2025-03-07 10:21:09', '2025-03-07 10:21:09'),
(11, 'Comments', 0, 'text', 'Type comments here', NULL, NULL, NULL, 1, 0, 0, 6, '2025-03-07 10:21:09', '2025-03-07 10:21:09'),
(12, 'Upload file', 1, 'file', 'Choose file', NULL, 'Choose', 'No files selected yet', 2, 1, 0, 7, '2025-03-07 10:21:09', '2025-03-07 10:21:09'),
(13, 'Comments', 0, 'text', 'Type comments here', NULL, NULL, NULL, 3, 0, 0, 7, '2025-03-07 10:21:09', '2025-03-07 10:21:09'),
(14, 'Whether priority filing?', 1, 'toggle', NULL, NULL, NULL, NULL, 1, 0, 0, 7, '2025-03-07 10:21:09', '2025-03-07 10:21:09'),
(15, 'Upload file', 1, 'file', 'Choose file', NULL, 'Choose', 'No files selected yet', 1, 1, 0, 8, '2025-03-07 10:21:09', '2025-03-07 10:21:09'),
(16, 'Comments', 0, 'text', 'Type comments here', NULL, NULL, NULL, 2, 0, 0, 8, '2025-03-07 10:21:09', '2025-03-07 10:21:09'),
(17, 'Upload file', 1, 'file', 'Choose file', NULL, 'Choose', 'No files selected yet', 1, 1, 0, 9, '2025-03-07 10:21:09', '2025-03-07 10:21:09'),
(18, 'Comments', 0, 'text', 'Type comments here', NULL, NULL, NULL, 2, 0, 0, 9, '2025-03-07 10:21:09', '2025-03-07 10:21:09'),
(19, 'Comments', 0, 'text', 'Type comments here', NULL, NULL, NULL, 1, 0, 0, 10, '2025-03-07 10:21:09', '2025-03-07 10:21:09'),
(20, 'Upload file', 1, 'file', 'Choose file', NULL, 'Choose', 'No files selected yet', 1, 1, 0, 11, '2025-03-07 10:21:09', '2025-03-07 10:21:09'),
(21, 'Comments', 0, 'text', 'Type comments here', NULL, NULL, NULL, 2, 0, 0, 11, '2025-03-07 10:21:09', '2025-03-07 10:21:09'),
(22, 'Upload file', 1, 'file', 'Choose file', NULL, 'Choose', 'No files selected yet', 1, 1, 0, 12, '2025-03-07 10:21:09', '2025-03-07 10:21:09'),
(23, 'Comments', 0, 'text', 'Type comments here', NULL, NULL, NULL, 2, 0, 0, 12, '2025-03-07 10:21:09', '2025-03-07 10:21:09'),
(24, 'Upload file', 1, 'file', 'Choose file', NULL, 'Choose', 'No files selected yet', 1, 1, 0, 13, '2025-03-07 10:21:09', '2025-03-07 10:21:09'),
(25, 'Comments', 0, 'text', 'Type comments here', NULL, NULL, NULL, 2, 0, 0, 13, '2025-03-07 10:21:09', '2025-03-07 10:21:09'),
(26, 'Comments', 0, 'text', 'Type comments here', NULL, NULL, NULL, 1, 0, 0, 14, '2025-03-07 10:21:09', '2025-03-07 10:21:09'),
(27, 'Download Forms to Fill', 0, 'dropdown', 'Select Form', NULL, NULL, NULL, 1, 0, 0, 15, '2025-03-07 10:21:09', '2025-03-07 10:21:09'),
(28, 'Comments', 0, 'text', 'Type comments here', NULL, NULL, NULL, 2, 0, 0, 15, '2025-03-07 10:21:09', '2025-03-07 10:21:09'),
(29, 'Select form Type', 0, 'dropdown', 'Select Form', NULL, NULL, NULL, 1, 0, 0, 16, '2025-03-07 10:21:09', '2025-03-07 10:21:09'),
(30, 'Upload file', 1, 'file', 'Choose file', NULL, 'Choose', 'No files selected yet', 2, 1, 0, 16, '2025-03-07 10:21:09', '2025-03-07 10:21:09'),
(31, 'Comments', 0, 'text', 'Type comments here', NULL, NULL, NULL, 3, 0, 0, 16, '2025-03-07 10:21:09', '2025-03-07 10:21:09'),
(32, 'Upload file', 1, 'file', 'Choose file', NULL, 'Choose', 'No files selected yet', 1, 1, 0, 17, '2025-03-07 10:21:09', '2025-03-07 10:21:09'),
(33, 'Comments', 0, 'text', 'Type comments here', NULL, NULL, NULL, 2, 0, 0, 17, '2025-03-07 10:21:09', '2025-03-07 10:21:09'),
(34, 'Upload file', 1, 'file', 'Choose file', NULL, 'Choose', 'No files selected yet', 1, 1, 0, 18, '2025-03-07 10:21:09', '2025-03-07 10:21:09'),
(35, 'Comments', 0, 'text', 'Type comments here', NULL, NULL, NULL, 2, 0, 0, 18, '2025-03-07 10:21:09', '2025-03-07 10:21:09'),
(36, 'Upload file', 1, 'file', 'Choose file', NULL, 'Choose', 'No files selected yet', 1, 1, 0, 19, '2025-03-07 10:21:09', '2025-03-07 10:21:09'),
(37, 'Comments', 0, 'text', 'Type comments here', NULL, NULL, NULL, 2, 0, 0, 19, '2025-03-07 10:21:09', '2025-03-07 10:21:09'),
(38, 'Upload file', 1, 'file', 'Choose file', NULL, 'Choose', 'No files selected yet', 1, 1, 0, 20, '2025-03-07 10:21:09', '2025-03-07 10:21:09'),
(39, 'Comments', 0, 'text', 'Type comments here', NULL, NULL, NULL, 2, 0, 0, 20, '2025-03-07 10:21:09', '2025-03-07 10:21:09'),
(41, 'Comments', 0, 'text', 'Type comments here', NULL, NULL, NULL, 2, 0, 0, 21, '2025-03-07 10:21:09', '2025-03-07 10:21:09'),
(42, 'Comments', 0, 'text', 'Type comments here', NULL, NULL, NULL, 2, 0, 0, 22, '2025-03-07 10:21:09', '2025-03-07 10:21:09'),
(43, 'Upload file', 1, 'file', 'Choose file', NULL, 'Choose', 'No files selected yet', 1, 1, 0, 22, '2025-03-07 10:21:09', '2025-03-07 10:21:09');

-- --------------------------------------------------------

--
-- Table structure for table `assignee`
--

CREATE TABLE `assignee` (
  `id` int NOT NULL,
  `name` varchar(300) DEFAULT NULL,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `tenant_id` char(36) NOT NULL,
  `client_id` char(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `attachment_type`
--

CREATE TABLE `attachment_type` (
  `id` int NOT NULL,
  `attachment_type` varchar(300) DEFAULT NULL,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `attachment_type`
--

INSERT INTO `attachment_type` (`id`, `attachment_type`, `created_on`, `modified_on`) VALUES
(1, 'NDA', '2025-03-07 09:54:09', '2025-03-07 09:54:09'),
(2, 'IDF', '2025-03-07 09:54:09', '2025-03-07 09:54:09'),
(3, 'Proposal', '2025-03-07 09:54:09', '2025-03-07 09:54:09');

-- --------------------------------------------------------

--
-- Table structure for table `client`
--

CREATE TABLE `client` (
  `id` char(36) NOT NULL,
  `client_code` int DEFAULT NULL,
  `client_name` varchar(300) DEFAULT NULL,
  `email` varchar(300) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `tenant_id` char(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `client_division`
--

CREATE TABLE `client_division` (
  `id` char(36) NOT NULL,
  `division_name` varchar(300) DEFAULT NULL,
  `client_id` char(36) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `tenant_id` char(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `client_division`
--

INSERT INTO `client_division` (`id`, `division_name`, `client_id`, `is_active`, `created_on`, `modified_on`, `tenant_id`) VALUES
('000dfeb5-1d5a-459d-97e8-35a9d6191ee0', 'Engineering', 'c0176336-1b6e-4caa-bc70-e43a55eb85b5', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('009db382-8cb2-4956-a196-f1742d753010', 'Core Tech', '4f2e2c74-7508-4382-87ef-5d490b827d59', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('00ed2cac-141e-4d4a-abaf-3ca0efc53986', 'Engineering', 'a59a6c27-3fc0-4655-bd39-bf4a4c705eac', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('01b144b2-f458-4dce-83c3-ba66b6f2befe', 'Engineering', 'ad4a87cc-b57f-4f52-b465-1f1441649239', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('0216f13b-df22-4090-8f96-d1d6bd1959d7', 'Innovation Lab', 'ad4a87cc-b57f-4f52-b465-1f1441649239', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('02451a2f-ed87-4210-8ec9-b6aded007530', 'Product Dev', 'a8dd4981-67e1-4a18-b6c2-f599ad6382c6', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('02ccc185-bd95-4256-92ff-715b1dac02da', 'Core Tech', 'bd428e0e-8ddc-4e3d-832b-e65a06497379', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('03c1ac2e-1226-4d7f-9870-a626cadd657f', 'R&D', '9c0ee115-b030-4fe9-b828-a51303dc8db2', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('042d330a-0dc5-4c0e-abea-b0159ef678c7', 'Core Tech', 'a1783c65-4455-40c5-b0fc-3f5531438581', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('052873b0-f367-4247-8fa7-8eacda6735d3', 'R&D', 'd5c6cb4d-637a-4f02-bf75-9b22f48da2ae', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('05be955b-b028-49b2-ae9e-3c1f3ece2974', 'Engineering', '44e13803-cc02-42c4-baa7-9f7dcda273b3', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('05d087f7-0615-45b4-9dd5-401e9166e0e4', 'Engineering', '5f5cef54-dbc6-492f-874f-b0cc828a0a37', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('0612168f-174a-41ad-9002-906be936f3d5', 'Engineering', '3b560651-ee9f-409f-bdc2-86a0ce420cd9', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('065ee986-d6f5-43fe-a6a6-4f785e084c4a', 'Engineering', 'c98ba499-8334-4528-ba80-192f08b5cf19', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('068dd199-ce7b-48c3-bfce-9535f0115845', 'Core Tech', '96a48484-d9b1-4395-8b14-ba7f3970fd3d', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('0766cbff-18db-4e2f-a06b-452df4c94a6d', 'R&D', '34baf4fc-c607-40f9-b0a6-c27098d08235', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('077be485-8a64-4e03-a900-b29e627a1a9e', 'R&D', 'e979dffd-b360-4002-bffd-d40bddadf715', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('07d9c989-f4c2-4667-9b87-83c665a14b80', 'Engineering', '34baf4fc-c607-40f9-b0a6-c27098d08235', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('08371dae-ebb0-435a-95f2-e97d5f99f82f', 'Product Dev', 'be66e46c-fbcc-41e0-be60-fdf8f2a9e631', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('08a33a87-2fc4-4e6b-ba26-a04635776bea', 'Innovation Lab', '9be7407c-ba2a-48ec-ae4a-3f6beddd2cac', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('08c6ba9e-c32d-4945-96d4-9896d53cbd6c', 'Engineering', '1d1ec5bd-e48c-4f2e-a350-4885f37bf4df', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('08f102b2-7a0c-4dea-969f-8cce7f3ca001', 'R&D', 'fcd47d31-cd68-44dd-96a5-2a0cf5bbfcf0', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('094e3bc2-0278-442e-9393-fdecfb70c061', 'Innovation Lab', '31f83145-2452-451c-a13f-5a0235a7976a', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('09de883d-e013-4f3d-a805-049333dbe25f', 'Innovation Lab', 'e2eed471-9081-412c-bcb5-4198ed86ffe5', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('0a515ac8-06d8-4eec-92fc-a0a18c0cc8f7', 'Innovation Lab', '1d1ec5bd-e48c-4f2e-a350-4885f37bf4df', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('0b6952a5-2204-4393-a90d-4d26e5470ffe', 'Core Tech', '4e700ba1-b1f8-4a03-93a0-a53df552fe9b', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('0ba9f55f-5c6e-4507-a78d-837cc07ad68c', 'R&D', 'be66e46c-fbcc-41e0-be60-fdf8f2a9e631', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('0bdb1672-e81d-404c-992a-782ea12c9a6b', 'R&D', '1bc58a78-470d-4791-9009-f74151708c95', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('0c02ca8a-2dcb-4b3d-b56f-f753726db269', 'Core Tech', '02b72110-adc9-49da-9cde-9396112fadf4', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('0c10424c-be86-4822-958f-3ce7e2ada9fd', 'Innovation Lab', '8a2f0ed2-1065-400a-9e2a-855fc815f483', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('0cc0088e-b21d-4626-b999-b44a088a5116', 'Innovation Lab', '4e700ba1-b1f8-4a03-93a0-a53df552fe9b', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('0ce51420-11c9-4ea0-bc74-9f088d040a47', 'Core Tech', 'bf610abd-00a1-450d-b5e6-f26bde115c53', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('0d3281fd-f5ba-4a95-96bf-99b51f743031', 'Engineering', 'c44a19fc-d6d2-4b1b-a9d9-ddcf643d2af2', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('0d3d1715-7928-4f2f-ab58-d92de6645b8a', 'Product Dev', 'ea2f5c63-9986-41e9-a2d9-a271941fa159', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('0d9044f4-bd37-4e8e-a5aa-398d8f2f9a88', 'Innovation Lab', '276e3773-5a04-4601-bc00-58aee238ace2', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('0dff2895-24e9-4d86-8da3-4f2a1da0cbcf', 'Core Tech', '1d1ec5bd-e48c-4f2e-a350-4885f37bf4df', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('0e32d3c5-74ab-417e-aaa1-32448e845d67', 'Engineering', '03db5c46-640d-47ca-863b-d6a8f39077a5', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('0e884219-0556-42a5-8747-cc27023a9a08', 'Innovation Lab', 'a8ec09e6-70e6-4c6d-8848-d407e5ef8acf', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('0eea7393-f867-495e-a8ed-0b3c2c03e133', 'Product Dev', 'c593d6a5-04e2-40e0-9db5-2dcafed63ae2', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('0f17f90f-3f43-4afd-95ac-0ed2752a2d6f', 'Core Tech', '39757bd3-379d-44f9-98c5-1a10fee500c6', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('0f1bf4f0-ef8f-4eb6-9ea5-56892c6acccb', 'Core Tech', 'a8ec09e6-70e6-4c6d-8848-d407e5ef8acf', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('0f6d3992-28b6-416e-a9a1-491c6a72c048', 'R&D', 'e41952f4-7ce1-4d75-885c-213f4dfd53ce', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('0f91bc60-0bad-4ccc-92fe-f16c68de647e', 'Core Tech', '6f8572ac-271a-4bef-b46d-c5858098dd67', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('0fb33312-b20b-4284-9dd3-2c9fc5dddf53', 'Product Dev', '0de6cd70-3c21-4489-8313-d81cb5c4c58e', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('0fb56217-6af5-4213-8066-661847f3123e', 'R&D', '13f95595-4b88-4878-ae4d-bfb5819bb738', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('101400d6-147c-4395-96f5-ac5fc88c3936', 'Engineering', '485b1dc0-89ab-4718-ae1f-fda603d0700f', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('111c985c-706f-41ff-9e07-35547d620da2', 'R&D', 'bd428e0e-8ddc-4e3d-832b-e65a06497379', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('1126b713-79a8-4edc-97be-a6af4bc77f0d', 'Product Dev', 'e262e28d-b01c-4a46-b837-3cdd862eec54', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('113f3624-bf97-4691-a5e2-a168d1fe3c57', 'Product Dev', '10683583-f371-4aac-b22c-256777168f22', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('117f8d59-0013-4632-9059-28e4ba70ede6', 'Engineering', '3aa97790-fd9e-4db3-aded-378bf8bd14a5', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('12006baa-9ec1-4d71-a260-3273b84bd0b8', 'Core Tech', 'd2368302-d7df-41c2-b3b1-94b79a993c6d', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('1204279c-94da-4141-b34f-aec312ed4b6d', 'Innovation Lab', '485b1dc0-89ab-4718-ae1f-fda603d0700f', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('1258cf1d-d5c2-4fb1-b3b7-eebfb555ea43', 'Core Tech', '653d7f79-782c-4e90-b850-2c8788a53bf8', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('12dd3b84-5e1b-4c87-8bcf-24b3303bb789', 'Core Tech', 'ead9da0b-0ca4-45e1-8edd-a0206330e928', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('1306abcb-4811-45e5-bedf-e9936f66757b', 'Core Tech', 'ca18fd5a-fe68-4ff3-aba7-ebf59e5281a2', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('13d5dc86-dd85-4356-939b-4e3c21f5143f', 'Innovation Lab', '16484b1f-9673-4167-9629-1323ddf64d45', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('13f7448a-cc8c-4d7b-8774-7586454a3bbf', 'Product Dev', 'f88edbee-4079-470f-a6af-9a453e48953b', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('1435217e-96d7-448d-a2e8-dcac3c56d72b', 'Engineering', '428384b5-511b-446b-8c76-7b853c52de19', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('14f397fd-cb4a-45d7-a592-d2bed0901e86', 'Engineering', '08d52932-25c6-4dc5-a7f3-f632e8ad0fda', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('150d24d9-03ad-4018-b389-dbdcfea1967a', 'R&D', 'baaaf9dd-1794-4f6e-b33d-70929ccf2bd4', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('1534f79d-57ee-493d-ac89-14593a9fcacd', 'Core Tech', '8d04b80b-1716-4861-8440-da7e0dd6d9d6', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('155c57fc-9c95-454b-b015-021db1e81450', 'Innovation Lab', '614fe7aa-9d97-4ea0-8e4f-b4155efc5b75', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('159d9566-f245-4991-a918-9f4756c826af', 'Engineering', '5a82f70f-77d2-4863-9731-3344b9c52053', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('15a84c3c-4a7d-4481-9fdd-1fa0d74cca0e', 'Innovation Lab', 'b4b6fac6-9d4a-4181-8372-174882eb6b9c', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('15b2b921-3f0d-48ee-a58f-c739e814ee40', 'Innovation Lab', '7d01dc9f-27ae-40b0-ba92-7aedc3263290', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('15b9592a-1172-49ea-8fb3-7f10e5485afd', 'Core Tech', 'dd1e82b3-177d-41f0-9442-c10afcf311c5', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('15f24303-2bc7-44de-a9a2-e497eb5d9d83', 'Product Dev', '678fad23-ec61-4325-ae59-c78134534779', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('1640523d-21c2-4e08-a0a6-8a8c646240ac', 'Core Tech', 'cac43e06-7d6d-47b7-8313-89c758000704', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('167f6e6d-ba11-4f58-b903-15285a42c84e', 'Engineering', '9fa0cacf-0183-416d-a6ad-e3f79ab76cd1', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('17154adf-c258-4e0d-b4ed-80749639cd8c', 'Product Dev', '2f1949ca-00e0-4d6f-b69a-9d2589f2f4cd', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('173efb59-52d1-42bc-991c-addb851fa85b', 'Innovation Lab', 'c98ba499-8334-4528-ba80-192f08b5cf19', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('17952b7f-73b2-4e7e-b813-31fef69cb4a5', 'R&D', 'de32f587-669e-44a7-b48a-7cd12b3543c3', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('17c28fe9-293f-4440-80e5-7155f3cb47c9', 'Core Tech', '05c7ca9a-115a-4fa7-9f83-f1955ce729bb', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('17ccc729-6f80-452c-83b7-fe2a7217651e', 'Product Dev', '03db5c46-640d-47ca-863b-d6a8f39077a5', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('18a54c1c-0f53-4093-8a68-1efea6fdc42d', 'R&D', '6afe4c0a-071f-44ea-b69f-cd45e8e33821', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('196a249d-5041-4e2b-846f-9d1e9da63f73', 'Engineering', '10683583-f371-4aac-b22c-256777168f22', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('19819099-2481-47af-8b30-fa57301513b2', 'Product Dev', '8a2f0ed2-1065-400a-9e2a-855fc815f483', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('19bff48e-950f-472b-9a8d-44531595af8a', 'R&D', '0de6cd70-3c21-4489-8313-d81cb5c4c58e', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('1a58ab54-d6df-428b-8702-bbbe0fd539f3', 'Core Tech', '77fd50cb-c873-4e30-b4bd-e4a020bec793', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('1abc2ff2-e3d8-444c-adf8-6f98e69e1132', 'Product Dev', '904610e8-53bb-41a8-adbf-202a65e9ce26', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('1afce4a8-3a82-4a5c-82f3-b39021a99cb5', 'Product Dev', '6674e31a-4765-4a0e-9428-ccf92bf5c7b8', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('1b57db58-9e82-407a-aae5-bad59c2572c4', 'Innovation Lab', '39560ff6-c792-44c1-85bc-19bb36e07821', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('1bff5928-1372-4fe5-b4cb-1d7fd68d9cda', 'Product Dev', 'd2368302-d7df-41c2-b3b1-94b79a993c6d', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('1c3b2a63-6287-49a5-bd54-3b389e78f753', 'Product Dev', '8f48639c-dc93-4987-9e2b-99e5199b8686', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('1cb2211f-45f0-4965-9610-10aa4e991eb2', 'Innovation Lab', '6d72c08d-de17-469b-82ff-69f1456db71a', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('1ce5fd9b-8ed6-43f6-8b65-da2f10284483', 'R&D', '3b560651-ee9f-409f-bdc2-86a0ce420cd9', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('1d1acf87-6454-4ebc-a6c0-ad2887722375', 'Core Tech', 'b60cb204-43dd-4ed2-bb81-84e187eaeed3', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('1d5aaa33-b4b4-4c02-8a58-a89834b063da', 'R&D', 'b4b6fac6-9d4a-4181-8372-174882eb6b9c', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('1df63730-d111-4d0e-b449-fdd3846e53c6', 'R&D', 'ca4d9b7f-076c-4332-aecf-0149ec0f6691', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('1dffb53c-96c4-408c-b931-8a60840b9ee3', 'Core Tech', '50a42e60-4a1d-4fc2-9933-840f0fae80fb', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('1ea71ad0-d651-41b0-b25b-e82178c47ab4', 'Innovation Lab', '7d3f9d1f-fb8e-4ba9-856d-2a9d4adaf1fc', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('1eb2e42a-0776-4c6e-af06-98c06774434f', 'Innovation Lab', 'd1f46c3f-5c09-45b7-96f8-95ac3d576324', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('1ed96b39-72b2-41e8-b5cf-ea734f3a7e9c', 'Product Dev', 'e2eed471-9081-412c-bcb5-4198ed86ffe5', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('1f75abe4-7dda-4284-9cbe-b06e3ad81662', 'R&D', '7ee477ec-3470-45cc-b003-a3a142844e38', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('1f91197a-b9b0-46b9-9885-c96c154604e7', 'Engineering', 'd5c6cb4d-637a-4f02-bf75-9b22f48da2ae', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('1fc41573-dc81-4cd2-820b-193876921f62', 'Core Tech', '30e96289-171a-47ca-ace3-f140c3d06497', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('20059a6a-820e-43f8-a73f-38f66e4bc872', 'Engineering', '62312b0d-b2aa-497b-8d98-7c83c4df2020', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('2027b930-76ec-41e9-a859-a6a764092a0d', 'Innovation Lab', '875186d6-05b8-4986-83be-ba0f488bd7c5', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('211da3bf-d6b2-4b89-beba-e6bd128a552b', 'R&D', '5f5cef54-dbc6-492f-874f-b0cc828a0a37', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('222c88b3-8f90-4750-b27a-d3644e05e0f4', 'Innovation Lab', '5f83fb34-45da-4699-bd4c-a2b401c30ef9', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('2234177d-6233-474b-8a40-a9e161a63370', 'Product Dev', '980e4613-8659-4117-8d51-09ff0de48508', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('2240ea8e-4eab-4920-bff7-be120b5db153', 'Core Tech', '3aa97790-fd9e-4db3-aded-378bf8bd14a5', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('227ce97d-dad0-406a-a49d-a150c7a1dfa4', 'Core Tech', 'be61492d-5871-48db-817a-f4a6e0c54483', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('22b848bb-12ec-4c6f-9ec9-cbc4a2628d6a', 'Engineering', '74955c46-c54b-4b1a-9701-44469d030f5e', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('2353a1e4-34f9-43b5-a7db-3d3ee2292832', 'R&D', '9be7407c-ba2a-48ec-ae4a-3f6beddd2cac', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('236006ff-9911-4ce6-9223-d5af04e51471', 'Product Dev', '5f83fb34-45da-4699-bd4c-a2b401c30ef9', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('237adf42-e16f-43d0-996d-f9eff146a772', 'Engineering', 'ef436cac-2135-4dff-ac72-b9d97b55b183', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('238b6fbd-ceaa-47ac-9b7a-f5a5cd74cec9', 'Product Dev', '30e96289-171a-47ca-ace3-f140c3d06497', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('23dd54c7-e422-47ba-bae3-a12ae826dec2', 'Innovation Lab', '678fad23-ec61-4325-ae59-c78134534779', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('23e414c2-b92d-4fc4-91ae-c96b2cc8e6d8', 'Core Tech', '44e13803-cc02-42c4-baa7-9f7dcda273b3', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('24bfd979-34b3-4276-88cc-ca7fcdfac455', 'Product Dev', '39560ff6-c792-44c1-85bc-19bb36e07821', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('257d16ba-ec20-48c1-be88-908b0c314a4e', 'Innovation Lab', 'ae544506-69f4-4e6f-966b-26477ac675c2', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('259f260a-105f-474e-aaa6-922c19c9fae8', 'Engineering', '2c639357-60d5-42d2-be9e-1defac55b8a0', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('25a8f6fc-9372-445e-aa30-a303bf33ca4a', 'Innovation Lab', 'e262e28d-b01c-4a46-b837-3cdd862eec54', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('25b72986-eb4c-4767-96da-c98b177709cd', 'R&D', 'e2eed471-9081-412c-bcb5-4198ed86ffe5', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('26192548-fd9b-4bdd-9c84-6055c9166891', 'R&D', '1a270724-708c-4417-adce-9b731904ae86', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('26319cb2-7c43-4fd0-8870-ed603699e3a7', 'Innovation Lab', '6e486737-ed5d-4048-a69e-72ec52d5ccee', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('263683b2-f353-4850-b0a5-17ffc48f14bc', 'Innovation Lab', '08d52932-25c6-4dc5-a7f3-f632e8ad0fda', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('263e1f1b-abff-4a8c-836a-6b9ba2b49936', 'Core Tech', 'de32f587-669e-44a7-b48a-7cd12b3543c3', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('264a854d-3caf-4a1f-8c6b-e92e9a6ac111', 'Product Dev', '50a42e60-4a1d-4fc2-9933-840f0fae80fb', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('269bb5ac-794f-47a4-adc4-8ecb876edeb2', 'Core Tech', '81653858-30f6-4571-a569-5c4fb46a92ba', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('26a90774-70b5-4312-9990-cca89698c4e2', 'Product Dev', '5275f914-9839-4663-9b14-d6dc0cb01988', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('26b91183-861b-498e-92d4-e3f19c524261', 'Innovation Lab', 'bff034e2-5b16-47e7-9639-1bca59febf3b', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('26f6d420-30d1-4305-b120-969a6b5e5ded', 'Core Tech', '5e591485-20ed-4e90-b0e6-b7e52de4d5c7', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('27b91b76-9229-4c03-8f76-af4b4e22759e', 'Product Dev', '3b560651-ee9f-409f-bdc2-86a0ce420cd9', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('27d1cf52-acfd-460b-b58d-3dba14cf1fe8', 'Product Dev', '7d082ebf-ce23-4139-9646-08bfe6482cc9', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('283e2e8a-8303-46ac-a07e-593da9020275', 'Product Dev', '7d3f9d1f-fb8e-4ba9-856d-2a9d4adaf1fc', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('28898331-5d34-4890-bdc8-285c2252d53d', 'R&D', '39560ff6-c792-44c1-85bc-19bb36e07821', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('28c05364-35b1-4729-b1c5-726a30abfc2a', 'Engineering', '30e96289-171a-47ca-ace3-f140c3d06497', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('28ca6c4e-1687-403d-a2f2-98374a520393', 'Product Dev', '96a48484-d9b1-4395-8b14-ba7f3970fd3d', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('290b0307-b9b3-4f90-8f4f-dbc4f7edfdaa', 'Core Tech', '1a270724-708c-4417-adce-9b731904ae86', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('29245f9e-8742-4cad-88a0-853a9fe2e259', 'Innovation Lab', '25132aa4-a089-4316-bf1e-a9ad9bb94771', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('2929b6aa-ea8e-4a2f-a530-12796ca3e57f', 'Product Dev', '4ef13beb-abcf-40e4-ae08-80cfcfd0cd78', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('292b5e80-319b-4f5b-837c-1457420f9c5e', 'Innovation Lab', '4fdb80f0-33bb-45b2-9f94-f3ebc319fad7', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('29cd6e54-3a07-4df0-be8c-728589dad942', 'Innovation Lab', 'acdba1ae-8322-4092-805a-3e5fd601db26', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('2ada555c-91d3-468d-8587-2eb1c45704d3', 'R&D', '198bd334-462b-43ef-87d6-aa77d106d196', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('2aeabd7f-ee5e-409f-bd4e-c5179fbd65e6', 'Engineering', 'bd428e0e-8ddc-4e3d-832b-e65a06497379', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('2b096039-e14b-4d27-adb5-c869f5121048', 'Product Dev', 'ca4d9b7f-076c-4332-aecf-0149ec0f6691', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('2b0db981-d13e-4b20-ab2e-5db45d5d01b4', 'Core Tech', '5275f914-9839-4663-9b14-d6dc0cb01988', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('2b16306b-8dd3-4b4e-928b-a02346669845', 'Engineering', 'bff034e2-5b16-47e7-9639-1bca59febf3b', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('2b6f30e2-79ed-47bc-b66e-797a2bbd95b4', 'Engineering', '5f83fb34-45da-4699-bd4c-a2b401c30ef9', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('2b793325-faf1-4330-ad85-c9d0c525cd64', 'Product Dev', '187ce580-c9c1-467a-9601-9a43547cb9a5', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('2b96dbd6-01ee-4a43-9f10-ed4ea1f8ed65', 'Innovation Lab', 'bd428e0e-8ddc-4e3d-832b-e65a06497379', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('2bb0eb9c-df01-4398-9bf9-7160d7de6023', 'Core Tech', 'ad4a87cc-b57f-4f52-b465-1f1441649239', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('2bb60d2c-b2d8-4690-9808-b87768e32872', 'R&D', 'cac43e06-7d6d-47b7-8313-89c758000704', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('2cc47101-84b1-428c-8660-b2c9c4cb5410', 'Engineering', '187ce580-c9c1-467a-9601-9a43547cb9a5', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('2cc62e82-e780-4ed1-a44a-a37a29081d24', 'Innovation Lab', '34baf4fc-c607-40f9-b0a6-c27098d08235', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('2cebf5ed-8e2f-4af2-8718-0d6642cee811', 'Product Dev', '79d8e63c-a0b8-4a00-a32b-961ecddd0784', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('2d24207a-cfd2-44e3-a999-fe09a8631405', 'Innovation Lab', '10683583-f371-4aac-b22c-256777168f22', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('2d769265-ddd3-4c28-b0a6-0f544ae68866', 'Engineering', '1bc58a78-470d-4791-9009-f74151708c95', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('2d9bd47d-15bf-43a0-8d4c-0ad13d89d1ad', 'Product Dev', 'd0c536c8-1b62-4ed9-91d7-ff64bc6988d9', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('2e0ee0f1-d3b3-45f9-b25c-839e8bf8c1be', 'Product Dev', '77fd50cb-c873-4e30-b4bd-e4a020bec793', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('2e5e3e44-8db0-4575-a954-4cb6d227fade', 'Product Dev', '02b72110-adc9-49da-9cde-9396112fadf4', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('2e68094c-606b-4a5e-8f9a-0b7d58c70933', 'Engineering', '6afe4c0a-071f-44ea-b69f-cd45e8e33821', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('2e806e78-0c85-4ac6-947b-dd14edb2a896', 'Product Dev', 'c663d125-45fb-4d94-952c-a13744cff8e2', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('2e92cfa2-cdb4-4012-96d3-cc3af1ccf390', 'Innovation Lab', 'e732588f-7df2-42a7-9367-e78a0dfaf3ec', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('2ec5803f-4f78-4561-88d7-0d1bcac14e37', 'Engineering', '16484b1f-9673-4167-9629-1323ddf64d45', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('2edd1bda-4187-4d85-b0a1-8b4cf5a1be1a', 'Core Tech', '9be7407c-ba2a-48ec-ae4a-3f6beddd2cac', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('2ee74201-4c3a-41d7-8095-f53ac16b9dfc', 'R&D', '2f1949ca-00e0-4d6f-b69a-9d2589f2f4cd', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('303fd9f8-8f02-463f-b411-15a8f2192dcc', 'Product Dev', '614fe7aa-9d97-4ea0-8e4f-b4155efc5b75', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('30605ef2-1d11-49b7-9f19-a3f21c7ba008', 'Product Dev', 'bd428e0e-8ddc-4e3d-832b-e65a06497379', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('30a565c8-8dec-4e14-b663-b49aa1c407fa', 'Engineering', '0cf157b8-2a23-4f2d-9f7a-49955489a3a6', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('30cda25b-88f5-41bc-9ed5-bbd3b87dfb4e', 'Core Tech', '2f1949ca-00e0-4d6f-b69a-9d2589f2f4cd', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('30ff940c-e25f-4ee7-8d6f-ce567f88cd11', 'R&D', 'a8dd4981-67e1-4a18-b6c2-f599ad6382c6', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('31066100-10a7-4c74-9102-cc1a28ac3fe6', 'Core Tech', 'b6c4c7b1-049c-429f-9ce4-e6595b655ffb', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('31c2ca95-2dc2-4348-8947-b113cd834457', 'Product Dev', '457dd9c6-2472-41dc-9566-e5f490d2436a', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('327fd9ea-bc11-4170-8aa7-e5606a8048ab', 'Engineering', 'f8253dc1-f357-42a6-b50a-ac447f56a964', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('32bd93cd-6c7c-47ab-a81b-b87c2df4fd30', 'R&D', '03db5c46-640d-47ca-863b-d6a8f39077a5', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('32c5ea48-c528-4b49-a726-65484cf25ff4', 'R&D', '224e7e21-d414-4381-97e9-9085381ffb78', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('335636b5-5b72-40ff-98e6-c7b8bacb4343', 'Core Tech', 'acdba1ae-8322-4092-805a-3e5fd601db26', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('34816c0a-da94-4b38-bfaa-b9e443131a6b', 'Core Tech', '8f455fcd-f70a-4808-944f-8062ecd9dd18', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('348b5052-fc2b-401a-a58a-92d4d53be557', 'Product Dev', '875186d6-05b8-4986-83be-ba0f488bd7c5', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('34cd2137-0fc5-432e-b4f9-2d619fa43909', 'Innovation Lab', '6df52b78-f488-477f-91b2-1da313384ec1', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('34f147e4-57c4-4312-ab40-57d37fc62e96', 'Core Tech', '8d9e2e1e-2983-4c4a-adbf-2606f4ebb953', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('34fc9167-3d13-4a5a-9f89-90585e84c6c7', 'R&D', '4e700ba1-b1f8-4a03-93a0-a53df552fe9b', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('3505e01e-da3f-4be5-bab5-2007563a2bfe', 'Product Dev', '7ab5e3e4-af6f-448f-93ae-0008078341fa', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('35252605-c243-4a17-9f68-5b48ae2ddd86', 'R&D', 'a8718969-8258-4d91-8955-86fefc002fc4', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('3587854c-94ac-456f-a2ce-ba07c3bd614f', 'R&D', 'd2368302-d7df-41c2-b3b1-94b79a993c6d', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('35e084ee-5b1f-4a5b-be4c-0c12cd366027', 'Core Tech', 'c44a19fc-d6d2-4b1b-a9d9-ddcf643d2af2', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('3622128e-eb49-4fab-8717-a2ab4b7ecbbe', 'Core Tech', 'ba397226-9350-4579-8644-a8625eaeb681', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('36279184-870d-4050-ad47-65398a424743', 'Core Tech', 'ff4d2113-68cf-4bc6-8800-0a46f50b02e2', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('3630798b-7581-4481-a522-940a0554dc6d', 'R&D', '4fdb80f0-33bb-45b2-9f94-f3ebc319fad7', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('365ddeea-307c-4cb6-b3af-76084e525b11', 'R&D', 'ae544506-69f4-4e6f-966b-26477ac675c2', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('366ce076-45c5-4496-a4b5-feed0afab92a', 'Innovation Lab', 'd5c6cb4d-637a-4f02-bf75-9b22f48da2ae', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('36aa707a-6e8e-4afd-9e57-03ec373316f2', 'Innovation Lab', '3e5b9df2-2b3d-46d3-8cbe-1c0fd8609e29', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('36b75060-ecc4-4042-b161-d63006b6fa6f', 'Innovation Lab', 'dd1e82b3-177d-41f0-9442-c10afcf311c5', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('36dc7ccf-90e9-4f36-bcca-c204634df257', 'Product Dev', '8cbde088-f102-435a-9ec5-672a0db2acf0', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('3741dd75-7d72-4ef4-ac37-d81a678aaf00', 'Innovation Lab', 'd3016104-992f-4d3b-9310-6e0e37dadec2', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('37adf0ca-0673-4012-9550-449c25452568', 'Product Dev', '9c0ee115-b030-4fe9-b828-a51303dc8db2', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('37d8ed39-89a3-4a18-9bd6-116fef4c9a04', 'Innovation Lab', '2c639357-60d5-42d2-be9e-1defac55b8a0', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('381ef927-c8d3-4116-a0f5-8742b53afd03', 'Engineering', '1f5e7ea9-e820-43f4-8a49-17aed90e36f3', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('382ecd9e-4d4e-48a4-b84f-e956c7a64df6', 'Innovation Lab', 'be61492d-5871-48db-817a-f4a6e0c54483', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('38bd9266-efd6-4e8e-b72b-40f7b90fb3b0', 'Engineering', '4ef13beb-abcf-40e4-ae08-80cfcfd0cd78', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('38e62587-0c06-4e90-8ada-b81c549f2774', 'Product Dev', 'a59a6c27-3fc0-4655-bd39-bf4a4c705eac', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('391451db-8fcd-4aba-afb0-9745da1c8cc8', 'Product Dev', 'e41952f4-7ce1-4d75-885c-213f4dfd53ce', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('392d045c-0051-4398-8d40-b3d0c16e821a', 'Core Tech', '9c0ee115-b030-4fe9-b828-a51303dc8db2', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('397810d8-002c-4898-95fd-f262c54d9795', 'Product Dev', 'f8253dc1-f357-42a6-b50a-ac447f56a964', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('39a4ec25-05f2-46f6-aeb2-8abf689cdb7f', 'Product Dev', 'ead9da0b-0ca4-45e1-8edd-a0206330e928', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('3a7820c6-8ccc-4f5e-9999-e18ae82278cb', 'Core Tech', '62312b0d-b2aa-497b-8d98-7c83c4df2020', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('3ad5b54f-d744-4cfc-8401-65acd186c7f1', 'Engineering', '6d72c08d-de17-469b-82ff-69f1456db71a', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('3b0071a9-1fb4-4827-8dcb-88a8426ab89e', 'R&D', 'd3016104-992f-4d3b-9310-6e0e37dadec2', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('3b21d6a5-8252-48bf-9690-f7f04db8db2e', 'Product Dev', '6df52b78-f488-477f-91b2-1da313384ec1', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('3b4d6260-5120-45e0-9e26-a75bfd99353c', 'Product Dev', 'dd1e82b3-177d-41f0-9442-c10afcf311c5', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('3b7d1666-6eb6-4157-aa48-593b5469928d', 'Innovation Lab', 'b6c4c7b1-049c-429f-9ce4-e6595b655ffb', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('3b7f38e9-0582-4e21-82df-aed9f7f92f24', 'Innovation Lab', '2df09386-b76e-4d12-835f-e6fda0766e79', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('3b989013-adbd-4d12-b092-281eb20fe05c', 'R&D', 'e262e28d-b01c-4a46-b837-3cdd862eec54', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('3bf6f7cb-bd41-4403-aec6-774a2a66d0ea', 'Core Tech', 'c3331794-1a07-4834-87f4-5880501166e4', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('3c374d5a-0576-4123-8d44-f0f91fd94d0c', 'Core Tech', 'dcb967f8-c2a0-43a5-b26c-dc429378dc35', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('3c74e8e7-6a7f-449f-b033-712da99ff06c', 'Engineering', '96a48484-d9b1-4395-8b14-ba7f3970fd3d', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('3c7c6c0c-6f26-4a02-b6d3-f41852581091', 'Product Dev', 'cac43e06-7d6d-47b7-8313-89c758000704', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('3cd5eefa-21bc-40cc-9019-ee03f9985d6b', 'Innovation Lab', '96a48484-d9b1-4395-8b14-ba7f3970fd3d', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('3d630e87-eb82-472a-9936-78db34f56900', 'R&D', 'bff034e2-5b16-47e7-9639-1bca59febf3b', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('3db5d870-5a8b-427e-b914-955b95342d2b', 'Core Tech', '7df87229-ef59-41ea-ba13-7742a5afd74c', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('3dd10044-c350-425e-bfaa-149f2a1c2b53', 'R&D', 'e7cff746-71ba-4766-bdad-27dc92c58ba9', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('3dd67958-d7fc-41ea-8386-6bbf53eb0fd9', 'R&D', '16484b1f-9673-4167-9629-1323ddf64d45', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('3df8b251-a996-4b94-a3da-3d656bcbcde6', 'Product Dev', '25132aa4-a089-4316-bf1e-a9ad9bb94771', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('3ec50417-1fbc-4d4b-8e24-3342e58feace', 'Engineering', '5e591485-20ed-4e90-b0e6-b7e52de4d5c7', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('4024de6d-a22e-490c-86c6-53e938488881', 'Core Tech', '74955c46-c54b-4b1a-9701-44469d030f5e', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('4061573a-7c8f-4fa8-bad9-5580aa54873e', 'Innovation Lab', 'fcd47d31-cd68-44dd-96a5-2a0cf5bbfcf0', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('40af093e-419f-4ed8-a531-3b97a7279d38', 'Core Tech', '4fdb80f0-33bb-45b2-9f94-f3ebc319fad7', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('417e9cbc-806b-4da9-86d3-f459002a7c77', 'R&D', '3e5b9df2-2b3d-46d3-8cbe-1c0fd8609e29', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('41bd2a04-7b65-4151-8a59-c7c2c6c16b5f', 'R&D', '6d72c08d-de17-469b-82ff-69f1456db71a', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('41f522a4-c69d-4938-a4bd-63bea91758d9', 'Core Tech', '9fa0cacf-0183-416d-a6ad-e3f79ab76cd1', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('41f80655-8e7f-40bb-84af-91b2038c95d7', 'Core Tech', '1f5e7ea9-e820-43f4-8a49-17aed90e36f3', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('4264e3b8-18b8-48af-9972-8c10029f9eb2', 'Engineering', 'd51da930-c45b-4cae-99c2-5372fe87070e', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('42a126d8-c627-4bf5-9371-ed1a997e5243', 'R&D', '44e13803-cc02-42c4-baa7-9f7dcda273b3', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('42bbde12-9605-45a5-b3ba-9072dac6de6b', 'Product Dev', '4f2e2c74-7508-4382-87ef-5d490b827d59', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('42c42ab3-c1e1-4ffd-953a-c4f0c6ad30e1', 'Core Tech', '6d72c08d-de17-469b-82ff-69f1456db71a', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('42ca2c48-77a3-40a1-a7d5-1ea448f71f1c', 'R&D', 'be61492d-5871-48db-817a-f4a6e0c54483', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('42ecf9e2-3813-4914-858f-39482d98ede2', 'Engineering', '276e3773-5a04-4601-bc00-58aee238ace2', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('42fa8f88-5239-48ba-a85c-63f2c3c4ceff', 'Product Dev', '8d9e2e1e-2983-4c4a-adbf-2606f4ebb953', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('432d3824-3260-42de-971e-e4c624ef8b06', 'R&D', '7add7660-3e72-4b45-b15f-88cab8488b8f', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('4356e22a-51bd-49c7-acac-50b05e4e3c7d', 'R&D', 'c44a19fc-d6d2-4b1b-a9d9-ddcf643d2af2', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('43a5d4eb-1130-4fd4-83b8-25eef81a218e', 'Product Dev', 'c0176336-1b6e-4caa-bc70-e43a55eb85b5', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('43b53de5-9960-46ca-8b0b-5030b754e15d', 'Engineering', '2f1949ca-00e0-4d6f-b69a-9d2589f2f4cd', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('43b9718e-1900-4aba-b19a-d240fafcd0df', 'Product Dev', 'd51da930-c45b-4cae-99c2-5372fe87070e', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('448c8f75-ed35-4b50-a7db-d240c75ba165', 'R&D', '276e3773-5a04-4601-bc00-58aee238ace2', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('449299da-a79e-4370-9e0f-51ae7096125c', 'Core Tech', 'a5bc1140-bb68-4ec2-b898-7a168bd9e346', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('44c2affe-b32a-4a69-9a43-dc85f3541209', 'Innovation Lab', '8cbde088-f102-435a-9ec5-672a0db2acf0', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('455a5d69-78ae-45c3-8666-3edf9022d1de', 'Innovation Lab', '52beb529-d471-4f95-aadf-4dc761e0458d', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('4579ec52-7a45-4b3b-931d-4706cad55094', 'Core Tech', 'a8dd4981-67e1-4a18-b6c2-f599ad6382c6', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('45d809a5-6c48-408d-9ba6-b254792223d7', 'Product Dev', '8d04b80b-1716-4861-8440-da7e0dd6d9d6', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('45e5b860-3948-4693-9460-075e1cd5e7c9', 'Product Dev', '60c1098b-6247-4c74-a606-e20077db5252', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('461726e6-c427-4178-b218-1be00d8d2d49', 'Innovation Lab', '457dd9c6-2472-41dc-9566-e5f490d2436a', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('4779f006-4c7f-489a-a444-fdc9c5b48c30', 'Engineering', 'ff4d2113-68cf-4bc6-8800-0a46f50b02e2', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('477f50c8-f0a3-4ad9-b8ba-1b16814d8ed8', 'Core Tech', '224e7e21-d414-4381-97e9-9085381ffb78', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('4864253c-92a1-4985-84f5-4fe217eebbad', 'R&D', '9fa0cacf-0183-416d-a6ad-e3f79ab76cd1', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('489e9abe-8da4-4f84-940b-11433f9baa1b', 'Product Dev', '16484b1f-9673-4167-9629-1323ddf64d45', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('48b2bc1a-a929-46c6-acb6-b3362fe194e3', 'R&D', 'a1783c65-4455-40c5-b0fc-3f5531438581', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('49438d36-013c-44a7-a77f-d30362f623f7', 'Engineering', 'f88edbee-4079-470f-a6af-9a453e48953b', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('49634532-aaf8-4f4f-bbbe-bf6a8acb71ac', 'Engineering', '1d592041-d205-4cec-ba6e-b57170063b66', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('4972d51b-f8cb-4861-b192-a408b604f5d8', 'R&D', '1d592041-d205-4cec-ba6e-b57170063b66', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('49fb6f38-1b95-4920-8fcf-6e122ab0091d', 'Innovation Lab', '3b560651-ee9f-409f-bdc2-86a0ce420cd9', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('4a10f2a6-b064-45a9-a976-f097d8ba1625', 'Engineering', '6674e31a-4765-4a0e-9428-ccf92bf5c7b8', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('4aa943a6-184a-46e4-937d-2415fa5ef6a3', 'R&D', '6fc44b48-8698-4601-8fe8-8dc0ee94391d', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('4adb584d-075d-47e1-a1e4-f53743fb6fda', 'Innovation Lab', '6fc44b48-8698-4601-8fe8-8dc0ee94391d', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('4b3da62f-5b27-4e37-9340-943c97d59975', 'Engineering', 'be61492d-5871-48db-817a-f4a6e0c54483', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('4b831470-3cd5-4569-ae60-b8d58a965594', 'R&D', '7d082ebf-ce23-4139-9646-08bfe6482cc9', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('4c05b304-ad0e-4b30-a038-4070e129d7e6', 'Engineering', 'a5bc1140-bb68-4ec2-b898-7a168bd9e346', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('4cca9914-eaca-4994-bd41-4f956ebfe65a', 'Engineering', '457dd9c6-2472-41dc-9566-e5f490d2436a', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('4cd57ebb-cdd0-4c4c-a027-7f2a2ca581dc', 'R&D', 'a5bc1140-bb68-4ec2-b898-7a168bd9e346', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('4e6bf9e8-7aa9-475b-b202-193f5d675689', 'Engineering', 'b4b6fac6-9d4a-4181-8372-174882eb6b9c', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('4e95007b-cb73-4622-82ba-d29b47cc3d85', 'Innovation Lab', 'b60cb204-43dd-4ed2-bb81-84e187eaeed3', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('4ec3bbb4-6df0-4910-b3d1-47a6da1c5ee1', 'Innovation Lab', '1bc58a78-470d-4791-9009-f74151708c95', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('4ee9c38a-bd54-473e-8ae8-1c75ff684e70', 'Product Dev', '7df87229-ef59-41ea-ba13-7742a5afd74c', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('4fc9c427-71b6-402e-abd2-ec8a94c48678', 'Product Dev', 'e732588f-7df2-42a7-9367-e78a0dfaf3ec', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('501a542d-d6a5-4cb1-abe8-5d4d6deacbc2', 'R&D', '980e4613-8659-4117-8d51-09ff0de48508', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('5076a166-f379-431e-8558-c8d2d1da3cc7', 'Engineering', '4e700ba1-b1f8-4a03-93a0-a53df552fe9b', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('51141217-2537-4627-a732-b890c961a3ba', 'Engineering', 'c593d6a5-04e2-40e0-9db5-2dcafed63ae2', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('513d6e8e-a864-4546-9948-17ef911c6854', 'Engineering', '5275f914-9839-4663-9b14-d6dc0cb01988', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('5150cfb9-feda-48e6-a462-bd78488d72a2', 'Product Dev', '7d01dc9f-27ae-40b0-ba92-7aedc3263290', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('52b65908-024a-4336-b210-537ef14f7c5e', 'Innovation Lab', '198bd334-462b-43ef-87d6-aa77d106d196', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('5381b40d-ee29-4b49-a735-37248d6582c7', 'Core Tech', '875186d6-05b8-4986-83be-ba0f488bd7c5', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428');
INSERT INTO `client_division` (`id`, `division_name`, `client_id`, `is_active`, `created_on`, `modified_on`, `tenant_id`) VALUES
('53a1ad0a-6d54-47c2-ae6c-aa92558f1c7b', 'R&D', '0cf157b8-2a23-4f2d-9f7a-49955489a3a6', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('540ff5dd-405d-4e37-9c10-3f77c3cde04b', 'Core Tech', '6fc44b48-8698-4601-8fe8-8dc0ee94391d', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('54416bbf-bb06-4311-b1bd-e4d5595aa69e', 'Product Dev', '13f95595-4b88-4878-ae4d-bfb5819bb738', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('54efaffb-88fe-4eed-8c1a-309edbc10418', 'R&D', '8f48639c-dc93-4987-9e2b-99e5199b8686', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('552706e2-1b15-4d82-a599-755c74e0b3e7', 'R&D', 'ea2f5c63-9986-41e9-a2d9-a271941fa159', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('55b872ec-9084-40b0-9346-a17d7d39a3f3', 'Core Tech', '52beb529-d471-4f95-aadf-4dc761e0458d', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('55edb811-bb99-4016-a807-2a18427fa4d1', 'Core Tech', '8cbde088-f102-435a-9ec5-672a0db2acf0', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('55ff9037-5d1a-40d5-bf73-b4c65a0f2fbc', 'Innovation Lab', '2f1949ca-00e0-4d6f-b69a-9d2589f2f4cd', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('567db2dd-5591-4f7b-a798-195c14dfd9e3', 'Core Tech', 'f88edbee-4079-470f-a6af-9a453e48953b', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('58135e6d-d8bb-4ce7-a9c0-c7a9b2b6dd16', 'R&D', '3ec7cac9-c998-455c-9f87-ef1e8ac28a9e', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('585a8187-b0a4-4263-a4d9-5c2bccd9def5', 'Product Dev', '39757bd3-379d-44f9-98c5-1a10fee500c6', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('5a6c0d95-f849-4355-9683-397dcf8b7063', 'Innovation Lab', '8d04b80b-1716-4861-8440-da7e0dd6d9d6', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('5ab9b676-ad68-4da8-b752-9c5768ebc19b', 'Innovation Lab', 'c0176336-1b6e-4caa-bc70-e43a55eb85b5', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('5ba9374b-e834-44ec-b3df-75e9c6ad6645', 'Engineering', '7d082ebf-ce23-4139-9646-08bfe6482cc9', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('5c55dd50-50cd-4622-9538-99f32483c08f', 'Core Tech', '6afe4c0a-071f-44ea-b69f-cd45e8e33821', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('5ca8fd56-4875-4d3a-9449-636c158d22a5', 'R&D', '79d8e63c-a0b8-4a00-a32b-961ecddd0784', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('5deca543-1b2f-4538-b823-06b3a27a69eb', 'Core Tech', 'c663d125-45fb-4d94-952c-a13744cff8e2', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('5e3ed5ca-d938-4c8d-96d3-1ae6d6864303', 'Innovation Lab', '60c1098b-6247-4c74-a606-e20077db5252', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('5e85d3a6-e8ff-485d-89a1-babf933ebc43', 'Core Tech', 'a8fa7986-082c-4bbd-a3bc-14498176938a', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('5eacef35-b7a6-476c-b0a3-85b1620947cf', 'Engineering', '6e486737-ed5d-4048-a69e-72ec52d5ccee', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('5ec26d8c-a49f-4753-91eb-1b05f8494c7f', 'R&D', '1d1ec5bd-e48c-4f2e-a350-4885f37bf4df', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('5ffe399d-e6b4-4f08-b6c4-8a59abd68b1f', 'R&D', '9ed5172e-47ba-4cd2-867a-551d1792c6e8', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('6034edac-eae9-4710-83e3-60828afed62b', 'Innovation Lab', '7ee477ec-3470-45cc-b003-a3a142844e38', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('606b9c1b-4cde-45ec-bdb5-850292aaa81d', 'Innovation Lab', '187ce580-c9c1-467a-9601-9a43547cb9a5', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('608db674-c9de-4587-8296-9870bc445ce7', 'Product Dev', 'bff034e2-5b16-47e7-9639-1bca59febf3b', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('60bd924a-a9fe-479a-8ee4-2e752a030485', 'Engineering', 'd1f46c3f-5c09-45b7-96f8-95ac3d576324', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('60ebfbc6-0cc8-46e7-b9ac-a3f25cf17cbe', 'Product Dev', '5e591485-20ed-4e90-b0e6-b7e52de4d5c7', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('6101e98f-172e-4b65-bda9-fdabb9d68ff4', 'Core Tech', '428384b5-511b-446b-8c76-7b853c52de19', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('616cbd9d-0ed8-43b6-b5eb-2caca194d5ad', 'Engineering', 'acdba1ae-8322-4092-805a-3e5fd601db26', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('61afbefe-24cc-4086-8d55-f4cbe1173e3f', 'Innovation Lab', '79d8e63c-a0b8-4a00-a32b-961ecddd0784', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('62995c41-5b15-4ce5-9670-8645e90c3aee', 'Innovation Lab', 'ead9da0b-0ca4-45e1-8edd-a0206330e928', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('62a73527-4669-4caa-a677-25af2308a550', 'Innovation Lab', '39757bd3-379d-44f9-98c5-1a10fee500c6', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('62b44228-deea-4a98-9927-db5429f9a004', 'Core Tech', '5f5cef54-dbc6-492f-874f-b0cc828a0a37', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('6301f385-e1dd-4fe8-abe2-3f650ac92192', 'Engineering', '6785309e-37ac-410e-8931-c062d17dfece', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('633551a6-31e6-4d6e-9f29-6c4bd6c6a09f', 'R&D', 'b6c4c7b1-049c-429f-9ce4-e6595b655ffb', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('6345c2ac-3ca0-4476-80c5-376bbe27dace', 'Innovation Lab', 'e41952f4-7ce1-4d75-885c-213f4dfd53ce', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('64772d5d-2460-42a4-ab9e-761a9fab7847', 'Engineering', '05c7ca9a-115a-4fa7-9f83-f1955ce729bb', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('648b4647-dc2d-43d9-bac8-85817fa5c9b8', 'Innovation Lab', 'c7e5694b-ec99-4b46-beb8-a45c14199261', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('64a5898e-6ced-4d4b-bc02-87743a33e68b', 'R&D', '875186d6-05b8-4986-83be-ba0f488bd7c5', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('64c90d58-6294-4192-9d96-17efb2562cee', 'Engineering', 'bf610abd-00a1-450d-b5e6-f26bde115c53', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('65641a6d-c564-4446-9083-727efbcf1f74', 'Engineering', '8d04b80b-1716-4861-8440-da7e0dd6d9d6', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('65f95e31-c8e1-4ab7-aa24-b5305f4ba445', 'Innovation Lab', 'a8fa7986-082c-4bbd-a3bc-14498176938a', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('66300c1b-d0ec-4473-8a0c-152d03ecec59', 'Innovation Lab', '13772153-c71a-435e-be79-c338eba873df', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('6652f7bb-ceb9-49cd-b7c0-ed5bdeaa4915', 'R&D', '6674e31a-4765-4a0e-9428-ccf92bf5c7b8', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('66d8aba3-03a7-4be4-b714-6effa8336a22', 'Engineering', '7ee477ec-3470-45cc-b003-a3a142844e38', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('66efd576-7287-45a7-b21a-bcbad29950d5', 'R&D', 'ff4d2113-68cf-4bc6-8800-0a46f50b02e2', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('67470715-6834-4c14-94d1-7746ed1a7a8a', 'Engineering', '8f455fcd-f70a-4808-944f-8062ecd9dd18', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('67c35a23-dccd-4b80-bb33-2b112775a792', 'R&D', '1f5e7ea9-e820-43f4-8a49-17aed90e36f3', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('6813f97f-60f7-4c97-a3ac-bea24ee76fbc', 'Product Dev', '05c7ca9a-115a-4fa7-9f83-f1955ce729bb', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('681e6df3-b76c-4858-9acf-4115d4b3675c', 'R&D', '2df09386-b76e-4d12-835f-e6fda0766e79', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('688e8206-22a4-4e90-b501-39217e1d26c3', 'Product Dev', '6f8572ac-271a-4bef-b46d-c5858098dd67', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('68d52cd7-ffe0-4d7d-8a80-a753af3458e6', 'R&D', '7ab5e3e4-af6f-448f-93ae-0008078341fa', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('6932abbb-d93e-4056-aa2e-0d9c56468611', 'Product Dev', '1d1ec5bd-e48c-4f2e-a350-4885f37bf4df', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('6a17522c-8b39-4c2c-8b74-c4ce84c87b59', 'Innovation Lab', '62312b0d-b2aa-497b-8d98-7c83c4df2020', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('6a9d77bf-cdd5-4e38-8268-bfc59bdfe4ea', 'Innovation Lab', '7d082ebf-ce23-4139-9646-08bfe6482cc9', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('6afba54f-dee2-4d1b-9a1b-34181abae6ac', 'Core Tech', '08d52932-25c6-4dc5-a7f3-f632e8ad0fda', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('6b2427b6-4a34-400e-9b60-b10542a3e0ab', 'Engineering', '4fdb80f0-33bb-45b2-9f94-f3ebc319fad7', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('6b4eb802-81fe-4294-88e9-2ef25fb55e8a', 'Core Tech', '60c1098b-6247-4c74-a606-e20077db5252', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('6b774df0-8a84-4bd3-bfe9-0f371b2f429f', 'Innovation Lab', '5275f914-9839-4663-9b14-d6dc0cb01988', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('6ba0f95c-40ae-41bd-a06b-fa65a5119e7e', 'Innovation Lab', '1f5e7ea9-e820-43f4-8a49-17aed90e36f3', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('6c027989-acd3-4a35-a11b-306fb5499eac', 'R&D', '8a411e86-23fa-4134-a53a-7198d9cc3f15', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('6c0aed57-3c7a-4783-b468-8583de40e4f9', 'Core Tech', 'd1f46c3f-5c09-45b7-96f8-95ac3d576324', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('6c21e1ce-2ba2-4fd4-b478-fd307ac2d69d', 'Product Dev', '6afe4c0a-071f-44ea-b69f-cd45e8e33821', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('6c81c2ad-8d6a-434e-bfdf-16322779d61d', 'Engineering', 'e60862f4-db26-495b-bb7b-a57ceeea3616', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('6c9c7761-a66e-4f47-a85d-707bc7a362b6', 'R&D', 'c593d6a5-04e2-40e0-9db5-2dcafed63ae2', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('6d22c1bd-e1bd-4c8c-8c9f-595089043d15', 'Core Tech', '5a82f70f-77d2-4863-9731-3344b9c52053', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('6de3ee49-f2a0-4242-bdbf-7e440f3b22ca', 'Core Tech', 'd5c6cb4d-637a-4f02-bf75-9b22f48da2ae', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('6e8b420f-7a71-4b23-8323-e436198f98c5', 'Innovation Lab', 'ca4d9b7f-076c-4332-aecf-0149ec0f6691', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('6f3832dd-976a-4874-acf7-6818bfe67db3', 'Engineering', 'e732588f-7df2-42a7-9367-e78a0dfaf3ec', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('6f3e5701-76f1-4a42-93c8-90f49dc28102', 'Core Tech', 'c593d6a5-04e2-40e0-9db5-2dcafed63ae2', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('6ff2b785-8983-464e-adc4-4a71572c172e', 'Product Dev', '9be7407c-ba2a-48ec-ae4a-3f6beddd2cac', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('716842a9-ec6c-4ccc-929b-a95e25af510d', 'R&D', '653d7f79-782c-4e90-b850-2c8788a53bf8', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('71946cd0-0f1c-4ca0-b2e5-ef0137d32c54', 'R&D', '30e96289-171a-47ca-ace3-f140c3d06497', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('71e0e72f-9e0f-4102-be77-2987f2210a4f', 'Core Tech', 'e60862f4-db26-495b-bb7b-a57ceeea3616', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('724be40e-da03-46b3-9090-2a5605937f87', 'Innovation Lab', '77fd50cb-c873-4e30-b4bd-e4a020bec793', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('7314a315-63a7-462a-8d21-994f56ca656c', 'Innovation Lab', 'd0c536c8-1b62-4ed9-91d7-ff64bc6988d9', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('740a7036-c7cf-4de5-8d31-f26e80de70b3', 'Innovation Lab', 'e979dffd-b360-4002-bffd-d40bddadf715', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('7477b226-cb80-419b-8af4-d6bb944ef364', 'Engineering', '1365a0d2-7b5e-4c21-9809-f904c0deb811', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('74dd0701-a651-413a-a300-2c0cf297bb94', 'R&D', '187ce580-c9c1-467a-9601-9a43547cb9a5', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('74eac61b-586f-4d26-9263-ae2817c440ee', 'Core Tech', '2fabab4f-73d3-46f8-9cb0-a345c889be2d', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('74f0802a-df8a-4248-90a8-4360f30ececf', 'Engineering', '4f2e2c74-7508-4382-87ef-5d490b827d59', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('750af161-7bbb-4ca2-9823-f2bf4effb9fe', 'Innovation Lab', 'be66e46c-fbcc-41e0-be60-fdf8f2a9e631', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('753f3d69-dfc3-4ed5-8ee4-f2b04fb59517', 'Engineering', '7d01dc9f-27ae-40b0-ba92-7aedc3263290', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('757c6065-5fc9-4b22-8930-639aa82d8426', 'Innovation Lab', 'b6ee8233-c7a1-498e-9b7d-a0ad8539edea', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('761ea19e-06e5-4345-b977-6a7cc49fde3a', 'Engineering', 'd2368302-d7df-41c2-b3b1-94b79a993c6d', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('761fe740-edb6-4015-9648-9a4653d364f3', 'Core Tech', '9ed5172e-47ba-4cd2-867a-551d1792c6e8', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('76c1b57b-8d4b-4dcb-a3da-66a9633cfc5f', 'Innovation Lab', '6785309e-37ac-410e-8931-c062d17dfece', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('777751c7-91d5-409e-8886-4b0bc241db5d', 'Product Dev', '47213dd3-b08e-4fb8-91ae-eb23fc9f9c5b', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('7781fca3-3e52-4ce1-85d4-98fff0cb61f6', 'Engineering', '2fabab4f-73d3-46f8-9cb0-a345c889be2d', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('783810f6-60ba-42c3-825e-a1bb6111b2df', 'Engineering', 'dcb967f8-c2a0-43a5-b26c-dc429378dc35', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('784aa836-baf5-4f9c-9b4a-bb637c00b7ef', 'Product Dev', '3e5b9df2-2b3d-46d3-8cbe-1c0fd8609e29', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('787af9a6-6447-41df-bf87-cb92ea4d11a1', 'Core Tech', 'c0176336-1b6e-4caa-bc70-e43a55eb85b5', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('78b1bb32-27bb-4973-a70b-46afe2eb4b59', 'Engineering', '678fad23-ec61-4325-ae59-c78134534779', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('78e6e06c-a3ff-40fd-82b9-9b250e903abf', 'R&D', '05c7ca9a-115a-4fa7-9f83-f1955ce729bb', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('78ff5b50-34ea-40b2-b624-c07595f0a970', 'Innovation Lab', '03db5c46-640d-47ca-863b-d6a8f39077a5', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('799ce23f-00af-4fb5-9f4f-9f115781c01b', 'Product Dev', 'bf610abd-00a1-450d-b5e6-f26bde115c53', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('79b5a173-cf28-40e7-94ee-7b71d68e7353', 'Engineering', 'f39e12c0-dcb9-4fc3-aa02-aa277c64277a', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('79cae499-4849-4291-a1b0-4f00f49d6ee4', 'Engineering', 'ba397226-9350-4579-8644-a8625eaeb681', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('79d4cf94-97b6-4802-a8b3-a1cbdb9c94bd', 'Core Tech', '904610e8-53bb-41a8-adbf-202a65e9ce26', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('7a5aa653-30b6-463c-8ae7-43f8bb2f9893', 'Core Tech', '457dd9c6-2472-41dc-9566-e5f490d2436a', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('7a5fd194-617c-41f6-8985-cbbd90ce95cb', 'Product Dev', 'de32f587-669e-44a7-b48a-7cd12b3543c3', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('7ab2ee7a-38ec-4fbf-9d26-36ead10e8ef3', 'Engineering', 'e979dffd-b360-4002-bffd-d40bddadf715', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('7ad7de8e-ae09-40c5-a2c4-338986213d24', 'Product Dev', '485b1dc0-89ab-4718-ae1f-fda603d0700f', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('7b558633-2c35-4ffc-a20d-9e7df613445c', 'R&D', 'a8fa7986-082c-4bbd-a3bc-14498176938a', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('7b5d9b58-0ea7-4d0f-9449-758cc68eb29d', 'Innovation Lab', 'e7cff746-71ba-4766-bdad-27dc92c58ba9', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('7b70fb3e-fbcf-4398-93ac-229353807270', 'Core Tech', 'baaaf9dd-1794-4f6e-b33d-70929ccf2bd4', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('7b825d89-893d-4fed-85e6-906ead031347', 'R&D', 'c0176336-1b6e-4caa-bc70-e43a55eb85b5', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('7bb21d3e-5189-4e75-ae13-edc733bfd780', 'Product Dev', 'e7cff746-71ba-4766-bdad-27dc92c58ba9', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('7c5c522e-139f-464d-aae4-b8c06d09a976', 'Core Tech', '6785309e-37ac-410e-8931-c062d17dfece', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('7d99630c-b62a-4336-a182-e7e9e2d334eb', 'Product Dev', 'b60cb204-43dd-4ed2-bb81-84e187eaeed3', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('7e0723b7-c325-4aeb-9027-5b5a5d648e26', 'Core Tech', '47213dd3-b08e-4fb8-91ae-eb23fc9f9c5b', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('7e16e9f6-6407-4f87-b914-6ff46b632038', 'R&D', '2c639357-60d5-42d2-be9e-1defac55b8a0', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('7e8cde49-b73e-4964-ac78-6dd703624bab', 'Innovation Lab', '980e4613-8659-4117-8d51-09ff0de48508', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('7efbe7e6-0b74-41b0-982b-5215829fd08e', 'R&D', 'a8ec09e6-70e6-4c6d-8848-d407e5ef8acf', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('7f3707fd-b0c0-4de3-913b-e9ff98369a6f', 'R&D', '8f455fcd-f70a-4808-944f-8062ecd9dd18', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('7f50af12-e959-4d82-b00a-06ebe159737c', 'Core Tech', '678fad23-ec61-4325-ae59-c78134534779', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('7f56c865-137b-4560-925e-0a525080edc2', 'Innovation Lab', 'baaaf9dd-1794-4f6e-b33d-70929ccf2bd4', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('7ff8b735-6ce7-432e-ada0-b0fc38f05ac3', 'Innovation Lab', '3d9958c2-cd85-4b3c-816c-b239f7cc181f', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('802132a2-efe5-43e0-b947-7059254147fb', 'R&D', 'ba397226-9350-4579-8644-a8625eaeb681', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('8090e161-e208-47a6-b6a2-25320e888704', 'Innovation Lab', 'e60862f4-db26-495b-bb7b-a57ceeea3616', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('8139bc32-cfc4-4998-8d95-853306c9dda4', 'R&D', 'ef436cac-2135-4dff-ac72-b9d97b55b183', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('81753c8f-ef5e-41b0-8792-be31f84b2d08', 'Innovation Lab', '81653858-30f6-4571-a569-5c4fb46a92ba', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('81e44262-3f75-4ba3-8e2c-85847e58f80d', 'Engineering', 'a8718969-8258-4d91-8955-86fefc002fc4', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('8251cd17-8f74-4112-bd4d-ee35a3761243', 'R&D', '0b4a59e6-ca50-479b-8abb-b7a229ce813a', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('826c2148-ffd2-4c3c-9a6f-bf40a87d2c4d', 'R&D', '7d3f9d1f-fb8e-4ba9-856d-2a9d4adaf1fc', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('83171048-89a5-47ae-bdf8-477b002af3a2', 'Engineering', 'd433dafe-816d-4853-8f9e-e8b6e648f8b9', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('83648cd2-3680-4117-9652-ba502bb98322', 'R&D', '614fe7aa-9d97-4ea0-8e4f-b4155efc5b75', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('84395d86-542b-4ca7-8426-906bf19fa51b', 'Innovation Lab', 'd0845a3a-7e92-405f-80ef-d803a2c4983a', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('848aaf4e-d48a-4f42-b9f8-bdb670acfd15', 'Engineering', '9ed5172e-47ba-4cd2-867a-551d1792c6e8', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('85315bef-4ded-4b70-9eb3-8c2ae74dfe8f', 'Innovation Lab', '44e13803-cc02-42c4-baa7-9f7dcda273b3', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('86364798-d1cd-475f-99fa-cf31bff34692', 'Innovation Lab', 'd2368302-d7df-41c2-b3b1-94b79a993c6d', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('867226bb-80f9-4cdd-8117-8dccd0916805', 'Core Tech', 'a8718969-8258-4d91-8955-86fefc002fc4', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('86bb568e-7659-407d-83ec-0d93851361e8', 'Innovation Lab', '7df87229-ef59-41ea-ba13-7742a5afd74c', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('86d3b980-0656-4179-b70e-74d415818c03', 'Engineering', '8cbde088-f102-435a-9ec5-672a0db2acf0', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('87a61413-9b3c-432c-a177-55af3791b46f', 'Engineering', 'dd1e82b3-177d-41f0-9442-c10afcf311c5', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('8814d618-2b98-4bcc-a542-9f1d7fabb3c6', 'R&D', 'c7e5694b-ec99-4b46-beb8-a45c14199261', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('8925cfa9-da82-4d5b-a58a-54d29bef079b', 'Product Dev', '44e13803-cc02-42c4-baa7-9f7dcda273b3', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('894b5958-0751-49c5-b362-2444a5f3156c', 'Product Dev', 'be61492d-5871-48db-817a-f4a6e0c54483', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('89d11556-5da1-40ba-b0cd-58a20515aa91', 'Product Dev', 'ae544506-69f4-4e6f-966b-26477ac675c2', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('8aacda7e-6ae1-42fc-be86-4f17bfd7551a', 'Product Dev', '1f5e7ea9-e820-43f4-8a49-17aed90e36f3', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('8b0f48fe-ce0c-479b-a93a-5b0e98d1cae2', 'Core Tech', '13f95595-4b88-4878-ae4d-bfb5819bb738', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('8b2bea8c-5ee4-49be-be8a-156fb4d36e71', 'Innovation Lab', 'd433dafe-816d-4853-8f9e-e8b6e648f8b9', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('8bd93409-925e-47ee-acd4-fdf6075a725f', 'Product Dev', 'c98ba499-8334-4528-ba80-192f08b5cf19', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('8c38142c-74dd-4fae-9c80-a440ba23183a', 'Core Tech', '03db5c46-640d-47ca-863b-d6a8f39077a5', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('8d1bfc07-b7c9-4401-b07d-fd81e3b468ba', 'Product Dev', 'd1f46c3f-5c09-45b7-96f8-95ac3d576324', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('8d1ee5b4-1cf3-4d66-9cec-cdbe44e4e814', 'Core Tech', '79d8e63c-a0b8-4a00-a32b-961ecddd0784', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('8d22d5c2-197d-4b53-9332-527757a24152', 'Product Dev', '2c639357-60d5-42d2-be9e-1defac55b8a0', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('8d3aa4a5-5d1d-42d1-b657-995ac322380d', 'R&D', '02b72110-adc9-49da-9cde-9396112fadf4', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('8d863d35-fb46-4357-ab86-d56d778a98bf', 'Engineering', '79d8e63c-a0b8-4a00-a32b-961ecddd0784', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('8db6720a-572a-437c-a308-f6eefc0c2a8a', 'R&D', '39757bd3-379d-44f9-98c5-1a10fee500c6', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('8dc9e46c-e4a2-4275-8cb6-03d61a40da7a', 'Core Tech', '39560ff6-c792-44c1-85bc-19bb36e07821', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('8e17494e-af6d-47a5-b6d4-049faf9afd83', 'Engineering', '47213dd3-b08e-4fb8-91ae-eb23fc9f9c5b', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('8e5ec944-e0f1-4989-8bf6-a0f6d0b776a5', 'R&D', 'e60862f4-db26-495b-bb7b-a57ceeea3616', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('8e993fe5-0575-4c02-a020-e294eefae0c9', 'Product Dev', '8f455fcd-f70a-4808-944f-8062ecd9dd18', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('8ea0e283-ac91-4d4f-bdd1-4c904a184fdd', 'Core Tech', 'c98ba499-8334-4528-ba80-192f08b5cf19', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('8f092761-a2b5-4838-901c-76fc3c340823', 'Product Dev', '2fabab4f-73d3-46f8-9cb0-a345c889be2d', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('8f628179-523f-44f5-90e9-3909faa50cb2', 'Engineering', 'c7e5694b-ec99-4b46-beb8-a45c14199261', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('8fa914cd-3b13-4517-bf04-a1e0dd39150c', 'Product Dev', 'c44a19fc-d6d2-4b1b-a9d9-ddcf643d2af2', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('8ff7d56a-f94e-4817-9a0e-34aa9b8105e1', 'Engineering', '60c1098b-6247-4c74-a606-e20077db5252', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('901c2f22-f4b2-46e6-9a42-dd1694a541b3', 'Innovation Lab', 'a8dd4981-67e1-4a18-b6c2-f599ad6382c6', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('902fffeb-fc78-4989-89c1-4496ab26eaf4', 'R&D', '96a48484-d9b1-4395-8b14-ba7f3970fd3d', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('90f5d1f4-532e-4aec-ad6a-c581aba016aa', 'Core Tech', '8a411e86-23fa-4134-a53a-7198d9cc3f15', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('91060712-9103-4da4-9d28-09356c8a4aa0', 'R&D', '10683583-f371-4aac-b22c-256777168f22', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('91242584-7429-4cbc-bf37-50e9f6cfa5d4', 'Core Tech', '4ef13beb-abcf-40e4-ae08-80cfcfd0cd78', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('91371e37-64b2-4e3e-a326-e79d0865a587', 'Core Tech', 'e732588f-7df2-42a7-9367-e78a0dfaf3ec', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('91b85fb0-a29d-446a-b7b3-ddd7043c86fb', 'R&D', 'ad4a87cc-b57f-4f52-b465-1f1441649239', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('921d89f1-4b03-4ff5-93fc-de84c3d356e5', 'Innovation Lab', 'd51da930-c45b-4cae-99c2-5372fe87070e', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('92689de8-ad72-4c34-9ce1-4cb96e1abb14', 'Product Dev', 'a5bc1140-bb68-4ec2-b898-7a168bd9e346', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('9296a445-6cee-4ec3-8f29-c1da5c19e2fd', 'Engineering', 'c663d125-45fb-4d94-952c-a13744cff8e2', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('92f04ef9-fe76-4639-b50d-74e5b8990d82', 'Core Tech', '10683583-f371-4aac-b22c-256777168f22', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('93342a26-bf2e-4a96-8744-33cdcc661645', 'Engineering', 'c3331794-1a07-4834-87f4-5880501166e4', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('93d7a9f7-9199-4fae-9a63-ecfd1d148716', 'Engineering', 'b6ee8233-c7a1-498e-9b7d-a0ad8539edea', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('93ed0c54-6f31-45e7-9ce8-3ef7f4449678', 'Engineering', 'd0845a3a-7e92-405f-80ef-d803a2c4983a', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('93f9e37a-246d-4c20-9bad-c744e058b31a', 'Innovation Lab', 'f39e12c0-dcb9-4fc3-aa02-aa277c64277a', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('94b37d5b-b575-4065-bdeb-be001a0e72d1', 'Core Tech', '6df52b78-f488-477f-91b2-1da313384ec1', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('94c6aea1-a038-4832-aaa8-687dae598c9e', 'Product Dev', '4e700ba1-b1f8-4a03-93a0-a53df552fe9b', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('94e67bea-8549-4a3b-85b6-7e4156413ba3', 'Innovation Lab', 'dcb967f8-c2a0-43a5-b26c-dc429378dc35', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('94fba7c7-8cf7-4941-9b89-41114a8f620c', 'Product Dev', 'b6ee8233-c7a1-498e-9b7d-a0ad8539edea', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('955a403c-7da4-4c0b-9955-7fd9c44f1e55', 'Core Tech', '276e3773-5a04-4601-bc00-58aee238ace2', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('95757058-e641-43c9-b171-a3f4dc197e04', 'Innovation Lab', '5f5cef54-dbc6-492f-874f-b0cc828a0a37', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('9588c59f-f8e0-407c-98b7-3e70a22e5f6a', 'Product Dev', '6785309e-37ac-410e-8931-c062d17dfece', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('95ac69ea-3690-422b-a274-18840e620708', 'R&D', '74955c46-c54b-4b1a-9701-44469d030f5e', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('95faaba7-3bb0-4bbc-9980-fa787997f646', 'Engineering', '653d7f79-782c-4e90-b850-2c8788a53bf8', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('96165012-170b-43ae-9bca-51cbae7a1604', 'Innovation Lab', '13f95595-4b88-4878-ae4d-bfb5819bb738', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('967f0b7e-315a-4149-b4a7-ffc40cc2df69', 'Core Tech', 'ef436cac-2135-4dff-ac72-b9d97b55b183', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('96adfa74-e0ab-44a8-9d73-0539e6c026ee', 'Innovation Lab', '0de6cd70-3c21-4489-8313-d81cb5c4c58e', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('98644d21-6e27-4b33-a79f-dd31ad5fe11f', 'Core Tech', '7ab5e3e4-af6f-448f-93ae-0008078341fa', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('986654cc-2e47-4540-893d-cc7e743c9343', 'Core Tech', '1bc58a78-470d-4791-9009-f74151708c95', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('98a40600-315f-4065-b643-590b87670054', 'Product Dev', '08d52932-25c6-4dc5-a7f3-f632e8ad0fda', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('98ace024-13fa-4a23-af00-55f0d2315eb9', 'Engineering', '8f48639c-dc93-4987-9e2b-99e5199b8686', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('992ad16c-1d31-479f-b718-8cb2c7ba71f0', 'R&D', 'a59a6c27-3fc0-4655-bd39-bf4a4c705eac', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('99411e55-210c-459e-bca9-cd051b67c3dc', 'Core Tech', '16484b1f-9673-4167-9629-1323ddf64d45', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('9a0fe7d6-900a-4861-9f56-8d6c3dfa6124', 'Core Tech', 'ea2f5c63-9986-41e9-a2d9-a271941fa159', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('9a54e275-2d12-477d-a2f7-57924d39c2cd', 'Core Tech', '2df09386-b76e-4d12-835f-e6fda0766e79', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('9accd66a-3116-4def-91a9-59140e181c5d', 'Core Tech', '3d9958c2-cd85-4b3c-816c-b239f7cc181f', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('9b1cf810-3a10-411c-a50a-bd57fb867e3b', 'Core Tech', '6e486737-ed5d-4048-a69e-72ec52d5ccee', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('9b2b783b-7675-4586-a290-56aec512fa18', 'Product Dev', '1bc58a78-470d-4791-9009-f74151708c95', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('9b4582c4-ce5f-43ce-8922-00db63eef438', 'Core Tech', '8a2f0ed2-1065-400a-9e2a-855fc815f483', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('9c941942-9fdd-4771-bdac-e9050b1fbf6a', 'Engineering', 'd0c536c8-1b62-4ed9-91d7-ff64bc6988d9', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('9ca69244-eb39-4bf2-a156-5985cc79338f', 'Core Tech', 'e41952f4-7ce1-4d75-885c-213f4dfd53ce', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('9d63f8a6-f4a2-4e77-964d-c6652f4ed19c', 'Innovation Lab', '0b4a59e6-ca50-479b-8abb-b7a229ce813a', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('9da81a04-ae4c-4a6c-a9b1-499292d777d1', 'Product Dev', '7add7660-3e72-4b45-b15f-88cab8488b8f', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('9dfb9a7e-2f70-4b39-8c6d-bf33ac48e829', 'Engineering', '904610e8-53bb-41a8-adbf-202a65e9ce26', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('9eb4d13b-6e87-4f47-83c6-9400cf491374', 'R&D', 'ea57f46a-2e41-4e1e-a0cd-fbea4439a3c2', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('a04e7048-0dc0-4036-b195-831d417f3077', 'Innovation Lab', '5a82f70f-77d2-4863-9731-3344b9c52053', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('a05fb373-3203-4e55-88b4-1fe885d43ce1', 'Product Dev', '1c84bd3f-bfe1-4d64-a4b7-6022e75446db', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('a135b6cd-dcba-43c9-8053-e4be36c2a546', 'Product Dev', '198bd334-462b-43ef-87d6-aa77d106d196', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('a152f1d2-2316-470a-a583-860d5247171c', 'R&D', '1c84bd3f-bfe1-4d64-a4b7-6022e75446db', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('a1b2c0c6-5dc7-4459-badb-813201cdd890', 'Core Tech', 'e7cff746-71ba-4766-bdad-27dc92c58ba9', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('a1fc37b5-b21f-42f8-afc5-abf139a1a91e', 'Core Tech', '1365a0d2-7b5e-4c21-9809-f904c0deb811', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('a213dd11-c687-40c2-aa3b-9202719105a3', 'Innovation Lab', '8d9e2e1e-2983-4c4a-adbf-2606f4ebb953', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('a2b3b290-fe99-480c-bb21-1c48c91b44b8', 'Innovation Lab', '7ab5e3e4-af6f-448f-93ae-0008078341fa', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('a3351e48-3059-42f3-b9d2-27b21b709840', 'Product Dev', 'd3016104-992f-4d3b-9310-6e0e37dadec2', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('a3b12eb0-831b-4a2d-91ca-350ba599ac5f', 'Core Tech', '3b560651-ee9f-409f-bdc2-86a0ce420cd9', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('a3d35936-2cf5-40e7-84b1-068e32a04429', 'Product Dev', '74955c46-c54b-4b1a-9701-44469d030f5e', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('a4bce509-3981-433c-8979-c4e8079cc3ca', 'Engineering', '1c84bd3f-bfe1-4d64-a4b7-6022e75446db', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('a4dfd1e6-bda0-465e-97fb-ee263c31f88a', 'Product Dev', '6fc44b48-8698-4601-8fe8-8dc0ee94391d', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('a4eb044d-0446-4e0f-bf66-93a633f4aeea', 'Core Tech', '614fe7aa-9d97-4ea0-8e4f-b4155efc5b75', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('a56bacc7-0179-4a2a-95ce-d3712ee1cba1', 'R&D', '5275f914-9839-4663-9b14-d6dc0cb01988', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('a56ee4d5-8e94-4caa-ba97-edf0665cc718', 'Core Tech', '980e4613-8659-4117-8d51-09ff0de48508', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('a5931ffc-3ac0-4adc-891f-1d29ee331ff4', 'Engineering', 'a8ec09e6-70e6-4c6d-8848-d407e5ef8acf', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('a5c3d27d-1bb8-4caf-9c35-ba02f033086d', 'Engineering', 'd3016104-992f-4d3b-9310-6e0e37dadec2', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('a5eb7907-6a85-41e5-825c-0fe6642d7e90', 'Innovation Lab', '224e7e21-d414-4381-97e9-9085381ffb78', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('a6106156-7c04-487e-8bbd-333744472f00', 'R&D', '2fabab4f-73d3-46f8-9cb0-a345c889be2d', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('a66d8352-d116-4d43-89f7-e2e9490c68c2', 'Engineering', '25132aa4-a089-4316-bf1e-a9ad9bb94771', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('a6ab6454-2484-43bc-998e-88def92ae91e', 'R&D', '81653858-30f6-4571-a569-5c4fb46a92ba', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('a84b47af-8dd3-4b6e-8353-b1c313071b0a', 'Innovation Lab', 'c44a19fc-d6d2-4b1b-a9d9-ddcf643d2af2', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('a8d70206-5b7b-4e70-9594-14642182b6a5', 'Product Dev', 'e979dffd-b360-4002-bffd-d40bddadf715', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('a9079ffb-06f4-4a68-a9ce-008034f9dd59', 'Engineering', 'b60cb204-43dd-4ed2-bb81-84e187eaeed3', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('a9103daa-5210-4c4c-a4a8-e9e0e0a3abc2', 'Innovation Lab', '3aa97790-fd9e-4db3-aded-378bf8bd14a5', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('a93d48fb-7a7e-46d0-af11-af962f52440b', 'Core Tech', '0b4a59e6-ca50-479b-8abb-b7a229ce813a', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('a98a0f0c-a030-4382-a717-5ac6eb56917c', 'R&D', 'f8253dc1-f357-42a6-b50a-ac447f56a964', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('aa038d5e-c9e9-4f6c-9168-560ad27353a5', 'Engineering', 'ca4d9b7f-076c-4332-aecf-0149ec0f6691', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('aa673fd1-6375-4a35-bf01-e265da676625', 'R&D', '77fd50cb-c873-4e30-b4bd-e4a020bec793', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('aa8c6026-5bd1-4a8e-95f9-8e426ffff01f', 'R&D', '5e591485-20ed-4e90-b0e6-b7e52de4d5c7', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('ab0f2af6-dd37-40db-ae55-67d5361508b5', 'Engineering', '875186d6-05b8-4986-83be-ba0f488bd7c5', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('ab939665-8b49-48c7-a130-fff06a23a1ac', 'Engineering', '9be7407c-ba2a-48ec-ae4a-3f6beddd2cac', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('abb7ca53-4411-43f1-804a-0aebb2bc2ee2', 'Core Tech', '7d3f9d1f-fb8e-4ba9-856d-2a9d4adaf1fc', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('ac50b045-f424-46e5-95dc-9a0637325086', 'Core Tech', '0de6cd70-3c21-4489-8313-d81cb5c4c58e', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('ac562752-1ce7-4fd5-a0c9-de9b1cae300c', 'Innovation Lab', '6f8572ac-271a-4bef-b46d-c5858098dd67', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('acd7b9db-e797-4246-8bfe-7e3b75441130', 'Engineering', 'b6c4c7b1-049c-429f-9ce4-e6595b655ffb', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('ad58d36f-06da-4afc-8fd2-450754c07d7e', 'Core Tech', '3e5b9df2-2b3d-46d3-8cbe-1c0fd8609e29', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('ae993772-5ca4-4ca4-880f-38ea335a2d3e', 'Product Dev', 'fcd47d31-cd68-44dd-96a5-2a0cf5bbfcf0', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('aea68142-d926-49e2-9031-d8e10f473fc7', 'Engineering', '7d3f9d1f-fb8e-4ba9-856d-2a9d4adaf1fc', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('aef0dcbd-bc59-49f6-8633-6e091ec2bd96', 'Engineering', '0de6cd70-3c21-4489-8313-d81cb5c4c58e', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('af1052ad-5b83-47e6-9e40-d817d6b382ef', 'Engineering', '2df09386-b76e-4d12-835f-e6fda0766e79', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('af2bc169-c2a0-4a8a-a209-db3f400e92d0', 'Product Dev', '3d9958c2-cd85-4b3c-816c-b239f7cc181f', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('af8960ee-bdc1-4667-8719-34266150426c', 'R&D', '3aa97790-fd9e-4db3-aded-378bf8bd14a5', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('afc0254a-4f05-435b-9f9c-fb0caa384126', 'Engineering', 'de32f587-669e-44a7-b48a-7cd12b3543c3', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('afd99ee0-0a46-47d0-bd52-4bb403bf3030', 'Engineering', '77fd50cb-c873-4e30-b4bd-e4a020bec793', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('b01fd44b-3590-4fa4-b19a-b22297f444b2', 'Product Dev', '7ee477ec-3470-45cc-b003-a3a142844e38', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('b073af55-6a9f-46cd-a286-8dc37438e003', 'Innovation Lab', '1365a0d2-7b5e-4c21-9809-f904c0deb811', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('b0dea1b8-b5de-4032-a9e0-09b9c87421e9', 'Innovation Lab', '7add7660-3e72-4b45-b15f-88cab8488b8f', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('b13f9ae8-372a-415d-b495-24c8d7b94ee9', 'Engineering', '614fe7aa-9d97-4ea0-8e4f-b4155efc5b75', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('b1683705-6882-417d-a109-ea1794ad99ef', 'Engineering', '6fc44b48-8698-4601-8fe8-8dc0ee94391d', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('b183053b-7921-428d-bc3f-91d75494bcf6', 'Engineering', 'a8dd4981-67e1-4a18-b6c2-f599ad6382c6', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('b1f4ef02-8aeb-4e0a-abba-fb5ad445f8f6', 'Core Tech', '485b1dc0-89ab-4718-ae1f-fda603d0700f', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('b1f82a31-d833-440c-8ada-8403c98c3988', 'R&D', '457dd9c6-2472-41dc-9566-e5f490d2436a', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('b1f863cc-d503-4106-bc17-977aec601361', 'R&D', '1365a0d2-7b5e-4c21-9809-f904c0deb811', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('b24515e1-0caa-4303-b59a-d4489bb108df', 'R&D', '08d52932-25c6-4dc5-a7f3-f632e8ad0fda', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('b249392d-ad15-4345-ac94-faffd292d3f7', 'Core Tech', 'b6ee8233-c7a1-498e-9b7d-a0ad8539edea', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('b24b5402-3004-48f0-8d28-2de7f7c72b4d', 'Product Dev', '62312b0d-b2aa-497b-8d98-7c83c4df2020', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('b28e6ea0-12c9-47fd-8546-c193ae52b6f9', 'Product Dev', '9fa0cacf-0183-416d-a6ad-e3f79ab76cd1', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('b305e4af-4efc-4939-acaf-73c914dde936', 'Core Tech', 'd0845a3a-7e92-405f-80ef-d803a2c4983a', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('b36fd897-44c0-47fc-b336-5ef5b5956713', 'R&D', '31f83145-2452-451c-a13f-5a0235a7976a', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('b42b8ad4-0477-4e1b-96cc-18af74cbecc0', 'Product Dev', 'ba397226-9350-4579-8644-a8625eaeb681', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('b44ee113-6a81-4bd4-b5f5-6a51f0211bc9', 'R&D', 'f39e12c0-dcb9-4fc3-aa02-aa277c64277a', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('b44fafa6-585a-4faf-9230-5533d28110b6', 'Product Dev', 'b6c4c7b1-049c-429f-9ce4-e6595b655ffb', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('b4bbb8c5-2f1a-496d-9638-324331c300c6', 'R&D', 'dd1e82b3-177d-41f0-9442-c10afcf311c5', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('b4bda56e-57e0-45c3-8946-63f497a119fd', 'Engineering', 'fcd47d31-cd68-44dd-96a5-2a0cf5bbfcf0', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('b4c5ccda-cf95-4951-a523-8485b6d1a827', 'Engineering', 'ead9da0b-0ca4-45e1-8edd-a0206330e928', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('b4f8b54a-a744-4eb0-a958-2d0b8c2f5792', 'Innovation Lab', '1c84bd3f-bfe1-4d64-a4b7-6022e75446db', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('b5964f7e-2f19-4d59-bf8f-0971b5506f6d', 'R&D', 'bf610abd-00a1-450d-b5e6-f26bde115c53', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428');
INSERT INTO `client_division` (`id`, `division_name`, `client_id`, `is_active`, `created_on`, `modified_on`, `tenant_id`) VALUES
('b5bff7ed-894a-482a-977c-1b0eb1586ce2', 'Product Dev', '1365a0d2-7b5e-4c21-9809-f904c0deb811', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('b5e4cd38-cdc1-400f-a162-8362275af78e', 'Product Dev', 'ef436cac-2135-4dff-ac72-b9d97b55b183', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('b6a9429c-9f06-4bec-9445-941499ddde41', 'R&D', '8d04b80b-1716-4861-8440-da7e0dd6d9d6', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('b7a26dcb-4420-4825-b5ee-cf628584f4bd', 'Innovation Lab', '2fabab4f-73d3-46f8-9cb0-a345c889be2d', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('b81b66e6-b048-4bf0-b77b-c80340adfd45', 'Engineering', '224e7e21-d414-4381-97e9-9085381ffb78', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('b94f7df4-87ca-4595-bed9-cf18edf8a421', 'Innovation Lab', 'f88edbee-4079-470f-a6af-9a453e48953b', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('b9a4f212-9a3a-4d75-b2f2-8e85d4344eb5', 'R&D', 'd1f46c3f-5c09-45b7-96f8-95ac3d576324', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('b9cd257f-7d57-4e40-9fb4-aa9874581f85', 'Engineering', '3ec7cac9-c998-455c-9f87-ef1e8ac28a9e', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('ba98b725-24f3-4014-9dee-155a4e8aab7e', 'Product Dev', 'd0845a3a-7e92-405f-80ef-d803a2c4983a', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('baadd277-9a07-4e49-a4c8-37525dc60032', 'Innovation Lab', '4ef13beb-abcf-40e4-ae08-80cfcfd0cd78', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('bae640d4-89ec-4e5b-bc7f-720f9fc1c71a', 'R&D', '4f2e2c74-7508-4382-87ef-5d490b827d59', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('bbd5499b-b4e0-46de-8c23-4b9de53bd182', 'Innovation Lab', 'cac43e06-7d6d-47b7-8313-89c758000704', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('bbe4a606-f66a-4205-a17c-246e13933d81', 'R&D', '52beb529-d471-4f95-aadf-4dc761e0458d', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('bbf02464-c5b4-4b8b-a92b-2c9f1c96da5a', 'Engineering', '7ab5e3e4-af6f-448f-93ae-0008078341fa', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('bc04da51-c449-40e5-bbe7-2cbe6205cedd', 'Product Dev', '8a411e86-23fa-4134-a53a-7198d9cc3f15', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('bc3e28f5-1b99-4a99-ad6e-17e21e86479e', 'Innovation Lab', '8f48639c-dc93-4987-9e2b-99e5199b8686', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('bd2f6d67-77b7-4cf5-ae9f-fd479051673f', 'Innovation Lab', 'ba397226-9350-4579-8644-a8625eaeb681', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('bd8a7b8e-444e-4df2-b832-69f95cde82b7', 'Innovation Lab', '30e96289-171a-47ca-ace3-f140c3d06497', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('bd93c518-cbf3-44e8-9b0d-f9dcf2207542', 'Innovation Lab', '50a42e60-4a1d-4fc2-9933-840f0fae80fb', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('bde3beeb-e19a-4d01-805a-18e3dfe8919c', 'Core Tech', 'ea57f46a-2e41-4e1e-a0cd-fbea4439a3c2', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('be3fe0f3-8bc2-4ccc-9f29-b20e6bf78a86', 'R&D', 'b60cb204-43dd-4ed2-bb81-84e187eaeed3', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('be7f4c54-5c60-4515-b540-78b836b8f39c', 'Product Dev', '31f83145-2452-451c-a13f-5a0235a7976a', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('be8db61e-2bbc-4024-8a4c-600bbe84416f', 'Product Dev', 'baaaf9dd-1794-4f6e-b33d-70929ccf2bd4', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('be92e228-6b78-4e3e-ab59-9c27158c3766', 'R&D', '8cbde088-f102-435a-9ec5-672a0db2acf0', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('bed8b851-187f-4952-8216-d37981af717f', 'R&D', '6f8572ac-271a-4bef-b46d-c5858098dd67', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('bf160721-163d-4373-9164-8c2b86625960', 'Engineering', '3e5b9df2-2b3d-46d3-8cbe-1c0fd8609e29', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('bf23ecbb-2a50-4fff-8713-3353cea29a11', 'Innovation Lab', '9ed5172e-47ba-4cd2-867a-551d1792c6e8', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('bfe78ff5-6608-4661-8714-24a9ae2dd49f', 'Engineering', 'e7cff746-71ba-4766-bdad-27dc92c58ba9', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('bffad5d1-2203-49d6-829a-938cb7e8e5e1', 'Core Tech', '1c84bd3f-bfe1-4d64-a4b7-6022e75446db', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('c0383249-4a6e-403f-a9f6-ddc161e50cc8', 'Engineering', '3d9958c2-cd85-4b3c-816c-b239f7cc181f', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('c04a6d35-2694-43f4-a39a-a673d8ae29e8', 'Product Dev', 'ea57f46a-2e41-4e1e-a0cd-fbea4439a3c2', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('c0767e4c-5d91-4a69-9977-e7076ab825af', 'Product Dev', 'c3331794-1a07-4834-87f4-5880501166e4', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('c0893e1d-e6a9-40ca-a049-ee234fa9588a', 'Engineering', 'cac43e06-7d6d-47b7-8313-89c758000704', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('c08b9f73-0ec4-4273-ac3b-3dfc036a8c04', 'Engineering', 'ca18fd5a-fe68-4ff3-aba7-ebf59e5281a2', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('c0a028dd-d033-419d-b7af-8aac104d662d', 'Core Tech', 'b4b6fac6-9d4a-4181-8372-174882eb6b9c', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('c0b83689-1be2-4482-99e4-03a885496c03', 'Core Tech', 'ca4d9b7f-076c-4332-aecf-0149ec0f6691', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('c0d12dc9-8b27-4655-8929-0582426bd308', 'Core Tech', 'f39e12c0-dcb9-4fc3-aa02-aa277c64277a', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('c1165b93-4aec-4feb-9945-a2cdea26c9de', 'Innovation Lab', '653d7f79-782c-4e90-b850-2c8788a53bf8', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('c11cbd10-fcac-4abc-a901-85b310550728', 'Product Dev', 'a8fa7986-082c-4bbd-a3bc-14498176938a', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('c12fc9d6-5375-4fbf-abf3-5b9971d627c3', 'Innovation Lab', 'ef436cac-2135-4dff-ac72-b9d97b55b183', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('c130fcbe-8389-4c13-bc7b-746524bd7189', 'Core Tech', 'c7e5694b-ec99-4b46-beb8-a45c14199261', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('c2580c08-6025-4c22-8743-45f4eef59abf', 'Core Tech', 'd433dafe-816d-4853-8f9e-e8b6e648f8b9', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('c3120be4-dbc7-4342-832b-6012435b6000', 'R&D', '5a82f70f-77d2-4863-9731-3344b9c52053', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('c316b3e8-5b66-4538-a048-43f67bfedc8d', 'Innovation Lab', '5e591485-20ed-4e90-b0e6-b7e52de4d5c7', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('c3d6e54c-ded0-4a70-9c36-8bfb1c852ad5', 'R&D', '13772153-c71a-435e-be79-c338eba873df', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('c427088e-aa95-4929-abaf-2d3e1a293de8', 'Product Dev', 'ca18fd5a-fe68-4ff3-aba7-ebf59e5281a2', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('c42b7564-dea3-4ad9-8826-c161d61b326f', 'Core Tech', 'ae544506-69f4-4e6f-966b-26477ac675c2', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('c473302d-0a00-47f9-aa91-d0a51c7a1470', 'R&D', '678fad23-ec61-4325-ae59-c78134534779', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('c4b6ed12-4949-4ceb-8fad-cbd22eed5136', 'Product Dev', 'a1783c65-4455-40c5-b0fc-3f5531438581', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('c540f509-0eec-4180-acc5-33fc114e318a', 'Core Tech', '187ce580-c9c1-467a-9601-9a43547cb9a5', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('c55126db-bbf2-433f-b518-a85f6908d091', 'R&D', '50a42e60-4a1d-4fc2-9933-840f0fae80fb', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('c5581aed-db61-4622-85dd-0a72f9e99ff5', 'Innovation Lab', 'bf610abd-00a1-450d-b5e6-f26bde115c53', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('c573eaaa-5878-4459-a418-2c08ae030adc', 'Product Dev', 'f39e12c0-dcb9-4fc3-aa02-aa277c64277a', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('c591600a-bc01-4bc8-a2ee-3bb440fcc743', 'Engineering', 'ea57f46a-2e41-4e1e-a0cd-fbea4439a3c2', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('c5f985cb-16d4-4dd2-94ca-6573632163d0', 'Product Dev', 'b4b6fac6-9d4a-4181-8372-174882eb6b9c', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('c6aa14e1-b3c0-47f8-bf42-71712043ea31', 'Core Tech', '34baf4fc-c607-40f9-b0a6-c27098d08235', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('c70f1f1d-b73e-4af4-a4fb-dbb055b20a3f', 'Engineering', 'e262e28d-b01c-4a46-b837-3cdd862eec54', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('c753209b-2bc9-4a20-841e-1ad22e902b5a', 'Innovation Lab', 'c593d6a5-04e2-40e0-9db5-2dcafed63ae2', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('c7d68391-a552-40f9-9b26-e7873cb8b19c', 'Product Dev', '5a82f70f-77d2-4863-9731-3344b9c52053', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('c89e273f-fde9-4bde-a789-2061d426fd65', 'Innovation Lab', '1d592041-d205-4cec-ba6e-b57170063b66', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('c8a721db-611a-4b4f-860c-a98ac42dba11', 'Engineering', 'ea2f5c63-9986-41e9-a2d9-a271941fa159', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('c8d2b67b-8a02-4547-b2c2-6572485e7b02', 'Core Tech', '1d592041-d205-4cec-ba6e-b57170063b66', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('c98346e1-639a-4646-aa36-cb36344f50ee', 'Core Tech', '6674e31a-4765-4a0e-9428-ccf92bf5c7b8', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('c98e5d02-a919-41dc-ab25-fd59d1d461bd', 'R&D', 'e732588f-7df2-42a7-9367-e78a0dfaf3ec', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('c9ecd3b3-b80f-4e56-8513-e4af8f8cfbbf', 'R&D', '7d01dc9f-27ae-40b0-ba92-7aedc3263290', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('ca4830f3-0e87-482b-8610-5d2e65e41a1e', 'Product Dev', '3aa97790-fd9e-4db3-aded-378bf8bd14a5', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('cb0fc6bd-6510-4874-95a6-24f63cab5c88', 'Product Dev', '6d72c08d-de17-469b-82ff-69f1456db71a', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('cb3adb6a-853b-487f-9eff-a69d6ea93ff3', 'Product Dev', '9ed5172e-47ba-4cd2-867a-551d1792c6e8', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('cb9d313c-8bb1-4fc2-b7df-eb66c39809d7', 'R&D', 'ca18fd5a-fe68-4ff3-aba7-ebf59e5281a2', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('cc54645e-aff9-41da-9627-5933c9b721c9', 'Core Tech', 'fcd47d31-cd68-44dd-96a5-2a0cf5bbfcf0', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('cdbc585b-5f41-4d67-bb0b-3ff674c252d0', 'R&D', 'd0845a3a-7e92-405f-80ef-d803a2c4983a', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('ceef5d1e-c14b-48a9-887a-44aeb8885434', 'Innovation Lab', '9fa0cacf-0183-416d-a6ad-e3f79ab76cd1', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('cf22416e-1c78-4e67-aa28-e25d755c324f', 'Product Dev', '653d7f79-782c-4e90-b850-2c8788a53bf8', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('cfdf0263-4fdc-4f9e-8ece-dfe5b8610a47', 'Innovation Lab', '3ec7cac9-c998-455c-9f87-ef1e8ac28a9e', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('d0d87fad-f1ff-414d-99f5-e1b4105e539b', 'Innovation Lab', 'ea2f5c63-9986-41e9-a2d9-a271941fa159', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('d0e2b7d6-4a2c-43b1-a034-0bdf4276e65e', 'Engineering', 'be66e46c-fbcc-41e0-be60-fdf8f2a9e631', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('d0e2b92a-c72d-4ec7-879b-0341d5479309', 'Innovation Lab', 'c663d125-45fb-4d94-952c-a13744cff8e2', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('d1a8855b-9f21-4dd0-85eb-9b9d7615f26f', 'Engineering', '7df87229-ef59-41ea-ba13-7742a5afd74c', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('d2033aaa-659c-4731-ae45-0fc7e9d4d4a6', 'Core Tech', 'd51da930-c45b-4cae-99c2-5372fe87070e', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('d210f6f5-a91a-4386-97fd-494ceba3574f', 'Engineering', '31f83145-2452-451c-a13f-5a0235a7976a', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('d2f01347-48e0-452a-9371-ec7f3fd697c7', 'Innovation Lab', 'c3331794-1a07-4834-87f4-5880501166e4', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('d33e0fac-3c83-4776-8626-cf5956fb2bc5', 'R&D', 'c98ba499-8334-4528-ba80-192f08b5cf19', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('d362f51f-5f5d-432a-9daa-941983a2ba0b', 'Innovation Lab', '904610e8-53bb-41a8-adbf-202a65e9ce26', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('d3e2def7-0fbd-4b40-b409-3837d87d4dc4', 'R&D', 'd51da930-c45b-4cae-99c2-5372fe87070e', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('d4068a93-b839-48b2-8968-91ea7571626e', 'Engineering', '1a270724-708c-4417-adce-9b731904ae86', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('d44facd3-678c-41da-9cf9-f2a17067a550', 'Core Tech', 'be66e46c-fbcc-41e0-be60-fdf8f2a9e631', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('d538e226-388b-4e73-bf18-6684d218359d', 'R&D', '7df87229-ef59-41ea-ba13-7742a5afd74c', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('d539c9a9-2661-4764-a426-96deb3d3fbbb', 'Innovation Lab', 'a8718969-8258-4d91-8955-86fefc002fc4', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('d580857a-9784-4039-8c04-e3913529a942', 'Innovation Lab', 'f8253dc1-f357-42a6-b50a-ac447f56a964', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('d598ca93-a860-4e96-a4cb-03a50febab9e', 'R&D', 'd0c536c8-1b62-4ed9-91d7-ff64bc6988d9', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('d606c269-170f-4f53-b2dc-7ebead53781d', 'R&D', '6df52b78-f488-477f-91b2-1da313384ec1', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('d64ab9c2-4858-4d17-9cb0-ede6e5a06788', 'Core Tech', 'bff034e2-5b16-47e7-9639-1bca59febf3b', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('d6bcf53d-bbe7-4ee1-9f37-993d61577f07', 'Product Dev', '5f5cef54-dbc6-492f-874f-b0cc828a0a37', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('d74de2ce-10bd-4998-9206-5a3cf317b34b', 'Innovation Lab', 'de32f587-669e-44a7-b48a-7cd12b3543c3', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('d76b4ce7-22c2-47f6-90e0-27e2e9373212', 'Product Dev', '1a270724-708c-4417-adce-9b731904ae86', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('d7c50168-0943-47cd-bbc9-14e882db82ee', 'Innovation Lab', '1a270724-708c-4417-adce-9b731904ae86', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('d856022f-b51e-427a-ab79-66bd40bb450a', 'Product Dev', '6e486737-ed5d-4048-a69e-72ec52d5ccee', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('d940ec53-0433-4da1-a33b-3ba6444e26a4', 'R&D', 'f88edbee-4079-470f-a6af-9a453e48953b', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('d9455540-5da8-455e-9626-4856121225d2', 'Engineering', '52beb529-d471-4f95-aadf-4dc761e0458d', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('d9833303-01a1-402b-bded-bac7b6aebf78', 'Engineering', 'ae544506-69f4-4e6f-966b-26477ac675c2', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('d9934567-b617-468b-8a6b-c0e23e38c41b', 'Engineering', '8a411e86-23fa-4134-a53a-7198d9cc3f15', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('da56c534-f682-45b8-9b46-0c60de95033d', 'Core Tech', '7d082ebf-ce23-4139-9646-08bfe6482cc9', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('da629fff-c4ab-4182-a7b5-ba11c306720b', 'Core Tech', '198bd334-462b-43ef-87d6-aa77d106d196', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('db4c8f8a-d8de-4ade-bd98-f114d51f7685', 'Engineering', '8a2f0ed2-1065-400a-9e2a-855fc815f483', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('dc1a1840-6143-4dd4-8046-155046ad3e8f', 'Product Dev', '1d592041-d205-4cec-ba6e-b57170063b66', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('dc2b96f9-0d2e-4000-a983-cf712cb8d50c', 'Product Dev', 'ff4d2113-68cf-4bc6-8800-0a46f50b02e2', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('dcc1daf0-667d-4bf2-b6fe-5af9419d3cbb', 'Product Dev', 'dcb967f8-c2a0-43a5-b26c-dc429378dc35', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('dcc1f0ea-5255-4df2-8a70-059e5c5f716a', 'R&D', '47213dd3-b08e-4fb8-91ae-eb23fc9f9c5b', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('dd13cd62-452d-407d-a9be-8d60ab41ad33', 'Engineering', '39757bd3-379d-44f9-98c5-1a10fee500c6', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('dd803b60-1f58-4e38-9847-a558ca6a5ec8', 'Engineering', '6df52b78-f488-477f-91b2-1da313384ec1', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('dd9fe3d1-e414-470c-9ff5-3118b5aa9fc1', 'Product Dev', '276e3773-5a04-4601-bc00-58aee238ace2', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('de03181d-2f35-461f-86d0-ec2c3b3836bd', 'Innovation Lab', '05c7ca9a-115a-4fa7-9f83-f1955ce729bb', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('de119b30-3cd8-45bd-87da-043ce612f8b3', 'Engineering', '8d9e2e1e-2983-4c4a-adbf-2606f4ebb953', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('de4e1496-e028-442a-893a-11e2ebb11e13', 'Product Dev', '52beb529-d471-4f95-aadf-4dc761e0458d', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('de856fbc-e23c-4357-89de-0e0956f7b28b', 'Product Dev', '81653858-30f6-4571-a569-5c4fb46a92ba', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('def0d149-4e65-40e9-82d7-a91b248c9ba5', 'R&D', '428384b5-511b-446b-8c76-7b853c52de19', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('df4403f9-b498-46a3-b0ce-c15e8598cc46', 'R&D', '485b1dc0-89ab-4718-ae1f-fda603d0700f', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('df903d82-74a6-4e91-ada9-08b983776a3b', 'Product Dev', 'c7e5694b-ec99-4b46-beb8-a45c14199261', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('e00e88b8-f278-4792-aded-96b30951f859', 'Product Dev', '224e7e21-d414-4381-97e9-9085381ffb78', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('e04664fa-caa0-412a-850e-ff5ccdaeffd8', 'R&D', '62312b0d-b2aa-497b-8d98-7c83c4df2020', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('e0f1c64f-5d32-499d-9c2e-b7102825198a', 'Innovation Lab', 'ff4d2113-68cf-4bc6-8800-0a46f50b02e2', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('e0f967b2-1d24-4bda-baf8-20942085977d', 'Core Tech', 'a59a6c27-3fc0-4655-bd39-bf4a4c705eac', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('e161f8af-6c2b-43d2-a936-b14f03604767', 'Core Tech', '25132aa4-a089-4316-bf1e-a9ad9bb94771', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('e19d845d-6ff8-44a5-ae2a-8f797c750969', 'Engineering', '81653858-30f6-4571-a569-5c4fb46a92ba', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('e220c53d-1058-459b-97b3-e810e05145c2', 'Product Dev', 'e60862f4-db26-495b-bb7b-a57ceeea3616', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('e3fef43d-f48d-4432-8868-8687b2fde606', 'Core Tech', 'd3016104-992f-4d3b-9310-6e0e37dadec2', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('e467e424-5f03-445b-a0b3-08fb4ff30ce4', 'Innovation Lab', '74955c46-c54b-4b1a-9701-44469d030f5e', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('e4b4fc04-6968-4d0d-9fe1-6f4c5571366d', 'Engineering', '13772153-c71a-435e-be79-c338eba873df', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('e4b92cf2-7eba-4c70-a080-dc2abd4261cc', 'Engineering', '02b72110-adc9-49da-9cde-9396112fadf4', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('e527f334-1628-4512-8dba-0225c153e267', 'Product Dev', 'a8ec09e6-70e6-4c6d-8848-d407e5ef8acf', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('e5bb0737-b7ad-43bc-b50f-cdc6c5075810', 'R&D', '60c1098b-6247-4c74-a606-e20077db5252', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('e63ac7b1-fb16-4b42-97f1-7968f3066e87', 'R&D', '3d9958c2-cd85-4b3c-816c-b239f7cc181f', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('e647d000-b2fe-4b54-9e3a-8f1d0e45ccdf', 'Core Tech', 'e2eed471-9081-412c-bcb5-4198ed86ffe5', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('e698235d-0d14-499a-ad5e-841e5c4ee692', 'Innovation Lab', 'a1783c65-4455-40c5-b0fc-3f5531438581', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('e69f75ed-eec8-4666-9b73-25f313e68a84', 'Engineering', 'baaaf9dd-1794-4f6e-b33d-70929ccf2bd4', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('e7280f25-36b7-42f0-acfa-0d283a0c72d4', 'Innovation Lab', '4f2e2c74-7508-4382-87ef-5d490b827d59', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('e7707a78-26c5-4611-9c99-7c029653898c', 'Core Tech', 'd0c536c8-1b62-4ed9-91d7-ff64bc6988d9', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('e7c252da-6629-48fe-96a9-234f2ae73ee3', 'Engineering', '50a42e60-4a1d-4fc2-9933-840f0fae80fb', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('e84ecd80-4d01-465f-85c0-6214f72174e8', 'R&D', '6785309e-37ac-410e-8931-c062d17dfece', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('e875bb99-44b3-45e8-b6bb-ee57c214ab63', 'Engineering', 'a8fa7986-082c-4bbd-a3bc-14498176938a', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('e90ca066-1b92-4f67-9170-de28d7dbc90f', 'R&D', 'b6ee8233-c7a1-498e-9b7d-a0ad8539edea', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('e99ef993-00ac-490c-9f28-eed3fcaf06b1', 'Engineering', '7add7660-3e72-4b45-b15f-88cab8488b8f', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('e9a5c4c8-1a76-4ec6-9566-d1599b7516ca', 'R&D', '8d9e2e1e-2983-4c4a-adbf-2606f4ebb953', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('e9ac15ab-51d8-45fa-9303-d6ef57d7f56b', 'Core Tech', '7ee477ec-3470-45cc-b003-a3a142844e38', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('e9bd6717-f793-4527-bc3d-212e4d4a86a9', 'Engineering', '0b4a59e6-ca50-479b-8abb-b7a229ce813a', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('e9f2b8d8-fea8-4066-a70e-72e94e1e158f', 'R&D', 'dcb967f8-c2a0-43a5-b26c-dc429378dc35', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('ea4ad3e7-e69a-4fe6-a15a-7d9f2f839504', 'R&D', 'ead9da0b-0ca4-45e1-8edd-a0206330e928', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('ead9dd56-e4fb-4ca6-b951-8a4c8aa56669', 'Core Tech', '31f83145-2452-451c-a13f-5a0235a7976a', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('eba6c447-4da7-453e-ac06-9ccfa2249e79', 'Product Dev', '13772153-c71a-435e-be79-c338eba873df', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('ebf7ab76-c4bb-43b1-a0c3-e49d22a5d9f9', 'Core Tech', '5f83fb34-45da-4699-bd4c-a2b401c30ef9', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('ec25a8c0-acf9-4f90-a23a-78ba94e416e2', 'Engineering', 'e2eed471-9081-412c-bcb5-4198ed86ffe5', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('ecc751fe-f744-4ffd-a840-2cf37484ff6e', 'Product Dev', '0b4a59e6-ca50-479b-8abb-b7a229ce813a', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('ed4b67f8-8b38-4233-82b7-5d408e7ebe87', 'Engineering', '980e4613-8659-4117-8d51-09ff0de48508', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('ed5b7d7b-5fb7-4735-8c20-c09f3eaacaa3', 'Innovation Lab', '8a411e86-23fa-4134-a53a-7198d9cc3f15', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('ed67d5c9-827f-4492-bb89-f9eb08231752', 'Core Tech', '7add7660-3e72-4b45-b15f-88cab8488b8f', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('ed8b094a-df7d-449c-a46e-250c501e87e7', 'Innovation Lab', '02b72110-adc9-49da-9cde-9396112fadf4', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('ee568f46-ab09-4e27-bff4-72e3cac6d946', 'Product Dev', '4fdb80f0-33bb-45b2-9f94-f3ebc319fad7', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('ee81abff-e6e8-48b1-87f3-b44e59771336', 'R&D', 'd433dafe-816d-4853-8f9e-e8b6e648f8b9', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('eec2af6d-710b-40cb-86b1-0bb3b847c9b7', 'Product Dev', 'acdba1ae-8322-4092-805a-3e5fd601db26', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('ef84331a-6ba7-4eba-9d89-ecdeb5a0db78', 'Innovation Lab', 'ea57f46a-2e41-4e1e-a0cd-fbea4439a3c2', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('ef8e0bdd-e111-4e93-bccd-034394e4fcf3', 'Core Tech', '8f48639c-dc93-4987-9e2b-99e5199b8686', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('f003f4d6-4d53-494a-a5ee-202358dc6ae1', 'Product Dev', 'd433dafe-816d-4853-8f9e-e8b6e648f8b9', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('f0ccefc7-7488-4f02-8d3d-0913f3b0a6ea', 'R&D', 'c3331794-1a07-4834-87f4-5880501166e4', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('f0f94075-557e-4a17-bb3b-d91c0a55611f', 'Innovation Lab', '0cf157b8-2a23-4f2d-9f7a-49955489a3a6', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('f24f9a36-70cd-41d5-b692-bfacbcafa809', 'Innovation Lab', '6674e31a-4765-4a0e-9428-ccf92bf5c7b8', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('f2e039ea-1d56-43e5-b487-e667f9408c62', 'Product Dev', '34baf4fc-c607-40f9-b0a6-c27098d08235', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('f33b5451-0c3e-407a-b594-b87661600270', 'Core Tech', '0cf157b8-2a23-4f2d-9f7a-49955489a3a6', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('f43f550a-8bcd-4003-adc2-d4d840ed602f', 'Engineering', '9c0ee115-b030-4fe9-b828-a51303dc8db2', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('f50bd7cd-8e30-454d-adfb-346c76aae60d', 'Core Tech', '2c639357-60d5-42d2-be9e-1defac55b8a0', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('f663a12e-d772-48d3-9ff9-2c3eae6300c4', 'R&D', '4ef13beb-abcf-40e4-ae08-80cfcfd0cd78', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('f6eda973-ebd2-488f-aafe-79d682e8b846', 'Product Dev', '2df09386-b76e-4d12-835f-e6fda0766e79', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('f76848c9-5076-4d42-be24-553a04607357', 'Product Dev', 'a8718969-8258-4d91-8955-86fefc002fc4', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('f7bdb914-2d81-4f94-ad4d-058ba9dd61d2', 'Innovation Lab', 'a59a6c27-3fc0-4655-bd39-bf4a4c705eac', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('f80e2b2b-6847-4e19-a3e2-609453212653', 'R&D', 'acdba1ae-8322-4092-805a-3e5fd601db26', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('f83f5d69-c74a-46b4-81e9-0fecf5aef9d4', 'Innovation Lab', '47213dd3-b08e-4fb8-91ae-eb23fc9f9c5b', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('f8c274d2-368c-4444-a116-156354c88eac', 'Engineering', '6f8572ac-271a-4bef-b46d-c5858098dd67', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('f8debf77-c706-49d6-8c8f-137b57ccfe8a', 'R&D', '25132aa4-a089-4316-bf1e-a9ad9bb94771', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('f93dcc23-32b4-4a22-8132-17aa6471791b', 'Core Tech', '7d01dc9f-27ae-40b0-ba92-7aedc3263290', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('f99534ba-1983-4066-963d-a3d65b7661a5', 'Product Dev', 'd5c6cb4d-637a-4f02-bf75-9b22f48da2ae', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('f999a283-dcc9-4b39-b626-acf647556e01', 'Innovation Lab', '428384b5-511b-446b-8c76-7b853c52de19', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('f9d8106e-31e6-4f01-bba5-152ba1364343', 'Innovation Lab', 'a5bc1140-bb68-4ec2-b898-7a168bd9e346', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('fa7db224-aa6c-43fe-a0d0-58b576a4214b', 'Innovation Lab', 'ca18fd5a-fe68-4ff3-aba7-ebf59e5281a2', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('fad03113-7b40-43ea-9454-a2c2a532baac', 'Product Dev', 'ad4a87cc-b57f-4f52-b465-1f1441649239', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('fad9955a-576d-453a-978b-0fb64e678eea', 'Product Dev', '3ec7cac9-c998-455c-9f87-ef1e8ac28a9e', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('fb0a2632-9974-4611-9596-f33db8a421b1', 'Engineering', 'e41952f4-7ce1-4d75-885c-213f4dfd53ce', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('fbba1a2a-2d2f-4005-a044-207aee72654f', 'R&D', '6e486737-ed5d-4048-a69e-72ec52d5ccee', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('fbc743fc-dd7f-43a1-84d3-2d018ea15809', 'Core Tech', '13772153-c71a-435e-be79-c338eba873df', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('fd32f706-fdce-4496-8533-fc6207adb551', 'Innovation Lab', '9c0ee115-b030-4fe9-b828-a51303dc8db2', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('fd8687c3-448a-42f2-b3ee-097b551c4e11', 'Engineering', 'a1783c65-4455-40c5-b0fc-3f5531438581', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('fd892f49-dd8e-486c-9793-8627f12d1efe', 'Engineering', '13f95595-4b88-4878-ae4d-bfb5819bb738', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('fdab90f5-9e58-4a44-bd38-a120dd8f086f', 'Core Tech', 'e979dffd-b360-4002-bffd-d40bddadf715', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('fdf62289-3405-4587-94e4-0b38ab135ddb', 'Engineering', '39560ff6-c792-44c1-85bc-19bb36e07821', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('fea25400-f5fc-4236-9bab-1a8357c8b141', 'Innovation Lab', '8f455fcd-f70a-4808-944f-8062ecd9dd18', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('ff3064b8-5a7b-4b9f-ac47-0d93676c330d', 'Core Tech', 'f8253dc1-f357-42a6-b50a-ac447f56a964', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('ff38601e-9a27-4bda-9279-57c50233a560', 'Core Tech', 'e262e28d-b01c-4a46-b837-3cdd862eec54', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('ff62a725-5296-4b04-8090-fdb69f3420d3', 'Engineering', '198bd334-462b-43ef-87d6-aa77d106d196', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('ff9ee164-5c97-4a28-bb7f-8f0b7f0be2bc', 'R&D', '904610e8-53bb-41a8-adbf-202a65e9ce26', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428'),
('ffc29bcf-e11c-4c97-8d50-d840b27d2d78', 'R&D', '5f83fb34-45da-4699-bd4c-a2b401c30ef9', 1, '2025-06-24 18:53:23', '2025-06-24 18:53:23', 'df234305-8a47-4b4d-8efb-716a6b695428');

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` int NOT NULL,
  `countries` varchar(300) DEFAULT NULL,
  `country_code` varchar(300) DEFAULT NULL,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `countries`, `country_code`, `created_on`, `modified_on`) VALUES
(43, 'India', 'IN', '2025-03-04 02:28:49', '2025-03-04 02:28:49'),
(44, 'China', 'CN', '2025-03-04 02:28:49', '2025-03-04 02:28:49'),
(45, 'New Zealand', 'NZ', '2025-03-04 02:28:49', '2025-03-04 02:28:49'),
(46, 'Bangladesh', 'BD', '2025-03-04 02:28:49', '2025-03-04 02:28:49'),
(47, 'Canada', 'CA', '2025-03-04 02:28:49', '2025-03-04 02:28:49'),
(48, 'France', 'FR', '2025-03-04 02:28:49', '2025-03-04 02:28:49'),
(49, 'United State', 'US', '2025-03-04 02:28:49', '2025-03-04 02:28:49'),
(50, 'Singapore', 'SG', '2025-03-04 02:28:49', '2025-03-04 02:28:49'),
(51, 'Nepal', 'NP', '2025-03-04 02:28:49', '2025-03-04 02:28:49'),
(52, 'WIPO', 'WO', '2025-03-04 02:28:49', '2025-03-04 02:28:49'),
(53, 'Serbia', 'RS', '2025-03-04 02:28:49', '2025-03-04 02:28:49'),
(54, 'Australia', 'AU', '2025-03-04 02:28:49', '2025-03-04 02:28:49'),
(55, 'Finland', 'FI', '2025-03-04 02:28:49', '2025-03-04 02:28:49'),
(56, 'Indonesia', 'ID', '2025-03-04 02:28:49', '2025-03-04 02:28:49'),
(57, 'Brazil', 'BR', '2025-03-04 02:28:49', '2025-03-04 02:28:49'),
(58, 'Germany', 'DE', '2025-06-18 15:46:03', '2025-06-18 15:46:03'),
(59, 'Germany', 'DE', '2025-06-18 15:46:06', '2025-06-18 15:46:06'),
(60, 'JAPAN', 'JP', '2025-06-18 15:49:34', '2025-06-18 15:49:34');

-- --------------------------------------------------------

--
-- Table structure for table `custom_reminder`
--

CREATE TABLE `custom_reminder` (
  `id` int NOT NULL,
  `docket_id` int DEFAULT NULL,
  `next_reminder_month` timestamp(6) NULL DEFAULT NULL,
  `sent` tinyint DEFAULT NULL,
  `archive` tinyint(1) DEFAULT '0',
  `sent_timestamp` timestamp(6) NULL DEFAULT NULL,
  `custom` tinyint(1) DEFAULT NULL,
  `title` varchar(300) DEFAULT NULL,
  `subdocket_id` int DEFAULT NULL,
  `added_by` char(36) DEFAULT NULL,
  `cc_address` varchar(500) DEFAULT NULL,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `tenant_id` char(36) NOT NULL,
  `client_id` char(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `uuid` char(36) NOT NULL,
  `department` varchar(300) NOT NULL,
  `client_id` char(36) DEFAULT NULL,
  `tenant_id` char(36) DEFAULT NULL,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `docket`
--

CREATE TABLE `docket` (
  `id` int NOT NULL,
  `annuity_timeline` timestamp NULL DEFAULT NULL,
  `deadline_for_filing` timestamp NULL DEFAULT NULL,
  `deleted` tinyint DEFAULT NULL,
  `docket_number` varchar(300) DEFAULT NULL,
  `filing_maintenance_cost` decimal(20,10) DEFAULT NULL,
  `temp_number` int DEFAULT NULL,
  `title` varchar(300) DEFAULT NULL,
  `client_id` char(36) DEFAULT NULL,
  `filing_entity_type_id` int DEFAULT NULL,
  `first_filing_type_id` int DEFAULT NULL,
  `country_of_filing_id` int DEFAULT NULL,
  `foreign_license_required` tinyint NOT NULL DEFAULT '0',
  `division` char(36) DEFAULT NULL,
  `added_by` char(36) DEFAULT NULL,
  `manual_docket_number` varchar(300) DEFAULT NULL,
  `department_id` char(36) DEFAULT NULL,
  `source` int DEFAULT '0' COMMENT '0 means it is from drafting and 1 means from DR',
  `current_status_date` timestamp NULL DEFAULT NULL,
  `first_filing_date` timestamp NULL DEFAULT NULL,
  `public_disclosure_date` timestamp NULL DEFAULT NULL,
  `uuid` char(36) NOT NULL,
  `current_status` int DEFAULT NULL,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `tenant_id` char(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `docket_attachment_mapping`
--

CREATE TABLE `docket_attachment_mapping` (
  `id` int NOT NULL,
  `file_name` varchar(300) DEFAULT NULL,
  `location` varchar(300) DEFAULT NULL,
  `attachment_type_id` int DEFAULT NULL,
  `docket_id` int DEFAULT NULL,
  `user_id` char(36) DEFAULT NULL,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `tenant_id` char(36) NOT NULL,
  `client_id` char(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `docket_comments`
--

CREATE TABLE `docket_comments` (
  `id` int NOT NULL,
  `added_by` char(36) NOT NULL,
  `comment` varchar(300) DEFAULT NULL,
  `deleted` tinyint NOT NULL DEFAULT '0',
  `docket_id` int DEFAULT NULL,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `tenant_id` char(36) NOT NULL,
  `client_id` char(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `docket_logs`
--

CREATE TABLE `docket_logs` (
  `id` int NOT NULL,
  `operation_type` varchar(300) DEFAULT NULL,
  `docket_id` int DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `tenant_id` char(36) NOT NULL,
  `client_id` char(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `docket_subdocket_mapping`
--

CREATE TABLE `docket_subdocket_mapping` (
  `id` int NOT NULL,
  `docket_id` int DEFAULT NULL,
  `subdocket_id` int DEFAULT NULL,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `docket_subdocket_roles`
--

CREATE TABLE `docket_subdocket_roles` (
  `id` int NOT NULL,
  `docket_id` int DEFAULT NULL,
  `role_id` int DEFAULT NULL,
  `subdocket_id` int DEFAULT NULL,
  `user_id` char(36) DEFAULT NULL,
  `deleted` tinyint NOT NULL DEFAULT '0',
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `docket_subdocket_stage_action`
--

CREATE TABLE `docket_subdocket_stage_action` (
  `id` int NOT NULL,
  `comment` varchar(300) DEFAULT NULL,
  `complete` tinyint DEFAULT NULL,
  `action_id` int DEFAULT NULL,
  `upload_filetype` int DEFAULT NULL,
  `docket_id` int DEFAULT NULL,
  `stage_id` int DEFAULT NULL,
  `subdocket_id` int DEFAULT NULL,
  `performed_by` char(36) DEFAULT NULL,
  `performed_on` timestamp NULL DEFAULT NULL,
  `attachment_mandatory` tinyint DEFAULT NULL,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `filing_entity_type`
--

CREATE TABLE `filing_entity_type` (
  `id` int NOT NULL,
  `filing_entity_type` varchar(300) DEFAULT NULL,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `filing_entity_type`
--

INSERT INTO `filing_entity_type` (`id`, `filing_entity_type`, `created_on`, `modified_on`) VALUES
(1, 'Small', '2025-03-07 10:19:54', '2025-03-07 10:19:54'),
(2, 'Large', '2025-03-07 10:19:54', '2025-03-07 10:19:54'),
(3, 'Micro', '2025-03-07 10:19:54', '2025-03-07 10:19:54'),
(4, 'Individual', '2025-03-07 10:19:54', '2025-03-07 10:19:54'),
(5, 'Startup', '2025-03-07 10:19:54', '2025-03-07 10:19:54'),
(6, 'Others', '2025-03-07 10:19:54', '2025-03-07 10:19:54');

-- --------------------------------------------------------

--
-- Table structure for table `filing_type`
--

CREATE TABLE `filing_type` (
  `id` int NOT NULL,
  `filing_type` varchar(300) DEFAULT NULL,
  `filing_type_code` varchar(300) DEFAULT NULL,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `filing_type`
--

INSERT INTO `filing_type` (`id`, `filing_type`, `filing_type_code`, `created_on`, `modified_on`) VALUES
(1, 'Provisional', 'P', '2025-03-07 10:20:11', '2025-03-07 10:20:11'),
(2, 'Non-Provisional', 'NP', '2025-03-07 10:20:11', '2025-03-07 10:20:11'),
(3, 'PCT Application', 'PCT', '2025-03-07 10:20:11', '2025-03-07 10:20:11');

-- --------------------------------------------------------

--
-- Table structure for table `foreign_filing_countries`
--

CREATE TABLE `foreign_filing_countries` (
  `id` int NOT NULL,
  `country_id` int DEFAULT NULL,
  `docket_id` int DEFAULT NULL,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `partial_docket`
--

CREATE TABLE `partial_docket` (
  `id` int NOT NULL,
  `analyst` char(36) DEFAULT NULL,
  `annuity_timeline` timestamp(6) NULL DEFAULT NULL,
  `client_id` char(36) DEFAULT NULL,
  `deadline_for_filing` timestamp(6) NULL DEFAULT NULL,
  `deleted` tinyint DEFAULT NULL,
  `drafter` char(36) DEFAULT NULL,
  `filing_entity_type_id` int DEFAULT NULL,
  `filing_maintenance_cost` decimal(19,2) DEFAULT NULL,
  `first_filing_type_id` int DEFAULT NULL,
  `country_of_filing_id` int DEFAULT NULL,
  `foreign_filing_countries_id` varchar(300) DEFAULT NULL,
  `foreign_license_required` tinyint DEFAULT NULL,
  `inventor_id` varchar(300) DEFAULT NULL,
  `manager_id` varchar(300) DEFAULT NULL,
  `patent_agent` char(36) DEFAULT NULL,
  `title` varchar(300) DEFAULT NULL,
  `is_saved` tinyint NOT NULL DEFAULT '0',
  `client_division_id` char(36) DEFAULT NULL,
  `added_by` char(36) DEFAULT NULL,
  `manual_docket_number` varchar(300) DEFAULT NULL,
  `system_generated_docket` tinyint(1) DEFAULT NULL,
  `department_id` char(36) DEFAULT NULL,
  `source` int NOT NULL DEFAULT '0' COMMENT '0 means it is from drafting and 1 means from DR',
  `autogenerated_docket_number` varchar(300) DEFAULT NULL,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `tenant_id` char(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `reminder_config`
--

CREATE TABLE `reminder_config` (
  `id` int NOT NULL,
  `first_reminder` int DEFAULT NULL,
  `second_reminder` int DEFAULT NULL,
  `third_reminder` int DEFAULT NULL,
  `forth_reminder` decimal(10,1) DEFAULT NULL,
  `priority` int DEFAULT NULL,
  `filing_country` int DEFAULT NULL,
  `filing_type` int DEFAULT NULL,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `reminder_config`
--

INSERT INTO `reminder_config` (`id`, `first_reminder`, `second_reminder`, `third_reminder`, `forth_reminder`, `priority`, `filing_country`, `filing_type`, `created_on`, `modified_on`) VALUES
(1, 9, 10, 11, 11.5, NULL, 43, 1, '2025-03-07 10:29:47', '2025-03-07 10:29:47'),
(2, 27, 28, 29, 29.5, NULL, NULL, 3, '2025-03-07 10:29:47', '2025-03-07 10:29:47'),
(3, 9, 10, 11, 11.5, NULL, 49, 1, '2025-03-07 10:29:47', '2025-03-07 10:29:47');

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `id` int NOT NULL,
  `name` varchar(300) DEFAULT NULL,
  `visibility` tinyint DEFAULT NULL,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id`, `name`, `visibility`, `created_on`, `modified_on`) VALUES
(1, 'App-admin', 1, '2025-03-07 10:30:02', '2025-03-07 10:30:02'),
(2, 'Executive', 1, '2025-03-07 10:30:02', '2025-03-07 10:30:02'),
(3, 'Inventor', 1, '2025-03-07 10:30:02', '2025-03-07 10:30:02'),
(4, 'Patent Agent', 1, '2025-03-07 10:30:02', '2025-03-07 10:30:02'),
(5, 'Paralegal', 1, '2025-03-07 10:30:02', '2025-03-07 10:30:02'),
(6, 'Manager(Internal)', 0, '2025-03-07 10:30:02', '2025-03-07 10:30:02'),
(7, 'Drafter', 0, '2025-03-07 10:30:02', '2025-03-07 10:30:02'),
(8, 'Analyst', 0, '2025-03-07 10:30:02', '2025-03-07 10:30:02'),
(9, 'Outside Agent', 1, '2025-03-07 10:30:02', '2025-03-07 10:30:02'),
(10, 'Reviewer', 1, '2025-03-07 10:30:02', '2025-03-07 10:30:02'),
(11, 'App-user', 1, '2025-03-07 10:30:02', '2025-03-07 10:30:02');

-- --------------------------------------------------------

--
-- Table structure for table `stages`
--

CREATE TABLE `stages` (
  `id` int NOT NULL,
  `name` varchar(300) DEFAULT NULL,
  `serial_order` int NOT NULL,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `stages`
--

INSERT INTO `stages` (`id`, `name`, `serial_order`, `created_on`, `modified_on`) VALUES
(1, 'T0', 0, '2025-03-07 10:30:19', '2025-03-07 10:30:19'),
(2, 'T1', 1, '2025-03-07 10:30:19', '2025-03-07 10:30:19'),
(3, 'T2', 2, '2025-03-07 10:30:19', '2025-03-07 10:30:19'),
(4, 'T3', 3, '2025-03-07 10:30:19', '2025-03-07 10:30:19'),
(5, 'T4', 4, '2025-03-07 10:30:19', '2025-03-07 10:30:19');

-- --------------------------------------------------------

--
-- Table structure for table `status`
--

CREATE TABLE `status` (
  `id` int NOT NULL,
  `status` varchar(300) DEFAULT NULL,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `status`
--

INSERT INTO `status` (`id`, `status`, `created_on`, `modified_on`) VALUES
(1, 'Abandoned', '2025-03-07 10:30:33', '2025-03-07 10:30:33'),
(2, 'Rated To File', '2025-03-07 10:30:33', '2025-03-07 10:30:33'),
(3, 'Hold', '2025-03-07 10:30:33', '2025-03-07 10:30:33'),
(4, 'Rated To Publish', '2025-03-07 10:30:33', '2025-03-07 10:30:33'),
(5, 'Open', '2025-03-07 10:30:33', '2025-03-07 10:30:33'),
(6, 'Trade Secret', '2025-03-07 10:30:33', '2025-03-07 10:30:33'),
(7, 'Not Yet Rated', '2025-03-07 10:30:33', '2025-03-07 10:30:33'),
(8, 'Active', '2025-03-07 10:30:33', '2025-03-07 10:30:33'),
(9, 'Complete', '2025-03-07 10:30:33', '2025-03-07 10:30:33');

-- --------------------------------------------------------

--
-- Table structure for table `subdocket`
--

CREATE TABLE `subdocket` (
  `id` int NOT NULL,
  `deleted` tinyint DEFAULT NULL,
  `expected_filing_year` timestamp NULL DEFAULT NULL,
  `filing_date` timestamp NULL DEFAULT NULL,
  `filing_maintenance_cost` decimal(20,10) DEFAULT NULL,
  `grant_date` timestamp NULL DEFAULT NULL,
  `office_action_recieved_date` timestamp NULL DEFAULT NULL,
  `prior_filing_year` timestamp NULL DEFAULT NULL,
  `priority_date` timestamp NULL DEFAULT NULL,
  `publication_date` timestamp NULL DEFAULT NULL,
  `publication_number` varchar(300) DEFAULT NULL,
  `subdocket_number` varchar(300) DEFAULT NULL,
  `term_extension` timestamp NULL DEFAULT NULL,
  `client_id` char(36) DEFAULT NULL,
  `country_id` int DEFAULT NULL,
  `filing_entity_type_id` int DEFAULT NULL,
  `status_id` int DEFAULT NULL,
  `subdocket_filing_type_id` int DEFAULT NULL,
  `manual_subdocket_number` varchar(255) DEFAULT NULL,
  `agent_id` int DEFAULT NULL,
  `priority_of_filing` tinyint DEFAULT NULL,
  `application_number` varchar(300) DEFAULT NULL,
  `tentative_filing_date` timestamp NULL DEFAULT NULL,
  `prosecution` tinyint DEFAULT NULL,
  `prosecution_subdocket_link` varchar(300) DEFAULT NULL,
  `added_by` char(36) DEFAULT NULL,
  `docket_uuid` char(36) NOT NULL,
  `uuid` char(36) NOT NULL,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `tenant_id` char(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `subdocket_assignee_mapping`
--

CREATE TABLE `subdocket_assignee_mapping` (
  `id` int NOT NULL,
  `assignee_id` int DEFAULT NULL,
  `subdocket_id` int DEFAULT NULL,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `subdocket_attachment_mapping`
--

CREATE TABLE `subdocket_attachment_mapping` (
  `id` int NOT NULL,
  `file_name` varchar(300) DEFAULT NULL,
  `location` varchar(300) DEFAULT NULL,
  `subdocket_id` int DEFAULT NULL,
  `added_by` char(36) DEFAULT NULL,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `tenant_id` char(36) NOT NULL,
  `client_id` char(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `subdocket_comments`
--

CREATE TABLE `subdocket_comments` (
  `id` int NOT NULL,
  `added_by` char(36) NOT NULL,
  `comment` varchar(300) DEFAULT NULL,
  `deleted` tinyint DEFAULT NULL,
  `subdocket_id` int DEFAULT NULL,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `tenant_id` char(36) NOT NULL,
  `client_id` char(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `subdocket_filing_type`
--

CREATE TABLE `subdocket_filing_type` (
  `id` int NOT NULL,
  `filing_type` varchar(300) DEFAULT NULL,
  `filing_type_code` varchar(300) DEFAULT NULL,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `subdocket_filing_type`
--

INSERT INTO `subdocket_filing_type` (`id`, `filing_type`, `filing_type_code`, `created_on`, `modified_on`) VALUES
(1, 'Provisional', 'P', '2025-03-07 10:37:30', '2025-03-07 10:37:30'),
(2, 'Non-Provisional', 'NP', '2025-03-07 10:37:30', '2025-03-07 10:37:30'),
(3, 'PCT Application', 'PCT', '2025-03-07 10:37:30', '2025-03-07 10:37:30'),
(4, 'Divisional', 'D', '2025-03-07 10:37:30', '2025-03-07 10:37:30'),
(5, 'Continuation Patent', 'NP-CP', '2025-03-07 10:37:30', '2025-03-07 10:37:30'),
(6, 'Continuation-In-Parts / Patent of addition', 'NP-CIP', '2025-03-07 10:37:30', '2025-03-07 10:37:30');

-- --------------------------------------------------------

--
-- Table structure for table `subdocket_foreign_filing_country`
--

CREATE TABLE `subdocket_foreign_filing_country` (
  `id` int NOT NULL,
  `country_id` int DEFAULT NULL,
  `subdocket_id` int DEFAULT NULL,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `subdocket_logs`
--

CREATE TABLE `subdocket_logs` (
  `id` int NOT NULL,
  `added_time` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `operation_type` varchar(300) DEFAULT NULL,
  `subdocket_id` int DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `tenant_id` char(36) NOT NULL,
  `client_id` char(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `subdocket_reminder`
--

CREATE TABLE `subdocket_reminder` (
  `id` int NOT NULL,
  `next_reminder_month` timestamp(6) NULL DEFAULT NULL,
  `sent` tinyint DEFAULT NULL,
  `subdocket_id` int DEFAULT NULL,
  `archive` tinyint(1) NOT NULL DEFAULT '0',
  `sent_timestamp` timestamp(6) NULL DEFAULT NULL,
  `quarter` int DEFAULT NULL,
  `updated_timestamp` timestamp(6) NULL DEFAULT NULL,
  `action_id` int DEFAULT NULL,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `tenant_id` char(36) NOT NULL,
  `client_id` char(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `subdocket_stage_attachment_mapping`
--

CREATE TABLE `subdocket_stage_attachment_mapping` (
  `id` int NOT NULL,
  `file_name` varchar(300) NOT NULL,
  `file_location` varchar(300) NOT NULL,
  `subdocket_stage_id` int NOT NULL,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `tenant_id` char(36) NOT NULL,
  `client_id` char(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` char(36) NOT NULL DEFAULT 'UUID()',
  `fullname` varchar(300) DEFAULT NULL,
  `tenant_id` char(36) NOT NULL,
  `email` varchar(300) DEFAULT NULL,
  `contact` varchar(255) DEFAULT NULL,
  `firstname` varchar(300) DEFAULT NULL,
  `lastname` varchar(300) DEFAULT NULL,
  `middlename` varchar(300) DEFAULT NULL,
  `deleted` tinyint DEFAULT NULL,
  `inactive` tinyint NOT NULL DEFAULT '0',
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `fullname`, `tenant_id`, `email`, `contact`, `firstname`, `lastname`, `middlename`, `deleted`, `inactive`, `created_on`, `modified_on`) VALUES
('bf255bcc-e2db-4d47-8e3e-5b8b7b4f105d', 'Admin Tekip', 'df234305-8a47-4b4d-8efb-716a6b695428', 'admin.tekip@example.com', NULL, 'Admin', 'Tekip', NULL, 0, 0, '2025-06-24 18:53:23', '2025-06-24 18:53:23');

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
-- Indexes for table `actions`
--
ALTER TABLE `actions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `staged_id` (`staged_id`);

--
-- Indexes for table `action_input_config`
--
ALTER TABLE `action_input_config`
  ADD PRIMARY KEY (`id`),
  ADD KEY `action_id` (`action_id`);

--
-- Indexes for table `assignee`
--
ALTER TABLE `assignee`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_id` (`client_id`);

--
-- Indexes for table `attachment_type`
--
ALTER TABLE `attachment_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `custom_reminder`
--
ALTER TABLE `custom_reminder`
  ADD PRIMARY KEY (`id`),
  ADD KEY `docket_id` (`docket_id`),
  ADD KEY `subdocket_id` (`subdocket_id`),
  ADD KEY `added_by` (`added_by`),
  ADD KEY `client_id` (`client_id`);

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
  ADD KEY `FK_tkk8hrfmn7pqnbilky0fygumb` (`client_id`),
  ADD KEY `FK_ay37c7rdcpk86ij6p7y4agk1e` (`filing_entity_type_id`),
  ADD KEY `FK_2laikj2eoemvbd3j5f23fqc2l` (`first_filing_type_id`),
  ADD KEY `FK_oel9bcog807l8nuj671kww20l` (`country_of_filing_id`),
  ADD KEY `FK_6hjxu7ko29qu44l0e34ir24q1` (`division`),
  ADD KEY `added_by` (`added_by`),
  ADD KEY `department_id` (`department_id`),
  ADD KEY `FK_qid7o9qch2kpj8rlcg3xocupg` (`current_status`);

--
-- Indexes for table `docket_attachment_mapping`
--
ALTER TABLE `docket_attachment_mapping`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_mvp6uyuflf01mo0tygj4f5fon` (`attachment_type_id`),
  ADD KEY `FK_n0qogkfvwb02ej6w9m8eyxdl6` (`docket_id`),
  ADD KEY `FK_2s2psxecv7gihib301behn634` (`user_id`),
  ADD KEY `client_id` (`client_id`);

--
-- Indexes for table `docket_comments`
--
ALTER TABLE `docket_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_bd2an7cf72lgmrp39up3tih8j` (`docket_id`),
  ADD KEY `added_by` (`added_by`),
  ADD KEY `client_id` (`client_id`);

--
-- Indexes for table `docket_logs`
--
ALTER TABLE `docket_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_n6vomlii2mqleexgeamtdua1j` (`docket_id`),
  ADD KEY `FK_bt1cgym0ulg130d4x7obw2r2p` (`created_by`),
  ADD KEY `client_id` (`client_id`);

--
-- Indexes for table `docket_subdocket_mapping`
--
ALTER TABLE `docket_subdocket_mapping`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_pm6k78gkj0schku118g3k2oa` (`docket_id`),
  ADD KEY `FK_lcu26e4mi4sfkr7n565ifog54` (`subdocket_id`);

--
-- Indexes for table `docket_subdocket_roles`
--
ALTER TABLE `docket_subdocket_roles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_1krwc0qe8sbhtw8qg8glv1nr5` (`docket_id`),
  ADD KEY `FK_67vdtlh46b1g1m6qmtnjoovji` (`role_id`),
  ADD KEY `FK_lnstihpkrrvg7l17tygnvts9n` (`subdocket_id`),
  ADD KEY `FK_bptqav0a73aitars2dvogj6g` (`user_id`);

--
-- Indexes for table `docket_subdocket_stage_action`
--
ALTER TABLE `docket_subdocket_stage_action`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_fb4tyk40vhkxbxyo7vlnb29w9` (`upload_filetype`),
  ADD KEY `FK_3v9fxrqmwkv0ejwp9rd2w721g` (`docket_id`),
  ADD KEY `FK_qtk2m9bdd1l1lh60uic8emwit` (`stage_id`),
  ADD KEY `FK_6krt70m8wkthaplp1fedtquke` (`subdocket_id`),
  ADD KEY `FK_261s27shbuw66by46ci312frk` (`performed_by`),
  ADD KEY `FK_n73fiu2vj0yi1fi38lilibd3v` (`action_id`);

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
  ADD KEY `FK_mj00xlsojw1r3mi6ja16157ah` (`country_id`),
  ADD KEY `FK_444nfgxacxnfalvm4fjsfnghr` (`docket_id`);

--
-- Indexes for table `partial_docket`
--
ALTER TABLE `partial_docket`
  ADD PRIMARY KEY (`id`),
  ADD KEY `added_by` (`added_by`);

--
-- Indexes for table `reminder_config`
--
ALTER TABLE `reminder_config`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_t2a1rdyqauk8whw9hq7wb7lb3` (`filing_country`),
  ADD KEY `FK_i9639wsqeyvwu0gv2sffnespx` (`filing_type`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stages`
--
ALTER TABLE `stages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subdocket`
--
ALTER TABLE `subdocket`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_lu5ne0qwcrmjruxyqgt217jdp` (`client_id`),
  ADD KEY `FK_g9843iy059b7lyfbvxc2krj3v` (`country_id`),
  ADD KEY `FK_4h3hw0xxwxrbr1nvgj61ghqwd` (`filing_entity_type_id`),
  ADD KEY `FK_2wr8d6m67f9levk3c9h4gywv5` (`status_id`),
  ADD KEY `FK_2hcptm1p2ba8y9nre0rrgubtk` (`subdocket_filing_type_id`),
  ADD KEY `FK_l55swsqr5vpki9hfe0vbh8xdf` (`agent_id`),
  ADD KEY `added_by` (`added_by`);

--
-- Indexes for table `subdocket_assignee_mapping`
--
ALTER TABLE `subdocket_assignee_mapping`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_a2l3iv0dxd0am7356vqxwwe2l` (`assignee_id`),
  ADD KEY `FK_5ty8lmnxeoo8ncie7ts2tkag4` (`subdocket_id`);

--
-- Indexes for table `subdocket_attachment_mapping`
--
ALTER TABLE `subdocket_attachment_mapping`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_5a0w0bvu1kfpi6vqc7iaeljl6` (`subdocket_id`),
  ADD KEY `added_by` (`added_by`),
  ADD KEY `client_id` (`client_id`);

--
-- Indexes for table `subdocket_comments`
--
ALTER TABLE `subdocket_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_lbweuuvyqss8o2d1tixry0wmc` (`subdocket_id`),
  ADD KEY `added_by` (`added_by`),
  ADD KEY `client_id` (`client_id`);

--
-- Indexes for table `subdocket_filing_type`
--
ALTER TABLE `subdocket_filing_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subdocket_foreign_filing_country`
--
ALTER TABLE `subdocket_foreign_filing_country`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_tmv5337najlhqkjx3ayxm5jm4` (`country_id`),
  ADD KEY `FK_d80jc03yy6bjc1btx0j6jx88k` (`subdocket_id`);

--
-- Indexes for table `subdocket_logs`
--
ALTER TABLE `subdocket_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_d8emc9tw42h70i9xdiasxi5sv` (`subdocket_id`),
  ADD KEY `FK_knvuieq3u29nl9jr8wp4eu28k` (`created_by`),
  ADD KEY `client_id` (`client_id`);

--
-- Indexes for table `subdocket_reminder`
--
ALTER TABLE `subdocket_reminder`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_r5bcw95rjfo1g69u1ja1rrwfv` (`subdocket_id`),
  ADD KEY `action_id` (`action_id`),
  ADD KEY `client_id` (`client_id`);

--
-- Indexes for table `subdocket_stage_attachment_mapping`
--
ALTER TABLE `subdocket_stage_attachment_mapping`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subdocket_stage_id` (`subdocket_stage_id`),
  ADD KEY `client_id` (`client_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

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
-- AUTO_INCREMENT for table `actions`
--
ALTER TABLE `actions`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `action_input_config`
--
ALTER TABLE `action_input_config`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `assignee`
--
ALTER TABLE `assignee`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `attachment_type`
--
ALTER TABLE `attachment_type`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `custom_reminder`
--
ALTER TABLE `custom_reminder`
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
-- AUTO_INCREMENT for table `docket_comments`
--
ALTER TABLE `docket_comments`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `docket_logs`
--
ALTER TABLE `docket_logs`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `docket_subdocket_mapping`
--
ALTER TABLE `docket_subdocket_mapping`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `docket_subdocket_roles`
--
ALTER TABLE `docket_subdocket_roles`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `docket_subdocket_stage_action`
--
ALTER TABLE `docket_subdocket_stage_action`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `filing_entity_type`
--
ALTER TABLE `filing_entity_type`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

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
-- AUTO_INCREMENT for table `partial_docket`
--
ALTER TABLE `partial_docket`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reminder_config`
--
ALTER TABLE `reminder_config`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `stages`
--
ALTER TABLE `stages`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `status`
--
ALTER TABLE `status`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `subdocket`
--
ALTER TABLE `subdocket`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subdocket_assignee_mapping`
--
ALTER TABLE `subdocket_assignee_mapping`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subdocket_attachment_mapping`
--
ALTER TABLE `subdocket_attachment_mapping`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subdocket_comments`
--
ALTER TABLE `subdocket_comments`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subdocket_filing_type`
--
ALTER TABLE `subdocket_filing_type`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `subdocket_foreign_filing_country`
--
ALTER TABLE `subdocket_foreign_filing_country`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subdocket_logs`
--
ALTER TABLE `subdocket_logs`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subdocket_reminder`
--
ALTER TABLE `subdocket_reminder`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subdocket_stage_attachment_mapping`
--
ALTER TABLE `subdocket_stage_attachment_mapping`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_tenant_client_mapping`
--
ALTER TABLE `user_tenant_client_mapping`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `actions`
--
ALTER TABLE `actions`
  ADD CONSTRAINT `actions_ibfk_1` FOREIGN KEY (`staged_id`) REFERENCES `stages` (`id`);

--
-- Constraints for table `action_input_config`
--
ALTER TABLE `action_input_config`
  ADD CONSTRAINT `action_input_config_ibfk_1` FOREIGN KEY (`action_id`) REFERENCES `actions` (`id`);

--
-- Constraints for table `assignee`
--
ALTER TABLE `assignee`
  ADD CONSTRAINT `assignee_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`);

--
-- Constraints for table `client_division`
--
ALTER TABLE `client_division`
  ADD CONSTRAINT `client_division_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`);

--
-- Constraints for table `custom_reminder`
--
ALTER TABLE `custom_reminder`
  ADD CONSTRAINT `custom_reminder_ibfk_1` FOREIGN KEY (`docket_id`) REFERENCES `docket` (`id`),
  ADD CONSTRAINT `custom_reminder_ibfk_2` FOREIGN KEY (`subdocket_id`) REFERENCES `subdocket` (`id`),
  ADD CONSTRAINT `custom_reminder_ibfk_3` FOREIGN KEY (`added_by`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `custom_reminder_ibfk_4` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`);

--
-- Constraints for table `department`
--
ALTER TABLE `department`
  ADD CONSTRAINT `department_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`);

--
-- Constraints for table `docket`
--
ALTER TABLE `docket`
  ADD CONSTRAINT `docket_ibfk_1` FOREIGN KEY (`added_by`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `docket_ibfk_2` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`),
  ADD CONSTRAINT `docket_ibfk_3` FOREIGN KEY (`division`) REFERENCES `client_division` (`id`),
  ADD CONSTRAINT `docket_ibfk_4` FOREIGN KEY (`department_id`) REFERENCES `department` (`uuid`),
  ADD CONSTRAINT `FK_2laikj2eoemvbd3j5f23fqc2l` FOREIGN KEY (`first_filing_type_id`) REFERENCES `filing_type` (`id`),
  ADD CONSTRAINT `FK_ay37c7rdcpk86ij6p7y4agk1e` FOREIGN KEY (`filing_entity_type_id`) REFERENCES `filing_entity_type` (`id`),
  ADD CONSTRAINT `FK_oel9bcog807l8nuj671kww20l` FOREIGN KEY (`country_of_filing_id`) REFERENCES `countries` (`id`),
  ADD CONSTRAINT `FK_qid7o9qch2kpj8rlcg3xocupg` FOREIGN KEY (`current_status`) REFERENCES `status` (`id`);

--
-- Constraints for table `docket_attachment_mapping`
--
ALTER TABLE `docket_attachment_mapping`
  ADD CONSTRAINT `docket_attachment_mapping_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `docket_attachment_mapping_ibfk_2` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`),
  ADD CONSTRAINT `FK_mvp6uyuflf01mo0tygj4f5fon` FOREIGN KEY (`attachment_type_id`) REFERENCES `attachment_type` (`id`),
  ADD CONSTRAINT `FK_n0qogkfvwb02ej6w9m8eyxdl6` FOREIGN KEY (`docket_id`) REFERENCES `docket` (`id`);

--
-- Constraints for table `docket_comments`
--
ALTER TABLE `docket_comments`
  ADD CONSTRAINT `docket_comments_ibfk_1` FOREIGN KEY (`added_by`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `docket_comments_ibfk_2` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`),
  ADD CONSTRAINT `FK_bd2an7cf72lgmrp39up3tih8j` FOREIGN KEY (`docket_id`) REFERENCES `docket` (`id`);

--
-- Constraints for table `docket_logs`
--
ALTER TABLE `docket_logs`
  ADD CONSTRAINT `docket_logs_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `docket_logs_ibfk_2` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`),
  ADD CONSTRAINT `FK_n6vomlii2mqleexgeamtdua1j` FOREIGN KEY (`docket_id`) REFERENCES `docket` (`id`);

--
-- Constraints for table `docket_subdocket_mapping`
--
ALTER TABLE `docket_subdocket_mapping`
  ADD CONSTRAINT `FK_lcu26e4mi4sfkr7n565ifog54` FOREIGN KEY (`subdocket_id`) REFERENCES `subdocket` (`id`),
  ADD CONSTRAINT `FK_pm6k78gkj0schku118g3k2oa` FOREIGN KEY (`docket_id`) REFERENCES `docket` (`id`);

--
-- Constraints for table `docket_subdocket_roles`
--
ALTER TABLE `docket_subdocket_roles`
  ADD CONSTRAINT `docket_subdocket_roles_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FK_1krwc0qe8sbhtw8qg8glv1nr5` FOREIGN KEY (`docket_id`) REFERENCES `docket` (`id`),
  ADD CONSTRAINT `FK_67vdtlh46b1g1m6qmtnjoovji` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`),
  ADD CONSTRAINT `FK_lnstihpkrrvg7l17tygnvts9n` FOREIGN KEY (`subdocket_id`) REFERENCES `subdocket` (`id`);

--
-- Constraints for table `docket_subdocket_stage_action`
--
ALTER TABLE `docket_subdocket_stage_action`
  ADD CONSTRAINT `docket_subdocket_stage_action_ibfk_1` FOREIGN KEY (`action_id`) REFERENCES `actions` (`id`),
  ADD CONSTRAINT `docket_subdocket_stage_action_ibfk_2` FOREIGN KEY (`performed_by`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FK_3v9fxrqmwkv0ejwp9rd2w721g` FOREIGN KEY (`docket_id`) REFERENCES `docket` (`id`),
  ADD CONSTRAINT `FK_6krt70m8wkthaplp1fedtquke` FOREIGN KEY (`subdocket_id`) REFERENCES `subdocket` (`id`),
  ADD CONSTRAINT `FK_fb4tyk40vhkxbxyo7vlnb29w9` FOREIGN KEY (`upload_filetype`) REFERENCES `attachment_type` (`id`),
  ADD CONSTRAINT `FK_qtk2m9bdd1l1lh60uic8emwit` FOREIGN KEY (`stage_id`) REFERENCES `stages` (`id`);

--
-- Constraints for table `foreign_filing_countries`
--
ALTER TABLE `foreign_filing_countries`
  ADD CONSTRAINT `FK_444nfgxacxnfalvm4fjsfnghr` FOREIGN KEY (`docket_id`) REFERENCES `docket` (`id`),
  ADD CONSTRAINT `FK_mj00xlsojw1r3mi6ja16157ah` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`);

--
-- Constraints for table `partial_docket`
--
ALTER TABLE `partial_docket`
  ADD CONSTRAINT `partial_docket_ibfk_1` FOREIGN KEY (`added_by`) REFERENCES `user` (`id`);

--
-- Constraints for table `reminder_config`
--
ALTER TABLE `reminder_config`
  ADD CONSTRAINT `FK_i9639wsqeyvwu0gv2sffnespx` FOREIGN KEY (`filing_type`) REFERENCES `subdocket_filing_type` (`id`),
  ADD CONSTRAINT `FK_t2a1rdyqauk8whw9hq7wb7lb3` FOREIGN KEY (`filing_country`) REFERENCES `countries` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
