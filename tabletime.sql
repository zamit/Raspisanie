-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: tabletime
-- ------------------------------------------------------
-- Server version	8.0.23

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `gruppa`
--

DROP TABLE IF EXISTS `gruppa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gruppa` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gruppa`
--

LOCK TABLES `gruppa` WRITE;
/*!40000 ALTER TABLE `gruppa` DISABLE KEYS */;
INSERT INTO `gruppa` VALUES (1,'ИСП-1'),(2,'ТАК-1'),(3,'ПНГ-3'),(4,'ПБ-21'),(5,'Б-21'),(6,'ПРО-12'),(7,'РИПК-36'),(8,'КПС-45'),(9,'wqdqwd'),(10,'ПКС-89'),(11,'ТАК-9'),(18,'ИСП-6'),(25,'ПР-01');
/*!40000 ALTER TABLE `gruppa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `office`
--

DROP TABLE IF EXISTS `office`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `office` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `comment` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `office`
--

LOCK TABLES `office` WRITE;
/*!40000 ALTER TABLE `office` DISABLE KEYS */;
INSERT INTO `office` VALUES (1,'1','Русский'),(2,'2',NULL),(3,'3',NULL),(4,'4',NULL),(5,'5',NULL),(6,'6',NULL),(7,'7',NULL),(8,'7a','Хим'),(9,'7б',NULL),(10,'8',NULL),(11,'9',NULL),(12,'10',NULL),(13,'11','Математика'),(14,'12',NULL),(15,'13','Физика'),(16,'14',NULL),(17,'15',NULL),(18,'16','Комп'),(19,'16а','ВорлдСкиллс'),(20,'17',NULL),(23,'20',NULL),(24,'20а','Принтеры и коморка'),(25,'20б',NULL),(30,'22','Условно принтеры'),(39,'23','Принтеры');
/*!40000 ALTER TABLE `office` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tabletime_basic`
--

DROP TABLE IF EXISTS `tabletime_basic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tabletime_basic` (
  `id` int NOT NULL AUTO_INCREMENT,
  `para` int DEFAULT NULL,
  `day` int DEFAULT NULL,
  `type` enum('общий','числитель','знаменатель') DEFAULT NULL,
  `cabinet` int DEFAULT NULL,
  `gruppa` int DEFAULT NULL,
  `disciplina` varchar(200) DEFAULT NULL,
  `teacher` int DEFAULT NULL,
  `subgroup` enum('1','2','0') DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cabFRK_idx` (`cabinet`),
  KEY `groupFRK_idx` (`gruppa`),
  KEY `teacherFRK_idx` (`teacher`),
  KEY `dayFRK_idx` (`day`),
  CONSTRAINT `cabFRK` FOREIGN KEY (`cabinet`) REFERENCES `office` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `dayFRK` FOREIGN KEY (`day`) REFERENCES `tabletime_basic_day` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `groupFRK` FOREIGN KEY (`gruppa`) REFERENCES `gruppa` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `teacherFRK` FOREIGN KEY (`teacher`) REFERENCES `teacher` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tabletime_basic`
--

LOCK TABLES `tabletime_basic` WRITE;
/*!40000 ALTER TABLE `tabletime_basic` DISABLE KEYS */;
INSERT INTO `tabletime_basic` VALUES (5,7,2,'общий',9,2,'МДК03.01',1,'1'),(7,1,3,'знаменатель',5,3,'МДК11.01',5,'1'),(10,4,2,'знаменатель',6,4,'Химия',5,'0');
/*!40000 ALTER TABLE `tabletime_basic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tabletime_basic_day`
--

DROP TABLE IF EXISTS `tabletime_basic_day`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tabletime_basic_day` (
  `id` int NOT NULL AUTO_INCREMENT,
  `day` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tabletime_basic_day`
--

LOCK TABLES `tabletime_basic_day` WRITE;
/*!40000 ALTER TABLE `tabletime_basic_day` DISABLE KEYS */;
INSERT INTO `tabletime_basic_day` VALUES (1,'Понедельник'),(2,'Вторник'),(3,'Суббота'),(4,'Четверг'),(9,'Среда'),(10,'Пятница');
/*!40000 ALTER TABLE `tabletime_basic_day` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tabletime_change`
--

DROP TABLE IF EXISTS `tabletime_change`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tabletime_change` (
  `id` int NOT NULL AUTO_INCREMENT,
  `para` int DEFAULT NULL,
  `gruppa` int DEFAULT NULL,
  `disciplina` varchar(200) DEFAULT NULL,
  `cabinet` int DEFAULT '0',
  `day` int DEFAULT NULL,
  `who_teacher` int DEFAULT NULL,
  `whom_teacher` int DEFAULT NULL,
  `subgroup` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `gruppaFRK_idx` (`gruppa`),
  KEY `cabFRK_idx` (`cabinet`),
  KEY `whoFRK_idx` (`who_teacher`),
  KEY `whomFRK_idx` (`whom_teacher`),
  KEY `dayFRK_idx` (`day`),
  CONSTRAINT `cabinetFRK` FOREIGN KEY (`cabinet`) REFERENCES `office` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `dayChangeFRK` FOREIGN KEY (`day`) REFERENCES `tabletime_change_day` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `gruppaFRK` FOREIGN KEY (`gruppa`) REFERENCES `gruppa` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `whoFRK` FOREIGN KEY (`who_teacher`) REFERENCES `teacher` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `whomFRK` FOREIGN KEY (`whom_teacher`) REFERENCES `teacher` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tabletime_change`
--

LOCK TABLES `tabletime_change` WRITE;
/*!40000 ALTER TABLE `tabletime_change` DISABLE KEYS */;
INSERT INTO `tabletime_change` VALUES (1,1,2,'МДК11.01',9,1,1,1,'0'),(2,2,3,'Математика',8,2,2,3,'0'),(3,3,5,'Английский язык',10,5,2,4,'2'),(4,2,6,'Химия',9,1,5,4,'2'),(6,5,5,'информатика',10,1,2,4,'1'),(9,6,7,'Математика',7,9,4,6,'1'),(10,6,5,'МДК02.02',9,1,3,6,'0'),(21,3,3,'efwef',5,1,3,4,'0'),(22,3,5,'wef',8,11,3,4,'1'),(23,4,3,'Русский язык',7,1,2,3,'0');
/*!40000 ALTER TABLE `tabletime_change` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tabletime_change_day`
--

DROP TABLE IF EXISTS `tabletime_change_day`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tabletime_change_day` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_table` date DEFAULT NULL,
  `day` varchar(45) DEFAULT NULL,
  `type` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tabletime_change_day`
--

LOCK TABLES `tabletime_change_day` WRITE;
/*!40000 ALTER TABLE `tabletime_change_day` DISABLE KEYS */;
INSERT INTO `tabletime_change_day` VALUES (1,'2021-03-22','Вторник','знаменатель'),(2,'2021-03-23','Вторник','числитель'),(3,'2021-03-24','Среда','Общий'),(4,'2021-03-25','Четверг','Общий'),(5,'2021-03-26','Пятница','числитель'),(9,'2021-04-08','Вторник','знаменатель'),(11,'2021-04-16','Среда','знаменатель');
/*!40000 ALTER TABLE `tabletime_change_day` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teacher`
--

DROP TABLE IF EXISTS `teacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teacher` (
  `id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(200) DEFAULT NULL,
  `middle_name` varchar(200) DEFAULT NULL,
  `last_name` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teacher`
--

LOCK TABLES `teacher` WRITE;
/*!40000 ALTER TABLE `teacher` DISABLE KEYS */;
INSERT INTO `teacher` VALUES (1,'Финк','Игорь','Валерьевич'),(2,'Шаненкова','Ирина','Витальевна'),(3,'Горшенина','Кристина','Владимировна'),(4,'Косынцева','Ольга','Владимировна'),(5,'Крот','Дарья','Николаевна'),(6,'Карымова','гульнара','Буляковна');
/*!40000 ALTER TABLE `teacher` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-09 19:36:23
