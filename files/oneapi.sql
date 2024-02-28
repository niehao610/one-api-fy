-- MariaDB dump 10.19-11.2.2-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: oneapi
-- ------------------------------------------------------
-- Server version	11.2.2-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `abilities`
--

DROP TABLE IF EXISTS `abilities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `abilities` (
  `group` varchar(32) NOT NULL,
  `model` varchar(191) NOT NULL,
  `channel_id` bigint(20) NOT NULL,
  `enabled` tinyint(1) DEFAULT NULL,
  `priority` bigint(20) DEFAULT 0,
  PRIMARY KEY (`group`,`model`,`channel_id`),
  KEY `idx_abilities_channel_id` (`channel_id`),
  KEY `idx_abilities_priority` (`priority`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `abilities`
--

LOCK TABLES `abilities` WRITE;
/*!40000 ALTER TABLE `abilities` DISABLE KEYS */;
INSERT INTO `abilities` VALUES
('default','qwen-turbo',1,1,0),
('default','qwen-vl-plus',1,1,0);
/*!40000 ALTER TABLE `abilities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `channels`
--

DROP TABLE IF EXISTS `channels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `channels` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type` bigint(20) DEFAULT 0,
  `key` varchar(191) NOT NULL,
  `status` bigint(20) DEFAULT 1,
  `name` varchar(191) DEFAULT NULL,
  `weight` bigint(20) unsigned DEFAULT 0,
  `created_time` bigint(20) DEFAULT NULL,
  `test_time` bigint(20) DEFAULT NULL,
  `response_time` bigint(20) DEFAULT NULL,
  `base_url` varchar(191) DEFAULT '',
  `other` longtext DEFAULT NULL,
  `balance` double DEFAULT NULL,
  `balance_updated_time` bigint(20) DEFAULT NULL,
  `models` longtext DEFAULT NULL,
  `group` varchar(32) DEFAULT 'default',
  `used_quota` bigint(20) DEFAULT 0,
  `model_mapping` varchar(1024) DEFAULT '',
  `priority` bigint(20) DEFAULT 0,
  `config` longtext DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_channels_key` (`key`),
  KEY `idx_channels_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `channels`
--

