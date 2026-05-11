-- MySQL dump 10.13  Distrib 9.6.0, for macos14.8 (x86_64)
--
-- Host: localhost    Database: tv
-- ------------------------------------------------------
-- Server version	9.7.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ 'f6398856-45ea-11f1-b3d5-afc6d4d4a9d2:1-336';

--
-- Table structure for table `broadcast_slots`
--

DROP TABLE IF EXISTS `broadcast_slots`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `broadcast_slots` (
  `id` int NOT NULL AUTO_INCREMENT,
  `channel_id` int NOT NULL,
  `start_time` datetime NOT NULL,
  `end_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `channel_id` (`channel_id`),
  CONSTRAINT `broadcast_slots_ibfk_1` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `broadcast_slots`
--

LOCK TABLES `broadcast_slots` WRITE;
/*!40000 ALTER TABLE `broadcast_slots` DISABLE KEYS */;
INSERT INTO `broadcast_slots` VALUES (5,1,'2026-05-10 20:00:00','2026-05-10 20:30:00'),(6,2,'2026-05-10 21:00:00','2026-05-10 22:00:00'),(7,3,'2026-05-10 21:00:00','2026-05-10 23:00:00'),(8,4,'2026-05-10 19:00:00','2026-05-10 19:30:00');
/*!40000 ALTER TABLE `broadcast_slots` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `broadcasts`
--

DROP TABLE IF EXISTS `broadcasts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `broadcasts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `broadcast_slot_id` int NOT NULL,
  `episode_id` int NOT NULL,
  `view_count` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `broadcast_slot_id` (`broadcast_slot_id`),
  KEY `episode_id` (`episode_id`),
  CONSTRAINT `broadcasts_ibfk_1` FOREIGN KEY (`broadcast_slot_id`) REFERENCES `broadcast_slots` (`id`),
  CONSTRAINT `broadcasts_ibfk_2` FOREIGN KEY (`episode_id`) REFERENCES `episodes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `broadcasts`
--

LOCK TABLES `broadcasts` WRITE;
/*!40000 ALTER TABLE `broadcasts` DISABLE KEYS */;
INSERT INTO `broadcasts` VALUES (1,5,1,1500),(2,5,2,1000),(3,5,3,2000),(4,6,4,900),(5,7,5,2300),(6,8,6,1800);
/*!40000 ALTER TABLE `broadcasts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `channels`
--

DROP TABLE IF EXISTS `channels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `channels` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `channels`
--

LOCK TABLES `channels` WRITE;
/*!40000 ALTER TABLE `channels` DISABLE KEYS */;
INSERT INTO `channels` VALUES (1,'アニメ'),(2,'スポーツ'),(3,'映画'),(4,'ペット');
/*!40000 ALTER TABLE `channels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `episodes`
--

DROP TABLE IF EXISTS `episodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `episodes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `program_id` int NOT NULL,
  `season_id` int DEFAULT NULL,
  `episode_number` int DEFAULT NULL,
  `title` varchar(100) NOT NULL,
  `e_details` text,
  `time` int NOT NULL,
  `release_date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `program_id` (`program_id`),
  KEY `season_id` (`season_id`),
  CONSTRAINT `episodes_ibfk_1` FOREIGN KEY (`program_id`) REFERENCES `programs` (`id`),
  CONSTRAINT `episodes_ibfk_2` FOREIGN KEY (`season_id`) REFERENCES `seasons` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `episodes`
--

LOCK TABLES `episodes` WRITE;
/*!40000 ALTER TABLE `episodes` DISABLE KEYS */;
INSERT INTO `episodes` VALUES (1,1,1,1,'残酷','炭治郎の旅が始まる',24,'2026-01-01'),(2,1,1,2,'育手','修行が始まる',24,'2026-01-08'),(3,1,2,1,'新たなる任務','新章スタート',24,'2026-04-01'),(4,2,NULL,NULL,'今日のプロ野球','試合結果まとめ',60,'2026-05-01'),(5,3,NULL,NULL,'アクション映画SP','大人気映画を放送',120,'2026-05-02'),(6,4,3,1,'子猫特集','かわいい子猫の日常',30,'2026-03-01');
/*!40000 ALTER TABLE `episodes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genres`
--

DROP TABLE IF EXISTS `genres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genres` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genres`
--

LOCK TABLES `genres` WRITE;
/*!40000 ALTER TABLE `genres` DISABLE KEYS */;
INSERT INTO `genres` VALUES (1,'アニメ'),(2,'スポーツ'),(3,'映画'),(4,'ペット');
/*!40000 ALTER TABLE `genres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `program_genres`
--

DROP TABLE IF EXISTS `program_genres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `program_genres` (
  `program_id` int NOT NULL,
  `genre_id` int NOT NULL,
  PRIMARY KEY (`program_id`,`genre_id`),
  KEY `genre_id` (`genre_id`),
  CONSTRAINT `program_genres_ibfk_1` FOREIGN KEY (`program_id`) REFERENCES `programs` (`id`),
  CONSTRAINT `program_genres_ibfk_2` FOREIGN KEY (`genre_id`) REFERENCES `genres` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `program_genres`
--

LOCK TABLES `program_genres` WRITE;
/*!40000 ALTER TABLE `program_genres` DISABLE KEYS */;
INSERT INTO `program_genres` VALUES (1,1),(2,2),(3,3),(4,4);
/*!40000 ALTER TABLE `program_genres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `programs`
--

DROP TABLE IF EXISTS `programs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `programs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `p_details` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `programs`
--

LOCK TABLES `programs` WRITE;
/*!40000 ALTER TABLE `programs` DISABLE KEYS */;
INSERT INTO `programs` VALUES (1,'鬼滅の刃','鬼と戦う剣士の物語'),(2,'プロ野今日ニュース','本日のプロ野球結果をお届け'),(3,'深夜映画スペシャル','毎週話題の映画を放送'),(4,'猫の暮らし','猫の日常を紹介する番組');
/*!40000 ALTER TABLE `programs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seasons`
--

DROP TABLE IF EXISTS `seasons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seasons` (
  `id` int NOT NULL AUTO_INCREMENT,
  `program_id` int NOT NULL,
  `season_number` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `program_id` (`program_id`,`season_number`),
  CONSTRAINT `seasons_ibfk_1` FOREIGN KEY (`program_id`) REFERENCES `programs` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seasons`
--

LOCK TABLES `seasons` WRITE;
/*!40000 ALTER TABLE `seasons` DISABLE KEYS */;
INSERT INTO `seasons` VALUES (1,1,1),(2,1,2),(3,4,1);
/*!40000 ALTER TABLE `seasons` ENABLE KEYS */;
UNLOCK TABLES;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-05-10 23:20:21
