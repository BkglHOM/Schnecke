CREATE DATABASE  IF NOT EXISTS `operationschnecke` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `operationschnecke`;
-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: localhost    Database: operationschnecke
-- ------------------------------------------------------
-- Server version	8.0.26

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
-- Table structure for table `kunden`
--

DROP TABLE IF EXISTS `kunden`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kunden` (
  `idKunden` int NOT NULL AUTO_INCREMENT,
  `KundenVorname` varchar(45) DEFAULT NULL,
  `KundenNachname` varchar(45) DEFAULT NULL,
  `KundenGeburtstag` date DEFAULT NULL,
  `KundenWohnort` varchar(45) DEFAULT NULL,
  `KundenBio` varchar(500) DEFAULT NULL,
  `KundenHobby` varchar(45) DEFAULT NULL,
  `KundenUsername` varchar(45) DEFAULT NULL,
  `KundenPW` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idKunden`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kunden`
--

LOCK TABLES `kunden` WRITE;
/*!40000 ALTER TABLE `kunden` DISABLE KEYS */;
INSERT INTO `kunden` VALUES (1,'Hans','Holz','1999-09-20','Köln','Ich bin eine Bio','Schwimmen','Hansi','1234'),(2,'Dieter','Stein','1980-09-24','Bonn','Ich bin eine Bio','Tennis','Steiner','1223'),(3,'Peter','Müller','2000-01-02','Frankfurt','Ich bin eine Bio','Fußball','Müllermilch','1222'),(4,'Lena','Sumpf','1993-02-10','Stuttgart','Ich bin eine Bio','Tischtennis','LenasSumpf','1323'),(5,'Isabella','Besen','1990-05-20','Köln','Ich bin eine Bio','Handball','Besenmann','1232'),(6,'Maria','Stiehl','2000-01-01','Bonn','Ich bin eine Bio','Schlafen','Stuhl','1231'),(7,'Christopher','Liebing','2002-09-11','New York','Ih bims 3 kek','Keine','Chrissi','0911'),(8,'Super','Menschi','2012-02-09','Dusseldorf','adjaldkj','Butter','Butter','1234'),(12,'hhfhjskh','khjkjh','2001-09-21','kjh','','jkn','kjh','kjh');
/*!40000 ALTER TABLE `kunden` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kundenhaslocations`
--

DROP TABLE IF EXISTS `kundenhaslocations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kundenhaslocations` (
  `idkundenhaslocations` int NOT NULL AUTO_INCREMENT,
  `idkunden` int DEFAULT NULL,
  `idlocations` int DEFAULT NULL,
  PRIMARY KEY (`idkundenhaslocations`),
  KEY `idlocations_idx` (`idlocations`),
  KEY `idkunden_idx` (`idkunden`),
  CONSTRAINT `idkunden` FOREIGN KEY (`idkunden`) REFERENCES `kunden` (`idKunden`),
  CONSTRAINT `idlocations` FOREIGN KEY (`idlocations`) REFERENCES `locations` (`idLocations`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kundenhaslocations`
--

LOCK TABLES `kundenhaslocations` WRITE;
/*!40000 ALTER TABLE `kundenhaslocations` DISABLE KEYS */;
INSERT INTO `kundenhaslocations` VALUES (1,3,1),(2,4,2);
/*!40000 ALTER TABLE `kundenhaslocations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locations`
--

DROP TABLE IF EXISTS `locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `locations` (
  `idLocations` int NOT NULL AUTO_INCREMENT,
  `LocationsName` varchar(45) DEFAULT NULL,
  `LocationsOrt` varchar(45) DEFAULT NULL,
  `LocationsPlz` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idLocations`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locations`
--

LOCK TABLES `locations` WRITE;
/*!40000 ALTER TABLE `locations` DISABLE KEYS */;
INSERT INTO `locations` VALUES (1,'Cineplex','Bensberg','51420'),(2,'Cyriax','Overath','51491');
/*!40000 ALTER TABLE `locations` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-09-28 11:57:18
