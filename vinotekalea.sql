-- MySQL dump 10.13  Distrib 5.6.19, for debian-linux-gnu (x86_64)
--
-- Host: 127.0.0.1    Database: vinoteka
-- ------------------------------------------------------
-- Server version	5.6.19-0ubuntu0.14.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `barva`
--

DROP TABLE IF EXISTS `barva`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `barva` (
  `idBarva` int(11) NOT NULL AUTO_INCREMENT,
  `barva` varchar(6) DEFAULT '0',
  PRIMARY KEY (`idBarva`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `barva`
--

LOCK TABLES `barva` WRITE;
/*!40000 ALTER TABLE `barva` DISABLE KEYS */;
INSERT INTO `barva` VALUES (1,'Belo'),(2,'Rdeče'),(3,'Rosé'),(4,'Črnina');
/*!40000 ALTER TABLE `barva` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cenik`
--

DROP TABLE IF EXISTS `cenik`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cenik` (
  `idCenik` int(11) NOT NULL AUTO_INCREMENT,
  `razpon_cene` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idCenik`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cenik`
--

LOCK TABLES `cenik` WRITE;
/*!40000 ALTER TABLE `cenik` DISABLE KEYS */;
INSERT INTO `cenik` VALUES (1,'pod 3'),(2,'3 - 6'),(3,'6 - 12'),(4,'12 - 25'),(5,'25 - 50'),(6,'nad 50€');
/*!40000 ALTER TABLE `cenik` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kakovost`
--

DROP TABLE IF EXISTS `kakovost`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kakovost` (
  `idKakovost` int(11) NOT NULL AUTO_INCREMENT,
  `kategorija` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idKakovost`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='Kakovostna kategorija vina';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kakovost`
--

LOCK TABLES `kakovost` WRITE;
/*!40000 ALTER TABLE `kakovost` DISABLE KEYS */;
INSERT INTO `kakovost` VALUES (1,'Namizna vina'),(2,'Deželna vina'),(3,'Kakovostna vina'),(4,'Vrhunska vina');
/*!40000 ALTER TABLE `kakovost` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `klient`
--

DROP TABLE IF EXISTS `klient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `klient` (
  `idKlient` int(11) NOT NULL AUTO_INCREMENT,
  `ime` varchar(120) CHARACTER SET utf8 DEFAULT NULL,
  `priimek` varchar(120) CHARACTER SET utf8 DEFAULT NULL,
  `spol` tinyint(1) DEFAULT NULL COMMENT '0 - moški\n1 - ženski\ndefault = NULL',
  `naslov` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  `posta` varchar(120) CHARACTER SET utf8 DEFAULT NULL,
  `postnaStevilka` varchar(6) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`idKlient`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8 COLLATE=utf8_slovenian_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `klient`
--

LOCK TABLES `klient` WRITE;
/*!40000 ALTER TABLE `klient` DISABLE KEYS */;
INSERT INTO `klient` VALUES (16,'Lea','Nemec',1,'Korenčkova ulica 007','Novo Mesto','8000'),(42,'Janez','Novak',0,'Super Mario ulica 10','Novo Mesto','8000'),(46,'Nina','Medved',1,'Ulica smrkcev 99','Novo Mesto','8000'),(51,'Anton','Rozman',0,'Rozetova 134','Ljubljana','1000'),(52,'Marija','Novak',1,'HelloKitty street 44','Maribor','2000'),(53,'Andrej','Dobrovoljc',0,'Ulica talcev 3','Novo Mesto','8000');
/*!40000 ALTER TABLE `klient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `komunikacija`
--

DROP TABLE IF EXISTS `komunikacija`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `komunikacija` (
  `idKomunikacija` int(11) NOT NULL AUTO_INCREMENT,
  `id_KomunikacijskiTipi` int(11) DEFAULT NULL,
  `id_Vinar` int(11) DEFAULT NULL,
  `podatki` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idKomunikacija`),
  KEY `fk_Komunikacija_KomunikacijskiTipi1_idx` (`id_KomunikacijskiTipi`),
  KEY `fk_Komunikacija_Vinar1_idx` (`id_Vinar`),
  CONSTRAINT `fk_Komunikacija_KomunikacijskiTipi1` FOREIGN KEY (`id_KomunikacijskiTipi`) REFERENCES `komunikacijskitipi` (`idKomunikacijskiTipi`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Komunikacija_Vinar1` FOREIGN KEY (`id_Vinar`) REFERENCES `vinar` (`idVinar`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=116 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `komunikacija`
--

LOCK TABLES `komunikacija` WRITE;
/*!40000 ALTER TABLE `komunikacija` DISABLE KEYS */;
INSERT INTO `komunikacija` VALUES (1,3,1,'www.montemoro.si'),(2,1,1,'056259170'),(3,3,2,'www.vino-cerne.si'),(4,1,2,'056527033'),(5,2,2,'031282069'),(6,3,3,'www.razman.si'),(7,1,3,'056572003'),(8,1,4,'056550417'),(9,3,5,'www.ferdinand.si'),(10,1,5,'053034600'),(11,1,6,'053959220'),(12,3,7,'www.rejevino.com'),(13,1,7,'053041258'),(14,1,8,'057640539'),(15,1,9,'053645735'),(16,3,10,'www.scurek.com'),(17,1,10,'053045021'),(18,3,11,'www.silveri.si'),(19,1,11,'053959400'),(20,1,12,'053041230'),(21,2,12,'041773805'),(22,1,13,'053045406'),(23,2,13,'031578140'),(24,1,14,'053043646'),(25,3,15,'www.kmetijastekar.si'),(26,1,15,'053046210'),(27,3,16,'www.reia.si'),(28,1,16,'053959136'),(29,2,16,'031632230'),(30,3,17,'www.edisimcic.si'),(31,1,17,'053959173'),(32,2,17,'030602564'),(33,1,18,'053959212'),(34,1,18,'053045437'),(35,1,19,'053042594'),(36,3,20,'www.vinasaksida.com'),(37,2,20,'041208345'),(38,1,21,'057640327'),(39,3,22,'www.persolja.com'),(40,1,22,'053043726'),(41,1,23,'053645751'),(42,3,24,'www.carga.si'),(43,1,24,'053042500'),(44,1,24,'053959496'),(45,3,25,'www.klet-brda.si'),(46,1,25,'053310100'),(47,3,26,'www.rokovi-vinogradi.com'),(48,1,26,'053045742'),(49,3,27,'www.stekar.si'),(50,1,27,'053046540'),(51,2,28,'041775120'),(52,3,28,'www.pulec.com'),(53,3,29,'www.sibav-vina.si'),(54,1,29,'053045062'),(55,1,30,'057641776'),(56,1,31,'057690077'),(57,4,1,'vina@montemoro.si'),(58,4,2,'info@vino-cerne.si'),(59,4,3,'info@razman.si'),(60,4,5,'info@ferdinand.si'),(61,5,5,'053042601'),(62,2,6,'041773721'),(63,3,6,'www.dobuje.com'),(64,4,6,'info@dobuje.com'),(65,4,7,'reja_borut@yahoo.it'),(66,2,8,'031829909'),(67,4,8,'jadran.petelin@gmail.com'),(68,2,9,'031861054'),(69,2,9,'041698556'),(70,3,9,'www.vino-zorz.si'),(71,4,9,'vino.zorz@siol.net'),(72,2,10,'041625842'),(73,4,10,'scurek.stojan@siol.net'),(74,4,14,'princic.damjan@gmail.com'),(75,2,15,'041444766'),(76,4,15,'info@kmetijastekar.si'),(77,4,16,'vino@reia.si'),(78,4,17,'info@edisimcic.si'),(79,5,19,'053042594'),(80,2,19,'031629328'),(81,2,19,'041506581'),(82,3,19,'www.zalatel.si'),(83,4,19,'valter.zalatel@zalatel.si'),(84,2,20,'051444850'),(85,1,20,'053017853'),(86,5,20,'052017854'),(87,4,20,'info@vinasaksida.com'),(88,2,21,'041667125'),(89,2,21,'031361823'),(90,3,21,'www.stoka.si'),(91,4,21,'vinastoka@gmail.com'),(92,2,22,'041705271'),(93,2,22,'031873515'),(94,4,22,'info@persolja.com'),(95,5,22,'053043727'),(96,2,23,'041653595'),(97,4,23,'janja.rondic@siol.net'),(98,2,24,'041692292'),(99,4,24,'info@carga.si'),(100,5,24,'053959497'),(101,4,25,'info@klet-brda.si'),(102,5,25,'053310109'),(103,2,26,'040464828'),(104,4,26,'info@rokovi-vinogradi.com'),(105,2,27,'041413083'),(106,4,27,'hisastekar@siol.net'),(107,5,27,'053046541'),(108,4,28,'info@pulec.com'),(109,2,29,'041588579'),(110,4,29,'info@sibav-vina.si'),(111,5,29,'053045062'),(112,2,30,'031953967'),(113,4,30,'petelin.rogelja@siol.net'),(114,2,31,'041372041'),(115,4,31,'vina.uhelj@hotmail.com');
/*!40000 ALTER TABLE `komunikacija` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `komunikacijskitipi`
--

DROP TABLE IF EXISTS `komunikacijskitipi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `komunikacijskitipi` (
  `idKomunikacijskiTipi` int(11) NOT NULL AUTO_INCREMENT,
  `ime` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idKomunikacijskiTipi`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `komunikacijskitipi`
--

LOCK TABLES `komunikacijskitipi` WRITE;
/*!40000 ALTER TABLE `komunikacijskitipi` DISABLE KEYS */;
INSERT INTO `komunikacijskitipi` VALUES (1,'Telefon'),(2,'Mobitel'),(3,'Spletna stran'),(4,'E-mail'),(5,'Fax'),(6,'Facebook'),(7,'Twitter');
/*!40000 ALTER TABLE `komunikacijskitipi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lokacija`
--

DROP TABLE IF EXISTS `lokacija`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lokacija` (
  `idLokacija` int(11) NOT NULL AUTO_INCREMENT,
  `prostor` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idLokacija`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Lokacija vinoteke';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lokacija`
--

LOCK TABLES `lokacija` WRITE;
/*!40000 ALTER TABLE `lokacija` DISABLE KEYS */;
INSERT INTO `lokacija` VALUES (1,'Vinoteka'),(2,'Klet 1'),(3,'Klet 2');
/*!40000 ALTER TABLE `lokacija` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `narocilo`
--

DROP TABLE IF EXISTS `narocilo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `narocilo` (
  `idNarocilo` int(11) NOT NULL AUTO_INCREMENT,
  `stRacuna` int(11) NOT NULL,
  `stArtiklov` int(11) NOT NULL,
  `skupaj` decimal(10,2) NOT NULL DEFAULT '0.00',
  `datumNarocila` date DEFAULT NULL,
  `datumPlacila` date DEFAULT NULL,
  `skupajPlacano` decimal(10,2) NOT NULL DEFAULT '0.00',
  `idKlient` int(11) NOT NULL,
  PRIMARY KEY (`idNarocilo`),
  KEY `fk_Narocilo_VinoArtikel1_idx` (`stArtiklov`),
  KEY `fk_narocilo_klient1_idx` (`idKlient`),
  CONSTRAINT `fk_narocilo_klient1` FOREIGN KEY (`idKlient`) REFERENCES `klient` (`idKlient`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Narocilo_VinoArtikel1` FOREIGN KEY (`stArtiklov`) REFERENCES `vinoartikel` (`idArtikel`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `narocilo`
--

LOCK TABLES `narocilo` WRITE;
/*!40000 ALTER TABLE `narocilo` DISABLE KEYS */;
INSERT INTO `narocilo` VALUES (17,1000,2,99.98,'2015-06-04',NULL,0.00,16),(18,1017,3,149.98,'2015-06-04',NULL,0.00,16),(19,1018,4,154.97,'2015-06-04',NULL,0.00,16),(20,1019,1,48.99,'2015-06-04',NULL,0.00,42),(21,1020,10,79.90,'2015-06-04',NULL,0.00,42),(22,1021,1,49.99,'2015-06-04',NULL,0.00,46),(23,1022,4,20.00,'2015-06-04',NULL,0.00,46),(24,1023,10,140.42,'2015-06-04',NULL,0.00,46);
/*!40000 ALTER TABLE `narocilo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `predmetinarocila`
--

DROP TABLE IF EXISTS `predmetinarocila`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `predmetinarocila` (
  `idpredmetinarocila` int(11) NOT NULL AUTO_INCREMENT,
  `kolicina` int(11) NOT NULL DEFAULT '0',
  `cena` decimal(10,2) NOT NULL DEFAULT '0.00',
  `skupaj` decimal(10,2) NOT NULL DEFAULT '0.00',
  `popust` decimal(10,2) NOT NULL DEFAULT '0.00',
  `idKlient` int(11) NOT NULL,
  `idNarocilo` int(11) NOT NULL,
  `idArtikel` int(11) NOT NULL,
  PRIMARY KEY (`idpredmetinarocila`),
  KEY `fk_predmetinarocila_klient1_idx` (`idKlient`),
  KEY `fk_predmetinarocila_narocilo1_idx` (`idNarocilo`),
  KEY `fk_predmetinarocila_vinoartikel1_idx` (`idArtikel`),
  CONSTRAINT `fk_predmetinarocila_klient1` FOREIGN KEY (`idKlient`) REFERENCES `klient` (`idKlient`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_predmetinarocila_narocilo1` FOREIGN KEY (`idNarocilo`) REFERENCES `narocilo` (`idNarocilo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_predmetinarocila_vinoartikel1` FOREIGN KEY (`idArtikel`) REFERENCES `vinoartikel` (`idArtikel`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `predmetinarocila`
--

LOCK TABLES `predmetinarocila` WRITE;
/*!40000 ALTER TABLE `predmetinarocila` DISABLE KEYS */;
INSERT INTO `predmetinarocila` VALUES (27,2,49.99,99.98,0.00,16,17,64),(28,2,49.99,99.98,0.00,16,18,64),(29,1,50.00,50.00,0.00,16,18,101),(30,2,49.99,99.98,0.00,16,19,64),(31,1,50.00,50.00,0.00,16,19,101),(32,1,4.99,4.99,0.00,16,19,54),(33,1,48.99,48.99,0.00,42,20,73),(34,10,7.99,79.90,0.00,42,21,93),(35,1,49.99,49.99,0.00,46,22,90),(36,4,5.00,20.00,0.00,46,23,4),(37,1,5.99,5.99,0.00,46,24,28),(38,1,4.99,4.99,0.00,46,24,122),(39,6,4.99,29.94,0.00,46,24,122),(40,2,49.75,99.50,0.00,46,24,98);
/*!40000 ALTER TABLE `predmetinarocila` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pridelava`
--

DROP TABLE IF EXISTS `pridelava`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pridelava` (
  `idPrid` int(11) NOT NULL AUTO_INCREMENT,
  `nacin_pridelave` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idPrid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Način pridelave\n';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pridelava`
--

LOCK TABLES `pridelava` WRITE;
/*!40000 ALTER TABLE `pridelava` DISABLE KEYS */;
INSERT INTO `pridelava` VALUES (1,'Konvencionalno vinogradništvo'),(2,'Integrirano vinogradništvo'),(3,'Ekološko vinogradništvo');
/*!40000 ALTER TABLE `pridelava` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sladkor`
--

DROP TABLE IF EXISTS `sladkor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sladkor` (
  `idSladkor` int(11) NOT NULL AUTO_INCREMENT,
  `stopnja` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idSladkor`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='Sladkorna stopnja\n';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sladkor`
--

LOCK TABLES `sladkor` WRITE;
/*!40000 ALTER TABLE `sladkor` DISABLE KEYS */;
INSERT INTO `sladkor` VALUES (1,'Zelo suha vina'),(2,'Suha vina'),(3,'Polsuha vina'),(4,'Polsladka vina'),(5,'Sladka vina');
/*!40000 ALTER TABLE `sladkor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sorta`
--

DROP TABLE IF EXISTS `sorta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sorta` (
  `idSorta` int(11) NOT NULL AUTO_INCREMENT,
  `sorta` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idSorta`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sorta`
--

LOCK TABLES `sorta` WRITE;
/*!40000 ALTER TABLE `sorta` DISABLE KEYS */;
INSERT INTO `sorta` VALUES (1,'Merlot'),(2,'Cabarnet Sauvignon 30%, Merlot 70%'),(3,'Merlot, Cabarnet'),(4,'Cabernet, Merlot, Teran'),(5,'Cabarnet Sauvignon'),(6,'Sivi Pinot'),(7,'Sauvignonasse'),(8,'Rebula'),(9,'Modri Pinot, Chardonnay'),(10,'Sauvignon'),(11,'Chardonnay'),(12,'Malvazija'),(13,'Beli Pinot'),(14,'60% Merlot, 40% Refošk'),(15,'Laški rizling'),(16,'Rebula 40%, Chardonnay 30%, Sivi Pinot 30%'),(17,'Cabarnet Sauvignon Barrique'),(18,'Refošk'),(19,'Merlot 90%, Cabarnet Sauvignon 10%'),(20,'Beli Pinot, Chardonnay, Sivi Pinot, Sauvignon'),(21,'Sauvignon Blanc'),(22,'Refošk (Teran)'),(23,'Zelen'),(24,'Pinela'),(25,'Rebula 60%, Pikolit 10%, Rumeni Muškat 30%'),(26,'Modri Pinot'),(27,'Pikolit'),(28,'Merlot 60%, Cabarnet 40%'),(29,'Rebula 60%, Pikolit 20%, Pika, Glera, Tržarka 20%'),(30,'Cabarnet Franc'),(31,'Merlot 30%, Cabarnet 20%, Cabarnet Sauvignon 20%, ...'),(32,'Merlot 85%, Cabarnet Sauvignon 15%'),(33,'Rebula, Chardonnay'),(34,'Zeleni Sauvignon'),(35,'Merlot, Cabarnet Sauvignon'),(36,'Chardonnay, Tolovaj, Malvazija, Sauvignon'),(37,'Rebula 70%, Chardonnay, Sauvignon'),(38,'Merlot 80%, Cabarnet Sauvignon 10%, Cabarnet Franc 10%'),(39,'Zeleni Sauvignon, Chardonnay'),(40,'Vitovska grganja, Malvazija, Chardonnay'),(41,'Vitovska grganja'),(42,'Merlot Barik'),(43,'Cabarnet Franc Barik'),(44,'Merlot 75%, Cabarnet Sauvignon 25%'),(45,'Rebula, Malvazija, Pikolit, Zelenka'),(46,'Merlot 34%, Cabarnet Sauvignon 33%, ...'),(47,'Rebula 66%, Chardonnay 34%'),(48,'Muškat, Verduc'),(49,'Tokaj 85%, Sivi Pinot 15%'),(50,'Chardonnay, Sauvignonasse, Rebula = zvrst konrad'),(51,'Rumeni muškat'),(52,'Teran PTP'),(53,'Teran'),(54,'N/A');
/*!40000 ALTER TABLE `sorta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trgatev`
--

DROP TABLE IF EXISTS `trgatev`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trgatev` (
  `idTrgatev` int(11) NOT NULL AUTO_INCREMENT,
  `cas_trgatve` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idTrgatev`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='Čas trgatve';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trgatev`
--

LOCK TABLES `trgatev` WRITE;
/*!40000 ALTER TABLE `trgatev` DISABLE KEYS */;
INSERT INTO `trgatev` VALUES (1,'Zgodnja'),(2,'Glavna'),(3,'Pozna'),(4,'Jagodni izbor'),(5,'Suhi jagodni izbor'),(6,'Ledena ali božična trgatev');
/*!40000 ALTER TABLE `trgatev` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uporabnik`
--

DROP TABLE IF EXISTS `uporabnik`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uporabnik` (
  `idUporabnik` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `password` varchar(254) NOT NULL,
  `email` varchar(254) NOT NULL,
  `idKlient` int(11) NOT NULL,
  `jeAdmin` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idUporabnik`),
  UNIQUE KEY `user_UNIQUE` (`username`),
  KEY `fk_uporabnik_klient1_idx` (`idKlient`),
  CONSTRAINT `fk_uporabnik_klient1` FOREIGN KEY (`idKlient`) REFERENCES `klient` (`idKlient`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uporabnik`
--

LOCK TABLES `uporabnik` WRITE;
/*!40000 ALTER TABLE `uporabnik` DISABLE KEYS */;
INSERT INTO `uporabnik` VALUES (12,'Lea','f837f5d157b4324f00cd8f6a336092e89a98b9a1c428eabc7c8deb198c2b18a4','lea@robots.si',16,1),(37,'Janez','c9d5e59c8a7ebffef5be58a32cf347ee8e7798f8df5137644d6df3f5a08eaff3','janez.novak@example.com',42,0),(41,'Nina','e851e3bd05b674c2120d16273c098d3f5f88d42ccb96b67e9e7432b9ab427dcc','nina.medved@example.com',46,0),(46,'Anton','fa7c9d6dd8505cd9a10259f712cf2bb8bab343e5f9fc67d650fcdf0652d2e08b','anton.rozman@example.com',51,0),(47,'Marija','23fae5165fc22c08cb510dce5ac9d37ec088473d0050c6063d9646d425fff677','marija.novak@example.com',52,0),(48,'AndrejD','960c91f9ca480fef0ee313affdb57b661a603632d9e9cfe61002639b95c5ffc0','andrej.dobrovoljc@example.com',53,1);
/*!40000 ALTER TABLE `uporabnik` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vinar`
--

DROP TABLE IF EXISTS `vinar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vinar` (
  `idVinar` int(11) NOT NULL AUTO_INCREMENT,
  `podjetje` varchar(255) DEFAULT NULL,
  `naslov` varchar(45) DEFAULT NULL,
  `posta` varchar(45) DEFAULT NULL,
  `postna_st` varchar(6) DEFAULT NULL,
  `nagrade` varchar(255) DEFAULT NULL,
  `id_VinOkolis` int(11) DEFAULT NULL,
  PRIMARY KEY (`idVinar`),
  KEY `fk_Vinar_VinorodniOkolis1_idx` (`id_VinOkolis`),
  CONSTRAINT `fk_Vinar_VinorodniOkolis1` FOREIGN KEY (`id_VinOkolis`) REFERENCES `vinorodniokolis` (`idVinOkolis`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vinar`
--

LOCK TABLES `vinar` WRITE;
/*!40000 ALTER TABLE `vinar` DISABLE KEYS */;
INSERT INTO `vinar` VALUES (1,'MonteMoro','Triban 7','Koper','6000','N/A',11),(2,'Vinogradništvo vinarstvo Černe','Ankaran Larisova 14','Ankaran','6280','N/A',11),(3,'Vinska klet Ražman','Gračišče 1','Gračišče','6272','N/A',11),(4,'Vinska klet Fabijo Jerman','Trsek 1a','Marezige','6273','N/A',11),(5,'Ferdinand','Kojsko 7','Kojsko','5211','N/A',4),(6,'Kmetija Dobuje','Snežeče 16','Dobrovo v Brdih','5212','N/A',4),(7,'Kmetija REJA','Kozana 90a','Dobrovo v Brdih','5212','N/A',4),(8,'Vinogradniška kmetija Petelin','Pliskovica 52','Dutovlje','6221','N/A',6),(9,'Vinska klet Žorž','Slap 13','Vipava','5271','N/A',14),(10,'Ščurek','Plešivo 44','Dobrovo v Brdih','5212','N/A',4),(11,'Posestvo Silveri','Neblo 1h','Dobrovo v Brdih','5212','N/A',4),(12,'REYA Maksimiljan','Kozana 7','Dobrovo v Brdih','5212','N/A',4),(13,'Vina Radoš','Drnovk 10','Dobrovo v Brdih','5212','N/A',4),(14,'Damjan Prinčič','Kozana 118a','Dobrovo v Brdih','5212','N/A',4),(15,'Kmetija Štekar 1672','Snežatno 31a','Kojsko','5211','N/A',4),(16,'Reia','Neblo 32','Dobrovo v Brdih','5212','N/A',4),(17,'Vinogradništvo in kletarstvo Simčič','Vipolže 39a','Dobrovo v Brdih','5212','N/A',4),(18,'Vinarstvo Drajčevi','Dobrovo Goriška cesta 26','Dobrovo v Brdih','5212','N/A',4),(19,'Zalatel Valter','Hruševlje 6','Dobrovo v Brdih','5212','N/A',4),(20,'Saksida since 1841','Zalošče 12a','Dornberk','5294','N/A',14),(21,'Vina Štoka','Krajna vas 32','Dutovlje','6221','N/A',6),(22,'Peršolja vina','Kozana 19','Dobrovo v Brdih','5212','N/A',4),(23,'Kmetija Rondič','Slap 48','Vipava','5271','N/A',14),(24,'Čarga 1767','Pristavo 2','Dobrovo v Brdih','5212','N/A',4),(25,'Vinska klet Goriška Brda','Dobrovo Zadružna 9','Dobrovo v Brdih','5212','N/A',4),(26,'Rokovi vinogradi','Biljana 42c','Dobrovo v Brdih','5212','N/A',4),(27,'Štekar vino in turizem','Snežatno 26a','Kojsko','5211','N/A',4),(28,'Vinarstvo Pulec','Plešivo 38a','Dobrovo v Brdih','5212','N/A',4),(29,'Vinarstvo Šibav Dušica','Fojana 15','Dobrovo v Brdih','5212','N/A',4),(30,'Vinogradništvo-vinarstvo Petelin-Rogelja','Tomaj 18','Dutovlje','6221','N/A',6),(31,'Vinarstvo Uhelj','Štanjel 119','Štanjel','6222','N/A',6);
/*!40000 ALTER TABLE `vinar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vinoartikel`
--

DROP TABLE IF EXISTS `vinoartikel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vinoartikel` (
  `idArtikel` int(11) NOT NULL AUTO_INCREMENT,
  `naziv` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `alkohol` decimal(10,2) DEFAULT NULL,
  `letnik` int(4) DEFAULT NULL,
  `zaloga` int(11) NOT NULL DEFAULT '0',
  `kolicina` decimal(10,3) DEFAULT NULL,
  `cena` decimal(10,2) DEFAULT '0.00',
  `poreklo` varchar(45) CHARACTER SET utf8 DEFAULT 'SLO',
  `imeslike` varchar(256) CHARACTER SET utf8 DEFAULT NULL,
  `id_Sladkor` int(11) DEFAULT NULL,
  `id_Cenik` int(11) DEFAULT NULL,
  `id_Trgatev` int(11) DEFAULT NULL,
  `id_Prid` int(11) DEFAULT NULL,
  `id_Kakovost` int(11) DEFAULT NULL,
  `id_Vrsta` int(11) DEFAULT NULL,
  `id_Barva` int(11) DEFAULT NULL,
  `id_Vinar` int(11) DEFAULT NULL,
  `id_Sorta` int(11) DEFAULT NULL,
  PRIMARY KEY (`idArtikel`),
  KEY `fk_Vino_Sladkorna_stopnja1_idx` (`id_Sladkor`),
  KEY `fk_Vino_Cas_trgatve1_idx` (`id_Trgatev`),
  KEY `fk_Vino_Pridelava1_idx` (`id_Prid`),
  KEY `fk_Vino_Kakovostna_kategorija1_idx` (`id_Kakovost`),
  KEY `fk_Vino_Vrsta1_idx` (`id_Vrsta`),
  KEY `fk_Vino_Barva1_idx` (`id_Barva`),
  KEY `fk_Vino_Vinogradnik1_idx` (`id_Vinar`),
  KEY `fk_VinoArtikel_Sorta1_idx` (`id_Sorta`),
  KEY `fk_VinoArtikel_Cenik1_idx` (`id_Cenik`),
  CONSTRAINT `fk_VinoArtikel_Cenik1` FOREIGN KEY (`id_Cenik`) REFERENCES `cenik` (`idCenik`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_VinoArtikel_Sorta1` FOREIGN KEY (`id_Sorta`) REFERENCES `sorta` (`idSorta`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Vino_Barva1` FOREIGN KEY (`id_Barva`) REFERENCES `barva` (`idBarva`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Vino_Cas_trgatve1` FOREIGN KEY (`id_Trgatev`) REFERENCES `trgatev` (`idTrgatev`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Vino_Kakovostna_kategorija1` FOREIGN KEY (`id_Kakovost`) REFERENCES `kakovost` (`idKakovost`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Vino_Pridelava1` FOREIGN KEY (`id_Prid`) REFERENCES `pridelava` (`idPrid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Vino_Sladkorna_stopnja1` FOREIGN KEY (`id_Sladkor`) REFERENCES `sladkor` (`idSladkor`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Vino_Vinogradnik1` FOREIGN KEY (`id_Vinar`) REFERENCES `vinar` (`idVinar`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Vino_Vrsta1` FOREIGN KEY (`id_Vrsta`) REFERENCES `vrsta` (`idVrsta`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=192 DEFAULT CHARSET=utf8 COLLATE=utf8_slovenian_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vinoartikel`
--

LOCK TABLES `vinoartikel` WRITE;
/*!40000 ALTER TABLE `vinoartikel` DISABLE KEYS */;
INSERT INTO `vinoartikel` VALUES (1,'Merlot',13.50,2005,5,0.750,10.00,'SLO',NULL,2,3,2,3,3,1,2,5,1),(2,'Črno Dobuje',13.50,2003,22,0.750,15.00,'SLO',NULL,2,4,2,2,3,1,2,6,2),(3,'Chardonnay',13.00,2010,33,0.750,5.00,'SLO',NULL,2,2,2,2,3,1,1,19,11),(4,'Chardonnay',12.50,2008,0,1.500,5.00,'SLO',NULL,2,2,2,1,3,1,1,19,11),(5,'Pinot draga',14.00,2007,10,0.750,17.99,'SLO',NULL,2,4,3,2,2,4,2,15,6),(6,'Chardonnay',13.20,2008,0,0.750,5.75,'SLO',NULL,2,2,2,2,4,1,1,12,11),(7,'Chardonnay',14.50,2008,0,0.750,9.99,'SLO',NULL,2,3,2,2,3,1,1,28,11),(8,'Rdeče',14.50,2006,0,0.750,16.00,'SLO',NULL,2,4,2,2,3,1,2,5,2),(9,'Cabarnet Sauvignon Barrique',14.00,2007,0,0.750,7.99,'SLO',NULL,2,3,2,2,3,1,2,28,17),(10,'Silveri brut rosé',12.50,0,0,0.750,14.99,'SLO',NULL,2,4,1,2,3,2,3,11,9),(11,'Cabarnet Sauvignon',12.40,2009,0,0.750,4.99,'SLO',NULL,2,2,2,2,3,1,2,13,5),(12,'Gaugar',11.50,2008,0,0.750,2.99,'SLO',NULL,2,1,2,2,3,1,2,9,5),(13,'Sivi Pinot',13.50,2009,0,0.750,9.99,'SLO',NULL,2,3,2,2,3,1,1,10,6),(14,'Refošk aMorus',13.50,2007,0,0.750,10.99,'SLO',NULL,2,3,2,3,4,1,2,1,18),(15,'Malvazija aMorus',13.00,2007,0,0.750,5.99,'SLO',NULL,2,3,2,3,4,1,1,1,12),(16,'Refošk',12.50,2009,0,0.750,5.99,'SLO',NULL,2,3,2,3,4,1,2,1,18),(17,'Malvazija',13.00,2008,0,0.750,6.99,'SLO',NULL,2,3,2,3,4,1,1,1,12),(18,'Cabarnet Sauvignon',13.50,2007,0,0.750,14.99,'SLO',NULL,2,4,2,2,3,1,2,2,5),(19,'Refošk',13.50,2008,0,0.750,5.99,'SLO',NULL,2,2,2,2,3,1,4,2,18),(20,'Malvazija',13.00,2008,0,0.750,4.99,'SLO',NULL,2,2,2,2,3,1,1,2,12),(21,'Cabarnet Sauvignon',13.50,2006,0,0.750,4.99,'SLO',NULL,2,2,2,2,3,1,2,2,5),(22,'Refošk KVI',13.50,2006,0,0.750,16.99,'SLO',NULL,2,4,2,2,3,1,4,2,18),(23,'Refošk KVI',13.50,2008,0,0.750,7.99,'SLO',NULL,2,3,2,2,3,1,4,2,18),(24,'Malvazija',13.50,2008,0,0.750,8.99,'SLO',NULL,2,3,2,1,2,1,1,3,12),(25,'Malvazija',13.00,2008,0,0.750,2.99,'SLO',NULL,2,1,2,1,2,1,1,3,12),(26,'Refošk',12.20,2007,0,0.750,11.99,'SLO',NULL,2,3,2,1,2,1,2,3,18),(27,'Refošk',12.00,2008,0,1.000,5.99,'SLO',NULL,2,2,2,1,2,1,2,3,18),(28,'Refošk',12.00,2008,0,0.750,5.99,'SLO',NULL,2,2,2,1,2,2,2,3,18),(29,'Refošk',12.50,2008,0,1.000,5.99,'SLO',NULL,2,2,2,2,3,1,2,4,18),(30,'Refošk',12.50,2008,0,0.750,5.99,'SLO',NULL,2,2,2,2,3,1,2,4,18),(31,'Rumena rebula reserva',12.60,2005,0,0.750,3.99,'SLO',NULL,2,4,2,1,3,1,1,5,8),(32,'Rdeče reserva',15.00,2006,0,0.750,29.90,'SLO',NULL,2,5,2,3,3,1,2,5,19),(33,'Sivi Pinot',13.50,2009,0,0.750,10.00,'SLO',NULL,2,3,2,2,3,1,1,5,6),(34,'Belo',13.00,2005,0,0.750,19.99,'SLO',NULL,2,4,2,2,3,1,1,5,20),(35,'Rdeče',14.50,2006,0,0.750,16.99,'SLO',NULL,2,4,1,2,3,1,2,5,2),(36,'Rumena rebula',12.00,2009,0,0.750,7.99,'SLO',NULL,2,3,2,3,3,1,1,5,8),(37,'Maria Nevea Dobuje',0.00,2004,0,0.750,19.99,'SLO',NULL,2,4,2,2,3,1,1,6,16),(38,'Sivi Pinot Dobuje',13.50,2008,0,0.750,6.99,'SLO',NULL,2,3,2,2,3,1,1,6,6),(39,'Rebula Dobuje',13.00,2008,0,0.750,6.99,'SLO',NULL,2,3,2,2,3,1,1,6,8),(40,'Sauvignonasse Dobuje',13.00,0,0,0.750,4.99,'SLO',NULL,2,3,2,2,3,1,1,6,7),(41,'Chardonnay',13.00,2008,0,1.500,4.99,'SLO',NULL,2,2,2,2,3,1,1,6,11),(42,'Sauvignon Dobuje',0.00,2008,0,0.750,4.99,'SLO',NULL,2,3,2,2,3,1,1,6,10),(43,'Merlot',12.50,2008,0,1.500,4.99,'SLO',NULL,2,2,2,2,3,1,2,6,1),(44,'Chardonnay Dobuje',13.50,2007,5,0.750,8.99,'SLO',NULL,2,3,2,2,3,1,1,6,11),(45,'Merlot Dobuje',13.00,2006,0,0.750,9.99,'SLO',NULL,2,3,1,2,3,1,2,6,1),(46,'Sauvignon',12.90,2008,0,0.750,7.99,'SLO',NULL,2,3,2,2,3,1,1,7,21),(47,'Cabarnet Sauvignon',14.40,2006,0,0.750,18.99,'SLO',NULL,2,4,2,2,3,1,2,7,5),(48,'Rebula',12.90,2007,0,0.750,9.99,'SLO',NULL,2,3,2,2,3,1,1,7,8),(49,'Rebula',12.80,2002,0,0.750,24.99,'SLO',NULL,2,4,2,2,3,1,1,7,8),(50,'Teran PTP',10.50,2009,0,0.750,5.99,'SLO',NULL,2,2,2,2,3,1,2,8,22),(51,'Izbrani Teran PTP',11.50,2009,0,0.750,5.99,'SLO',NULL,2,2,2,2,4,1,2,8,22),(52,'Teran PTP',10.50,2009,0,0.750,5.99,'SLO',NULL,2,2,2,2,3,1,2,8,22),(53,'Zelen',11.80,2008,0,0.750,8.99,'SLO',NULL,2,3,2,2,3,1,1,9,23),(54,'Pinela',12.50,2006,0,0.750,4.99,'SLO',NULL,2,2,2,2,3,1,1,9,24),(55,'Merlot',12.40,2006,0,0.750,9.99,'SLO',NULL,2,3,2,2,3,1,2,9,1),(56,'Rosé',13.00,2009,0,0.750,6.99,'SLO',NULL,2,3,2,2,3,1,3,10,14),(57,'Cabarnet Sauvignon',13.50,2009,0,0.750,6.99,'SLO',NULL,2,3,2,2,3,1,2,10,5),(58,'Merlot',13.50,2008,0,0.750,7.99,'SLO',NULL,2,3,2,2,3,1,2,10,1),(59,'Story',14.50,2006,0,0.375,49.99,'SLO',NULL,5,5,5,2,3,1,1,10,25),(60,'Modri Pinot',13.00,2005,0,0.750,24.99,'SLO',NULL,2,4,2,2,3,1,2,10,26),(61,'Pikolit',16.00,2006,0,0.750,22.75,'SLO',NULL,3,4,2,2,3,1,1,10,27),(62,'Sauvignonasse',13.50,2008,0,0.750,11.99,'SLO',NULL,2,3,2,2,3,1,1,10,7),(63,'Beli Pinot',13.50,2009,0,0.750,10.99,'SLO',NULL,2,3,2,2,3,1,1,10,13),(64,'Story rdeč',14.00,2006,0,0.200,49.99,'SLO',NULL,5,5,5,2,3,1,2,10,28),(65,'Stara brajda bela',13.50,2008,0,0.750,22.75,'SLO',NULL,2,4,2,2,3,1,1,10,29),(66,'Cabarnet Franc',13.50,2009,0,0.750,6.99,'SLO',NULL,2,3,2,2,3,1,2,10,30),(67,'Stara brajda rdeča',13.50,2008,0,0.750,15.75,'SLO',NULL,2,4,2,2,3,1,2,10,31),(68,'Chardonnay',13.50,2009,0,0.750,8.99,'SLO',NULL,2,3,2,2,3,1,1,10,11),(69,'Rumena Rebula',13.00,2009,0,0.750,8.99,'SLO',NULL,2,3,2,2,3,1,1,10,8),(70,'Kontra',14.00,2008,0,0.750,17.55,'SLO',NULL,2,4,2,2,3,1,1,10,54),(71,'Dugo',13.50,2007,0,0.750,18.99,'SLO',NULL,2,4,2,2,3,1,1,10,54),(72,'Sauvignon',13.50,2009,0,0.750,9.99,'SLO',NULL,2,3,2,2,3,1,1,10,10),(73,'Up',14.00,2006,0,0.750,48.99,'SLO',NULL,2,5,2,1,3,1,2,10,32),(74,'Silveri Brut',12.50,0,0,0.750,17.95,'SLO',NULL,2,4,1,2,3,2,1,11,33),(75,'Silveri White',12.50,0,0,0.750,7.99,'SLO',NULL,2,3,1,2,3,2,1,11,33),(76,'Sivi Pinot',13.20,2008,0,0.750,4.99,'SLO',NULL,2,2,1,2,4,1,1,12,6),(77,'Cabarnet Franc',13.81,2007,0,0.750,7.95,'SLO',NULL,2,3,2,2,4,1,2,12,30),(78,'Cabarnet Sauvignon',13.34,2008,0,0.750,8.99,'SLO',NULL,2,3,2,2,4,1,2,12,5),(79,'Merlot',13.50,2008,0,0.750,8.99,'SLO',NULL,2,3,2,2,4,1,2,12,1),(80,'Rebula',11.68,2008,0,0.750,3.99,'SLO',NULL,2,2,2,2,3,1,1,12,8),(81,'Merlot',12.30,2009,0,0.750,3.99,'SLO',NULL,2,2,2,2,3,1,2,13,1),(82,'Rebula',11.90,2009,0,0.750,3.99,'SLO',NULL,2,2,2,2,3,1,1,13,8),(83,'Trkaj',12.40,2009,0,1.500,3.99,'SLO',NULL,2,2,2,2,3,1,1,13,34),(84,'Refošk',10.60,2009,0,0.750,3.99,'SLO',NULL,2,2,1,2,3,1,2,13,18),(85,'Sivi Pinot',13.30,2009,0,1.500,3.99,'SLO',NULL,2,2,2,2,3,1,1,13,6),(86,'Chardonnay',12.30,2009,0,0.750,3.99,'SLO',NULL,2,2,2,2,3,1,1,13,11),(87,'Sivi Pinot',14.50,2008,0,0.750,4.99,'SLO',NULL,2,2,2,1,3,1,1,14,6),(88,'Cabarnet Franc',12.90,2008,0,0.750,4.99,'SLO',NULL,2,2,2,1,4,1,2,14,30),(89,'Chardonnay',14.10,2008,10,0.750,4.99,'SLO',NULL,2,2,2,1,4,1,1,14,11),(90,'Merlot izbor',15.00,2006,0,0.750,49.99,'SLO',NULL,3,5,3,2,2,1,2,15,1),(91,'Rebula Prilo',12.80,2006,0,0.750,20.99,'SLO',NULL,2,4,2,2,2,1,1,15,8),(92,'Brajda (rdeča)',13.00,2005,0,0.750,24.99,'SLO',NULL,2,4,2,2,3,1,2,15,35),(93,'Sivi Pinot',12.50,2007,0,0.750,7.99,'SLO',NULL,2,3,2,2,3,1,1,15,6),(94,'Tolovaj - nefiltrirano',13.00,2008,0,0.750,6.99,'SLO',NULL,2,3,2,2,3,1,1,16,7),(95,'Malvazija',13.00,2009,0,0.750,6.00,'SLO',NULL,2,3,2,2,3,1,1,16,12),(96,'Chardonnay',14.00,2008,0,0.750,6.75,'SLO',NULL,2,3,2,2,3,1,1,16,11),(97,'Sauvignon',14.00,2008,0,0.750,6.75,'SLO',NULL,2,3,2,2,3,1,1,16,10),(98,'Khmer- magnum',15.00,2006,0,1.500,49.75,'SLO',NULL,2,5,2,2,3,1,2,16,3),(99,'Poanta',14.00,2007,0,0.750,19.99,'SLO',NULL,2,4,2,2,3,1,1,16,36),(100,'Khmer',15.00,2006,0,0.750,24.99,'SLO',NULL,2,4,2,2,3,1,2,16,3),(101,'Edijev izbor',0.00,2002,0,0.375,50.00,'SLO',NULL,4,5,4,2,3,4,1,17,37),(102,'Rebula',14.00,2006,0,0.750,24.99,'SLO',NULL,2,4,2,2,3,1,1,17,8),(103,'Malvazija',14.00,2007,0,0.750,19.99,'SLO',NULL,2,4,2,2,3,1,1,17,12),(104,'Duet 2007',14.00,2007,0,0.750,19.99,'SLO',NULL,2,4,2,2,3,1,2,17,38),(105,'Sauvignon',15.00,2006,0,0.750,24.99,'SLO',NULL,2,4,2,2,3,1,1,17,10),(106,'Rebula',11.30,2008,0,5.000,2.99,'SLO',NULL,2,1,2,2,2,1,1,18,8),(107,'Rebula',11.30,2008,0,10.000,2.99,'SLO',NULL,2,1,2,2,2,1,1,18,8),(108,'Rebula',11.30,2008,0,50.000,2.99,'SLO',NULL,2,1,2,2,2,1,1,18,8),(109,'Merlot',12.00,2008,0,5.000,2.99,'SLO',NULL,2,1,2,2,2,1,2,18,1),(110,'Merlot',12.00,2008,0,10.000,2.99,'SLO',NULL,2,1,2,2,2,1,2,18,1),(111,'Merlot',12.00,2008,0,50.000,2.99,'SLO',NULL,2,1,2,2,2,1,2,18,1),(112,'Mešano belo',12.00,0,0,5.000,2.99,'SLO',NULL,2,1,2,2,2,1,1,18,39),(113,'Mešano belo',12.00,0,0,10.000,2.99,'SLO',NULL,2,1,2,2,2,1,1,18,39),(114,'Mešano belo',12.00,0,0,50.000,2.99,'SLO',NULL,2,1,2,2,2,1,1,18,39),(115,'Sivi Pinot',12.50,2008,0,1.500,4.99,'SLO',NULL,2,2,2,1,3,1,1,19,6),(116,'Rebula',12.50,2010,0,12.500,4.99,'SLO',NULL,2,2,2,2,3,1,1,19,8),(117,'Sauvignonasse',12.50,2008,0,0.750,5.99,'SLO',NULL,2,2,2,1,3,1,1,19,7),(118,'Cabarnet',12.50,2008,0,1.500,5.99,'SLO',NULL,2,2,2,1,3,1,2,19,35),(119,'Cabarnet Sauvignon',13.00,2009,0,0.750,4.99,'SLO',NULL,2,2,2,2,3,1,2,19,5),(120,'Sivi Pinot',13.00,2010,0,0.750,3.00,'SLO',NULL,2,2,2,2,3,1,1,19,6),(121,'Merlot',12.50,2008,0,0.750,3.99,'SLO',NULL,2,2,2,2,3,1,2,19,1),(122,'Beli Pinot',12.50,2008,0,1.500,4.99,'SLO',NULL,2,2,2,1,3,1,1,19,13),(123,'Merlot',12.50,2008,0,1.500,4.99,'SLO',NULL,2,2,2,1,3,1,2,19,35),(124,'Teran',11.50,2008,0,0.750,10.99,'SLO',NULL,2,3,2,2,4,1,2,21,18),(125,'Chardonnay',12.50,2008,0,0.750,10.99,'SLO',NULL,2,3,2,2,4,1,1,21,11),(126,'Cara',12.50,2007,0,0.750,11.99,'SLO',NULL,2,3,2,2,3,1,1,21,40),(127,'Malvazija',13.00,2008,0,0.750,10.99,'SLO',NULL,2,3,2,2,3,1,1,21,12),(128,'Vitovska grganja',12.30,2007,0,0.750,11.99,'SLO',NULL,2,3,2,2,3,1,1,21,41),(129,'Carus',12.00,2003,0,0.750,24.99,'SLO',NULL,2,4,2,2,4,1,2,21,4),(130,'Cabarnet Sauvignon',11.50,2004,10,0.750,11.99,'SLO',NULL,2,3,2,2,4,1,2,21,5),(131,'Sivi Pinot',12.80,2007,0,0.750,3.99,'SLO',NULL,2,2,2,2,3,1,1,22,6),(132,'Vivace',10.50,2008,0,0.750,6.00,'SLO',NULL,1,3,2,2,3,3,1,22,8),(133,'Modri Pinot',13.50,2005,0,0.750,11.99,'SLO',NULL,2,3,2,2,4,1,2,22,26),(134,'Sauvignon',15.20,2006,0,0.750,10.99,'SLO',NULL,2,3,2,2,4,1,1,22,10),(135,'Merlot',13.00,2006,0,0.750,10.99,'SLO',NULL,2,3,2,2,4,1,2,22,1),(136,'Merlot Barik',13.40,2006,0,0.750,10.99,'SLO',NULL,2,3,2,2,4,1,2,22,42),(137,'Cabarnet Franc Barik',13.70,2003,0,0.750,11.99,'SLO',NULL,2,3,2,2,4,1,2,22,43),(138,'Merlot',13.00,2006,0,0.750,10.99,'SLO',NULL,2,3,2,2,4,1,2,22,1),(139,'Modri Pinot',13.50,2005,0,0.750,11.99,'SLO',NULL,2,3,2,2,4,1,2,22,26),(140,'Rozinec',17.40,2007,0,0.500,14.75,'SLO',NULL,4,4,3,2,3,4,2,23,5),(141,'Beli Pinot',13.30,2008,0,0.750,3.75,'SLO',NULL,2,2,2,2,3,1,1,23,13),(142,'Quine rdeče',10.70,2007,0,0.750,7.99,'SLO',NULL,2,3,2,2,3,4,2,23,5),(143,'Malvazija',11.80,2008,0,0.750,4.99,'SLO',NULL,2,2,2,2,3,1,1,23,12),(144,'Rosé',12.50,2008,0,0.750,7.75,'SLO',NULL,2,3,2,2,3,1,3,24,44),(145,'Čarvina',11.00,2003,0,0.375,24.75,'SLO',NULL,5,4,5,2,4,4,1,24,45),(146,'Merlot',13.00,2007,0,0.750,9.99,'SLO',NULL,2,3,2,2,3,1,2,24,1),(147,'Sivi Pinot',12.50,2008,0,0.750,11.75,'SLO',NULL,2,3,2,2,3,1,1,24,6),(148,'Sauvignon',12.50,2008,0,0.750,11.75,'SLO',NULL,2,3,2,2,3,1,1,24,10),(149,'Ta star',13.50,2004,0,0.750,18.99,'SLO',NULL,2,4,2,2,3,1,2,24,46),(150,'Čar.Tok.',13.00,2008,0,0.750,7.75,'SLO',NULL,2,3,2,2,3,1,1,24,7),(151,'Cabarnet Franc, selekcija',13.00,2006,0,0.750,10.99,'SLO',NULL,2,3,2,2,4,1,2,24,30),(152,'Donna Regina',13.00,2004,0,0.750,24.99,'SLO',NULL,1,4,2,2,3,2,1,24,47),(153,'Rebula',13.00,2008,0,0.750,6.75,'SLO',NULL,2,3,2,2,3,1,1,24,8),(154,'Sivi Pinot Bagueri',13.50,2008,0,0.750,6.75,'SLO',NULL,2,3,2,2,4,1,1,25,6),(155,'Sladki Quercus',10.50,2009,0,0.750,5.99,'SLO',NULL,5,2,2,2,4,1,1,25,48),(156,'Cabarnet Sauvignon Bagueri',13.50,2007,0,0.750,9.99,'SLO',NULL,2,3,2,2,4,1,2,25,5),(157,'Penina Quercus',12.50,2008,0,0.750,4.99,'SLO',NULL,3,2,2,2,3,2,1,25,33),(158,'Sauvignonasse Quercus',13.50,2009,0,0.750,3.75,'SLO',NULL,2,2,2,2,4,1,1,25,7),(159,'Chardonnay Bagueri',13.00,2007,0,0.750,6.99,'SLO',NULL,2,3,2,1,4,1,1,25,11),(160,'Sauvignon Quercus',13.00,2009,0,0.750,3.00,'SLO',NULL,2,2,2,2,4,1,1,25,10),(161,'Merlot Bagueri',14.00,2006,0,0.750,7.75,'SLO',NULL,2,3,2,2,4,1,2,25,1),(162,'Rebula Quercus',13.00,2009,0,0.750,3.99,'SLO',NULL,2,2,2,2,4,1,1,25,8),(163,'Penina Rosé Quercus',12.50,2009,0,0.750,6.99,'SLO',NULL,2,3,2,2,3,2,3,25,26),(164,'Chardonnay',13.50,2008,0,0.750,4.99,'SLO',NULL,2,2,2,2,3,1,1,26,11),(165,'Cabarnet Sauvignon',12.27,2008,0,0.750,4.99,'SLO',NULL,2,2,2,2,3,1,2,26,5),(166,'Sivi Pinot',13.70,2006,0,0.750,8.75,'SLO',NULL,2,3,2,3,3,1,1,27,6),(167,'Merlot',13.50,2008,0,0.750,6.99,'SLO',NULL,2,3,2,3,3,1,2,27,1),(168,'Chardonnay',13.20,2008,0,0.750,6.99,'SLO',NULL,2,3,2,3,3,1,1,27,11),(169,'Rebula',12.20,2008,0,0.750,6.99,'SLO',NULL,2,3,2,3,3,1,1,27,8),(170,'Emilio Cuvee',13.40,2008,0,0.750,6.99,'SLO',NULL,2,3,2,3,3,1,1,27,49),(171,'Cabarnet Sauvignon',13.00,0,0,0.750,6.99,'SLO',NULL,2,3,2,3,3,1,2,27,5),(172,'Cabarnet Sauvignon',13.00,2008,0,0.750,6.99,'SLO',NULL,2,3,2,2,3,1,2,28,5),(173,'Konrad belo',14.00,2008,0,0.750,6.99,'SLO',NULL,2,3,2,2,3,1,1,28,50),(174,'Rumeni muškat',13.50,2006,0,0.500,9.99,'SLO',NULL,3,3,2,2,3,5,1,28,51),(175,'Sauvignonasse',14.00,2008,0,0.750,6.99,'SLO',NULL,2,3,2,2,3,1,1,28,7),(176,'Rebula',12.50,2008,0,0.750,6.99,'SLO',NULL,2,3,2,2,3,1,1,28,8),(177,'Sivi Pinot',14.00,2008,0,0.750,6.99,'SLO',NULL,2,3,2,2,3,1,1,28,6),(178,'Konrad rdeče',15.00,2006,0,0.750,22.75,'SLO',NULL,2,4,2,2,3,1,2,28,35),(179,'Sivi Pinot',13.00,2005,0,0.750,11.99,'SLO',NULL,2,3,2,2,3,1,1,29,6),(180,'Chardonnay',14.00,2006,0,0.750,10.99,'SLO',NULL,2,3,2,2,3,1,1,29,11),(181,'Rebula',12.50,2007,0,0.750,7.99,'SLO',NULL,2,3,2,2,3,1,1,29,8),(182,'Sauvignonasse',12.50,2007,0,0.750,7.99,'SLO',NULL,2,3,2,2,3,1,1,29,7),(183,'Merlot',12.50,2008,0,0.750,6.99,'SLO',NULL,2,3,2,2,3,1,2,29,1),(184,'Teran PTP',11.77,2009,0,0.200,6.50,'SLO',NULL,2,3,2,2,3,1,2,30,52),(185,'Teran PTP',11.77,2009,0,0.750,6.50,'SLO',NULL,2,3,2,2,3,1,2,30,52),(186,'Teranov liker PTP',15.09,2009,0,0.200,6.50,'SLO',NULL,5,3,2,2,3,5,4,30,53),(187,'Teranov liker PTP',15.09,2009,0,0.500,6.50,'SLO',NULL,5,3,2,2,3,5,4,30,53),(188,'Refošk',12.47,2009,0,1.000,6.00,'SLO',NULL,2,2,2,2,3,1,2,31,18),(189,'Refošk',13.15,2008,0,0.750,6.00,'SLO',NULL,2,2,2,2,4,1,2,31,18),(190,'Refošk',11.82,2006,0,0.750,8.75,'SLO',NULL,2,3,2,2,4,1,2,31,18),(191,'Zelen',11.88,2007,0,0.750,7.50,'SLO',NULL,2,3,2,2,3,1,1,21,23);
/*!40000 ALTER TABLE `vinoartikel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vinorodniokolis`
--

DROP TABLE IF EXISTS `vinorodniokolis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vinorodniokolis` (
  `idVinOkolis` int(11) NOT NULL AUTO_INCREMENT,
  `vinorodni_okolis` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idVinOkolis`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vinorodniokolis`
--

LOCK TABLES `vinorodniokolis` WRITE;
/*!40000 ALTER TABLE `vinorodniokolis` DISABLE KEYS */;
INSERT INTO `vinorodniokolis` VALUES (1,'Bela krajina'),(2,'Bizeljsko - Sremič'),(3,'Dolenjska'),(4,'Goriška Brda'),(5,'Haloze'),(6,'Kras'),(7,'Ljutomer - Ormož'),(8,'Maribor'),(9,'Prekmurje'),(10,'Radgona - Kapela'),(11,'Slovenska Istra'),(12,'Srednje Slovenske gorice'),(13,'Šmarje - Virštanj'),(14,'Vipavska');
/*!40000 ALTER TABLE `vinorodniokolis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vrsta`
--

DROP TABLE IF EXISTS `vrsta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vrsta` (
  `idVrsta` int(11) NOT NULL AUTO_INCREMENT,
  `vrsta` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idVrsta`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='Vrste vin';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vrsta`
--

LOCK TABLES `vrsta` WRITE;
/*!40000 ALTER TABLE `vrsta` DISABLE KEYS */;
INSERT INTO `vrsta` VALUES (1,'Mirna vina'),(2,'Peneča vina'),(3,'Biser vina'),(4,'Posebna vina'),(5,'Aromatizirana vina'),(6,'Alkoholizirana ali likerska vina');
/*!40000 ALTER TABLE `vrsta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zaloga`
--

DROP TABLE IF EXISTS `zaloga`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zaloga` (
  `idZaloga` int(11) NOT NULL AUTO_INCREMENT,
  `kolicina` int(11) DEFAULT NULL,
  `tip_zaloge` varchar(255) DEFAULT NULL COMMENT 'bottles, barrels, ...',
  `VinoArtikel` int(11) DEFAULT NULL,
  `id_Lokacija` int(11) NOT NULL,
  PRIMARY KEY (`idZaloga`),
  KEY `fk_Zaloga_Vino1_idx` (`VinoArtikel`),
  KEY `fk_Zaloga_Lokacija1_idx` (`id_Lokacija`),
  CONSTRAINT `fk_Zaloga_Lokacija1` FOREIGN KEY (`id_Lokacija`) REFERENCES `lokacija` (`idLokacija`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Zaloga_Vino1` FOREIGN KEY (`VinoArtikel`) REFERENCES `vinoartikel` (`idArtikel`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zaloga`
--

LOCK TABLES `zaloga` WRITE;
/*!40000 ALTER TABLE `zaloga` DISABLE KEYS */;
INSERT INTO `zaloga` VALUES (1,12,'Steklenica 0,75L',1,1),(2,12,'Steklenica 0,75L',44,1),(3,12,'Steklenica 0.20L',64,2),(4,12,'Steklenica 1.50L',83,3),(5,1,'Sod 50L',108,2);
/*!40000 ALTER TABLE `zaloga` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-06-04 23:46:17
