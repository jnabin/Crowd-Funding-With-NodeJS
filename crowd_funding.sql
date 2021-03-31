-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 07, 2021 at 12:39 AM
-- Server version: 10.4.16-MariaDB
-- PHP Version: 7.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `crowd_funding`
--

-- --------------------------------------------------------

--
-- Table structure for table `apistore`
--

CREATE TABLE `apistore` (
  `id` int(11) NOT NULL,
  `path` varchar(20) NOT NULL,
  `createdDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `bookmarks`
--

CREATE TABLE `bookmarks` (
  `id` int(10) NOT NULL,
  `cid` int(10) NOT NULL,
  `uid` int(10) NOT NULL,
  `UpdatedDate` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bookmarks`
--

INSERT INTO `bookmarks` (`id`, `cid`, `uid`, `UpdatedDate`) VALUES
(20, 13, 1, '2020-12-30'),
(21, 14, 1, '2020-12-30'),
(22, 15, 1, '2021-01-05');

-- --------------------------------------------------------

--
-- Table structure for table `campaigns`
--

CREATE TABLE `campaigns` (
  `id` int(10) NOT NULL,
  `uid` int(10) NOT NULL,
  `target_fund` int(9) DEFAULT NULL,
  `raised_fund` int(9) DEFAULT NULL,
  `ctype` varchar(20) NOT NULL,
  `description` text NOT NULL,
  `image` varchar(200) DEFAULT NULL,
  `publisedDate` date NOT NULL,
  `endDate` date NOT NULL,
  `status` int(1) DEFAULT 0,
  `title` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `campaigns`
--

INSERT INTO `campaigns` (`id`, `uid`, `target_fund`, `raised_fund`, `ctype`, `description`, `image`, `publisedDate`, `endDate`, `status`, `title`) VALUES
(14, 1, 999010, 999350, 'bsjjasdb', 'sajfjajhdeahkjhkdhkldashl', 'upload\\image\\11-12-33pm.43-430057_pixel-heart-pixel-heart-png-transparent-clipart.png', '2021-01-01', '2021-01-21', 0, 'dsdage'),
(15, 1, 345533, 0, 'dsfas', 'eafsdfdsfsdfdsfaddsdsfagdsd', 'upload\\image\\07-38-20pm.15384500_799237720214341_6807478785208261541_o.jpg', '2021-01-04', '2021-01-13', 0, 'adfefdfaf'),
(16, 1, 50000, 54000, 'ccccccccc', 'nnnnnnnnnnnnnnnnnnnnnnnnn', 'upload\\image\\04-44-49am.1.jpg', '2021-01-05', '2021-01-13', 0, 'friend'),
(17, 1, 1000000, 0, 'helped', 'saguagsjgdhjsgfgasjgfashfashvfasvjhsvhjas\r\nasvfasgsfjsgsvhjfdjhadsf', 'upload\\image\\01-56-48pm.1.jpg', '2021-01-05', '2021-01-07', 0, 'dsfsggh'),
(36, 1, 999010, 0, 'sdjksdjkdsa', 'rsrggsgfdgsdfgsgsagflkmlk', NULL, '2021-01-07', '2021-01-14', 0, 'FfwfdafwfwWFEFSDdwasafwrefasacascccrsefsgagagaeg'),
(37, 1, 999010, 0, 'xdbcfnb', 'cgncvvbcffhfd', NULL, '2021-01-07', '2021-01-22', 0, 'dfhdhdhdggdg');

-- --------------------------------------------------------

--
-- Table structure for table `campaign_history`
--

CREATE TABLE `campaign_history` (
  `id` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `target_fund` decimal(10,0) NOT NULL,
  `raised_fund` decimal(10,0) NOT NULL,
  `ctype` varchar(30) NOT NULL,
  `discription` varchar(100) NOT NULL,
  `title` varchar(40) NOT NULL,
  `image` varchar(200) NOT NULL,
  `publisedDate` date NOT NULL,
  `endDate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `campaign_history`
--

INSERT INTO `campaign_history` (`id`, `uid`, `target_fund`, `raised_fund`, `ctype`, `discription`, `title`, `image`, `publisedDate`, `endDate`) VALUES
(13, 1, '999010', '0', 'hbmbkbk', 'jkjskjdaskdjbajakd', 'uquhdudqdedl', 'upload\\image\\09-48-54am.43-430057_pixel-heart-pixel-heart-png-transparent-clipart.png', '2020-12-30', '2020-12-30 15:48:00'),
(14, 1, '999010', '0', 'hbmbkbk', 'jnbkjkjskjbSKJBJBKA', 'JWBKHWDHW', 'upload\\image\\08-44-43am.20.png', '2020-12-30', '2020-12-30 14:44:00'),
(15, 1, '999010', '0', 'asdferr', 'saghghsaghasgsgsaugsuasgu', 'sjgdsaggsa', 'upload\\image\\02-12-00pm.365073.jpg', '2021-01-05', '2021-01-08 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `contactadmin`
--

CREATE TABLE `contactadmin` (
  `id` int(10) NOT NULL,
  `uid` int(10) NOT NULL,
  `description` text NOT NULL,
  `UpdatedDate` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `donation`
--

CREATE TABLE `donation` (
  `id` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `cid` int(11) NOT NULL,
  `amount` decimal(10,0) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `donation`
--

INSERT INTO `donation` (`id`, `uid`, `cid`, `amount`, `date`) VALUES
(6, 13, 5, '50000', '2021-01-05'),
(7, 12, 3, '340', '2021-01-05'),
(8, 12, 3, '999010', '2021-01-05');

-- --------------------------------------------------------

--
-- Table structure for table `history`
--

CREATE TABLE `history` (
  `id` int(11) NOT NULL,
  `target_fund` decimal(10,0) NOT NULL,
  `raised_fund` decimal(10,0) NOT NULL DEFAULT 0,
  `description` varchar(200) NOT NULL,
  `publisedDate` date NOT NULL,
  `endDate` date NOT NULL,
  `title` varchar(50) NOT NULL,
  `ctype` varchar(50) NOT NULL,
  `uid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `history`
--

INSERT INTO `history` (`id`, `target_fund`, `raised_fund`, `description`, `publisedDate`, `endDate`, `title`, `ctype`, `uid`) VALUES
(1, '999010', '0', 'kjbjhjkvjhvjhvjvjhvjhvjhv', '2021-01-01', '2021-01-01', 'bhjhjjhg', 'hvhjfj', 1),
(2, '999010', '0', 'kn,jjbjbjhbhbhjvbhvhkbvvk', '2021-01-01', '2021-01-01', 'clubvc', 'hbmbkbk', 1),
(3, '999010', '0', 'sajfjajhdeahkjhkdhkldashl', '2021-01-01', '2021-01-21', 'dsdage', 'bsjjasdb', 1),
(4, '345533', '0', 'eafsdfdsfsdfdsfaddsdsfagdsd', '2021-01-04', '2021-01-13', 'adfefdfaf', 'dsfas', 1),
(5, '50000', '0', 'nnnnnnnnnnnnnnnnnnnnnnnnn', '2021-01-05', '2021-01-13', 'friend', 'ccccccccc', 1),
(6, '1000000', '0', 'saguagsjgdhjsgfgasjgfashfashvfasvjhsvhjas\r\nasvfasgsfjsgsvhjfdjhadsf', '2021-01-05', '2021-01-07', 'dsfsggh', 'helped', 1),
(7, '999010', '0', 'saghghsaghasgsgsaugsuasgu', '2021-01-05', '2021-01-08', 'sjgdsaggsa', 'asdferr', 1),
(8, '999010', '0', 'rsrggsgfdgsdfgsgsagflkmlk', '2021-01-07', '2021-01-14', 'FfwfdafwfwWFEFSDdwasafwrefasacascccrsefsgagagaeg', 'sdjksdjkdsa', 1),
(9, '999010', '0', 'cgncvvbcffhfd', '2021-01-07', '2021-01-22', 'dfhdhdhdggdg', 'xdbcfnb', 1);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2021_01_01_235402_create_notifications_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `organization`
--

CREATE TABLE `organization` (
  `uid` int(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `contactno` varchar(15) NOT NULL,
  `Address` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `pending_transaction_log`
--

CREATE TABLE `pending_transaction_log` (
  `id` int(11) NOT NULL,
  `target_fund` decimal(10,0) NOT NULL,
  `ctype` varchar(50) NOT NULL,
  `description` varchar(200) NOT NULL,
  `issueDate` varchar(100) NOT NULL,
  `EndDate` varchar(100) NOT NULL,
  `userId` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `image` varchar(200) NOT NULL,
  `identity` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `personal`
--

CREATE TABLE `personal` (
  `uid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `contactno` varchar(15) NOT NULL,
  `gender` int(1) NOT NULL,
  `Address` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `recommendation`
--

CREATE TABLE `recommendation` (
  `id` int(10) NOT NULL,
  `sid` int(10) NOT NULL,
  `rid` int(10) NOT NULL,
  `cid` int(10) NOT NULL,
  `updatedDate` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `reports`
--

CREATE TABLE `reports` (
  `id` int(10) NOT NULL,
  `cid` int(10) NOT NULL,
  `uid` int(10) NOT NULL,
  `description` text NOT NULL,
  `updatedDate` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(5) NOT NULL,
  `username` varchar(20) DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) DEFAULT NULL,
  `utype` int(1) DEFAULT NULL,
  `status` int(1) NOT NULL DEFAULT 1,
  `image` varchar(200) DEFAULT NULL,
  `name` varchar(200) NOT NULL,
  `addedDate` date DEFAULT NULL,
  `donateAmount` decimal(10,0) NOT NULL DEFAULT 0,
  `provider_id` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `utype`, `status`, `image`, `name`, `addedDate`, `donateAmount`, `provider_id`) VALUES
(1, 'nabin', 'nabin@gmail.com', '1234', 2, 1, 'upload\\image\\08-44-43am.20.png', 'Nabin', NULL, '0', NULL),
(12, 'jn nabin', 'jnabin12@gmail.com', '00000', 3, 1, 'https://lh6.googleusercontent.com/-TNURU-2STJE/AAAAAAAAAAI/AAAAAAAAAAA/AMZuucle-0bop-r8418yP3uYF1SJqtrXgg/s96-c/photo.jpg', 'jn nabin', '2021-01-05', '999350', '115080347139451351246'),
(13, 'sabbir', 'vb@gmail.com', '1234', 3, 1, 'upload\\image\\02-02-16pm.365073.jpg', 'sabbir resd', '2021-01-05', '50000', NULL),
(14, 'Jahangir Nabin', 'jahangirnabin2@gmail.com', '00000', 3, 1, 'https://lh3.googleusercontent.com/a-/AOh14GhgahSc_75PvO0P7v6o17wxC9wx6E0_QWBsPGcM=s96-c', 'Jahangir Nabin', '2021-01-05', '12345', '100130590990064880472'),
(15, 'rakibul', 'r@gmail.com', '1234', 2, 1, 'upload\\image\\08-44-43am.20.png', 'wwwwwwwww', '2021-01-06', '0', 'null');

-- --------------------------------------------------------

--
-- Table structure for table `volunteer`
--

CREATE TABLE `volunteer` (
  `uid` int(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `contactno` varchar(15) NOT NULL,
  `gender` int(1) NOT NULL,
  `address` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `apistore`
--
ALTER TABLE `apistore`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bookmarks`
--
ALTER TABLE `bookmarks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cid` (`cid`),
  ADD KEY `uid` (`uid`);

--
-- Indexes for table `campaigns`
--
ALTER TABLE `campaigns`
  ADD PRIMARY KEY (`id`),
  ADD KEY `campaigns_ibfk_1` (`uid`);

--
-- Indexes for table `campaign_history`
--
ALTER TABLE `campaign_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`);

--
-- Indexes for table `contactadmin`
--
ALTER TABLE `contactadmin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `donation`
--
ALTER TABLE `donation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cid` (`cid`),
  ADD KEY `uid` (`uid`);

--
-- Indexes for table `history`
--
ALTER TABLE `history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Indexes for table `pending_transaction_log`
--
ALTER TABLE `pending_transaction_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userId` (`userId`);

--
-- Indexes for table `recommendation`
--
ALTER TABLE `recommendation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reports`
--
ALTER TABLE `reports`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cid` (`cid`),
  ADD KEY `uid` (`uid`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `apistore`
--
ALTER TABLE `apistore`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bookmarks`
--
ALTER TABLE `bookmarks`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `campaigns`
--
ALTER TABLE `campaigns`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `campaign_history`
--
ALTER TABLE `campaign_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `contactadmin`
--
ALTER TABLE `contactadmin`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `donation`
--
ALTER TABLE `donation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `history`
--
ALTER TABLE `history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `pending_transaction_log`
--
ALTER TABLE `pending_transaction_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `recommendation`
--
ALTER TABLE `recommendation`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reports`
--
ALTER TABLE `reports`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bookmarks`
--
ALTER TABLE `bookmarks`
  ADD CONSTRAINT `bookmarks_ibfk_1` FOREIGN KEY (`cid`) REFERENCES `campaign_history` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `bookmarks_ibfk_2` FOREIGN KEY (`uid`) REFERENCES `users` (`id`);

--
-- Constraints for table `campaigns`
--
ALTER TABLE `campaigns`
  ADD CONSTRAINT `campaigns_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `campaign_history`
--
ALTER TABLE `campaign_history`
  ADD CONSTRAINT `campaign_history_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `users` (`id`);

--
-- Constraints for table `donation`
--
ALTER TABLE `donation`
  ADD CONSTRAINT `donation_ibfk_1` FOREIGN KEY (`cid`) REFERENCES `history` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `donation_ibfk_2` FOREIGN KEY (`uid`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `history`
--
ALTER TABLE `history`
  ADD CONSTRAINT `history_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pending_transaction_log`
--
ALTER TABLE `pending_transaction_log`
  ADD CONSTRAINT `pending_transaction_log_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`);

--
-- Constraints for table `reports`
--
ALTER TABLE `reports`
  ADD CONSTRAINT `reports_ibfk_1` FOREIGN KEY (`cid`) REFERENCES `campaigns` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `reports_ibfk_2` FOREIGN KEY (`uid`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
