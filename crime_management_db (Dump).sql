CREATE DATABASE  IF NOT EXISTS `crime_management` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `crime_management`;
-- MySQL dump 10.13  Distrib 8.0.43, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: crime_management
-- ------------------------------------------------------
-- Server version	8.0.43

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
-- Table structure for table `case_status`
--

DROP TABLE IF EXISTS `case_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `case_status` (
  `StatusCode` int NOT NULL,
  `StatusDescription` varchar(20) NOT NULL,
  PRIMARY KEY (`StatusCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `case_status`
--

LOCK TABLES `case_status` WRITE;
/*!40000 ALTER TABLE `case_status` DISABLE KEYS */;
INSERT INTO `case_status` VALUES (1,'Open'),(2,'Under Investigation'),(3,'Closed');
/*!40000 ALTER TABLE `case_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `case_table`
--

DROP TABLE IF EXISTS `case_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `case_table` (
  `CaseID` int NOT NULL AUTO_INCREMENT,
  `CaseDetails` varchar(255) NOT NULL,
  `AttendingOfficer` int NOT NULL,
  `Category` varchar(12) NOT NULL,
  `Location` varchar(50) DEFAULT NULL,
  `ReportedOn` date NOT NULL,
  `Status` int NOT NULL,
  PRIMARY KEY (`CaseID`),
  KEY `fk_officer` (`AttendingOfficer`),
  KEY `fk_category` (`Category`),
  KEY `fk_status` (`Status`),
  CONSTRAINT `fk_category` FOREIGN KEY (`Category`) REFERENCES `crime_category` (`CrimeTypeID`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_officer` FOREIGN KEY (`AttendingOfficer`) REFERENCES `officer` (`OfficerID`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_status` FOREIGN KEY (`Status`) REFERENCES `case_status` (`StatusCode`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `case_table`
--

LOCK TABLES `case_table` WRITE;
/*!40000 ALTER TABLE `case_table` DISABLE KEYS */;
INSERT INTO `case_table` VALUES (1,'Burglary at City Mall – safe broken into',1,'BUR','123 Main St','2025-05-05',2),(2,'Cyber fraud via phishing email',2,'FRA','Online','2025-05-03',1),(3,'Vehicle stolen from parking lot',3,'THE','Sunset Blvd','2025-05-01',2),(4,'Assault outside nightclub',3,'ASS','Club X','2025-04-28',3),(5,'Domestic dispute – neighbors called',5,'DOM','45 Green St','2025-04-30',1);
/*!40000 ALTER TABLE `case_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `crime_category`
--

DROP TABLE IF EXISTS `crime_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `crime_category` (
  `CrimeTypeID` varchar(12) NOT NULL,
  `Description` varchar(50) NOT NULL,
  PRIMARY KEY (`CrimeTypeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crime_category`
--

LOCK TABLES `crime_category` WRITE;
/*!40000 ALTER TABLE `crime_category` DISABLE KEYS */;
INSERT INTO `crime_category` VALUES ('ASS','Assault'),('BUR','Burglary'),('DOM','Domestic Dispute'),('FRA','Fraud'),('THE','Theft');
/*!40000 ALTER TABLE `crime_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `officer`
--

DROP TABLE IF EXISTS `officer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `officer` (
  `OfficerID` int NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `Rank` varchar(12) NOT NULL,
  `Phone` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`OfficerID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `officer`
--

LOCK TABLES `officer` WRITE;
/*!40000 ALTER TABLE `officer` DISABLE KEYS */;
INSERT INTO `officer` VALUES (1,'James','Patel','Detective','0821112222'),(2,'Lerato','Mokoena','Sergeant','0833334444'),(3,'Thabo','Dlamini','Constable','0845556666'),(4,'Aisha','Khan','Lieutenant','0857778888'),(5,'Sipho','Nkosi','Officer','0869990000');
/*!40000 ALTER TABLE `officer` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-11-06 13:11:32