LOCK TABLES `channels` WRITE;
/*!40000 ALTER TABLE `channels` DISABLE KEYS */;
INSERT INTO `channels` VALUES
(1,17,'sk-a0a4e4cf170b462bbc0f340f118ebc14',1,'aliqw',0,1708431541,1708432712,2016,'','',0,0,'qwen-vl-plus,qwen-turbo','default',2695,'',0,'');
/*!40000 ALTER TABLE `channels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logs`
--

DROP TABLE IF EXISTS `logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `logs` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `created_at` bigint(20) DEFAULT NULL,
  `type` bigint(20) DEFAULT NULL,
  `content` longtext DEFAULT NULL,
  `username` varchar(191) DEFAULT '',
  `token_name` varchar(191) DEFAULT '',
  `model_name` varchar(191) DEFAULT '',
  `quota` bigint(20) DEFAULT 0,
  `prompt_tokens` bigint(20) DEFAULT 0,
  `completion_tokens` bigint(20) DEFAULT 0,
  `channel_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_logs_user_id` (`user_id`),
  KEY `idx_created_at_type` (`created_at`,`type`),
  KEY `index_username_model_name` (`model_name`,`username`),
  KEY `idx_logs_token_name` (`token_name`),
  KEY `idx_logs_model_name` (`model_name`),
  KEY `idx_logs_channel_id` (`channel_id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logs`
--

LOCK TABLES `logs` WRITE;
/*!40000 ALTER TABLE `logs` DISABLE KEYS */;
INSERT INTO `logs` VALUES
(1,1,1708434418,2,'模型倍率 0.57，分组倍率 1.00，补全倍率 1.00','root','test','qwen-turbo',20,12,22,1),
(2,1,1708434593,2,'模型倍率 0.57，分组倍率 1.00，补全倍率 1.00','root','test','qwen-turbo',15,16,9,1),
(3,1,1708507299,2,'模型倍率 0.57，分组倍率 1.00，补全倍率 1.00','root','test','qwen-turbo',105,60,123,1),
(4,1,1708508502,2,'模型倍率 0.57，分组倍率 1.00，补全倍率 1.00','root','test','qwen-turbo',97,57,111,1),
(5,1,1708508504,2,'模型倍率 0.57，分组倍率 1.00，补全倍率 1.00','root','test','qwen-turbo',25,6,36,1),
(6,1,1708508572,2,'模型倍率 0.57，分组倍率 1.00，补全倍率 1.00','root','test','qwen-turbo',100,57,117,1),
(7,1,1708508573,2,'模型倍率 0.57，分组倍率 1.00，补全倍率 1.00','root','test','qwen-turbo',47,63,18,1),
(8,1,1708604027,2,'模型倍率 0.57，分组倍率 1.00，补全倍率 1.00','root','test','qwen-turbo',100,57,117,1),
(9,1,1708604028,2,'模型倍率 0.57，分组倍率 1.00，补全倍率 1.00','root','test','qwen-turbo',47,63,18,1),
(10,1,1708604030,2,'模型倍率 0.57，分组倍率 1.00，补全倍率 1.00','root','test','qwen-turbo',73,67,59,1),
(11,1,1708604234,2,'模型倍率 0.57，分组倍率 1.00，补全倍率 1.00','root','test','qwen-turbo',97,57,111,1),
(12,1,1708604235,2,'模型倍率 0.57，分组倍率 1.00，补全倍率 1.00','root','test','qwen-turbo',47,63,18,1),
(13,1,1708604239,2,'模型倍率 0.57，分组倍率 1.00，补全倍率 1.00','root','test','qwen-turbo',114,67,131,1),
(14,1,1708604268,2,'模型倍率 0.57，分组倍率 1.00，补全倍率 1.00','root','test','qwen-turbo',97,57,111,1),
(15,1,1708604269,2,'模型倍率 0.57，分组倍率 1.00，补全倍率 1.00','root','test','qwen-turbo',47,63,18,1),
(16,1,1708604272,2,'模型倍率 0.57，分组倍率 1.00，补全倍率 1.00','root','test','qwen-turbo',73,67,59,1),
(17,1,1708604352,2,'模型倍率 0.57，分组倍率 1.00，补全倍率 1.00','root','test','qwen-turbo',97,57,111,1),
(18,1,1708604353,2,'模型倍率 0.57，分组倍率 1.00，补全倍率 1.00','root','test','qwen-turbo',43,68,7,1),
(19,1,1708604353,2,'模型倍率 0.57，分组倍率 1.00，补全倍率 1.00','root','test','qwen-turbo',52,77,13,1),
(20,1,1708769742,2,'模型倍率 0.57，分组倍率 1.00，补全倍率 1.00','root','testali','qwen-turbo',58,22,78,1),
(21,1,1708769836,2,'模型倍率 0.57，分组倍率 1.00，补全倍率 1.00','root','testali','qwen-turbo',97,53,116,1),
(22,1,1708769837,2,'模型倍率 0.57，分组倍率 1.00，补全倍率 1.00','root','testali','qwen-turbo',27,30,17,1),
(23,1,1708769840,2,'模型倍率 0.57，分组倍率 1.00，补全倍率 1.00','root','testali','qwen-turbo',58,15,85,1),
(24,1,1708772534,2,'模型倍率 0.57，分组倍率 1.00，补全倍率 1.00','root','testali','qwen-turbo',97,53,116,1),
(25,1,1708790502,2,'模型倍率 0.57，分组倍率 1.00，补全倍率 1.00','root','testali','qwen-turbo',93,66,95,1),
(26,1,1708790734,2,'模型倍率 0.57，分组倍率 1.00，补全倍率 1.00','root','testali','qwen-turbo',94,66,98,1),
(27,1,1708790735,2,'模型倍率 0.57，分组倍率 1.00，补全倍率 1.00','root','testali','qwen-turbo',104,154,27,1),
(28,1,1708790882,2,'模型倍率 0.57，分组倍率 1.00，补全倍率 1.00','root','testali','qwen-turbo',141,230,16,1),
(29,1,1708791188,2,'模型倍率 0.57，分组倍率 1.00，补全倍率 1.00','root','testali','qwen-turbo',78,66,69,1),
(30,1,1708791189,2,'模型倍率 0.57，分组倍率 1.00，补全倍率 1.00','root','testali','qwen-turbo',82,127,16,1),
(31,1,1708791190,2,'模型倍率 0.57，分组倍率 1.00，补全倍率 1.00','root','testali','qwen-turbo',146,227,28,1),
(32,1,1708791519,2,'模型倍率 0.57，分组倍率 1.00，补全倍率 1.00','root','testali','qwen-turbo',94,47,116,1),
(33,1,1708791520,2,'模型倍率 0.57，分组倍率 1.00，补全倍率 1.00','root','testali','qwen-turbo',109,174,16,1),
(34,1,1708791521,2,'模型倍率 0.57，分组倍率 1.00，补全倍率 1.00','root','testali','qwen-turbo',121,199,11,1);
/*!40000 ALTER TABLE `logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `options`
--

DROP TABLE IF EXISTS `options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `options` (
  `key` varchar(191) NOT NULL,
  `value` longtext DEFAULT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `options`
--

LOCK TABLES `options` WRITE;
/*!40000 ALTER TABLE `options` DISABLE KEYS */;
/*!40000 ALTER TABLE `options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `redemptions`
--

DROP TABLE IF EXISTS `redemptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `redemptions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `key` char(32) DEFAULT NULL,
  `status` bigint(20) DEFAULT 1,
  `name` varchar(191) DEFAULT NULL,
  `quota` bigint(20) DEFAULT 100,
  `created_time` bigint(20) DEFAULT NULL,
  `redeemed_time` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_redemptions_key` (`key`),
  KEY `idx_redemptions_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `redemptions`
--

LOCK TABLES `redemptions` WRITE;
/*!40000 ALTER TABLE `redemptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `redemptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tokens`
--

DROP TABLE IF EXISTS `tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tokens` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `key` char(48) DEFAULT NULL,
  `status` bigint(20) DEFAULT 1,
  `name` varchar(191) DEFAULT NULL,
  `created_time` bigint(20) DEFAULT NULL,
  `accessed_time` bigint(20) DEFAULT NULL,
  `expired_time` bigint(20) DEFAULT -1,
  `remain_quota` bigint(20) DEFAULT 0,
  `unlimited_quota` tinyint(1) DEFAULT 0,
  `used_quota` bigint(20) DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_tokens_key` (`key`),
  KEY `idx_tokens_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tokens`
--

LOCK TABLES `tokens` WRITE;
/*!40000 ALTER TABLE `tokens` DISABLE KEYS */;
INSERT INTO `tokens` VALUES
(1,1,'UlYtNahwqcqNjbmW5aC4B943B8E64737Af3c88Ef4608AcDb',1,'testali',1708431796,1708791521,-1,497305,0,2695);
/*!40000 ALTER TABLE `tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(191) DEFAULT NULL,
  `password` longtext NOT NULL,
  `display_name` varchar(191) DEFAULT NULL,
  `role` bigint(20) DEFAULT 1,
  `status` bigint(20) DEFAULT 1,
  `email` varchar(191) DEFAULT NULL,
  `github_id` varchar(191) DEFAULT NULL,
  `wechat_id` varchar(191) DEFAULT NULL,
  `access_token` char(32) DEFAULT NULL,
  `quota` bigint(20) DEFAULT 0,
  `used_quota` bigint(20) DEFAULT 0,
  `request_count` bigint(20) DEFAULT 0,
  `group` varchar(32) DEFAULT 'default',
  `aff_code` varchar(32) DEFAULT NULL,
  `inviter_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `idx_users_access_token` (`access_token`),
  UNIQUE KEY `idx_users_aff_code` (`aff_code`),
  KEY `idx_users_email` (`email`),
  KEY `idx_users_git_hub_id` (`github_id`),
  KEY `idx_users_we_chat_id` (`wechat_id`),
  KEY `idx_users_inviter_id` (`inviter_id`),
  KEY `idx_users_username` (`username`),
  KEY `idx_users_display_name` (`display_name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES
(1,'root','$2a$10$JqjuPlEZmVWa.r61It0Ap.ngkbyggCkIGZqXUguWt5Q1x0hJ4k3TW','Root User',100,1,'','','','dda33e3fe8f042219722dad4c88dd98b',99997305,2695,34,'default','',0);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-28 20:26:54
