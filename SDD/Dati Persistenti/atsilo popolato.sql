-- MySQL dump 10.13  Distrib 5.5.28, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: atsilo
-- ------------------------------------------------------
-- Server version	5.5.28-0ubuntu0.12.04.2

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
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account` (
  `username` varchar(50) NOT NULL,
  `password` varchar(256) DEFAULT NULL,
  `genitore` varchar(50) DEFAULT NULL,
  `personale_asilo` varchar(50) DEFAULT NULL,
  `psico_pedagogo` varchar(50) DEFAULT NULL,
  `responsabile_questionario` varchar(50) DEFAULT NULL,
  `responsabile_tirocini` varchar(50) DEFAULT NULL,
  `tirocinante` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`username`),
  KEY `genitore` (`genitore`),
  KEY `personale_asilo` (`personale_asilo`),
  KEY `psico_pedagogo` (`psico_pedagogo`),
  KEY `responsabile_questionario` (`responsabile_questionario`),
  KEY `responsabile_tirocini` (`responsabile_tirocini`),
  KEY `tirocinante` (`tirocinante`),
  CONSTRAINT `account_ibfk_1` FOREIGN KEY (`responsabile_tirocini`) REFERENCES `responsabile_tirocini` (`codice_fiscale`),
  CONSTRAINT `account_ibfk_2` FOREIGN KEY (`tirocinante`) REFERENCES `tirocinante` (`codice_fiscale`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES ('a.damelia','alfonsoda',NULL,NULL,'DMLLFN71L12A333B',NULL,NULL,NULL),('a.defazio','andreadf','DFZNDR91L14A909D',NULL,NULL,NULL,NULL,NULL),('a.desantis','arturods',NULL,NULL,NULL,'DSTRTR58L32A333B',NULL,NULL),('a.senatore','antonellas',NULL,'SNTNTN53N69B309D',NULL,NULL,NULL,NULL),('d.tranfa','domenicot',NULL,'TRNDMN64L12T048Y	',NULL,NULL,NULL,NULL),('g.delbuono','giuseppedb','DBNGPP69A23B222C',NULL,NULL,NULL,NULL,NULL),('g.dicostanzo','giovannadc','DCSGVN74A23B224X',NULL,NULL,NULL,NULL,NULL),('l.vella','laurav','VLLLRU83A24T928B',NULL,NULL,NULL,NULL,NULL),('m.chiavelli','mauroc','CVLMRA69A23B333C',NULL,NULL,NULL,NULL,NULL),('m.verrone','maddalenav',NULL,NULL,'VRRMDD64T32A048N',NULL,NULL,NULL),('s.buselli','silvanab',NULL,'BSLSVN62L12B099E',NULL,NULL,NULL,NULL),('s.delregno','santodr','DRGSNT81A26B045C',NULL,NULL,NULL,NULL,NULL),('s.passaro','susannap','PSSSNN85L98A980I',NULL,NULL,NULL,NULL,NULL),('v.mars','veronicam',NULL,'MRSVRN90A32B235B',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assenza`
--

DROP TABLE IF EXISTS `assenza`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assenza` (
  `bambino` varchar(50) DEFAULT NULL,
  `data` date DEFAULT NULL,
  KEY `bambino` (`bambino`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assenza`
--

