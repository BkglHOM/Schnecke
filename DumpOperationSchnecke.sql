CREATE DATABASE  IF NOT EXISTS `operationschnecke` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `operationschnecke`;
-- MySQL dump 10.13  Distrib 8.0.24, for Win64 (x86_64)
--
-- Host: localhost    Database: operationschnecke
-- ------------------------------------------------------
-- Server version	8.0.24

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
-- Table structure for table `kundehaslocation`
--

DROP TABLE IF EXISTS `kundehaslocation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kundehaslocation` (
  `idKHL` int NOT NULL,
  `idKunden` int DEFAULT NULL,
  `idloctions` int DEFAULT NULL,
  PRIMARY KEY (`idKHL`),
  KEY `idkunden_idx` (`idKunden`),
  KEY `idlocations_idx` (`idloctions`),
  CONSTRAINT `fk_04` FOREIGN KEY (`idKunden`) REFERENCES `kunden` (`idKunden`),
  CONSTRAINT `fk_05` FOREIGN KEY (`idloctions`) REFERENCES `locations` (`idlocations`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kundehaslocation`
--

LOCK TABLES `kundehaslocation` WRITE;
/*!40000 ALTER TABLE `kundehaslocation` DISABLE KEYS */;
INSERT INTO `kundehaslocation` VALUES (1,1,1),(2,2,2),(3,3,3),(4,4,4),(5,5,5),(6,6,6);
/*!40000 ALTER TABLE `kundehaslocation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kunden`
--

DROP TABLE IF EXISTS `kunden`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kunden` (
  `idKunden` int NOT NULL,
  `KundenVorname` varchar(45) DEFAULT NULL,
  `KundenNachname` varchar(45) DEFAULT NULL,
  `KundenGeburtstag` varchar(45) DEFAULT NULL,
  `KundenWohnort` varchar(45) DEFAULT NULL,
  `KundenBio` varchar(45) DEFAULT NULL,
  `KundenHobby` varchar(45) DEFAULT NULL,
  `idLogin` int DEFAULT NULL,
  `idregestrierung` int DEFAULT NULL,
  `idlocations` int DEFAULT NULL,
  PRIMARY KEY (`idKunden`),
  KEY `fk_01_idx` (`idLogin`),
  KEY `fk_02_idx` (`idregestrierung`),
  CONSTRAINT `fk_01` FOREIGN KEY (`idLogin`) REFERENCES `login` (`idLogin`),
  CONSTRAINT `fk_02` FOREIGN KEY (`idregestrierung`) REFERENCES `regstrierung` (`idregstrierung`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kunden`
--

LOCK TABLES `kunden` WRITE;
/*!40000 ALTER TABLE `kunden` DISABLE KEYS */;
INSERT INTO `kunden` VALUES (1,'Hans','Holz','1999-09-20','Köln','Ich bin eine Bio','Schwimmen',1,1,1),(2,'Dieter','Stein','1980-09-24','Bonn','Ich bin eine Bio','Tennis',2,2,2),(3,'Peter','Müller','2000-01-02','Frankfurt','Ich bin eine Bio','Fußball',3,3,3),(4,'Lena','Sumpf','1993-02-10','Stuttgart','Ich bin eine Bio','Tischtennis',4,4,4),(5,'Isabella','Besen','1990-05-20','Köln','Ich bin eine Bio','Handball',5,5,5),(6,'Maria','Stiehl','2000-01-01','Bonn','Ich bin eine Bio','Schlafen',6,6,6);
/*!40000 ALTER TABLE `kunden` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locations`
--

DROP TABLE IF EXISTS `locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `locations` (
  `idlocations` int NOT NULL,
  `Treffpunkt` varchar(45) DEFAULT NULL,
  `Adresse` varchar(45) DEFAULT NULL,
  `Datum` date DEFAULT NULL,
  PRIMARY KEY (`idlocations`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locations`
--

LOCK TABLES `locations` WRITE;
/*!40000 ALTER TABLE `locations` DISABLE KEYS */;
INSERT INTO `locations` VALUES (1,'Restaurant','Straße 1','2021-11-30'),(2,'Kino','Straße 2','2021-11-01'),(3,'Park','Straße 3','2021-12-13'),(4,'Restaurant','Straße 4','2021-12-10'),(5,'Museum','Straße 5','2021-11-19'),(6,'Zoo','Straße 6','2021-11-20');
/*!40000 ALTER TABLE `locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `login` (
  `idLogin` int NOT NULL,
  `Benutzername` varchar(45) DEFAULT NULL,
  `Passwort` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idLogin`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login`
--

LOCK TABLES `login` WRITE;
/*!40000 ALTER TABLE `login` DISABLE KEYS */;
INSERT INTO `login` VALUES (1,'Rudolf99','1234'),(2,'ArminLusche','1223'),(3,'ReinDa','1345'),(4,'Moin30101','3232'),(5,'xX_Gaming_Xx','4333'),(6,'FortniteKiller14','2323');
/*!40000 ALTER TABLE `login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `regstrierung`
--

DROP TABLE IF EXISTS `regstrierung`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `regstrierung` (
  `idregstrierung` int NOT NULL,
  `Passwort` varchar(45) DEFAULT NULL,
  `Benutzername` varchar(45) DEFAULT NULL,
  `idKunden` int DEFAULT NULL,
  PRIMARY KEY (`idregstrierung`),
  KEY `fk_01_idx` (`idKunden`),
  KEY `fk_03_idx` (`idKunden`),
  CONSTRAINT `fk_03` FOREIGN KEY (`idKunden`) REFERENCES `kunden` (`idKunden`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `regstrierung`
--

LOCK TABLES `regstrierung` WRITE;
/*!40000 ALTER TABLE `regstrierung` DISABLE KEYS */;
INSERT INTO `regstrierung` VALUES (1,'1234','Rudolf99',1),(2,'1223','ArminLusche',2),(3,'1345','ReinDa',3),(4,'3232','Moin30101',4),(5,'4333','xX_Gaming_Xx',5),(6,'2323','FortniteKiller14',6);
/*!40000 ALTER TABLE `regstrierung` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-09-21 11:06:10
