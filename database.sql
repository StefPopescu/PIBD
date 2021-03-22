-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: localhost    Database: tema
-- ------------------------------------------------------
-- Server version	8.0.22

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
-- Table structure for table `actori`
--

DROP TABLE IF EXISTS `actori`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `actori` (
  `idactor` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nume` varchar(45) DEFAULT NULL,
  `prenume` varchar(45) DEFAULT NULL,
  `salariu` int DEFAULT NULL,
  `idteatru` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`idactor`),
  KEY `fk_actori1_idx` (`idteatru`),
  CONSTRAINT `fk_actori1` FOREIGN KEY (`idteatru`) REFERENCES `teatre` (`idteatru`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actori`
--

LOCK TABLES `actori` WRITE;
/*!40000 ALTER TABLE `actori` DISABLE KEYS */;
INSERT INTO `actori` VALUES (1,'Popescu','Mitica',2000,15),(23,'Popescu','Ionut',5000,17),(26,'Oti','Igor',1500,19);
/*!40000 ALTER TABLE `actori` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orase`
--

DROP TABLE IF EXISTS `orase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orase` (
  `idoras` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nume` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idoras`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orase`
--

LOCK TABLES `orase` WRITE;
/*!40000 ALTER TABLE `orase` DISABLE KEYS */;
INSERT INTO `orase` VALUES (10,'Constanta'),(11,'Arad'),(13,'Bucuresti');
/*!40000 ALTER TABLE `orase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teatre`
--

DROP TABLE IF EXISTS `teatre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teatre` (
  `idteatru` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nume` varchar(45) DEFAULT NULL,
  `capacitate` int DEFAULT NULL,
  `adresa` varchar(45) DEFAULT NULL,
  `idoras` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`idteatru`),
  KEY `fk_teatru1_idx` (`idoras`),
  CONSTRAINT `fk_teatru1` FOREIGN KEY (`idoras`) REFERENCES `orase` (`idoras`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teatre`
--

LOCK TABLES `teatre` WRITE;
/*!40000 ALTER TABLE `teatre` DISABLE KEYS */;
INSERT INTO `teatre` VALUES (15,'Teatrul de Marina',4600,'Str. Tomis Nord',10),(17,'Teatrul Odeon',5000,'Str. Olimpului',13),(19,'Teatrul Unguresc',300,'Str. Foiex',11);
/*!40000 ALTER TABLE `teatre` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-02-08 21:58:36