LOCK TABLES `assenza` WRITE;
/*!40000 ALTER TABLE `assenza` DISABLE KEYS */;
INSERT INTO `assenza` VALUES ('CVLRRA12A23B333C','2012-11-06'),('DFZGNN12L14A909D','2012-09-10');
/*!40000 ALTER TABLE `assenza` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attivita`
--

DROP TABLE IF EXISTS `attivita`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attivita` (
  `titolo` varchar(50) NOT NULL,
  `descrizione` varchar(100) DEFAULT NULL,
  `categoria` varchar(50) DEFAULT NULL,
  `programma_educativo_settimanale` int(11) DEFAULT NULL,
  `registro` int(11) DEFAULT NULL,
  `path` varchar(256) DEFAULT NULL,
  `nota` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`titolo`),
  KEY `programma_educativo_settimanale` (`programma_educativo_settimanale`),
  KEY `registro` (`registro`),
  KEY `nota` (`nota`),
  CONSTRAINT `attivita_ibfk_1` FOREIGN KEY (`nota`) REFERENCES `nota` (`titolo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attivita`
--

LOCK TABLES `attivita` WRITE;
/*!40000 ALTER TABLE `attivita` DISABLE KEYS */;
INSERT INTO `attivita` VALUES ('Attività X1','X1','X',1,1,NULL,NULL),('Attività X2','X2','X',1,1,NULL,NULL),('Attività Y1','Y1','Y',2,2,NULL,NULL),('Attività Y2','Y2','Y',2,2,NULL,NULL),('Attività Z1','Z1','Z',3,3,NULL,NULL),('Attività Z2','Z2','Z',3,3,NULL,NULL);
/*!40000 ALTER TABLE `attivita` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attivita_tirocinante`
--

DROP TABLE IF EXISTS `attivita_tirocinante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attivita_tirocinante` (
  `id` int(50) NOT NULL,
  `descrizione` varchar(100) DEFAULT NULL,
  `data` date DEFAULT NULL,
  `ora_inizio` varchar(10) DEFAULT NULL,
  `ora_fine` varchar(10) DEFAULT NULL,
  `valutazione` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attivita_tirocinante`
--

LOCK TABLES `attivita_tirocinante` WRITE;
/*!40000 ALTER TABLE `attivita_tirocinante` DISABLE KEYS */;
INSERT INTO `attivita_tirocinante` VALUES (978786,'Recita natalizia','2012-12-21','12:00','13:00',NULL);
/*!40000 ALTER TABLE `attivita_tirocinante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bambino`
--

DROP TABLE IF EXISTS `bambino`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bambino` (
  `nome` varchar(50) DEFAULT NULL,
  `cognome` varchar(50) DEFAULT NULL,
  `codice_fiscale` varchar(50) NOT NULL,
  `data_di_nascita` date DEFAULT NULL,
  `indirizzo_residenza` varchar(50) DEFAULT NULL,
  `categoria_appartenenza` varchar(50) DEFAULT NULL,
  `genitore` varchar(50) DEFAULT NULL,
  `classe` int(11) DEFAULT NULL,
  `cittadinanza` varchar(50) DEFAULT NULL,
  `comune_di_nascita` varchar(50) DEFAULT NULL,
  `numero_civico_residenza` varchar(10) DEFAULT NULL,
  `cap_residenza` varchar(10) DEFAULT NULL,
  `comune_residenza` varchar(100) DEFAULT NULL,
  `provincia_residenza` varchar(50) DEFAULT NULL,
  `indirizzo_domicilio` varchar(100) DEFAULT NULL,
  `numero_civico_domicilio` varchar(10) DEFAULT NULL,
  `cap_domicilio` varchar(10) DEFAULT NULL,
  `comune_domicilio` varchar(100) DEFAULT NULL,
  `provincia_domicilio` varchar(50) DEFAULT NULL,
  `cf_genitore_nonrichiedente` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`codice_fiscale`),
  KEY `classe` (`classe`),
  KEY `genitore` (`genitore`),
  KEY `cf_genitore_nonrichiedente` (`cf_genitore_nonrichiedente`),
  CONSTRAINT `bambino_ibfk_1` FOREIGN KEY (`cf_genitore_nonrichiedente`) REFERENCES `genitore` (`codice_fiscale`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bambino`
--

LOCK TABLES `bambino` WRITE;
/*!40000 ALTER TABLE `bambino` DISABLE KEYS */;
INSERT INTO `bambino` VALUES ('Aurora','Chiavelli','CVLRRA12A23B333C','2012-09-07','via Roma, 2 - Fisciano (SA)','Lattanti','CVLMRA69A23B333C',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('Luca','Del Buono','DBNLCU11A23B222C','2011-12-30','via degli Ulivi, 16 - 00100 Roma','Semisvezzati','DBNGPP69A23B222C',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('Maria','Del Buono','DBNMRA11A23B222C','2010-11-17','via degli Ulivi, 16 - 00100 Roma','Svezzati','DBNGPP69A23B222C',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('Gennaro','De Fazio','DFZGNN12L14A909D','2012-09-11','via delle X, 69 - Vallo della Lucania (SA)','Lattanti','DFZNDR91L14A909D',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('Candida','Del Regno','DRGCND10A26B045C','2010-11-01','via delle Y, 10 - Avellino (AV)','Svezzati','DRGSNT81A26B045C',3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('Luigi','Mascia','MSCLGU12A24T928B','2012-10-16','piazza Risorgimento, 1 - Benevento (BN)','Lattanti','VLLLRU83A24T928B',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('Marco','Pilato','PLTMRC11A23B224X	','2011-11-08','via Ferreria, 12 - Baronissi (SA)','Semisvezzati','DCSGVN74A23B224X',3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('Matteo','Scalo','SCLMTT12L98A980I','2012-01-31','piazza Malta, 23 - Salerno (SA)	','Semisvezzati','PSSSNN85L98A980I',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('Annalisa','Scalo','SCLNNA11L98A980I','2011-11-22','piazza Malta, 23 - Salerno (SA)	','Svezzati','PSSSNN85L98A980I',3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `bambino` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bando`
--

DROP TABLE IF EXISTS `bando`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bando` (
  `id` int(11) NOT NULL,
  `data_inizio_bando` date DEFAULT NULL,
  `data_fine_bando` date DEFAULT NULL,
  `data_inizio_presentazione_rinuncia` date DEFAULT NULL,
  `data_fine_presentazione_rinuncia` date DEFAULT NULL,
  `data_fine_rinuncia` date DEFAULT NULL,
  `posti_disponibili` int(11) DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bando`
--

LOCK TABLES `bando` WRITE;
/*!40000 ALTER TABLE `bando` DISABLE KEYS */;
INSERT INTO `bando` VALUES (1,'2012-11-01','2012-11-30','0000-00-00','0000-00-00','0000-00-00',0,NULL),(2,'2011-11-01','2012-11-30','0000-00-00','0000-00-00','0000-00-00',0,NULL);
/*!40000 ALTER TABLE `bando` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `campo_domanda_questionario`
--

DROP TABLE IF EXISTS `campo_domanda_questionario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `campo_domanda_questionario` (
  `domanda_questionario` int(11) DEFAULT NULL,
  `tipo` varchar(50) DEFAULT NULL,
  `descrizione` varchar(100) DEFAULT NULL,
  `valore` varchar(50) DEFAULT NULL,
  `risposta_questionario` int(11) DEFAULT NULL,
  KEY `domanda_questionario` (`domanda_questionario`),
  KEY `risposta_questionario` (`risposta_questionario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `campo_domanda_questionario`
--

LOCK TABLES `campo_domanda_questionario` WRITE;
/*!40000 ALTER TABLE `campo_domanda_questionario` DISABLE KEYS */;
INSERT INTO `campo_domanda_questionario` VALUES (1,'radio','Lattante','Lattante',NULL),(1,'radio','Semi-divezzi','Semi-divezzi',NULL),(1,'radio','Divezzi','Divezzi',NULL),(2,'radio','Part-time senza pranzo','Part-time senza pranzo',NULL),(2,'radio','Part-time con pranzo','Part-time con pranzo',NULL),(2,'radio','Full-time','Full-time',NULL),(4,'int','Anno di nascita della madre',NULL,NULL),(4,'int','Anno di nascita del padre',NULL,NULL),(5,'int','Numero dei componenti della famiglia',NULL,NULL),(6,'tipo X','Domanda X',NULL,NULL),(7,'tipo Y','Domanda Y',NULL,NULL),(8,'tipo Z','Domanda Z',NULL,NULL),(9,'tipo ABC','Domanda ABC',NULL,NULL);
/*!40000 ALTER TABLE `campo_domanda_questionario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classe`
--

DROP TABLE IF EXISTS `classe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `classe` (
  `id` int(11) NOT NULL,
  `stato_classe` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classe`
--

LOCK TABLES `classe` WRITE;
/*!40000 ALTER TABLE `classe` DISABLE KEYS */;
INSERT INTO `classe` VALUES (1,'Approvata'),(2,''),(3,''),(4,'');
/*!40000 ALTER TABLE `classe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compila`
--

DROP TABLE IF EXISTS `compila`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `compila` (
  `questionario` int(11) DEFAULT NULL,
  `genitore` varchar(50) DEFAULT NULL,
  KEY `questionario` (`questionario`),
  KEY `genitore` (`genitore`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compila`
--

LOCK TABLES `compila` WRITE;
/*!40000 ALTER TABLE `compila` DISABLE KEYS */;
/*!40000 ALTER TABLE `compila` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contestazione`
--

DROP TABLE IF EXISTS `contestazione`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contestazione` (
  `id` int(5) NOT NULL,
  `data` date DEFAULT NULL,
  `descrizione` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contestazione`
--

LOCK TABLES `contestazione` WRITE;
/*!40000 ALTER TABLE `contestazione` DISABLE KEYS */;
/*!40000 ALTER TABLE `contestazione` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `domanda_iscrizione`
--

DROP TABLE IF EXISTS `domanda_iscrizione`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `domanda_iscrizione` (
  `id` int(11) NOT NULL,
  `data_presentazione` date DEFAULT NULL,
  `punteggio` int(50) DEFAULT NULL,
  `posizione` int(50) DEFAULT NULL,
  `genitore` varchar(50) DEFAULT NULL,
  `servizio` int(11) DEFAULT NULL,
  `bambino` varchar(50) DEFAULT NULL,
  `stato_domanda` varchar(50) DEFAULT 'DomandaNonCompilata',
  `certificato_malattie` varchar(20) DEFAULT NULL,
  `certificato_vaccinazioni` varchar(20) DEFAULT NULL,
  `certificato_privacy` varchar(20) DEFAULT NULL,
  `bambino_disabile` tinyint(1) DEFAULT NULL,
  `genitore_invalido` tinyint(1) DEFAULT NULL,
  `genitore_solo` tinyint(1) DEFAULT NULL,
  `genitore_vedovo` tinyint(1) DEFAULT NULL,
  `genitore_nubile` tinyint(1) DEFAULT NULL,
  `genitore_separato` tinyint(1) DEFAULT NULL,
  `figlio_non_riconosciuto` tinyint(1) DEFAULT NULL,
  `affido_esclusivo` tinyint(1) DEFAULT NULL,
  `altri_componenti_disabili` tinyint(1) DEFAULT NULL,
  `condizioni_calcolo_punteggio` text,
  `isee` float DEFAULT NULL,
  `stato_convalidazione` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `genitore` (`genitore`),
  KEY `bambino` (`bambino`),
  KEY `servizio` (`servizio`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `domanda_iscrizione`
--

LOCK TABLES `domanda_iscrizione` WRITE;
/*!40000 ALTER TABLE `domanda_iscrizione` DISABLE KEYS */;
INSERT INTO `domanda_iscrizione` VALUES (1,'2012-07-19',94,1,'CVLMRA69A23B333C',1,'CVLRRA12A23B333C','','','','',0,0,0,0,0,0,0,0,0,'',0,NULL),(2,'2012-08-13',93,2,'DBNGPP69A23B222C',7,'DBNLCU11A23B222C','','','','',0,0,0,0,0,0,0,0,0,'',0,NULL),(3,'2012-08-13',94,3,'DBNGPP69A23B222C',8,'DBNMRA11A23B222C','','','','',0,0,0,0,0,0,0,0,0,'',0,NULL),(4,'2012-11-01',91,4,'DFZNDR91L14A909D',2,'DFZGNN12L14A909D','','','','',0,0,0,0,0,0,0,0,0,'',0,NULL),(5,'2012-06-12',90,5,'DRGSNT81A26B045C',5,'DRGCND10A26B045C','','','','',0,0,0,0,0,0,0,0,0,'',0,NULL),(6,'2012-09-25',88,6,'VLLLRU83A24T928B',6,'MSCLGU12A24T928B','','','','',0,0,0,0,0,0,0,0,0,'',0,NULL),(7,'2012-08-01',85,7,'DCSGVN74A23B224X',9,'PLTMRC11A23B224X ','','','','',0,0,0,0,0,0,0,0,0,'',0,NULL),(8,'2012-08-28',79,8,'PSSSNN85L98A980I',4,'SCLMTT12L98A980I','','','','',0,0,0,0,0,0,0,0,0,'',0,NULL),(9,'2012-08-28',79,9,'PSSSNN85L98A980I',3,'SCLNNA11L98A980I','','','','',0,0,0,0,0,0,0,0,0,'',0,NULL);
/*!40000 ALTER TABLE `domanda_iscrizione` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `domanda_questionario`
--

DROP TABLE IF EXISTS `domanda_questionario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `domanda_questionario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descrizione` varchar(100) DEFAULT NULL,
  `questionario` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `questionario` (`questionario`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `domanda_questionario`
--

LOCK TABLES `domanda_questionario` WRITE;
/*!40000 ALTER TABLE `domanda_questionario` DISABLE KEYS */;
INSERT INTO `domanda_questionario` VALUES (1,'Sezione di appartenenza del bambino',1),(2,'Regime di frequenza del bambino',1),(4,'Anno di nascita dei genitori',1),(5,'Numero dei componenti della famiglia',1),(6,'Domanda X',2),(7,'Domanda Y',2),(8,'Domanda Z',2);
/*!40000 ALTER TABLE `domanda_questionario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `educatore_didattico`
--

DROP TABLE IF EXISTS `educatore_didattico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `educatore_didattico` (
  `nome` varchar(50) DEFAULT NULL,
  `cognome` varchar(50) DEFAULT NULL,
  `codice_fiscale` varchar(50) NOT NULL,
  `titolo_di_studi` varchar(50) DEFAULT NULL,
  `data_di_nascita` date DEFAULT NULL,
  `telefono` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `comune_di_nascita` varchar(50) DEFAULT NULL,
  `indirizzo_residenza` varchar(50) DEFAULT NULL,
  `numero_civico_residenza` varchar(10) DEFAULT NULL,
  `cap_residenza` varchar(10) DEFAULT NULL,
  `comune_residenza` varchar(100) DEFAULT NULL,
  `provincia_residenza` varchar(50) DEFAULT NULL,
  `cittadinanza` varchar(50) DEFAULT NULL,
  `indirizzo_domicilio` varchar(100) DEFAULT NULL,
  `numero_civico_domicilio` varchar(10) DEFAULT NULL,
  `cap_domicilio` varchar(10) DEFAULT NULL,
  `comune_domicilio` varchar(50) DEFAULT NULL,
  `provincia_domicilio` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`codice_fiscale`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `educatore_didattico`
--

LOCK TABLES `educatore_didattico` WRITE;
/*!40000 ALTER TABLE `educatore_didattico` DISABLE KEYS */;
INSERT INTO `educatore_didattico` VALUES ('Mauro','Sisillo','SLLMRA90A29N830P','Laurea in Lettere',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','0','0','',''),('Lorella','Sessa','SSSLRL78B19B908X','Laurea in Scienze della Formazione',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','0','0','',''),('Elena','Teresi','TRSLNE99S30X203Y','Laurea in Matematica',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','0','0','','');
/*!40000 ALTER TABLE `educatore_didattico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evento`
--

DROP TABLE IF EXISTS `evento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `evento` (
  `nome` varchar(50) NOT NULL DEFAULT '',
  `data` date NOT NULL DEFAULT '0000-00-00',
  `descrizione` varchar(100) DEFAULT NULL,
  `personale_asilo` varchar(50) DEFAULT NULL,
  `psico_pedagogo` varchar(50) DEFAULT NULL,
  `educatore_didattico` varchar(50) DEFAULT NULL,
  `path` varchar(256) DEFAULT NULL,
  `tipo` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`nome`,`data`),
  KEY `personale_asilo` (`personale_asilo`),
  KEY `psico_pedagogo` (`psico_pedagogo`),
  KEY `educatore_didattico` (`educatore_didattico`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evento`
--

LOCK TABLES `evento` WRITE;
/*!40000 ALTER TABLE `evento` DISABLE KEYS */;
INSERT INTO `evento` VALUES ('Gita X','2012-11-21','Gita a X','','SSSLRL78B19B908X',NULL,NULL,NULL),('Recita Y','2012-11-30','Recita su Y',NULL,'VRRMDD64T32A048N',NULL,NULL,NULL);
/*!40000 ALTER TABLE `evento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `extra`
--

DROP TABLE IF EXISTS `extra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `extra` (
  `id` int(11) NOT NULL,
  `importo` float DEFAULT NULL,
  `data_inizio` date DEFAULT NULL,
  `data_fine` date DEFAULT NULL,
  `descrizione` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `extra`
--

LOCK TABLES `extra` WRITE;
/*!40000 ALTER TABLE `extra` DISABLE KEYS */;
INSERT INTO `extra` VALUES (1,15,'2012-11-01','2012-11-30','Mantenimento bambino fuori orario'),(2,120,'2012-07-01','2012-07-31','Servizio di intrattenimento optional');
/*!40000 ALTER TABLE `extra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fattura`
--

DROP TABLE IF EXISTS `fattura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fattura` (
  `id` int(11) NOT NULL,
  `descrizione` varchar(100) DEFAULT NULL,
  `personale_asilo` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `personale_asilo` (`personale_asilo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fattura`
--

LOCK TABLES `fattura` WRITE;
/*!40000 ALTER TABLE `fattura` DISABLE KEYS */;
/*!40000 ALTER TABLE `fattura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `feedback` (
  `id` int(11) NOT NULL,
  `descrizione` varchar(100) DEFAULT NULL,
  `personale_asilo` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `personale_asilo` (`personale_asilo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback`
--

LOCK TABLES `feedback` WRITE;
/*!40000 ALTER TABLE `feedback` DISABLE KEYS */;
INSERT INTO `feedback` VALUES (1,'Feedback X','MRSVRN90A32B235B'),(2,'Feedback Y','TRNDMN64L12T048Y');
/*!40000 ALTER TABLE `feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genitore`
--

DROP TABLE IF EXISTS `genitore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `genitore` (
  `nome` varchar(50) DEFAULT NULL,
  `cognome` varchar(50) DEFAULT NULL,
  `codice_fiscale` varchar(50) NOT NULL,
  `telefono` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `data_di_nascita` date DEFAULT NULL,
  `comune_di_nascita` varchar(50) DEFAULT NULL,
  `indirizzo_residenza` varchar(50) DEFAULT NULL,
  `tipo` varchar(50) DEFAULT NULL,
  `categoria_appartenenza` varchar(50) DEFAULT NULL,
  `cittadinanza` varchar(50) DEFAULT NULL,
  `comune_residenza` varchar(100) DEFAULT NULL,
  `numero_civico_residenza` varchar(10) DEFAULT NULL,
  `cap_residenza` varchar(10) DEFAULT NULL,
  `provincia_residenza` varchar(50) DEFAULT NULL,
  `comune_domicilio` varchar(50) DEFAULT NULL,
  `indirizzo_domicilio` varchar(100) DEFAULT NULL,
  `numero_civico_domicilio` varchar(10) DEFAULT NULL,
  `cap_domicilio` varchar(10) DEFAULT NULL,
  `provincia_domicilio` varchar(100) DEFAULT NULL,
  `dipendente_presso` varchar(200) DEFAULT NULL,
  `rapporti_ateneo_salerno` text,
  `rapporti_comune_fisciano` text,
  `rapporto_parentela` varchar(50) DEFAULT NULL,
  `status_lavorativo` varchar(100) DEFAULT NULL,
  `scadenza_contratto` date DEFAULT NULL,
  `condizione_lavorativa` varchar(50) DEFAULT NULL,
  `tipo_contratto` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`codice_fiscale`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genitore`
--

LOCK TABLES `genitore` WRITE;
/*!40000 ALTER TABLE `genitore` DISABLE KEYS */;
INSERT INTO `genitore` VALUES ('Mauro','Chiavelli','CVLMRA69A23B333C','0899601239','mchiav@hotmail.it','1969-11-20','Pontecagnano (SA)','via Roma, 2 - Fisciano (SA)','RESIDENTE','ISCRITTO','','','0','0','','','','0','0','','','','','','','0000-00-00',NULL,NULL),('Giuseppe','Del Buono','DBNGPP69A23B222C','0612345678','gdb@msn.it','1969-11-06','Roma','via degli Ulivi, 16 - 00100 Roma','INSEGNANTE','ISCRITTO','','','0','0','','','','0','0','','','','','','','0000-00-00',NULL,NULL),('Giovanna','Di Costanzo','DCSGVN74A23B224X','0828123456','gds@hotmail.it','1974-12-30','Barano d\'Ischia (NA)','via Ferreria, 12 - Baronissi (SA)','INSEGNANTE','ISCRITTO','','','0','0','','','','0','0','','','','','','','0000-00-00',NULL,NULL),('Andrea','De Fazio','DFZNDR91L14A909D','0894215524','adf@msn.com','1991-11-22','Vallo della Lucania (SA)','via delle X, 69 - Vallo della Lucania (SA)','STUDENTE','ISCRITTO','','','0','0','','','','0','0','','','','','','','0000-00-00',NULL,NULL),('Santo','Del Regno','DRGSNT81A26B045C','0823120345','sdr@msn.com','1981-10-04','Avellino (AV)','via delle Y, 10 - Avellino (AV)','NON-RESIDENTE','ISCRITTO','','','0','0','','','','0','0','','','','','','','0000-00-00',NULL,NULL),('Susanna','Passaro','PSSSNN85L98A980I','0822334556','spassaro@virgilio.it','1985-11-08','Salerno','piazza Malta, 23 - Salerno (SA)','STUDENTE','ISCRITTO','','','0','0','','','','0','0','','','','','','','0000-00-00',NULL,NULL),('Laura','Vella','VLLLRU83A24T928B','0829718235','laurav@yahoo.it','1983-03-15','Cautano (BN)','piazza Risorgimento, 1 - Benevento (BN)','INSEGNANTE','ISCRITTO','','','0','0','','','','0','0','','','','','','','0000-00-00',NULL,NULL);
/*!40000 ALTER TABLE `genitore` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `insegna`
--

DROP TABLE IF EXISTS `insegna`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `insegna` (
  `educatore_didattico` varchar(50) DEFAULT NULL,
  `classe` int(11) DEFAULT NULL,
  KEY `educatore_didattico` (`educatore_didattico`),
  KEY `classe` (`classe`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `insegna`
--

LOCK TABLES `insegna` WRITE;
/*!40000 ALTER TABLE `insegna` DISABLE KEYS */;
INSERT INTO `insegna` VALUES ('1',1),('1',2),('1',3),('2',1),('2',2),('2',3),('3',1),('3',2),('3',3);
/*!40000 ALTER TABLE `insegna` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `massimo`
--

DROP TABLE IF EXISTS `massimo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `massimo` (
  `id` int(5) NOT NULL,
  `valore` varchar(10) DEFAULT NULL,
  `personale_asilo` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `personale_asilo` (`personale_asilo`),
  CONSTRAINT `massimo_ibfk_1` FOREIGN KEY (`personale_asilo`) REFERENCES `personale_asilo` (`codice_fiscale`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `massimo`
--

LOCK TABLES `massimo` WRITE;
/*!40000 ALTER TABLE `massimo` DISABLE KEYS */;
INSERT INTO `massimo` VALUES (2,'4','SNTNTN53N69B309D');
/*!40000 ALTER TABLE `massimo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_mensa`
--

DROP TABLE IF EXISTS `menu_mensa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu_mensa` (
  `categoria_bambino` varchar(50) DEFAULT NULL,
  `tipologia` varchar(50) DEFAULT NULL,
  `primo_piatto` varchar(50) DEFAULT NULL,
  `secondo_piatto` varchar(50) DEFAULT NULL,
  `frutta` varchar(50) DEFAULT NULL,
  `data` date DEFAULT NULL,
  `id` int(11) NOT NULL,
  `contorno` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_mensa`
--

LOCK TABLES `menu_mensa` WRITE;
/*!40000 ALTER TABLE `menu_mensa` DISABLE KEYS */;
INSERT INTO `menu_mensa` VALUES ('Svezzati','Carne','Pasta al ragù','Cotoletta di pollo','Banana','2012-11-08',1,NULL),('Svezzati','Pesce','Pasta al pomodoro','Bastoncini di merluzzo','Pera','2012-11-22',2,NULL);
/*!40000 ALTER TABLE `menu_mensa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nota`
--

DROP TABLE IF EXISTS `nota`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nota` (
  `titolo` varchar(50) NOT NULL,
  `descrizione` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`titolo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nota`
--

LOCK TABLES `nota` WRITE;
/*!40000 ALTER TABLE `nota` DISABLE KEYS */;
/*!40000 ALTER TABLE `nota` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orario_utente`
--

DROP TABLE IF EXISTS `orario_utente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orario_utente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data_inizio` date DEFAULT NULL,
  `data_fine` date DEFAULT NULL,
  `descrizione` varchar(100) DEFAULT NULL,
  `nome` varchar(50) DEFAULT NULL,
  `prezzo` float DEFAULT NULL,
  `ora_inizio` varchar(20) DEFAULT NULL,
  `ora_fine` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orario_utente`
--

LOCK TABLES `orario_utente` WRITE;
/*!40000 ALTER TABLE `orario_utente` DISABLE KEYS */;
INSERT INTO `orario_utente` VALUES (1,'2012-11-01','2012-11-30',NULL,'FULL-TIME',300,'08:00','16:00'),(2,'2012-09-17','2012-09-30',NULL,'PART-TIME mattutino',NULL,NULL,NULL);
/*!40000 ALTER TABLE `orario_utente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `partecipa`
--

DROP TABLE IF EXISTS `partecipa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `partecipa` (
  `evento_data` date DEFAULT NULL,
  `evento_nome` varchar(50) DEFAULT NULL,
  `classe` int(11) DEFAULT NULL,
  KEY `evento_data` (`evento_data`),
  KEY `evento_nome` (`evento_nome`),
  KEY `classe` (`classe`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `partecipa`
--

LOCK TABLES `partecipa` WRITE;
/*!40000 ALTER TABLE `partecipa` DISABLE KEYS */;
INSERT INTO `partecipa` VALUES ('2012-11-21','Gita X',2),('2012-11-30','Recita Y',3),('2012-11-21','Gita X',1),('2012-11-30','Recita Y',2),('2012-11-21','Gita X',3);
/*!40000 ALTER TABLE `partecipa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personale_asilo`
--

DROP TABLE IF EXISTS `personale_asilo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personale_asilo` (
  `nome` varchar(50) DEFAULT NULL,
  `cognome` varchar(50) DEFAULT NULL,
  `codice_fiscale` varchar(50) NOT NULL,
  `categoria_appartenenza` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `data_di_nascita` date DEFAULT NULL,
  `comune_di_nascita` varchar(50) DEFAULT NULL,
  `telefono` varchar(50) DEFAULT NULL,
  `indirizzo_residenza` varchar(50) DEFAULT NULL,
  `numero_civico_residenza` varchar(10) DEFAULT NULL,
  `cap_residenza` varchar(10) DEFAULT NULL,
  `comune_residenza` varchar(100) DEFAULT NULL,
  `provincia_residenza` varchar(50) DEFAULT NULL,
  `indirizzo_domicilio` varchar(100) DEFAULT NULL,
  `numero_civico_domicilio` varchar(10) DEFAULT NULL,
  `cap_domicilio` varchar(10) DEFAULT NULL,
  `comune_domicilio` varchar(50) DEFAULT NULL,
  `provincia_domicilio` varchar(100) DEFAULT NULL,
  `cittadinanza` varchar(50) DEFAULT NULL,
  `richiesta_tirocinante` int(5) DEFAULT NULL,
  `registro_tirocinante` int(5) DEFAULT NULL,
  PRIMARY KEY (`codice_fiscale`),
  KEY `richiesta_tirocinante` (`richiesta_tirocinante`),
  KEY `registro_tirocinante` (`registro_tirocinante`),
  CONSTRAINT `personale_asilo_ibfk_1` FOREIGN KEY (`richiesta_tirocinante`) REFERENCES `richiesta_tirocinante` (`id`),
  CONSTRAINT `personale_asilo_ibfk_2` FOREIGN KEY (`registro_tirocinante`) REFERENCES `registro_tirocinante` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personale_asilo`
--

LOCK TABLES `personale_asilo` WRITE;
/*!40000 ALTER TABLE `personale_asilo` DISABLE KEYS */;
INSERT INTO `personale_asilo` VALUES ('Silvana','Buselli','BSLSVN62L12B099E','IMPIEGATO SEGRETERIA','sbuselli@yahoo.it',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('Veronica','Mars','MRSVRN90A32B235B','IMPIEGATO SEGRETERIA','vmars@libero.it',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('Antonella','Senatore','SNTNTN53N69B309D','DIRETTORE','asenatore@yahoo.it',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('Domenico','Tranfa','TRNDMN64L12T048Y','IMPIEGATO SEGRETERIA','dtranfa@yahoo.it',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `personale_asilo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `possiede`
--

DROP TABLE IF EXISTS `possiede`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `possiede` (
  `retta` int(11) DEFAULT NULL,
  `extra` int(11) DEFAULT NULL,
  KEY `retta` (`retta`),
  KEY `extra` (`extra`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `possiede`
--

LOCK TABLES `possiede` WRITE;
/*!40000 ALTER TABLE `possiede` DISABLE KEYS */;
INSERT INTO `possiede` VALUES (1,1),(4,2),(3,2),(2,1);
/*!40000 ALTER TABLE `possiede` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `programma_educativo_settimanale`
--

DROP TABLE IF EXISTS `programma_educativo_settimanale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `programma_educativo_settimanale` (
  `id` int(11) NOT NULL,
  `settimana` varchar(50) DEFAULT NULL,
  `descrizione` varchar(100) DEFAULT NULL,
  `obiettivi` varchar(50) DEFAULT NULL,
  `psico_pedagogo` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `psico_pedagogo` (`psico_pedagogo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `programma_educativo_settimanale`
--

LOCK TABLES `programma_educativo_settimanale` WRITE;
/*!40000 ALTER TABLE `programma_educativo_settimanale` DISABLE KEYS */;
INSERT INTO `programma_educativo_settimanale` VALUES (1,'10-16/10/2012','Programma educativo X','X del bambino','DMLLFN71L12A333B'),(2,'17-23/10/2012','Programma educativo Y','Y del bambino','DMLLFN71L12A333B'),(3,'1-7/12/2012','Programma Educativo Z','Z del bambino','VRRMDD64T32A048N');
/*!40000 ALTER TABLE `programma_educativo_settimanale` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `psico_pedagogo`
--

DROP TABLE IF EXISTS `psico_pedagogo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `psico_pedagogo` (
  `nome` varchar(50) DEFAULT NULL,
  `cognome` varchar(50) DEFAULT NULL,
  `codice_fiscale` varchar(50) NOT NULL,
  `telefono` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `data_di_nascita` date DEFAULT NULL,
  `comune_di_nascita` varchar(50) DEFAULT NULL,
  `indirizzo_residenza` varchar(50) DEFAULT NULL,
  `numero_classi` int(50) DEFAULT NULL,
  `numero_civico_residenza` varchar(10) DEFAULT NULL,
  `cap_residenza` varchar(10) DEFAULT NULL,
  `comune_residenza` varchar(100) DEFAULT NULL,
  `provincia_residenza` varchar(50) DEFAULT NULL,
  `indirizzo_domicilio` varchar(100) DEFAULT NULL,
  `numero_civico_domicilio` varchar(10) DEFAULT NULL,
  `cap_domicilio` varchar(10) DEFAULT NULL,
  `comune_domicilio` varchar(50) DEFAULT NULL,
  `provincia_domicilio` varchar(100) DEFAULT NULL,
  `cittadinanza` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`codice_fiscale`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `psico_pedagogo`
--

LOCK TABLES `psico_pedagogo` WRITE;
/*!40000 ALTER TABLE `psico_pedagogo` DISABLE KEYS */;
INSERT INTO `psico_pedagogo` VALUES ('Alfonso','D\'Amelia','DMLLFN71L12A333B','0899611333','adam@hotmail.it','1971-11-13','Avellino (AV)','via Faraldo, 3 - Fisciano (SA)',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('Maddalena','Verrone','VRRMDD64T32A048N','0895818293','mverrone@alice.it','1964-11-15','Salerno (SA)','via Z, 3 - Salerno (SA)',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `psico_pedagogo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questionario`
--

DROP TABLE IF EXISTS `questionario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `questionario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `flag_rinuncia` varchar(50) DEFAULT NULL,
  `pathname` varchar(100) DEFAULT NULL,
  `periodo_inizio` date DEFAULT NULL,
  `periodo_fine` date DEFAULT NULL,
  `nome` varchar(50) DEFAULT NULL,
  `descrizione` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questionario`
--

LOCK TABLES `questionario` WRITE;
/*!40000 ALTER TABLE `questionario` DISABLE KEYS */;
INSERT INTO `questionario` VALUES (1,NULL,NULL,'2012-12-06','2012-12-20','Controllo qualità','QUESTIONARIO CONTROLLO QUALITA’ ASILO NIDO - GRADIMENTO DEI GENITORI'),(2,NULL,NULL,'2012-11-01','2012-12-18','Questionario X','Questionario relativo a X');
/*!40000 ALTER TABLE `questionario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registro`
--

DROP TABLE IF EXISTS `registro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `registro` (
  `id` int(11) NOT NULL,
  `anno` varchar(50) DEFAULT NULL,
  `classe` int(11) DEFAULT NULL,
  `educatore_didattico` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `classe` (`classe`),
  KEY `educatore_didattico` (`educatore_didattico`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registro`
--

LOCK TABLES `registro` WRITE;
/*!40000 ALTER TABLE `registro` DISABLE KEYS */;
/*!40000 ALTER TABLE `registro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registro_tirocinante`
--

DROP TABLE IF EXISTS `registro_tirocinante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `registro_tirocinante` (
  `id` int(5) NOT NULL,
  `descrizione` varchar(50) DEFAULT NULL,
  `ore_totali` varchar(10) DEFAULT NULL,
  `valutazione` varchar(150) DEFAULT NULL,
  `attivita_tirocinante` int(5) DEFAULT NULL,
  `tirocinante` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `attivita_tirocinante` (`attivita_tirocinante`),
  KEY `tirocinante` (`tirocinante`),
  CONSTRAINT `registro_tirocinante_ibfk_1` FOREIGN KEY (`attivita_tirocinante`) REFERENCES `attivita_tirocinante` (`id`),
  CONSTRAINT `registro_tirocinante_ibfk_2` FOREIGN KEY (`tirocinante`) REFERENCES `tirocinante` (`codice_fiscale`),
  CONSTRAINT `registro_tirocinante_ibfk_3` FOREIGN KEY (`tirocinante`) REFERENCES `tirocinante` (`codice_fiscale`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registro_tirocinante`
--

LOCK TABLES `registro_tirocinante` WRITE;
/*!40000 ALTER TABLE `registro_tirocinante` DISABLE KEYS */;
/*!40000 ALTER TABLE `registro_tirocinante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `responsabile_questionario`
--

DROP TABLE IF EXISTS `responsabile_questionario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `responsabile_questionario` (
  `nome` varchar(50) DEFAULT NULL,
  `cognome` varchar(50) DEFAULT NULL,
  `codice_fiscale` varchar(50) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `data_di_nascita` date DEFAULT NULL,
  `comune_di_nascita` varchar(50) DEFAULT NULL,
  `telefono` varchar(50) DEFAULT NULL,
  `indirizzo_residenza` varchar(50) DEFAULT NULL,
  `numero_civico_residenza` varchar(10) DEFAULT NULL,
  `cap_residenza` varchar(10) DEFAULT NULL,
  `comune_residenza` varchar(100) DEFAULT NULL,
  `provincia_residenza` varchar(50) DEFAULT NULL,
  `indirizzo_domicilio` varchar(100) DEFAULT NULL,
  `numero_civico_domicilio` varchar(10) DEFAULT NULL,
  `cap_domicilio` varchar(10) DEFAULT NULL,
  `comune_domicilio` varchar(100) DEFAULT NULL,
  `provincia_domicilio` varchar(50) DEFAULT NULL,
  `cittadinanza` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`codice_fiscale`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `responsabile_questionario`
--

LOCK TABLES `responsabile_questionario` WRITE;
/*!40000 ALTER TABLE `responsabile_questionario` DISABLE KEYS */;
INSERT INTO `responsabile_questionario` VALUES ('Arturo','De Santis','DSTRTR58L32A333B','ads@live.it',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `responsabile_questionario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `responsabile_tirocini`
--

DROP TABLE IF EXISTS `responsabile_tirocini`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `responsabile_tirocini` (
  `nome` varchar(50) DEFAULT NULL,
  `cognome` varchar(50) DEFAULT NULL,
  `codice_fiscale` varchar(50) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `data_di_nascita` date DEFAULT NULL,
  `comune_di_nascita` varchar(50) DEFAULT NULL,
  `telefono` varchar(50) DEFAULT NULL,
  `indirizzo_residenza` varchar(50) DEFAULT NULL,
  `numero_civico_residenza` varchar(10) DEFAULT NULL,
  `cap_residenza` varchar(10) DEFAULT NULL,
  `comune_residenza` varchar(100) DEFAULT NULL,
  `provincia_residenza` varchar(50) DEFAULT NULL,
  `indirizzo_domicilio` varchar(100) DEFAULT NULL,
  `numero_civico_domicilio` varchar(10) DEFAULT NULL,
  `cap_domicilio` varchar(10) DEFAULT NULL,
  `comune_domicilio` varchar(100) DEFAULT NULL,
  `provincia_domicilio` varchar(50) DEFAULT NULL,
  `cittadinanza` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`codice_fiscale`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `responsabile_tirocini`
--

LOCK TABLES `responsabile_tirocini` WRITE;
/*!40000 ALTER TABLE `responsabile_tirocini` DISABLE KEYS */;
INSERT INTO `responsabile_tirocini` VALUES ('Giovanni','De Blasi','DBSGVN66B12C761W','deblasi@unisa.it','1966-02-12','Caserta','0823445590','via De Gasperi','12','81100','Caserta','CE',NULL,NULL,NULL,NULL,NULL,'i');
/*!40000 ALTER TABLE `responsabile_tirocini` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `retta`
--

DROP TABLE IF EXISTS `retta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `retta` (
  `importoDovuto` double DEFAULT NULL,
  `id` int(11) NOT NULL,
  `genitore` varchar(50) DEFAULT NULL,
  `descrizioneTassa` varchar(100) DEFAULT NULL,
  `descrizioneRata` varchar(100) DEFAULT NULL,
  `data` date DEFAULT NULL,
  `importoPagato` float DEFAULT NULL,
  `nome` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `genitore` (`genitore`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `retta`
--

LOCK TABLES `retta` WRITE;
/*!40000 ALTER TABLE `retta` DISABLE KEYS */;
INSERT INTO `retta` VALUES (150,1,'CVLMRA69A23B333C','Ottobre2012','MENSILE','2012-10-10',300,'Fiorenzo Assi'),(630,2,'DBNGPP69A23B222C','','','0000-00-00',0,''),(325,3,'DCSGVN74A23B224X','','','0000-00-00',0,''),(250,4,'DFZNDR91L14A909D','','','0000-00-00',0,''),(130,5,'DRGSNT81A26B045C','','','0000-00-00',0,''),(469,6,'PSSSNN85L98A980I','','','0000-00-00',0,''),(790,7,'VLLLRU83A24T928B','','','0000-00-00',0,'');
/*!40000 ALTER TABLE `retta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `richiesta`
--

DROP TABLE IF EXISTS `richiesta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `richiesta` (
  `id` int(11) NOT NULL,
  `tipo` varchar(50) DEFAULT NULL,
  `menu_richiesto` varchar(50) DEFAULT NULL,
  `orario_richiesto` varchar(50) DEFAULT NULL,
  `allegato` varchar(100) DEFAULT NULL,
  `genitore` varchar(50) DEFAULT NULL,
  `servizio` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `genitore` (`genitore`),
  KEY `servizio` (`servizio`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `richiesta`
--

LOCK TABLES `richiesta` WRITE;
/*!40000 ALTER TABLE `richiesta` DISABLE KEYS */;
INSERT INTO `richiesta` VALUES (1,'Variazione menu','Latte per intolleranti','13.00',NULL,'CVLMRA69A23B333C	',1),(2,'Variazione menu','Menù per celiaci','12.00',NULL,'DBNGPP69A23B222C',8);
/*!40000 ALTER TABLE `richiesta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `richiesta_tirocinante`
--

DROP TABLE IF EXISTS `richiesta_tirocinante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `richiesta_tirocinante` (
  `id` int(5) NOT NULL,
  `descrizione` varchar(100) DEFAULT NULL,
  `data` date DEFAULT NULL,
  `ora_inizio` varchar(10) DEFAULT NULL,
  `ora_fine` varchar(10) DEFAULT NULL,
  `numero_tirocinanti` int(3) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `richiesta_tirocinante`
--

LOCK TABLES `richiesta_tirocinante` WRITE;
/*!40000 ALTER TABLE `richiesta_tirocinante` DISABLE KEYS */;
INSERT INTO `richiesta_tirocinante` VALUES (333455,'Colloqui con i genitori','2012-12-12','16:00','18:00',5);
/*!40000 ALTER TABLE `richiesta_tirocinante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `risposta_questionario`
--

DROP TABLE IF EXISTS `risposta_questionario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `risposta_questionario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `valore` varchar(50) DEFAULT NULL,
  `genitore` varchar(50) DEFAULT NULL,
  `domanda` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `genitore` (`genitore`),
  KEY `domanda` (`domanda`),
  CONSTRAINT `risposta_questionario_ibfk_1` FOREIGN KEY (`domanda`) REFERENCES `domanda_questionario` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=500003 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `risposta_questionario`
--

LOCK TABLES `risposta_questionario` WRITE;
/*!40000 ALTER TABLE `risposta_questionario` DISABLE KEYS */;
INSERT INTO `risposta_questionario` VALUES (500002,'5','Nobile Alessia',5);
/*!40000 ALTER TABLE `risposta_questionario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedulazione`
--

DROP TABLE IF EXISTS `schedulazione`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schedulazione` (
  `data` date NOT NULL DEFAULT '0000-00-00',
  `tirocinante` varchar(50) NOT NULL DEFAULT '',
  `massimo` int(5) DEFAULT NULL,
  PRIMARY KEY (`data`,`tirocinante`),
  KEY `tirocinante` (`tirocinante`),
  KEY `massimo` (`massimo`),
  CONSTRAINT `schedulazione_ibfk_1` FOREIGN KEY (`tirocinante`) REFERENCES `tirocinante` (`codice_fiscale`),
  CONSTRAINT `schedulazione_ibfk_2` FOREIGN KEY (`massimo`) REFERENCES `massimo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedulazione`
--

LOCK TABLES `schedulazione` WRITE;
/*!40000 ALTER TABLE `schedulazione` DISABLE KEYS */;
INSERT INTO `schedulazione` VALUES ('2012-12-06','MZZCRS91L44X098Y',2);
/*!40000 ALTER TABLE `schedulazione` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servizio`
--

DROP TABLE IF EXISTS `servizio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `servizio` (
  `orario_inizio` varchar(50) DEFAULT NULL,
  `orario_fine` varchar(50) DEFAULT NULL,
  `piano_pasto` varchar(50) DEFAULT NULL,
  `bambino` varchar(50) DEFAULT NULL,
  `orario_utente` int(11) DEFAULT NULL,
  `id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `bambino` (`bambino`),
  KEY `orario_utente` (`orario_utente`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servizio`
--

LOCK TABLES `servizio` WRITE;
/*!40000 ALTER TABLE `servizio` DISABLE KEYS */;
INSERT INTO `servizio` VALUES ('9.00','18.00','Sì','CVLRRA12A23B333C',1,1),('9.00','13.00','No','DFZGNN12L14A909D',1,2),('9.00','18.00','No','SCLNNA11L98A980I',1,3),('9.00','18.00','No','SCLMTT12L98A980I',1,4),('9.00','12.00','No','DRGCND10A26B045C',2,5),('9.00','15.00','Sì','MSCLGU12A24T928B',2,6),('12.00','18.00','Sì','DBNLCU11A23B222C',1,7),('12.00','18.00','Sì','DBNMRA11A23B222C',1,8),('11.00','16.00','Sì','PLTMRC11A23B224X ',1,9);
/*!40000 ALTER TABLE `servizio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tirocinante`
--

DROP TABLE IF EXISTS `tirocinante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tirocinante` (
  `nome` varchar(50) DEFAULT NULL,
  `cognome` varchar(50) DEFAULT NULL,
  `codice_fiscale` varchar(50) NOT NULL,
  `telefono` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `data_di_nascita` date DEFAULT NULL,
  `comune_di_nascita` varchar(50) DEFAULT NULL,
  `indirizzo_residenza` varchar(50) DEFAULT NULL,
  `titolo_di_studi` varchar(50) DEFAULT NULL,
  `ore_totali` int(11) DEFAULT NULL,
  `ore_lavoro` int(11) DEFAULT NULL,
  `personale_asilo` varchar(50) DEFAULT NULL,
  `stato` varchar(50) DEFAULT NULL,
  `matricola` varchar(50) DEFAULT NULL,
  `giudizio_finale` text,
  `numero_civico_residenza` varchar(10) DEFAULT NULL,
  `cap_residenza` varchar(10) DEFAULT NULL,
  `comune_residenza` varchar(100) DEFAULT NULL,
  `provincia_residenza` varchar(50) DEFAULT NULL,
  `indirizzo_domicilio` varchar(100) DEFAULT NULL,
  `numero_civico_domicilio` varchar(10) DEFAULT NULL,
  `cap_domicilio` varchar(10) DEFAULT NULL,
  `comune_domicilio` varchar(50) DEFAULT NULL,
  `provincia_domicilio` varchar(100) DEFAULT NULL,
  `cittadinanza` varchar(50) DEFAULT NULL,
  `tutor_esterno` varchar(50) DEFAULT NULL,
  `disponibilita` varchar(50) DEFAULT NULL,
  `contestazione` int(5) DEFAULT NULL,
  PRIMARY KEY (`codice_fiscale`),
  KEY `personale_asilo` (`personale_asilo`),
  KEY `contestazione` (`contestazione`),
  CONSTRAINT `tirocinante_ibfk_1` FOREIGN KEY (`contestazione`) REFERENCES `contestazione` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tirocinante`
--

LOCK TABLES `tirocinante` WRITE;
/*!40000 ALTER TABLE `tirocinante` DISABLE KEYS */;
INSERT INTO `tirocinante` VALUES ('Davide','Ciarmoli','CRMDVD90L12C888B','0283039103','dciarmoli@yahoo.it','1990-01-02','Benevento','Via XXIV Maggio, Benevento','Laureanda in Scienze della Formazione Primaria',300,125,'SNTNTN53N69B309D',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('Cristina','Mezzano','MZZCRS91L44X098Y','0123456789','cmezz@live.it','1991-12-11','Lacco Ameno (NA)','Via XYZ, Ischia (NA)','Laureanda in Scienze della Formazione Primaria',300,150,'BSLSVN62L12B099E',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `tirocinante` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2012-12-08 16:50:55
