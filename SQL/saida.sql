-- MySQL dump 10.17  Distrib 10.3.22-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: impressoras_geral
-- ------------------------------------------------------
-- Server version	10.3.22-MariaDB-0+deb10u1

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
-- Table structure for table `empresa`
--

DROP TABLE IF EXISTS `empresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `empresa` (
  `ID_Empresa` int(11) NOT NULL AUTO_INCREMENT,
  `Empresa` varchar(255) NOT NULL,
  PRIMARY KEY (`ID_Empresa`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empresa`
--

LOCK TABLES `empresa` WRITE;
/*!40000 ALTER TABLE `empresa` DISABLE KEYS */;
INSERT INTO `empresa` (`ID_Empresa`, `Empresa`) VALUES (1,'Ramenzoni'),(2,'Teldata'),(3,'Import Invest');
/*!40000 ALTER TABLE `empresa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `historico`
--

DROP TABLE IF EXISTS `historico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `historico` (
  `ID_revisao` int(11) NOT NULL AUTO_INCREMENT,
  `PK_impressora` int(11) NOT NULL,
  `PK_Local` int(11) NOT NULL,
  `PK_Status` int(11) NOT NULL,
  `Descricao` varchar(255) NOT NULL,
  `Data` datetime NOT NULL,
  PRIMARY KEY (`ID_revisao`),
  KEY `PK_impressora` (`PK_impressora`),
  KEY `PK_Local` (`PK_Local`),
  KEY `PK_Status` (`PK_Status`),
  CONSTRAINT `PK_Local` FOREIGN KEY (`PK_Local`) REFERENCES `local` (`ID_Local`),
  CONSTRAINT `PK_Status` FOREIGN KEY (`PK_Status`) REFERENCES `status` (`ID_Status`),
  CONSTRAINT `PK_impressora` FOREIGN KEY (`PK_impressora`) REFERENCES `impressoras` (`ID_Impressora`)
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historico`
--

LOCK TABLES `historico` WRITE;
/*!40000 ALTER TABLE `historico` DISABLE KEYS */;
INSERT INTO `historico` (`ID_revisao`, `PK_impressora`, `PK_Local`, `PK_Status`, `Descricao`, `Data`) VALUES (1,1,18,5,'Manutenção inviável','2020-07-15 17:17:35'),(2,2,20,5,'Manutenção inviável','2020-07-15 17:18:32'),(3,3,19,5,'Manutenção inviável','2020-07-15 17:28:04'),(6,5,20,5,'Manutenção inviável','2020-07-15 17:37:01'),(7,6,7,5,'Manutenção inviável','2020-07-15 17:43:52'),(8,7,15,5,'Manutenção inviável','2020-07-15 17:45:25'),(9,8,1,5,'Falta de Suprimento','2020-07-15 17:46:31'),(10,9,19,5,'Falta de suprimento','2020-07-15 17:48:32'),(11,10,15,5,'Falta de Suprimento','2020-07-15 17:49:50'),(12,11,19,5,'Falta de Suprimento','2020-07-15 17:52:03'),(13,12,9,5,'Manutenção inviável','2020-07-15 18:07:52'),(14,13,18,5,'Manutenção inviável','2020-07-15 18:10:53'),(15,14,6,5,'Substituída','2020-07-15 18:16:01'),(16,15,19,5,'Falta de Suprimento','2020-07-15 18:17:07'),(17,16,1,5,'Falta de Suprimento','2020-07-15 18:24:11'),(18,17,12,5,'Manutenção inviável','2020-07-15 18:25:09'),(19,18,7,5,'Manutenção inviável','2020-07-15 18:25:54'),(20,19,3,5,'Manutenção inviável','2020-07-15 18:26:52'),(21,20,23,5,'Manutenção inviável','2020-07-15 18:28:47'),(22,21,9,5,'Manutenção inviável','2020-07-15 18:29:31'),(23,22,14,5,'Manutenção inviável','2020-07-15 18:30:25'),(24,23,5,5,'Manutenção inviável','2020-07-15 18:31:05'),(25,24,9,5,'Manutenção inviável','2020-07-15 18:32:07'),(26,25,19,5,'Manutenção inviável','2020-07-15 18:33:57'),(27,31,7,3,'Impressora funcionando normalmente','2020-07-15 18:40:03'),(28,32,24,3,'Impressora funcionando normalmente\r\n','2020-07-15 18:42:41'),(29,33,15,3,'Impressora funcionando normalmente','2020-07-15 18:45:02'),(30,34,20,3,'Impressora funcionando normalmente','2020-07-15 18:46:08'),(31,35,14,3,'Impressora funcionando normalmente','2020-07-15 18:47:02'),(32,36,25,3,'Impressora funcionando normalmente','2020-07-15 18:48:27'),(33,37,23,3,'Impressora funcionando normalmente','2020-07-15 18:49:23'),(34,38,13,3,'Impressora funcionando corretamente','2020-07-15 19:26:29'),(35,39,26,3,'Impressora funcionando normalmente','2020-07-15 19:28:35'),(36,40,27,3,'Impressora funcionando normalmente','2020-07-15 19:31:11'),(37,41,28,3,'Impressora funcionando corretamente','2020-07-15 19:33:15'),(38,42,18,3,'Impressora funcionando corretamente','2020-07-15 19:35:50'),(39,43,6,3,'Impressora funcionando normalmente','2020-07-15 19:40:24'),(40,44,23,3,'Impressora funcionando normalmente','2020-07-15 19:42:23'),(41,45,14,3,'Impressora funcionando normalmente','2020-07-15 19:43:08'),(42,46,22,3,'Impressora funcionando normalmente','2020-07-15 19:44:14'),(43,47,10,3,'Impressora funcionando normalmente','2020-07-15 19:45:11'),(44,48,12,3,'Impressora funcionando normalmente','2020-07-15 19:46:25'),(45,49,7,3,'Impressora funcionando normalmente','2020-07-15 19:47:11'),(46,50,5,3,'Impressora funcionando normalmente','2020-07-15 19:48:00'),(47,51,9,3,'Impressora funcionando normalmente','2020-07-15 19:49:04'),(48,52,23,3,'Impressora funcionando normalmente','2020-07-15 19:57:40'),(49,53,7,3,'Impressora funcionando normalmente','2020-07-15 19:59:35'),(50,54,14,4,'Impressora de reserva','2020-07-15 20:02:04'),(51,55,5,1,'Impressora em manutenção','2020-07-15 20:03:17'),(52,56,29,4,'Impressora em reserva','2020-07-15 20:06:18'),(53,57,13,3,'Impressora funcionando normalmente','2020-07-15 20:11:06'),(54,58,7,3,'Impressora funcionando normalmente','2020-07-15 20:12:55'),(55,59,7,3,'Impressora funcionando normalmente','2020-07-15 20:14:25'),(56,60,7,1,'Impressora em manutenção','2020-07-15 20:19:08'),(57,61,1,3,'Impressora funcionando corretamente','2020-07-15 20:20:06'),(58,62,7,3,'Impressora funcionando corretamente','2020-07-15 20:20:52'),(59,63,18,1,'impressora em manutenção','2020-07-15 20:22:12'),(60,64,29,4,'Impressora em reserva','2020-07-15 20:23:03'),(61,65,29,4,'Impressora em reserva','2020-07-15 20:24:00'),(62,66,21,4,'Impressora em reserva','2020-07-15 20:25:03'),(63,67,20,3,'Impressora funcionando normalmente','2020-07-15 20:25:56'),(64,68,29,4,'Impressora em reserva','2020-07-15 20:26:45'),(65,69,21,4,'Impressora em reserva','2020-07-15 20:27:38'),(66,70,29,4,'Impressora em reserva','2020-07-15 20:28:48'),(67,71,25,4,'Impressora em reserva','2020-07-15 20:30:27'),(68,72,23,4,'Impressora em reserva','2020-07-15 20:31:17'),(69,73,25,4,'Impressora em reserva','2020-07-15 20:32:42'),(70,74,14,4,'impressora em reserva','2020-07-15 20:33:56'),(71,75,23,4,'Impressora em reserva','2020-07-15 20:35:11'),(72,76,11,2,'Impressora em manutenção','2020-07-15 20:37:45'),(73,77,5,4,'Impressora em reserva','2020-07-15 20:38:47'),(74,78,23,1,'impressora em manutenção','2020-07-15 20:42:28'),(75,79,23,1,'Impressora em manutenção','2020-07-15 20:43:57'),(76,80,11,1,'Impressora em manutenção','2020-07-15 20:45:02'),(77,81,26,1,'Impressora em manutenção','2020-07-15 20:45:49'),(78,82,14,1,'Impressora em manutenção','2020-07-15 20:46:37'),(79,83,9,4,'Impressora em reserva','2020-07-15 20:47:40'),(80,84,24,4,'Impressora em reserva','2020-07-15 20:48:46'),(81,85,15,3,'Impressora funcionando normalmente','2020-07-15 20:49:23'),(82,86,24,3,'Impressora funcionando normalmente','2020-07-15 20:52:01'),(83,87,30,3,'Impressora funcionando normalmente','2020-07-15 20:53:14'),(84,88,29,4,'Impressora de reserva','2020-07-15 20:54:21'),(85,89,12,3,'Impressora funcionando normalmente','2020-07-15 20:55:09'),(86,90,20,3,'Impressora funcionando normalmente','2020-07-15 20:56:01'),(87,91,11,3,'Impressora funcionando normalmente','2020-07-15 20:56:59'),(88,92,9,1,'Impressora em manutenção','2020-07-15 20:58:38'),(89,93,8,1,'Impressora em manutenção','2020-07-15 20:59:46'),(90,94,8,3,'impressora funcionando normalmente','2020-07-15 21:00:30'),(91,95,7,3,'Impressora funcionando normalmente','2020-07-15 21:01:32'),(92,96,6,4,'Impressora em reserva','2020-07-15 21:02:24'),(93,97,3,1,'Em manutenção','2020-07-15 21:03:23'),(94,98,3,1,'Em manutenção','2020-07-15 21:04:16'),(95,99,4,1,'Em manutenção','2020-07-15 21:05:06'),(96,100,4,1,'Em manutenção','2020-07-15 21:06:04'),(97,101,23,1,'Em manutenção\r\n','2020-07-15 21:06:51'),(98,102,28,4,'Em reserva','2020-07-15 21:07:41'),(99,103,4,1,'Em manutenção','2020-07-15 21:08:24'),(100,104,4,1,'Em manutenção','2020-07-15 21:09:00'),(101,105,4,1,'Em manutenção','2020-07-15 21:09:42'),(102,106,3,4,'Reserva','2020-07-15 21:10:28'),(103,107,3,1,'Em manutenção','2020-07-15 21:11:19'),(104,108,3,1,'Em manutenção','2020-07-15 21:11:58'),(105,109,23,1,'Em manutenção','2020-07-15 21:12:49'),(106,110,3,4,'Em reserva','2020-07-15 21:13:28'),(107,111,5,1,'Manutenção','2020-07-15 21:14:27'),(108,112,4,1,'Em manutenção\r\n','2020-07-15 21:15:13'),(109,113,3,1,'Manutenção','2020-07-15 21:15:47'),(110,114,1,3,'Funcionando normalmente','2020-07-15 21:16:38'),(111,115,2,4,'Reserva','2020-07-15 21:17:20');
/*!40000 ALTER TABLE `historico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `impressoras`
--

DROP TABLE IF EXISTS `impressoras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `impressoras` (
  `ID_Impressora` int(11) NOT NULL AUTO_INCREMENT,
  `Serial` varchar(44) NOT NULL,
  `PK_Marca` int(11) NOT NULL,
  `Modelo` varchar(255) NOT NULL,
  `PK_Tipo` int(11) NOT NULL,
  `PK_Empresa` int(11) NOT NULL,
  PRIMARY KEY (`ID_Impressora`),
  KEY `PK_Marca` (`PK_Marca`),
  KEY `PK_Empresa` (`PK_Empresa`),
  CONSTRAINT `PK_Empresa` FOREIGN KEY (`PK_Empresa`) REFERENCES `empresa` (`ID_Empresa`),
  CONSTRAINT `PK_Marca` FOREIGN KEY (`PK_Marca`) REFERENCES `marca` (`ID_Marca`)
) ENGINE=InnoDB AUTO_INCREMENT=116 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `impressoras`
--

LOCK TABLES `impressoras` WRITE;
/*!40000 ALTER TABLE `impressoras` DISABLE KEYS */;
INSERT INTO `impressoras` (`ID_Impressora`, `Serial`, `PK_Marca`, `Modelo`, `PK_Tipo`, `PK_Empresa`) VALUES (1,'KNWY005173',4,'Stylus TX400',3,1),(2,'JSNY007767',4,'Stylus C87 Plus',3,1),(3,'U6227OHOJ491637',6,'DCP-8085DN',3,1),(5,'BRCSGCL045',3,'LaserJet P3015',5,1),(6,'BRBHB9J75C',3,'LaserJet P3015',5,1),(7,'BRCSG3D059',3,'LaserJet P3015',5,1),(8,'MJHY006275',4,'Stylus TX525FW',3,1),(9,'MJHY003544',4,'Stylus TX525FW',3,1),(10,'MJHY006274',4,'Stylus TX525FW',3,1),(11,'JSPK002689',4,'Stylus Photo R270',3,1),(12,'K4ZY004363',4,'Stylus CX8300',3,1),(13,' K4ZY015235',4,'Stylus CX8300',3,1),(14,'CN17I1M0N6',3,'DeskJet 845c',6,1),(15,'MJHY003541',4,'Stylus TX525FW',3,1),(16,'MJHY003548',4,'Stylus TX525FW',3,1),(17,'BRCSH8F003',3,'LaserJet P3015',5,1),(18,'BRGSH571G1',3,'LaserJet Color MFP M177fw',3,1),(19,'A34M089694',4,'FX-2180',1,1),(20,'BRCSH8F001',3,'LaserJet P3015',5,1),(21,'Q2JK027221',4,'L-200',3,1),(22,'BRBS8CT00B',3,'LaserJet P1505n',5,1),(23,'Z4XCBDAZ601436R',5,'SCX-4623F',3,1),(24,'Q2JK014146',4,'L-200',3,1),(25,'BRHS69F09R',3,'LJ-1320',5,1),(26,'HRP13818',1,'ImageRUNNER ADVANCE 4035',3,3),(27,'HRP04856',1,'ImageRUNNER ADVANCE 4035',3,3),(28,'HRP08478',1,'ImageRUNNER ADVANCE 4035',3,3),(29,'HRP06658',1,'ImageRUNNER ADVANCE 4035',3,3),(30,'HRN06227',1,'ImageRUNNER ADVANCE 4035',3,3),(31,'701544LM0FDDP',2,'XM1140',3,2),(32,'701544LM0FDB8',2,'XM1140',3,2),(33,'701544LM0FDCB',2,'XM1140',3,3),(34,'701544LM0FD95',2,'XM1140',3,2),(35,'451431LM0DT3X',2,'MS410DN',5,2),(36,'451431LM0DT3V',2,'MS410DN',5,2),(37,'451431LM0DT40',2,'MS410DN',5,2),(38,'701544LM0FDDP',2,'XM1140',3,2),(39,'701544LM0FD8K',2,'XM1140',3,2),(40,'701544LM0FDCL',2,'XM1140',3,2),(41,'701544LM0FDBT',2,'XM1140',3,2),(42,'701544LM0FDD7',2,'XM1140',3,2),(43,'701544LM0FDC0',2,'XM1140',3,2),(44,'701544LM0FDKT',2,'XM1140',3,2),(45,'701544LM0FDB4',2,'XM1140',3,2),(46,'701544LM0FDBG',2,'XM1140',3,2),(47,'701544LM0FDDF',2,'XM1140',3,2),(48,'701544LM0FDK0',2,'XM1140',3,2),(49,'701544LM0FDGX',2,'XM1140',3,2),(50,'701544LM0FDB2',2,'XM1140',3,2),(51,'701544LM0FDCL',2,'XM1140',3,2),(52,'52J185200656',7,'Zebra ZTC ZT230',4,1),(53,'U63480F8J920296',6,'Brother MFC-9330-CDW',3,1),(54,'CNBB388400',3,'LaserJet 1300',5,1),(55,'8P99BDAZ201466M',5,'SCX-4521F',3,1),(56,'U64198A6N136719',6,'DCP-L5652DN',3,1),(57,'X2P2027202',4,'L495',3,1),(58,'X2P2024307',4,'L495',3,1),(59,'X2P2017359',4,'L495',3,1),(60,'X2P2022582',4,'L495',3,1),(61,'X2P2027206',4,'L495',3,1),(62,'X2P2027201',4,'L495',3,1),(63,'KLGK023498',4,'Stylus TX200',3,1),(64,'Z4XCBDAZ601512F',5,'SCX-4623F',3,1),(65,'8P99BDAZ201764Y',5,'SCX-4521F',3,1),(66,'44CE001062',4,'Ribbions 8750',1,1),(67,'U62662C2f121707',6,'MFC-J6510DW',3,1),(68,'U63268D4N718254',6,'MFC-8952DW',3,1),(69,'44B1120297',4,'LX-810',1,1),(70,'1Q5E095229',4,'LX-300',1,1),(71,'BRCSH8F003',3,'LaserJet P3015',5,1),(72,'BRBFCD255D',3,'LaserJet P2055dn',5,1),(73,'BRBH9BG57B',3,'LaserJet P2055dn',5,1),(74,'BRBFCBN595',3,'LaserJet P2055dn',5,1),(75,'BRBFCD45MW',3,'LaserJet P2055dn',5,1),(76,'BRBFC9056K',3,'LaserJet P2055dn',5,1),(77,'BRBHC2200V',3,'LaserJet P2035n',5,1),(78,'BRCS82F01Y',3,'LaserJet P2015dn',5,1),(79,'BRCS84L0J3',3,'LaserJet P2015dn',5,1),(80,'BRBS76Q0NQ',3,'LaserJet P2015dn',5,1),(81,'CNB9R02421',3,'LaserJet P2015dn',5,1),(82,'BRCS8280BC',3,'LaserJet P2015',5,1),(83,'BRBSD9MHK5',3,'Laserjet P1102w',5,1),(84,'BRAS85K066',3,'LaserJet Color CP1515n',5,1),(85,'BRAS85K07S',3,'LaserJet Color CP1515n',5,1),(86,'BRCS8BB08P',3,'LaserJet Color CP1515n',5,1),(87,'CNLJ217232',3,'LaserJet 1320',5,1),(88,'BRHS67P02R',3,'LaserJet 1320',5,1),(89,'TZYM361366',4,'L-355',3,1),(90,'TZYM312260',4,'L-355',3,1),(91,'Q2JK044022',4,'L-200',3,1),(92,'Q2JK036346',4,'L-200',3,1),(93,'Q2JK014160',4,'L-200',3,1),(94,'Q2JK036325',4,'L-200',3,1),(95,'FCSM065625',4,'FX-890',1,1),(96,'FCSM065809',4,'FX-890',1,1),(97,'FCUM036131',4,'FX-2190',1,1),(98,'FCTY047487',4,'FX-2190',1,1),(99,'FCUM068485',4,'FX-2190',1,1),(100,'FCUM032467',4,'FX-2190',1,1),(101,'FCUM058031',4,'FX-2190',1,1),(102,'FCUM052650',4,'FX-2190',1,1),(103,'FCUM017714',4,'FX-2190',1,1),(104,'FCUM044307',4,'FX-2190',1,1),(105,'FCUM044310',4,'FX-2190',1,1),(106,'FCUM017571',4,'FX-2190',1,1),(107,'FCUM072596',4,'FX-2190',1,1),(108,'FCUM049975',4,'FX-2190',1,1),(109,'FCUM065222',4,'FX-2190',1,1),(110,'FCTY031559',4,'FX-2190',1,1),(111,'FCUM049341',4,'FX-2190',1,1),(112,'FCUM049977',4,'FX-2190',1,1),(113,'FCUY000774',4,'FX-2190',1,1),(114,'CN4785M091',4,'DesingJet T520',2,1),(115,'Z98LBQBCA00167Y',5,'CLX-3305W',3,1);
/*!40000 ALTER TABLE `impressoras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `local`
--

DROP TABLE IF EXISTS `local`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `local` (
  `ID_Local` int(11) NOT NULL AUTO_INCREMENT,
  `Local` varchar(255) NOT NULL,
  PRIMARY KEY (`ID_Local`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `local`
--

LOCK TABLES `local` WRITE;
/*!40000 ALTER TABLE `local` DISABLE KEYS */;
INSERT INTO `local` (`ID_Local`, `Local`) VALUES (1,'Dp.Técnico'),(2,'Expedição M1&2'),(3,'Zé Maria'),(4,'Rebobinadeira M4'),(5,'Alcatrazes'),(6,'Sala ISO / M4'),(7,'Financeiro'),(8,'Elétrica'),(9,'Seguranca'),(10,'Sala produção'),(11,'Mecânica'),(12,'Laboratório / Analista'),(13,'Contabilidade'),(14,'Máquina 1 e 2'),(15,'Comercial'),(16,'Luciana'),(17,'Sala Marcos'),(18,'Aparas'),(19,'Administrativo'),(20,'RH'),(21,'Balança / Portaria'),(22,'CPD'),(23,'Máquina 3'),(24,'Custos'),(25,'Máquina 4'),(26,'Faturamento'),(27,'Almoxarifado'),(28,'Compras'),(29,'Reserva'),(30,'Tratamento de Efluentes');
/*!40000 ALTER TABLE `local` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marca`
--

DROP TABLE IF EXISTS `marca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `marca` (
  `ID_Marca` int(11) NOT NULL AUTO_INCREMENT,
  `Marca` varchar(255) NOT NULL,
  PRIMARY KEY (`ID_Marca`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marca`
--

LOCK TABLES `marca` WRITE;
/*!40000 ALTER TABLE `marca` DISABLE KEYS */;
INSERT INTO `marca` (`ID_Marca`, `Marca`) VALUES (1,'Canon'),(2,'Lexmark'),(3,'HP'),(4,'Epson'),(5,'Samsung'),(6,'Brother'),(7,'Zebra');
/*!40000 ALTER TABLE `marca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status`
--

DROP TABLE IF EXISTS `status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `status` (
  `ID_Status` int(11) NOT NULL AUTO_INCREMENT,
  `Status` varchar(255) NOT NULL,
  PRIMARY KEY (`ID_Status`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status`
--

LOCK TABLES `status` WRITE;
/*!40000 ALTER TABLE `status` DISABLE KEYS */;
INSERT INTO `status` (`ID_Status`, `Status`) VALUES (1,'Teldata'),(2,'Manutenção'),(3,'Funcionamento'),(4,'Reserva'),(5,'Descontinuada');
/*!40000 ALTER TABLE `status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo`
--

DROP TABLE IF EXISTS `tipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo` (
  `ID_Tipo` int(11) NOT NULL AUTO_INCREMENT,
  `Tipo` varchar(255) NOT NULL,
  PRIMARY KEY (`ID_Tipo`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo`
--

LOCK TABLES `tipo` WRITE;
/*!40000 ALTER TABLE `tipo` DISABLE KEYS */;
INSERT INTO `tipo` (`ID_Tipo`, `Tipo`) VALUES (1,'Matricial'),(2,'Plotter'),(3,'Multifuncional'),(4,'Térmica'),(5,'Laserjet'),(6,'Deskjet');
/*!40000 ALTER TABLE `tipo` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-07-15 21:25:19
