DROP TABLE IF EXISTS `Trasmissione`;
DROP TABLE IF EXISTS `Utente`;

CREATE TABLE `Trasmissione` (
  `Nome` varchar(64) NOT NULL DEFAULT '',
  `Utente` varchar(16) NOT NULL REFERENCES `Utente`.`CF` ON UPDATE CASCADE ON DELETE CASCADE,
  PRIMARY KEY (`Nome`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `Utente` (
  `Nome` varchar(32) DEFAULT NULL,
  `Cognome` varchar(32) DEFAULT NULL,
  `CF` varchar(16) NOT NULL,
  PRIMARY KEY (`CF`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `Utente` WRITE;
/*!40000 ALTER TABLE `Utente` DISABLE KEYS */;
INSERT INTO `Utente` VALUES
('Pippo','Improta','PPO'),
('Tiberio','Timperi','TTRI');
/*!40000 ALTER TABLE `Utente` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `Trasmissione` WRITE;
/*!40000 ALTER TABLE `Trasmissione` DISABLE KEYS */;
INSERT INTO `Trasmissione` VALUES
('Crack si gira', 'PPO');
/*!40000 ALTER TABLE `Trasmissione` ENABLE KEYS */;
UNLOCK TABLES;
