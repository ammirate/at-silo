-- phpMyAdmin SQL Dump
-- version 3.4.9
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generato il: Dic 21, 2012 alle 17:25
-- Versione del server: 5.5.20
-- Versione PHP: 5.3.9

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `atsilo`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `account`
--

CREATE TABLE IF NOT EXISTS `account` (
  `username` varchar(50) NOT NULL,
  `password` varchar(256) DEFAULT NULL,
  `genitore` varchar(50) DEFAULT NULL,
  `personale_asilo` varchar(50) DEFAULT NULL,
  `psico_pedagogo` varchar(50) DEFAULT NULL,
  `responsabile_questionario` varchar(50) DEFAULT NULL,
  `responsabile_tirocini` varchar(50) DEFAULT NULL,
  `tirocinante` varchar(50) DEFAULT NULL,
  `educatore_didattico` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`username`),
  KEY `genitore` (`genitore`),
  KEY `personale_asilo` (`personale_asilo`),
  KEY `psico_pedagogo` (`psico_pedagogo`),
  KEY `responsabile_questionario` (`responsabile_questionario`),
  KEY `responsabile_tirocini` (`responsabile_tirocini`),
  KEY `tirocinante` (`tirocinante`),
  KEY `educatore_didattico` (`educatore_didattico`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `account`
--

INSERT INTO `account` (`username`, `password`, `genitore`, `personale_asilo`, `psico_pedagogo`, `responsabile_questionario`, `responsabile_tirocini`, `tirocinante`, `educatore_didattico`) VALUES
('a.damelia', 'alfonsoda', NULL, NULL, 'DMLLFN71L12A333B', NULL, NULL, NULL, NULL),
('a.desantis', 'arturods', NULL, NULL, NULL, 'DSTRTR58L32A333B', NULL, NULL, NULL),
('a.senatore', 'antonellas', NULL, 'SNTNTN53N69B309D', NULL, NULL, NULL, NULL, NULL),
('c.mezzano', 'cristinam', NULL, NULL, NULL, NULL, NULL, 'MZZCRS91L44X098Y', NULL),
('d.ciarmoli', 'davidec', NULL, NULL, NULL, NULL, NULL, 'CRMDVD90L12C888B', NULL),
('d.crisi', 'domenicoc', NULL, 'CRSDMN64L12T019Y', NULL, NULL, NULL, NULL, NULL),
('d.tranfa', 'domenicot', NULL, 'TRNDMN64L12T048Y', NULL, NULL, NULL, NULL, NULL),
('e.teresi', 'elenat', NULL, NULL, NULL, NULL, NULL, NULL, 'TRSLNE99S30X203Y'),
('g.deblasi', 'giovannidb', NULL, NULL, NULL, NULL, 'DBSGVN66B12C761W', NULL, NULL),
('l.sessa', 'lorellas', NULL, NULL, NULL, NULL, NULL, NULL, 'SSSLRL78B19B908X'),
('m.sisillo', 'mauros', NULL, NULL, NULL, NULL, NULL, NULL, 'SLLMRA90A29N830P'),
('m.verrone', 'maddalenav', NULL, NULL, 'VRRMDD64T32A048N', NULL, NULL, NULL, NULL),
('s.buselli', 'silvanab', NULL, 'BSLSVN62L12B099E', NULL, NULL, NULL, NULL, NULL),
('v.mars', 'veronicam', NULL, 'MRSVRN90A32B235B', NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Struttura della tabella `assenza`
--

CREATE TABLE IF NOT EXISTS `assenza` (
  `bambino` varchar(50) DEFAULT NULL,
  `data` date DEFAULT NULL,
  KEY `bambino` (`bambino`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `attivita`
--

CREATE TABLE IF NOT EXISTS `attivita` (
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
  KEY `nota` (`nota`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `attivita_tirocinante`
--

CREATE TABLE IF NOT EXISTS `attivita_tirocinante` (
  `id` int(50) NOT NULL,
  `descrizione` varchar(100) DEFAULT NULL,
  `data` date DEFAULT NULL,
  `ora_inizio` varchar(10) DEFAULT NULL,
  `ora_fine` varchar(10) DEFAULT NULL,
  `valutazione` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `attivita_tirocinante`
--

INSERT INTO `attivita_tirocinante` (`id`, `descrizione`, `data`, `ora_inizio`, `ora_fine`, `valutazione`) VALUES
(978786, 'Recita natalizia', '2012-12-21', '12:00', '13:00', 'La recita è andata a buon fine.');

-- --------------------------------------------------------

--
-- Struttura della tabella `bambino`
--

CREATE TABLE IF NOT EXISTS `bambino` (
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
  `iscrizione_classe` enum('Assegnato','NonAssegnato','ClasseDaConvalidare','Rinunciatario') DEFAULT 'NonAssegnato',
  PRIMARY KEY (`codice_fiscale`),
  KEY `classe` (`classe`),
  KEY `genitore` (`genitore`),
  KEY `cf_genitore_nonrichiedente` (`cf_genitore_nonrichiedente`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `bando`
--

CREATE TABLE IF NOT EXISTS `bando` (
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

--
-- Dump dei dati per la tabella `bando`
--

INSERT INTO `bando` (`id`, `data_inizio_bando`, `data_fine_bando`, `data_inizio_presentazione_rinuncia`, `data_fine_presentazione_rinuncia`, `data_fine_rinuncia`, `posti_disponibili`, `path`) VALUES
(1, '2012-11-01', '2012-12-18', '2013-12-21', '2013-12-21', '2013-12-21', 60, '.../Bando X');

-- --------------------------------------------------------

--
-- Struttura della tabella `campo_domanda_questionario`
--

CREATE TABLE IF NOT EXISTS `campo_domanda_questionario` (
  `domanda_questionario` int(11) DEFAULT NULL,
  `tipo` varchar(50) DEFAULT NULL,
  `descrizione` varchar(100) DEFAULT NULL,
  `valore` varchar(50) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `domanda_questionario` (`domanda_questionario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struttura della tabella `classe`
--

CREATE TABLE IF NOT EXISTS `classe` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sezione` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- Struttura della tabella `compila`
--

CREATE TABLE IF NOT EXISTS `compila` (
  `questionario` int(11) DEFAULT NULL,
  `genitore` varchar(50) DEFAULT NULL,
  KEY `questionario` (`questionario`),
  KEY `genitore` (`genitore`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `contestazione`
--

CREATE TABLE IF NOT EXISTS `contestazione` (
  `id` int(5) NOT NULL,
  `data` date DEFAULT NULL,
  `descrizione` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `contestazione`
--

INSERT INTO `contestazione` (`id`, `data`, `descrizione`) VALUES
(1, '2012-10-08', 'Contestazione X');

-- --------------------------------------------------------

--
-- Struttura della tabella `domanda_iscrizione`
--

CREATE TABLE IF NOT EXISTS `domanda_iscrizione` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nota_esclusione` varchar(200) DEFAULT NULL,
  `data_presentazione` date DEFAULT NULL,
  `punteggio` int(50) DEFAULT NULL,
  `posizione` int(50) DEFAULT NULL,
  `genitore` varchar(50) DEFAULT NULL,
  `servizio` int(11) DEFAULT NULL,
  `bambino` varchar(50) DEFAULT NULL,
  `stato_domanda` varchar(200) DEFAULT 'DomandaNonCompilata',
  `certificato_malattie` enum('Consegnato','NonConsegnato','InAttesa') DEFAULT NULL,
  `certificato_vaccinazioni` enum('Consegnato','NonConsegnato','InAttesa') DEFAULT NULL,
  `certificato_privacy` enum('Consegnato','NonConsegnato','InAttesa') DEFAULT NULL,
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
  `stato_convalidazione` enum('DomandaNonCompilata','DomandaInviataInAttesaDiGraduatoria','DomandaRifiutata','IscrizioneConfermataInAttesaDiAltriDati','DomandaNonInviata','DomandaAccettata','AttesaPresentazioneDocumenti','DomandaRitirata') DEFAULT 'DomandaNonCompilata',
  `cf_genitore_non_richiedente` varchar(16) DEFAULT NULL,
  `vaccinazioni` varchar(300) DEFAULT NULL,
  `malattie_infettive` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `genitore` (`genitore`),
  KEY `bambino` (`bambino`),
  KEY `servizio` (`servizio`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

-- --------------------------------------------------------

--
-- Struttura della tabella `domanda_questionario`
--

CREATE TABLE IF NOT EXISTS `domanda_questionario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descrizione` varchar(100) DEFAULT NULL,
  `questionario` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `questionario` (`questionario`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

-- --------------------------------------------------------

--
-- Struttura della tabella `educatore_didattico`
--

CREATE TABLE IF NOT EXISTS `educatore_didattico` (
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

--
-- Dump dei dati per la tabella `educatore_didattico`
--

INSERT INTO `educatore_didattico` (`nome`, `cognome`, `codice_fiscale`, `titolo_di_studi`, `data_di_nascita`, `telefono`, `email`, `comune_di_nascita`, `indirizzo_residenza`, `numero_civico_residenza`, `cap_residenza`, `comune_residenza`, `provincia_residenza`, `cittadinanza`, `indirizzo_domicilio`, `numero_civico_domicilio`, `cap_domicilio`, `comune_domicilio`, `provincia_domicilio`) VALUES
('Mauro', 'Sisillo', 'SLLMRA90A29N830P', 'Laurea in Lettere', '1981-12-09', '3256230103', 'm.sisillo@unisa.it', 'Benevento', 'viale Mellusi', '1234', '82100', 'Benevento', 'BN', 'Italiana', 'viale Mellusi', '123', '82100', 'Benevento', 'BN'),
('Lorella', 'Sessa', 'SSSLRL78B19B908X', 'Laurea in Scienze della Formazione', '1973-09-10', '3613677391', 'l.sessa@unisa.it', 'Avellino', 'via Appia', '22', '83100', 'Avellino', 'AV', 'Italiana', 'via Appia', '22', '83100', 'Avellino', 'AV'),
('Elena', 'Teresi', 'TRSLNE99S30X203Y', 'Laurea in Matematica', '1961-04-02', '3456789123', 'e.teresi@unisa.it', 'Salerno', 'via XY', '122', '84100', 'Salerno', 'SA', 'Italiana', 'via XY', '122', '84100', 'Salerno', 'SA');

-- --------------------------------------------------------

--
-- Struttura della tabella `evento`
--

CREATE TABLE IF NOT EXISTS `evento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL DEFAULT '',
  `data` date NOT NULL DEFAULT '2013-12-21',
  `descrizione` varchar(3000) DEFAULT NULL,
  `personale_asilo` varchar(50) DEFAULT NULL,
  `psico_pedagogo` varchar(50) DEFAULT NULL,
  `educatore_didattico` varchar(50) DEFAULT NULL,
  `path` varchar(256) DEFAULT NULL,
  `tipo` varchar(50) DEFAULT NULL,
  `cc` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `personale_asilo` (`personale_asilo`),
  KEY `psico_pedagogo` (`psico_pedagogo`),
  KEY `educatore_didattico` (`educatore_didattico`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- Struttura della tabella `extra`
--

CREATE TABLE IF NOT EXISTS `extra` (
  `id` int(11) NOT NULL,
  `importo` float DEFAULT NULL,
  `data_inizio` date DEFAULT NULL,
  `data_fine` date DEFAULT NULL,
  `descrizione` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `extra`
--

INSERT INTO `extra` (`id`, `importo`, `data_inizio`, `data_fine`, `descrizione`) VALUES
(1, 15, '2012-11-01', '2012-11-30', 'Mantenimento bambino fuori orario'),
(2, 120, '2012-07-01', '2012-07-31', 'Servizio di intrattenimento optional');

-- --------------------------------------------------------

--
-- Struttura della tabella `fattura`
--

CREATE TABLE IF NOT EXISTS `fattura` (
  `id` int(11) NOT NULL,
  `descrizione` varchar(100) DEFAULT NULL,
  `personale_asilo` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `personale_asilo` (`personale_asilo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `fattura`
--

INSERT INTO `fattura` (`id`, `descrizione`, `personale_asilo`) VALUES
(1, 'Fattura X', 'BSLSVN62L12B099E'),
(2, 'Fattura Y', 'MRSVRN90A32B235B'),
(3, 'Fattura Z', 'SNTNTN53N69B309D'),
(4, 'Fattura XYZ', 'TRNDMN64L12T048Y');

-- --------------------------------------------------------

--
-- Struttura della tabella `feedback`
--

CREATE TABLE IF NOT EXISTS `feedback` (
  `id` int(11) NOT NULL,
  `descrizione` varchar(100) DEFAULT NULL,
  `personale_asilo` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `personale_asilo` (`personale_asilo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `feedback`
--

INSERT INTO `feedback` (`id`, `descrizione`, `personale_asilo`) VALUES
(1, 'Feedback X', 'MRSVRN90A32B235B'),
(2, 'Feedback Y', 'TRNDMN64L12T048Y');

-- --------------------------------------------------------

--
-- Struttura della tabella `genitore`
--

CREATE TABLE IF NOT EXISTS `genitore` (
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
  `status_lavorativo` int(4) DEFAULT '-1',
  `scadenza_contratto` date DEFAULT NULL,
  `condizione_lavorativa` varchar(50) DEFAULT NULL,
  `tipo_contratto` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`codice_fiscale`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `insegna`
--

CREATE TABLE IF NOT EXISTS `insegna` (
  `educatore_didattico` varchar(50) DEFAULT NULL,
  `classe` int(11) DEFAULT NULL,
  KEY `educatore_didattico` (`educatore_didattico`),
  KEY `classe` (`classe`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `insegna`
--

INSERT INTO `insegna` (`educatore_didattico`, `classe`) VALUES
('SLLMRA90A29N830P', 1),
('SLLMRA90A29N830P', 2),
('SLLMRA90A29N830P', 3),
('SSSLRL78B19B908X', 1),
('SSSLRL78B19B908X', 2),
('SSSLRL78B19B908X', 3),
('TRSLNE99S30X203Y', 1),
('TRSLNE99S30X203Y', 2),
('TRSLNE99S30X203Y', 3);

-- --------------------------------------------------------

--
-- Struttura della tabella `massimo`
--

CREATE TABLE IF NOT EXISTS `massimo` (
  `id` int(5) NOT NULL,
  `valore` varchar(10) DEFAULT NULL,
  `personale_asilo` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `personale_asilo` (`personale_asilo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `massimo`
--

INSERT INTO `massimo` (`id`, `valore`, `personale_asilo`) VALUES
(2, '4', 'SNTNTN53N69B309D');

-- --------------------------------------------------------

--
-- Struttura della tabella `menu_mensa`
--

CREATE TABLE IF NOT EXISTS `menu_mensa` (
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

--
-- Dump dei dati per la tabella `menu_mensa`
--

INSERT INTO `menu_mensa` (`categoria_bambino`, `tipologia`, `primo_piatto`, `secondo_piatto`, `frutta`, `data`, `id`, `contorno`) VALUES
('Svezzati', 'Carne', 'Pasta al ragù', 'Cotoletta di pollo', 'Banana', '2012-11-08', 1, 'Patate'),
('Svezzati', 'Pesce', 'Pasta al pomodoro', 'Bastoncini di merluzzo', 'Pera', '2012-11-22', 2, 'Pesci');

-- --------------------------------------------------------

--
-- Struttura della tabella `nota`
--

CREATE TABLE IF NOT EXISTS `nota` (
  `titolo` varchar(50) NOT NULL,
  `descrizione` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`titolo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `nota`
--

INSERT INTO `nota` (`titolo`, `descrizione`) VALUES
('Nota X1', 'Descrizione Nota X1'),
('Nota X2', 'Descrizione Nota X2'),
('Nota Y1', 'Descrizione Nota Y1'),
('Nota Y2', 'Descrizione Nota Y2'),
('Nota Z1', 'Descrizione Nota Z1'),
('Nota Z2', 'Descrizione Nota Z2');

-- --------------------------------------------------------

--
-- Struttura della tabella `orario_utente`
--

CREATE TABLE IF NOT EXISTS `orario_utente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data_inizio` date DEFAULT NULL,
  `data_fine` date DEFAULT NULL,
  `descrizione` varchar(100) DEFAULT NULL,
  `nome` varchar(50) DEFAULT NULL,
  `prezzo` float DEFAULT NULL,
  `ora_inizio` varchar(20) DEFAULT NULL,
  `ora_fine` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dump dei dati per la tabella `orario_utente`
--

INSERT INTO `orario_utente` (`id`, `data_inizio`, `data_fine`, `descrizione`, `nome`, `prezzo`, `ora_inizio`, `ora_fine`) VALUES
(1, '2012-11-01', '2012-11-30', 'bla bla bla', 'FULL-TIME', 300, '08:00', '16:00'),
(2, '2012-09-17', '2012-09-30', 'gne gne gne', 'PART-TIME mattutino', 150, '8.00', '13.00'),
(3, '2012-12-04', '2013-12-24', 'lol lol lol', 'Part time pomeridiano', 150, '13.00', '16.00'),
(4, '2012-12-04', '2013-12-31', 'X Y', 'Part-time Mattina (con pranzo)', 170, '8.00', '14.00');

-- --------------------------------------------------------

--
-- Struttura della tabella `partecipa`
--

CREATE TABLE IF NOT EXISTS `partecipa` (
  `classe` int(11) DEFAULT NULL,
  `evento` int(11) NOT NULL,
  KEY `classe` (`classe`),
  KEY `evento` (`evento`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `personale_asilo`
--

CREATE TABLE IF NOT EXISTS `personale_asilo` (
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
  KEY `registro_tirocinante` (`registro_tirocinante`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `personale_asilo`
--

INSERT INTO `personale_asilo` (`nome`, `cognome`, `codice_fiscale`, `categoria_appartenenza`, `email`, `data_di_nascita`, `comune_di_nascita`, `telefono`, `indirizzo_residenza`, `numero_civico_residenza`, `cap_residenza`, `comune_residenza`, `provincia_residenza`, `indirizzo_domicilio`, `numero_civico_domicilio`, `cap_domicilio`, `comune_domicilio`, `provincia_domicilio`, `cittadinanza`, `richiesta_tirocinante`, `registro_tirocinante`) VALUES
('Silvana', 'Buselli', 'BSLSVN62L12B099E', 'impiegato_asilo', 'sbuselli@yahoo.it', '1975-12-23', 'Caserta', '1234567678', 'via XY', '69', '56789', 'Caserta', 'CE', 'via XY', '69', '56789', 'Caserta', 'CE', 'Italiana', NULL, NULL),
('Domenico', 'Crisi', 'CRSDMN64L12T019Y', 'responsabile_scientifico', 'dcrisi@yahoo.it', '1990-05-14', 'Salerno', '3456789012', 'via Lol', '1', '84100', 'Salerno', 'SA', 'via Lol', '1', '84100', 'Salerno', 'SA', 'Italiana', NULL, NULL),
('Veronica', 'Mars', 'MRSVRN90A32B235B', 'impiegato_bando', 'vmars@libero.it', '1991-04-25', 'Benevento', '2345678901', 'via Via', '8', '82100', 'Benevento', 'BN', 'via Via', '8', '82100', 'Benevento', 'BN', 'Italiana', NULL, NULL),
('Antonella', 'Senatore', 'SNTNTN53N69B309D', 'Direttore', 'asenatore@yahoo.it', '1972-11-06', 'Avellino', '5678901234', 'via No', '29', '83100', 'Avellino', 'AV', 'via No', '29', '83100', 'Avellino', 'AV', 'Italiana', NULL, NULL),
('Domenico', 'Tranfa', 'TRNDMN64L12T048Y', 'delegato_rettore', 'dtranfa@yahoo.it', '1971-11-04', 'Napoli', '7890123456', 'piazza Garibaldi', '123', '07082', 'Napoli', 'NA', 'piazza Garibaldi', '123', '07082', 'Napoli', 'NA', 'Italiana', NULL, NULL);

-- --------------------------------------------------------

--
-- Struttura della tabella `phpbb_acl_groups`
--

CREATE TABLE IF NOT EXISTS `phpbb_acl_groups` (
  `group_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `forum_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `auth_option_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `auth_role_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `auth_setting` tinyint(2) NOT NULL DEFAULT '0',
  KEY `group_id` (`group_id`),
  KEY `auth_opt_id` (`auth_option_id`),
  KEY `auth_role_id` (`auth_role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dump dei dati per la tabella `phpbb_acl_groups`
--

INSERT INTO `phpbb_acl_groups` (`group_id`, `forum_id`, `auth_option_id`, `auth_role_id`, `auth_setting`) VALUES
(1, 0, 85, 0, 1),
(1, 0, 93, 0, 1),
(1, 0, 111, 0, 1),
(5, 0, 0, 5, 0),
(5, 0, 0, 1, 0),
(2, 0, 0, 6, 0),
(3, 0, 0, 6, 0),
(4, 0, 0, 5, 0),
(4, 0, 0, 10, 0),
(7, 0, 0, 23, 0),
(5, 2, 0, 15, 0),
(6, 2, 0, 15, 0),
(4, 2, 0, 15, 0),
(7, 2, 0, 15, 0),
(2, 2, 0, 15, 0),
(2, 9, 0, 15, 0),
(5, 9, 0, 15, 0),
(6, 9, 0, 15, 0),
(4, 9, 0, 15, 0),
(7, 9, 0, 15, 0),
(2, 7, 0, 15, 0),
(5, 7, 0, 15, 0),
(6, 7, 0, 15, 0),
(4, 7, 0, 15, 0),
(7, 7, 0, 15, 0),
(2, 6, 0, 15, 0),
(5, 6, 0, 15, 0),
(6, 6, 0, 15, 0),
(4, 6, 0, 15, 0),
(7, 6, 0, 15, 0),
(5, 1, 0, 15, 0),
(1, 1, 0, 17, 0),
(7, 1, 0, 15, 0),
(2, 1, 0, 15, 0),
(6, 1, 0, 15, 0),
(4, 1, 0, 15, 0),
(2, 8, 0, 15, 0),
(5, 8, 0, 15, 0),
(6, 8, 0, 15, 0),
(4, 8, 0, 15, 0),
(7, 8, 0, 15, 0),
(1, 8, 0, 17, 0);

-- --------------------------------------------------------

--
-- Struttura della tabella `phpbb_acl_options`
--

CREATE TABLE IF NOT EXISTS `phpbb_acl_options` (
  `auth_option_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `auth_option` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT '',
  `is_global` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_local` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `founder_only` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`auth_option_id`),
  UNIQUE KEY `auth_option` (`auth_option`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=118 ;

--
-- Dump dei dati per la tabella `phpbb_acl_options`
--

INSERT INTO `phpbb_acl_options` (`auth_option_id`, `auth_option`, `is_global`, `is_local`, `founder_only`) VALUES
(1, 'f_', 0, 1, 0),
(2, 'f_announce', 0, 1, 0),
(3, 'f_attach', 0, 1, 0),
(4, 'f_bbcode', 0, 1, 0),
(5, 'f_bump', 0, 1, 0),
(6, 'f_delete', 0, 1, 0),
(7, 'f_download', 0, 1, 0),
(8, 'f_edit', 0, 1, 0),
(9, 'f_email', 0, 1, 0),
(10, 'f_flash', 0, 1, 0),
(11, 'f_icons', 0, 1, 0),
(12, 'f_ignoreflood', 0, 1, 0),
(13, 'f_img', 0, 1, 0),
(14, 'f_list', 0, 1, 0),
(15, 'f_noapprove', 0, 1, 0),
(16, 'f_poll', 0, 1, 0),
(17, 'f_post', 0, 1, 0),
(18, 'f_postcount', 0, 1, 0),
(19, 'f_print', 0, 1, 0),
(20, 'f_read', 0, 1, 0),
(21, 'f_reply', 0, 1, 0),
(22, 'f_report', 0, 1, 0),
(23, 'f_search', 0, 1, 0),
(24, 'f_sigs', 0, 1, 0),
(25, 'f_smilies', 0, 1, 0),
(26, 'f_sticky', 0, 1, 0),
(27, 'f_subscribe', 0, 1, 0),
(28, 'f_user_lock', 0, 1, 0),
(29, 'f_vote', 0, 1, 0),
(30, 'f_votechg', 0, 1, 0),
(31, 'm_', 1, 1, 0),
(32, 'm_approve', 1, 1, 0),
(33, 'm_chgposter', 1, 1, 0),
(34, 'm_delete', 1, 1, 0),
(35, 'm_edit', 1, 1, 0),
(36, 'm_info', 1, 1, 0),
(37, 'm_lock', 1, 1, 0),
(38, 'm_merge', 1, 1, 0),
(39, 'm_move', 1, 1, 0),
(40, 'm_report', 1, 1, 0),
(41, 'm_split', 1, 1, 0),
(42, 'm_ban', 1, 0, 0),
(43, 'm_warn', 1, 0, 0),
(44, 'a_', 1, 0, 0),
(45, 'a_aauth', 1, 0, 0),
(46, 'a_attach', 1, 0, 0),
(47, 'a_authgroups', 1, 0, 0),
(48, 'a_authusers', 1, 0, 0),
(49, 'a_backup', 1, 0, 0),
(50, 'a_ban', 1, 0, 0),
(51, 'a_bbcode', 1, 0, 0),
(52, 'a_board', 1, 0, 0),
(53, 'a_bots', 1, 0, 0),
(54, 'a_clearlogs', 1, 0, 0),
(55, 'a_email', 1, 0, 0),
(56, 'a_fauth', 1, 0, 0),
(57, 'a_forum', 1, 0, 0),
(58, 'a_forumadd', 1, 0, 0),
(59, 'a_forumdel', 1, 0, 0),
(60, 'a_group', 1, 0, 0),
(61, 'a_groupadd', 1, 0, 0),
(62, 'a_groupdel', 1, 0, 0),
(63, 'a_icons', 1, 0, 0),
(64, 'a_jabber', 1, 0, 0),
(65, 'a_language', 1, 0, 0),
(66, 'a_mauth', 1, 0, 0),
(67, 'a_modules', 1, 0, 0),
(68, 'a_names', 1, 0, 0),
(69, 'a_phpinfo', 1, 0, 0),
(70, 'a_profile', 1, 0, 0),
(71, 'a_prune', 1, 0, 0),
(72, 'a_ranks', 1, 0, 0),
(73, 'a_reasons', 1, 0, 0),
(74, 'a_roles', 1, 0, 0),
(75, 'a_search', 1, 0, 0),
(76, 'a_server', 1, 0, 0),
(77, 'a_styles', 1, 0, 0),
(78, 'a_switchperm', 1, 0, 0),
(79, 'a_uauth', 1, 0, 0),
(80, 'a_user', 1, 0, 0),
(81, 'a_userdel', 1, 0, 0),
(82, 'a_viewauth', 1, 0, 0),
(83, 'a_viewlogs', 1, 0, 0),
(84, 'a_words', 1, 0, 0),
(85, 'u_', 1, 0, 0),
(86, 'u_attach', 1, 0, 0),
(87, 'u_chgavatar', 1, 0, 0),
(88, 'u_chgcensors', 1, 0, 0),
(89, 'u_chgemail', 1, 0, 0),
(90, 'u_chggrp', 1, 0, 0),
(91, 'u_chgname', 1, 0, 0),
(92, 'u_chgpasswd', 1, 0, 0),
(93, 'u_download', 1, 0, 0),
(94, 'u_hideonline', 1, 0, 0),
(95, 'u_ignoreflood', 1, 0, 0),
(96, 'u_masspm', 1, 0, 0),
(97, 'u_masspm_group', 1, 0, 0),
(98, 'u_pm_attach', 1, 0, 0),
(99, 'u_pm_bbcode', 1, 0, 0),
(100, 'u_pm_delete', 1, 0, 0),
(101, 'u_pm_download', 1, 0, 0),
(102, 'u_pm_edit', 1, 0, 0),
(103, 'u_pm_emailpm', 1, 0, 0),
(104, 'u_pm_flash', 1, 0, 0),
(105, 'u_pm_forward', 1, 0, 0),
(106, 'u_pm_img', 1, 0, 0),
(107, 'u_pm_printpm', 1, 0, 0),
(108, 'u_pm_smilies', 1, 0, 0),
(109, 'u_readpm', 1, 0, 0),
(110, 'u_savedrafts', 1, 0, 0),
(111, 'u_search', 1, 0, 0),
(112, 'u_sendemail', 1, 0, 0),
(113, 'u_sendim', 1, 0, 0),
(114, 'u_sendpm', 1, 0, 0),
(115, 'u_sig', 1, 0, 0),
(116, 'u_viewonline', 1, 0, 0),
(117, 'u_viewprofile', 1, 0, 0);

-- --------------------------------------------------------

--
-- Struttura della tabella `phpbb_acl_roles`
--

CREATE TABLE IF NOT EXISTS `phpbb_acl_roles` (
  `role_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `role_name` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `role_description` text COLLATE utf8_bin NOT NULL,
  `role_type` varchar(10) COLLATE utf8_bin NOT NULL DEFAULT '',
  `role_order` smallint(4) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`role_id`),
  KEY `role_type` (`role_type`),
  KEY `role_order` (`role_order`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=25 ;

--
-- Dump dei dati per la tabella `phpbb_acl_roles`
--

INSERT INTO `phpbb_acl_roles` (`role_id`, `role_name`, `role_description`, `role_type`, `role_order`) VALUES
(1, 'ROLE_ADMIN_STANDARD', 'ROLE_DESCRIPTION_ADMIN_STANDARD', 'a_', 1),
(2, 'ROLE_ADMIN_FORUM', 'ROLE_DESCRIPTION_ADMIN_FORUM', 'a_', 3),
(3, 'ROLE_ADMIN_USERGROUP', 'ROLE_DESCRIPTION_ADMIN_USERGROUP', 'a_', 4),
(4, 'ROLE_ADMIN_FULL', 'ROLE_DESCRIPTION_ADMIN_FULL', 'a_', 2),
(5, 'ROLE_USER_FULL', 'ROLE_DESCRIPTION_USER_FULL', 'u_', 3),
(6, 'ROLE_USER_STANDARD', 'ROLE_DESCRIPTION_USER_STANDARD', 'u_', 1),
(7, 'ROLE_USER_LIMITED', 'ROLE_DESCRIPTION_USER_LIMITED', 'u_', 2),
(8, 'ROLE_USER_NOPM', 'ROLE_DESCRIPTION_USER_NOPM', 'u_', 4),
(9, 'ROLE_USER_NOAVATAR', 'ROLE_DESCRIPTION_USER_NOAVATAR', 'u_', 5),
(10, 'ROLE_MOD_FULL', 'ROLE_DESCRIPTION_MOD_FULL', 'm_', 3),
(11, 'ROLE_MOD_STANDARD', 'ROLE_DESCRIPTION_MOD_STANDARD', 'm_', 1),
(12, 'ROLE_MOD_SIMPLE', 'ROLE_DESCRIPTION_MOD_SIMPLE', 'm_', 2),
(13, 'ROLE_MOD_QUEUE', 'ROLE_DESCRIPTION_MOD_QUEUE', 'm_', 4),
(14, 'ROLE_FORUM_FULL', 'ROLE_DESCRIPTION_FORUM_FULL', 'f_', 7),
(15, 'ROLE_FORUM_STANDARD', 'ROLE_DESCRIPTION_FORUM_STANDARD', 'f_', 5),
(16, 'ROLE_FORUM_NOACCESS', 'ROLE_DESCRIPTION_FORUM_NOACCESS', 'f_', 1),
(17, 'ROLE_FORUM_READONLY', 'ROLE_DESCRIPTION_FORUM_READONLY', 'f_', 2),
(18, 'ROLE_FORUM_LIMITED', 'ROLE_DESCRIPTION_FORUM_LIMITED', 'f_', 3),
(19, 'ROLE_FORUM_BOT', 'ROLE_DESCRIPTION_FORUM_BOT', 'f_', 9),
(20, 'ROLE_FORUM_ONQUEUE', 'ROLE_DESCRIPTION_FORUM_ONQUEUE', 'f_', 8),
(21, 'ROLE_FORUM_POLLS', 'ROLE_DESCRIPTION_FORUM_POLLS', 'f_', 6),
(22, 'ROLE_FORUM_LIMITED_POLLS', 'ROLE_DESCRIPTION_FORUM_LIMITED_POLLS', 'f_', 4),
(23, 'ROLE_USER_NEW_MEMBER', 'ROLE_DESCRIPTION_USER_NEW_MEMBER', 'u_', 6),
(24, 'ROLE_FORUM_NEW_MEMBER', 'ROLE_DESCRIPTION_FORUM_NEW_MEMBER', 'f_', 10);

-- --------------------------------------------------------

--
-- Struttura della tabella `phpbb_acl_roles_data`
--

CREATE TABLE IF NOT EXISTS `phpbb_acl_roles_data` (
  `role_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `auth_option_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `auth_setting` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`role_id`,`auth_option_id`),
  KEY `ath_op_id` (`auth_option_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dump dei dati per la tabella `phpbb_acl_roles_data`
--

INSERT INTO `phpbb_acl_roles_data` (`role_id`, `auth_option_id`, `auth_setting`) VALUES
(1, 44, 1),
(1, 46, 1),
(1, 47, 1),
(1, 48, 1),
(1, 50, 1),
(1, 51, 1),
(1, 52, 1),
(1, 56, 1),
(1, 57, 1),
(1, 58, 1),
(1, 59, 1),
(1, 60, 1),
(1, 61, 1),
(1, 62, 1),
(1, 63, 1),
(1, 66, 1),
(1, 68, 1),
(1, 70, 1),
(1, 71, 1),
(1, 72, 1),
(1, 73, 1),
(1, 79, 1),
(1, 80, 1),
(1, 81, 1),
(1, 82, 1),
(1, 83, 1),
(1, 84, 1),
(2, 44, 1),
(2, 47, 1),
(2, 48, 1),
(2, 56, 1),
(2, 57, 1),
(2, 58, 1),
(2, 59, 1),
(2, 66, 1),
(2, 71, 1),
(2, 79, 1),
(2, 82, 1),
(2, 83, 1),
(3, 44, 1),
(3, 47, 1),
(3, 48, 1),
(3, 50, 1),
(3, 60, 1),
(3, 61, 1),
(3, 62, 1),
(3, 72, 1),
(3, 79, 1),
(3, 80, 1),
(3, 82, 1),
(3, 83, 1),
(4, 44, 1),
(4, 45, 1),
(4, 46, 1),
(4, 47, 1),
(4, 48, 1),
(4, 49, 1),
(4, 50, 1),
(4, 51, 1),
(4, 52, 1),
(4, 53, 1),
(4, 54, 1),
(4, 55, 1),
(4, 56, 1),
(4, 57, 1),
(4, 58, 1),
(4, 59, 1),
(4, 60, 1),
(4, 61, 1),
(4, 62, 1),
(4, 63, 1),
(4, 64, 1),
(4, 65, 1),
(4, 66, 1),
(4, 67, 1),
(4, 68, 1),
(4, 69, 1),
(4, 70, 1),
(4, 71, 1),
(4, 72, 1),
(4, 73, 1),
(4, 74, 1),
(4, 75, 1),
(4, 76, 1),
(4, 77, 1),
(4, 78, 1),
(4, 79, 1),
(4, 80, 1),
(4, 81, 1),
(4, 82, 1),
(4, 83, 1),
(4, 84, 1),
(5, 85, 1),
(5, 86, 1),
(5, 87, 1),
(5, 88, 1),
(5, 89, 1),
(5, 90, 1),
(5, 91, 1),
(5, 92, 1),
(5, 93, 1),
(5, 94, 1),
(5, 95, 1),
(5, 96, 1),
(5, 97, 1),
(5, 98, 1),
(5, 99, 1),
(5, 100, 1),
(5, 101, 1),
(5, 102, 1),
(5, 103, 1),
(5, 104, 1),
(5, 105, 1),
(5, 106, 1),
(5, 107, 1),
(5, 108, 1),
(5, 109, 1),
(5, 110, 1),
(5, 111, 1),
(5, 112, 1),
(5, 113, 1),
(5, 114, 1),
(5, 115, 1),
(5, 116, 1),
(5, 117, 1),
(6, 85, 1),
(6, 86, 1),
(6, 87, 1),
(6, 88, 1),
(6, 89, 1),
(6, 92, 1),
(6, 93, 1),
(6, 94, 1),
(6, 96, 1),
(6, 97, 1),
(6, 98, 1),
(6, 99, 1),
(6, 100, 1),
(6, 101, 1),
(6, 102, 1),
(6, 103, 1),
(6, 106, 1),
(6, 107, 1),
(6, 108, 1),
(6, 109, 1),
(6, 110, 1),
(6, 111, 1),
(6, 112, 1),
(6, 113, 1),
(6, 114, 1),
(6, 115, 1),
(6, 117, 1),
(7, 85, 1),
(7, 87, 1),
(7, 88, 1),
(7, 89, 1),
(7, 92, 1),
(7, 93, 1),
(7, 94, 1),
(7, 99, 1),
(7, 100, 1),
(7, 101, 1),
(7, 102, 1),
(7, 105, 1),
(7, 106, 1),
(7, 107, 1),
(7, 108, 1),
(7, 109, 1),
(7, 114, 1),
(7, 115, 1),
(7, 117, 1),
(8, 85, 1),
(8, 87, 1),
(8, 88, 1),
(8, 89, 1),
(8, 92, 1),
(8, 93, 1),
(8, 94, 1),
(8, 96, 0),
(8, 97, 0),
(8, 109, 0),
(8, 114, 0),
(8, 115, 1),
(8, 117, 1),
(9, 85, 1),
(9, 87, 0),
(9, 88, 1),
(9, 89, 1),
(9, 92, 1),
(9, 93, 1),
(9, 94, 1),
(9, 99, 1),
(9, 100, 1),
(9, 101, 1),
(9, 102, 1),
(9, 105, 1),
(9, 106, 1),
(9, 107, 1),
(9, 108, 1),
(9, 109, 1),
(9, 114, 1),
(9, 115, 1),
(9, 117, 1),
(10, 31, 1),
(10, 32, 1),
(10, 33, 1),
(10, 34, 1),
(10, 35, 1),
(10, 36, 1),
(10, 37, 1),
(10, 38, 1),
(10, 39, 1),
(10, 40, 1),
(10, 41, 1),
(10, 42, 1),
(10, 43, 1),
(11, 31, 1),
(11, 32, 1),
(11, 34, 1),
(11, 35, 1),
(11, 36, 1),
(11, 37, 1),
(11, 38, 1),
(11, 39, 1),
(11, 40, 1),
(11, 41, 1),
(11, 43, 1),
(12, 31, 1),
(12, 34, 1),
(12, 35, 1),
(12, 36, 1),
(12, 40, 1),
(13, 31, 1),
(13, 32, 1),
(13, 35, 1),
(14, 1, 1),
(14, 2, 1),
(14, 3, 1),
(14, 4, 1),
(14, 5, 1),
(14, 6, 1),
(14, 7, 1),
(14, 8, 1),
(14, 9, 1),
(14, 10, 1),
(14, 11, 1),
(14, 12, 1),
(14, 13, 1),
(14, 14, 1),
(14, 15, 1),
(14, 16, 1),
(14, 17, 1),
(14, 18, 1),
(14, 19, 1),
(14, 20, 1),
(14, 21, 1),
(14, 22, 1),
(14, 23, 1),
(14, 24, 1),
(14, 25, 1),
(14, 26, 1),
(14, 27, 1),
(14, 28, 1),
(14, 29, 1),
(14, 30, 1),
(15, 1, 1),
(15, 3, 1),
(15, 4, 1),
(15, 5, 1),
(15, 6, 1),
(15, 7, 1),
(15, 8, 1),
(15, 9, 1),
(15, 11, 1),
(15, 13, 1),
(15, 14, 1),
(15, 15, 1),
(15, 17, 1),
(15, 18, 1),
(15, 19, 1),
(15, 20, 1),
(15, 21, 1),
(15, 22, 1),
(15, 23, 1),
(15, 24, 1),
(15, 25, 1),
(15, 27, 1),
(15, 29, 1),
(15, 30, 1),
(16, 1, 0),
(17, 1, 1),
(17, 7, 1),
(17, 14, 1),
(17, 19, 1),
(17, 20, 1),
(17, 23, 1),
(17, 27, 1),
(18, 1, 1),
(18, 4, 1),
(18, 7, 1),
(18, 8, 1),
(18, 9, 1),
(18, 13, 1),
(18, 14, 1),
(18, 15, 1),
(18, 17, 1),
(18, 18, 1),
(18, 19, 1),
(18, 20, 1),
(18, 21, 1),
(18, 22, 1),
(18, 23, 1),
(18, 24, 1),
(18, 25, 1),
(18, 27, 1),
(18, 29, 1),
(19, 1, 1),
(19, 7, 1),
(19, 14, 1),
(19, 19, 1),
(19, 20, 1),
(20, 1, 1),
(20, 3, 1),
(20, 4, 1),
(20, 7, 1),
(20, 8, 1),
(20, 9, 1),
(20, 13, 1),
(20, 14, 1),
(20, 15, 0),
(20, 17, 1),
(20, 18, 1),
(20, 19, 1),
(20, 20, 1),
(20, 21, 1),
(20, 22, 1),
(20, 23, 1),
(20, 24, 1),
(20, 25, 1),
(20, 27, 1),
(20, 29, 1),
(21, 1, 1),
(21, 3, 1),
(21, 4, 1),
(21, 5, 1),
(21, 6, 1),
(21, 7, 1),
(21, 8, 1),
(21, 9, 1),
(21, 11, 1),
(21, 13, 1),
(21, 14, 1),
(21, 15, 1),
(21, 16, 1),
(21, 17, 1),
(21, 18, 1),
(21, 19, 1),
(21, 20, 1),
(21, 21, 1),
(21, 22, 1),
(21, 23, 1),
(21, 24, 1),
(21, 25, 1),
(21, 27, 1),
(21, 29, 1),
(21, 30, 1),
(22, 1, 1),
(22, 4, 1),
(22, 7, 1),
(22, 8, 1),
(22, 9, 1),
(22, 13, 1),
(22, 14, 1),
(22, 15, 1),
(22, 16, 1),
(22, 17, 1),
(22, 18, 1),
(22, 19, 1),
(22, 20, 1),
(22, 21, 1),
(22, 22, 1),
(22, 23, 1),
(22, 24, 1),
(22, 25, 1),
(22, 27, 1),
(22, 29, 1),
(23, 96, 0),
(23, 97, 0),
(23, 114, 0),
(24, 15, 0);

-- --------------------------------------------------------

--
-- Struttura della tabella `phpbb_acl_users`
--

CREATE TABLE IF NOT EXISTS `phpbb_acl_users` (
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `forum_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `auth_option_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `auth_role_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `auth_setting` tinyint(2) NOT NULL DEFAULT '0',
  KEY `user_id` (`user_id`),
  KEY `auth_option_id` (`auth_option_id`),
  KEY `auth_role_id` (`auth_role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dump dei dati per la tabella `phpbb_acl_users`
--

INSERT INTO `phpbb_acl_users` (`user_id`, `forum_id`, `auth_option_id`, `auth_role_id`, `auth_setting`) VALUES
(2, 0, 0, 5, 0);

-- --------------------------------------------------------

--
-- Struttura della tabella `phpbb_attachments`
--

CREATE TABLE IF NOT EXISTS `phpbb_attachments` (
  `attach_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `post_msg_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `topic_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `in_message` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `poster_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `is_orphan` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `physical_filename` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `real_filename` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `download_count` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `attach_comment` text COLLATE utf8_bin NOT NULL,
  `extension` varchar(100) COLLATE utf8_bin NOT NULL DEFAULT '',
  `mimetype` varchar(100) COLLATE utf8_bin NOT NULL DEFAULT '',
  `filesize` int(20) unsigned NOT NULL DEFAULT '0',
  `filetime` int(11) unsigned NOT NULL DEFAULT '0',
  `thumbnail` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`attach_id`),
  KEY `filetime` (`filetime`),
  KEY `post_msg_id` (`post_msg_id`),
  KEY `topic_id` (`topic_id`),
  KEY `poster_id` (`poster_id`),
  KEY `is_orphan` (`is_orphan`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struttura della tabella `phpbb_banlist`
--

CREATE TABLE IF NOT EXISTS `phpbb_banlist` (
  `ban_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `ban_userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `ban_ip` varchar(40) COLLATE utf8_bin NOT NULL DEFAULT '',
  `ban_email` varchar(100) COLLATE utf8_bin NOT NULL DEFAULT '',
  `ban_start` int(11) unsigned NOT NULL DEFAULT '0',
  `ban_end` int(11) unsigned NOT NULL DEFAULT '0',
  `ban_exclude` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ban_reason` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `ban_give_reason` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`ban_id`),
  KEY `ban_end` (`ban_end`),
  KEY `ban_user` (`ban_userid`,`ban_exclude`),
  KEY `ban_email` (`ban_email`,`ban_exclude`),
  KEY `ban_ip` (`ban_ip`,`ban_exclude`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struttura della tabella `phpbb_bbcodes`
--

CREATE TABLE IF NOT EXISTS `phpbb_bbcodes` (
  `bbcode_id` smallint(4) unsigned NOT NULL DEFAULT '0',
  `bbcode_tag` varchar(16) COLLATE utf8_bin NOT NULL DEFAULT '',
  `bbcode_helpline` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `display_on_posting` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `bbcode_match` text COLLATE utf8_bin NOT NULL,
  `bbcode_tpl` mediumtext COLLATE utf8_bin NOT NULL,
  `first_pass_match` mediumtext COLLATE utf8_bin NOT NULL,
  `first_pass_replace` mediumtext COLLATE utf8_bin NOT NULL,
  `second_pass_match` mediumtext COLLATE utf8_bin NOT NULL,
  `second_pass_replace` mediumtext COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`bbcode_id`),
  KEY `display_on_post` (`display_on_posting`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Struttura della tabella `phpbb_bookmarks`
--

CREATE TABLE IF NOT EXISTS `phpbb_bookmarks` (
  `topic_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`topic_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Struttura della tabella `phpbb_bots`
--

CREATE TABLE IF NOT EXISTS `phpbb_bots` (
  `bot_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `bot_active` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `bot_name` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `bot_agent` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `bot_ip` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`bot_id`),
  KEY `bot_active` (`bot_active`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=52 ;

--
-- Dump dei dati per la tabella `phpbb_bots`
--

INSERT INTO `phpbb_bots` (`bot_id`, `bot_active`, `bot_name`, `user_id`, `bot_agent`, `bot_ip`) VALUES
(1, 1, 'AdsBot [Google]', 3, 'AdsBot-Google', ''),
(2, 1, 'Alexa [Bot]', 4, 'ia_archiver', ''),
(3, 1, 'Alta Vista [Bot]', 5, 'Scooter/', ''),
(4, 1, 'Ask Jeeves [Bot]', 6, 'Ask Jeeves', ''),
(5, 1, 'Baidu [Spider]', 7, 'Baiduspider+(', ''),
(6, 1, 'Bing [Bot]', 8, 'bingbot/', ''),
(7, 1, 'Exabot [Bot]', 9, 'Exabot/', ''),
(8, 1, 'FAST Enterprise [Crawler]', 10, 'FAST Enterprise Crawler', ''),
(9, 1, 'FAST WebCrawler [Crawler]', 11, 'FAST-WebCrawler/', ''),
(10, 1, 'Francis [Bot]', 12, 'http://www.neomo.de/', ''),
(11, 1, 'Gigabot [Bot]', 13, 'Gigabot/', ''),
(12, 1, 'Google Adsense [Bot]', 14, 'Mediapartners-Google', ''),
(13, 1, 'Google Desktop', 15, 'Google Desktop', ''),
(14, 1, 'Google Feedfetcher', 16, 'Feedfetcher-Google', ''),
(15, 1, 'Google [Bot]', 17, 'Googlebot', ''),
(16, 1, 'Heise IT-Markt [Crawler]', 18, 'heise-IT-Markt-Crawler', ''),
(17, 1, 'Heritrix [Crawler]', 19, 'heritrix/1.', ''),
(18, 1, 'IBM Research [Bot]', 20, 'ibm.com/cs/crawler', ''),
(19, 1, 'ICCrawler - ICjobs', 21, 'ICCrawler - ICjobs', ''),
(20, 1, 'ichiro [Crawler]', 22, 'ichiro/', ''),
(21, 1, 'Majestic-12 [Bot]', 23, 'MJ12bot/', ''),
(22, 1, 'Metager [Bot]', 24, 'MetagerBot/', ''),
(23, 1, 'MSN NewsBlogs', 25, 'msnbot-NewsBlogs/', ''),
(24, 1, 'MSN [Bot]', 26, 'msnbot/', ''),
(25, 1, 'MSNbot Media', 27, 'msnbot-media/', ''),
(26, 1, 'NG-Search [Bot]', 28, 'NG-Search/', ''),
(27, 1, 'Nutch [Bot]', 29, 'http://lucene.apache.org/nutch/', ''),
(28, 1, 'Nutch/CVS [Bot]', 30, 'NutchCVS/', ''),
(29, 1, 'OmniExplorer [Bot]', 31, 'OmniExplorer_Bot/', ''),
(30, 1, 'Online link [Validator]', 32, 'online link validator', ''),
(31, 1, 'psbot [Picsearch]', 33, 'psbot/0', ''),
(32, 1, 'Seekport [Bot]', 34, 'Seekbot/', ''),
(33, 1, 'Sensis [Crawler]', 35, 'Sensis Web Crawler', ''),
(34, 1, 'SEO Crawler', 36, 'SEO search Crawler/', ''),
(35, 1, 'Seoma [Crawler]', 37, 'Seoma [SEO Crawler]', ''),
(36, 1, 'SEOSearch [Crawler]', 38, 'SEOsearch/', ''),
(37, 1, 'Snappy [Bot]', 39, 'Snappy/1.1 ( http://www.urltrends.com/ )', ''),
(38, 1, 'Steeler [Crawler]', 40, 'http://www.tkl.iis.u-tokyo.ac.jp/~crawler/', ''),
(39, 1, 'Synoo [Bot]', 41, 'SynooBot/', ''),
(40, 1, 'Telekom [Bot]', 42, 'crawleradmin.t-info@telekom.de', ''),
(41, 1, 'TurnitinBot [Bot]', 43, 'TurnitinBot/', ''),
(42, 1, 'Voyager [Bot]', 44, 'voyager/1.0', ''),
(43, 1, 'W3 [Sitesearch]', 45, 'W3 SiteSearch Crawler', ''),
(44, 1, 'W3C [Linkcheck]', 46, 'W3C-checklink/', ''),
(45, 1, 'W3C [Validator]', 47, 'W3C_*Validator', ''),
(46, 1, 'WiseNut [Bot]', 48, 'http://www.WISEnutbot.com', ''),
(47, 1, 'YaCy [Bot]', 49, 'yacybot', ''),
(48, 1, 'Yahoo MMCrawler [Bot]', 50, 'Yahoo-MMCrawler/', ''),
(49, 1, 'Yahoo Slurp [Bot]', 51, 'Yahoo! DE Slurp', ''),
(50, 1, 'Yahoo [Bot]', 52, 'Yahoo! Slurp', ''),
(51, 1, 'YahooSeeker [Bot]', 53, 'YahooSeeker/', '');

-- --------------------------------------------------------

--
-- Struttura della tabella `phpbb_config`
--

CREATE TABLE IF NOT EXISTS `phpbb_config` (
  `config_name` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `config_value` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `is_dynamic` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`config_name`),
  KEY `is_dynamic` (`is_dynamic`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dump dei dati per la tabella `phpbb_config`
--

INSERT INTO `phpbb_config` (`config_name`, `config_value`, `is_dynamic`) VALUES
('active_sessions', '0', 0),
('allow_attachments', '1', 0),
('allow_autologin', '1', 0),
('allow_avatar', '1', 0),
('allow_avatar_local', '0', 0),
('allow_avatar_remote', '0', 0),
('allow_avatar_remote_upload', '0', 0),
('allow_avatar_upload', '1', 0),
('allow_bbcode', '1', 0),
('allow_birthdays', '1', 0),
('allow_bookmarks', '1', 0),
('allow_emailreuse', '0', 0),
('allow_forum_notify', '1', 0),
('allow_mass_pm', '1', 0),
('allow_name_chars', 'USERNAME_CHARS_ANY', 0),
('allow_namechange', '0', 0),
('allow_nocensors', '0', 0),
('allow_pm_attach', '0', 0),
('allow_pm_report', '1', 0),
('allow_post_flash', '1', 0),
('allow_post_links', '1', 0),
('allow_privmsg', '1', 0),
('allow_quick_reply', '1', 0),
('allow_sig', '1', 0),
('allow_sig_bbcode', '1', 0),
('allow_sig_flash', '0', 0),
('allow_sig_img', '1', 0),
('allow_sig_links', '1', 0),
('allow_sig_pm', '1', 0),
('allow_sig_smilies', '1', 0),
('allow_smilies', '1', 0),
('allow_topic_notify', '1', 0),
('attachment_quota', '52428800', 0),
('auth_bbcode_pm', '1', 0),
('auth_flash_pm', '0', 0),
('auth_img_pm', '1', 0),
('auth_method', 'db', 0),
('auth_smilies_pm', '1', 0),
('avatar_filesize', '6144', 0),
('avatar_gallery_path', 'images/avatars/gallery', 0),
('avatar_max_height', '90', 0),
('avatar_max_width', '90', 0),
('avatar_min_height', '20', 0),
('avatar_min_width', '20', 0),
('avatar_path', 'images/avatars/upload', 0),
('avatar_salt', 'a31de61acbbe757ef051d96e7d504012', 0),
('board_contact', 'a@tin.it', 0),
('board_disable', '0', 0),
('board_disable_msg', '', 0),
('board_dst', '0', 0),
('board_email', 'a@tin.it', 0),
('board_email_form', '0', 0),
('board_email_sig', 'Grazie, l’amministrazione', 0),
('board_hide_emails', '1', 0),
('board_startdate', '1354998540', 0),
('board_timezone', '0', 0),
('browser_check', '1', 0),
('bump_interval', '10', 0),
('bump_type', 'd', 0),
('cache_gc', '7200', 0),
('cache_last_gc', '1355926657', 1),
('captcha_gd', '1', 0),
('captcha_gd_3d_noise', '1', 0),
('captcha_gd_fonts', '1', 0),
('captcha_gd_foreground_noise', '0', 0),
('captcha_gd_wave', '0', 0),
('captcha_gd_x_grid', '25', 0),
('captcha_gd_y_grid', '25', 0),
('captcha_plugin', 'phpbb_captcha_gd', 0),
('check_attachment_content', '1', 0),
('check_dnsbl', '0', 0),
('chg_passforce', '0', 0),
('confirm_refresh', '1', 0),
('cookie_domain', 'localhost', 0),
('cookie_name', 'phpbb3_r35ga', 0),
('cookie_path', '/', 0),
('cookie_secure', '0', 0),
('coppa_enable', '0', 0),
('coppa_fax', '', 0),
('coppa_mail', '', 0),
('cron_lock', '0', 1),
('database_gc', '604800', 0),
('database_last_gc', '1355655388', 1),
('dbms_version', '5.5.27', 0),
('default_dateformat', '|d/m/Y|, G:i', 0),
('default_lang', 'it', 0),
('default_style', '4', 0),
('delete_time', '0', 0),
('display_last_edited', '1', 0),
('display_order', '0', 0),
('edit_time', '0', 0),
('email_check_mx', '1', 0),
('email_enable', '1', 0),
('email_function_name', 'mail', 0),
('email_max_chunk_size', '50', 0),
('email_package_size', '20', 0),
('enable_confirm', '0', 0),
('enable_pm_icons', '1', 0),
('enable_post_confirm', '1', 0),
('feed_enable', '1', 0),
('feed_forum', '1', 0),
('feed_http_auth', '0', 0),
('feed_item_statistics', '1', 0),
('feed_limit_post', '15', 0),
('feed_limit_topic', '10', 0),
('feed_overall', '1', 0),
('feed_overall_forums', '0', 0),
('feed_topic', '1', 0),
('feed_topics_active', '0', 0),
('feed_topics_new', '1', 0),
('flood_interval', '15', 0),
('force_server_vars', '0', 0),
('form_token_lifetime', '7200', 0),
('form_token_mintime', '0', 0),
('form_token_sid_guests', '1', 0),
('forward_pm', '1', 0),
('forwarded_for_check', '0', 0),
('full_folder_action', '2', 0),
('fulltext_mysql_max_word_len', '254', 0),
('fulltext_mysql_min_word_len', '4', 0),
('fulltext_native_common_thres', '5', 0),
('fulltext_native_load_upd', '1', 0),
('fulltext_native_max_chars', '14', 0),
('fulltext_native_min_chars', '3', 0),
('gzip_compress', '0', 0),
('hot_threshold', '25', 0),
('icons_path', 'images/icons', 0),
('img_create_thumbnail', '0', 0),
('img_display_inlined', '1', 0),
('img_imagick', '', 0),
('img_link_height', '0', 0),
('img_link_width', '0', 0),
('img_max_height', '0', 0),
('img_max_thumb_width', '400', 0),
('img_max_width', '0', 0),
('img_min_thumb_filesize', '12000', 0),
('ip_check', '3', 0),
('ip_login_limit_max', '50', 0),
('ip_login_limit_time', '21600', 0),
('ip_login_limit_use_forwarded', '0', 0),
('jab_enable', '0', 0),
('jab_host', '', 0),
('jab_package_size', '20', 0),
('jab_password', '', 0),
('jab_port', '5222', 0),
('jab_use_ssl', '0', 0),
('jab_username', '', 0),
('last_queue_run', '0', 1),
('ldap_base_dn', '', 0),
('ldap_email', '', 0),
('ldap_password', '', 0),
('ldap_port', '', 0),
('ldap_server', '', 0),
('ldap_uid', '', 0),
('ldap_user', '', 0),
('ldap_user_filter', '', 0),
('limit_load', '0', 0),
('limit_search_load', '0', 0),
('load_anon_lastread', '0', 0),
('load_birthdays', '1', 0),
('load_cpf_memberlist', '0', 0),
('load_cpf_viewprofile', '1', 0),
('load_cpf_viewtopic', '0', 0),
('load_db_lastread', '1', 0),
('load_db_track', '1', 0),
('load_jumpbox', '1', 0),
('load_moderators', '1', 0),
('load_online', '1', 0),
('load_online_guests', '1', 0),
('load_online_time', '5', 0),
('load_onlinetrack', '1', 0),
('load_search', '', 0),
('load_tplcompile', '0', 0),
('load_unreads_search', '1', 0),
('load_user_activity', '1', 0),
('max_attachments', '3', 0),
('max_attachments_pm', '1', 0),
('max_autologin_time', '0', 0),
('max_filesize', '262144', 0),
('max_filesize_pm', '262144', 0),
('max_login_attempts', '3', 0),
('max_name_chars', '20', 0),
('max_num_search_keywords', '10', 0),
('max_pass_chars', '100', 0),
('max_poll_options', '10', 0),
('max_post_chars', '60000', 0),
('max_post_font_size', '200', 0),
('max_post_img_height', '0', 0),
('max_post_img_width', '0', 0),
('max_post_smilies', '0', 0),
('max_post_urls', '0', 0),
('max_quote_depth', '3', 0),
('max_reg_attempts', '5', 0),
('max_sig_chars', '255', 0),
('max_sig_font_size', '200', 0),
('max_sig_img_height', '0', 0),
('max_sig_img_width', '0', 0),
('max_sig_smilies', '0', 0),
('max_sig_urls', '5', 0),
('mime_triggers', 'body|head|html|img|plaintext|a href|pre|script|table|title', 0),
('min_name_chars', '3', 0),
('min_pass_chars', '6', 0),
('min_post_chars', '1', 0),
('min_search_author_chars', '3', 0),
('new_member_group_default', '0', 0),
('new_member_post_limit', '3', 0),
('newest_user_colour', '', 1),
('newest_user_id', '60', 1),
('newest_username', 'MAlfonso', 1),
('num_files', '0', 1),
('num_posts', '2', 1),
('num_topics', '1', 1),
('num_users', '5', 1),
('override_user_style', '0', 0),
('pass_complex', 'PASS_TYPE_ANY', 0),
('pm_edit_time', '0', 0),
('pm_max_boxes', '4', 0),
('pm_max_msgs', '50', 0),
('pm_max_recipients', '0', 0),
('posts_per_page', '10', 0),
('print_pm', '1', 0),
('questionnaire_unique_id', 'c84f693ab7f8e808', 0),
('queue_interval', '60', 0),
('rand_seed', 'abc99e992d69a0b9205b336660854a08', 1),
('rand_seed_last_update', '1355929859', 1),
('ranks_path', 'images/ranks', 0),
('record_online_date', '1354999932', 1),
('record_online_users', '2', 1),
('referer_validation', '1', 0),
('require_activation', '0', 0),
('script_path', '/phpbb3', 0),
('search_anonymous_interval', '0', 0),
('search_block_size', '250', 0),
('search_gc', '7200', 0),
('search_indexing_state', '', 1),
('search_interval', '0', 0),
('search_last_gc', '1355926890', 1),
('search_store_results', '1800', 0),
('search_type', 'fulltext_native', 0),
('secure_allow_deny', '1', 0),
('secure_allow_empty_referer', '1', 0),
('secure_downloads', '0', 0),
('server_name', 'localhost', 0),
('server_port', '80', 0),
('server_protocol', 'http://', 0),
('session_gc', '3600', 0),
('session_last_gc', '1355926905', 1),
('session_length', '3600', 0),
('site_desc', 'Un breve testo per descrivere il tuo forum', 0),
('sitename', 'tuodominio.it', 0),
('smilies_path', 'images/smilies', 0),
('smilies_per_page', '50', 0),
('smtp_auth_method', 'PLAIN', 0),
('smtp_delivery', '0', 0),
('smtp_host', '', 0),
('smtp_password', '', 0),
('smtp_port', '25', 0),
('smtp_username', '', 0),
('topics_per_page', '25', 0),
('tpl_allow_php', '0', 0),
('upload_dir_size', '0', 1),
('upload_icons_path', 'images/upload_icons', 0),
('upload_path', 'files', 0),
('version', '3.0.11', 0),
('warnings_expire_days', '90', 0),
('warnings_gc', '14400', 0),
('warnings_last_gc', '1355926815', 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `phpbb_confirm`
--

CREATE TABLE IF NOT EXISTS `phpbb_confirm` (
  `confirm_id` char(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `session_id` char(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `confirm_type` tinyint(3) NOT NULL DEFAULT '0',
  `code` varchar(8) COLLATE utf8_bin NOT NULL DEFAULT '',
  `seed` int(10) unsigned NOT NULL DEFAULT '0',
  `attempts` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`session_id`,`confirm_id`),
  KEY `confirm_type` (`confirm_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Struttura della tabella `phpbb_disallow`
--

CREATE TABLE IF NOT EXISTS `phpbb_disallow` (
  `disallow_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `disallow_username` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`disallow_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struttura della tabella `phpbb_drafts`
--

CREATE TABLE IF NOT EXISTS `phpbb_drafts` (
  `draft_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `topic_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `forum_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `save_time` int(11) unsigned NOT NULL DEFAULT '0',
  `draft_subject` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `draft_message` mediumtext COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`draft_id`),
  KEY `save_time` (`save_time`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=2 ;

--
-- Dump dei dati per la tabella `phpbb_drafts`
--

INSERT INTO `phpbb_drafts` (`draft_id`, `user_id`, `topic_id`, `forum_id`, `save_time`, `draft_subject`, `draft_message`) VALUES
(1, 2, 0, 1, 1355090745, 'RECITA DI FINE ANNO 2012', 'Ecco tutte le informazioni che riguardano la recita di fine anno !!! Costumi, trama e tanto altro ancora...');

-- --------------------------------------------------------

--
-- Struttura della tabella `phpbb_extensions`
--

CREATE TABLE IF NOT EXISTS `phpbb_extensions` (
  `extension_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `group_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `extension` varchar(100) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`extension_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=67 ;

--
-- Dump dei dati per la tabella `phpbb_extensions`
--

INSERT INTO `phpbb_extensions` (`extension_id`, `group_id`, `extension`) VALUES
(1, 1, 'gif'),
(2, 1, 'png'),
(3, 1, 'jpeg'),
(4, 1, 'jpg'),
(5, 1, 'tif'),
(6, 1, 'tiff'),
(7, 1, 'tga'),
(8, 2, 'gtar'),
(9, 2, 'gz'),
(10, 2, 'tar'),
(11, 2, 'zip'),
(12, 2, 'rar'),
(13, 2, 'ace'),
(14, 2, 'torrent'),
(15, 2, 'tgz'),
(16, 2, 'bz2'),
(17, 2, '7z'),
(18, 3, 'txt'),
(19, 3, 'c'),
(20, 3, 'h'),
(21, 3, 'cpp'),
(22, 3, 'hpp'),
(23, 3, 'diz'),
(24, 3, 'csv'),
(25, 3, 'ini'),
(26, 3, 'log'),
(27, 3, 'js'),
(28, 3, 'xml'),
(29, 4, 'xls'),
(30, 4, 'xlsx'),
(31, 4, 'xlsm'),
(32, 4, 'xlsb'),
(33, 4, 'doc'),
(34, 4, 'docx'),
(35, 4, 'docm'),
(36, 4, 'dot'),
(37, 4, 'dotx'),
(38, 4, 'dotm'),
(39, 4, 'pdf'),
(40, 4, 'ai'),
(41, 4, 'ps'),
(42, 4, 'ppt'),
(43, 4, 'pptx'),
(44, 4, 'pptm'),
(45, 4, 'odg'),
(46, 4, 'odp'),
(47, 4, 'ods'),
(48, 4, 'odt'),
(49, 4, 'rtf'),
(50, 5, 'rm'),
(51, 5, 'ram'),
(52, 6, 'wma'),
(53, 6, 'wmv'),
(54, 7, 'swf'),
(55, 8, 'mov'),
(56, 8, 'm4v'),
(57, 8, 'm4a'),
(58, 8, 'mp4'),
(59, 8, '3gp'),
(60, 8, '3g2'),
(61, 8, 'qt'),
(62, 9, 'mpeg'),
(63, 9, 'mpg'),
(64, 9, 'mp3'),
(65, 9, 'ogg'),
(66, 9, 'ogm');

-- --------------------------------------------------------

--
-- Struttura della tabella `phpbb_extension_groups`
--

CREATE TABLE IF NOT EXISTS `phpbb_extension_groups` (
  `group_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `group_name` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `cat_id` tinyint(2) NOT NULL DEFAULT '0',
  `allow_group` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `download_mode` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `upload_icon` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `max_filesize` int(20) unsigned NOT NULL DEFAULT '0',
  `allowed_forums` text COLLATE utf8_bin NOT NULL,
  `allow_in_pm` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=10 ;

--
-- Dump dei dati per la tabella `phpbb_extension_groups`
--

INSERT INTO `phpbb_extension_groups` (`group_id`, `group_name`, `cat_id`, `allow_group`, `download_mode`, `upload_icon`, `max_filesize`, `allowed_forums`, `allow_in_pm`) VALUES
(1, 'IMAGES', 1, 1, 1, '', 0, '', 0),
(2, 'ARCHIVES', 0, 1, 1, '', 0, '', 0),
(3, 'PLAIN_TEXT', 0, 0, 1, '', 0, '', 0),
(4, 'DOCUMENTS', 0, 0, 1, '', 0, '', 0),
(5, 'REAL_MEDIA', 3, 0, 1, '', 0, '', 0),
(6, 'WINDOWS_MEDIA', 2, 0, 1, '', 0, '', 0),
(7, 'FLASH_FILES', 5, 0, 1, '', 0, '', 0),
(8, 'QUICKTIME_MEDIA', 6, 0, 1, '', 0, '', 0),
(9, 'DOWNLOADABLE_FILES', 0, 0, 1, '', 0, '', 0);

-- --------------------------------------------------------

--
-- Struttura della tabella `phpbb_forums`
--

CREATE TABLE IF NOT EXISTS `phpbb_forums` (
  `forum_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `left_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `right_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `forum_parents` mediumtext COLLATE utf8_bin NOT NULL,
  `forum_name` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `forum_desc` text COLLATE utf8_bin NOT NULL,
  `forum_desc_bitfield` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `forum_desc_options` int(11) unsigned NOT NULL DEFAULT '7',
  `forum_desc_uid` varchar(8) COLLATE utf8_bin NOT NULL DEFAULT '',
  `forum_link` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `forum_password` varchar(40) COLLATE utf8_bin NOT NULL DEFAULT '',
  `forum_style` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `forum_image` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `forum_rules` text COLLATE utf8_bin NOT NULL,
  `forum_rules_link` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `forum_rules_bitfield` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `forum_rules_options` int(11) unsigned NOT NULL DEFAULT '7',
  `forum_rules_uid` varchar(8) COLLATE utf8_bin NOT NULL DEFAULT '',
  `forum_topics_per_page` tinyint(4) NOT NULL DEFAULT '0',
  `forum_type` tinyint(4) NOT NULL DEFAULT '0',
  `forum_status` tinyint(4) NOT NULL DEFAULT '0',
  `forum_posts` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `forum_topics` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `forum_topics_real` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `forum_last_post_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `forum_last_poster_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `forum_last_post_subject` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `forum_last_post_time` int(11) unsigned NOT NULL DEFAULT '0',
  `forum_last_poster_name` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `forum_last_poster_colour` varchar(6) COLLATE utf8_bin NOT NULL DEFAULT '',
  `forum_flags` tinyint(4) NOT NULL DEFAULT '32',
  `forum_options` int(20) unsigned NOT NULL DEFAULT '0',
  `display_subforum_list` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `display_on_index` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `enable_indexing` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `enable_icons` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `enable_prune` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `prune_next` int(11) unsigned NOT NULL DEFAULT '0',
  `prune_days` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `prune_viewed` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `prune_freq` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`forum_id`),
  KEY `left_right_id` (`left_id`,`right_id`),
  KEY `forum_lastpost_id` (`forum_last_post_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=10 ;

--
-- Dump dei dati per la tabella `phpbb_forums`
--

INSERT INTO `phpbb_forums` (`forum_id`, `parent_id`, `left_id`, `right_id`, `forum_parents`, `forum_name`, `forum_desc`, `forum_desc_bitfield`, `forum_desc_options`, `forum_desc_uid`, `forum_link`, `forum_password`, `forum_style`, `forum_image`, `forum_rules`, `forum_rules_link`, `forum_rules_bitfield`, `forum_rules_options`, `forum_rules_uid`, `forum_topics_per_page`, `forum_type`, `forum_status`, `forum_posts`, `forum_topics`, `forum_topics_real`, `forum_last_post_id`, `forum_last_poster_id`, `forum_last_post_subject`, `forum_last_post_time`, `forum_last_poster_name`, `forum_last_poster_colour`, `forum_flags`, `forum_options`, `display_subforum_list`, `display_on_index`, `enable_indexing`, `enable_icons`, `enable_prune`, `prune_next`, `prune_days`, `prune_viewed`, `prune_freq`) VALUES
(1, 0, 1, 4, '', 'RECITA DI FINE ANNO 2012', 'Ecco tutte le informazioni che riguardano la recita di fine anno !!! Costumi, trama e tanto altro ancora...', '', 7, '', '', '', 0, '', '', '', '', 7, '', 10, 1, 0, 0, 0, 0, 0, 0, '', 0, '', '', 112, 0, 1, 0, 1, 0, 0, 0, 7, 7, 1),
(2, 0, 5, 6, '', 'INCONTRO GENITORI MESE FEBBRAIO', 'Invitiamo i genitori a prendere parte a questo incontro !!! Non mancate...', '', 7, '', '', '', 0, '', '', '', '', 7, '', 0, 1, 0, 0, 0, 0, 0, 0, '', 0, '', '', 48, 0, 1, 0, 1, 0, 0, 0, 7, 7, 1),
(6, 0, 7, 8, '', 'ARGOMENTO 1', 'Un nuovo forum che permette di condivedere informazioni', '', 7, '', '', '', 0, '', '', '', '', 7, '', 10, 1, 0, 0, 0, 0, 0, 0, '', 0, '', '', 112, 0, 1, 1, 1, 0, 0, 0, 7, 7, 1),
(7, 0, 9, 10, '', 'ARGOMENTO 2', 'Un nuovo forum che permette di condivedere informazioni', '', 7, '', '', '', 0, '', '', '', '', 7, '', 0, 1, 0, 0, 0, 0, 0, 0, '', 0, '', '', 48, 0, 1, 1, 1, 0, 0, 0, 7, 7, 1),
(8, 0, 11, 12, '', 'ARGOMENTO 3', 'Un nuovo forum che permette di condivedere informazioni', '', 7, '', '', '', 0, '', '', '', '', 7, '', 10, 1, 0, 0, 0, 0, 0, 0, '', 0, '', '', 112, 0, 1, 1, 1, 1, 0, 0, 7, 7, 1),
(9, 1, 2, 3, 'a:1:{i:1;a:2:{i:0;s:24:"RECITA DI FINE ANNO 2012";i:1;i:1;}}', 'Costumi', '', '', 7, '', '', '', 0, '', '', '', '', 7, '', 5, 1, 0, 2, 1, 1, 4, 58, 'Famiglia Bianchi', 1355174726, 'genitore1', '', 112, 0, 1, 1, 1, 1, 0, 0, 7, 7, 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `phpbb_forums_access`
--

CREATE TABLE IF NOT EXISTS `phpbb_forums_access` (
  `forum_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `session_id` char(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`forum_id`,`user_id`,`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Struttura della tabella `phpbb_forums_track`
--

CREATE TABLE IF NOT EXISTS `phpbb_forums_track` (
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `forum_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `mark_time` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_id`,`forum_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dump dei dati per la tabella `phpbb_forums_track`
--

INSERT INTO `phpbb_forums_track` (`user_id`, `forum_id`, `mark_time`) VALUES
(2, 1, 1355090937),
(2, 9, 1355174926),
(57, 9, 1355173113),
(58, 9, 1355174726);

-- --------------------------------------------------------

--
-- Struttura della tabella `phpbb_forums_watch`
--

CREATE TABLE IF NOT EXISTS `phpbb_forums_watch` (
  `forum_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `notify_status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  KEY `forum_id` (`forum_id`),
  KEY `user_id` (`user_id`),
  KEY `notify_stat` (`notify_status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dump dei dati per la tabella `phpbb_forums_watch`
--

INSERT INTO `phpbb_forums_watch` (`forum_id`, `user_id`, `notify_status`) VALUES
(1, 2, 0);

-- --------------------------------------------------------

--
-- Struttura della tabella `phpbb_groups`
--

CREATE TABLE IF NOT EXISTS `phpbb_groups` (
  `group_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `group_type` tinyint(4) NOT NULL DEFAULT '1',
  `group_founder_manage` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `group_skip_auth` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `group_name` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `group_desc` text COLLATE utf8_bin NOT NULL,
  `group_desc_bitfield` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `group_desc_options` int(11) unsigned NOT NULL DEFAULT '7',
  `group_desc_uid` varchar(8) COLLATE utf8_bin NOT NULL DEFAULT '',
  `group_display` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `group_avatar` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `group_avatar_type` tinyint(2) NOT NULL DEFAULT '0',
  `group_avatar_width` smallint(4) unsigned NOT NULL DEFAULT '0',
  `group_avatar_height` smallint(4) unsigned NOT NULL DEFAULT '0',
  `group_rank` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `group_colour` varchar(6) COLLATE utf8_bin NOT NULL DEFAULT '',
  `group_sig_chars` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `group_receive_pm` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `group_message_limit` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `group_max_recipients` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `group_legend` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`group_id`),
  KEY `group_legend_name` (`group_legend`,`group_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=8 ;

--
-- Dump dei dati per la tabella `phpbb_groups`
--

INSERT INTO `phpbb_groups` (`group_id`, `group_type`, `group_founder_manage`, `group_skip_auth`, `group_name`, `group_desc`, `group_desc_bitfield`, `group_desc_options`, `group_desc_uid`, `group_display`, `group_avatar`, `group_avatar_type`, `group_avatar_width`, `group_avatar_height`, `group_rank`, `group_colour`, `group_sig_chars`, `group_receive_pm`, `group_message_limit`, `group_max_recipients`, `group_legend`) VALUES
(1, 3, 0, 0, 'GUESTS', '', '', 7, '', 0, '', 0, 0, 0, 0, '', 0, 0, 0, 5, 0),
(2, 3, 0, 0, 'REGISTERED', '', '', 7, '', 0, '', 0, 0, 0, 0, '', 0, 0, 0, 5, 0),
(3, 3, 0, 0, 'REGISTERED_COPPA', '', '', 7, '', 0, '', 0, 0, 0, 0, '', 0, 0, 0, 5, 0),
(4, 3, 0, 0, 'GLOBAL_MODERATORS', '', '', 7, '', 0, '', 0, 0, 0, 0, '00AA00', 0, 0, 0, 0, 1),
(5, 3, 1, 0, 'ADMINISTRATORS', '', '', 7, '', 0, '', 0, 0, 0, 0, 'AA0000', 0, 0, 0, 0, 1),
(6, 3, 0, 0, 'BOTS', '', '', 7, '', 0, '', 0, 0, 0, 0, '9E8DA7', 0, 0, 0, 5, 0),
(7, 3, 0, 0, 'NEWLY_REGISTERED', '', '', 7, '', 0, '', 0, 0, 0, 0, '', 0, 0, 0, 5, 0);

-- --------------------------------------------------------

--
-- Struttura della tabella `phpbb_icons`
--

CREATE TABLE IF NOT EXISTS `phpbb_icons` (
  `icons_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `icons_url` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `icons_width` tinyint(4) NOT NULL DEFAULT '0',
  `icons_height` tinyint(4) NOT NULL DEFAULT '0',
  `icons_order` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `display_on_posting` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`icons_id`),
  KEY `display_on_posting` (`display_on_posting`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=11 ;

--
-- Dump dei dati per la tabella `phpbb_icons`
--

INSERT INTO `phpbb_icons` (`icons_id`, `icons_url`, `icons_width`, `icons_height`, `icons_order`, `display_on_posting`) VALUES
(1, 'misc/fire.gif', 16, 16, 1, 1),
(2, 'smile/redface.gif', 16, 16, 9, 1),
(3, 'smile/mrgreen.gif', 16, 16, 10, 1),
(4, 'misc/heart.gif', 16, 16, 4, 1),
(5, 'misc/star.gif', 16, 16, 2, 1),
(6, 'misc/radioactive.gif', 16, 16, 3, 1),
(7, 'misc/thinking.gif', 16, 16, 5, 1),
(8, 'smile/info.gif', 16, 16, 8, 1),
(9, 'smile/question.gif', 16, 16, 6, 1),
(10, 'smile/alert.gif', 16, 16, 7, 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `phpbb_lang`
--

CREATE TABLE IF NOT EXISTS `phpbb_lang` (
  `lang_id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `lang_iso` varchar(30) COLLATE utf8_bin NOT NULL DEFAULT '',
  `lang_dir` varchar(30) COLLATE utf8_bin NOT NULL DEFAULT '',
  `lang_english_name` varchar(100) COLLATE utf8_bin NOT NULL DEFAULT '',
  `lang_local_name` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `lang_author` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`lang_id`),
  KEY `lang_iso` (`lang_iso`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=3 ;

--
-- Dump dei dati per la tabella `phpbb_lang`
--

INSERT INTO `phpbb_lang` (`lang_id`, `lang_iso`, `lang_dir`, `lang_english_name`, `lang_local_name`, `lang_author`) VALUES
(1, 'en', 'en', 'British English', 'British English', 'phpBB Group'),
(2, 'it', 'it', 'Italian', 'Italiano', 'phpBB.it, phpBBItalia.net');

-- --------------------------------------------------------

--
-- Struttura della tabella `phpbb_log`
--

CREATE TABLE IF NOT EXISTS `phpbb_log` (
  `log_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `log_type` tinyint(4) NOT NULL DEFAULT '0',
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `forum_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `topic_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `reportee_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `log_ip` varchar(40) COLLATE utf8_bin NOT NULL DEFAULT '',
  `log_time` int(11) unsigned NOT NULL DEFAULT '0',
  `log_operation` text COLLATE utf8_bin NOT NULL,
  `log_data` mediumtext COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`log_id`),
  KEY `log_type` (`log_type`),
  KEY `forum_id` (`forum_id`),
  KEY `topic_id` (`topic_id`),
  KEY `reportee_id` (`reportee_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=2308 ;

--
-- Dump dei dati per la tabella `phpbb_log`
--

INSERT INTO `phpbb_log` (`log_id`, `log_type`, `user_id`, `forum_id`, `topic_id`, `reportee_id`, `log_ip`, `log_time`, `log_operation`, `log_data`) VALUES
(278, 3, 2, 0, 0, 54, '::1', 1355029237, 'LOG_USER_NEW_PASSWORD', 'a:1:{i:0;s:9:"Genitore1";}'),
(611, 1, 2, 1, 1, 0, '::1', 1355090973, 'LOG_DELETE_POST', 'a:2:{i:0;s:28:"Re: RECITA DI FINE ANNO 2012";i:1;s:5:"admin";}'),
(615, 1, 2, 1, 1, 0, '::1', 1355090982, 'LOG_DELETE_POST', 'a:2:{i:0;s:28:"Re: RECITA DI FINE ANNO 2012";i:1;s:5:"admin";}'),
(826, 3, 2, 0, 0, 1, '::1', 1355093087, 'LOG_USER_NEW_PASSWORD', 'a:1:{i:0;s:9:"Anonymous";}'),
(830, 3, 2, 0, 0, 1, '::1', 1355093099, 'LOG_USER_UPDATE_NAME', 'a:2:{i:0;s:9:"Anonymous";i:1;s:9:"Genitore1";}'),
(1087, 3, 2, 0, 0, 1, '::1', 1355166520, 'LOG_USER_UPDATE_NAME', 'a:2:{i:0;s:9:"Genitore1";i:1;s:10:"ciaomondo2";}'),
(1088, 3, 2, 0, 0, 1, '::1', 1355166520, 'LOG_USER_NEW_PASSWORD', 'a:1:{i:0;s:9:"Genitore1";}'),
(1421, 1, 57, 9, 1, 0, '::1', 1355173076, 'LOG_DELETE_TOPIC', 'a:2:{i:0;s:14:"Famiglia Rossi";i:1;s:9:"genitore2";}'),
(1517, 1, 58, 9, 2, 0, '::1', 1355174664, 'LOG_DELETE_POST', 'a:2:{i:0;s:16:"Famiglia Bianchi";i:1;s:9:"genitore1";}'),
(1972, 0, 2, 0, 0, 0, '::1', 1355236977, 'LOG_CLEAR_ADMIN', ''),
(1973, 0, 2, 0, 0, 0, '::1', 1355236981, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(1974, 0, 2, 0, 0, 0, '::1', 1355236983, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(1975, 0, 2, 0, 0, 0, '::1', 1355236987, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(1976, 0, 2, 0, 0, 0, '::1', 1355236989, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(1977, 0, 2, 0, 0, 0, '::1', 1355236995, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(1978, 0, 2, 0, 0, 0, '::1', 1355236997, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(1979, 0, 2, 0, 0, 0, '::1', 1355237010, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(1980, 0, 2, 0, 0, 0, '::1', 1355237019, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(1981, 0, 2, 0, 0, 0, '::1', 1355237067, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(1982, 0, 2, 0, 0, 0, '::1', 1355237069, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(1983, 0, 2, 0, 0, 0, '::1', 1355237075, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(1984, 0, 2, 0, 0, 0, '::1', 1355237079, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(1985, 0, 2, 0, 0, 0, '::1', 1355237084, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(1986, 0, 2, 0, 0, 0, '::1', 1355237084, 'LOG_TEMPLATE_CACHE_CLEARED', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:846:"captcha_default, confirm_body, drafts, faq_body, forumlist_body, index_body, jumpbox, login_body, mcp_footer, mcp_forum, mcp_front, mcp_header, mcp_logs, mcp_queue, mcp_reports, memberlist_body, memberlist_search, memberlist_view, message_body, overall_footer, overall_header, posting_attach_body, posting_body, posting_buttons, posting_editor, posting_layout, posting_pm_layout, posting_poll_body, posting_preview, posting_review, posting_topic_review, quickreply_editor, report_body, search_body, search_results, simple_footer, simple_header, ucp_agreement, ucp_footer, ucp_groups_membership, ucp_header, ucp_main_front, ucp_main_subscribed, ucp_pm_history, ucp_pm_message_footer, ucp_pm_message_header, ucp_pm_viewfolder, ucp_prefs_personal, ucp_profile_profile_info, ucp_register, ucp_remind, ucp_zebra_friends, viewforum_body, viewtopic_body";}'),
(1987, 0, 2, 0, 0, 0, '::1', 1355237087, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(1988, 0, 2, 0, 0, 0, '::1', 1355237104, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(1989, 0, 2, 0, 0, 0, '::1', 1355237203, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(1990, 0, 2, 0, 0, 0, '::1', 1355237208, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(1991, 0, 2, 0, 0, 0, '::1', 1355237211, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(1992, 0, 2, 0, 0, 0, '::1', 1355237213, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(1993, 0, 2, 0, 0, 0, '::1', 1355237223, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(1994, 0, 2, 0, 0, 0, '::1', 1355237236, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(1995, 0, 2, 0, 0, 0, '::1', 1355237239, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(1996, 0, 2, 0, 0, 0, '::1', 1355237273, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(1997, 0, 2, 0, 0, 0, '::1', 1355237282, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(1998, 0, 2, 0, 0, 0, '::1', 1355237297, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(1999, 0, 2, 0, 0, 0, '::1', 1355237300, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2000, 0, 2, 0, 0, 0, '::1', 1355237307, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2001, 0, 2, 0, 0, 0, '::1', 1355237311, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2002, 0, 2, 0, 0, 0, '::1', 1355237314, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2003, 0, 2, 0, 0, 0, '::1', 1355237327, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2004, 0, 2, 0, 0, 0, '::1', 1355237332, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2005, 0, 2, 0, 0, 0, '::1', 1355237335, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2006, 0, 2, 0, 0, 0, '::1', 1355237338, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2007, 0, 2, 0, 0, 0, '::1', 1355237342, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2008, 0, 2, 0, 0, 0, '::1', 1355237350, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2009, 0, 2, 0, 0, 0, '::1', 1355237355, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2010, 0, 2, 0, 0, 0, '::1', 1355237361, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2011, 0, 2, 0, 0, 0, '::1', 1355237361, 'LOG_TEMPLATE_CACHE_CLEARED', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:12:"Tutti i file";}'),
(2012, 0, 2, 0, 0, 0, '::1', 1355237365, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2013, 0, 2, 0, 0, 0, '::1', 1355237471, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2014, 0, 2, 0, 0, 0, '::1', 1355237480, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2015, 0, 2, 0, 0, 0, '::1', 1355237488, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2016, 0, 2, 0, 0, 0, '::1', 1355237488, 'LOG_STYLE_EDIT_DETAILS', 'a:1:{i:0;s:12:"eMuza_summer";}'),
(2017, 0, 2, 0, 0, 0, '::1', 1355237492, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2018, 0, 2, 0, 0, 0, '::1', 1355237508, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2019, 0, 2, 0, 0, 0, '::1', 1355238528, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2020, 0, 2, 0, 0, 0, '::1', 1355238906, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2021, 0, 1, 0, 0, 0, '::1', 1355238912, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2022, 0, 1, 0, 0, 0, '::1', 1355239597, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2023, 0, 1, 0, 0, 0, '::1', 1355239719, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2024, 0, 1, 0, 0, 0, '::1', 1355239724, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2025, 0, 1, 0, 0, 0, '::1', 1355239772, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2026, 0, 1, 0, 0, 0, '::1', 1355239785, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2027, 0, 1, 0, 0, 0, '::1', 1355239797, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2028, 0, 1, 0, 0, 0, '::1', 1355239954, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2029, 0, 1, 0, 0, 0, '::1', 1355240006, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2030, 0, 1, 0, 0, 0, '::1', 1355240304, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2031, 0, 2, 0, 0, 0, '::1', 1355240310, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2032, 0, 2, 0, 0, 0, '::1', 1355240333, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2033, 0, 2, 0, 0, 0, '::1', 1355240333, 'LOG_ADMIN_AUTH_SUCCESS', ''),
(2034, 0, 2, 0, 0, 0, '::1', 1355240339, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2035, 0, 2, 0, 0, 0, '::1', 1355240441, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2036, 0, 2, 0, 0, 0, '::1', 1355240447, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2037, 0, 2, 0, 0, 0, '::1', 1355240451, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2038, 0, 2, 0, 0, 0, '::1', 1355240454, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2039, 0, 2, 0, 0, 0, '::1', 1355240456, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2040, 0, 2, 0, 0, 0, '::1', 1355240456, 'LOG_TEMPLATE_CACHE_CLEARED', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:84:"forumlist_body, index_body, login_body, message_body, overall_footer, overall_header";}'),
(2041, 0, 2, 0, 0, 0, '::1', 1355240459, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2042, 0, 2, 0, 0, 0, '::1', 1355240463, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2043, 0, 2, 0, 0, 0, '::1', 1355240466, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2044, 0, 2, 0, 0, 0, '::1', 1355240466, 'LOG_TEMPLATE_CACHE_CLEARED', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:12:"Tutti i file";}'),
(2045, 0, 2, 0, 0, 0, '::1', 1355240469, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2046, 0, 2, 0, 0, 0, '::1', 1355240474, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2047, 0, 2, 0, 0, 0, '::1', 1355240485, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2048, 0, 2, 0, 0, 0, '::1', 1355240543, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2049, 0, 2, 0, 0, 0, '::1', 1355240550, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2050, 0, 2, 0, 0, 0, '::1', 1355240554, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2051, 0, 2, 0, 0, 0, '::1', 1355240558, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2052, 0, 2, 0, 0, 0, '::1', 1355240560, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2053, 0, 2, 0, 0, 0, '::1', 1355240561, 'LOG_THEME_REFRESHED', 'a:1:{i:0;s:12:"eMuza_summer";}'),
(2054, 0, 2, 0, 0, 0, '::1', 1355240565, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2055, 0, 2, 0, 0, 0, '::1', 1355240571, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2056, 0, 2, 0, 0, 0, '::1', 1355240737, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2057, 0, 2, 0, 0, 0, '::1', 1355240970, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2058, 0, 2, 0, 0, 0, '::1', 1355240973, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2059, 0, 2, 0, 0, 0, '::1', 1355240976, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2060, 0, 2, 0, 0, 0, '::1', 1355240976, 'LOG_THEME_REFRESHED', 'a:1:{i:0;s:12:"eMuza_summer";}'),
(2061, 0, 2, 0, 0, 0, '::1', 1355240980, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2062, 0, 2, 0, 0, 0, '::1', 1355240983, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2063, 0, 2, 0, 0, 0, '::1', 1355240985, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2064, 0, 2, 0, 0, 0, '::1', 1355240986, 'LOG_TEMPLATE_CACHE_CLEARED', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:12:"Tutti i file";}'),
(2065, 0, 2, 0, 0, 0, '::1', 1355241082, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2066, 0, 1, 0, 0, 0, '::1', 1355241289, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2067, 0, 1, 0, 0, 0, '::1', 1355241294, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2068, 0, 1, 0, 0, 0, '::1', 1355243147, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2069, 0, 1, 0, 0, 0, '::1', 1355243184, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2070, 0, 1, 0, 0, 0, '::1', 1355243596, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2071, 0, 1, 0, 0, 0, '::1', 1355243711, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2072, 0, 1, 0, 0, 0, '::1', 1355253813, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2073, 0, 1, 0, 0, 0, '::1', 1355257778, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2074, 0, 1, 0, 0, 0, '::1', 1355260099, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2075, 0, 1, 0, 0, 0, '::1', 1355260269, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2076, 0, 1, 0, 0, 0, '::1', 1355260731, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2077, 0, 1, 0, 0, 0, '::1', 1355261029, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2078, 0, 1, 0, 0, 0, '::1', 1355261036, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2079, 0, 2, 0, 0, 0, '::1', 1355261042, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2080, 0, 2, 0, 0, 0, '::1', 1355261047, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2081, 0, 2, 0, 0, 0, '::1', 1355261056, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2082, 0, 2, 0, 0, 0, '::1', 1355261056, 'LOG_ADMIN_AUTH_SUCCESS', ''),
(2083, 0, 2, 0, 0, 0, '::1', 1355261062, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2084, 0, 2, 0, 0, 0, '::1', 1355261066, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2085, 0, 2, 0, 0, 0, '::1', 1355261069, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2086, 0, 2, 0, 0, 0, '::1', 1355261077, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2087, 0, 2, 0, 0, 0, '::1', 1355261081, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2088, 0, 2, 0, 0, 0, '::1', 1355261081, 'LOG_TEMPLATE_CACHE_CLEARED', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:84:"forumlist_body, index_body, login_body, message_body, overall_footer, overall_header";}'),
(2089, 0, 2, 0, 0, 0, '::1', 1355261084, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2090, 0, 2, 0, 0, 0, '::1', 1355261086, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2091, 0, 2, 0, 0, 0, '::1', 1355261089, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2092, 0, 2, 0, 0, 0, '::1', 1355261091, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2093, 0, 2, 0, 0, 0, '::1', 1355261092, 'LOG_TEMPLATE_CACHE_CLEARED', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:12:"Tutti i file";}'),
(2094, 0, 2, 0, 0, 0, '::1', 1355261094, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2095, 0, 2, 0, 0, 0, '::1', 1355261097, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2096, 0, 2, 0, 0, 0, '::1', 1355261100, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2097, 0, 2, 0, 0, 0, '::1', 1355261100, 'LOG_THEME_REFRESHED', 'a:1:{i:0;s:12:"eMuza_summer";}'),
(2098, 0, 2, 0, 0, 0, '::1', 1355261107, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2099, 0, 2, 0, 0, 0, '::1', 1355261267, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2100, 0, 2, 0, 0, 0, '::1', 1355261270, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2101, 0, 2, 0, 0, 0, '::1', 1355261272, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2102, 0, 2, 0, 0, 0, '::1', 1355261272, 'LOG_THEME_REFRESHED', 'a:1:{i:0;s:12:"eMuza_summer";}'),
(2103, 0, 2, 0, 0, 0, '::1', 1355261274, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2104, 0, 2, 0, 0, 0, '::1', 1355261277, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2105, 0, 2, 0, 0, 0, '::1', 1355261280, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2106, 0, 2, 0, 0, 0, '::1', 1355261280, 'LOG_TEMPLATE_CACHE_CLEARED', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:58:"forumlist_body, index_body, overall_footer, overall_header";}'),
(2107, 0, 2, 0, 0, 0, '::1', 1355261283, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2108, 0, 2, 0, 0, 0, '::1', 1355261287, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2109, 0, 2, 0, 0, 0, '::1', 1355261290, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2110, 0, 2, 0, 0, 0, '::1', 1355261290, 'LOG_TEMPLATE_CACHE_CLEARED', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:12:"Tutti i file";}'),
(2111, 0, 2, 0, 0, 0, '::1', 1355261293, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2112, 0, 2, 0, 0, 0, '::1', 1355261352, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2113, 0, 2, 0, 0, 0, '::1', 1355261361, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2114, 0, 1, 0, 0, 0, '::1', 1355261366, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2115, 0, 1, 0, 0, 0, '::1', 1355262957, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2116, 0, 1, 0, 0, 0, '::1', 1355262979, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2117, 0, 1, 0, 0, 0, '::1', 1355293799, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2118, 0, 1, 0, 0, 0, '::1', 1355293900, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2119, 0, 1, 0, 0, 0, '::1', 1355293918, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2120, 0, 1, 0, 0, 0, '::1', 1355293936, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2121, 0, 1, 0, 0, 0, '::1', 1355300906, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2122, 0, 1, 0, 0, 0, '::1', 1355300961, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2123, 0, 1, 0, 0, 0, '::1', 1355301153, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2124, 0, 2, 0, 0, 0, '::1', 1355301158, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2125, 0, 2, 0, 0, 0, '::1', 1355301204, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2126, 0, 2, 0, 0, 0, '::1', 1355301205, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2127, 0, 2, 0, 0, 0, '::1', 1355301571, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2128, 0, 2, 0, 0, 0, '::1', 1355301572, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2129, 0, 2, 0, 0, 0, '::1', 1355301576, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2130, 0, 1, 0, 0, 0, '::1', 1355301581, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2131, 0, 1, 0, 0, 0, '::1', 1355301594, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2132, 0, 1, 0, 0, 0, '::1', 1355301758, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2133, 0, 1, 0, 0, 0, '::1', 1355301767, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2134, 0, 2, 0, 0, 0, '::1', 1355301771, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2135, 0, 2, 0, 0, 0, '::1', 1355301772, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2136, 0, 2, 0, 0, 0, '::1', 1355301789, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2137, 0, 2, 0, 0, 0, '::1', 1355301793, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2138, 0, 2, 0, 0, 0, '::1', 1355301800, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2139, 0, 2, 0, 0, 0, '::1', 1355301830, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2140, 0, 2, 0, 0, 0, '::1', 1355301840, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2141, 0, 2, 0, 0, 0, '::1', 1355301840, 'LOG_ADMIN_AUTH_SUCCESS', ''),
(2142, 0, 2, 0, 0, 0, '::1', 1355301844, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2143, 0, 2, 0, 0, 0, '::1', 1355301849, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2144, 0, 2, 0, 0, 0, '::1', 1355301852, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2145, 0, 2, 0, 0, 0, '::1', 1355301860, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2146, 0, 2, 0, 0, 0, '::1', 1355301884, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2147, 0, 1, 0, 0, 0, '::1', 1355309702, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2148, 0, 1, 0, 0, 0, '::1', 1355408109, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2149, 0, 1, 0, 0, 0, '::1', 1355408287, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2150, 0, 1, 0, 0, 0, '::1', 1355413284, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2151, 0, 1, 0, 0, 0, '::1', 1355655343, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2152, 0, 1, 0, 0, 0, '::1', 1355655376, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2153, 0, 1, 0, 0, 0, '::1', 1355655386, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2154, 0, 1, 0, 0, 0, '::1', 1355655398, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2155, 0, 2, 0, 0, 0, '::1', 1355655403, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2156, 0, 2, 0, 0, 0, '::1', 1355655409, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2157, 0, 2, 0, 0, 0, '::1', 1355655410, 'LOG_ADMIN_AUTH_SUCCESS', ''),
(2158, 0, 2, 0, 0, 0, '::1', 1355655413, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2159, 0, 2, 0, 0, 0, '::1', 1355655420, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2160, 0, 2, 0, 0, 0, '::1', 1355655427, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2161, 0, 2, 0, 0, 0, '::1', 1355655431, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2162, 0, 2, 0, 0, 0, '::1', 1355655435, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2163, 0, 2, 0, 0, 0, '::1', 1355655435, 'LOG_TEMPLATE_CACHE_CLEARED', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:158:"forumlist_body, index_body, jumpbox, login_body, message_body, overall_footer, overall_header, quickreply_editor, ucp_register, viewforum_body, viewtopic_body";}'),
(2164, 0, 2, 0, 0, 0, '::1', 1355655438, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2165, 0, 2, 0, 0, 0, '::1', 1355655441, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2166, 0, 2, 0, 0, 0, '::1', 1355655443, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2167, 0, 2, 0, 0, 0, '::1', 1355655446, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2168, 0, 2, 0, 0, 0, '::1', 1355655448, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2169, 0, 2, 0, 0, 0, '::1', 1355655448, 'LOG_TEMPLATE_CACHE_CLEARED', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:12:"Tutti i file";}'),
(2170, 0, 2, 0, 0, 0, '::1', 1355655450, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2171, 0, 2, 0, 0, 0, '::1', 1355655452, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2172, 0, 2, 0, 0, 0, '::1', 1355655455, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2173, 0, 2, 0, 0, 0, '::1', 1355655458, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2174, 0, 2, 0, 0, 0, '::1', 1355655458, 'LOG_THEME_REFRESHED', 'a:1:{i:0;s:12:"eMuza_summer";}'),
(2175, 0, 2, 0, 0, 0, '::1', 1355655460, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2176, 0, 2, 0, 0, 0, '::1', 1355655470, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2177, 0, 2, 0, 0, 0, '::1', 1355655595, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2178, 0, 2, 0, 0, 0, '::1', 1355655622, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2179, 0, 2, 0, 0, 0, '::1', 1355655626, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2180, 0, 2, 0, 0, 0, '::1', 1355655629, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2181, 0, 2, 0, 0, 0, '::1', 1355655629, 'LOG_THEME_REFRESHED', 'a:1:{i:0;s:12:"eMuza_summer";}'),
(2182, 0, 2, 0, 0, 0, '::1', 1355655632, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2183, 0, 2, 0, 0, 0, '::1', 1355655634, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2184, 0, 2, 0, 0, 0, '::1', 1355655966, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2185, 0, 2, 0, 0, 0, '::1', 1355656026, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2186, 0, 2, 0, 0, 0, '::1', 1355656029, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2187, 0, 2, 0, 0, 0, '::1', 1355656029, 'LOG_THEME_REFRESHED', 'a:1:{i:0;s:12:"eMuza_summer";}'),
(2188, 0, 2, 0, 0, 0, '::1', 1355656032, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2189, 0, 2, 0, 0, 0, '::1', 1355656036, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2190, 0, 2, 0, 0, 0, '::1', 1355656070, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2191, 0, 2, 0, 0, 0, '::1', 1355656097, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2192, 0, 2, 0, 0, 0, '::1', 1355656107, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2193, 0, 2, 0, 0, 0, '::1', 1355656107, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2194, 0, 2, 0, 0, 0, '::1', 1355656151, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2195, 0, 2, 0, 0, 0, '::1', 1355656151, 'LOG_TEMPLATE_CACHE_CLEARED', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:14:"overall_footer";}'),
(2196, 0, 2, 0, 0, 0, '::1', 1355656151, 'LOG_TEMPLATE_EDIT', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:19:"overall_footer.html";}'),
(2197, 0, 2, 0, 0, 0, '::1', 1355656154, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2198, 0, 2, 0, 0, 0, '::1', 1355656162, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2199, 0, 2, 0, 0, 0, '::1', 1355656176, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2200, 0, 2, 0, 0, 0, '::1', 1355656176, 'LOG_TEMPLATE_CACHE_CLEARED', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:14:"overall_footer";}'),
(2201, 0, 2, 0, 0, 0, '::1', 1355656176, 'LOG_TEMPLATE_EDIT', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:19:"overall_footer.html";}'),
(2202, 0, 2, 0, 0, 0, '::1', 1355656179, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2203, 0, 2, 0, 0, 0, '::1', 1355656190, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2204, 0, 2, 0, 0, 0, '::1', 1355656283, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2205, 0, 2, 0, 0, 0, '::1', 1355656283, 'LOG_TEMPLATE_CACHE_CLEARED', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:14:"overall_footer";}'),
(2206, 0, 2, 0, 0, 0, '::1', 1355656283, 'LOG_TEMPLATE_EDIT', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:19:"overall_footer.html";}'),
(2207, 0, 2, 0, 0, 0, '::1', 1355656286, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2208, 0, 2, 0, 0, 0, '::1', 1355656296, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2209, 0, 2, 0, 0, 0, '::1', 1355656551, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2210, 0, 2, 0, 0, 0, '::1', 1355656551, 'LOG_TEMPLATE_CACHE_CLEARED', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:14:"overall_footer";}'),
(2211, 0, 2, 0, 0, 0, '::1', 1355656551, 'LOG_TEMPLATE_EDIT', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:19:"overall_footer.html";}'),
(2212, 0, 2, 0, 0, 0, '::1', 1355656554, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2213, 0, 2, 0, 0, 0, '::1', 1355656701, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2214, 0, 2, 0, 0, 0, '::1', 1355656745, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2215, 0, 2, 0, 0, 0, '::1', 1355656746, 'LOG_TEMPLATE_CACHE_CLEARED', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:14:"overall_footer";}'),
(2216, 0, 2, 0, 0, 0, '::1', 1355656746, 'LOG_TEMPLATE_EDIT', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:19:"overall_footer.html";}'),
(2217, 0, 2, 0, 0, 0, '::1', 1355656764, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2218, 0, 2, 0, 0, 0, '::1', 1355656772, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2219, 0, 2, 0, 0, 0, '::1', 1355656794, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2220, 0, 2, 0, 0, 0, '::1', 1355656794, 'LOG_TEMPLATE_CACHE_CLEARED', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:14:"overall_footer";}'),
(2221, 0, 2, 0, 0, 0, '::1', 1355656794, 'LOG_TEMPLATE_EDIT', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:19:"overall_footer.html";}'),
(2222, 0, 2, 0, 0, 0, '::1', 1355656797, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2223, 0, 2, 0, 0, 0, '::1', 1355656806, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2224, 0, 2, 0, 0, 0, '::1', 1355656819, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2225, 0, 2, 0, 0, 0, '::1', 1355656819, 'LOG_TEMPLATE_CACHE_CLEARED', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:14:"overall_footer";}'),
(2226, 0, 2, 0, 0, 0, '::1', 1355656819, 'LOG_TEMPLATE_EDIT', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:19:"overall_footer.html";}'),
(2227, 0, 2, 0, 0, 0, '::1', 1355656823, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2228, 0, 2, 0, 0, 0, '::1', 1355656831, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2229, 0, 2, 0, 0, 0, '::1', 1355656862, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2230, 0, 2, 0, 0, 0, '::1', 1355656862, 'LOG_TEMPLATE_CACHE_CLEARED', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:14:"overall_footer";}'),
(2231, 0, 2, 0, 0, 0, '::1', 1355656862, 'LOG_TEMPLATE_EDIT', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:19:"overall_footer.html";}'),
(2232, 0, 2, 0, 0, 0, '::1', 1355656865, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2233, 0, 2, 0, 0, 0, '::1', 1355656879, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2234, 0, 2, 0, 0, 0, '::1', 1355656898, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2235, 0, 2, 0, 0, 0, '::1', 1355656898, 'LOG_TEMPLATE_CACHE_CLEARED', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:14:"overall_footer";}'),
(2236, 0, 2, 0, 0, 0, '::1', 1355656898, 'LOG_TEMPLATE_EDIT', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:19:"overall_footer.html";}'),
(2237, 0, 2, 0, 0, 0, '::1', 1355656900, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2238, 0, 2, 0, 0, 0, '::1', 1355656913, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2239, 0, 2, 0, 0, 0, '::1', 1355656929, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2240, 0, 2, 0, 0, 0, '::1', 1355656929, 'LOG_TEMPLATE_CACHE_CLEARED', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:14:"overall_footer";}'),
(2241, 0, 2, 0, 0, 0, '::1', 1355656929, 'LOG_TEMPLATE_EDIT', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:19:"overall_footer.html";}'),
(2242, 0, 2, 0, 0, 0, '::1', 1355656932, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2243, 0, 2, 0, 0, 0, '::1', 1355656948, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2244, 0, 2, 0, 0, 0, '::1', 1355656966, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2245, 0, 2, 0, 0, 0, '::1', 1355656967, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2246, 0, 2, 0, 0, 0, '::1', 1355656978, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2247, 0, 2, 0, 0, 0, '::1', 1355657016, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2248, 0, 2, 0, 0, 0, '::1', 1355657017, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2249, 0, 2, 0, 0, 0, '::1', 1355657051, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2250, 0, 2, 0, 0, 0, '::1', 1355657051, 'LOG_TEMPLATE_CACHE_CLEARED', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:14:"overall_footer";}'),
(2251, 0, 2, 0, 0, 0, '::1', 1355657051, 'LOG_TEMPLATE_EDIT', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:19:"overall_footer.html";}'),
(2252, 0, 2, 0, 0, 0, '::1', 1355657054, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2253, 0, 2, 0, 0, 0, '::1', 1355657136, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2254, 0, 2, 0, 0, 0, '::1', 1355657143, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2255, 0, 2, 0, 0, 0, '::1', 1355657144, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2256, 0, 2, 0, 0, 0, '::1', 1355657150, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2257, 0, 2, 0, 0, 0, '::1', 1355657163, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2258, 0, 2, 0, 0, 0, '::1', 1355657164, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2259, 0, 2, 0, 0, 0, '::1', 1355657169, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2260, 0, 2, 0, 0, 0, '::1', 1355657170, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2261, 0, 2, 0, 0, 0, '::1', 1355657177, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2262, 0, 2, 0, 0, 0, '::1', 1355657188, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2263, 0, 2, 0, 0, 0, '::1', 1355657189, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2264, 0, 2, 0, 0, 0, '::1', 1355657219, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2265, 0, 2, 0, 0, 0, '::1', 1355657219, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2266, 0, 2, 0, 0, 0, '::1', 1355657233, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2267, 0, 2, 0, 0, 0, '::1', 1355657237, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2268, 0, 2, 0, 0, 0, '::1', 1355657270, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2269, 0, 2, 0, 0, 0, '::1', 1355657270, 'LOG_TEMPLATE_CACHE_CLEARED', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:14:"overall_header";}'),
(2270, 0, 2, 0, 0, 0, '::1', 1355657270, 'LOG_TEMPLATE_EDIT', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:19:"overall_header.html";}'),
(2271, 0, 2, 0, 0, 0, '::1', 1355657274, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2272, 0, 2, 0, 0, 0, '::1', 1355657277, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2273, 0, 2, 0, 0, 0, '::1', 1355657280, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2274, 0, 1, 0, 0, 0, '::1', 1355657286, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2275, 0, 1, 0, 0, 0, '::1', 1355657378, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2276, 0, 1, 0, 0, 0, '::1', 1355657387, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2277, 0, 2, 0, 0, 0, '::1', 1355657391, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2278, 0, 2, 0, 0, 0, '::1', 1355657401, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2279, 0, 2, 0, 0, 0, '::1', 1355657407, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2280, 0, 2, 0, 0, 0, '::1', 1355657408, 'LOG_ADMIN_AUTH_SUCCESS', ''),
(2281, 0, 2, 0, 0, 0, '::1', 1355657411, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2282, 0, 2, 0, 0, 0, '::1', 1355657428, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2283, 0, 2, 0, 0, 0, '::1', 1355657530, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2284, 0, 2, 0, 0, 0, '::1', 1355657557, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2285, 0, 2, 0, 0, 0, '::1', 1355657560, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2286, 0, 2, 0, 0, 0, '::1', 1355657562, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2287, 0, 1, 0, 0, 0, '127.0.0.1', 1355926655, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2288, 0, 1, 0, 0, 0, '127.0.0.1', 1355926814, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2289, 0, 1, 0, 0, 0, '127.0.0.1', 1355926889, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2290, 0, 1, 0, 0, 0, '127.0.0.1', 1355926904, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2291, 0, 1, 0, 0, 0, '127.0.0.1', 1355926922, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2292, 0, 1, 0, 0, 0, '127.0.0.1', 1355926975, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2293, 0, 1, 0, 0, 0, '127.0.0.1', 1355927001, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2294, 2, 1, 0, 0, 0, '127.0.0.1', 1355927002, 'LOG_ERROR_EMAIL', 'a:1:{i:0;s:350:"<strong>EMAIL/PHP/mail()</strong><br /><em>/forum/ucp.php</em><br /><br />Errno 2: mail() [<a href=''function.mail''>function.mail</a>]: Failed to connect to mailserver at &quot;127.0.0.1&quot; port 25, verify your &quot;SMTP&quot; and &quot;smtp_port&quot; setting in php.ini or use ini_set() at [ROOT]/includes/functions_messenger.php line 1651<br />";}'),
(2295, 0, 1, 0, 0, 0, '127.0.0.1', 1355927037, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2296, 0, 1, 0, 0, 0, '127.0.0.1', 1355927050, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2297, 0, 59, 0, 0, 0, '127.0.0.1', 1355927056, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2298, 0, 59, 0, 0, 0, '127.0.0.1', 1355927057, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2299, 0, 1, 0, 0, 0, '127.0.0.1', 1355927175, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2300, 0, 1, 0, 0, 0, '127.0.0.1', 1355927178, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2301, 0, 1, 0, 0, 0, '127.0.0.1', 1355927186, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2302, 0, 61, 0, 0, 0, '127.0.0.1', 1355927191, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2303, 0, 61, 0, 0, 0, '127.0.0.1', 1355929719, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2304, 0, 61, 0, 0, 0, '127.0.0.1', 1355929828, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2305, 0, 61, 0, 0, 0, '127.0.0.1', 1355929855, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2306, 0, 61, 0, 0, 0, '127.0.0.1', 1355929859, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}'),
(2307, 0, 1, 0, 0, 0, '127.0.0.1', 1355929864, 'LOG_IMAGESET_LANG_MISSING', 'a:2:{i:0;s:12:"eMuza_summer";i:1;s:2:"it";}');

-- --------------------------------------------------------

--
-- Struttura della tabella `phpbb_login_attempts`
--

CREATE TABLE IF NOT EXISTS `phpbb_login_attempts` (
  `attempt_ip` varchar(40) COLLATE utf8_bin NOT NULL DEFAULT '',
  `attempt_browser` varchar(150) COLLATE utf8_bin NOT NULL DEFAULT '',
  `attempt_forwarded_for` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `attempt_time` int(11) unsigned NOT NULL DEFAULT '0',
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '0',
  `username_clean` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '0',
  KEY `att_ip` (`attempt_ip`,`attempt_time`),
  KEY `att_for` (`attempt_forwarded_for`,`attempt_time`),
  KEY `att_time` (`attempt_time`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dump dei dati per la tabella `phpbb_login_attempts`
--

INSERT INTO `phpbb_login_attempts` (`attempt_ip`, `attempt_browser`, `attempt_forwarded_for`, `attempt_time`, `user_id`, `username`, `username_clean`) VALUES
('127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97 Safari/537.11', '', 1355926814, 0, 'M.Alfonso', 'm.alfonso'),
('127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97 Safari/537.11', '', 1355926904, 0, 'M.Alfonso', 'm.alfonso'),
('127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97 Safari/537.11', '', 1355926922, 0, 'MAlfonso', 'malfonso');

-- --------------------------------------------------------

--
-- Struttura della tabella `phpbb_moderator_cache`
--

CREATE TABLE IF NOT EXISTS `phpbb_moderator_cache` (
  `forum_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `group_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `group_name` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `display_on_index` tinyint(1) unsigned NOT NULL DEFAULT '1',
  KEY `disp_idx` (`display_on_index`),
  KEY `forum_id` (`forum_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Struttura della tabella `phpbb_modules`
--

CREATE TABLE IF NOT EXISTS `phpbb_modules` (
  `module_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `module_enabled` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `module_display` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `module_basename` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `module_class` varchar(10) COLLATE utf8_bin NOT NULL DEFAULT '',
  `parent_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `left_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `right_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `module_langname` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `module_mode` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `module_auth` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`module_id`),
  KEY `left_right_id` (`left_id`,`right_id`),
  KEY `module_enabled` (`module_enabled`),
  KEY `class_left_id` (`module_class`,`left_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=199 ;

--
-- Dump dei dati per la tabella `phpbb_modules`
--

INSERT INTO `phpbb_modules` (`module_id`, `module_enabled`, `module_display`, `module_basename`, `module_class`, `parent_id`, `left_id`, `right_id`, `module_langname`, `module_mode`, `module_auth`) VALUES
(1, 1, 1, '', 'acp', 0, 1, 64, 'ACP_CAT_GENERAL', '', ''),
(2, 1, 1, '', 'acp', 1, 4, 17, 'ACP_QUICK_ACCESS', '', ''),
(3, 1, 1, '', 'acp', 1, 18, 41, 'ACP_BOARD_CONFIGURATION', '', ''),
(4, 1, 1, '', 'acp', 1, 42, 49, 'ACP_CLIENT_COMMUNICATION', '', ''),
(5, 1, 1, '', 'acp', 1, 50, 63, 'ACP_SERVER_CONFIGURATION', '', ''),
(6, 1, 1, '', 'acp', 0, 65, 84, 'ACP_CAT_FORUMS', '', ''),
(7, 1, 1, '', 'acp', 6, 66, 71, 'ACP_MANAGE_FORUMS', '', ''),
(8, 1, 1, '', 'acp', 6, 72, 83, 'ACP_FORUM_BASED_PERMISSIONS', '', ''),
(9, 1, 1, '', 'acp', 0, 85, 110, 'ACP_CAT_POSTING', '', ''),
(10, 1, 1, '', 'acp', 9, 86, 99, 'ACP_MESSAGES', '', ''),
(11, 1, 1, '', 'acp', 9, 100, 109, 'ACP_ATTACHMENTS', '', ''),
(12, 1, 1, '', 'acp', 0, 111, 166, 'ACP_CAT_USERGROUP', '', ''),
(13, 1, 1, '', 'acp', 12, 112, 145, 'ACP_CAT_USERS', '', ''),
(14, 1, 1, '', 'acp', 12, 146, 153, 'ACP_GROUPS', '', ''),
(15, 1, 1, '', 'acp', 12, 154, 165, 'ACP_USER_SECURITY', '', ''),
(16, 1, 1, '', 'acp', 0, 167, 216, 'ACP_CAT_PERMISSIONS', '', ''),
(17, 1, 1, '', 'acp', 16, 170, 179, 'ACP_GLOBAL_PERMISSIONS', '', ''),
(18, 1, 1, '', 'acp', 16, 180, 191, 'ACP_FORUM_BASED_PERMISSIONS', '', ''),
(19, 1, 1, '', 'acp', 16, 192, 201, 'ACP_PERMISSION_ROLES', '', ''),
(20, 1, 1, '', 'acp', 16, 202, 215, 'ACP_PERMISSION_MASKS', '', ''),
(21, 1, 1, '', 'acp', 0, 217, 230, 'ACP_CAT_STYLES', '', ''),
(22, 1, 1, '', 'acp', 21, 218, 221, 'ACP_STYLE_MANAGEMENT', '', ''),
(23, 1, 1, '', 'acp', 21, 222, 229, 'ACP_STYLE_COMPONENTS', '', ''),
(24, 1, 1, '', 'acp', 0, 231, 250, 'ACP_CAT_MAINTENANCE', '', ''),
(25, 1, 1, '', 'acp', 24, 232, 241, 'ACP_FORUM_LOGS', '', ''),
(26, 1, 1, '', 'acp', 24, 242, 249, 'ACP_CAT_DATABASE', '', ''),
(27, 1, 1, '', 'acp', 0, 251, 276, 'ACP_CAT_SYSTEM', '', ''),
(28, 1, 1, '', 'acp', 27, 252, 255, 'ACP_AUTOMATION', '', ''),
(29, 1, 1, '', 'acp', 27, 256, 267, 'ACP_GENERAL_TASKS', '', ''),
(30, 1, 1, '', 'acp', 27, 268, 275, 'ACP_MODULE_MANAGEMENT', '', ''),
(31, 1, 1, '', 'acp', 0, 277, 278, 'ACP_CAT_DOT_MODS', '', ''),
(32, 1, 1, 'attachments', 'acp', 3, 19, 20, 'ACP_ATTACHMENT_SETTINGS', 'attach', 'acl_a_attach'),
(33, 1, 1, 'attachments', 'acp', 11, 101, 102, 'ACP_ATTACHMENT_SETTINGS', 'attach', 'acl_a_attach'),
(34, 1, 1, 'attachments', 'acp', 11, 103, 104, 'ACP_MANAGE_EXTENSIONS', 'extensions', 'acl_a_attach'),
(35, 1, 1, 'attachments', 'acp', 11, 105, 106, 'ACP_EXTENSION_GROUPS', 'ext_groups', 'acl_a_attach'),
(36, 1, 1, 'attachments', 'acp', 11, 107, 108, 'ACP_ORPHAN_ATTACHMENTS', 'orphan', 'acl_a_attach'),
(37, 1, 1, 'ban', 'acp', 15, 155, 156, 'ACP_BAN_EMAILS', 'email', 'acl_a_ban'),
(38, 1, 1, 'ban', 'acp', 15, 157, 158, 'ACP_BAN_IPS', 'ip', 'acl_a_ban'),
(39, 1, 1, 'ban', 'acp', 15, 159, 160, 'ACP_BAN_USERNAMES', 'user', 'acl_a_ban'),
(40, 1, 1, 'bbcodes', 'acp', 10, 87, 88, 'ACP_BBCODES', 'bbcodes', 'acl_a_bbcode'),
(41, 1, 1, 'board', 'acp', 3, 21, 22, 'ACP_BOARD_SETTINGS', 'settings', 'acl_a_board'),
(42, 1, 1, 'board', 'acp', 3, 23, 24, 'ACP_BOARD_FEATURES', 'features', 'acl_a_board'),
(43, 1, 1, 'board', 'acp', 3, 25, 26, 'ACP_AVATAR_SETTINGS', 'avatar', 'acl_a_board'),
(44, 1, 1, 'board', 'acp', 3, 27, 28, 'ACP_MESSAGE_SETTINGS', 'message', 'acl_a_board'),
(45, 1, 1, 'board', 'acp', 10, 89, 90, 'ACP_MESSAGE_SETTINGS', 'message', 'acl_a_board'),
(46, 1, 1, 'board', 'acp', 3, 29, 30, 'ACP_POST_SETTINGS', 'post', 'acl_a_board'),
(47, 1, 1, 'board', 'acp', 10, 91, 92, 'ACP_POST_SETTINGS', 'post', 'acl_a_board'),
(48, 1, 1, 'board', 'acp', 3, 31, 32, 'ACP_SIGNATURE_SETTINGS', 'signature', 'acl_a_board'),
(49, 1, 1, 'board', 'acp', 3, 33, 34, 'ACP_FEED_SETTINGS', 'feed', 'acl_a_board'),
(50, 1, 1, 'board', 'acp', 3, 35, 36, 'ACP_REGISTER_SETTINGS', 'registration', 'acl_a_board'),
(51, 1, 1, 'board', 'acp', 4, 43, 44, 'ACP_AUTH_SETTINGS', 'auth', 'acl_a_server'),
(52, 1, 1, 'board', 'acp', 4, 45, 46, 'ACP_EMAIL_SETTINGS', 'email', 'acl_a_server'),
(53, 1, 1, 'board', 'acp', 5, 51, 52, 'ACP_COOKIE_SETTINGS', 'cookie', 'acl_a_server'),
(54, 1, 1, 'board', 'acp', 5, 53, 54, 'ACP_SERVER_SETTINGS', 'server', 'acl_a_server'),
(55, 1, 1, 'board', 'acp', 5, 55, 56, 'ACP_SECURITY_SETTINGS', 'security', 'acl_a_server'),
(56, 1, 1, 'board', 'acp', 5, 57, 58, 'ACP_LOAD_SETTINGS', 'load', 'acl_a_server'),
(57, 1, 1, 'bots', 'acp', 29, 257, 258, 'ACP_BOTS', 'bots', 'acl_a_bots'),
(58, 1, 1, 'captcha', 'acp', 3, 37, 38, 'ACP_VC_SETTINGS', 'visual', 'acl_a_board'),
(59, 1, 0, 'captcha', 'acp', 3, 39, 40, 'ACP_VC_CAPTCHA_DISPLAY', 'img', 'acl_a_board'),
(60, 1, 1, 'database', 'acp', 26, 243, 244, 'ACP_BACKUP', 'backup', 'acl_a_backup'),
(61, 1, 1, 'database', 'acp', 26, 245, 246, 'ACP_RESTORE', 'restore', 'acl_a_backup'),
(62, 1, 1, 'disallow', 'acp', 15, 161, 162, 'ACP_DISALLOW_USERNAMES', 'usernames', 'acl_a_names'),
(63, 1, 1, 'email', 'acp', 29, 259, 260, 'ACP_MASS_EMAIL', 'email', 'acl_a_email && cfg_email_enable'),
(64, 1, 1, 'forums', 'acp', 7, 67, 68, 'ACP_MANAGE_FORUMS', 'manage', 'acl_a_forum'),
(65, 1, 1, 'groups', 'acp', 14, 147, 148, 'ACP_GROUPS_MANAGE', 'manage', 'acl_a_group'),
(66, 1, 1, 'icons', 'acp', 10, 93, 94, 'ACP_ICONS', 'icons', 'acl_a_icons'),
(67, 1, 1, 'icons', 'acp', 10, 95, 96, 'ACP_SMILIES', 'smilies', 'acl_a_icons'),
(68, 1, 1, 'inactive', 'acp', 13, 115, 116, 'ACP_INACTIVE_USERS', 'list', 'acl_a_user'),
(69, 1, 1, 'jabber', 'acp', 4, 47, 48, 'ACP_JABBER_SETTINGS', 'settings', 'acl_a_jabber'),
(70, 1, 1, 'language', 'acp', 29, 261, 262, 'ACP_LANGUAGE_PACKS', 'lang_packs', 'acl_a_language'),
(71, 1, 1, 'logs', 'acp', 25, 233, 234, 'ACP_ADMIN_LOGS', 'admin', 'acl_a_viewlogs'),
(72, 1, 1, 'logs', 'acp', 25, 235, 236, 'ACP_MOD_LOGS', 'mod', 'acl_a_viewlogs'),
(73, 1, 1, 'logs', 'acp', 25, 237, 238, 'ACP_USERS_LOGS', 'users', 'acl_a_viewlogs'),
(74, 1, 1, 'logs', 'acp', 25, 239, 240, 'ACP_CRITICAL_LOGS', 'critical', 'acl_a_viewlogs'),
(75, 1, 1, 'main', 'acp', 1, 2, 3, 'ACP_INDEX', 'main', ''),
(76, 1, 1, 'modules', 'acp', 30, 269, 270, 'ACP', 'acp', 'acl_a_modules'),
(77, 1, 1, 'modules', 'acp', 30, 271, 272, 'UCP', 'ucp', 'acl_a_modules'),
(78, 1, 1, 'modules', 'acp', 30, 273, 274, 'MCP', 'mcp', 'acl_a_modules'),
(79, 1, 1, 'permission_roles', 'acp', 19, 193, 194, 'ACP_ADMIN_ROLES', 'admin_roles', 'acl_a_roles && acl_a_aauth'),
(80, 1, 1, 'permission_roles', 'acp', 19, 195, 196, 'ACP_USER_ROLES', 'user_roles', 'acl_a_roles && acl_a_uauth'),
(81, 1, 1, 'permission_roles', 'acp', 19, 197, 198, 'ACP_MOD_ROLES', 'mod_roles', 'acl_a_roles && acl_a_mauth'),
(82, 1, 1, 'permission_roles', 'acp', 19, 199, 200, 'ACP_FORUM_ROLES', 'forum_roles', 'acl_a_roles && acl_a_fauth'),
(83, 1, 1, 'permissions', 'acp', 16, 168, 169, 'ACP_PERMISSIONS', 'intro', 'acl_a_authusers || acl_a_authgroups || acl_a_viewauth'),
(84, 1, 0, 'permissions', 'acp', 20, 203, 204, 'ACP_PERMISSION_TRACE', 'trace', 'acl_a_viewauth'),
(85, 1, 1, 'permissions', 'acp', 18, 181, 182, 'ACP_FORUM_PERMISSIONS', 'setting_forum_local', 'acl_a_fauth && (acl_a_authusers || acl_a_authgroups)'),
(86, 1, 1, 'permissions', 'acp', 18, 183, 184, 'ACP_FORUM_PERMISSIONS_COPY', 'setting_forum_copy', 'acl_a_fauth && acl_a_authusers && acl_a_authgroups && acl_a_mauth'),
(87, 1, 1, 'permissions', 'acp', 18, 185, 186, 'ACP_FORUM_MODERATORS', 'setting_mod_local', 'acl_a_mauth && (acl_a_authusers || acl_a_authgroups)'),
(88, 1, 1, 'permissions', 'acp', 17, 171, 172, 'ACP_USERS_PERMISSIONS', 'setting_user_global', 'acl_a_authusers && (acl_a_aauth || acl_a_mauth || acl_a_uauth)'),
(89, 1, 1, 'permissions', 'acp', 13, 117, 118, 'ACP_USERS_PERMISSIONS', 'setting_user_global', 'acl_a_authusers && (acl_a_aauth || acl_a_mauth || acl_a_uauth)'),
(90, 1, 1, 'permissions', 'acp', 18, 187, 188, 'ACP_USERS_FORUM_PERMISSIONS', 'setting_user_local', 'acl_a_authusers && (acl_a_mauth || acl_a_fauth)'),
(91, 1, 1, 'permissions', 'acp', 13, 119, 120, 'ACP_USERS_FORUM_PERMISSIONS', 'setting_user_local', 'acl_a_authusers && (acl_a_mauth || acl_a_fauth)'),
(92, 1, 1, 'permissions', 'acp', 17, 173, 174, 'ACP_GROUPS_PERMISSIONS', 'setting_group_global', 'acl_a_authgroups && (acl_a_aauth || acl_a_mauth || acl_a_uauth)'),
(93, 1, 1, 'permissions', 'acp', 14, 149, 150, 'ACP_GROUPS_PERMISSIONS', 'setting_group_global', 'acl_a_authgroups && (acl_a_aauth || acl_a_mauth || acl_a_uauth)'),
(94, 1, 1, 'permissions', 'acp', 18, 189, 190, 'ACP_GROUPS_FORUM_PERMISSIONS', 'setting_group_local', 'acl_a_authgroups && (acl_a_mauth || acl_a_fauth)'),
(95, 1, 1, 'permissions', 'acp', 14, 151, 152, 'ACP_GROUPS_FORUM_PERMISSIONS', 'setting_group_local', 'acl_a_authgroups && (acl_a_mauth || acl_a_fauth)'),
(96, 1, 1, 'permissions', 'acp', 17, 175, 176, 'ACP_ADMINISTRATORS', 'setting_admin_global', 'acl_a_aauth && (acl_a_authusers || acl_a_authgroups)'),
(97, 1, 1, 'permissions', 'acp', 17, 177, 178, 'ACP_GLOBAL_MODERATORS', 'setting_mod_global', 'acl_a_mauth && (acl_a_authusers || acl_a_authgroups)'),
(98, 1, 1, 'permissions', 'acp', 20, 205, 206, 'ACP_VIEW_ADMIN_PERMISSIONS', 'view_admin_global', 'acl_a_viewauth'),
(99, 1, 1, 'permissions', 'acp', 20, 207, 208, 'ACP_VIEW_USER_PERMISSIONS', 'view_user_global', 'acl_a_viewauth'),
(100, 1, 1, 'permissions', 'acp', 20, 209, 210, 'ACP_VIEW_GLOBAL_MOD_PERMISSIONS', 'view_mod_global', 'acl_a_viewauth'),
(101, 1, 1, 'permissions', 'acp', 20, 211, 212, 'ACP_VIEW_FORUM_MOD_PERMISSIONS', 'view_mod_local', 'acl_a_viewauth'),
(102, 1, 1, 'permissions', 'acp', 20, 213, 214, 'ACP_VIEW_FORUM_PERMISSIONS', 'view_forum_local', 'acl_a_viewauth'),
(103, 1, 1, 'php_info', 'acp', 29, 263, 264, 'ACP_PHP_INFO', 'info', 'acl_a_phpinfo'),
(104, 1, 1, 'profile', 'acp', 13, 121, 122, 'ACP_CUSTOM_PROFILE_FIELDS', 'profile', 'acl_a_profile'),
(105, 1, 1, 'prune', 'acp', 7, 69, 70, 'ACP_PRUNE_FORUMS', 'forums', 'acl_a_prune'),
(106, 1, 1, 'prune', 'acp', 15, 163, 164, 'ACP_PRUNE_USERS', 'users', 'acl_a_userdel'),
(107, 1, 1, 'ranks', 'acp', 13, 123, 124, 'ACP_MANAGE_RANKS', 'ranks', 'acl_a_ranks'),
(108, 1, 1, 'reasons', 'acp', 29, 265, 266, 'ACP_MANAGE_REASONS', 'main', 'acl_a_reasons'),
(109, 1, 1, 'search', 'acp', 5, 59, 60, 'ACP_SEARCH_SETTINGS', 'settings', 'acl_a_search'),
(110, 1, 1, 'search', 'acp', 26, 247, 248, 'ACP_SEARCH_INDEX', 'index', 'acl_a_search'),
(111, 1, 1, 'send_statistics', 'acp', 5, 61, 62, 'ACP_SEND_STATISTICS', 'send_statistics', 'acl_a_server'),
(112, 1, 1, 'styles', 'acp', 22, 219, 220, 'ACP_STYLES', 'style', 'acl_a_styles'),
(113, 1, 1, 'styles', 'acp', 23, 223, 224, 'ACP_TEMPLATES', 'template', 'acl_a_styles'),
(114, 1, 1, 'styles', 'acp', 23, 225, 226, 'ACP_THEMES', 'theme', 'acl_a_styles'),
(115, 1, 1, 'styles', 'acp', 23, 227, 228, 'ACP_IMAGESETS', 'imageset', 'acl_a_styles'),
(116, 1, 1, 'update', 'acp', 28, 253, 254, 'ACP_VERSION_CHECK', 'version_check', 'acl_a_board'),
(117, 1, 1, 'users', 'acp', 13, 113, 114, 'ACP_MANAGE_USERS', 'overview', 'acl_a_user'),
(118, 1, 0, 'users', 'acp', 13, 125, 126, 'ACP_USER_FEEDBACK', 'feedback', 'acl_a_user'),
(119, 1, 0, 'users', 'acp', 13, 127, 128, 'ACP_USER_WARNINGS', 'warnings', 'acl_a_user'),
(120, 1, 0, 'users', 'acp', 13, 129, 130, 'ACP_USER_PROFILE', 'profile', 'acl_a_user'),
(121, 1, 0, 'users', 'acp', 13, 131, 132, 'ACP_USER_PREFS', 'prefs', 'acl_a_user'),
(122, 1, 0, 'users', 'acp', 13, 133, 134, 'ACP_USER_AVATAR', 'avatar', 'acl_a_user'),
(123, 1, 0, 'users', 'acp', 13, 135, 136, 'ACP_USER_RANK', 'rank', 'acl_a_user'),
(124, 1, 0, 'users', 'acp', 13, 137, 138, 'ACP_USER_SIG', 'sig', 'acl_a_user'),
(125, 1, 0, 'users', 'acp', 13, 139, 140, 'ACP_USER_GROUPS', 'groups', 'acl_a_user && acl_a_group'),
(126, 1, 0, 'users', 'acp', 13, 141, 142, 'ACP_USER_PERM', 'perm', 'acl_a_user && acl_a_viewauth'),
(127, 1, 0, 'users', 'acp', 13, 143, 144, 'ACP_USER_ATTACH', 'attach', 'acl_a_user'),
(128, 1, 1, 'words', 'acp', 10, 97, 98, 'ACP_WORDS', 'words', 'acl_a_words'),
(129, 1, 1, 'users', 'acp', 2, 5, 6, 'ACP_MANAGE_USERS', 'overview', 'acl_a_user'),
(130, 1, 1, 'groups', 'acp', 2, 7, 8, 'ACP_GROUPS_MANAGE', 'manage', 'acl_a_group'),
(131, 1, 1, 'forums', 'acp', 2, 9, 10, 'ACP_MANAGE_FORUMS', 'manage', 'acl_a_forum'),
(132, 1, 1, 'logs', 'acp', 2, 11, 12, 'ACP_MOD_LOGS', 'mod', 'acl_a_viewlogs'),
(133, 1, 1, 'bots', 'acp', 2, 13, 14, 'ACP_BOTS', 'bots', 'acl_a_bots'),
(134, 1, 1, 'php_info', 'acp', 2, 15, 16, 'ACP_PHP_INFO', 'info', 'acl_a_phpinfo'),
(135, 1, 1, 'permissions', 'acp', 8, 73, 74, 'ACP_FORUM_PERMISSIONS', 'setting_forum_local', 'acl_a_fauth && (acl_a_authusers || acl_a_authgroups)'),
(136, 1, 1, 'permissions', 'acp', 8, 75, 76, 'ACP_FORUM_PERMISSIONS_COPY', 'setting_forum_copy', 'acl_a_fauth && acl_a_authusers && acl_a_authgroups && acl_a_mauth'),
(137, 1, 1, 'permissions', 'acp', 8, 77, 78, 'ACP_FORUM_MODERATORS', 'setting_mod_local', 'acl_a_mauth && (acl_a_authusers || acl_a_authgroups)'),
(138, 1, 1, 'permissions', 'acp', 8, 79, 80, 'ACP_USERS_FORUM_PERMISSIONS', 'setting_user_local', 'acl_a_authusers && (acl_a_mauth || acl_a_fauth)'),
(139, 1, 1, 'permissions', 'acp', 8, 81, 82, 'ACP_GROUPS_FORUM_PERMISSIONS', 'setting_group_local', 'acl_a_authgroups && (acl_a_mauth || acl_a_fauth)'),
(140, 1, 1, '', 'mcp', 0, 1, 10, 'MCP_MAIN', '', ''),
(141, 1, 1, '', 'mcp', 0, 11, 18, 'MCP_QUEUE', '', ''),
(142, 1, 1, '', 'mcp', 0, 19, 32, 'MCP_REPORTS', '', ''),
(143, 1, 1, '', 'mcp', 0, 33, 38, 'MCP_NOTES', '', ''),
(144, 1, 1, '', 'mcp', 0, 39, 48, 'MCP_WARN', '', ''),
(145, 1, 1, '', 'mcp', 0, 49, 56, 'MCP_LOGS', '', ''),
(146, 1, 1, '', 'mcp', 0, 57, 64, 'MCP_BAN', '', ''),
(147, 1, 1, 'ban', 'mcp', 146, 58, 59, 'MCP_BAN_USERNAMES', 'user', 'acl_m_ban'),
(148, 1, 1, 'ban', 'mcp', 146, 60, 61, 'MCP_BAN_IPS', 'ip', 'acl_m_ban'),
(149, 1, 1, 'ban', 'mcp', 146, 62, 63, 'MCP_BAN_EMAILS', 'email', 'acl_m_ban'),
(150, 1, 1, 'logs', 'mcp', 145, 50, 51, 'MCP_LOGS_FRONT', 'front', 'acl_m_ || aclf_m_'),
(151, 1, 1, 'logs', 'mcp', 145, 52, 53, 'MCP_LOGS_FORUM_VIEW', 'forum_logs', 'acl_m_,$id'),
(152, 1, 1, 'logs', 'mcp', 145, 54, 55, 'MCP_LOGS_TOPIC_VIEW', 'topic_logs', 'acl_m_,$id'),
(153, 1, 1, 'main', 'mcp', 140, 2, 3, 'MCP_MAIN_FRONT', 'front', ''),
(154, 1, 1, 'main', 'mcp', 140, 4, 5, 'MCP_MAIN_FORUM_VIEW', 'forum_view', 'acl_m_,$id'),
(155, 1, 1, 'main', 'mcp', 140, 6, 7, 'MCP_MAIN_TOPIC_VIEW', 'topic_view', 'acl_m_,$id'),
(156, 1, 1, 'main', 'mcp', 140, 8, 9, 'MCP_MAIN_POST_DETAILS', 'post_details', 'acl_m_,$id || (!$id && aclf_m_)'),
(157, 1, 1, 'notes', 'mcp', 143, 34, 35, 'MCP_NOTES_FRONT', 'front', ''),
(158, 1, 1, 'notes', 'mcp', 143, 36, 37, 'MCP_NOTES_USER', 'user_notes', ''),
(159, 1, 1, 'pm_reports', 'mcp', 142, 20, 21, 'MCP_PM_REPORTS_OPEN', 'pm_reports', 'aclf_m_report'),
(160, 1, 1, 'pm_reports', 'mcp', 142, 22, 23, 'MCP_PM_REPORTS_CLOSED', 'pm_reports_closed', 'aclf_m_report'),
(161, 1, 1, 'pm_reports', 'mcp', 142, 24, 25, 'MCP_PM_REPORT_DETAILS', 'pm_report_details', 'aclf_m_report'),
(162, 1, 1, 'queue', 'mcp', 141, 12, 13, 'MCP_QUEUE_UNAPPROVED_TOPICS', 'unapproved_topics', 'aclf_m_approve'),
(163, 1, 1, 'queue', 'mcp', 141, 14, 15, 'MCP_QUEUE_UNAPPROVED_POSTS', 'unapproved_posts', 'aclf_m_approve'),
(164, 1, 1, 'queue', 'mcp', 141, 16, 17, 'MCP_QUEUE_APPROVE_DETAILS', 'approve_details', 'acl_m_approve,$id || (!$id && aclf_m_approve)'),
(165, 1, 1, 'reports', 'mcp', 142, 26, 27, 'MCP_REPORTS_OPEN', 'reports', 'aclf_m_report'),
(166, 1, 1, 'reports', 'mcp', 142, 28, 29, 'MCP_REPORTS_CLOSED', 'reports_closed', 'aclf_m_report'),
(167, 1, 1, 'reports', 'mcp', 142, 30, 31, 'MCP_REPORT_DETAILS', 'report_details', 'acl_m_report,$id || (!$id && aclf_m_report)'),
(168, 1, 1, 'warn', 'mcp', 144, 40, 41, 'MCP_WARN_FRONT', 'front', 'aclf_m_warn'),
(169, 1, 1, 'warn', 'mcp', 144, 42, 43, 'MCP_WARN_LIST', 'list', 'aclf_m_warn'),
(170, 1, 1, 'warn', 'mcp', 144, 44, 45, 'MCP_WARN_USER', 'warn_user', 'aclf_m_warn'),
(171, 1, 1, 'warn', 'mcp', 144, 46, 47, 'MCP_WARN_POST', 'warn_post', 'acl_m_warn && acl_f_read,$id'),
(172, 1, 1, '', 'ucp', 0, 1, 12, 'UCP_MAIN', '', ''),
(173, 1, 1, '', 'ucp', 0, 13, 22, 'UCP_PROFILE', '', ''),
(174, 1, 1, '', 'ucp', 0, 23, 30, 'UCP_PREFS', '', ''),
(175, 1, 1, '', 'ucp', 0, 31, 42, 'UCP_PM', '', ''),
(176, 1, 1, '', 'ucp', 0, 43, 48, 'UCP_USERGROUPS', '', ''),
(177, 1, 1, '', 'ucp', 0, 49, 54, 'UCP_ZEBRA', '', ''),
(178, 1, 1, 'attachments', 'ucp', 172, 10, 11, 'UCP_MAIN_ATTACHMENTS', 'attachments', 'acl_u_attach'),
(179, 1, 1, 'groups', 'ucp', 176, 44, 45, 'UCP_USERGROUPS_MEMBER', 'membership', ''),
(180, 1, 1, 'groups', 'ucp', 176, 46, 47, 'UCP_USERGROUPS_MANAGE', 'manage', ''),
(181, 1, 1, 'main', 'ucp', 172, 2, 3, 'UCP_MAIN_FRONT', 'front', ''),
(182, 1, 1, 'main', 'ucp', 172, 4, 5, 'UCP_MAIN_SUBSCRIBED', 'subscribed', ''),
(183, 1, 1, 'main', 'ucp', 172, 6, 7, 'UCP_MAIN_BOOKMARKS', 'bookmarks', 'cfg_allow_bookmarks'),
(184, 1, 1, 'main', 'ucp', 172, 8, 9, 'UCP_MAIN_DRAFTS', 'drafts', ''),
(185, 1, 0, 'pm', 'ucp', 175, 32, 33, 'UCP_PM_VIEW', 'view', 'cfg_allow_privmsg'),
(186, 1, 1, 'pm', 'ucp', 175, 34, 35, 'UCP_PM_COMPOSE', 'compose', 'cfg_allow_privmsg'),
(187, 1, 1, 'pm', 'ucp', 175, 36, 37, 'UCP_PM_DRAFTS', 'drafts', 'cfg_allow_privmsg'),
(188, 1, 1, 'pm', 'ucp', 175, 38, 39, 'UCP_PM_OPTIONS', 'options', 'cfg_allow_privmsg'),
(189, 1, 0, 'pm', 'ucp', 175, 40, 41, 'UCP_PM_POPUP_TITLE', 'popup', 'cfg_allow_privmsg'),
(190, 1, 1, 'prefs', 'ucp', 174, 24, 25, 'UCP_PREFS_PERSONAL', 'personal', ''),
(191, 1, 1, 'prefs', 'ucp', 174, 26, 27, 'UCP_PREFS_POST', 'post', ''),
(192, 1, 1, 'prefs', 'ucp', 174, 28, 29, 'UCP_PREFS_VIEW', 'view', ''),
(193, 1, 1, 'profile', 'ucp', 173, 14, 15, 'UCP_PROFILE_PROFILE_INFO', 'profile_info', ''),
(194, 1, 1, 'profile', 'ucp', 173, 16, 17, 'UCP_PROFILE_SIGNATURE', 'signature', ''),
(195, 1, 1, 'profile', 'ucp', 173, 18, 19, 'UCP_PROFILE_AVATAR', 'avatar', 'cfg_allow_avatar && (cfg_allow_avatar_local || cfg_allow_avatar_remote || cfg_allow_avatar_upload || cfg_allow_avatar_remote_upload)'),
(196, 1, 1, 'profile', 'ucp', 173, 20, 21, 'UCP_PROFILE_REG_DETAILS', 'reg_details', ''),
(197, 1, 1, 'zebra', 'ucp', 177, 50, 51, 'UCP_ZEBRA_FRIENDS', 'friends', ''),
(198, 1, 1, 'zebra', 'ucp', 177, 52, 53, 'UCP_ZEBRA_FOES', 'foes', '');

-- --------------------------------------------------------

--
-- Struttura della tabella `phpbb_poll_options`
--

CREATE TABLE IF NOT EXISTS `phpbb_poll_options` (
  `poll_option_id` tinyint(4) NOT NULL DEFAULT '0',
  `topic_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `poll_option_text` text COLLATE utf8_bin NOT NULL,
  `poll_option_total` mediumint(8) unsigned NOT NULL DEFAULT '0',
  KEY `poll_opt_id` (`poll_option_id`),
  KEY `topic_id` (`topic_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Struttura della tabella `phpbb_poll_votes`
--

CREATE TABLE IF NOT EXISTS `phpbb_poll_votes` (
  `topic_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `poll_option_id` tinyint(4) NOT NULL DEFAULT '0',
  `vote_user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `vote_user_ip` varchar(40) COLLATE utf8_bin NOT NULL DEFAULT '',
  KEY `topic_id` (`topic_id`),
  KEY `vote_user_id` (`vote_user_id`),
  KEY `vote_user_ip` (`vote_user_ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Struttura della tabella `phpbb_posts`
--

CREATE TABLE IF NOT EXISTS `phpbb_posts` (
  `post_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `topic_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `forum_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `poster_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `icon_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `poster_ip` varchar(40) COLLATE utf8_bin NOT NULL DEFAULT '',
  `post_time` int(11) unsigned NOT NULL DEFAULT '0',
  `post_approved` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `post_reported` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `enable_bbcode` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `enable_smilies` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `enable_magic_url` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `enable_sig` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `post_username` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `post_subject` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `post_text` mediumtext COLLATE utf8_bin NOT NULL,
  `post_checksum` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `post_attachment` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `bbcode_bitfield` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `bbcode_uid` varchar(8) COLLATE utf8_bin NOT NULL DEFAULT '',
  `post_postcount` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `post_edit_time` int(11) unsigned NOT NULL DEFAULT '0',
  `post_edit_reason` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `post_edit_user` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `post_edit_count` smallint(4) unsigned NOT NULL DEFAULT '0',
  `post_edit_locked` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`post_id`),
  KEY `forum_id` (`forum_id`),
  KEY `topic_id` (`topic_id`),
  KEY `poster_ip` (`poster_ip`),
  KEY `poster_id` (`poster_id`),
  KEY `post_approved` (`post_approved`),
  KEY `post_username` (`post_username`),
  KEY `tid_post_time` (`topic_id`,`post_time`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=5 ;

--
-- Dump dei dati per la tabella `phpbb_posts`
--

INSERT INTO `phpbb_posts` (`post_id`, `topic_id`, `forum_id`, `poster_id`, `icon_id`, `poster_ip`, `post_time`, `post_approved`, `post_reported`, `enable_bbcode`, `enable_smilies`, `enable_magic_url`, `enable_sig`, `post_username`, `post_subject`, `post_text`, `post_checksum`, `post_attachment`, `bbcode_bitfield`, `bbcode_uid`, `post_postcount`, `post_edit_time`, `post_edit_reason`, `post_edit_user`, `post_edit_count`, `post_edit_locked`) VALUES
(2, 2, 9, 57, 0, '::1', 1355173113, 1, 0, 1, 1, 1, 1, '', 'Famiglia Rossi', 'Spero di sapere al più presto quale sarà il vestitino di mio figlio !!!\n\nFamiglia Rossi.', '901212bdcf1a37b58cb52f098caef2ea', 0, '', 'op0l5sik', 1, 0, '', 0, 0, 0),
(4, 2, 9, 58, 0, '::1', 1355174726, 1, 0, 1, 1, 1, 1, '', 'Famiglia Bianchi', 'Il costume è da acquistare presso l''asilo?', '37e2a906be18585ca37dbd91be1ecda9', 0, '', '2vcswca8', 1, 0, '', 0, 0, 0);

-- --------------------------------------------------------

--
-- Struttura della tabella `phpbb_privmsgs`
--

CREATE TABLE IF NOT EXISTS `phpbb_privmsgs` (
  `msg_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `root_level` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `author_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `icon_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `author_ip` varchar(40) COLLATE utf8_bin NOT NULL DEFAULT '',
  `message_time` int(11) unsigned NOT NULL DEFAULT '0',
  `enable_bbcode` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `enable_smilies` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `enable_magic_url` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `enable_sig` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `message_subject` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `message_text` mediumtext COLLATE utf8_bin NOT NULL,
  `message_edit_reason` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `message_edit_user` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `message_attachment` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `bbcode_bitfield` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `bbcode_uid` varchar(8) COLLATE utf8_bin NOT NULL DEFAULT '',
  `message_edit_time` int(11) unsigned NOT NULL DEFAULT '0',
  `message_edit_count` smallint(4) unsigned NOT NULL DEFAULT '0',
  `to_address` text COLLATE utf8_bin NOT NULL,
  `bcc_address` text COLLATE utf8_bin NOT NULL,
  `message_reported` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`msg_id`),
  KEY `author_ip` (`author_ip`),
  KEY `message_time` (`message_time`),
  KEY `author_id` (`author_id`),
  KEY `root_level` (`root_level`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struttura della tabella `phpbb_privmsgs_folder`
--

CREATE TABLE IF NOT EXISTS `phpbb_privmsgs_folder` (
  `folder_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `folder_name` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `pm_count` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`folder_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struttura della tabella `phpbb_privmsgs_rules`
--

CREATE TABLE IF NOT EXISTS `phpbb_privmsgs_rules` (
  `rule_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `rule_check` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `rule_connection` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `rule_string` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `rule_user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `rule_group_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `rule_action` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `rule_folder_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`rule_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struttura della tabella `phpbb_privmsgs_to`
--

CREATE TABLE IF NOT EXISTS `phpbb_privmsgs_to` (
  `msg_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `author_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `pm_deleted` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `pm_new` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `pm_unread` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `pm_replied` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `pm_marked` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `pm_forwarded` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `folder_id` int(11) NOT NULL DEFAULT '0',
  KEY `msg_id` (`msg_id`),
  KEY `author_id` (`author_id`),
  KEY `usr_flder_id` (`user_id`,`folder_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Struttura della tabella `phpbb_profile_fields`
--

CREATE TABLE IF NOT EXISTS `phpbb_profile_fields` (
  `field_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `field_name` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `field_type` tinyint(4) NOT NULL DEFAULT '0',
  `field_ident` varchar(20) COLLATE utf8_bin NOT NULL DEFAULT '',
  `field_length` varchar(20) COLLATE utf8_bin NOT NULL DEFAULT '',
  `field_minlen` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `field_maxlen` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `field_novalue` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `field_default_value` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `field_validation` varchar(20) COLLATE utf8_bin NOT NULL DEFAULT '',
  `field_required` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `field_show_novalue` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `field_show_on_reg` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `field_show_on_vt` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `field_show_profile` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `field_hide` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `field_no_view` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `field_active` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `field_order` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`field_id`),
  KEY `fld_type` (`field_type`),
  KEY `fld_ordr` (`field_order`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struttura della tabella `phpbb_profile_fields_data`
--

CREATE TABLE IF NOT EXISTS `phpbb_profile_fields_data` (
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Struttura della tabella `phpbb_profile_fields_lang`
--

CREATE TABLE IF NOT EXISTS `phpbb_profile_fields_lang` (
  `field_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `lang_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `option_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `field_type` tinyint(4) NOT NULL DEFAULT '0',
  `lang_value` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`field_id`,`lang_id`,`option_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Struttura della tabella `phpbb_profile_lang`
--

CREATE TABLE IF NOT EXISTS `phpbb_profile_lang` (
  `field_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `lang_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `lang_name` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `lang_explain` text COLLATE utf8_bin NOT NULL,
  `lang_default_value` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`field_id`,`lang_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Struttura della tabella `phpbb_ranks`
--

CREATE TABLE IF NOT EXISTS `phpbb_ranks` (
  `rank_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `rank_title` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `rank_min` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `rank_special` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `rank_image` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`rank_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=2 ;

--
-- Dump dei dati per la tabella `phpbb_ranks`
--

INSERT INTO `phpbb_ranks` (`rank_id`, `rank_title`, `rank_min`, `rank_special`, `rank_image`) VALUES
(1, 'Amministratore', 0, 1, '');

-- --------------------------------------------------------

--
-- Struttura della tabella `phpbb_reports`
--

CREATE TABLE IF NOT EXISTS `phpbb_reports` (
  `report_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `reason_id` smallint(4) unsigned NOT NULL DEFAULT '0',
  `post_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `pm_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `user_notify` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `report_closed` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `report_time` int(11) unsigned NOT NULL DEFAULT '0',
  `report_text` mediumtext COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`report_id`),
  KEY `post_id` (`post_id`),
  KEY `pm_id` (`pm_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struttura della tabella `phpbb_reports_reasons`
--

CREATE TABLE IF NOT EXISTS `phpbb_reports_reasons` (
  `reason_id` smallint(4) unsigned NOT NULL AUTO_INCREMENT,
  `reason_title` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `reason_description` mediumtext COLLATE utf8_bin NOT NULL,
  `reason_order` smallint(4) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`reason_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=5 ;

--
-- Dump dei dati per la tabella `phpbb_reports_reasons`
--

INSERT INTO `phpbb_reports_reasons` (`reason_id`, `reason_title`, `reason_description`, `reason_order`) VALUES
(1, 'warez', 'Il messaggio contiene collegamenti a software illegali o pirata.', 1),
(2, 'spam', 'Il messaggio segnalato ha l’unico scopo di fare pubblicità ad un sito web o un altro prodotto.', 2),
(3, 'off_topic', 'Il messaggio segnalato è off topic.', 3),
(4, 'other', 'Il messaggio segnalato non si adatta in altre categorie, usa il campo descrizione.', 4);

-- --------------------------------------------------------

--
-- Struttura della tabella `phpbb_search_results`
--

CREATE TABLE IF NOT EXISTS `phpbb_search_results` (
  `search_key` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_time` int(11) unsigned NOT NULL DEFAULT '0',
  `search_keywords` mediumtext COLLATE utf8_bin NOT NULL,
  `search_authors` mediumtext COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`search_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Struttura della tabella `phpbb_search_wordlist`
--

CREATE TABLE IF NOT EXISTS `phpbb_search_wordlist` (
  `word_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `word_text` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `word_common` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `word_count` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`word_id`),
  UNIQUE KEY `wrd_txt` (`word_text`),
  KEY `wrd_cnt` (`word_count`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=117 ;

--
-- Dump dei dati per la tabella `phpbb_search_wordlist`
--

INSERT INTO `phpbb_search_wordlist` (`word_id`, `word_text`, `word_common`, `word_count`) VALUES
(1, 'questo', 0, 0),
(2, 'messaggio', 0, 0),
(3, 'esempio', 0, 0),
(4, 'nella', 0, 0),
(5, 'tua', 0, 0),
(6, 'installazione', 0, 0),
(7, 'phpbb3', 0, 0),
(8, 'ogni', 0, 0),
(9, 'cosa', 0, 0),
(10, 'sembra', 0, 0),
(11, 'funzionare', 0, 0),
(12, 'vuoi', 0, 0),
(13, 'puoi', 0, 0),
(14, 'cancellare', 0, 0),
(15, 'continuare', 0, 0),
(16, 'configurare', 0, 0),
(17, 'tuo', 0, 0),
(18, 'forum', 0, 0),
(19, 'durante', 0, 0),
(20, 'processo', 0, 0),
(21, 'alla', 0, 0),
(22, 'prima', 0, 0),
(23, 'categoria', 0, 0),
(24, 'primo', 0, 0),
(25, 'stato', 0, 0),
(26, 'assegnato', 0, 0),
(27, 'opportuno', 0, 0),
(28, 'set', 0, 0),
(29, 'permessi', 0, 0),
(30, 'per', 0, 0),
(31, 'gruppi', 0, 0),
(32, 'predefiniti', 0, 0),
(33, 'amministratori', 0, 0),
(34, 'bot', 0, 0),
(35, 'moderatori', 0, 0),
(36, 'globali', 0, 0),
(37, 'ospiti', 0, 0),
(38, 'utenti', 0, 0),
(39, 'registrati', 0, 0),
(40, 'coppa', 0, 0),
(41, 'decidi', 0, 0),
(42, 'ricordati', 0, 0),
(43, 'assegnare', 0, 0),
(44, 'tutti', 0, 0),
(45, 'questi', 0, 0),
(46, 'che', 0, 0),
(47, 'viene', 0, 0),
(48, 'creato', 0, 0),
(49, 'raccomandiamo', 0, 0),
(50, 'rinominare', 0, 0),
(51, 'copiare', 0, 0),
(52, 'quando', 0, 0),
(53, 'creano', 0, 0),
(54, 'nuove', 0, 0),
(55, 'categorie', 0, 0),
(56, 'nuovi', 0, 0),
(57, 'buon', 0, 0),
(58, 'divertimento', 0, 0),
(59, 'benvenuto', 0, 0),
(60, 'salve', 0, 0),
(61, 'questa', 0, 0),
(62, 'del', 0, 0),
(63, 'saranno', 0, 0),
(64, 'riportate', 0, 0),
(65, 'delle', 0, 0),
(66, 'brevi', 0, 0),
(67, 'presentazioni', 0, 0),
(68, 'riguardanti', 0, 0),
(69, 'vari', 0, 0),
(70, 'stessa', 0, 0),
(71, 'presentazione', 0, 0),
(72, 'inserita', 0, 0),
(73, 'dall', 0, 0),
(74, 'utente', 0, 0),
(75, 'accede', 0, 0),
(76, 'silo', 0, 0),
(77, 'breve', 0, 0),
(78, 'degli', 0, 0),
(79, 'ecco', 0, 0),
(80, 'tutte', 0, 0),
(81, 'informazioni', 0, 0),
(82, 'riguardano', 0, 0),
(83, 'recita', 0, 0),
(84, 'fine', 0, 0),
(85, 'anno', 0, 0),
(86, 'costumi', 0, 0),
(87, 'trama', 0, 0),
(88, 'tanto', 0, 0),
(89, 'altro', 0, 0),
(90, 'ancora', 0, 0),
(91, '2012', 0, 0),
(92, 'aaa', 0, 0),
(93, 'bbb', 0, 0),
(94, 'spero', 0, 1),
(95, 'sapere', 0, 1),
(96, 'più', 0, 1),
(97, 'presto', 0, 1),
(98, 'quale', 0, 1),
(99, 'sarà', 0, 1),
(100, 'vestitino', 0, 1),
(101, 'mio', 0, 1),
(102, 'figlio', 0, 1),
(103, 'famiglia', 0, 3),
(104, 'rossi', 0, 2),
(105, 'bellissima', 0, 0),
(106, 'idea', 0, 0),
(107, 'speriamo', 0, 0),
(108, 'sia', 0, 0),
(109, 'possibile', 0, 0),
(110, 'acquistare', 0, 1),
(111, 'filmino', 0, 0),
(112, 'della', 0, 0),
(113, 'bianchi', 0, 1),
(114, 'costume', 0, 1),
(115, 'presso', 0, 1),
(116, 'asilo', 0, 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `phpbb_search_wordmatch`
--

CREATE TABLE IF NOT EXISTS `phpbb_search_wordmatch` (
  `post_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `word_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `title_match` tinyint(1) unsigned NOT NULL DEFAULT '0',
  UNIQUE KEY `unq_mtch` (`word_id`,`post_id`,`title_match`),
  KEY `word_id` (`word_id`),
  KEY `post_id` (`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dump dei dati per la tabella `phpbb_search_wordmatch`
--

INSERT INTO `phpbb_search_wordmatch` (`post_id`, `word_id`, `title_match`) VALUES
(2, 94, 0),
(2, 95, 0),
(2, 96, 0),
(2, 97, 0),
(2, 98, 0),
(2, 99, 0),
(2, 100, 0),
(2, 101, 0),
(2, 102, 0),
(2, 103, 0),
(2, 103, 1),
(4, 103, 1),
(2, 104, 0),
(2, 104, 1),
(4, 110, 0),
(4, 113, 1),
(4, 114, 0),
(4, 115, 0),
(4, 116, 0);

-- --------------------------------------------------------

--
-- Struttura della tabella `phpbb_sessions`
--

CREATE TABLE IF NOT EXISTS `phpbb_sessions` (
  `session_id` char(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `session_user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `session_forum_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `session_last_visit` int(11) unsigned NOT NULL DEFAULT '0',
  `session_start` int(11) unsigned NOT NULL DEFAULT '0',
  `session_time` int(11) unsigned NOT NULL DEFAULT '0',
  `session_ip` varchar(40) COLLATE utf8_bin NOT NULL DEFAULT '',
  `session_browser` varchar(150) COLLATE utf8_bin NOT NULL DEFAULT '',
  `session_forwarded_for` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `session_page` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `session_viewonline` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `session_autologin` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `session_admin` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`session_id`),
  KEY `session_time` (`session_time`),
  KEY `session_user_id` (`session_user_id`),
  KEY `session_fid` (`session_forum_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dump dei dati per la tabella `phpbb_sessions`
--

INSERT INTO `phpbb_sessions` (`session_id`, `session_user_id`, `session_forum_id`, `session_last_visit`, `session_start`, `session_time`, `session_ip`, `session_browser`, `session_forwarded_for`, `session_page`, `session_viewonline`, `session_autologin`, `session_admin`) VALUES
('8e9aa452fe333a13b4b652464ab6b85d', 1, 0, 1355929858, 1355929858, 1355929858, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97 Safari/537.11', '', 'ucp.php?mode=logout', 1, 0, 0),
('b5a00e694e2f7924b00053fd010069f2', 59, 0, 1355927050, 1355927050, 1355927057, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97 Safari/537.11', '', 'index.php', 1, 0, 0),
('d736d789541a86897ab961d967cbe2ca', 1, 0, 1355929859, 1355929859, 1355929864, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97 Safari/537.11', '', 'index.php', 1, 0, 0);

-- --------------------------------------------------------

--
-- Struttura della tabella `phpbb_sessions_keys`
--

CREATE TABLE IF NOT EXISTS `phpbb_sessions_keys` (
  `key_id` char(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `last_ip` varchar(40) COLLATE utf8_bin NOT NULL DEFAULT '',
  `last_login` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`key_id`,`user_id`),
  KEY `last_login` (`last_login`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Struttura della tabella `phpbb_sitelist`
--

CREATE TABLE IF NOT EXISTS `phpbb_sitelist` (
  `site_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `site_ip` varchar(40) COLLATE utf8_bin NOT NULL DEFAULT '',
  `site_hostname` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `ip_exclude` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struttura della tabella `phpbb_smilies`
--

CREATE TABLE IF NOT EXISTS `phpbb_smilies` (
  `smiley_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT '',
  `emotion` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT '',
  `smiley_url` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT '',
  `smiley_width` smallint(4) unsigned NOT NULL DEFAULT '0',
  `smiley_height` smallint(4) unsigned NOT NULL DEFAULT '0',
  `smiley_order` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `display_on_posting` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`smiley_id`),
  KEY `display_on_post` (`display_on_posting`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=43 ;

--
-- Dump dei dati per la tabella `phpbb_smilies`
--

INSERT INTO `phpbb_smilies` (`smiley_id`, `code`, `emotion`, `smiley_url`, `smiley_width`, `smiley_height`, `smiley_order`, `display_on_posting`) VALUES
(1, ':D', 'Very Happy', 'icon_e_biggrin.gif', 15, 17, 1, 1),
(2, ':-D', 'Very Happy', 'icon_e_biggrin.gif', 15, 17, 2, 1),
(3, ':grin:', 'Very Happy', 'icon_e_biggrin.gif', 15, 17, 3, 1),
(4, ':)', 'Smile', 'icon_e_smile.gif', 15, 17, 4, 1),
(5, ':-)', 'Smile', 'icon_e_smile.gif', 15, 17, 5, 1),
(6, ':smile:', 'Smile', 'icon_e_smile.gif', 15, 17, 6, 1),
(7, ';)', 'Wink', 'icon_e_wink.gif', 15, 17, 7, 1),
(8, ';-)', 'Wink', 'icon_e_wink.gif', 15, 17, 8, 1),
(9, ':wink:', 'Wink', 'icon_e_wink.gif', 15, 17, 9, 1),
(10, ':(', 'Sad', 'icon_e_sad.gif', 15, 17, 10, 1),
(11, ':-(', 'Sad', 'icon_e_sad.gif', 15, 17, 11, 1),
(12, ':sad:', 'Sad', 'icon_e_sad.gif', 15, 17, 12, 1),
(13, ':o', 'Surprised', 'icon_e_surprised.gif', 15, 17, 13, 1),
(14, ':-o', 'Surprised', 'icon_e_surprised.gif', 15, 17, 14, 1),
(15, ':eek:', 'Surprised', 'icon_e_surprised.gif', 15, 17, 15, 1),
(16, ':shock:', 'Shocked', 'icon_eek.gif', 15, 17, 16, 1),
(17, ':?', 'Confused', 'icon_e_confused.gif', 15, 17, 17, 1),
(18, ':-?', 'Confused', 'icon_e_confused.gif', 15, 17, 18, 1),
(19, ':???:', 'Confused', 'icon_e_confused.gif', 15, 17, 19, 1),
(20, '8-)', 'Cool', 'icon_cool.gif', 15, 17, 20, 1),
(21, ':cool:', 'Cool', 'icon_cool.gif', 15, 17, 21, 1),
(22, ':lol:', 'Laughing', 'icon_lol.gif', 15, 17, 22, 1),
(23, ':x', 'Mad', 'icon_mad.gif', 15, 17, 23, 1),
(24, ':-x', 'Mad', 'icon_mad.gif', 15, 17, 24, 1),
(25, ':mad:', 'Mad', 'icon_mad.gif', 15, 17, 25, 1),
(26, ':P', 'Razz', 'icon_razz.gif', 15, 17, 26, 1),
(27, ':-P', 'Razz', 'icon_razz.gif', 15, 17, 27, 1),
(28, ':razz:', 'Razz', 'icon_razz.gif', 15, 17, 28, 1),
(29, ':oops:', 'Embarrassed', 'icon_redface.gif', 15, 17, 29, 1),
(30, ':cry:', 'Crying or Very Sad', 'icon_cry.gif', 15, 17, 30, 1),
(31, ':evil:', 'Evil or Very Mad', 'icon_evil.gif', 15, 17, 31, 1),
(32, ':twisted:', 'Twisted Evil', 'icon_twisted.gif', 15, 17, 32, 1),
(33, ':roll:', 'Rolling Eyes', 'icon_rolleyes.gif', 15, 17, 33, 1),
(34, ':!:', 'Exclamation', 'icon_exclaim.gif', 15, 17, 34, 1),
(35, ':?:', 'Question', 'icon_question.gif', 15, 17, 35, 1),
(36, ':idea:', 'Idea', 'icon_idea.gif', 15, 17, 36, 1),
(37, ':arrow:', 'Arrow', 'icon_arrow.gif', 15, 17, 37, 1),
(38, ':|', 'Neutral', 'icon_neutral.gif', 15, 17, 38, 1),
(39, ':-|', 'Neutral', 'icon_neutral.gif', 15, 17, 39, 1),
(40, ':mrgreen:', 'Mr. Green', 'icon_mrgreen.gif', 15, 17, 40, 1),
(41, ':geek:', 'Geek', 'icon_e_geek.gif', 17, 17, 41, 1),
(42, ':ugeek:', 'Uber Geek', 'icon_e_ugeek.gif', 17, 18, 42, 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `phpbb_styles`
--

CREATE TABLE IF NOT EXISTS `phpbb_styles` (
  `style_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `style_name` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `style_copyright` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `style_active` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `template_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `theme_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `imageset_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`style_id`),
  UNIQUE KEY `style_name` (`style_name`),
  KEY `template_id` (`template_id`),
  KEY `theme_id` (`theme_id`),
  KEY `imageset_id` (`imageset_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=5 ;

--
-- Dump dei dati per la tabella `phpbb_styles`
--

INSERT INTO `phpbb_styles` (`style_id`, `style_name`, `style_copyright`, `style_active`, `template_id`, `theme_id`, `imageset_id`) VALUES
(1, 'prosilver', '&copy; phpBB Group', 1, 1, 1, 1),
(2, 'subsilver2', '&copy; 2005 phpBB Group', 1, 3, 2, 2),
(3, 'Artodia: Helion', '&copy; Artodia.com', 1, 2, 3, 3),
(4, 'eMuza_summer', 'Matti © &amp; GamesBoard.pl', 1, 4, 4, 4);

-- --------------------------------------------------------

--
-- Struttura della tabella `phpbb_styles_imageset`
--

CREATE TABLE IF NOT EXISTS `phpbb_styles_imageset` (
  `imageset_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `imageset_name` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `imageset_copyright` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `imageset_path` varchar(100) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`imageset_id`),
  UNIQUE KEY `imgset_nm` (`imageset_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=5 ;

--
-- Dump dei dati per la tabella `phpbb_styles_imageset`
--

INSERT INTO `phpbb_styles_imageset` (`imageset_id`, `imageset_name`, `imageset_copyright`, `imageset_path`) VALUES
(1, 'prosilver', '&copy; phpBB Group', 'prosilver'),
(2, 'subsilver2', '&copy; phpBB Group, 2003', 'subsilver2'),
(3, 'Artodia: Helion', '&copy; Artodia.com', 'art_helion'),
(4, 'eMuza_summer', 'Matti &copy; & GamesBoard.pl', 'eMuza_summer');

-- --------------------------------------------------------

--
-- Struttura della tabella `phpbb_styles_imageset_data`
--

CREATE TABLE IF NOT EXISTS `phpbb_styles_imageset_data` (
  `image_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `image_name` varchar(200) COLLATE utf8_bin NOT NULL DEFAULT '',
  `image_filename` varchar(200) COLLATE utf8_bin NOT NULL DEFAULT '',
  `image_lang` varchar(30) COLLATE utf8_bin NOT NULL DEFAULT '',
  `image_height` smallint(4) unsigned NOT NULL DEFAULT '0',
  `image_width` smallint(4) unsigned NOT NULL DEFAULT '0',
  `imageset_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`image_id`),
  KEY `i_d` (`imageset_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=297 ;

--
-- Dump dei dati per la tabella `phpbb_styles_imageset_data`
--

INSERT INTO `phpbb_styles_imageset_data` (`image_id`, `image_name`, `image_filename`, `image_lang`, `image_height`, `image_width`, `imageset_id`) VALUES
(1, 'site_logo', 'site_logo.gif', '', 52, 139, 1),
(2, 'forum_link', 'forum_link.gif', '', 27, 27, 1),
(3, 'forum_read', 'forum_read.gif', '', 27, 27, 1),
(4, 'forum_read_locked', 'forum_read_locked.gif', '', 27, 27, 1),
(5, 'forum_read_subforum', 'forum_read_subforum.gif', '', 27, 27, 1),
(6, 'forum_unread', 'forum_unread.gif', '', 27, 27, 1),
(7, 'forum_unread_locked', 'forum_unread_locked.gif', '', 27, 27, 1),
(8, 'forum_unread_subforum', 'forum_unread_subforum.gif', '', 27, 27, 1),
(9, 'topic_moved', 'topic_moved.gif', '', 27, 27, 1),
(10, 'topic_read', 'topic_read.gif', '', 27, 27, 1),
(11, 'topic_read_mine', 'topic_read_mine.gif', '', 27, 27, 1),
(12, 'topic_read_hot', 'topic_read_hot.gif', '', 27, 27, 1),
(13, 'topic_read_hot_mine', 'topic_read_hot_mine.gif', '', 27, 27, 1),
(14, 'topic_read_locked', 'topic_read_locked.gif', '', 27, 27, 1),
(15, 'topic_read_locked_mine', 'topic_read_locked_mine.gif', '', 27, 27, 1),
(16, 'topic_unread', 'topic_unread.gif', '', 27, 27, 1),
(17, 'topic_unread_mine', 'topic_unread_mine.gif', '', 27, 27, 1),
(18, 'topic_unread_hot', 'topic_unread_hot.gif', '', 27, 27, 1),
(19, 'topic_unread_hot_mine', 'topic_unread_hot_mine.gif', '', 27, 27, 1),
(20, 'topic_unread_locked', 'topic_unread_locked.gif', '', 27, 27, 1),
(21, 'topic_unread_locked_mine', 'topic_unread_locked_mine.gif', '', 27, 27, 1),
(22, 'sticky_read', 'sticky_read.gif', '', 27, 27, 1),
(23, 'sticky_read_mine', 'sticky_read_mine.gif', '', 27, 27, 1),
(24, 'sticky_read_locked', 'sticky_read_locked.gif', '', 27, 27, 1),
(25, 'sticky_read_locked_mine', 'sticky_read_locked_mine.gif', '', 27, 27, 1),
(26, 'sticky_unread', 'sticky_unread.gif', '', 27, 27, 1),
(27, 'sticky_unread_mine', 'sticky_unread_mine.gif', '', 27, 27, 1),
(28, 'sticky_unread_locked', 'sticky_unread_locked.gif', '', 27, 27, 1),
(29, 'sticky_unread_locked_mine', 'sticky_unread_locked_mine.gif', '', 27, 27, 1),
(30, 'announce_read', 'announce_read.gif', '', 27, 27, 1),
(31, 'announce_read_mine', 'announce_read_mine.gif', '', 27, 27, 1),
(32, 'announce_read_locked', 'announce_read_locked.gif', '', 27, 27, 1),
(33, 'announce_read_locked_mine', 'announce_read_locked_mine.gif', '', 27, 27, 1),
(34, 'announce_unread', 'announce_unread.gif', '', 27, 27, 1),
(35, 'announce_unread_mine', 'announce_unread_mine.gif', '', 27, 27, 1),
(36, 'announce_unread_locked', 'announce_unread_locked.gif', '', 27, 27, 1),
(37, 'announce_unread_locked_mine', 'announce_unread_locked_mine.gif', '', 27, 27, 1),
(38, 'global_read', 'announce_read.gif', '', 27, 27, 1),
(39, 'global_read_mine', 'announce_read_mine.gif', '', 27, 27, 1),
(40, 'global_read_locked', 'announce_read_locked.gif', '', 27, 27, 1),
(41, 'global_read_locked_mine', 'announce_read_locked_mine.gif', '', 27, 27, 1),
(42, 'global_unread', 'announce_unread.gif', '', 27, 27, 1),
(43, 'global_unread_mine', 'announce_unread_mine.gif', '', 27, 27, 1),
(44, 'global_unread_locked', 'announce_unread_locked.gif', '', 27, 27, 1),
(45, 'global_unread_locked_mine', 'announce_unread_locked_mine.gif', '', 27, 27, 1),
(46, 'pm_read', 'topic_read.gif', '', 27, 27, 1),
(47, 'pm_unread', 'topic_unread.gif', '', 27, 27, 1),
(48, 'icon_back_top', 'icon_back_top.gif', '', 11, 11, 1),
(49, 'icon_contact_aim', 'icon_contact_aim.gif', '', 20, 20, 1),
(50, 'icon_contact_email', 'icon_contact_email.gif', '', 20, 20, 1),
(51, 'icon_contact_icq', 'icon_contact_icq.gif', '', 20, 20, 1),
(52, 'icon_contact_jabber', 'icon_contact_jabber.gif', '', 20, 20, 1),
(53, 'icon_contact_msnm', 'icon_contact_msnm.gif', '', 20, 20, 1),
(54, 'icon_contact_www', 'icon_contact_www.gif', '', 20, 20, 1),
(55, 'icon_contact_yahoo', 'icon_contact_yahoo.gif', '', 20, 20, 1),
(56, 'icon_post_delete', 'icon_post_delete.gif', '', 20, 20, 1),
(57, 'icon_post_info', 'icon_post_info.gif', '', 20, 20, 1),
(58, 'icon_post_report', 'icon_post_report.gif', '', 20, 20, 1),
(59, 'icon_post_target', 'icon_post_target.gif', '', 9, 11, 1),
(60, 'icon_post_target_unread', 'icon_post_target_unread.gif', '', 9, 11, 1),
(61, 'icon_topic_attach', 'icon_topic_attach.gif', '', 10, 7, 1),
(62, 'icon_topic_latest', 'icon_topic_latest.gif', '', 9, 11, 1),
(63, 'icon_topic_newest', 'icon_topic_newest.gif', '', 9, 11, 1),
(64, 'icon_topic_reported', 'icon_topic_reported.gif', '', 14, 16, 1),
(65, 'icon_topic_unapproved', 'icon_topic_unapproved.gif', '', 14, 16, 1),
(66, 'icon_user_warn', 'icon_user_warn.gif', '', 20, 20, 1),
(67, 'subforum_read', 'subforum_read.gif', '', 9, 11, 1),
(68, 'subforum_unread', 'subforum_unread.gif', '', 9, 11, 1),
(69, 'icon_contact_pm', 'icon_contact_pm.gif', 'en', 20, 28, 1),
(70, 'icon_post_edit', 'icon_post_edit.gif', 'en', 20, 42, 1),
(71, 'icon_post_quote', 'icon_post_quote.gif', 'en', 20, 54, 1),
(72, 'icon_user_online', 'icon_user_online.gif', 'en', 58, 58, 1),
(73, 'button_pm_forward', 'button_pm_forward.gif', 'en', 25, 96, 1),
(74, 'button_pm_new', 'button_pm_new.gif', 'en', 25, 84, 1),
(75, 'button_pm_reply', 'button_pm_reply.gif', 'en', 25, 96, 1),
(76, 'button_topic_locked', 'button_topic_locked.gif', 'en', 25, 88, 1),
(77, 'button_topic_new', 'button_topic_new.gif', 'en', 25, 96, 1),
(78, 'button_topic_reply', 'button_topic_reply.gif', 'en', 25, 96, 1),
(79, 'site_logo', 'site_logo.gif', '', 94, 170, 2),
(80, 'upload_bar', 'upload_bar.gif', '', 16, 280, 2),
(81, 'poll_left', 'poll_left.gif', '', 12, 4, 2),
(82, 'poll_center', 'poll_center.gif', '', 12, 1, 2),
(83, 'poll_right', 'poll_right.gif', '', 12, 4, 2),
(84, 'forum_link', 'forum_link.gif', '', 25, 46, 2),
(85, 'forum_read', 'forum_read.gif', '', 25, 46, 2),
(86, 'forum_read_locked', 'forum_read_locked.gif', '', 25, 46, 2),
(87, 'forum_read_subforum', 'forum_read_subforum.gif', '', 25, 46, 2),
(88, 'forum_unread', 'forum_unread.gif', '', 25, 46, 2),
(89, 'forum_unread_locked', 'forum_unread_locked.gif', '', 25, 46, 2),
(90, 'forum_unread_subforum', 'forum_unread_subforum.gif', '', 25, 46, 2),
(91, 'topic_moved', 'topic_moved.gif', '', 18, 19, 2),
(92, 'topic_read', 'topic_read.gif', '', 18, 19, 2),
(93, 'topic_read_mine', 'topic_read_mine.gif', '', 18, 19, 2),
(94, 'topic_read_hot', 'topic_read_hot.gif', '', 18, 19, 2),
(95, 'topic_read_hot_mine', 'topic_read_hot_mine.gif', '', 18, 19, 2),
(96, 'topic_read_locked', 'topic_read_locked.gif', '', 18, 19, 2),
(97, 'topic_read_locked_mine', 'topic_read_locked_mine.gif', '', 18, 19, 2),
(98, 'topic_unread', 'topic_unread.gif', '', 18, 19, 2),
(99, 'topic_unread_mine', 'topic_unread_mine.gif', '', 18, 19, 2),
(100, 'topic_unread_hot', 'topic_unread_hot.gif', '', 18, 19, 2),
(101, 'topic_unread_hot_mine', 'topic_unread_hot_mine.gif', '', 18, 19, 2),
(102, 'topic_unread_locked', 'topic_unread_locked.gif', '', 18, 19, 2),
(103, 'topic_unread_locked_mine', 'topic_unread_locked_mine.gif', '', 18, 19, 2),
(104, 'sticky_read', 'sticky_read.gif', '', 18, 19, 2),
(105, 'sticky_read_mine', 'sticky_read_mine.gif', '', 18, 19, 2),
(106, 'sticky_read_locked', 'sticky_read_locked.gif', '', 18, 19, 2),
(107, 'sticky_read_locked_mine', 'sticky_read_locked_mine.gif', '', 18, 19, 2),
(108, 'sticky_unread', 'sticky_unread.gif', '', 18, 19, 2),
(109, 'sticky_unread_mine', 'sticky_unread_mine.gif', '', 18, 19, 2),
(110, 'sticky_unread_locked', 'sticky_unread_locked.gif', '', 18, 19, 2),
(111, 'sticky_unread_locked_mine', 'sticky_unread_locked_mine.gif', '', 18, 19, 2),
(112, 'announce_read', 'announce_read.gif', '', 18, 19, 2),
(113, 'announce_read_mine', 'announce_read_mine.gif', '', 18, 19, 2),
(114, 'announce_read_locked', 'announce_read_locked.gif', '', 18, 19, 2),
(115, 'announce_read_locked_mine', 'announce_read_locked_mine.gif', '', 18, 19, 2),
(116, 'announce_unread', 'announce_unread.gif', '', 18, 19, 2),
(117, 'announce_unread_mine', 'announce_unread_mine.gif', '', 18, 19, 2),
(118, 'announce_unread_locked', 'announce_unread_locked.gif', '', 18, 19, 2),
(119, 'announce_unread_locked_mine', 'announce_unread_locked_mine.gif', '', 18, 19, 2),
(120, 'global_read', 'announce_read.gif', '', 18, 19, 2),
(121, 'global_read_mine', 'announce_read_mine.gif', '', 18, 19, 2),
(122, 'global_read_locked', 'announce_read_locked.gif', '', 18, 19, 2),
(123, 'global_read_locked_mine', 'announce_read_locked_mine.gif', '', 18, 19, 2),
(124, 'global_unread', 'announce_unread.gif', '', 18, 19, 2),
(125, 'global_unread_mine', 'announce_unread_mine.gif', '', 18, 19, 2),
(126, 'global_unread_locked', 'announce_unread_locked.gif', '', 18, 19, 2),
(127, 'global_unread_locked_mine', 'announce_unread_locked_mine.gif', '', 18, 19, 2),
(128, 'pm_read', 'topic_read.gif', '', 18, 19, 2),
(129, 'pm_unread', 'topic_unread.gif', '', 18, 19, 2),
(130, 'icon_post_target', 'icon_post_target.gif', '', 9, 12, 2),
(131, 'icon_post_target_unread', 'icon_post_target_unread.gif', '', 9, 12, 2),
(132, 'icon_topic_attach', 'icon_topic_attach.gif', '', 18, 14, 2),
(133, 'icon_topic_latest', 'icon_topic_latest.gif', '', 9, 18, 2),
(134, 'icon_topic_newest', 'icon_topic_newest.gif', '', 9, 18, 2),
(135, 'icon_topic_reported', 'icon_topic_reported.gif', '', 18, 19, 2),
(136, 'icon_topic_unapproved', 'icon_topic_unapproved.gif', '', 18, 19, 2),
(137, 'icon_contact_aim', 'icon_contact_aim.gif', 'en', 0, 0, 2),
(138, 'icon_contact_email', 'icon_contact_email.gif', 'en', 0, 0, 2),
(139, 'icon_contact_icq', 'icon_contact_icq.gif', 'en', 0, 0, 2),
(140, 'icon_contact_jabber', 'icon_contact_jabber.gif', 'en', 0, 0, 2),
(141, 'icon_contact_msnm', 'icon_contact_msnm.gif', 'en', 0, 0, 2),
(142, 'icon_contact_pm', 'icon_contact_pm.gif', 'en', 0, 0, 2),
(143, 'icon_contact_yahoo', 'icon_contact_yahoo.gif', 'en', 0, 0, 2),
(144, 'icon_contact_www', 'icon_contact_www.gif', 'en', 0, 0, 2),
(145, 'icon_post_delete', 'icon_post_delete.gif', 'en', 0, 0, 2),
(146, 'icon_post_edit', 'icon_post_edit.gif', 'en', 0, 0, 2),
(147, 'icon_post_info', 'icon_post_info.gif', 'en', 0, 0, 2),
(148, 'icon_post_quote', 'icon_post_quote.gif', 'en', 0, 0, 2),
(149, 'icon_post_report', 'icon_post_report.gif', 'en', 0, 0, 2),
(150, 'icon_user_online', 'icon_user_online.gif', 'en', 0, 0, 2),
(151, 'icon_user_offline', 'icon_user_offline.gif', 'en', 0, 0, 2),
(152, 'icon_user_profile', 'icon_user_profile.gif', 'en', 0, 0, 2),
(153, 'icon_user_search', 'icon_user_search.gif', 'en', 0, 0, 2),
(154, 'icon_user_warn', 'icon_user_warn.gif', 'en', 0, 0, 2),
(155, 'button_pm_new', 'button_pm_new.gif', 'en', 0, 0, 2),
(156, 'button_pm_reply', 'button_pm_reply.gif', 'en', 0, 0, 2),
(157, 'button_topic_locked', 'button_topic_locked.gif', 'en', 0, 0, 2),
(158, 'button_topic_new', 'button_topic_new.gif', 'en', 0, 0, 2),
(159, 'button_topic_reply', 'button_topic_reply.gif', 'en', 0, 0, 2),
(160, 'site_logo', 'logo_silo.png', '', 0, 0, 3),
(161, 'forum_link', 'folder_moved.png', '', 0, 0, 3),
(162, 'forum_read', 'folder_read.png', '', 0, 0, 3),
(163, 'forum_read_locked', 'folder_locked.png', '', 0, 0, 3),
(164, 'forum_read_subforum', 'folder_read.png', '', 0, 0, 3),
(165, 'forum_unread', 'folder_unread.png', '', 0, 0, 3),
(166, 'forum_unread_locked', 'folder_unread_locked.png', '', 0, 0, 3),
(167, 'forum_unread_subforum', 'folder_unread.png', '', 0, 0, 3),
(168, 'topic_moved', 'folder_moved.png', '', 0, 0, 3),
(169, 'topic_read', 'folder_read.png', '', 0, 0, 3),
(170, 'topic_read_mine', 'folder_read_posted.png', '', 0, 0, 3),
(171, 'topic_read_hot', 'folder_read.png', '', 0, 0, 3),
(172, 'topic_read_hot_mine', 'folder_read_posted.png', '', 0, 0, 3),
(173, 'topic_read_locked', 'folder_locked.png', '', 0, 0, 3),
(174, 'topic_read_locked_mine', 'folder_locked_posted.png', '', 0, 0, 3),
(175, 'topic_unread', 'folder_unread.png', '', 0, 0, 3),
(176, 'topic_unread_mine', 'folder_unread_posted.png', '', 0, 0, 3),
(177, 'topic_unread_hot', 'folder_unread.png', '', 0, 0, 3),
(178, 'topic_unread_hot_mine', 'folder_unread_posted.png', '', 0, 0, 3),
(179, 'topic_unread_locked', 'folder_unread_locked.png', '', 0, 0, 3),
(180, 'topic_unread_locked_mine', 'folder_unread_locked_posted.png', '', 0, 0, 3),
(181, 'sticky_read', 'folder_announce.png', '', 0, 0, 3),
(182, 'sticky_read_mine', 'folder_announce_posted.png', '', 0, 0, 3),
(183, 'sticky_read_locked', 'folder_announce.png', '', 0, 0, 3),
(184, 'sticky_read_locked_mine', 'folder_announce_posted.png', '', 0, 0, 3),
(185, 'sticky_unread', 'folder_announce_unread.png', '', 0, 0, 3),
(186, 'sticky_unread_mine', 'folder_announce_unread_posted.png', '', 0, 0, 3),
(187, 'sticky_unread_locked', 'folder_announce.png', '', 0, 0, 3),
(188, 'sticky_unread_locked_mine', 'folder_announce_posted.png', '', 0, 0, 3),
(189, 'announce_read', 'folder_announce.png', '', 0, 0, 3),
(190, 'announce_read_mine', 'folder_announce_posted.png', '', 0, 0, 3),
(191, 'announce_read_locked', 'folder_announce.png', '', 0, 0, 3),
(192, 'announce_read_locked_mine', 'folder_announce_posted.png', '', 0, 0, 3),
(193, 'announce_unread', 'folder_announce_unread.png', '', 0, 0, 3),
(194, 'announce_unread_mine', 'folder_announce_unread_posted.png', '', 0, 0, 3),
(195, 'announce_unread_locked', 'folder_announce_unread.png', '', 0, 0, 3),
(196, 'announce_unread_locked_mine', 'folder_announce_unread_posted.png', '', 0, 0, 3),
(197, 'global_read', 'folder_announce.png', '', 0, 0, 3),
(198, 'global_read_mine', 'folder_announce_posted.png', '', 0, 0, 3),
(199, 'global_read_locked', 'folder_announce.png', '', 0, 0, 3),
(200, 'global_read_locked_mine', 'folder_announce_posted.png', '', 0, 0, 3),
(201, 'global_unread', 'folder_announce_unread.png', '', 0, 0, 3),
(202, 'global_unread_mine', 'folder_announce_unread_posted.png', '', 0, 0, 3),
(203, 'global_unread_locked', 'folder_announce_unread.png', '', 0, 0, 3),
(204, 'global_unread_locked_mine', 'folder_announce_unread_posted.png', '', 0, 0, 3),
(205, 'pm_read', 'folder_read.png', '', 0, 0, 3),
(206, 'pm_unread', 'folder_unread.png', '', 0, 0, 3),
(207, 'icon_post_target', 'icon_topic_latest.png', '', 9, 11, 3),
(208, 'icon_post_target_unread', 'icon_topic_newest.png', '', 9, 11, 3),
(209, 'icon_topic_latest', 'icon_topic_latest.png', '', 9, 11, 3),
(210, 'icon_topic_newest', 'icon_topic_newest.png', '', 9, 11, 3),
(211, 'subforum_read', 'icon_topic_latest.png', '', 9, 11, 3),
(212, 'subforum_unread', 'icon_topic_newest.png', '', 9, 11, 3),
(213, 'icon_back_top', 'icon_back_top.png', '', 11, 11, 3),
(214, 'icon_topic_reported', 'icon_reported.png', '', 0, 0, 3),
(215, 'icon_topic_unapproved', 'icon_unapproved.png', '', 0, 0, 3),
(216, 'icon_topic_attach', 'attachment.png', '', 10, 5, 3),
(217, 'icon_post_edit', 'spacer.gif', 'en', 0, 0, 3),
(218, 'icon_post_edit', 'spacer.gif', 'it', 0, 0, 3),
(219, 'site_logo', 'site_logo.gif', '', 52, 139, 4),
(220, 'forum_link', 'forum_link.gif', '', 27, 27, 4),
(221, 'forum_read', 'forum_read.gif', '', 27, 27, 4),
(222, 'forum_read_locked', 'forum_read_locked.gif', '', 27, 27, 4),
(223, 'forum_read_subforum', 'forum_read_subforum.gif', '', 27, 27, 4),
(224, 'forum_unread', 'forum_unread.gif', '', 27, 27, 4),
(225, 'forum_unread_locked', 'forum_unread_locked.gif', '', 27, 27, 4),
(226, 'forum_unread_subforum', 'forum_unread_subforum.gif', '', 27, 27, 4),
(227, 'topic_moved', 'topic_moved.gif', '', 27, 27, 4),
(228, 'topic_read', 'topic_read.gif', '', 27, 27, 4),
(229, 'topic_read_mine', 'topic_read_mine.gif', '', 27, 27, 4),
(230, 'topic_read_hot', 'topic_read_hot.gif', '', 27, 27, 4),
(231, 'topic_read_hot_mine', 'topic_read_hot_mine.gif', '', 27, 27, 4),
(232, 'topic_read_locked', 'topic_read_locked.gif', '', 27, 27, 4),
(233, 'topic_read_locked_mine', 'topic_read_locked_mine.gif', '', 27, 27, 4),
(234, 'topic_unread', 'topic_unread.gif', '', 27, 27, 4),
(235, 'topic_unread_mine', 'topic_unread_mine.gif', '', 27, 27, 4),
(236, 'topic_unread_hot', 'topic_unread_hot.gif', '', 27, 27, 4),
(237, 'topic_unread_hot_mine', 'topic_unread_hot_mine.gif', '', 27, 27, 4),
(238, 'topic_unread_locked', 'topic_unread_locked.gif', '', 27, 27, 4),
(239, 'topic_unread_locked_mine', 'topic_unread_locked_mine.gif', '', 27, 27, 4),
(240, 'sticky_read', 'sticky_read.gif', '', 27, 27, 4),
(241, 'sticky_read_mine', 'sticky_read_mine.gif', '', 27, 27, 4),
(242, 'sticky_read_locked', 'sticky_read_locked.gif', '', 27, 27, 4),
(243, 'sticky_read_locked_mine', 'sticky_read_locked_mine.gif', '', 27, 27, 4),
(244, 'sticky_unread', 'sticky_unread.gif', '', 27, 27, 4),
(245, 'sticky_unread_mine', 'sticky_unread_mine.gif', '', 27, 27, 4),
(246, 'sticky_unread_locked', 'sticky_unread_locked.gif', '', 27, 27, 4),
(247, 'sticky_unread_locked_mine', 'sticky_unread_locked_mine.gif', '', 27, 27, 4),
(248, 'announce_read', 'announce_read.gif', '', 27, 27, 4),
(249, 'announce_read_mine', 'announce_read_mine.gif', '', 27, 27, 4),
(250, 'announce_read_locked', 'announce_read_locked.gif', '', 27, 27, 4),
(251, 'announce_read_locked_mine', 'announce_read_locked_mine.gif', '', 27, 27, 4),
(252, 'announce_unread', 'announce_unread.gif', '', 27, 27, 4),
(253, 'announce_unread_mine', 'announce_unread_mine.gif', '', 27, 27, 4),
(254, 'announce_unread_locked', 'announce_unread_locked.gif', '', 27, 27, 4),
(255, 'announce_unread_locked_mine', 'announce_unread_locked_mine.gif', '', 27, 27, 4),
(256, 'global_read', 'announce_read.gif', '', 27, 27, 4),
(257, 'global_read_mine', 'announce_read_mine.gif', '', 27, 27, 4),
(258, 'global_read_locked', 'announce_read_locked.gif', '', 27, 27, 4),
(259, 'global_read_locked_mine', 'announce_read_locked_mine.gif', '', 27, 27, 4),
(260, 'global_unread', 'announce_unread.gif', '', 27, 27, 4),
(261, 'global_unread_mine', 'announce_unread_mine.gif', '', 27, 27, 4),
(262, 'global_unread_locked', 'announce_unread_locked.gif', '', 27, 27, 4),
(263, 'global_unread_locked_mine', 'announce_unread_locked_mine.gif', '', 27, 27, 4),
(264, 'subforum_read', 'subforum_read.gif', '', 9, 11, 4),
(265, 'subforum_unread', 'subforum_unread.gif', '', 9, 11, 4),
(266, 'pm_read', 'topic_read.gif', '', 27, 27, 4),
(267, 'pm_unread', 'topic_unread.gif', '', 27, 27, 4),
(268, 'icon_back_top', 'icon_back_top.gif', '', 11, 11, 4),
(269, 'icon_contact_aim', 'icon_contact_aim.gif', '', 20, 20, 4),
(270, 'icon_contact_email', 'icon_contact_email.gif', '', 20, 20, 4),
(271, 'icon_contact_icq', 'icon_contact_icq.gif', '', 20, 20, 4),
(272, 'icon_contact_jabber', 'icon_contact_jabber.gif', '', 20, 20, 4),
(273, 'icon_contact_msnm', 'icon_contact_msnm.gif', '', 20, 20, 4),
(274, 'icon_contact_www', 'icon_contact_www.gif', '', 20, 20, 4),
(275, 'icon_contact_yahoo', 'icon_contact_yahoo.gif', '', 20, 20, 4),
(276, 'icon_post_delete', 'icon_post_delete.gif', '', 20, 20, 4),
(277, 'icon_post_info', 'icon_post_info.gif', '', 20, 20, 4),
(278, 'icon_post_report', 'icon_post_report.gif', '', 20, 20, 4),
(279, 'icon_post_target', 'icon_post_target.gif', '', 9, 11, 4),
(280, 'icon_post_target_unread', 'icon_post_target_unread.gif', '', 9, 11, 4),
(281, 'icon_topic_attach', 'icon_topic_attach.gif', '', 10, 7, 4),
(282, 'icon_topic_latest', 'icon_topic_latest.gif', '', 9, 11, 4),
(283, 'icon_topic_newest', 'icon_topic_newest.gif', '', 9, 11, 4),
(284, 'icon_topic_reported', 'icon_topic_reported.gif', '', 14, 16, 4),
(285, 'icon_topic_unapproved', 'icon_topic_unapproved.gif', '', 14, 16, 4),
(286, 'icon_user_warn', 'icon_user_warn.gif', '', 20, 20, 4),
(287, 'icon_contact_pm', 'icon_contact_pm.gif', 'en', 20, 28, 4),
(288, 'icon_post_edit', 'icon_post_edit.gif', 'en', 20, 42, 4),
(289, 'icon_post_quote', 'icon_post_quote.gif', 'en', 20, 54, 4),
(290, 'icon_user_online', 'icon_user_online.gif', 'en', 58, 58, 4),
(291, 'button_pm_forward', 'button_pm_forward.gif', 'en', 25, 96, 4),
(292, 'button_pm_new', 'button_pm_new.gif', 'en', 25, 84, 4),
(293, 'button_pm_reply', 'button_pm_reply.gif', 'en', 25, 96, 4),
(294, 'button_topic_locked', 'button_topic_locked.gif', 'en', 25, 88, 4),
(295, 'button_topic_new', 'button_topic_new.gif', 'en', 25, 96, 4),
(296, 'button_topic_reply', 'button_topic_reply.gif', 'en', 25, 96, 4);

-- --------------------------------------------------------

--
-- Struttura della tabella `phpbb_styles_template`
--

CREATE TABLE IF NOT EXISTS `phpbb_styles_template` (
  `template_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `template_name` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `template_copyright` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `template_path` varchar(100) COLLATE utf8_bin NOT NULL DEFAULT '',
  `bbcode_bitfield` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT 'kNg=',
  `template_storedb` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `template_inherits_id` int(4) unsigned NOT NULL DEFAULT '0',
  `template_inherit_path` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`template_id`),
  UNIQUE KEY `tmplte_nm` (`template_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=5 ;

--
-- Dump dei dati per la tabella `phpbb_styles_template`
--

INSERT INTO `phpbb_styles_template` (`template_id`, `template_name`, `template_copyright`, `template_path`, `bbcode_bitfield`, `template_storedb`, `template_inherits_id`, `template_inherit_path`) VALUES
(1, 'prosilver', '&copy; phpBB Group', 'prosilver', 'lNg=', 0, 0, ''),
(2, 'Artodia: Helion', '&copy; Artodia.com', 'art_helion', 'lNg=', 0, 1, 'prosilver'),
(3, 'subsilver2', '&copy; phpBB Group, 2003', 'subsilver2', '+Ng=', 0, 0, ''),
(4, 'eMuza_summer', 'Matti &copy; & GamesBoard.pl', 'eMuza_summer', 'lNg=', 0, 0, '');

-- --------------------------------------------------------

--
-- Struttura della tabella `phpbb_styles_template_data`
--

CREATE TABLE IF NOT EXISTS `phpbb_styles_template_data` (
  `template_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `template_filename` varchar(100) COLLATE utf8_bin NOT NULL DEFAULT '',
  `template_included` text COLLATE utf8_bin NOT NULL,
  `template_mtime` int(11) unsigned NOT NULL DEFAULT '0',
  `template_data` mediumtext COLLATE utf8_bin NOT NULL,
  KEY `tid` (`template_id`),
  KEY `tfn` (`template_filename`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Struttura della tabella `phpbb_styles_theme`
--

CREATE TABLE IF NOT EXISTS `phpbb_styles_theme` (
  `theme_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `theme_name` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `theme_copyright` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `theme_path` varchar(100) COLLATE utf8_bin NOT NULL DEFAULT '',
  `theme_storedb` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `theme_mtime` int(11) unsigned NOT NULL DEFAULT '0',
  `theme_data` mediumtext COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`theme_id`),
  UNIQUE KEY `theme_name` (`theme_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=5 ;

--
-- Dump dei dati per la tabella `phpbb_styles_theme`
--

INSERT INTO `phpbb_styles_theme` (`theme_id`, `theme_name`, `theme_copyright`, `theme_path`, `theme_storedb`, `theme_mtime`, `theme_data`) VALUES
(1, 'prosilver', '&copy; phpBB Group', 'prosilver', 1, 1354999647, '/*  phpBB3 Style Sheet\n    --------------------------------------------------------------\n	Style name:			prosilver (the default phpBB 3.0.x style)\n	Based on style:		\n	Original author:	Tom Beddard ( http://www.subblue.com/ )\n	Modified by:		phpBB Group ( http://www.phpbb.com/ )\n    --------------------------------------------------------------\n*/\n\n/* General Markup Styles\n---------------------------------------- */\n\n* {\n	/* Reset browsers default margin, padding and font sizes */\n	margin: 0;\n	padding: 0;\n}\n\nhtml {\n	font-size: 100%;\n	/* Always show a scrollbar for short pages - stops the jump when the scrollbar appears. non-IE browsers */\n	height: 101%;\n}\n\nbody {\n	/* Text-Sizing with ems: http://www.clagnut.com/blog/348/ */\n	font-family: Verdana, Helvetica, Arial, sans-serif;\n	color: #828282;\n	background-color: #FFFFFF;\n	/*font-size: 62.5%;			 This sets the default font size to be equivalent to 10px */\n	font-size: 10px;\n	margin: 0;\n	padding: 12px 0;\n}\n\nh1 {\n	/* Forum name */\n	font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;\n	margin-right: 200px;\n	color: #FFFFFF;\n	margin-top: 15px;\n	font-weight: bold;\n	font-size: 2em;\n}\n\nh2 {\n	/* Forum header titles */\n	font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;\n	font-weight: normal;\n	color: #3f3f3f;\n	font-size: 2em;\n	margin: 0.8em 0 0.2em 0;\n}\n\nh2.solo {\n	margin-bottom: 1em;\n}\n\nh3 {\n	/* Sub-headers (also used as post headers, but defined later) */\n	font-family: Arial, Helvetica, sans-serif;\n	font-weight: bold;\n	text-transform: uppercase;\n	border-bottom: 1px solid #CCCCCC;\n	margin-bottom: 3px;\n	padding-bottom: 2px;\n	font-size: 1.05em;\n	color: #989898;\n	margin-top: 20px;\n}\n\nh4 {\n	/* Forum and topic list titles */\n	font-family: "Trebuchet MS", Verdana, Helvetica, Arial, Sans-serif;\n	font-size: 1.3em;\n}\n\np {\n	line-height: 1.3em;\n	font-size: 1.1em;\n	margin-bottom: 1.5em;\n}\n\nimg {\n	border-width: 0;\n}\n\nhr {\n	/* Also see tweaks.css */\n	border: 0 none #FFFFFF;\n	border-top: 1px solid #CCCCCC;\n	height: 1px;\n	margin: 5px 0;\n	display: block;\n	clear: both;\n}\n\nhr.dashed {\n	border-top: 1px dashed #CCCCCC;\n	margin: 10px 0;\n}\n\nhr.divider {\n	display: none;\n}\n\np.right {\n	text-align: right;\n}\n\n/* Main blocks\n---------------------------------------- */\n#wrap {\n	padding: 0 20px;\n	min-width: 650px;\n}\n\n#simple-wrap {\n	padding: 6px 10px;\n}\n\n#page-body {\n	margin: 4px 0;\n	clear: both;\n}\n\n#page-footer {\n	clear: both;\n}\n\n#page-footer h3 {\n	margin-top: 20px;\n}\n\n#logo {\n	float: left;\n	width: auto;\n	padding: 10px 13px 0 10px;\n}\n\na#logo:hover {\n	text-decoration: none;\n}\n\n/* Search box\n--------------------------------------------- */\n#search-box {\n	color: #FFFFFF;\n	position: relative;\n	margin-top: 30px;\n	margin-right: 5px;\n	display: block;\n	float: right;\n	text-align: right;\n	white-space: nowrap; /* For Opera */\n}\n\n#search-box #keywords {\n	width: 95px;\n	background-color: #FFF;\n}\n\n#search-box input {\n	border: 1px solid #b0b0b0;\n}\n\n/* .button1 style defined later, just a few tweaks for the search button version */\n#search-box input.button1 {\n	padding: 1px 5px;\n}\n\n#search-box li {\n	text-align: right;\n	margin-top: 4px;\n}\n\n#search-box img {\n	vertical-align: middle;\n	margin-right: 3px;\n}\n\n/* Site description and logo */\n#site-description {\n	float: left;\n	width: 70%;\n}\n\n#site-description h1 {\n	margin-right: 0;\n}\n\n/* Round cornered boxes and backgrounds\n---------------------------------------- */\n.headerbar {\n	background: #ebebeb none repeat-x 0 0;\n	color: #FFFFFF;\n	margin-bottom: 4px;\n	padding: 0 5px;\n}\n\n.navbar {\n	background-color: #ebebeb;\n	padding: 0 10px;\n}\n\n.forabg {\n	background: #b1b1b1 none repeat-x 0 0;\n	margin-bottom: 4px;\n	padding: 0 5px;\n	clear: both;\n}\n\n.forumbg {\n	background: #ebebeb none repeat-x 0 0;\n	margin-bottom: 4px;\n	padding: 0 5px;\n	clear: both;\n}\n\n.panel {\n	margin-bottom: 4px;\n	padding: 0 10px;\n	background-color: #f3f3f3;\n	color: #3f3f3f;\n}\n\n.post {\n	padding: 0 10px;\n	margin-bottom: 4px;\n	background-repeat: no-repeat;\n	background-position: 100% 0;\n}\n\n.post:target .content {\n	color: #000000;\n}\n\n.post:target h3 a {\n	color: #000000;\n}\n\n.bg1	{ background-color: #f7f7f7;}\n.bg2	{ background-color: #f2f2f2; }\n.bg3	{ background-color: #ebebeb; }\n\n.rowbg {\n	margin: 5px 5px 2px 5px;\n}\n\n.ucprowbg {\n	background-color: #e2e2e2;\n}\n\n.fieldsbg {\n	/*border: 1px #DBDEE2 solid;*/\n	background-color: #eaeaea;\n}\n\nspan.corners-top, span.corners-bottom, span.corners-top span, span.corners-bottom span {\n	font-size: 1px;\n	line-height: 1px;\n	display: block;\n	height: 5px;\n	background-repeat: no-repeat;\n}\n\nspan.corners-top {\n	background-image: none;\n	background-position: 0 0;\n	margin: 0 -5px;\n}\n\nspan.corners-top span {\n	background-image: none;\n	background-position: 100% 0;\n}\n\nspan.corners-bottom {\n	background-image: none;\n	background-position: 0 100%;\n	margin: 0 -5px;\n	clear: both;\n}\n\nspan.corners-bottom span {\n	background-image: none;\n	background-position: 100% 100%;\n}\n\n.headbg span.corners-bottom {\n	margin-bottom: -1px;\n}\n\n.post span.corners-top, .post span.corners-bottom, .panel span.corners-top, .panel span.corners-bottom, .navbar span.corners-top, .navbar span.corners-bottom {\n	margin: 0 -10px;\n}\n\n.rules span.corners-top {\n	margin: 0 -10px 5px -10px;\n}\n\n.rules span.corners-bottom {\n	margin: 5px -10px 0 -10px;\n}\n\n/* Horizontal lists\n----------------------------------------*/\nul.linklist {\n	display: block;\n	margin: 0;\n}\n\nul.linklist li {\n	display: block;\n	list-style-type: none;\n	float: left;\n	width: auto;\n	margin-right: 5px;\n	font-size: 1.1em;\n	line-height: 2.2em;\n}\n\nul.linklist li.rightside, p.rightside {\n	float: right;\n	margin-right: 0;\n	margin-left: 5px;\n	text-align: right;\n}\n\nul.navlinks {\n	padding-bottom: 1px;\n	margin-bottom: 1px;\n	border-bottom: 1px solid #FFFFFF;\n	font-weight: bold;\n}\n\nul.leftside {\n	float: left;\n	margin-left: 0;\n	margin-right: 5px;\n	text-align: left;\n}\n\nul.rightside {\n	float: right;\n	margin-left: 5px;\n	margin-right: -5px;\n	text-align: right;\n}\n\n/* Table styles\n----------------------------------------*/\ntable.table1 {\n	/* See tweaks.css */\n}\n\n#ucp-main table.table1 {\n	padding: 2px;\n}\n\ntable.table1 thead th {\n	font-weight: normal;\n	text-transform: uppercase;\n	color: #FFFFFF;\n	line-height: 1.3em;\n	font-size: 1em;\n	padding: 0 0 4px 3px;\n}\n\ntable.table1 thead th span {\n	padding-left: 7px;\n}\n\ntable.table1 tbody tr {\n	border: 1px solid #cfcfcf;\n}\n\ntable.table1 tbody tr:hover, table.table1 tbody tr.hover {\n	background-color: #f6f6f6;\n	color: #000;\n}\n\ntable.table1 td {\n	color: #6a6a6a;\n	font-size: 1.1em;\n}\n\ntable.table1 tbody td {\n	padding: 5px;\n	border-top: 1px solid #FAFAFA;\n}\n\ntable.table1 tbody th {\n	padding: 5px;\n	border-bottom: 1px solid #000000;\n	text-align: left;\n	color: #333333;\n	background-color: #FFFFFF;\n}\n\n/* Specific column styles */\ntable.table1 .name		{ text-align: left; }\ntable.table1 .posts		{ text-align: center !important; width: 7%; }\ntable.table1 .joined	{ text-align: left; width: 15%; }\ntable.table1 .active	{ text-align: left; width: 15%; }\ntable.table1 .mark		{ text-align: center; width: 7%; }\ntable.table1 .info		{ text-align: left; width: 30%; }\ntable.table1 .info div	{ width: 100%; white-space: normal; overflow: hidden; }\ntable.table1 .autocol	{ line-height: 2em; white-space: nowrap; }\ntable.table1 thead .autocol { padding-left: 1em; }\n\ntable.table1 span.rank-img {\n	float: right;\n	width: auto;\n}\n\ntable.info td {\n	padding: 3px;\n}\n\ntable.info tbody th {\n	padding: 3px;\n	text-align: right;\n	vertical-align: top;\n	color: #000000;\n	font-weight: normal;\n}\n\n.forumbg table.table1 {\n	margin: 0;\n}\n\n.forumbg-table > .inner {\n	margin: 0 -1px;\n}\n\n.forumbg-table > .inner > span.corners-top {\n	margin: 0 -4px -1px -4px;\n}\n\n.forumbg-table > .inner > span.corners-bottom {\n	margin: -1px -4px 0 -4px;\n}\n\n/* Misc layout styles\n---------------------------------------- */\n/* column[1-2] styles are containers for two column layouts \n   Also see tweaks.css */\n.column1 {\n	float: left;\n	clear: left;\n	width: 49%;\n}\n\n.column2 {\n	float: right;\n	clear: right;\n	width: 49%;\n}\n\n/* General classes for placing floating blocks */\n.left-box {\n	float: left;\n	width: auto;\n	text-align: left;\n}\n\n.right-box {\n	float: right;\n	width: auto;\n	text-align: right;\n}\n\ndl.details {\n	/*font-family: "Lucida Grande", Verdana, Helvetica, Arial, sans-serif;*/\n	font-size: 1.1em;\n}\n\ndl.details dt {\n	float: left;\n	clear: left;\n	width: 30%;\n	text-align: right;\n	color: #000000;\n	display: block;\n}\n\ndl.details dd {\n	margin-left: 0;\n	padding-left: 5px;\n	margin-bottom: 5px;\n	color: #828282;\n	float: left;\n	width: 65%;\n}\n\n/* Pagination\n---------------------------------------- */\n.pagination {\n	height: 1%; /* IE tweak (holly hack) */\n	width: auto;\n	text-align: right;\n	margin-top: 5px;\n	float: right;\n}\n\n.pagination span.page-sep {\n	display: none;\n}\n\nli.pagination {\n	margin-top: 0;\n}\n\n.pagination strong, .pagination b {\n	font-weight: normal;\n}\n\n.pagination span strong {\n	padding: 0 2px;\n	margin: 0 2px;\n	font-weight: normal;\n	color: #FFFFFF;\n	background-color: #bfbfbf;\n	border: 1px solid #bfbfbf;\n	font-size: 0.9em;\n}\n\n.pagination span a, .pagination span a:link, .pagination span a:visited, .pagination span a:active {\n	font-weight: normal;\n	text-decoration: none;\n	color: #747474;\n	margin: 0 2px;\n	padding: 0 2px;\n	background-color: #eeeeee;\n	border: 1px solid #bababa;\n	font-size: 0.9em;\n	line-height: 1.5em;\n}\n\n.pagination span a:hover {\n	border-color: #d2d2d2;\n	background-color: #d2d2d2;\n	color: #FFF;\n	text-decoration: none;\n}\n\n.pagination img {\n	vertical-align: middle;\n}\n\n/* Pagination in viewforum for multipage topics */\n.row .pagination {\n	display: block;\n	float: right;\n	width: auto;\n	margin-top: 0;\n	padding: 1px 0 1px 15px;\n	font-size: 0.9em;\n	background: none 0 50% no-repeat;\n}\n\n.row .pagination span a, li.pagination span a {\n	background-color: #FFFFFF;\n}\n\n.row .pagination span a:hover, li.pagination span a:hover {\n	background-color: #d2d2d2;\n}\n\n/* Miscellaneous styles\n---------------------------------------- */\n#forum-permissions {\n	float: right;\n	width: auto;\n	padding-left: 5px;\n	margin-left: 5px;\n	margin-top: 10px;\n	text-align: right;\n}\n\n.copyright {\n	padding: 5px;\n	text-align: center;\n	color: #555555;\n}\n\n.small {\n	font-size: 0.9em !important;\n}\n\n.titlespace {\n	margin-bottom: 15px;\n}\n\n.headerspace {\n	margin-top: 20px;\n}\n\n.error {\n	color: #bcbcbc;\n	font-weight: bold;\n	font-size: 1em;\n}\n\n.reported {\n	background-color: #f7f7f7;\n}\n\nli.reported:hover {\n	background-color: #ececec;\n}\n\ndiv.rules {\n	background-color: #ececec;\n	color: #bcbcbc;\n	padding: 0 10px;\n	margin: 10px 0;\n	font-size: 1.1em;\n}\n\ndiv.rules ul, div.rules ol {\n	margin-left: 20px;\n}\n\np.rules {\n	background-color: #ececec;\n	background-image: none;\n	padding: 5px;\n}\n\np.rules img {\n	vertical-align: middle;\n	padding-top: 5px;\n}\n\np.rules a {\n	vertical-align: middle;\n	clear: both;\n}\n\n#top {\n	position: absolute;\n	top: -20px;\n}\n\n.clear {\n	display: block;\n	clear: both;\n	font-size: 1px;\n	line-height: 1px;\n	background: transparent;\n}\n/* Link Styles\n---------------------------------------- */\n\n/* Links adjustment to correctly display an order of rtl/ltr mixed content */\na {\n	direction: ltr;\n	unicode-bidi: embed;\n}\n\na:link	{ color: #898989; text-decoration: none; }\na:visited	{ color: #898989; text-decoration: none; }\na:hover	{ color: #d3d3d3; text-decoration: underline; }\na:active	{ color: #d2d2d2; text-decoration: none; }\n\n/* Coloured usernames */\n.username-coloured {\n	font-weight: bold;\n	display: inline !important;\n	padding: 0 !important;\n}\n\n/* Links on gradient backgrounds */\n#search-box a:link, .navbg a:link, .forumbg .header a:link, .forabg .header a:link, th a:link {\n	color: #FFFFFF;\n	text-decoration: none;\n}\n\n#search-box a:visited, .navbg a:visited, .forumbg .header a:visited, .forabg .header a:visited, th a:visited {\n	color: #FFFFFF;\n	text-decoration: none;\n}\n\n#search-box a:hover, .navbg a:hover, .forumbg .header a:hover, .forabg .header a:hover, th a:hover {\n	color: #ffffff;\n	text-decoration: underline;\n}\n\n#search-box a:active, .navbg a:active, .forumbg .header a:active, .forabg .header a:active, th a:active {\n	color: #ffffff;\n	text-decoration: none;\n}\n\n/* Links for forum/topic lists */\na.forumtitle {\n	font-family: "Trebuchet MS", Helvetica, Arial, Sans-serif;\n	font-size: 1.2em;\n	font-weight: bold;\n	color: #898989;\n	text-decoration: none;\n}\n\n/* a.forumtitle:visited { color: #898989; } */\n\na.forumtitle:hover {\n	color: #bcbcbc;\n	text-decoration: underline;\n}\n\na.forumtitle:active {\n	color: #898989;\n}\n\na.topictitle {\n	font-family: "Trebuchet MS", Helvetica, Arial, Sans-serif;\n	font-size: 1.2em;\n	font-weight: bold;\n	color: #898989;\n	text-decoration: none;\n}\n\n/* a.topictitle:visited { color: #d2d2d2; } */\n\na.topictitle:hover {\n	color: #bcbcbc;\n	text-decoration: underline;\n}\n\na.topictitle:active {\n	color: #898989;\n}\n\n/* Post body links */\n.postlink {\n	text-decoration: none;\n	color: #d2d2d2;\n	border-bottom: 1px solid #d2d2d2;\n	padding-bottom: 0;\n}\n\n/* .postlink:visited { color: #bdbdbd; } */\n\n.postlink:active {\n	color: #d2d2d2;\n}\n\n.postlink:hover {\n	background-color: #f6f6f6;\n	text-decoration: none;\n	color: #404040;\n}\n\n.signature a, .signature a:visited, .signature a:hover, .signature a:active {\n	border: none;\n	text-decoration: underline;\n	background-color: transparent;\n}\n\n/* Profile links */\n.postprofile a:link, .postprofile a:visited, .postprofile dt.author a {\n	font-weight: bold;\n	color: #898989;\n	text-decoration: none;\n}\n\n.postprofile a:hover, .postprofile dt.author a:hover {\n	text-decoration: underline;\n	color: #d3d3d3;\n}\n\n/* CSS spec requires a:link, a:visited, a:hover and a:active rules to be specified in this order. */\n/* See http://www.phpbb.com/bugs/phpbb3/59685 */\n.postprofile a:active {\n	font-weight: bold;\n	color: #898989;\n	text-decoration: none;\n}\n\n\n/* Profile searchresults */	\n.search .postprofile a {\n	color: #898989;\n	text-decoration: none; \n	font-weight: normal;\n}\n\n.search .postprofile a:hover {\n	color: #d3d3d3;\n	text-decoration: underline; \n}\n\n/* Back to top of page */\n.back2top {\n	clear: both;\n	height: 11px;\n	text-align: right;\n}\n\na.top {\n	background: none no-repeat top left;\n	text-decoration: none;\n	width: {IMG_ICON_BACK_TOP_WIDTH}px;\n	height: {IMG_ICON_BACK_TOP_HEIGHT}px;\n	display: block;\n	float: right;\n	overflow: hidden;\n	letter-spacing: 1000px;\n	text-indent: 11px;\n}\n\na.top2 {\n	background: none no-repeat 0 50%;\n	text-decoration: none;\n	padding-left: 15px;\n}\n\n/* Arrow links  */\na.up		{ background: none no-repeat left center; }\na.down		{ background: none no-repeat right center; }\na.left		{ background: none no-repeat 3px 60%; }\na.right		{ background: none no-repeat 95% 60%; }\n\na.up, a.up:link, a.up:active, a.up:visited {\n	padding-left: 10px;\n	text-decoration: none;\n	border-bottom-width: 0;\n}\n\na.up:hover {\n	background-position: left top;\n	background-color: transparent;\n}\n\na.down, a.down:link, a.down:active, a.down:visited {\n	padding-right: 10px;\n}\n\na.down:hover {\n	background-position: right bottom;\n	text-decoration: none;\n}\n\na.left, a.left:active, a.left:visited {\n	padding-left: 12px;\n}\n\na.left:hover {\n	color: #d2d2d2;\n	text-decoration: none;\n	background-position: 0 60%;\n}\n\na.right, a.right:active, a.right:visited {\n	padding-right: 12px;\n}\n\na.right:hover {\n	color: #d2d2d2;\n	text-decoration: none;\n	background-position: 100% 60%;\n}\n\n/* invisible skip link, used for accessibility  */\n.skiplink {\n	position: absolute;\n	left: -999px;\n	width: 990px;\n}\n\n/* Feed icon in forumlist_body.html */\na.feed-icon-forum {\n	float: right;\n	margin: 3px;\n}\n/* Content Styles\n---------------------------------------- */\n\nul.topiclist {\n	display: block;\n	list-style-type: none;\n	margin: 0;\n}\n\nul.forums {\n	background: #f9f9f9 none repeat-x 0 0;\n}\n\nul.topiclist li {\n	display: block;\n	list-style-type: none;\n	color: #777777;\n	margin: 0;\n}\n\nul.topiclist dl {\n	position: relative;\n}\n\nul.topiclist li.row dl {\n	padding: 2px 0;\n}\n\nul.topiclist dt {\n	display: block;\n	float: left;\n	width: 50%;\n	font-size: 1.1em;\n	padding-left: 5px;\n	padding-right: 5px;\n}\n\nul.topiclist dd {\n	display: block;\n	float: left;\n	border-left: 1px solid #FFFFFF;\n	padding: 4px 0;\n}\n\nul.topiclist dfn {\n	/* Labels for post/view counts */\n	position: absolute;\n	left: -999px;\n	width: 990px;\n}\n\nul.topiclist li.row dt a.subforum {\n	background-image: none;\n	background-position: 0 50%;\n	background-repeat: no-repeat;\n	position: relative;\n	white-space: nowrap;\n	padding: 0 0 0 12px;\n}\n\n.forum-image {\n	float: left;\n	padding-top: 5px;\n	margin-right: 5px;\n}\n\nli.row {\n	border-top: 1px solid #FFFFFF;\n	border-bottom: 1px solid #8f8f8f;\n}\n\nli.row strong {\n	font-weight: normal;\n	color: #000000;\n}\n\nli.row:hover {\n	background-color: #f6f6f6;\n}\n\nli.row:hover dd {\n	border-left-color: #CCCCCC;\n}\n\nli.header dt, li.header dd {\n	line-height: 1em;\n	border-left-width: 0;\n	margin: 2px 0 4px 0;\n	color: #FFFFFF;\n	padding-top: 2px;\n	padding-bottom: 2px;\n	font-size: 1em;\n	font-family: Arial, Helvetica, sans-serif;\n	text-transform: uppercase;\n}\n\nli.header dt {\n	font-weight: bold;\n}\n\nli.header dd {\n	margin-left: 1px;\n}\n\nli.header dl.icon {\n	min-height: 0;\n}\n\nli.header dl.icon dt {\n	/* Tweak for headers alignment when folder icon used */\n	padding-left: 0;\n	padding-right: 50px;\n}\n\n/* Forum list column styles */\ndl.icon {\n	min-height: 35px;\n	background-position: 10px 50%;		/* Position of folder icon */\n	background-repeat: no-repeat;\n}\n\ndl.icon dt {\n	padding-left: 45px;					/* Space for folder icon */\n	background-repeat: no-repeat;\n	background-position: 5px 95%;		/* Position of topic icon */\n}\n\ndd.posts, dd.topics, dd.views {\n	width: 8%;\n	text-align: center;\n	line-height: 2.2em;\n	font-size: 1.2em;\n}\n\n/* List in forum description */\ndl.icon dt ol,\ndl.icon dt ul {\n	list-style-position: inside;\n	margin-left: 1em;\n}\n\ndl.icon dt li {\n	display: list-item;\n	list-style-type: inherit;\n}\n\ndd.lastpost {\n	width: 25%;\n	font-size: 1.1em;\n}\n\ndd.redirect {\n	font-size: 1.1em;\n	line-height: 2.5em;\n}\n\ndd.moderation {\n	font-size: 1.1em;\n}\n\ndd.lastpost span, ul.topiclist dd.searchby span, ul.topiclist dd.info span, ul.topiclist dd.time span, dd.redirect span, dd.moderation span {\n	display: block;\n	padding-left: 5px;\n}\n\ndd.time {\n	width: auto;\n	line-height: 200%;\n	font-size: 1.1em;\n}\n\ndd.extra {\n	width: 12%;\n	line-height: 200%;\n	text-align: center;\n	font-size: 1.1em;\n}\n\ndd.mark {\n	float: right !important;\n	width: 9%;\n	text-align: center;\n	line-height: 200%;\n	font-size: 1.2em;\n}\n\ndd.info {\n	width: 30%;\n}\n\ndd.option {\n	width: 15%;\n	line-height: 200%;\n	text-align: center;\n	font-size: 1.1em;\n}\n\ndd.searchby {\n	width: 47%;\n	font-size: 1.1em;\n	line-height: 1em;\n}\n\nul.topiclist dd.searchextra {\n	margin-left: 5px;\n	padding: 0.2em 0;\n	font-size: 1.1em;\n	color: #333333;\n	border-left: none;\n	clear: both;\n	width: 98%;\n	overflow: hidden;\n}\n\n/* Container for post/reply buttons and pagination */\n.topic-actions {\n	margin-bottom: 3px;\n	font-size: 1.1em;\n	height: 28px;\n	min-height: 28px;\n}\ndiv[class].topic-actions {\n	height: auto;\n}\n\n/* Post body styles\n----------------------------------------*/\n.postbody {\n	padding: 0;\n	line-height: 1.48em;\n	color: #333333;\n	width: 76%;\n	float: left;\n	clear: both;\n}\n\n.postbody .ignore {\n	font-size: 1.1em;\n}\n\n.postbody h3.first {\n	/* The first post on the page uses this */\n	font-size: 1.7em;\n}\n\n.postbody h3 {\n	/* Postbody requires a different h3 format - so change it here */\n	font-size: 1.5em;\n	padding: 2px 0 0 0;\n	margin: 0 0 0.3em 0 !important;\n	text-transform: none;\n	border: none;\n	font-family: "Trebuchet MS", Verdana, Helvetica, Arial, sans-serif;\n	line-height: 125%;\n}\n\n.postbody h3 img {\n	/* Also see tweaks.css */\n	vertical-align: bottom;\n}\n\n.postbody .content {\n	font-size: 1.3em;\n}\n\n.search .postbody {\n	width: 68%\n}\n\n/* Topic review panel\n----------------------------------------*/\n#review {\n	margin-top: 2em;\n}\n\n#topicreview {\n	padding-right: 5px;\n	overflow: auto;\n	height: 300px;\n}\n\n#topicreview .postbody {\n	width: auto;\n	float: none;\n	margin: 0;\n	height: auto;\n}\n\n#topicreview .post {\n	height: auto;\n}\n\n#topicreview h2 {\n	border-bottom-width: 0;\n}\n\n.post-ignore .postbody {\n	display: none;\n}\n\n/* MCP Post details\n----------------------------------------*/\n#post_details\n{\n	/* This will only work in IE7+, plus the others */\n	overflow: auto;\n	max-height: 300px;\n}\n\n#expand\n{\n	clear: both;\n}\n\n/* Content container styles\n----------------------------------------*/\n.content {\n	min-height: 3em;\n	overflow: hidden;\n	line-height: 1.4em;\n	font-family: "Lucida Grande", "Trebuchet MS", Verdana, Helvetica, Arial, sans-serif;\n	font-size: 1em;\n	color: #333333;\n	padding-bottom: 1px;\n}\n\n.content h2, .panel h2 {\n	font-weight: normal;\n	color: #989898;\n	border-bottom: 1px solid #CCCCCC;\n	font-size: 1.6em;\n	margin-top: 0.5em;\n	margin-bottom: 0.5em;\n	padding-bottom: 0.5em;\n}\n\n.panel h3 {\n	margin: 0.5em 0;\n}\n\n.panel p {\n	font-size: 1.2em;\n	margin-bottom: 1em;\n	line-height: 1.4em;\n}\n\n.content p {\n	font-family: "Lucida Grande", "Trebuchet MS", Verdana, Helvetica, Arial, sans-serif;\n	font-size: 1.2em;\n	margin-bottom: 1em;\n	line-height: 1.4em;\n}\n\ndl.faq {\n	font-family: "Lucida Grande", Verdana, Helvetica, Arial, sans-serif;\n	font-size: 1.1em;\n	margin-top: 1em;\n	margin-bottom: 2em;\n	line-height: 1.4em;\n}\n\ndl.faq dt {\n	font-weight: bold;\n	color: #333333;\n}\n\n.content dl.faq {\n	font-size: 1.2em;\n	margin-bottom: 0.5em;\n}\n\n.content li {\n	list-style-type: inherit;\n}\n\n.content ul, .content ol {\n	margin-bottom: 1em;\n	margin-left: 3em;\n}\n\n.posthilit {\n	background-color: #f3f3f3;\n	color: #BCBCBC;\n	padding: 0 2px 1px 2px;\n}\n\n.announce, .unreadpost {\n	/* Highlight the announcements & unread posts box */\n	border-left-color: #BCBCBC;\n	border-right-color: #BCBCBC;\n}\n\n/* Post author */\np.author {\n	margin: 0 15em 0.6em 0;\n	padding: 0 0 5px 0;\n	font-family: Verdana, Helvetica, Arial, sans-serif;\n	font-size: 1em;\n	line-height: 1.2em;\n}\n\n/* Post signature */\n.signature {\n	margin-top: 1.5em;\n	padding-top: 0.2em;\n	font-size: 1.1em;\n	border-top: 1px solid #CCCCCC;\n	clear: left;\n	line-height: 140%;\n	overflow: hidden;\n	width: 100%;\n}\n\ndd .signature {\n	margin: 0;\n	padding: 0;\n	clear: none;\n	border: none;\n}\n\n.signature li {\n	list-style-type: inherit;\n}\n\n.signature ul, .signature ol {\n	margin-bottom: 1em;\n	margin-left: 3em;\n}\n\n/* Post noticies */\n.notice {\n	font-family: "Lucida Grande", Verdana, Helvetica, Arial, sans-serif;\n	width: auto;\n	margin-top: 1.5em;\n	padding-top: 0.2em;\n	font-size: 1em;\n	border-top: 1px dashed #CCCCCC;\n	clear: left;\n	line-height: 130%;\n}\n\n/* Jump to post link for now */\nul.searchresults {\n	list-style: none;\n	text-align: right;\n	clear: both;\n}\n\n/* BB Code styles\n----------------------------------------*/\n/* Quote block */\nblockquote {\n	background: #ebebeb none 6px 8px no-repeat;\n	border: 1px solid #dbdbdb;\n	font-size: 0.95em;\n	margin: 0.5em 1px 0 25px;\n	overflow: hidden;\n	padding: 5px;\n}\n\nblockquote blockquote {\n	/* Nested quotes */\n	background-color: #bababa;\n	font-size: 1em;\n	margin: 0.5em 1px 0 15px;	\n}\n\nblockquote blockquote blockquote {\n	/* Nested quotes */\n	background-color: #e4e4e4;\n}\n\nblockquote cite {\n	/* Username/source of quoter */\n	font-style: normal;\n	font-weight: bold;\n	margin-left: 20px;\n	display: block;\n	font-size: 0.9em;\n}\n\nblockquote cite cite {\n	font-size: 1em;\n}\n\nblockquote.uncited {\n	padding-top: 25px;\n}\n\n/* Code block */\ndl.codebox {\n	padding: 3px;\n	background-color: #FFFFFF;\n	border: 1px solid #d8d8d8;\n	font-size: 1em;\n}\n\ndl.codebox dt {\n	text-transform: uppercase;\n	border-bottom: 1px solid #CCCCCC;\n	margin-bottom: 3px;\n	font-size: 0.8em;\n	font-weight: bold;\n	display: block;\n}\n\nblockquote dl.codebox {\n	margin-left: 0;\n}\n\ndl.codebox code {\n	/* Also see tweaks.css */\n	overflow: auto;\n	display: block;\n	height: auto;\n	max-height: 200px;\n	white-space: normal;\n	padding-top: 5px;\n	font: 0.9em Monaco, "Andale Mono","Courier New", Courier, mono;\n	line-height: 1.3em;\n	color: #8b8b8b;\n	margin: 2px 0;\n}\n\n.syntaxbg		{ color: #FFFFFF; }\n.syntaxcomment	{ color: #000000; }\n.syntaxdefault	{ color: #bcbcbc; }\n.syntaxhtml		{ color: #000000; }\n.syntaxkeyword	{ color: #585858; }\n.syntaxstring	{ color: #a7a7a7; }\n\n/* Attachments\n----------------------------------------*/\n.attachbox {\n	float: left;\n	width: auto; \n	margin: 5px 5px 5px 0;\n	padding: 6px;\n	background-color: #FFFFFF;\n	border: 1px dashed #d8d8d8;\n	clear: left;\n}\n\n.pm-message .attachbox {\n	background-color: #f3f3f3;\n}\n\n.attachbox dt {\n	font-family: Arial, Helvetica, sans-serif;\n	text-transform: uppercase;\n}\n\n.attachbox dd {\n	margin-top: 4px;\n	padding-top: 4px;\n	clear: left;\n	border-top: 1px solid #d8d8d8;\n}\n\n.attachbox dd dd {\n	border: none;\n}\n\n.attachbox p {\n	line-height: 110%;\n	color: #666666;\n	font-weight: normal;\n	clear: left;\n}\n\n.attachbox p.stats\n{\n	line-height: 110%;\n	color: #666666;\n	font-weight: normal;\n	clear: left;\n}\n\n.attach-image {\n	margin: 3px 0;\n	width: 100%;\n	max-height: 350px;\n	overflow: auto;\n}\n\n.attach-image img {\n	border: 1px solid #999999;\n/*	cursor: move; */\n	cursor: default;\n}\n\n/* Inline image thumbnails */\ndiv.inline-attachment dl.thumbnail, div.inline-attachment dl.file {\n	display: block;\n	margin-bottom: 4px;\n}\n\ndiv.inline-attachment p {\n	font-size: 100%;\n}\n\ndl.file {\n	font-family: Verdana, Arial, Helvetica, sans-serif;\n	display: block;\n}\n\ndl.file dt {\n	text-transform: none;\n	margin: 0;\n	padding: 0;\n	font-weight: bold;\n	font-family: Verdana, Arial, Helvetica, sans-serif;\n}\n\ndl.file dd {\n	color: #666666;\n	margin: 0;\n	padding: 0;	\n}\n\ndl.thumbnail img {\n	padding: 3px;\n	border: 1px solid #666666;\n	background-color: #FFF;\n}\n\ndl.thumbnail dd {\n	color: #666666;\n	font-style: italic;\n	font-family: Verdana, Arial, Helvetica, sans-serif;\n}\n\n.attachbox dl.thumbnail dd {\n	font-size: 100%;\n}\n\ndl.thumbnail dt a:hover {\n	background-color: #EEEEEE;\n}\n\ndl.thumbnail dt a:hover img {\n	border: 1px solid #d2d2d2;\n}\n\n/* Post poll styles\n----------------------------------------*/\nfieldset.polls {\n	font-family: "Trebuchet MS", Verdana, Helvetica, Arial, sans-serif;\n}\n\nfieldset.polls dl {\n	margin-top: 5px;\n	border-top: 1px solid #e2e2e2;\n	padding: 5px 0 0 0;\n	line-height: 120%;\n	color: #666666;\n}\n\nfieldset.polls dl.voted {\n	font-weight: bold;\n	color: #000000;\n}\n\nfieldset.polls dt {\n	text-align: left;\n	float: left;\n	display: block;\n	width: 30%;\n	border-right: none;\n	padding: 0;\n	margin: 0;\n	font-size: 1.1em;\n}\n\nfieldset.polls dd {\n	float: left;\n	width: 10%;\n	border-left: none;\n	padding: 0 5px;\n	margin-left: 0;\n	font-size: 1.1em;\n}\n\nfieldset.polls dd.resultbar {\n	width: 50%;\n}\n\nfieldset.polls dd input {\n	margin: 2px 0;\n}\n\nfieldset.polls dd div {\n	text-align: right;\n	font-family: Arial, Helvetica, sans-serif;\n	color: #FFFFFF;\n	font-weight: bold;\n	padding: 0 2px;\n	overflow: visible;\n	min-width: 2%;\n}\n\n.pollbar1 {\n	background-color: #aaaaaa;\n	border-bottom: 1px solid #747474;\n	border-right: 1px solid #747474;\n}\n\n.pollbar2 {\n	background-color: #bebebe;\n	border-bottom: 1px solid #8c8c8c;\n	border-right: 1px solid #8c8c8c;\n}\n\n.pollbar3 {\n	background-color: #D1D1D1;\n	border-bottom: 1px solid #aaaaaa;\n	border-right: 1px solid #aaaaaa;\n}\n\n.pollbar4 {\n	background-color: #e4e4e4;\n	border-bottom: 1px solid #bebebe;\n	border-right: 1px solid #bebebe;\n}\n\n.pollbar5 {\n	background-color: #f8f8f8;\n	border-bottom: 1px solid #D1D1D1;\n	border-right: 1px solid #D1D1D1;\n}\n\n/* Poster profile block\n----------------------------------------*/\n.postprofile {\n	/* Also see tweaks.css */\n	margin: 5px 0 10px 0;\n	min-height: 80px;\n	color: #666666;\n	border-left: 1px solid #FFFFFF;\n	width: 22%;\n	float: right;\n	display: inline;\n}\n.pm .postprofile {\n	border-left: 1px solid #DDDDDD;\n}\n\n.postprofile dd, .postprofile dt {\n	line-height: 1.2em;\n	margin-left: 8px;\n}\n\n.postprofile strong {\n	font-weight: normal;\n	color: #000000;\n}\n\n.avatar {\n	border: none;\n	margin-bottom: 3px;\n}\n\n.online {\n	background-image: none;\n	background-position: 100% 0;\n	background-repeat: no-repeat;\n}\n\n/* Poster profile used by search*/\n.search .postprofile {\n	width: 30%;\n}\n\n/* pm list in compose message if mass pm is enabled */\ndl.pmlist dt {\n	width: 60% !important;\n}\n\ndl.pmlist dt textarea {\n	width: 95%;\n}\n\ndl.pmlist dd {\n	margin-left: 61% !important;\n	margin-bottom: 2px;\n}\n/* Button Styles\n---------------------------------------- */\n\n/* Rollover buttons\n   Based on: http://wellstyled.com/css-nopreload-rollovers.html\n----------------------------------------*/\n.buttons {\n	float: left;\n	width: auto;\n	height: auto;\n}\n\n/* Rollover state */\n.buttons div {\n	float: left;\n	margin: 0 5px 0 0;\n	background-position: 0 100%;\n}\n\n/* Rolloff state */\n.buttons div a {\n	display: block;\n	width: 100%;\n	height: 100%;\n	background-position: 0 0;\n	position: relative;\n	overflow: hidden;\n}\n\n/* Hide <a> text and hide off-state image when rolling over (prevents flicker in IE) */\n/*.buttons div span		{ display: none; }*/\n/*.buttons div a:hover	{ background-image: none; }*/\n.buttons div span			{ position: absolute; width: 100%; height: 100%; cursor: pointer;}\n.buttons div a:hover span	{ background-position: 0 100%; }\n\n/* Big button images */\n.reply-icon span	{ background: transparent none 0 0 no-repeat; }\n.post-icon span		{ background: transparent none 0 0 no-repeat; }\n.locked-icon span	{ background: transparent none 0 0 no-repeat; }\n.pmreply-icon span	{ background: none 0 0 no-repeat; }\n.newpm-icon span 	{ background: none 0 0 no-repeat; }\n.forwardpm-icon span 	{ background: none 0 0 no-repeat; }\n\n/* Set big button dimensions */\n.buttons div.reply-icon		{ width: {IMG_BUTTON_TOPIC_REPLY_WIDTH}px; height: {IMG_BUTTON_TOPIC_REPLY_HEIGHT}px; }\n.buttons div.post-icon		{ width: {IMG_BUTTON_TOPIC_NEW_WIDTH}px; height: {IMG_BUTTON_TOPIC_NEW_HEIGHT}px; }\n.buttons div.locked-icon	{ width: {IMG_BUTTON_TOPIC_LOCKED_WIDTH}px; height: {IMG_BUTTON_TOPIC_LOCKED_HEIGHT}px; }\n.buttons div.pmreply-icon	{ width: {IMG_BUTTON_PM_REPLY_WIDTH}px; height: {IMG_BUTTON_PM_REPLY_HEIGHT}px; }\n.buttons div.newpm-icon		{ width: {IMG_BUTTON_PM_NEW_WIDTH}px; height: {IMG_BUTTON_PM_NEW_HEIGHT}px; }\n.buttons div.forwardpm-icon	{ width: {IMG_BUTTON_PM_FORWARD_WIDTH}px; height: {IMG_BUTTON_PM_FORWARD_HEIGHT}px; }\n\n/* Sub-header (navigation bar)\n--------------------------------------------- */\na.print, a.sendemail, a.fontsize {\n	display: block;\n	overflow: hidden;\n	height: 18px;\n	text-indent: -5000px;\n	text-align: left;\n	background-repeat: no-repeat;\n}\n\na.print {\n	background-image: none;\n	width: 22px;\n}\n\na.sendemail {\n	background-image: none;\n	width: 22px;\n}\n\na.fontsize {\n	background-image: none;\n	background-position: 0 -1px;\n	width: 29px;\n}\n\na.fontsize:hover {\n	background-position: 0 -20px;\n	text-decoration: none;\n}\n\n/* Icon images\n---------------------------------------- */\n.sitehome, .icon-faq, .icon-members, .icon-home, .icon-ucp, .icon-register, .icon-logout,\n.icon-bookmark, .icon-bump, .icon-subscribe, .icon-unsubscribe, .icon-pages, .icon-search {\n	background-position: 0 50%;\n	background-repeat: no-repeat;\n	background-image: none;\n	padding: 1px 0 0 17px;\n}\n\n/* Poster profile icons\n----------------------------------------*/\nul.profile-icons {\n	padding-top: 10px;\n	list-style: none;\n}\n\n/* Rollover state */\nul.profile-icons li {\n	float: left;\n	margin: 0 6px 3px 0;\n	background-position: 0 100%;\n}\n\n/* Rolloff state */\nul.profile-icons li a {\n	display: block;\n	width: 100%;\n	height: 100%;\n	background-position: 0 0;\n}\n\n/* Hide <a> text and hide off-state image when rolling over (prevents flicker in IE) */\nul.profile-icons li span { display:none; }\nul.profile-icons li a:hover { background: none; }\n\n/* Positioning of moderator icons */\n.postbody ul.profile-icons {\n	float: right;\n	width: auto;\n	padding: 0;\n}\n\n.postbody ul.profile-icons li {\n	margin: 0 3px;\n}\n\n/* Profile & navigation icons */\n.email-icon, .email-icon a		{ background: none top left no-repeat; }\n.aim-icon, .aim-icon a			{ background: none top left no-repeat; }\n.yahoo-icon, .yahoo-icon a		{ background: none top left no-repeat; }\n.web-icon, .web-icon a			{ background: none top left no-repeat; }\n.msnm-icon, .msnm-icon a			{ background: none top left no-repeat; }\n.icq-icon, .icq-icon a			{ background: none top left no-repeat; }\n.jabber-icon, .jabber-icon a		{ background: none top left no-repeat; }\n.pm-icon, .pm-icon a				{ background: none top left no-repeat; }\n.quote-icon, .quote-icon a		{ background: none top left no-repeat; }\n\n/* Moderator icons */\n.report-icon, .report-icon a		{ background: none top left no-repeat; }\n.warn-icon, .warn-icon a			{ background: none top left no-repeat; }\n.edit-icon, .edit-icon a			{ background: none top left no-repeat; }\n.delete-icon, .delete-icon a		{ background: none top left no-repeat; }\n.info-icon, .info-icon a			{ background: none top left no-repeat; }\n\n/* Set profile icon dimensions */\nul.profile-icons li.email-icon		{ width: {IMG_ICON_CONTACT_EMAIL_WIDTH}px; height: {IMG_ICON_CONTACT_EMAIL_HEIGHT}px; }\nul.profile-icons li.aim-icon	{ width: {IMG_ICON_CONTACT_AIM_WIDTH}px; height: {IMG_ICON_CONTACT_AIM_HEIGHT}px; }\nul.profile-icons li.yahoo-icon	{ width: {IMG_ICON_CONTACT_YAHOO_WIDTH}px; height: {IMG_ICON_CONTACT_YAHOO_HEIGHT}px; }\nul.profile-icons li.web-icon	{ width: {IMG_ICON_CONTACT_WWW_WIDTH}px; height: {IMG_ICON_CONTACT_WWW_HEIGHT}px; }\nul.profile-icons li.msnm-icon	{ width: {IMG_ICON_CONTACT_MSNM_WIDTH}px; height: {IMG_ICON_CONTACT_MSNM_HEIGHT}px; }\nul.profile-icons li.icq-icon	{ width: {IMG_ICON_CONTACT_ICQ_WIDTH}px; height: {IMG_ICON_CONTACT_ICQ_HEIGHT}px; }\nul.profile-icons li.jabber-icon	{ width: {IMG_ICON_CONTACT_JABBER_WIDTH}px; height: {IMG_ICON_CONTACT_JABBER_HEIGHT}px; }\nul.profile-icons li.pm-icon		{ width: {IMG_ICON_CONTACT_PM_WIDTH}px; height: {IMG_ICON_CONTACT_PM_HEIGHT}px; }\nul.profile-icons li.quote-icon	{ width: {IMG_ICON_POST_QUOTE_WIDTH}px; height: {IMG_ICON_POST_QUOTE_HEIGHT}px; }\nul.profile-icons li.report-icon	{ width: {IMG_ICON_POST_REPORT_WIDTH}px; height: {IMG_ICON_POST_REPORT_HEIGHT}px; }\nul.profile-icons li.edit-icon	{ width: {IMG_ICON_POST_EDIT_WIDTH}px; height: {IMG_ICON_POST_EDIT_HEIGHT}px; }\nul.profile-icons li.delete-icon	{ width: {IMG_ICON_POST_DELETE_WIDTH}px; height: {IMG_ICON_POST_DELETE_HEIGHT}px; }\nul.profile-icons li.info-icon	{ width: {IMG_ICON_POST_INFO_WIDTH}px; height: {IMG_ICON_POST_INFO_HEIGHT}px; }\nul.profile-icons li.warn-icon	{ width: {IMG_ICON_USER_WARN_WIDTH}px; height: {IMG_ICON_USER_WARN_HEIGHT}px; }\n\n/* Fix profile icon default margins */\nul.profile-icons li.edit-icon	{ margin: 0 0 0 3px; }\nul.profile-icons li.quote-icon	{ margin: 0 0 0 10px; }\nul.profile-icons li.info-icon, ul.profile-icons li.report-icon	{ margin: 0 3px 0 0; }\n/* Control Panel Styles\n---------------------------------------- */\n\n\n/* Main CP box\n----------------------------------------*/\n#cp-menu {\n	float:left;\n	width: 19%;\n	margin-top: 1em;\n	margin-bottom: 5px;\n}\n\n#cp-main {\n	float: left;\n	width: 81%;\n}\n\n#cp-main .content {\n	padding: 0;\n}\n\n#cp-main h3, #cp-main hr, #cp-menu hr {\n	border-color: #bfbfbf;\n}\n\n#cp-main .panel p {\n	font-size: 1.1em;\n}\n\n#cp-main .panel ol {\n	margin-left: 2em;\n	font-size: 1.1em;\n}\n\n#cp-main .panel li.row {\n	border-bottom: 1px solid #cbcbcb;\n	border-top: 1px solid #F9F9F9;\n}\n\nul.cplist {\n	margin-bottom: 5px;\n	border-top: 1px solid #cbcbcb;\n}\n\n#cp-main .panel li.header dd, #cp-main .panel li.header dt {\n	color: #000000;\n	margin-bottom: 2px;\n}\n\n#cp-main table.table1 {\n	margin-bottom: 1em;\n}\n\n#cp-main table.table1 thead th {\n	color: #333333;\n	font-weight: bold;\n	border-bottom: 1px solid #333333;\n	padding: 5px;\n}\n\n#cp-main table.table1 tbody th {\n	font-style: italic;\n	background-color: transparent !important;\n	border-bottom: none;\n}\n\n#cp-main .pagination {\n	float: right;\n	width: auto;\n	padding-top: 1px;\n}\n\n#cp-main .postbody p {\n	font-size: 1.1em;\n}\n\n#cp-main .pm-message {\n	border: 1px solid #e2e2e2;\n	margin: 10px 0;\n	background-color: #FFFFFF;\n	width: auto;\n	float: none;\n}\n\n.pm-message h2 {\n	padding-bottom: 5px;\n}\n\n#cp-main .postbody h3, #cp-main .box2 h3 {\n	margin-top: 0;\n}\n\n#cp-main .buttons {\n	margin-left: 0;\n}\n\n#cp-main ul.linklist {\n	margin: 0;\n}\n\n/* MCP Specific tweaks */\n.mcp-main .postbody {\n	width: 100%;\n}\n\n.tabs-container h2 {\n	float: left;\n	margin-bottom: 0px;\n}\n\n.tabs-container #minitabs {\n	float: right;\n	margin-top: 19px;\n}\n\n.tabs-container:after {\n	display: block;\n	clear: both;\n	content: '''';\n}\n\n/* CP tabbed menu\n----------------------------------------*/\n#tabs {\n	line-height: normal;\n	margin: 20px 0 -1px 7px;\n	min-width: 570px;\n}\n\n#tabs ul {\n	margin:0;\n	padding: 0;\n	list-style: none;\n}\n\n#tabs li {\n	display: inline;\n	margin: 0;\n	padding: 0;\n	font-size: 1em;\n	font-weight: bold;\n}\n\n#tabs a {\n	float: left;\n	background: none no-repeat 0% -35px;\n	margin: 0 1px 0 0;\n	padding: 0 0 0 5px;\n	text-decoration: none;\n	position: relative;\n	cursor: pointer;\n}\n\n#tabs a span {\n	float: left;\n	display: block;\n	background: none no-repeat 100% -35px;\n	padding: 6px 10px 6px 5px;\n	color: #828282;\n	white-space: nowrap;\n}\n\n#tabs a:hover span {\n	color: #bcbcbc;\n}\n\n#tabs .activetab a {\n	background-position: 0 0;\n	border-bottom: 1px solid #ebebeb;\n}\n\n#tabs .activetab a span {\n	background-position: 100% 0;\n	padding-bottom: 7px;\n	color: #333333;\n}\n\n#tabs a:hover {\n	background-position: 0 -70px;\n}\n\n#tabs a:hover span {\n	background-position:100% -70px;\n}\n\n#tabs .activetab a:hover {\n	background-position: 0 0;\n}\n\n#tabs .activetab a:hover span {\n	color: #000000;\n	background-position: 100% 0;\n}\n\n/* Mini tabbed menu used in MCP\n----------------------------------------*/\n#minitabs {\n	line-height: normal;\n	margin: -20px 7px 0 0;\n}\n\n#minitabs ul {\n	margin:0;\n	padding: 0;\n	list-style: none;\n}\n\n#minitabs li {\n	display: block;\n	float: right;\n	padding: 0 10px 4px 10px;\n	font-size: 1em;\n	font-weight: bold;\n	background-color: #f2f2f2;\n	margin-left: 2px;\n}\n\n#minitabs a {\n}\n\n#minitabs a:hover {\n	text-decoration: none;\n}\n\n#minitabs li.activetab {\n	background-color: #F9F9F9;\n}\n\n#minitabs li.activetab a, #minitabs li.activetab a:hover {\n	color: #333333;\n}\n\n/* UCP navigation menu\n----------------------------------------*/\n/* Container for sub-navigation list */\n#navigation {\n	width: 100%;\n	padding-top: 36px;\n}\n\n#navigation ul {\n	list-style:none;\n}\n\n/* Default list state */\n#navigation li {\n	margin: 1px 0;\n	padding: 0;\n	font-weight: bold;\n	display: inline;\n}\n\n/* Link styles for the sub-section links */\n#navigation a {\n	display: block;\n	padding: 5px;\n	margin: 1px 0;\n	text-decoration: none;\n	font-weight: bold;\n	color: #333;\n	background: #cfcfcf none repeat-y 100% 0;\n}\n\n#navigation a:hover {\n	text-decoration: none;\n	background-color: #c6c6c6;\n	color: #bcbcbc;\n	background-image: none;\n}\n\n#navigation #active-subsection a {\n	display: block;\n	color: #d3d3d3;\n	background-color: #F9F9F9;\n	background-image: none;\n}\n\n#navigation #active-subsection a:hover {\n	color: #d3d3d3;\n}\n\n/* Preferences pane layout\n----------------------------------------*/\n#cp-main h2 {\n	border-bottom: none;\n	padding: 0;\n	margin-left: 10px;\n	color: #333333;\n}\n\n#cp-main .panel {\n	background-color: #F9F9F9;\n}\n\n#cp-main .pm {\n	background-color: #FFFFFF;\n}\n\n#cp-main span.corners-top, #cp-menu span.corners-top {\n	background-image: none;\n}\n\n#cp-main span.corners-top span, #cp-menu span.corners-top span {\n	background-image: none;\n}\n\n#cp-main span.corners-bottom, #cp-menu span.corners-bottom {\n	background-image: none;\n}\n\n#cp-main span.corners-bottom span, #cp-menu span.corners-bottom span {\n	background-image: none;\n}\n\n/* Topicreview */\n#cp-main .panel #topicreview span.corners-top, #cp-menu .panel #topicreview span.corners-top {\n	background-image: none;\n}\n\n#cp-main .panel #topicreview span.corners-top span, #cp-menu .panel #topicreview span.corners-top span {\n	background-image: none;\n}\n\n#cp-main .panel #topicreview span.corners-bottom, #cp-menu .panel #topicreview span.corners-bottom {\n	background-image: none;\n}\n\n#cp-main .panel #topicreview span.corners-bottom span, #cp-menu .panel #topicreview span.corners-bottom span {\n	background-image: none;\n}\n\n/* Friends list */\n.cp-mini {\n	background-color: #f9f9f9;\n	padding: 0 5px;\n	margin: 10px 15px 10px 5px;\n}\n\n.cp-mini span.corners-top, .cp-mini span.corners-bottom {\n	margin: 0 -5px;\n}\n\ndl.mini dt {\n	font-weight: bold;\n	color: #676767;\n}\n\ndl.mini dd {\n	padding-top: 4px;\n}\n\n.friend-online {\n	font-weight: bold;\n}\n\n.friend-offline {\n	font-style: italic;\n}\n\n/* PM Styles\n----------------------------------------*/\n#pm-menu {\n	line-height: 2.5em;\n}\n\n/* PM panel adjustments */\n.reply-all a.left {\n	background-position: 3px 60%;\n}\n\n.reply-all a.left:hover {\n	background-position: 0px 60%;\n}\n\n.reply-all {\n	font-size: 11px;\n	padding-top: 5px;\n}\n\n/* PM Message history */\n.current {\n	color: #999999;\n}\n\n/* Defined rules list for PM options */\nol.def-rules {\n	padding-left: 0;\n}\n\nol.def-rules li {\n	line-height: 180%;\n	padding: 1px;\n}\n\n/* PM marking colours */\n.pmlist li.bg1 {\n	padding: 0 3px;\n}\n\n.pmlist li.bg2 {\n	padding: 0 3px;\n}\n\n.pmlist li.pm_message_reported_colour, .pm_message_reported_colour {\n	border-left-color: #bcbcbc;\n	border-right-color: #bcbcbc;\n}\n\n.pmlist li.pm_marked_colour, .pm_marked_colour {\n	padding: 0;\n	border: solid 3px #ffffff;\n	border-width: 0 3px;\n}\n\n.pmlist li.pm_replied_colour, .pm_replied_colour {\n	padding: 0;\n	border: solid 3px #c2c2c2;\n	border-width: 0 3px;\n}\n\n.pmlist li.pm_friend_colour, .pm_friend_colour {\n	padding: 0;\n	border: solid 3px #bdbdbd;\n	border-width: 0 3px;\n}\n\n.pmlist li.pm_foe_colour, .pm_foe_colour {\n	padding: 0;\n	border: solid 3px #000000;\n	border-width: 0 3px;\n}\n\n.pm-legend {\n	border-left-width: 10px;\n	border-left-style: solid;\n	border-right-width: 0;\n	margin-bottom: 3px;\n	padding-left: 3px;\n}\n\n/* Avatar gallery */\n#gallery label {\n	position: relative;\n	float: left;\n	margin: 10px;\n	padding: 5px;\n	width: auto;\n	background: #FFFFFF;\n	border: 1px solid #CCC;\n	text-align: center;\n}\n\n#gallery label:hover {\n	background-color: #EEE;\n}\n/* Form Styles\n---------------------------------------- */\n\n/* General form styles\n----------------------------------------*/\nfieldset {\n	border-width: 0;\n	font-family: Verdana, Helvetica, Arial, sans-serif;\n	font-size: 1.1em;\n}\n\ninput {\n	font-weight: normal;\n	cursor: pointer;\n	vertical-align: middle;\n	padding: 0 3px;\n	font-size: 1em;\n	font-family: Verdana, Helvetica, Arial, sans-serif;\n}\n\nselect {\n	font-family: Verdana, Helvetica, Arial, sans-serif;\n	font-weight: normal;\n	cursor: pointer;\n	vertical-align: middle;\n	border: 1px solid #666666;\n	padding: 1px;\n	background-color: #FAFAFA;\n	font-size: 1em;\n}\n\noption {\n	padding-right: 1em;\n}\n\noption.disabled-option {\n	color: graytext;\n}\n\ntextarea {\n	font-family: "Lucida Grande", Verdana, Helvetica, Arial, sans-serif;\n	width: 60%;\n	padding: 2px;\n	font-size: 1em;\n	line-height: 1.4em;\n}\n\nlabel {\n	cursor: default;\n	padding-right: 5px;\n	color: #676767;\n}\n\nlabel input {\n	vertical-align: middle;\n}\n\nlabel img {\n	vertical-align: middle;\n}\n\n/* Definition list layout for forms\n---------------------------------------- */\nfieldset dl {\n	padding: 4px 0;\n}\n\nfieldset dt {\n	float: left;	\n	width: 40%;\n	text-align: left;\n	display: block;\n}\n\nfieldset dd {\n	margin-left: 41%;\n	vertical-align: top;\n	margin-bottom: 3px;\n}\n\n/* Specific layout 1 */\nfieldset.fields1 dt {\n	width: 15em;\n	border-right-width: 0;\n}\n\nfieldset.fields1 dd {\n	margin-left: 15em;\n	border-left-width: 0;\n}\n\nfieldset.fields1 {\n	background-color: transparent;\n}\n\nfieldset.fields1 div {\n	margin-bottom: 3px;\n}\n\n/* Set it back to 0px for the reCaptcha divs: PHPBB3-9587 */\nfieldset.fields1 #recaptcha_widget_div div {\n	margin-bottom: 0;\n}\n\n/* Specific layout 2 */\nfieldset.fields2 dt {\n	width: 15em;\n	border-right-width: 0;\n}\n\nfieldset.fields2 dd {\n	margin-left: 16em;\n	border-left-width: 0;\n}\n\n/* Form elements */\ndt label {\n	font-weight: bold;\n	text-align: left;\n}\n\ndd label {\n	white-space: nowrap;\n	color: #333;\n}\n\ndd input, dd textarea {\n	margin-right: 3px;\n}\n\ndd select {\n	width: auto;\n}\n\ndd textarea {\n	width: 85%;\n}\n\n/* Hover effects */\nfieldset dl:hover dt label {\n	color: #000000;\n}\n\nfieldset.fields2 dl:hover dt label {\n	color: inherit;\n}\n\n#timezone {\n	width: 95%;\n}\n\n* html #timezone {\n	width: 50%;\n}\n\n/* Quick-login on index page */\nfieldset.quick-login {\n	margin-top: 5px;\n}\n\nfieldset.quick-login input {\n	width: auto;\n}\n\nfieldset.quick-login input.inputbox {\n	width: 15%;\n	vertical-align: middle;\n	margin-right: 5px;\n	background-color: #f3f3f3;\n}\n\nfieldset.quick-login label {\n	white-space: nowrap;\n	padding-right: 2px;\n}\n\n/* Display options on viewtopic/viewforum pages  */\nfieldset.display-options {\n	text-align: center;\n	margin: 3px 0 5px 0;\n}\n\nfieldset.display-options label {\n	white-space: nowrap;\n	padding-right: 2px;\n}\n\nfieldset.display-options a {\n	margin-top: 3px;\n}\n\n/* Display actions for ucp and mcp pages */\nfieldset.display-actions {\n	text-align: right;\n	line-height: 2em;\n	white-space: nowrap;\n	padding-right: 1em;\n}\n\nfieldset.display-actions label {\n	white-space: nowrap;\n	padding-right: 2px;\n}\n\nfieldset.sort-options {\n	line-height: 2em;\n}\n\n/* MCP forum selection*/\nfieldset.forum-selection {\n	margin: 5px 0 3px 0;\n	float: right;\n}\n\nfieldset.forum-selection2 {\n	margin: 13px 0 3px 0;\n	float: right;\n}\n\n/* Jumpbox */\nfieldset.jumpbox {\n	text-align: right;\n	margin-top: 15px;\n	height: 2.5em;\n}\n\nfieldset.quickmod {\n	width: 50%;\n	float: right;\n	text-align: right;\n	height: 2.5em;\n}\n\n/* Submit button fieldset */\nfieldset.submit-buttons {\n	text-align: center;\n	vertical-align: middle;\n	margin: 5px 0;\n}\n\nfieldset.submit-buttons input {\n	vertical-align: middle;\n	padding-top: 3px;\n	padding-bottom: 3px;\n}\n\n/* Posting page styles\n----------------------------------------*/\n\n/* Buttons used in the editor */\n#format-buttons {\n	margin: 15px 0 2px 0;\n}\n\n#format-buttons input, #format-buttons select {\n	vertical-align: middle;\n}\n\n/* Main message box */\n#message-box {\n	width: 80%;\n}\n\n#message-box textarea {\n	font-family: "Trebuchet MS", Verdana, Helvetica, Arial, sans-serif;\n	width: 450px;\n	height: 270px;\n	min-width: 100%;\n	max-width: 100%;\n	font-size: 1.2em;\n	color: #333333;\n}\n\n/* Emoticons panel */\n#smiley-box {\n	width: 18%;\n	float: right;\n}\n\n#smiley-box img {\n	margin: 3px;\n}\n\n/* Input field styles\n---------------------------------------- */\n.inputbox {\n	background-color: #FFFFFF;\n	border: 1px solid #c0c0c0;\n	color: #333333;\n	padding: 2px;\n	cursor: text;\n}\n\n.inputbox:hover {\n	border: 1px solid #eaeaea;\n}\n\n.inputbox:focus {\n	border: 1px solid #eaeaea;\n	color: #4b4b4b;\n}\n\ninput.inputbox	{ width: 85%; }\ninput.medium	{ width: 50%; }\ninput.narrow	{ width: 25%; }\ninput.tiny		{ width: 125px; }\n\ntextarea.inputbox {\n	width: 85%;\n}\n\n.autowidth {\n	width: auto !important;\n}\n\n/* Form button styles\n---------------------------------------- */\ninput.button1, input.button2 {\n	font-size: 1em;\n}\n\na.button1, input.button1, input.button3, a.button2, input.button2 {\n	width: auto !important;\n	padding-top: 1px;\n	padding-bottom: 1px;\n	font-family: "Lucida Grande", Verdana, Helvetica, Arial, sans-serif;\n	color: #000;\n	background: #FAFAFA none repeat-x top left;\n}\n\na.button1, input.button1 {\n	font-weight: bold;\n	border: 1px solid #666666;\n}\n\ninput.button3 {\n	padding: 0;\n	margin: 0;\n	line-height: 5px;\n	height: 12px;\n	background-image: none;\n	font-variant: small-caps;\n}\n\n/* Alternative button */\na.button2, input.button2, input.button3 {\n	border: 1px solid #666666;\n}\n\n/* <a> button in the style of the form buttons */\na.button1, a.button1:link, a.button1:visited, a.button1:active, a.button2, a.button2:link, a.button2:visited, a.button2:active {\n	text-decoration: none;\n	color: #000000;\n	padding: 2px 8px;\n	line-height: 250%;\n	vertical-align: text-bottom;\n	background-position: 0 1px;\n}\n\n/* Hover states */\na.button1:hover, input.button1:hover, a.button2:hover, input.button2:hover, input.button3:hover {\n	border: 1px solid #BCBCBC;\n	background-position: 0 100%;\n	color: #BCBCBC;\n}\n\ninput.disabled {\n	font-weight: normal;\n	color: #666666;\n}\n\n/* Topic and forum Search */\n.search-box {\n	margin-top: 3px;\n	margin-left: 5px;\n	float: left;\n}\n\n.search-box input {\n}\n\ninput.search {\n	background-image: none;\n	background-repeat: no-repeat;\n	background-position: left 1px;\n	padding-left: 17px;\n}\n\n.full { width: 95%; }\n.medium { width: 50%;}\n.narrow { width: 25%;}\n.tiny { width: 10%;}\n/* Style Sheet Tweaks\n\nThese style definitions are mainly IE specific \ntweaks required due to its poor CSS support.\n-------------------------------------------------*/\n\n* html table, * html select, * html input { font-size: 100%; }\n* html hr { margin: 0; }\n* html span.corners-top, * html span.corners-bottom { background-image: url("{T_THEME_PATH}/images/corners_left.gif"); }\n* html span.corners-top span, * html span.corners-bottom span { background-image: url("{T_THEME_PATH}/images/corners_right.gif"); }\n\ntable.table1 {\n	width: 99%;		/* IE < 6 browsers */\n	/* Tantek hack */\n	voice-family: "\\"}\\"";\n	voice-family: inherit;\n	width: 100%;\n}\nhtml>body table.table1 { width: 100%; }	/* Reset 100% for opera */\n\n* html ul.topiclist li { position: relative; }\n* html .postbody h3 img { vertical-align: middle; }\n\n/* Form styles */\nhtml>body dd label input { vertical-align: text-bottom; }	/* Align checkboxes/radio buttons nicely */\n\n* html input.button1, * html input.button2 {\n	padding-bottom: 0;\n	margin-bottom: 1px;\n}\n\n/* Misc layout styles */\n* html .column1, * html .column2 { width: 45%; }\n\n/* Nice method for clearing floated blocks without having to insert any extra markup (like spacer above)\n   From http://www.positioniseverything.net/easyclearing.html \n#tabs:after, #minitabs:after, .post:after, .navbar:after, fieldset dl:after, ul.topiclist dl:after, ul.linklist:after, dl.polls:after {\n	content: "."; \n	display: block; \n	height: 0; \n	clear: both; \n	visibility: hidden;\n}*/\n\n.clearfix, #tabs, #minitabs, fieldset dl, ul.topiclist dl, dl.polls {\n	height: 1%;\n	overflow: hidden;\n}\n\n/* viewtopic fix */\n* html .post {\n	height: 25%;\n	overflow: hidden;\n}\n\n/* navbar fix */\n* html .clearfix, * html .navbar, ul.linklist {\n	height: 4%;\n	overflow: hidden;\n}\n\n/* Simple fix so forum and topic lists always have a min-height set, even in IE6\n	From http://www.dustindiaz.com/min-height-fast-hack */\ndl.icon {\n	min-height: 35px;\n	height: auto !important;\n	height: 35px;\n}\n\n* html li.row dl.icon dt {\n	height: 35px;\n	overflow: visible;\n}\n\n* html #search-box {\n	width: 25%;\n}\n\n/* Correctly clear floating for details on profile view */\n*:first-child+html dl.details dd {\n	margin-left: 30%;\n	float: none;\n}\n\n* html dl.details dd {\n	margin-left: 30%;\n	float: none;\n}\n\n/* Headerbar height fix for IE7 and below */\n* html #site-description p {\n	margin-bottom: 1.0em;\n}\n\n*:first-child+html #site-description p {\n	margin-bottom: 1.0em;\n}\n\n/* #minitabs fix for IE */\n.tabs-container {\n	zoom: 1;\n}\n\n#minitabs {\n	white-space: nowrap;\n	*min-width: 50%;\n}\n/*  	\n--------------------------------------------------------------\nColours and backgrounds for common.css\n-------------------------------------------------------------- */\n\nhtml, body {\n	color: #536482;\n	background-color: #FFFFFF;\n}\n\nh1 {\n	color: #FFFFFF;\n}\n\nh2 {\n	color: #28313F;\n}\n\nh3 {\n	border-bottom-color: #CCCCCC;\n	color: #115098;\n}\n\nhr {\n	border-color: #FFFFFF;\n	border-top-color: #CCCCCC;\n}\n\nhr.dashed {\n	border-top-color: #CCCCCC;\n}\n\n/* Search box\n--------------------------------------------- */\n\n#search-box {\n	color: #FFFFFF;\n}\n\n#search-box #keywords {\n	background-color: #FFF;\n}\n\n#search-box input {\n	border-color: #0075B0;\n}\n\n/* Round cornered boxes and backgrounds\n---------------------------------------- */\n.headerbar {\n	background-color: #12A3EB;\n	background-image: url("{T_THEME_PATH}/images/bg_header.gif");\n	color: #FFFFFF;\n}\n\n.navbar {\n	background-color: #cadceb;\n}\n\n.forabg {\n	background-color: #0076b1;\n	background-image: url("{T_THEME_PATH}/images/bg_list.gif");\n}\n\n.forumbg {\n	background-color: #12A3EB;\n	background-image: url("{T_THEME_PATH}/images/bg_header.gif");\n}\n\n.panel {\n	background-color: #ECF1F3;\n	color: #28313F;\n}\n\n.post:target .content {\n	color: #000000;\n}\n\n.post:target h3 a {\n	color: #000000;\n}\n\n.bg1	{ background-color: #ECF3F7; }\n.bg2	{ background-color: #e1ebf2;  }\n.bg3	{ background-color: #cadceb; }\n\n.ucprowbg {\n	background-color: #DCDEE2;\n}\n\n.fieldsbg {\n	background-color: #E7E8EA;\n}\n\nspan.corners-top {\n	background-image: url("{T_THEME_PATH}/images/corners_left.png");\n}\n\nspan.corners-top span {\n	background-image: url("{T_THEME_PATH}/images/corners_right.png");\n}\n\nspan.corners-bottom {\n	background-image: url("{T_THEME_PATH}/images/corners_left.png");\n}\n\nspan.corners-bottom span {\n	background-image: url("{T_THEME_PATH}/images/corners_right.png");\n}\n\n/* Horizontal lists\n----------------------------------------*/\n\nul.navlinks {\n	border-bottom-color: #FFFFFF;\n}\n\n/* Table styles\n----------------------------------------*/\ntable.table1 thead th {\n	color: #FFFFFF;\n}\n\ntable.table1 tbody tr {\n	border-color: #BFC1CF;\n}\n\ntable.table1 tbody tr:hover, table.table1 tbody tr.hover {\n	background-color: #CFE1F6;\n	color: #000;\n}\n\ntable.table1 td {\n	color: #536482;\n}\n\ntable.table1 tbody td {\n	border-top-color: #FAFAFA;\n}\n\ntable.table1 tbody th {\n	border-bottom-color: #000000;\n	color: #333333;\n	background-color: #FFFFFF;\n}\n\ntable.info tbody th {\n	color: #000000;\n}\n\n/* Misc layout styles\n---------------------------------------- */\ndl.details dt {\n	color: #000000;\n}\n\ndl.details dd {\n	color: #536482;\n}\n\n.sep {\n	color: #1198D9;\n}\n\n/* Pagination\n---------------------------------------- */\n\n.pagination span strong {\n	color: #FFFFFF;\n	background-color: #4692BF;\n	border-color: #4692BF;\n}\n\n.pagination span a, .pagination span a:link, .pagination span a:visited {\n	color: #5C758C;\n	background-color: #ECEDEE;\n	border-color: #B4BAC0;\n}\n\n.pagination span a:hover {\n	border-color: #368AD2;\n	background-color: #368AD2;\n	color: #FFF;\n}\n\n.pagination span a:active {\n	color: #5C758C;\n	background-color: #ECEDEE;\n	border-color: #B4BAC0;\n}\n\n/* Pagination in viewforum for multipage topics */\n.row .pagination {\n	background-image: url("{T_THEME_PATH}/images/icon_pages.gif");\n}\n\n.row .pagination span a, li.pagination span a {\n	background-color: #FFFFFF;\n}\n\n.row .pagination span a:hover, li.pagination span a:hover {\n	background-color: #368AD2;\n}\n\n/* Miscellaneous styles\n---------------------------------------- */\n\n.copyright {\n	color: #555555;\n}\n\n.error {\n	color: #BC2A4D;\n}\n\n.reported {\n	background-color: #F7ECEF;\n}\n\nli.reported:hover {\n	background-color: #ECD5D8 !important;\n}\n.sticky, .announce {\n	/* you can add a background for stickies and announcements*/\n}\n\ndiv.rules {\n	background-color: #ECD5D8;\n	color: #BC2A4D;\n}\n\np.rules {\n	background-color: #ECD5D8;\n	background-image: none;\n}\n\n/*  	\n--------------------------------------------------------------\nColours and backgrounds for links.css\n-------------------------------------------------------------- */\n\na:link	{ color: #105289; }\na:visited	{ color: #105289; }\na:hover	{ color: #D31141; }\na:active	{ color: #368AD2; }\n\n/* Links on gradient backgrounds */\n#search-box a:link, .navbg a:link, .forumbg .header a:link, .forabg .header a:link, th a:link {\n	color: #FFFFFF;\n}\n\n#search-box a:visited, .navbg a:visited, .forumbg .header a:visited, .forabg .header a:visited, th a:visited {\n	color: #FFFFFF;\n}\n\n#search-box a:hover, .navbg a:hover, .forumbg .header a:hover, .forabg .header a:hover, th a:hover {\n	color: #A8D8FF;\n}\n\n#search-box a:active, .navbg a:active, .forumbg .header a:active, .forabg .header a:active, th a:active {\n	color: #C8E6FF;\n}\n\n/* Links for forum/topic lists */\na.forumtitle {\n	color: #105289;\n}\n\n/* a.forumtitle:visited { color: #105289; } */\n\na.forumtitle:hover {\n	color: #BC2A4D;\n}\n\na.forumtitle:active {\n	color: #105289;\n}\n\na.topictitle {\n	color: #105289;\n}\n\n/* a.topictitle:visited { color: #368AD2; } */\n\na.topictitle:hover {\n	color: #BC2A4D;\n}\n\na.topictitle:active {\n	color: #105289;\n}\n\n/* Post body links */\n.postlink {\n	color: #368AD2;\n	border-bottom-color: #368AD2;\n}\n\n.postlink:visited {\n	color: #5D8FBD;\n	border-bottom-color: #5D8FBD;\n}\n\n.postlink:active {\n	color: #368AD2;\n}\n\n.postlink:hover {\n	background-color: #D0E4F6;\n	color: #0D4473;\n}\n\n.signature a, .signature a:visited, .signature a:hover, .signature a:active {\n	background-color: transparent;\n}\n\n/* Profile links */\n.postprofile a:link, .postprofile a:visited, .postprofile dt.author a {\n	color: #105289;\n}\n\n.postprofile a:hover, .postprofile dt.author a:hover {\n	color: #D31141;\n}\n\n.postprofile a:active {\n	color: #105289;\n}\n\n/* Profile searchresults */	\n.search .postprofile a {\n	color: #105289;\n}\n\n.search .postprofile a:hover {\n	color: #D31141;\n}\n\n/* Back to top of page */\na.top {\n	background-image: url("{IMG_ICON_BACK_TOP_SRC}");\n}\n\na.top2 {\n	background-image: url("{IMG_ICON_BACK_TOP_SRC}");\n}\n\n/* Arrow links  */\na.up		{ background-image: url("{T_THEME_PATH}/images/arrow_up.gif") }\na.down		{ background-image: url("{T_THEME_PATH}/images/arrow_down.gif") }\na.left		{ background-image: url("{T_THEME_PATH}/images/arrow_left.gif") }\na.right		{ background-image: url("{T_THEME_PATH}/images/arrow_right.gif") }\n\na.up:hover {\n	background-color: transparent;\n}\n\na.left:hover {\n	color: #368AD2;\n}\n\na.right:hover {\n	color: #368AD2;\n}\n\n\n/*  	\n--------------------------------------------------------------\nColours and backgrounds for content.css\n-------------------------------------------------------------- */\n\nul.forums {\n	background-color: #eef5f9;\n	background-image: url("{T_THEME_PATH}/images/gradient.gif");\n}\n\nul.topiclist li {\n	color: #4C5D77;\n}\n\nul.topiclist dd {\n	border-left-color: #FFFFFF;\n}\n\n.rtl ul.topiclist dd {\n	border-right-color: #fff;\n	border-left-color: transparent;\n}\n\nul.topiclist li.row dt a.subforum.read {\n	background-image: url("{IMG_SUBFORUM_READ_SRC}");\n}\n\nul.topiclist li.row dt a.subforum.unread {\n	background-image: url("{IMG_SUBFORUM_UNREAD_SRC}");\n}\n\nli.row {\n	border-top-color:  #FFFFFF;\n	border-bottom-color: #00608F;\n}\n\nli.row strong {\n	color: #000000;\n}\n\nli.row:hover {\n	background-color: #F6F4D0;\n}\n\nli.row:hover dd {\n	border-left-color: #CCCCCC;\n}\n\n.rtl li.row:hover dd {\n	border-right-color: #CCCCCC;\n	border-left-color: transparent;\n}\n\nli.header dt, li.header dd {\n	color: #FFFFFF;\n}\n\n/* Forum list column styles */\nul.topiclist dd.searchextra {\n	color: #333333;\n}\n\n/* Post body styles\n----------------------------------------*/\n.postbody {\n	color: #333333;\n}\n\n/* Content container styles\n----------------------------------------*/\n.content {\n	color: #333333;\n}\n\n.content h2, .panel h2 {\n	color: #115098;\n	border-bottom-color:  #CCCCCC;\n}\n\ndl.faq dt {\n	color: #333333;\n}\n\n.posthilit {\n	background-color: #F3BFCC;\n	color: #BC2A4D;\n}\n\n/* Post signature */\n.signature {\n	border-top-color: #CCCCCC;\n}\n\n/* Post noticies */\n.notice {\n	border-top-color:  #CCCCCC;\n}\n\n/* BB Code styles\n----------------------------------------*/\n/* Quote block */\nblockquote {\n	background-color: #EBEADD;\n	background-image: url("{T_THEME_PATH}/images/quote.gif");\n	border-color:#DBDBCE;\n}\n\n.rtl blockquote {\n	background-image: url("{T_THEME_PATH}/images/quote_rtl.gif");\n}\n\nblockquote blockquote {\n	/* Nested quotes */\n	background-color:#EFEED9;\n}\n\nblockquote blockquote blockquote {\n	/* Nested quotes */\n	background-color: #EBEADD;\n}\n\n/* Code block */\ndl.codebox {\n	background-color: #FFFFFF;\n	border-color: #C9D2D8;\n}\n\ndl.codebox dt {\n	border-bottom-color:  #CCCCCC;\n}\n\ndl.codebox code {\n	color: #2E8B57;\n}\n\n.syntaxbg		{ color: #FFFFFF; }\n.syntaxcomment	{ color: #FF8000; }\n.syntaxdefault	{ color: #0000BB; }\n.syntaxhtml		{ color: #000000; }\n.syntaxkeyword	{ color: #007700; }\n.syntaxstring	{ color: #DD0000; }\n\n/* Attachments\n----------------------------------------*/\n.attachbox {\n	background-color: #FFFFFF;\n	border-color:  #C9D2D8;\n}\n\n.pm-message .attachbox {\n	background-color: #F2F3F3;\n}\n\n.attachbox dd {\n	border-top-color: #C9D2D8;\n}\n\n.attachbox p {\n	color: #666666;\n}\n\n.attachbox p.stats {\n	color: #666666;\n}\n\n.attach-image img {\n	border-color: #999999;\n}\n\n/* Inline image thumbnails */\n\ndl.file dd {\n	color: #666666;\n}\n\ndl.thumbnail img {\n	border-color: #666666;\n	background-color: #FFFFFF;\n}\n\ndl.thumbnail dd {\n	color: #666666;\n}\n\ndl.thumbnail dt a:hover {\n	background-color: #EEEEEE;\n}\n\ndl.thumbnail dt a:hover img {\n	border-color: #368AD2;\n}\n\n/* Post poll styles\n----------------------------------------*/\n\nfieldset.polls dl {\n	border-top-color: #DCDEE2;\n	color: #666666;\n}\n\nfieldset.polls dl.voted {\n	color: #000000;\n}\n\nfieldset.polls dd div {\n	color: #FFFFFF;\n}\n\n.rtl .pollbar1, .rtl .pollbar2, .rtl .pollbar3, .rtl .pollbar4, .rtl .pollbar5 {\n	border-right-color: transparent;\n}\n\n.pollbar1 {\n	background-color: #AA2346;\n	border-bottom-color: #74162C;\n	border-right-color: #74162C;\n}\n\n.rtl .pollbar1 {\n	border-left-color: #74162C;\n}\n\n.pollbar2 {\n	background-color: #BE1E4A;\n	border-bottom-color: #8C1C38;\n	border-right-color: #8C1C38;\n}\n\n.rtl .pollbar2 {\n	border-left-color: #8C1C38;\n}\n\n.pollbar3 {\n	background-color: #D11A4E;\n	border-bottom-color: #AA2346;\n	border-right-color: #AA2346;\n}\n\n.rtl .pollbar3 {\n	border-left-color: #AA2346;\n}\n\n.pollbar4 {\n	background-color: #E41653;\n	border-bottom-color: #BE1E4A;\n	border-right-color: #BE1E4A;\n}\n\n.rtl .pollbar4 {\n	border-left-color: #BE1E4A;\n}\n\n.pollbar5 {\n	background-color: #F81157;\n	border-bottom-color: #D11A4E;\n	border-right-color: #D11A4E;\n}\n\n.rtl .pollbar5 {\n	border-left-color: #D11A4E;\n}\n\n/* Poster profile block\n----------------------------------------*/\n.postprofile {\n	color: #666666;\n	border-left-color: #FFFFFF;\n}\n\n.rtl .postprofile {\n	border-right-color: #FFFFFF;\n	border-left-color: transparent;\n}\n\n.pm .postprofile {\n	border-left-color: #DDDDDD;\n}\n\n.rtl .pm .postprofile {\n	border-right-color: #DDDDDD;\n	border-left-color: transparent;\n}\n\n.postprofile strong {\n	color: #000000;\n}\n\n.online {\n	background-image: url("{IMG_ICON_USER_ONLINE_SRC}");\n}\n\n/*  	\n--------------------------------------------------------------\nColours and backgrounds for buttons.css\n-------------------------------------------------------------- */\n\n/* Big button images */\n.reply-icon span	{ background-image: url("{IMG_BUTTON_TOPIC_REPLY_SRC}"); }\n.post-icon span		{ background-image: url("{IMG_BUTTON_TOPIC_NEW_SRC}"); }\n.locked-icon span	{ background-image: url("{IMG_BUTTON_TOPIC_LOCKED_SRC}"); }\n.pmreply-icon span	{ background-image: url("{IMG_BUTTON_PM_REPLY_SRC}") ;}\n.newpm-icon span 	{ background-image: url("{IMG_BUTTON_PM_NEW_SRC}") ;}\n.forwardpm-icon span	{ background-image: url("{IMG_BUTTON_PM_FORWARD_SRC}") ;}\n\na.print {\n	background-image: url("{T_THEME_PATH}/images/icon_print.gif");\n}\n\na.sendemail {\n	background-image: url("{T_THEME_PATH}/images/icon_sendemail.gif");\n}\n\na.fontsize {\n	background-image: url("{T_THEME_PATH}/images/icon_fontsize.gif");\n}\n\n/* Icon images\n---------------------------------------- */\n.sitehome						{ background-image: url("{T_THEME_PATH}/images/icon_home.gif"); }\n.icon-faq						{ background-image: url("{T_THEME_PATH}/images/icon_faq.gif"); }\n.icon-members					{ background-image: url("{T_THEME_PATH}/images/icon_members.gif"); }\n.icon-home						{ background-image: url("{T_THEME_PATH}/images/icon_home.gif"); }\n.icon-ucp						{ background-image: url("{T_THEME_PATH}/images/icon_ucp.gif"); }\n.icon-register					{ background-image: url("{T_THEME_PATH}/images/icon_register.gif"); }\n.icon-logout					{ background-image: url("{T_THEME_PATH}/images/icon_logout.gif"); }\n.icon-bookmark					{ background-image: url("{T_THEME_PATH}/images/icon_bookmark.gif"); }\n.icon-bump						{ background-image: url("{T_THEME_PATH}/images/icon_bump.gif"); }\n.icon-subscribe					{ background-image: url("{T_THEME_PATH}/images/icon_subscribe.gif"); }\n.icon-unsubscribe				{ background-image: url("{T_THEME_PATH}/images/icon_unsubscribe.gif"); }\n.icon-pages						{ background-image: url("{T_THEME_PATH}/images/icon_pages.gif"); }\n.icon-search					{ background-image: url("{T_THEME_PATH}/images/icon_search.gif"); }\n\n/* Profile & navigation icons */\n.email-icon, .email-icon a		{ background-image: url("{IMG_ICON_CONTACT_EMAIL_SRC}"); }\n.aim-icon, .aim-icon a			{ background-image: url("{IMG_ICON_CONTACT_AIM_SRC}"); }\n.yahoo-icon, .yahoo-icon a		{ background-image: url("{IMG_ICON_CONTACT_YAHOO_SRC}"); }\n.web-icon, .web-icon a			{ background-image: url("{IMG_ICON_CONTACT_WWW_SRC}"); }\n.msnm-icon, .msnm-icon a			{ background-image: url("{IMG_ICON_CONTACT_MSNM_SRC}"); }\n.icq-icon, .icq-icon a			{ background-image: url("{IMG_ICON_CONTACT_ICQ_SRC}"); }\n.jabber-icon, .jabber-icon a		{ background-image: url("{IMG_ICON_CONTACT_JABBER_SRC}"); }\n.pm-icon, .pm-icon a				{ background-image: url("{IMG_ICON_CONTACT_PM_SRC}"); }\n.quote-icon, .quote-icon a		{ background-image: url("{IMG_ICON_POST_QUOTE_SRC}"); }\n\n/* Moderator icons */\n.report-icon, .report-icon a		{ background-image: url("{IMG_ICON_POST_REPORT_SRC}"); }\n.edit-icon, .edit-icon a			{ background-image: url("{IMG_ICON_POST_EDIT_SRC}"); }\n.delete-icon, .delete-icon a		{ background-image: url("{IMG_ICON_POST_DELETE_SRC}"); }\n.info-icon, .info-icon a			{ background-image: url("{IMG_ICON_POST_INFO_SRC}"); }\n.warn-icon, .warn-icon a			{ background-image: url("{IMG_ICON_USER_WARN_SRC}"); } /* Need updated warn icon */\n\n/*  	\n--------------------------------------------------------------\nColours and backgrounds for cp.css\n-------------------------------------------------------------- */\n\n/* Main CP box\n----------------------------------------*/\n\n#cp-main h3, #cp-main hr, #cp-menu hr {\n	border-color: #A4B3BF;\n}\n\n#cp-main .panel li.row {\n	border-bottom-color: #B5C1CB;\n	border-top-color: #F9F9F9;\n}\n\nul.cplist {\n	border-top-color: #B5C1CB;\n}\n\n#cp-main .panel li.header dd, #cp-main .panel li.header dt {\n	color: #000000;\n}\n\n#cp-main table.table1 thead th {\n	color: #333333;\n	border-bottom-color: #333333;\n}\n\n#cp-main .pm-message {\n	border-color: #DBDEE2;\n	background-color: #FFFFFF;\n}\n\n/* CP tabbed menu\n----------------------------------------*/\n#tabs a {\n	background-image: url("{T_THEME_PATH}/images/bg_tabs1.gif");\n}\n\n#tabs a span {\n	background-image: url("{T_THEME_PATH}/images/bg_tabs2.gif");\n	color: #536482;\n}\n\n#tabs a:hover span {\n	color: #BC2A4D;\n}\n\n#tabs .activetab a {\n	border-bottom-color: #CADCEB;\n}\n\n#tabs .activetab a span {\n	color: #333333;\n}\n\n#tabs .activetab a:hover span {\n	color: #000000;\n}\n\n/* Mini tabbed menu used in MCP\n----------------------------------------*/\n#minitabs li {\n	background-color: #E1EBF2;\n}\n\n#minitabs li.activetab {\n	background-color: #F9F9F9;\n}\n\n#minitabs li.activetab a, #minitabs li.activetab a:hover {\n	color: #333333;\n}\n\n/* UCP navigation menu\n----------------------------------------*/\n\n/* Link styles for the sub-section links */\n#navigation a {\n	color: #333;\n	background-color: #B2C2CF;\n	background-image: url("{T_THEME_PATH}/images/bg_menu.gif");\n}\n\n.rtl #navigation a {\n	background-image: url("{T_THEME_PATH}/images/bg_menu_rtl.gif");\n	background-position: 0 100%;\n}\n\n#navigation a:hover {\n	background-image: none;\n	background-color: #aabac6;\n	color: #BC2A4D;\n}\n\n#navigation #active-subsection a {\n	color: #D31141;\n	background-color: #F9F9F9;\n	background-image: none;\n}\n\n#navigation #active-subsection a:hover {\n	color: #D31141;\n}\n\n/* Preferences pane layout\n----------------------------------------*/\n#cp-main h2 {\n	color: #333333;\n}\n\n#cp-main .panel {\n	background-color: #F9F9F9;\n}\n\n#cp-main .pm {\n	background-color: #FFFFFF;\n}\n\n#cp-main span.corners-top, #cp-menu span.corners-top {\n	background-image: url("{T_THEME_PATH}/images/corners_left2.gif");\n}\n\n#cp-main span.corners-top span, #cp-menu span.corners-top span {\n	background-image: url("{T_THEME_PATH}/images/corners_right2.gif");\n}\n\n#cp-main span.corners-bottom, #cp-menu span.corners-bottom {\n	background-image: url("{T_THEME_PATH}/images/corners_left2.gif");\n}\n\n#cp-main span.corners-bottom span, #cp-menu span.corners-bottom span {\n	background-image: url("{T_THEME_PATH}/images/corners_right2.gif");\n}\n\n/* Topicreview */\n#cp-main .panel #topicreview span.corners-top, #cp-menu .panel #topicreview span.corners-top {\n	background-image: url("{T_THEME_PATH}/images/corners_left.gif");\n}\n\n#cp-main .panel #topicreview span.corners-top span, #cp-menu .panel #topicreview span.corners-top span {\n	background-image: url("{T_THEME_PATH}/images/corners_right.gif");\n}\n\n#cp-main .panel #topicreview span.corners-bottom, #cp-menu .panel #topicreview span.corners-bottom {\n	background-image: url("{T_THEME_PATH}/images/corners_left.gif");\n}\n\n#cp-main .panel #topicreview span.corners-bottom span, #cp-menu .panel #topicreview span.corners-bottom span {\n	background-image: url("{T_THEME_PATH}/images/corners_right.gif");\n}\n\n/* Friends list */\n.cp-mini {\n	background-color: #eef5f9;\n}\n\ndl.mini dt {\n	color: #425067;\n}\n\n/* PM Styles\n----------------------------------------*/\n/* PM Message history */\n.current {\n	color: #000000 !important;\n}\n\n/* PM marking colours */\n.pmlist li.pm_message_reported_colour, .pm_message_reported_colour {\n	border-left-color: #BC2A4D;\n	border-right-color: #BC2A4D;\n}\n\n.pmlist li.pm_marked_colour, .pm_marked_colour {\n	border-color: #FF6600;\n}\n\n.pmlist li.pm_replied_colour, .pm_replied_colour {\n	border-color: #A9B8C2;\n}\n\n.pmlist li.pm_friend_colour, .pm_friend_colour {\n	border-color: #5D8FBD;\n}\n\n.pmlist li.pm_foe_colour, .pm_foe_colour {\n	border-color: #000000;\n}\n\n/* Avatar gallery */\n#gallery label {\n	background-color: #FFFFFF;\n	border-color: #CCC;\n}\n\n#gallery label:hover {\n	background-color: #EEE;\n}\n\n/*  	\n--------------------------------------------------------------\nColours and backgrounds for forms.css\n-------------------------------------------------------------- */\n\n/* General form styles\n----------------------------------------*/\nselect {\n	border-color: #666666;\n	background-color: #FAFAFA;\n	color: #000;\n}\n\nlabel {\n	color: #425067;\n}\n\noption.disabled-option {\n	color: graytext;\n}\n\n/* Definition list layout for forms\n---------------------------------------- */\ndd label {\n	color: #333;\n}\n\n/* Hover effects */\nfieldset dl:hover dt label {\n	color: #000000;\n}\n\nfieldset.fields2 dl:hover dt label {\n	color: inherit;\n}\n\n/* Quick-login on index page */\nfieldset.quick-login input.inputbox {\n	background-color: #F2F3F3;\n}\n\n/* Posting page styles\n----------------------------------------*/\n\n#message-box textarea {\n	color: #333333;\n}\n\n/* Input field styles\n---------------------------------------- */\n.inputbox {\n	background-color: #FFFFFF; \n	border-color: #B4BAC0;\n	color: #333333;\n}\n\n.inputbox:hover {\n	border-color: #11A3EA;\n}\n\n.inputbox:focus {\n	border-color: #11A3EA;\n	color: #0F4987;\n}\n\n/* Form button styles\n---------------------------------------- */\n\na.button1, input.button1, input.button3, a.button2, input.button2 {\n	color: #000;\n	background-color: #FAFAFA;\n	background-image: url("{T_THEME_PATH}/images/bg_button.gif");\n}\n\na.button1, input.button1 {\n	border-color: #666666;\n}\n\ninput.button3 {\n	background-image: none;\n}\n\n/* Alternative button */\na.button2, input.button2, input.button3 {\n	border-color: #666666;\n}\n\n/* <a> button in the style of the form buttons */\na.button1, a.button1:link, a.button1:visited, a.button1:active, a.button2, a.button2:link, a.button2:visited, a.button2:active {\n	color: #000000;\n}\n\n/* Hover states */\na.button1:hover, input.button1:hover, a.button2:hover, input.button2:hover, input.button3:hover {\n	border-color: #BC2A4D;\n	color: #BC2A4D;\n}\n\ninput.search {\n	background-image: url("{T_THEME_PATH}/images/icon_textbox_search.gif");\n}\n\ninput.disabled {\n	color: #666666;\n}\n');
INSERT INTO `phpbb_styles_theme` (`theme_id`, `theme_name`, `theme_copyright`, `theme_path`, `theme_storedb`, `theme_mtime`, `theme_data`) VALUES
(2, 'subsilver2', '&copy; phpBB Group, 2003', 'subsilver2', 0, 1345476754, '');
INSERT INTO `phpbb_styles_theme` (`theme_id`, `theme_name`, `theme_copyright`, `theme_path`, `theme_storedb`, `theme_mtime`, `theme_data`) VALUES
(3, 'Artodia: Helion', '© Artodia.com', 'art_helion', 1, 1355003369, '/*  phpBB3 Style Sheet\n	--------------------------------------------------------------\n	Style name:			Artodia: Helion\n	Based on style:		prosilver (the default phpBB 3.0.x style)\n	Original author:	Tom Beddard ( http://www.subblue.com/ )\n	Modified by:		Vjacheslav Trushkin ( http://www.artodia.com/ )\n	--------------------------------------------------------------\n*/\n/*\n	Global CSS definitions, overall layout\n*/\n\n\n/*\n	CSS Reset\n*/\nhtml, body.phpbb, .phpbb div, .phpbb span, .phpbb applet, .phpbb object, .phpbb iframe, .phpbb\nh1, .phpbb h2, .phpbb h3, .phpbb h4, .phpbb h5, .phpbb h6, .phpbb p, .phpbb blockquote, .phpbb pre, .phpbb\na, .phpbb abbr, .phpbb acronym, .phpbb address, .phpbb big, .phpbb cite, .phpbb code, .phpbb\ndel, .phpbb dfn, .phpbb em, .phpbb img, .phpbb ins, .phpbb kbd, .phpbb q, .phpbb s, .phpbb samp, .phpbb\nsmall, .phpbb strike, .phpbb strong, .phpbb sub, .phpbb sup, .phpbb tt, .phpbb var, .phpbb\nb, .phpbb u, .phpbb i, .phpbb center, .phpbb\ndl, .phpbb dt, .phpbb dd, .phpbb ol, .phpbb ul, .phpbb li, .phpbb\nfieldset, .phpbb form, .phpbb label, .phpbb legend, .phpbb\ntable, .phpbb caption, .phpbb tbody, .phpbb tfoot, .phpbb thead, .phpbb tr, .phpbb th, .phpbb td, .phpbb\narticle, .phpbb aside, .phpbb canvas, .phpbb details, .phpbb embed, .phpbb \nfigure, .phpbb figcaption, .phpbb footer, .phpbb header, .phpbb hgroup, .phpbb \nmenu, .phpbb nav, .phpbb output, .phpbb ruby, .phpbb section, .phpbb summary, .phpbb\ntime, .phpbb mark, .phpbb audio, .phpbb video, .phpbb meter {\n	margin: 0;\n	padding: 0;\n	border: 0;\n	font-size: 100%;\n	font: inherit;\n	vertical-align: baseline;\n}\n/* HTML5 display-role reset for older browsers */\n.phpbb article, .phpbb aside, .phpbb details, .phpbb figcaption, .phpbb figure, .phpbb \nfooter, .phpbb header, .phpbb hgroup, .phpbb menu, .phpbb nav, .phpbb section {\n	display: block;\n}\nbody.phpbb {\n	line-height: 1em;\n}\n.phpbb ol, .phpbb ul {\n	list-style: none;\n}\n.phpbb blockquote, .phpbb q {\n	quotes: none;\n}\n.phpbb blockquote:before, .phpbb blockquote:after, .phpbb\nq:before, .phpbb q:after {\n	content: '''';\n	content: none;\n}\n.phpbb table {\n	border-collapse: collapse;\n	border-spacing: 0;\n}\n\n/*\n	Font\n*/\nbody.phpbb {\n	font-family: Verdana;\n	font-size: 12px;\n	background-position: 0 0;\n	background-repeat: repeat-x;\n}\nbody.simple {\n	padding: 8px;\n}\n\n/*\n	Common stuff\n*/\n.phpbb .clear, .phpbb span.corners-bottom {\n	display: block;\n	clear: both;\n	height: 0;\n	overflow: hidden;\n}\n.phpbb .right {\n	text-align: right;\n}\n.phpbb .nowrap {\n	white-space: nowrap;\n}\n\n.phpbb p {\n	padding: 6px 0;\n	line-height: 1.5em;\n}\n\n.phpbb .rightside {\n	float: right;\n	text-align: right;\n}\n.phpbb .leftside {\n	float: left;\n	text-align: left;\n}\n.phpbb .left-box {\n	display: block;\n	float: left;\n	margin-right: 5px;\n}\n.phpbb .right-box {\n	display: block;\n	float: right;\n	margin-left: 5px;\n}\n\n.phpbb hr {\n	border-width: 0;\n	border-top: 1px solid transparent;\n	margin-left: 20px;\n	margin-right: 20px;\n}\n\n\n\n/*\n	Header\n*/\n.phpbb .logo {\n	text-align: center;\n	padding: 0 0 4px;\n}\n.phpbb .logo h1 {\n	display: none; /* remove this line to show forum name in header */\n	font-size: 24px;\n	font-weight: normal;\n	padding: 10px;\n}\n\n/*\n	Layout\n*/\n.phpbb .body-wrapper {\n	padding: 0 8px;\n	background: transparent none 0 0 repeat-x;\n}\n.phpbb .forum-wrapper {\n	min-height: 400px;\n	border: 1px solid transparent;\n	border-bottom-width: 0;\n	-webkit-border-top-left-radius: 6px;\n	-webkit-border-top-right-radius: 6px;\n	-moz-border-radius-topleft: 6px;\n	-moz-border-radius-topright: 6px;\n	border-top-left-radius: 6px;\n	border-top-right-radius: 6px;\n}\n.phpbb .layout-outer {\n	padding: 0;\n	border: 1px solid transparent;\n	border-bottom-width: 0;\n	-webkit-border-top-left-radius: 5px;\n	-webkit-border-top-right-radius: 5px;\n	-moz-border-radius-topleft: 5px;\n	-moz-border-radius-topright: 5px;\n	border-top-left-radius: 5px;\n	border-top-right-radius: 5px;\n}\n.phpbb div.layout-wrapper {\n	display: table;\n}\n.phpbb .layout-wrapper {\n	width: 100%;\n}\n.phpbb div.layout-wrapper > div {\n	display: table-cell;\n}\n.phpbb table.layout-wrapper {\n	border-collapse: separate;\n}\n.phpbb .layout-wrapper > div, .phpbb table.layout-wrapper > tbody > tr > td {\n	vertical-align: top;\n	padding: 6px;\n	border: 0px solid transparent;\n	border-width: 0 1px;\n}\n.phpbb .layout-wrapper > div:first-child, .phpbb .layout-wrapper > tbody > tr > td:first-child {\n	border-left-width: 0;\n}\n.phpbb .layout-wrapper > div:last-child, .phpbb .layout-wrapper > tbody > tr > td:last-child {\n	border-right-width: 0 !important;\n}\n.phpbb .layout-left, .phpbb .layout-right {\n	width: 200px;\n	max-width: 200px;\n}\n\n.phpbb .page-content {\n	padding: 8px;\n}\n.phpbb .page-content > h3 {\n	clear: both;\n}\n\n/*\n	Footer\n*/\n.phpbb p.time {\n	margin-bottom: 6px;\n	padding: 0;\n}\n.phpbb p.time.first {\n	float: right;\n	text-align: right;\n}\n.phpbb .footer {\n	padding: 10px 8px 4px;\n	background: transparent none 0 0 repeat-x;\n}\n\n.phpbb .footer .left { \n	float: left; \n	padding: 0;\n}\n.phpbb .footer .copyright { \n	margin: 0;\n	float: right;\n	text-align: right;\n	padding: 0;\n}\n.oldie .phpbb .footer .copyright {\n	float: none;\n}\n.phpbb .footer .arty, .phpbb .footer .phpbb-group {\n	display: block;\n	float: right;\n	width: 0;\n	height: 0;\n	overflow: hidden;\n	margin: 0;\n	padding: 0;\n	padding-top: 28px;\n	padding-left: 60px;\n	background: transparent none 0 0 no-repeat;\n	opacity: 0.5;\n}\n.phpbb .footer .arty { \n	background-position: -60px 0;\n}\n.phpbb .footer .arty:hover, .phpbb .footer .phpbb-group:hover {\n	opacity: 1;\n}\n\n/*\n	Menu\n*/\n.phpbb ul.menu {\n	padding-bottom: 4px;\n	margin: -1px 0 0;\n}\n.phpbb ul.menu-nopadding {\n	padding-bottom: 0;\n}\n.phpbb ul.menu-nopadding + ul.menu {\n	margin-top: 0;\n}\n.phpbb .menu > li {\n	width: 200px;\n}\n.phpbb .menu li.menu-form {\n	padding: 2px;\n	width: 196px;\n}\n.phpbb .menu li.menu-item, .phpbb .menu li.menu-section {\n	display: block;\n	background: transparent none 0 -30px no-repeat;\n	width: 190px;\n	margin: 0 0 2px;\n	padding: 0 0 0 10px;\n}\n\n.phpbb .menu li.menu-item a, .phpbb .menu li.menu-section a, .phpbb .menu li.menu-section p {\n	display: block;\n	background: transparent none 100% 0 no-repeat;\n	text-decoration: none;\n	margin: 0;\n	padding: 7px 10px 0 0;\n	height: 22px;\n	text-align: left;\n	line-height: 1.2em;\n	white-space: nowrap;\n	max-width: 180px;\n	overflow: hidden;\n	text-overflow: ellipsis;\n	outline-style: none;\n}\n.phpbb .menu li.menu-section.expandable a {\n	max-width: 160px;\n	padding-left: 10px;\n	padding-right: 20px;\n}\n.phpbb .menu li.menu-section {\n	background-position: 0 0;\n}\n\n.phpbb .menu li.menu-section a, .phpbb .menu li.menu-section p {\n	font-family: ''Open Sans'', sans-serif;\n	font-size: 13px;\n	background-position: 100% -30px;\n	text-align: center;\n	padding-top: 6px;\n	height: 23px;\n}\n.phpbb .menu li.menu-section a:hover {\n	text-decoration: underline;\n}\n\n.phpbb .menu li.menu-home {\n	background-position: 0 -60px;\n	padding-left: 27px;\n	width: 173px;\n}\n.phpbb .menu li.menu-forum {\n	background-position: 0 -90px;\n	padding-left: 27px;\n	width: 173px;\n}\n.phpbb .menu li.menu-pm {\n	background-position: 0 -120px;\n	padding-left: 28px;\n	width: 172px;\n}\n.phpbb .menu li.menu-ucp {\n	background-position: 0 -150px;\n	padding-left: 29px;\n	width: 171px;\n}\n.phpbb .menu li.menu-down {\n	background-position: 0 -180px;\n	padding-left: 27px;\n	width: 173px;\n}\n.phpbb .menu li.menu-login {\n	background-position: 0 -210px;\n	padding-left: 30px;\n	width: 170px;\n}\n.phpbb .menu li.menu-search {\n	background-position: 0 -240px;\n	padding-left: 30px;\n	width: 170px;\n}\n.phpbb .menu li.menu-users {\n	background-position: 0 -270px;\n	padding-left: 28px;\n	width: 172px;\n}\n.phpbb .menu li.menu-faq {\n	background-position: 0 -300px;\n	padding-left: 25px;\n	width: 175px;\n}\n.phpbb .menu li.menu-link {\n	background-position: 0 -330px;\n	padding-left: 25px;\n	width: 175px;\n}\n\n/*\n	Menu forms, expandable menu sections\n*/\n.phpbb li.menu-form input, .phpbb li.menu-form a {\n	margin-bottom: 6px;\n}\n\n.phpbb .menu li.expandable {\n	position: relative;\n}\n.phpbb .menu li.expandable:after {\n	display: block;\n	position: absolute;\n	content: '''';\n	top: 0;\n	bottom: 4px;\n	right: 8px;\n	z-index: 2;\n	width: 13px;\n	background: transparent none 0 8px no-repeat;\n	opacity: 0.5;\n}\n.phpbb .menu li.expandable:hover:after {\n	opacity: 1;\n}\n.phpbb .menu li.expandable.collapsed:after {\n	background-position: -15px 8px;\n	opacity: 1;\n}\n\n\n/*\n	Navbar\n*/\n.phpbb .navbar, .phpbb .linkmcp {\n	margin: 6px 0;\n	padding: 6px;\n	border: 1px solid transparent;\n	border-radius: 5px;\n	clear: both;\n	background: transparent none 0 50% repeat-x;\n	line-height: 1em;\n}\n.phpbb .panel .navbar, .phpbb .panel .linkmcp {\n	margin: 0;\n	padding: 0;\n	border-width: 0;\n	border-radius: 0;\n}\n.phpbb .panel.navbar .inner {\n	padding: 0;\n}\n.phpbb .panel.navbar .panel-inner {\n	padding: 2px;\n}\n.phpbb .navbar:first-child {\n	margin-top: 0;\n}\n.phpbb .navbar:last-child {\n	margin-bottom: 0;\n}\n.ie7 .phpbb .linkmcp {\n	height: 12px;\n}\n.ie7 .phpbb div.navbar {\n	height: 20px;\n}\n.phpbb .navbar:after, .phpbb .linklist:after, .phpbb .topic-actions:after, .phpbb #tabs ul:after, .phpbb #minitabs ul:after, .phpbb dl.details:after {\n	content: '''';\n	display: block;\n	clear: both;\n}\n.phpbb .navbar .left {\n	float: left;\n}\n.phpbb .navbar .right {\n	float: right;\n}\n.phpbb .navbar a {\n	text-decoration: none;\n}\n.phpbb .navbar a:hover {\n	text-decoration: underline;\n}\n.phpbb .linkmcp {\n	text-align: right;\n}\n\n/*\n	Header login\n*/\n.phpbb .header-login {\n	background: transparent none 0 0 repeat-x;\n	margin: 0 -8px;\n	padding: 6px 0 0;\n	text-align: center;\n	height: 27px;\n	font-size: 15px;\n	font-family: ''Open Sans'', sans-serif;\n	font-weight: 400;\n	line-height: 1em;\n	white-space: nowrap;\n	text-align: center;\n}\n.ie7 .phpbb .header-login {\n	padding-top: 4px;\n	height: 29px;\n}\n.phpbb .header-login > div.popup-trigger {\n	display: inline-block;\n}\n.ie7 .phpbb .header-login > div.popup-trigger {\n	display: inline;\n	z-index: 2;\n	zoom: 1;\n}\n\n.phpbb a.header-menu {\n	display: inline-block;\n	padding: 0 4px;\n	text-decoration: none;\n	text-align: center;\n	min-width: 150px;\n}\n.phpbb a.header-menu:hover {\n	text-decoration: underline;\n}\n\n.phpbb a.header-menu.menu-login { \n	text-align: right;\n}\n.phpbb a.header-menu.menu-register { \n	text-align: left;\n}\n.phpbb a.header-menu.menu-login > span, .phpbb a.header-menu.menu-register > span {\n	padding-left: 20px;\n	background: transparent none 0 2px no-repeat;\n}\n.phpbb a.header-menu.menu-register > span {\n	background-position: 0 -28px;\n}\n\n/*\n	Top links\n*/\n.phpbb .top-links {\n	text-align: center;\n	margin: 6px 0;\n}\n.phpbb .top-links .top-link {\n	display: inline-block;\n	background: transparent none 0 -30px no-repeat;\n	white-space: nowrap;\n	text-decoration: none !important;\n	line-height: 1em;\n	padding: 0;\n	padding-left: 12px;\n	vertical-align: top;\n}\n.phpbb .top-links .popup-trigger .top-link {\n	padding-left: 29px;\n	background-position: 0 -60px;\n}\n.phpbb .top-links .top-link > span {\n	display: inline-block;\n	margin: 0;\n	padding: 8px 12px 0 0;\n	height: 21px;\n	background: transparent none 100% 0 no-repeat;\n}\n.ie7 .phpbb .top-links .popup-trigger {\n	display: inline;\n	margin-right: 4px;\n	z-index: 2;\n}\n/*\n	Page specific code\n*/\n\n/*\n	Header boxes\n*/\n.phpbb .topiclist .header, .phpbb h2.header-outer {\n	clear: both;\n	display: block;\n	margin: 6px 0 0;\n	padding: 0;\n	background: transparent none 0 0 repeat-x;\n	border-radius: 0;\n	border-width: 0;\n	height: 32px;\n	overflow: hidden;\n}\n.phpbb .topiclist .header {\n	background: none 50% 0 no-repeat, transparent none 0 0 no-repeat;\n	position: relative;\n}\n.oldie .phpbb .topiclist .header {\n	background: transparent none 0 0 no-repeat;\n}\n.phpbb h2.header.header-outer {\n	background-position: 50% 0;\n	background-repeat: no-repeat;\n}\n.phpbb .topiclist .header {\n	background-repeat: no-repeat;\n}\n.phpbb .topiclist .header dl, .phpbb h2.header-outer .header-right, .phpbb h2.header-outer .header-left {\n	display: block;\n	background: transparent none 100% 0 no-repeat;\n	padding: 0;\n}\n.phpbb h2.header-outer .header-left {\n	background-position: 0 0;\n}\n\n.phpbb .topiclist .header dd {\n	display: none !important;\n}\n.phpbb .topiclist .header dt, .phpbb h2.header-outer .header-inner {\n	clear: both;\n	display: block;\n	font-size: 15px;\n	font-family: ''Open Sans'', sans-serif;\n	font-weight: 400;\n	line-height: 1em;\n	white-space: nowrap;\n	text-align: center;\n	height: 26px !important;\n	margin: 0 10px;\n	padding: 6px 20px 0 !important;\n	overflow: hidden;\n	background: transparent none 0 0 repeat-x;\n}\n\n.phpbb .topiclist .header a, .phpbb h2.header-outer a, .phpbb .post h3 a {\n	text-decoration: none;\n}\n.phpbb .topiclist .header a:hover, .phpbb h2.header-outer a:hover, .phpbb .post h3 a:hover {\n	text-decoration: underline;\n}\n\n.ie7 .phpbb .topiclist .header dt, .ie7 .phpbb h2.header-outer .header-inner {\n	font-family: Arial;\n}\n\n.phpbb .expandable .header:after {\n	display: block;\n	position: absolute;\n	content: '''';\n	top: 0;\n	bottom: 4px;\n	right: 8px;\n	z-index: 2;\n	width: 13px;\n	background: transparent none 0 50% no-repeat;\n	opacity: 0.5;\n}\n.phpbb .expandable .header:hover:after {\n	opacity: 1;\n}\n.phpbb .expandable .header.inactive:after {\n	background-position: -15px 50%;\n	opacity: 1;\n}\n\n/*\n	Forums list\n*/\n.phpbb .topiclist {\n	clear: both;\n	zoom: 1;\n}\n\n.phpbb .topiclist {\n	display: block;\n}\n.phpbb .topiclist:after, .phpbb .post:after {\n	content: '''';\n	display: block;\n	clear: both;\n}\n\n.phpbb .topiclist > li {\n	margin: 2px 0;\n	padding: 4px 0;\n	border: 1px solid transparent;\n	border-radius: 6px;\n}\n.phpbb .topiclist > li.row-outer {\n	padding: 0;\n}\n\n.phpbb .topiclist dl {\n	display: table;\n	width: 100%;\n}\n.phpbb .topiclist dt, .phpbb .topiclist dd {\n	display: table-cell;\n	vertical-align: middle;\n	line-height: 1.5em;\n	height: 33px;\n	padding: 0 6px;\n}\n.phpbb .topiclist .icon dt {\n	padding-left: 40px;\n	height: 39px;\n}\n\n.phpbb .topiclist dd {\n	border-left: 1px solid transparent;\n	text-align: center;\n	line-height: 1.3em;\n	width: 50px;\n}\n\n.phpbb .topiclist dd.info, .phpbb .topiclist dd.time {\n	min-width: 220px;\n	font-size: 11px;\n	line-height: 1.5em;\n}\n.phpbb .topiclist dd.lastpost, .phpbb .topiclist dd.redirect {\n	min-width: 220px;\n	text-align: left;\n	font-size: 11px;\n	line-height: 1.5em;\n}\n.phpbb .topiclist dd.moderation {\n	width: 40%;\n	text-align: left;\n}\n.phpbb .topiclist dd.empty {\n	display: none;\n}\n\n.phpbb .topiclist .topics dfn, .phpbb .topiclist .posts dfn, .phpbb .topiclist .views dfn {\n	text-transform: lowercase;\n	display: block;\n	font-size: 11px;\n}\n.phpbb span.forum-image {\n	float: left;\n	padding-right: 6px;\n}\n.phpbb dl.icon {\n	background: transparent none 3px 50% no-repeat;\n}\n.phpbb dl.icon dt {\n	background: transparent none 3px 50% no-repeat;\n}\n\n.phpbb a.forumtitle, .phpbb a.topictitle {\n	display: inline-block;\n	font-family: Arial;\n	font-size: 16px;\n	font-weight: normal;\n	text-decoration: none;\n	line-height: 1em;\n}\n.phpbb a.topictitle {\n	padding-top: 1px;\n}\n.phpbb a.forumtitle:hover, .phpbb a.topictitle:hover {\n	text-decoration: underline;\n}\n\n.phpbb p.subforums, .phpbb p.moderators {\n	padding: 2px 0 0;\n}\n.phpbb p.subforums strong, .phpbb p.moderators strong {\n	font-weight: normal;\n}\n\n/*\n	IE7 topics list\n*/\n.ie7 .phpbb .topiclist dl {\n	display: block;\n	height: 1%;\n}\n.ie7 .phpbb .topiclist dl.icon {\n	min-height: 39px;\n}\n.ie7 .phpbb .topiclist dt, .ie7 .phpbb .topiclist dd {\n	display: block;\n	float: left;\n}\n.ie7 .phpbb .topiclist dt {\n	width: 50%;\n	height: 1%;\n}\n.ie7 .phpbb .topiclist .header dt {\n	width: auto;\n	float: none;\n}\n.ie7 .phpbb .topiclist dd {\n	width: 8%;\n}\n.ie7 .phpbb .topiclist dd.lastpost {\n	width: 25%;\n}	 \n\n.ie7 .phpbb .topiclist .header dl.icon, .ie7 .phpbb .topiclist .header dt {\n	min-height: 32px;\n	max-height: 32px;\n	height: 32px !important;\n	padding-top: 0;\n	zoom: 1;\n}\n\n\n/*\n	Small arrows\n*/\n.phpbb a.subforum {\n	padding-left: 14px;\n	background: transparent none 0 50% no-repeat;\n}\n\n/*\n	Content blocks\n*/\n.phpbb h2, .phpbb h3 {\n	margin: 12px 0 4px;\n	font-size: 16px;\n	font-family: Helvetica, Arial;\n	font-weight: 400;\n	line-height: 1.2em;\n}\n\n.ie7 .phpbb .panel, .ue7 .phpbb div.rules {\n	clear: both;\n}\n.phpbb .panel, .phpbb div.rules, .phpbb .cp-mini {\n	margin: 6px 0;\n	padding: 0;\n	border: 1px solid transparent;\n	border-radius: 6px;\n	background: transparent none 0 0 repeat-x;\n}\n.phpbb .pm-panel-message {\n	margin: 0;\n	padding: 0;\n	border-width: 0;\n}\n.phpbb .panel .inner, .phpbb .panel .content {\n	padding: 4px;\n}\n.phpbb .panel-outer .panel-inner {\n	padding: 0;\n}\n.phpbb div.rules .inner {\n	padding: 10px;\n	line-height: 1.5em;\n}\n.phpbb #information.rules .inner {\n	text-align: center;\n	padding: 20px;\n}\n.phpbb .postbody p.rules {\n	padding: 10px;\n	text-align: center;\n	border-radius: 5px;\n}\n\n.phpbb .panel-wrapper, .phpbb .panel-wrapper > .panel-inner {\n	border-width: 0 !important;\n	box-shadow: none !important;\n}\n.phpbb .panel-wrapper .inner-first {\n	padding: 4px 0;\n}\n\n.phpbb .panel h2, .phpbb .panel h3 {\n	margin: 0;\n	padding: 6px 0 0;\n}\n.phpbb .panel h2:first-child, .phpbb .panel h3:first-child,\n.phpbb .panel .corners-top + h2, .phpbb .panel .corners-top + h3 {\n	padding-top: 0;\n}\n.phpbb .panel p {\n	padding: 3px 0;\n}\n.phpbb .panel.stats .inner {\n	background: transparent none 5px 50% no-repeat;\n	padding-left: 40px;\n}\n.phpbb div.rules span+strong {\n	font-family: Helvetica, Arial;\n	font-size: 16px;\n	display: inline-block;\n	padding-bottom: 4px;\n}\n.phpbb .rules {\n	background-position: 50% 0;\n	background-repeat: no-repeat;\n}\n.phpbb .postbody .rules strong {\n	font-weight: normal;\n}\n\n.phpbb #message.panel .panel-inner, .phpbb #confirm .panel .panel-inner {\n	padding: 10px;\n	line-height: 1.5em;\n	font-size: 13px;\n}\n\n.phpbb h2.header + div.rules, .phpbb h2.header + .navbar, .phpbb h2.header + .topic-actions {\n	margin-top: 4px;\n}\n\n.phpbb .panel-inner .inner:after {\n	display: block;\n	content: '''';\n	clear: both;\n}\n\n\n/*\n	Tables\n*/\n.phpbb table.table1 {\n	margin: 6px 0;\n	width: 100%;\n	border-collapse: separate;\n	border-spacing: 2px;\n}\n.phpbb table.table1 td, .phpbb table.table1 th {\n	border: 1px solid transparent;\n	border-radius: 5px;\n	padding: 4px;\n	vertical-align: middle;\n}\n.phpbb table.table1 th {\n	background: transparent none 0 0 repeat-x;\n}\n.phpbb td.posts, .phpbb td.info {\n	text-align: center;\n}\n\n/*\n	Arrows\n*/\n.phpbb a.left, .phpbb a.right, .phpbb a.up, .phpbb a.down {\n	background: none transparent 0 50% no-repeat;\n	padding-left: 10px;\n	text-decoration: none;\n	line-height: 1em;\n	font-size: 12px;\n	font-family: Arial;\n	transition: background-position 0.25s ease;\n	-moz-transition: background-position 0.25s ease;\n	-webkit-transition: background-position 0.25s ease;\n	-o-transition: background-position 0.25s ease;\n	-ms-transition: background-position 0.25s ease;\n}\n.phpbb a.left:hover, .phpbb a.up:hover, .phpbb a.down:hover {\n	background-position: 2px 50%;\n}\n.phpbb a.right, .phpbb a.right-box.up, .phpbb a.right-box.down {\n	background-position: 100% 50%;\n	padding-left: 0;\n	padding-right: 10px;\n}\n.phpbb a.right:hover, .phpbb a.right-box.up:hover, .phpbb a.right-box.down:hover {\n	background-position: calc(100% - 2px) 50%;\n	background-position: -moz-calc(100% - 2px) 50%;\n}\n.phpbb .submit-buttons a.up {\n	margin-top: 6px;\n}\n\n\n/*\n	Pagination, topic actions, reported/unapproved posts\n*/\n.phpbb .display-options {\n	text-align: center;\n	clear: both;\n}\n.phpbb .display-options a {\n	margin-top: 6px;\n}\n.phpbb .pagination {\n	margin: 0;\n	padding: 0;\n	line-height: 1em;\n}\n.ie7 .phpbb .topic-actions {\n	min-height: 28px;\n}\n.phpbb .topic-actions .pagination {\n	float: right;\n	padding-left: 6px;\n	padding-top: 4px;\n}\n.phpbb .row .pagination {\n	float: right;\n}\n.phpbb .pagination span.page-sep, .phpbb .pagination span.page-dots { display: none; }\n.phpbb .pagination span a, .phpbb .pagination span strong {\n	display: inline-block;\n	margin: 0 1px;\n	text-align: center;\n	min-width: 10px;\n	padding: 2px 3px 3px;\n	border-radius: 5px;\n	text-decoration: none;\n	font-weight: normal;\n	background-position: 0 50%;\n	background-repeat: repeat-x;\n}\n.phpbb .pagination span strong { pointer-events: none; }\n\n.phpbb a.unapproved, .phpbb a.reported {\n	float: right;\n	display: block;\n	margin-top: -2px;\n	padding-left: 6px;\n	opacity: 0.8;\n}\n.phpbb a.unapproved img, .phpbb a.reported img {\n	display: block;\n}\n.phpbb a.unapproved:hover, .phpbb a.reported:hover {\n	opacity: 1;\n}\n.phpbb div.buttons {\n	float: left;\n}\n.phpbb .inner > div.buttons {\n	float: none;\n}\n.phpbb div.buttons > div {\n	margin-right: 5px;\n	float: left;\n}\n.phpbb .topic-actions .search-box {\n	float: left;\n	padding-top: 3px;\n}\n\n.phpbb #jumpbox, .phpbb .jumpbox, .phpbb #jumpbox + form, .phpbb .js-jumpbox {\n	display: block;\n	float: right;\n	text-align: right;\n	clear: right;\n	margin: 4px 0;\n}\n.phpbb .jumpbox-js label {\n	float: left;\n	display: block;\n	padding-top: 11px;\n	padding-right: 4px;\n}\n\n/*\n	Posting form\n*/\n.phpbb #format-buttons {\n	padding: 2px 0;\n}\n.phpbb #smiley-box {\n	float: right;\n	width: 200px;\n}\n.phpbb #message-box {\n	margin-right: 210px;\n}\n.phpbb #qr_editor_div #message-box {\n	margin-right: 0;\n}\n.phpbb #message-box textarea {\n	width: 98%;\n	width: calc(100% - 6px);\n	width: -moz-calc(100% - 6px);\n}\n\n.phpbb p.error, .phpbb dd.error {\n	padding: 6px;\n}\n\n/*\n	Poll\n*/\n.phpbb .polls {\n	margin: 4px 0 0;\n}\n.phpbb .polls dl {\n	display: table;\n	width: 100%;\n	border-top: 1px solid transparent;\n}\n.phpbb .polls dl.votes {\n	border-top-width: 0;\n}\n.phpbb .polls dt, .phpbb .polls dd {\n	display: table-cell;\n	margin: 0;\n	padding: 4px 0 4px 4px;\n}\n.phpbb .polls dt {\n	width: 95%;\n	clear: left;\n	padding-left: 0;\n}\n.phpbb .polls dd {\n	width: 20%;\n}\n.phpbb .polls dd.resultbar {\n	width: 50%;\n	padding-left: 10px;\n	padding-right: 10px;\n}\n\n.ie7 .phpbb .polls dl, .ie7 .phpbb .polls dt, .ie7 .phpbb .polls dd {\n	display: block;\n}\n.ie7 .phpbb .polls dt, .ie7 .phpbb .polls dd {\n	float: left;\n}\n.ie7 .phpbb .polls dt {\n	width: 30%;\n}\n.ie7 .phpbb .polls dd {\n	width: 10%;\n}\n.ie7 .phpbb .polls dd.resultbar {\n	width: 45%;\n}\n\n.phpbb .polls dd.resultbar > div {\n	min-width: 10px;\n	padding: 3px 4px 2px;\n	border: 0px solid transparent;\n	border-radius: 6px;\n	text-align: right;\n	line-height: 1em;\n	font-size: 12px;\n	font-family: Arial;\n	background: transparent none 0 50% repeat-x;\n}\n\n.phpbb .polls dl.votes dt { \n	display: none; \n}\n.phpbb .polls dl.votes dd { \n	text-align: center;\n	width: 100%;\n	padding-top: 0;\n}\n.phpbb .content p.author {\n	color: #808080;\n}\n\n\n/*\n	Posts\n*/\n.phpbb .post+hr.divider {\n	display: none;\n}\n\n.phpbb p.author {\n	font-size: 12px;\n	line-height: 1.5em;\n	padding: 0;\n}\n\n.phpbb .post {\n	margin: 6px 0;\n	clear: both;\n	position: relative;\n}\n.phpbb .post-content-wrap {\n	display: table;\n	width: 100%;\n	max-width: 100%;\n}\n.phpbb .post-content-wrap > span {\n	display: none;\n}\n.phpbb .post-content-wrap > .postbody {\n	display: table-cell;\n	vertical-align: top;\n	width: 100%;\n	padding-bottom: 10px;\n}\n.phpbb .profile + .postbody {\n	border-left: 1px solid transparent;\n	padding-left: 10px;\n	padding-right: 6px;\n}\n.phpbb .post {\n	border: 1px solid transparent;\n	border-radius: 6px;\n	padding: 0;\n	word-wrap: break-word;\n}\n.phpbb .post-content-wrap > .postprofile, .phpbb .post-content-wrap > .profile {\n	display: table-cell;\n	vertical-align: top;\n	min-width: 190px;\n	vertical-align: top;\n	padding-bottom: 10px;\n}\n.phpbb .post .postprofile {\n	padding: 0 4px 4px 0;\n	word-wrap: break-word;\n}\n\n.ie7 .phpbb .post-content-wrap {\n	display: block;\n}\n.ie7 .phpbb .post-content-wrap > .profile {\n	display: block;\n	float: left;\n	width: 190px;\n}\n.ie7 .phpbb .post-content-wrap > .postbody {\n	display: block;\n	margin-left: 200px;\n	clear: none;\n	width: auto;\n}\n.ie7 .phpbb #topicreview .post .postbody, .ie7 .phpbb #preview.post .postbody {\n	margin-left: 0;\n}\n\n.phpbb .post .back2top {\n	display: block;\n	position: absolute;\n	z-index: 2;\n	right: 8px;\n	bottom: 6px;\n}\n.phpbb .post .back2top a {\n	display: inline-block;\n	text-decoration: none;\n	padding-right: 14px;\n	font-size: 11px;\n	white-space: nowrap;\n	background: transparent none 100% 50% no-repeat;\n}\n\n.phpbb .post .content {\n	padding-bottom: 4px;\n	word-wrap: break-word;\n	overflow: hidden;\n}\n\n.phpbb .postprofile dt {\n	text-align: center;\n	font-size: 16px;\n	font-family: Arial;\n	line-height: 1.2em;\n	padding-top: 1px;\n	white-space: nowrap;\n}\n.phpbb .postprofile dt a, .phpbb .postprofile dt a:visited {\n	text-decoration: none;\n}\n.phpbb .postprofile dt a:hover {\n	text-decoration: underline;\n}\n.phpbb .postprofile dt .popup {\n	top: 20px;\n}\n.phpbb .postprofile dt .popup a {\n	min-width: 162px;\n}\n.phpbb .postprofile dd {\n	font-size: 11px;\n	line-height: 1.1em;\n	padding: 4px 6px 0;\n}\n.phpbb .postprofile dd.poster-rank {\n	text-align: center;\n	padding-top: 0;\n	white-space: nowrap;\n}\n.phpbb .poster-avatar {\n	text-align: center;\n	margin: 4px 10px 4px 6px;\n	padding: 4px 0 0;\n}\n.phpbb .poster-avatar.empty span {\n	display: block;\n	min-height: 90px;\n	min-width: 90px;\n	background: transparent none 50% 0 no-repeat;\n	opacity: 0.8;\n	transition: opacity 0.25s ease;\n	-moz-transition: opacity 0.25s ease;\n	-webkit-transition: opacity 0.25s ease;\n	-o-transition: opacity 0.25s ease;\n	-ms-transition: opacity 0.25s ease;\n}\n.phpbb .post:hover .poster-avatar.empty span {\n	opacity: 1;\n}\n\n.phpbb .online .poster-avatar {\n	padding-top: 16px;\n	min-width: 90px;\n	background: transparent none 50% 0 no-repeat;\n}\n\n.phpbb .postbody h3, .phpbb .content h2:first-child {\n	clear: none;\n	margin: 0;\n	padding: 3px 0 1px;\n}\n.phpbb .postbody .author {\n	font-size: 11px;\n	margin: 0 0 6px;\n}\n.phpbb .postbody .author img {\n	margin-right: 2px;\n}\n\n.phpbb .postbody .searchresults {\n	float: right;\n	text-align: right;\n}\n\n/*\n	Post buttons\n*/\n.phpbb .postbody .profile-icons {\n	float: right;\n}\n.phpbb .postbody .profile-icons li {\n	float: left;\n	width: auto !important;\n	background: none !important;\n}\n\n.phpbb .profile-icons a {\n	display: block;\n	float: left;\n	margin: 0 0 0 4px;\n	padding: 0;\n	text-decoration: none !important;\n	width: 21px;\n	height: 21px;\n	overflow: hidden;\n	background: transparent none 0 0 no-repeat;\n	outline-style: none;\n}\n.phpbb .profile-icons a:hover, .phpbb .profile-icons a:active {\n	outline-style: none;\n}\n.phpbb .profile-icons span {\n	display: none;\n}\n\n.phpbb .profile-icons .edit-icon a {\n	width: 58px;\n	background-position: 0 -21px;\n}\n.phpbb .profile-icons .quote-icon a {\n	width: 69px;\n}\n.phpbb .profile-icons .delete-icon a {\n	background-position: 0 -42px;\n}\n.phpbb .profile-icons .info-icon a {\n	background-position: -21px -42px;\n}\n.phpbb .profile-icons .report-icon a {\n	background-position: -42px -42px;\n}\n.phpbb .profile-icons .warn-icon a {\n	background-position: -63px -42px;\n}\n\n/*\n	Other icons\n*/\n.phpbb .profile-icons > li.pm-icon, .phpbb .profile-icons > li.email-icon, .phpbb .profile-icons > li.web-icon, .phpbb .profile-icons > li.msnm-icon, .phpbb .profile-icons > li.icq-icon, .phpbb .profile-icons > li.yahoo-icon, .phpbb .profile-icons > li.aim-icon, .phpbb .profile-icons > li.jabber-icon {\n	display: none;\n}\n\n.phpbb .profile-icons > li.pm-icon a, .phpbb .profile-icons > li.email-icon a, .phpbb .profile-icons > li.web-icon a, .phpbb .profile-icons > li.msnm-icon a, .phpbb .profile-icons > li.icq-icon a, .phpbb .profile-icons > li.yahoo-icon a, .phpbb .profile-icons > li.aim-icon a, .phpbb .profile-icons > li.jabber-icon a {\n	display: inline;\n	width: auto;\n	height: auto;\n	background-color: transparent !important;\n	background-image: none !important;\n	text-decoration: underline !important;\n}\n.phpbb .profile-icons > li.pm-icon span, .phpbb .profile-icons > li.email-icon span, .phpbb .profile-icons > li.web-icon span, .phpbb .profile-icons > li.msnm-icon span, .phpbb .profile-icons > li.icq-icon span, .phpbb .profile-icons > li.yahoo-icon span, .phpbb .profile-icons > li.aim-icon span, .phpbb .profile-icons > li.jabber-icon span {\n	display: inline;\n}\n\n/*\n	Post content\n*/\n.phpbb .postbody .content {\n	font-size: 13px;\n	line-height: 1.5em;\n}\n\n.phpbb .postbody img, .phpbb .postbody .attach-image {\n	max-width: 640px;\n	overflow: auto;\n}\n.phpbb .postbody .attach-image img {\n	max-width: none;\n}\n.phpbb .postbody .rules {\n	border: 1px solid transparent;\n	margin: 5px 20px;\n	padding: 0;\n	font-size: 12px;\n}\n.phpbb .postbody .rules img {\n	vertical-align: top;\n}\n.phpbb .postbody .rules a {\n	display: inline-block;\n	padding-top: 2px;\n	font-weight: bold;\n	text-decoration: none;\n}\n.phpbb .postbody .rules a:hover {\n	text-decoration: underline;\n}\n\n.phpbb .signature {\n	font-size: 12px;\n	border-top: 1px solid transparent;\n	padding-top: 4px;\n	margin-top: 10px;\n	line-height: 1.5em;\n}\n.phpbb .postbody .notice {\n	font-size: 12px;\n	border: 1px solid transparent;\n	margin: 10px 0 0;\n	border-radius: 6px;\n	padding: 4px;\n	line-height: 1.5em;\n}\n.phpbb .postbody .notice:last-child {\n	margin-bottom: 8px;\n}\n\n/*\n	BBCode\n*/\n.phpbb blockquote, .phpbb .attachbox, .phpbb .codebox, .phpbb .inline-attachment {\n	border: 1px solid transparent;\n	margin: 5px 20px;\n	padding: 4px;\n}\n.phpbb blockquote {\n	font-size: 12px;\n}\n.phpbb blockquote cite, .phpbb .attachbox dt, .phpbb .codebox dt {\n	display: block;\n	line-height: 1em;\n	border-bottom: 1px solid transparent;\n	margin-bottom: 4px;\n	padding: 2px 0 6px;\n}\n.phpbb .file dt {\n	border-bottom-width: 0;\n	margin: 0;\n	padding-bottom: 6px;\n}\n.phpbb .codebox dt a {\n	display: block;\n	float: right;\n}\n\n.phpbb .content ul {\n    list-style-type: disc;\n}\n.phpbb .content ol {\n    list-style-type: decimal;\n}\n.phpbb .content li {\n    display: list-item;\n    margin: 0 0 0 20px;\n}\n\n.phpbb .content ul ul, .phpbb .content ol ul {\n    list-style-type: circle;\n}\n\n.phpbb .content ol ol ul, .phpbb .content ol ul ul, .phpbb .content ul ol ul, .phpbb .content ul ul ul {\n    list-style-type: square;\n} \n\n/*\n	Forms\n*/\n.phpbb fieldset {\n	line-height: 1.1em;\n}\n.phpbb fieldset dl {\n	padding: 4px 0;\n	clear: left;\n}\n.ie7 .phpbb fieldset dl {\n	height: 1%;\n}\n.phpbb fieldset dt {\n	float: left;\n	width: 40%;\n}\n.phpbb fieldset.fields1 dt {\n	width: 180px;\n}\n.phpbb fieldset dd {\n	margin-bottom: 3px;\n	margin-left: 41%;\n	vertical-align: top;\n}\n.phpbb fieldset.fields1 dd {\n	margin-left: 185px;\n}\n\n/*\n	Lists\n*/\n.phpbb .linklist li {\n	float: left;\n}\n.phpbb .linklist li.rightside {\n	float: right;\n}\n\n/*\n	Tabs\n*/\n.phpbb #tabs ul, .phpbb #minitabs ul {\n	clear: both;\n	display: block;\n	margin: 10px 6px -6px;\n}\n.ie7 .phpbb #tabs ul, .ie7 .phpbb #minitabs ul {\n	height: 1%;\n}\n.phpbb #tabs ul.main-tabs, .phpbb #tabs.cp-tabs ul {\n	margin-bottom: 0;\n}\n.phpbb #tabs.cp-tabs ul {\n	margin-left: 0;\n}\n.phpbb #tabs ul + ul {\n	margin-top: 2px;\n}\n.phpbb #tabs li, .phpbb #minitabs li {\n	display: block;\n	float: left;\n	margin: 0 1px;\n	padding: 0;\n}\n.phpbb #tabs li a, .phpbb #minitabs li a {\n	display: block;\n	padding: 5px 6px;\n	border: 1px solid transparent;\n	background: transparent none 0 0 repeat-x;\n	border-bottom-width: 0;\n	border-top-left-radius: 6px;\n	border-top-right-radius: 6px;\n	text-decoration: none;\n}\n.phpbb #tabs .main-tabs li a, .phpbb #tabs.cp-tabs li a {\n	border-bottom-width: 1px;\n	border-radius: 6px;\n}\n\n/*\n	Control panel\n*/\n.phpbb .cp-content {\n	clear: both;\n}\n\n.phpbb .cp-mini {\n	float: left;\n	margin: 5px;\n	margin-left: 0;\n	padding: 5px;\n}\n.phpbb dl.mini {\n	max-height: 140px;\n	min-width: 140px;\n	min-height: 60px;\n	overflow: auto;\n}\n.phpbb dl.mini dt {\n	padding-bottom: 3px;\n}\n\n.phpbb #cp-main {\n	clear: both;\n}\n\n.phpbb dl.pmlist dt {\n	width: 40% !important;\n}\n.phpbb dl.pmlist dt textarea {\n	width: 99%;\n	width: calc(100% - 6px);\n	width: -moz-calc(100% - 6px);\n}\n.phpbb dl.pmlist dd {\n	margin-bottom: 2px;\n	margin-left: 41% !important;\n}\n\n.phpbb .pm-legend {\n	border-left: 10px solid transparent;\n	padding: 4px;\n	white-space: nowrap;\n}\n.phpbb .topiclist.pmlist > li > dl {\n	padding-left: 4px;\n	box-sizing: border-box;\n	-moz-box-sizing: border-box;\n	-webkit-box-sizing: border-box;\n}\n.phpbb .topiclist.pmlist > li > dl dt {\n	border-left: 4px solid transparent;\n}\n.phpbb .topiclist.pmlist > li > dl.icon {\n	background-position: 15px 50%;\n}\n.phpbb .topiclist.pmlist > li > dl dt {\n	padding-left: 44px;\n	background-position: 9px 80%;\n}\n\n.phpbb dl.details {\n	line-height: 1.5em;\n}\n.phpbb span.corners-top + dl.details.left-box {\n	width: 100% !important;\n}\n.phpbb dl.details dt {\n	clear: left;\n	float: left;\n	width: 30%;\n	text-align: right;\n}\n.phpbb dl.details dd {\n	float: left;\n	width: 65%;\n	margin: 0 0 5px;\n	padding-left: 5px;\n}\n\n/*\n	Groups\n*/\n.phpbb table.table1 .name {\n	text-align: left;\n}\n.phpbb table.table1 span.rank-img {\n	float: right;\n}\n\n/*\n	FAQ\n*/\n.phpbb dl.faq {\n	padding-top: 6px;\n	line-height: 1.5em;\n}\n.phpbb dl.faq:first-child {\n	padding-top: 0;\n}\n.phpbb dl.faq dt {\n	padding-bottom: 4px;\n	font-size: 13px;\n	line-height: 1.5em;\n	font-weight: bold;\n}\n.phpbb #faqlinks .column1, .phpbb #faqlinks .column2 {\n	float: left;\n	width: 49%;\n}\n\n/*\n	Avatars gallery\n*/\n.phpbb #gallery label {\n	display: block;\n	float: left;\n	margin: 10px;\n	padding: 5px;\n	text-align: center;\n	border: 1px solid transparent;\n}\n\n/*\n	RSS feed\n*/\n.phpbb a.feed-icon-forum {\n	display: block;\n	float: right;\n	width: 0;\n	height: 0;\n	overflow: hidden;\n	margin: 0;\n	padding: 18px 0 0 18px;\n	background: transparent none 0 0 no-repeat;\n}\n.phpbb a.feed-icon-forum:hover {\n	background-position: 0 -20px;\n}\n\n/*\n	Transitions\n*/\n.phpbb .topiclist > li, .phpbb h2.header-outer, .phpbb table.table1 th, \n.phpbb .expandable .header:after, .phpbb .menu li.expandable:after,\n.phpbb .buttons a, .phpbb a.button, .phpbb .buttons a span, .phpbb a.button span,\n.phpbb input[type="submit"], .phpbb .button1, .phpbb .button2,\n.phpbb .pagination span a, .phpbb .pagination span strong,\n.phpbb .menu li.menu-item, .phpbb .menu li.menu-section, .phpbb .top-links .top-link, .phpbb .header-login, .phpbb .footer .arty, .phpbb .footer .phpbb-group,\n.phpbb .profile-icons a {\n    transition: background-color 0.25s ease;\n    -webkit-transition: background-color 0.25s ease;\n    -moz-transition: background-color 0.25s ease;\n    -o-transition: background-color 0.25s ease;\n    -ms-transition: background-color 0.25s ease;\n}\n\n.phpbb .rules {\n    transition: border-color 0.25s ease;\n    -webkit-transition: border-color 0.25s ease;\n    -moz-transition: border-color 0.25s ease;\n    -o-transition: border-color 0.25s ease;\n    -ms-transition: border-color 0.25s ease;\n}\n\n.phpbb .menu li.menu-item a {\n    transition: color 0.25s ease;\n    -webkit-transition: color 0.25s ease;\n    -moz-transition: color 0.25s ease;\n    -o-transition: color 0.25s ease;\n    -ms-transition: color 0.25s ease;\n}\n\n.phpbb .topiclist > li, .phpbb table.table1 th, .phpbb .expandable .header:after, .phpbb .menu li.expandable:after, .phpbb .footer .arty, .phpbb .footer .phpbb-group, .phpbb .header-login {\n	transition-property: background-color, border-color, opacity, color;\n	-webkit-transition-property: background-color, border-color, opacity, color;\n	-moz-transition-property: background-color, border-color, opacity, color;\n	-o-transition-property: background-color, border-color, opacity, color;\n	-ms-transition-property: background-color, border-color, opacity, color;\n}\n\n/*\n	Boxes\n*/\n.phpbb .topiclist > li.row-outer, .phpbb .panel-outer, .phpbb .post-outer {\n	border-width: 0;\n	padding: 0;\n	border-radius: 0;\n	background-position: 50% 0;\n	background-repeat: no-repeat;\n	zoom: 1;\n}\n\n.phpbb .row-inner, .phpbb .panel-inner, .phpbb .post-inner {\n	min-height: 12px;\n}\n\n.phpbb .row-wrap.row-top, .phpbb .row-wrap.row-bottom,\n.phpbb .panel-wrap.row-top, .phpbb .panel-wrap.row-bottom,\n.phpbb .post-wrap.row-top, .phpbb .post-wrap.row-bottom {\n	display: block;\n	height: 5px;\n	position: relative;\n	margin: 0 5px;\n	background: transparent none 0 0 repeat-x;\n	zoom: 1;\n}\n.phpbb .row-wrap.row-top span, .phpbb .row-wrap.row-bottom span,\n.phpbb .panel-wrap.row-top span, .phpbb .panel-wrap.row-bottom span,\n.phpbb .post-wrap.row-top span, .phpbb .post-wrap.row-bottom span {\n	position: absolute;\n	width: 5px;\n	height: 5px;\n	top: 0;\n	bottom: 0;\n	background: transparent none 0 0 no-repeat;\n	zoom: 1;\n}\n.phpbb .row-top span.row-left, .phpbb .row-bottom span.row-left {\n	left: -5px;\n}\n.phpbb .row-top span.row-right, .phpbb .row-bottom span.row-right {\n	right: -5px;\n}\n.phpbb .row-wrap.row-top, .phpbb .row-wrap.row-top span,\n.phpbb .panel-wrap.row-top, .phpbb .panel-wrap.row-top span,\n.phpbb .post-wrap.row-top, .phpbb .post-wrap.row-top span { \n	background-position: 0 -9px; \n}\n\n.phpbb .row-wrap.row-left, .phpbb .panel-wrap.row-left, .phpbb .post-wrap.row-left {\n	padding-left: 5px;\n	background: transparent none 0 0 repeat-y;\n	zoom: 1;\n}\n.phpbb .row-wrap.row-right, .phpbb .panel-wrap.row-right, .phpbb .post-wrap.row-right {\n	padding-right: 5px;\n	background: transparent none 100% 0 repeat-y;\n	zoom: 1;\n}\n\n/*\n	Link to switch to mobile style\n*/\n.mobile-style-switch a {\n	display: inline-block;\n	padding: 5px 10px 6px;\n	border: 1px solid #D8D8D8;\n	border-radius: 5px;\n	background: #F8F8F8;\n	box-shadow: #fff 0 0 0 1px inset;\n}\n\n/*\n	Zoom in image\n*/\nspan.zoom-container {\n	position: relative;\n	display: inline-block;\n	min-height: 34px;\n}\nspan.zoom-image { \n	display: none; \n    transition: opacity 0.25s ease;\n    -webkit-transition: opacity 0.25s ease;\n    -moz-transition: opacity 0.25s ease;\n    -o-transition: opacity 0.25s ease;\n    -ms-transition: opacity 0.25s ease;\n	opacity: 0.7;\n}\nimg.zoom + span.zoom-image {\n	display: block;\n	position: absolute;\n	top: 2px;\n	left: 2px;\n	width: 30px;\n	height: 30px;\n	background: url("{T_THEME_PATH}/images/zoom.png") 0 0 no-repeat;\n	cursor: pointer;\n}\n.zoom-container:hover span.zoom-image { opacity: 1; }\nimg.zoom.zoomed-in + span.zoom-image { \n	background-position: 0 -30px;\n	opacity: 0;\n}\n.zoom-container:hover img.zoom.zoomed-in + span.zoom-image { opacity: 0.7; }\n/*\n	Forms\n*/\n\n.phpbb input[type="text"], .phpbb input[type="password"], .phpbb input[type="email"], .phpbb textarea, .phpbb select, .phpbb input[type="submit"], .phpbb .button1, .phpbb .button2 {\n	margin: 0;\n	padding: 0;\n	font-family: Verdana;\n	font-size: 13px;\n	line-height: 1.2em;\n	outline-style: none;\n	border: 1px solid transparent;\n	background-position: 0 50%;\n}\n.phpbb textarea {\n	line-height: 1.4em;\n}\n.phpbb input[type="text"], .phpbb input[type="password"], .phpbb input[type="email"], .phpbb textarea, .phpbb input[type="submit"], .phpbb .button1, .phpbb .button2 {\n	-webkit-appearance: none;\n}\n\n.phpbb a.button1, .phpbb a.button2 {\n	display: inline-block;\n	text-decoration: none;\n}\n.phpbb .button2 {\n	background-position: 100% 50%;\n}\n\n.phpbb input[type="text"], .phpbb input[type="password"], .phpbb input[type="email"], .phpbb textarea, .phpbb select {\n	padding: 2px;\n}\n.phpbb.browser-mozilla input[type="text"], .phpbb.browser-mozilla input[type="password"], .phpbb.browser-mozilla input[type="email"] {\n	padding: 1px 2px 2px;\n}\n.phpbb input[type="text"]:invalid, .phpbb input[type="password"]:invalid, .phpbb input[type="email"]:invalid, .phpbb textarea:invalid {\n	box-shadow: none;\n}\n\n.phpbb input[type="submit"], .phpbb .button1, .phpbb .button2 {\n	line-height: 1.4em;\n	padding: 2px 8px 3px;\n	cursor: pointer;\n	border-width: 0;\n	border-radius: 5px;\n}\n.ie7 .phpbb input[type="submit"], .ie7 .phpbb .button1, .ie7 .phpbb .button2 {\n	padding-top: 0;\n	padding-bottom: 1px;\n	margin-top: 0;\n}\n\n.phpbb a.button1, .phpbb a.button2 {\n	line-height: 1em;\n	padding: 4px 10px 0;\n	height: 19px;\n}\n.oldie .phpbb a.button1, .oldie .phpbb a.button2 {\n	padding-top: 5px;\n}\n.ie7 .phpbb a.button1, .ie7 .phpbb a.button2 {\n	padding-top: 4px;\n	padding-bottom: 0;\n}\n.ie7 .phpbb .menu a.button1, .ie7 .phpbb .menu a.button2 {\n	position: relative;\n	top: 2px;\n}\n\n.phpbb input[type="checkbox"], .phpbb input[type="radio"] {\n	margin-top: 0;\n	margin-bottom: 0;\n}\n\n.phpbb select {\n	max-width: 250px;\n}\n.ie7 .phpbb select {\n	width: 250px;\n}\n\n.phpbb fieldset.submit-buttons {\n	text-align: center;\n	padding: 4px 0;\n}\n.phpbb #format-buttons .button2 {\n	border-width: 1px;\n	width: auto !important;\n}\n.ie7 .phpbb #format-buttons .button2 {\n	padding: 0;\n}\n\n.phpbb #search_keywords {\n	padding-left: 19px;\n	background-position: 4px 50%;\n	background-repeat: no-repeat;\n}\n\n.phpbb #edit_reason {\n	width: 90%;\n}\n\n/*\n	Big post buttons\n*/\n.phpbb .buttons a, .phpbb a.button {\n	display: inline-block;\n	position: relative;\n	margin: 0;\n	margin-left: 30px;\n	padding: 4px 12px 0 0;\n	vertical-align: top;\n	height: 26px;\n	font-family: Verdana;\n	font-size: 12px;\n	line-height: 20px;\n	text-decoration: none;\n	outline-style: none;\n	background-position: 100% 0;\n	background-repeat: no-repeat;\n	max-width: 400px;\n}\n.phpbb.browser-webkit .buttons a, .phpbb.browser-webkit a.button {\n	padding-top: 5px;\n	height: 25px;\n}\n\n.phpbb .buttons a span, .phpbb a.button span {\n	display: block;\n	position: absolute;\n	top: 0;\n	bottom: 0;\n	left: -30px;\n	width: 30px;\n	background-position: 0 -30px;\n	background-repeat: no-repeat;\n}\n.ie7 .phpbb .topic-actions .buttons, .ie7 .phpbb .panel .buttons, .ie7 .phpbb .popup .buttons {\n	position: relative;\n	left: 30px;\n}\n\n.phpbb .buttons .reply-icon a span, .phpbb .buttons .pmreply-icon a span, .phpbb .buttons .locked-icon a span {\n	background-position: -30px -30px;\n}\n.phpbb .buttons .newpm-icon a span {\n	background-position: -60px -30px;\n}\n.phpbb .buttons .post-icon a span {\n	background-position: -90px -30px;\n}\n.phpbb #qr_showeditor_div a span, .phpbb .jumpbox a.button span {\n	background-position: -120px -30px;\n}\n.phpbb .buttons a.icon-login span {\n	background-position: -150px -30px;\n}\n.phpbb .buttons a.icon-register span, .phpbb .buttons .forwardpm-icon a span {\n	background-position: -180px -30px;\n}\n\n/*\n	Menu forms\n*/\n.phpbb li.menu-form input.inputbox {\n	width: 156px;\n	border-radius: 6px;\n}\n.phpbb li.menu-form input.inputbox.search, .phpbb li.menu-form input.inputbox.login, .phpbb li.menu-form input.inputbox.password {\n	padding-left: 20px;\n	width: 172px;\n	background-position: 4px 45%;\n	background-repeat: no-repeat;\n}\n.phpbb li.menu-form input.inputbox.search {\n	width: 140px;\n}\n.phpbb li.menu-form input.button-icon {\n	width: 0;\n	height: 0;\n	padding: 24px 0 0 26px;\n	overflow: hidden;\n	font-size: 0;\n	float: right;\n	border-width: 0;\n	border-radius: 0;\n	background: transparent none 0 -60px no-repeat;\n}\n.ie7 .phpbb li.menu-form input.button-icon {\n	width: 26px;\n	height: 24px;\n	padding-top: 0;\n}\n.phpbb li.menu-form label {\n	display: block;\n	font-size: 11px;\n	max-width: 200px;\n	white-space: nowrap;\n	overflow: hidden;\n	text-overflow: ellipsis;\n}\n.ie7 .phpbb li.menu-form label {\n	white-space: normal;\n}\n.phpbb li.menu-form .buttons {\n	float: none;\n	text-align: right;\n}\n/*\n	Popups\n*/\n.phpbb .popup-trigger {\n	position: relative;\n}\n.phpbb .top-links .popup-trigger {\n	display: inline-block;\n}\n.phpbb .top-links .popup .popup-trigger {\n	display: block;\n}\n\n.phpbb .popup {\n	display: none;\n	position: absolute;\n	left: 0;\n	top: 27px;\n	z-index: 10;\n	padding: 5px;\n	margin: 0;\n	border: 1px solid transparent;\n	min-width: 150px;\n	white-space: nowrap;\n	text-align: left;\n	font-size: 12px;\n	line-height: 1.5em;\n	font-family: Verdana;\n}\n.phpbb .popup-list {\n	line-height: 1em;\n	padding: 0;\n}\n\n.ie7 .phpbb .popup {\n	top: 24px;\n}\n.phpbb .menu .popup {\n	left: 4px;\n}\n.phpbb .top-links .popup {\n	top: 28px;\n}\n.phpbb .header-login .popup {\n	top: 18px;\n	left: auto;\n	right: 0;\n}\n.ie7 .phpbb .header-login .popup {\n	top: 20px;\n}\n.phpbb .popup-list .popup {\n	top: 0;\n	left: 198px;\n}\n.phpbb .popup-up .popup {\n	top: auto;\n	bottom: 0;\n}\n.phpbb .right .popup {\n	left: auto;\n	right: 0;\n}\n\n.phpbb .popup-trigger:hover > .popup, .phpbb .popup.active {\n	display: block;\n}\n\n.phpbb .popup p {\n	padding: 3px 0;\n	line-height: 1.3em;\n	font-family: Helvetica, Arial;\n	font-size: 13px;\n}\n.phpbb .popup p.title {\n	font-size: 14px;\n	padding: 5px 0;\n	font-family: Verdana;\n}\n.phpbb .popup p.title:first-child, .phpbb .popup p:first-child { \n	padding-top: 0;\n}\n.phpbb .popup p:last-child { \n	padding-bottom: 0;\n}\n\n/*\n	Login form\n*/\n.phpbb #phpbb-header-login dd {\n	text-align: right;\n}\n.phpbb #phpbb-header-login p.right {\n	padding-right: 4px;\n	padding-bottom: 4px;\n}\n\n/*\n	Links\n*/\n.phpbb .popup-list li {\n	padding: 0;\n}\n\n.ie7 .phpbb .popup-list a {\n	width: 100%;\n}\n\n\n.phpbb li.popup-link {\n	border: 1px solid transparent;\n	border-width: 0 1px;\n	padding: 0;\n	background: transparent none 0 0 repeat-x;\n}\n.phpbb li.popup-link:first-child {\n	border-top-width: 1px;\n}\n.phpbb li.poup-link:last-child {\n	border-bottom-width: 1px;\n}\n.phpbb .popup.popup-list li.popup-link:hover, .phpbb .show-levels li.level-root, .phpbb .popup-list li.row-new {\n	background-position: 0 -27px !important;\n}\n\n.phpbb li.popup-link > a, .phpbb li.popup-link > span {\n	display: block;\n	line-height: 1em;\n	padding: 7px 20px 0 8px;\n	height: 20px;\n	text-decoration: none !important;\n	width: 172px;\n	min-width: 172px;\n	overflow: hidden;\n	text-overflow: ellipsis;\n}\n.phpbb li.popup-link.popup-trigger > a {\n	background: transparent none 100% 0 no-repeat;\n}\n.phpbb li.popup-link.popup-trigger:hover > a {\n	background-position: 100% -60px;\n}\n.phpbb li.poup-link:last-child > a, .phpbb li.poup-link:last-child > span {\n	height: 19px;\n}\n\n.phpbb .popup-list > ol {\n	display: table-row;\n}\n.phpbb .popup-list > ol > li {\n	display: table-cell;\n	padding: 0;\n}\n\n/*\n	Definition lists\n*/\n.phpbb .popup dl {\n	clear: both;\n	width: 254px;\n	margin: 0;\n	padding: 4px;\n}\n.phpbb .popup dt {\n	float: left;\n	width: 100px;\n	margin: 0;\n	padding: 3px 0 0;\n}\n.phpbb .popup dd {\n	width: 150px;\n	margin: 0;\n	margin-left: 104px;\n	padding: 0;\n}\n.ie7 .phpbb .popup dd {\n	margin-left: 0;\n}\n.phpbb .popup dd input {\n	width: 140px;\n}\n/*\n	Colours, URLs\n*/\n\n.phpbb h2, .phpbb h3 {\n	color: #1a4f90;\n	text-shadow: 1px 1px 0 rgba(255, 255, 255, 0.2);\n}\n\n.phpbb hr {\n	border-top-color: #d4d4d4;\n}\n\n\n\n/*\n	Links\n*/\n.phpbb a, .phpbb a:visited { \n	color: #1a4f90;\n}\n.phpbb a:hover, .phpbb a:active {\n	color: #bc2a2a;\n}\n\n/*\n	Layout\n*/\nbody.phpbb {\n	background-color: #ffffff;\n	background-image: url("{T_THEME_PATH}/images/layout_top.png");\n}\nbody.simple {\n	background: #f4f4f4;\n}\n\n.phpbb .logo h1 {\n	color: rgba(255, 255, 255, 0.8);\n	text-shadow: 1px 1px 0 rgba(26, 79, 144, 0.7);\n}\n.oldie .phpbb .logo h1 {\n	color: #1a4f90;\n}\n\n.phpbb .body-wrapper {\n	background-image: url("{T_THEME_PATH}/images/top400.png");\n}\n\n.phpbb .layout-outer {\n	background-color: #f4f4f4;\n	border-color: #e0e0e0;\n	box-shadow: 0 0 2px rgba(0, 0, 0, 0.1);\n}\n.phpbb .forum-wrapper {\n	border-color: #fafafa;\n}\n.phpbb .layout-wrapper > div, .phpbb table.layout-wrapper > tbody > tr > td {\n	border-left-color: #fafafa;\n	border-right-color: #e0e0e0;\n}\n\n.phpbb .footer {\n	background-color: #2372bb;\n	background-image: url("{T_THEME_PATH}/images/footer.png");\n}\n.phpbb .footer, .phpbb .footer a, .phpbb .footer a:visited {\n	color: #d3e3f1;\n}\n.phpbb .footer a:hover {\n	color: #fff;\n}\n\n.phpbb .footer .arty, .phpbb .footer .phpbb-group {\n	background-image: url("{T_THEME_PATH}/images/copyrights.png");\n}\n\n.phpbb .header-login {\n	background-image: url("{T_THEME_PATH}/images/headermenu.png");\n	background-color: #2372bb;\n	color: #89b3db;\n}\n.phpbb .header-login:hover {\n	background-color: #b01414;\n	color: #db8a8a;\n}\n.phpbb .header-login .popup {\n	color: #000;\n}\n\n.phpbb a.header-menu.menu-login > span, .phpbb a.header-menu.menu-register > span {\n	background-image: url("{T_THEME_PATH}/images/header_login.png");\n}\n\n/*\n	Boxes\n*/\n.phpbb .topiclist > li.row-outer, .phpbb .panel-outer, .phpbb .post-outer {\n	background-image: url("{T_THEME_PATH}/images/topwhite.png");\n}\n\n.phpbb .row-wrap.row-top, .phpbb .row-wrap.row-bottom,\n.phpbb .panel-wrap.row-top, .phpbb .panel-wrap.row-bottom,\n.phpbb .post-wrap.row-top, .phpbb .post-wrap.row-bottom {\n	background-image: url("{T_THEME_PATH}/images/row_tb.png");\n}\n.phpbb .row-wrap span.row-left, .phpbb .panel-wrap span.row-left, .phpbb .post-wrap span.row-left {\n	background-image: url("{T_THEME_PATH}/images/row_cl.png");\n}\n.phpbb .row-wrap span.row-right, .phpbb .panel-wrap span.row-right, .phpbb .post-wrap span.row-right {\n	background-image: url("{T_THEME_PATH}/images/row_cr.png");\n}\n.phpbb .row-wrap.row-left, .phpbb .panel-wrap.row-left, .phpbb .post-wrap.row-left {\n	background-image: url("{T_THEME_PATH}/images/row_l.png");\n}\n.phpbb .row-wrap.row-right, .phpbb .panel-wrap.row-right, .phpbb .post-wrap.row-right {\n	background-image: url("{T_THEME_PATH}/images/row_r.png");\n}\n\n/*\n	Menu\n*/\n\n.phpbb .time {\n	color: rgba(0, 0, 0, 0.5);\n	text-shadow: 1px 1px 0 rgba(255, 255, 255, 0.5);\n}\n.oldie .phpbb .time {\n	color: #808080;\n}\n\n.phpbb .menu li.menu-item, .phpbb .menu li.menu-section {\n	background-image: url("{T_THEME_PATH}/images/menu_left.png");\n}\n.phpbb .menu li.menu-item a, .phpbb .menu li.menu-section a, .phpbb .menu li.menu-section p,\n.phpbb li.menu-form input.button-icon {\n	background-image: url("{T_THEME_PATH}/images/menu_right.png");\n}\n\n.phpbb .menu li.menu-item {\n	background-color: #ccc;\n}\n.phpbb .menu li.menu-item:hover {\n	background-color: #2372bb;\n}\n.phpbb .menu li.menu-item.active {\n	background-color: #b01414;\n}\n.phpbb .menu li.menu-section, .phpbb li.menu-form input.button-icon {\n	background-color: #2372bb;\n}\n.phpbb .menu li.menu-section:hover, .phpbb li.menu-form input.button-icon:hover {\n	background-color: #b01414;\n}\n\n.phpbb .menu li.menu-item a {\n	color: #1a4f90;\n}\n.phpbb .menu li.menu-item:hover a {\n	color: #2372bb;\n}\n.phpbb .menu li.menu-item.active a {\n	color: #bc2a2a;\n}\n\n.phpbb .menu li.menu-section p, .phpbb .menu li.menu-section a {\n	color: #fff !important;\n	text-shadow: 1px 1px 0 rgba(0, 0, 0, 0.3);\n}\n\n.phpbb li.menu-form input.inputbox.search {\n	background-image: url("{T_THEME_PATH}/images/input_search.png");\n}\n.phpbb li.menu-form input.inputbox.login {\n	background-image: url("{T_THEME_PATH}/images/input_user.png");\n}\n.phpbb li.menu-form input.inputbox.password {\n	background-image: url("{T_THEME_PATH}/images/input_pass.png");\n}\n\n/*\n	Navbar\n*/\n.phpbb .navbar, .phpbb .linkmcp {\n	border-color: #d4d4d4;\n	background-color: #f8f8f8;\n	background-image: url("{T_THEME_PATH}/images/white50.png");\n	color: #aaa;\n}\n\n/*\n	Header menu\n*/\n.phpbb .top-links .top-link, .phpbb .top-links .top-link > span {\n	background-image: url("{T_THEME_PATH}/images/topmenu.png");\n}\n.phpbb .top-links .top-link {\n	background-color: #2372bb;\n	color: #fff !important;\n}\n.phpbb .top-links .top-link:hover, .phpbb .top-links .popup-trigger:hover .top-link {\n	background-color: #b01414;\n}\n\n/*\n	Popups\n*/\n.phpbb .popup {\n	background-color: #f8f8f8;\n	border-color: #e0e0e0;\n	box-shadow: 0 0 3px rgba(0, 0, 0, 0.1);\n	-webkit-box-shadow: 0 0 3px rgba(0, 0, 0, 0.1);\n}\n.phpbb .popup-list {\n	background-color: rgba(248, 248, 248, 0.9);\n}\n.oldie .phpbb .popup-list {\n	background-color: #f8f8f8;\n}\n\n.phpbb .popup.popup-list li.popup-link {\n	border-color: #fbfbfb;\n	border-right-color: #e0e0e0;\n	background-image: url("{T_THEME_PATH}/images/popup_link.png");\n	background-color: #f4f4f4;\n}\n.phpbb .popup-list > ul > li.popup-link, .phpbb li:last-child > ul > li.popup-link {\n	border-right-color: #fbfbfb;\n}\n.phpbb .popup.popup-list li.popup-link:hover {\n	background-color: #f8f8f8;\n}\n.phpbb .popup-link > a {\n	color: #1a4f90;\n}\n\n.phpbb .popup.popup-list li.popup-link:hover, .phpbb .popup.popup-list .show-levels li.level-root {\n	background-color: #2372bb;\n	border-color: #4f8ec9;\n	border-right-color: #1f66a8;\n}\n.phpbb .popup.popup-list .show-levels li.level-root:hover, .phpbb .popup.popup-list ul li.row-new, .phpbb .popup.popup-list ul li.row-new:hover {\n	background-color: #b01414;\n	border-color: #c04343;\n	border-right-color: #9e1212;\n}\n.phpbb .popup-link:hover > a, .phpbb .show-levels li.level-root > a, .phpbb .popup-list li.row-new > a {\n	color: #fff !important;\n}\n\n.phpbb li.popup-link.popup-trigger > a {\n	background-image: url("{T_THEME_PATH}/images/popup_arrows.png");\n}\n\n.phpbb .popup p {\n	color: #808080;\n}\n.phpbb .popup p.title {\n	color: #1a4f90;\n}\n.phpbb .popup p.title:first-child {\n	color: #bc2a2a;\n}\n\n/*\n	Forms\n*/\n.phpbb input[type="text"], .phpbb input[type="password"], .phpbb input[type="email"], .phpbb textarea, .phpbb select {\n	color: #808080;\n	background-color: #fff;\n	border-color: #d4d4d4;\n}\n.phpbb input[type="text"]:hover, .phpbb input[type="password"]:hover, .phpbb input[type="email"]:hover, .phpbb textarea:hover, .phpbb select:hover {\n	color: #000;\n	border-color: #a2b1bc;\n}\n.phpbb input[type="text"]:focus, .phpbb input[type="password"]:focus, .phpbb input[type="email"]:focus, .phpbb textarea:focus, .phpbb select:focus {\n	color: #000;\n	border-color: #d28484;\n}\n.phpbb input[type="text"]:invalid, .phpbb input[type="password"]:invalid, .phpbb input[type="email"]:invalid, .phpbb textarea:invalid {\n	color: #d28484;\n}\n.phpbb input[type="submit"], .phpbb .button1, .phpbb .button2 {\n	color: #fff !important;\n	background-color: #2372bb;\n	background-image: url("{T_THEME_PATH}/images/buttons_bg.png");\n	border-color: #2372bb;\n	text-shadow: 1px 1px 0 rgba(0, 0, 0, 0.25);\n}\n.phpbb input[type="submit"]:hover, .phpbb .button1:hover, .phpbb .button2:hover, .phpbb .top-links a.top-link:hover, .phpbb .top-links .popup-trigger:hover a.top-link {\n	background-color: #b01414;\n	border-color: #b01414;\n}\n.phpbb #search_keywords {\n	background-image: url("{T_THEME_PATH}/images/search.png");\n	color: #a8a8a8;\n}\n.phpbb #search_keywords:hover, .phpbb #search_keywords:focus {\n	color: #000;\n}\n\n.phpbb p.error, .phpbb dd.error {\n	background-color: #b01414;\n}\n.phpbb p.error, .phpbb p.error a, .phpbb dd.error, .phpbb dd.error a {\n	color: #fff !important;\n}\n\n\n/*\n	Buttons\n*/\n.phpbb #format-buttons .button2 {\n	background-color: #f8f8f8;\n	background-image: url("{T_THEME_PATH}/images/white10.png");\n	color: #808080 !important;\n	border-color: #d4d4d4;\n	text-shadow: 1px 1px 0 rgba(255, 255, 255, 0.2);\n}\n.phpbb #format-buttons .button2:hover {\n	background-color: #2372bb;\n	border-color: #2372bb;\n	color: #fff !important;\n	text-shadow: none;\n}\n\n.phpbb .buttons a, .phpbb a.button, .phpbb .buttons a span, .phpbb a.button span {\n	background-image: url("{T_THEME_PATH}/images/buttons.png");\n	background-color: #2372bb;\n	color: #fff !important;\n}\n.phpbb .buttons a:hover, .phpbb a.button:hover, .phpbb .buttons a:hover span, .phpbb a.button:hover span {\n	background-color: #b01414;\n}\n\n/*\n	Forums list\n*/\n.phpbb .topiclist .header, .oldie .phpbb .topiclist .header, .phpbb h2.header-outer, .phpbb table.table1 th {\n	background-color: #2372bb;\n	border-color: #2372bb;\n}\n.phpbb .topiclist .header.inactive {\n	background-color: #808080;\n	border-color: #808080;\n}\n.phpbb .topiclist .header.inactive.unread, .phpbb .topiclist .header:hover, .oldie .phpbb .topiclist .header:hover, .phpbb h2.header-outer:hover, .phpbb table.table1 th:hover {\n	background-color: #b01414;\n	border-color: #b01414;\n}\n.phpbb .topiclist .header {\n	background-image: url("{T_THEME_PATH}/images/topwhite30.png"), url("{T_THEME_PATH}/images/cat_left.png");\n}\n.oldie .phpbb .topiclist .header, .phpbb h2.header-outer .header-left {\n	background-image: url("{T_THEME_PATH}/images/cat_left.png");\n}\n.phpbb .topiclist .header dl, .phpbb h2.header-outer .header-right {\n	background-image: url("{T_THEME_PATH}/images/cat_right.png");\n}\n.phpbb .topiclist .header dt, .phpbb h2.header-outer .header-inner {\n	background-image: url("{T_THEME_PATH}/images/cat_bg.png");\n}\n.phpbb table.table1 th {\n	background-image: url("{T_THEME_PATH}/images/white20.png");\n}\n.phpbb h2.header.header-outer {\n	background-image: url("{T_THEME_PATH}/images/topwhite30.png");\n}\n.phpbb .topiclist .header, .phpbb .topiclist .header a, .phpbb .topiclist .header a:visited, .phpbb h2.header-outer, .phpbb h2.header-outer a, .phpbb h2.header-outer a:visited,\n.phpbb table.table1 th, .phpbb table.table1 th a, .phpbb table.table1 th a:visited,\n.phpbb a.header-menu, .phpbb a.header-menu:visited, .phpbb a.header-menu:hover {\n	color: #fff;\n	text-shadow: 1px 1px 0 rgba(0, 0, 0, 0.2);\n}\n.oldie .phpbb .topiclist .header, .oldie .phpbb .topiclist .header a, .oldie .phpbb .topiclist .header a:visited, .oldie .phpbb h2.header-outer, .oldie .phpbb h2.header-outer a,\n.phpbb .topiclist .header a:hover, .phpbb h2.header-outer a:hover, .oldie .phpbb table.table1 th, .oldie .phpbb table.table1 th a, .oldie .phpbb table.table1 th a:visited .phpbb table.table1 th a:hover {\n	color: #fff;\n}\n\n.phpbb .expandable .header:after, .phpbb .menu li.expandable:after {\n	background-image: url("{T_THEME_PATH}/images/cat_expand.png");\n}\n\n.phpbb .topiclist > li {\n	background-color: #f8f8f8;\n	border-color: #d4d4d4;\n}\n.phpbb .topiclist > li.row2 {\n	background-color: #fafafa;\n}\n.phpbb .topiclist > li.reported {\n	background-color: #f8f4f4;\n	background-image: none;\n}\n.phpbb .topiclist > li:hover {\n	background-color: #fcfcfc;\n}\n.phpbb .topiclist > li.row2:hover {\n	background-color: #fdfdfd;\n}\n.phpbb .topiclist > li.reported:hover {\n	background-color: #f4e9e9;\n}\n.phpbb .topiclist dd {\n	border-color: #e8e8e8;\n	color: #444;\n}\n.phpbb .topiclist .reported dd {\n	border-color: #e7c7c7;\n}\n.phpbb .topiclist .topics dfn, .phpbb .topiclist .posts dfn, .phpbb .topiclist .views dfn, .phpbb .topiclist .lastpost dfn, .phpbb .topiclist .by, .phpbb .topiclist .bull {\n	color: #999;\n}\n\n.phpbb a.topictitle, .phpbb a.forumtitle {\n	color: #1a4f90;\n}\n.phpbb .unread a.topictitle, .phpbb .unread a.forumtitle, .phpbb a.topictitle:hover, .phpbb a.forumtitle:hover, .phpbb a.subforum.unread {\n	color: #bc2a2a;\n}\n\n.phpbb .topiclist .icon dt {\n	color: #808080;\n}\n.phpbb .topiclist .header dt {\n	color: #fff;\n}\n\n.phpbb p.subforums strong, .phpbb p.moderators strong {\n	color: #808080;\n}\n\n/*\n	Blocks\n*/\n.phpbb .panel, .phpbb .post, .phpbb table.table1 td, .phpbb .cp-mini {\n	background-color: #f8f8f8;\n	border-color: #d8d8d8;\n}\n.phpbb .panel.stats .inner {\n	background-image: url("{T_THEME_PATH}/images/stats.png");\n}\n\n.phpbb div.rules, .phpbb .postbody .rules {\n	background-image: url("{T_THEME_PATH}/images/topwhite30.png");\n	background-color: #f6e7e7;\n	border-color: #eadada;\n}\n.phpbb div.rules:hover, .phpbb .postbody .rules:hover {\n	border-color: #e4c6c6;\n}\n.phpbb .rules .panel-inner {\n	border-color: #f9f2f2;\n}\n.phpbb div.rules span+strong {\n	color: #bc2a2a;\n}\n\n.phpbb .panel-wrapper {\n	background-color: transparent;\n	background-image: none;\n}\n\n\n/*\n	Arrows\n*/\n.phpbb a.subforum {\n	background-image: url("{IMG_ICON_POST_TARGET_SRC}");\n}\n.phpbb a.subforum.unread {\n	background-image: url("{IMG_ICON_POST_TARGET_UNREAD_SRC}");\n}\n.phpbb a.left {\n	background-image: url("{T_THEME_PATH}/images/arrow_left.png");\n}\n.phpbb a.right {\n	background-image: url("{T_THEME_PATH}/images/arrow_right.png");\n}\n.phpbb a.up {\n	background-image: url("{T_THEME_PATH}/images/arrow_up.png");\n}\n.phpbb a.down {\n	background-image: url("{T_THEME_PATH}/images/arrow_down.png");\n}\n\n.phpbb .post .back2top a {\n	background-image: url("{IMG_ICON_BACK_TOP_SRC}");\n}\n\n/*\n	Pagination\n*/\n.phpbb .pagination span {\n	color: #999;\n}\n.phpbb .pagination span a, .phpbb .pagination span strong {\n	background-color: #2372bb;\n	color: #fff;\n	background-image: url("{T_THEME_PATH}/images/pagination.png");\n}\n.phpbb .pagination span strong, .phpbb .pagination span a:hover {\n	background-color: #b01414;\n}\n\n/*\n	Poll\n*/\n.phpbb .polls dl {\n	border-color: #e0e0e0;\n}\n.phpbb .polls dd.resultbar > div {\n	color: #fff;\n	background-color: #2372bb;\n	background-image: url("{T_THEME_PATH}/images/poll.png");\n}\n.phpbb .polls .voted dd.resultbar > div {\n	background-color: #b01414;\n}\n\n/*\n	Post\n*/\n.phpbb .poster-rank {\n	color: #888;\n}\n.phpbb .postprofile dd strong, .phpbb .postprofile li > strong, .phpbb .postbody .author {\n	font-weight: normal;\n	color: #606060;\n}\n.phpbb .profile .poster-avatar.empty span {\n	background-image: url("{T_THEME_PATH}/images/avatar.png");\n}\n.phpbb .online .poster-avatar {\n	background-image: url("{T_THEME_PATH}/images/online.png");\n}\n.phpbb .post-content-wrap > .postbody {\n	border-color: #e8e8e8;\n}\n\n.phpbb .profile-icons a {\n	background-image: url("{T_THEME_PATH}/images/buttons_post.png");\n	background-color: #2372bb;\n}\n.phpbb .profile-icons a:hover {\n	background-color: #b01414;\n}\n\n.phpbb .signature {\n	color: #444;\n	border-color: #e8e8e8;\n}\n.phpbb .postbody .notice {\n	background-color: #f6e7e7;\n	border-color: #eadada;\n}\n\n.phpbb .posthilit {\n	background-color: #e3e37f;\n}\n\n/*\n	BBCode\n*/\n.phpbb blockquote, .phpbb blockquote cite, .phpbb .attachbox, .phpbb .attachbox dt, .phpbb .codebox, .phpbb .codebox dt, .phpbb .inline-attachment {\n	border-color: #e0e0e0;\n}\n.phpbb blockquote, .phpbb .attachbox, .phpbb .codebox, .phpbb .inline-attachment {\n	background-color: #f4f4f4;\n}\n.phpbb blockquote blockquote, .phpbb blockquote .attachbox, .phpbb blockquote .codebox {\n	background-color: #f8f8f8;\n}\n.phpbb blockquote, .phpbb .attachbox dt, .phpbb .codebox dt {\n	color: #606060;\n}\n.phpbb blockquote cite {\n	color: #000;\n}\n\n/*\n	Tabs\n*/\n.phpbb #tabs li a, .phpbb #minitabs li a {\n	background-color: #f8f8f8;\n	border-color: #d8d8d8;\n}\n.phpbb #tabs li a:hover, .phpbb #minitabs li a:hover {\n	background-color: #2372bb;\n	border-color: #2372bb;\n	color: #fff;\n}\n.phpbb #tabs li.activetab a, .phpbb #tabs #active-subsection a, .phpbb #minitabs li.activetab a {\n	background-color: #2372bb;\n	border-color: #2372bb;\n	background-image: url("{T_THEME_PATH}/images/buttons_bg.png");\n	color: #fff;\n}\n.phpbb #tabs li.activetab a:hover, .phpbb #tabs #active-subsection a:hover, .phpbb #minitabs li.activetab a:hover {\n	background-color: #b01414;\n	border-color: #b01414;\n	color: #fff;\n}\n\n/*\n	Control panel\n*/\n.phpbb .cp-content {\n	border-color: #d8d8d8;\n}\n\n.phpbb .pm_marked_colour, .phpbb .topiclist > li.pm_marked_colour > dl dt {\n	border-color: #982aaf;\n}\n.phpbb .pm_replied_colour, .phpbb .topiclist > li.pm_replied_colour > dl dt {\n	border-color: #2372bb;\n}\n.phpbb .pm_friend_colour, .phpbb .topiclist > li.pm_friend_colour > dl dt {\n	border-color: #2aaf30;\n}\n.phpbb .pm_foe_colour, .phpbb .topiclist > li.pm_foe_colour > dl dt {\n	border-color: #b01414;\n}\n\n.phpbb dl.details dt {\n	color: #808080;\n}\n \n/*\n	Avatars gallery\n*/\n.phpbb #gallery label:hover {\n	border-color: #d4d4d4;\n	background-color: #fafafa;\n}\n\n/*\n	RSS feed\n*/\n.phpbb a.feed-icon-forum {\n	background-image: url("{T_THEME_PATH}/images/rss.png");\n}');
INSERT INTO `phpbb_styles_theme` (`theme_id`, `theme_name`, `theme_copyright`, `theme_path`, `theme_storedb`, `theme_mtime`, `theme_data`) VALUES
(4, 'eMuza_summer', 'Matti &copy; & GamesBoard.pl', 'eMuza_summer', 1, 1267643520, '/*  phpBB 3.0 Style Sheet\r\n    --------------------------------------------------------------\r\n	Style name:		proSilver\r\n	Based on style:	proSilver (this is the default phpBB 3 style)\r\n	Original author:	subBlue ( http://www.subBlue.com/ )\r\n	Modified by:		\r\n	\r\n	Copyright 2006 phpBB Group ( http://www.phpbb.com/ )\r\n    --------------------------------------------------------------\r\n*/\r\n\r\n/* General proSilver Markup Styles\r\n---------------------------------------- */\r\n\r\n* {\r\n	/* Reset browsers default margin, padding and font sizes */\r\n	margin: 0;\r\n	padding: 0;\r\n}\r\n\r\nhtml {\r\n	font-size: 100%;\r\n	/* Always show a scrollbar for short pages - stops the jump when the scrollbar appears. non-IE browsers */\r\n	height: 100%;\r\n}\r\n\r\nbody {\r\n	/* Text-Sizing with ems: http://www.clagnut.com/blog/348/ */\r\n	font-family: Verdana, Helvetica, Arial, sans-serif;\r\n	color: #828282;\r\n	/*font-size: 62.5%;			 This sets the default font size to be equivalent to 10px */\r\n	font-size: 10px;\r\n	margin: 0;\r\n	padding: 0px 0;\r\n	background-color:#F7C457;\r\n	//background-image: url({T_THEME_PATH}/images/sfondo.gif);\r\n\r\n}\r\n\r\n#tlo {\r\n	background-image: url({T_THEME_PATH}/images/sfondo.gif);\r\n	background-repeat: repeat-x;\r\n	background-attachment: fixed;\r\n}\r\n\r\n\r\n\r\nh1 {\r\n	/* Forum name */\r\n	font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;\r\n	margin-right: 200px;\r\n	color: #FFFFFF;\r\n	margin-top: 15px;\r\n	font-weight: bold;\r\n	font-size: 2em;\r\n}\r\n\r\nh2 {\r\n	/* Forum header titles */\r\n	font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;\r\n	font-weight: normal;\r\n	color: #3f3f3f;\r\n	font-size: 2em;\r\n	margin: 0.8em 0 0.2em 0;\r\n}\r\n\r\nh2.solo {\r\n	margin-bottom: 1em;\r\n}\r\n\r\nh3 {\r\n	/* Sub-headers (also used as post headers, but defined later) */\r\n	font-family: Arial, Helvetica, sans-serif;\r\n	font-weight: bold;\r\n	text-transform: uppercase;\r\n	border-bottom: 1px solid #CCCCCC;\r\n	margin-bottom: 3px;\r\n	padding-bottom: 2px;\r\n	font-size: 1.05em;\r\n	color: #989898;\r\n	margin-top: 20px;\r\n}\r\n\r\nh4 {\r\n	/* Forum and topic list titles */\r\n	font-family: "Trebuchet MS", Verdana, Helvetica, Arial, Sans-serif;\r\n	font-size: 1.3em;\r\n}\r\n\r\np {\r\n	line-height: 1.3em;\r\n	font-size: 1.1em;\r\n	margin-bottom: 1.5em;\r\n}\r\n\r\nimg {\r\n	border-width: 0;\r\n}\r\n\r\nhr {\r\n	/* Also see tweaks.css */\r\n	border: 0 none #FFFFFF;\r\n	border-top: 1px solid #CCCCCC;\r\n	height: 1px;\r\n	margin: 5px 0;\r\n	display: block;\r\n	clear: both;\r\n}\r\n\r\nhr.dashed {\r\n	border-top: 1px dashed #CCCCCC;\r\n	margin: 10px 0;\r\n}\r\n\r\nhr.divider {\r\n	display: none;\r\n}\r\n\r\np.right {\r\n	text-align: right;\r\n}\r\n\r\n/* Main blocks\r\n---------------------------------------- */\r\n#wrap {\r\n   min-width: 650px;\r\n   margin:0px auto;\r\n   padding:0px;\r\n   text-align:left;\r\n   width:900px;\r\n   border: 2px solid #F3D148;\r\n   background-color: #fff;\r\n}\r\n\r\n#wrap2 {\r\n	width: 880px;\r\n    margin:0px auto;\r\n    padding:0px;\r\n}\r\n\r\n\r\n.one		{ text-decoration: none; font-weight : bold; font-size : 11px; color : #ffecc9; font-family: tahoma; padding-left: 7px; padding-right: 7px;}\r\na.one		{ padding-left: 7px; padding-right: 7px; }\r\na.one:hover { color : #ad7301; padding-left: 7px; padding-right: 7px; padding-bottom: 6px; padding-top: 5px; font-weight : bold;}\r\n\r\n\r\n#simple-wrap {\r\n	padding: 6px 10px;\r\n}\r\n\r\n#page-body {\r\n	margin: 4px 0;\r\n	clear: both;\r\n}\r\n\r\n#page-footer {\r\n	clear: both;\r\n}\r\n\r\n#page-footer h3 {\r\n	margin-top: 20px;\r\n}\r\n\r\n#logo {\r\n	width: 900px;\r\n	height: 186px;\r\n	background: url({T_THEME_PATH}/images/top.gif);\r\n	float: left;\r\n}\r\n\r\na#logo:hover {\r\n	text-decoration: none;\r\n}\r\n\r\n/* Search box\r\n--------------------------------------------- */\r\n#search-box {\r\n	color: #FFFFFF;\r\n	position: relative;\r\n	margin-top: 30px;\r\n	margin-right: 5px;\r\n	display: block;\r\n	float: right;\r\n	text-align: right;\r\n	white-space: nowrap; /* For Opera */\r\n}\r\n\r\n#search-box #keywords {\r\n	width: 95px;\r\n	background-color: #FFF;\r\n}\r\n\r\n#search-box input {\r\n	border: 1px solid #b0b0b0;\r\n}\r\n\r\n/* .button1 style defined later, just a few tweaks for the search button version */\r\n#search-box input.button1 {\r\n	padding: 1px 5px;\r\n}\r\n\r\n#search-box li {\r\n	text-align: right;\r\n	margin-top: 4px;\r\n}\r\n\r\n#search-box img {\r\n	vertical-align: middle;\r\n	margin-right: 3px;\r\n}\r\n\r\n/* Site description and logo */\r\n#site-description {\r\n	float: left;\r\n	width: 70%;\r\n}\r\n\r\n#site-description h1 {\r\n	margin-right: 0;\r\n}\r\n\r\n/* Round cornered boxes and backgrounds\r\n---------------------------------------- */\r\n.headerbar {\r\n	background: #ebebeb none repeat-x 0 0;\r\n	color: #FFFFFF;\r\n	margin-bottom: 4px;\r\n	padding: 0 5px;\r\n}\r\n\r\n.navbar {\r\n	background-color: #ebebeb;\r\n	padding: 0 10px;\r\n}\r\n\r\n.forabg {\r\n	background: #b1b1b1 none repeat-x 0 0;\r\n	margin-bottom: 4px;\r\n	padding: 0 5px;\r\n	clear: both;\r\n}\r\n\r\n.forumbg {\r\n	background: #ebebeb none repeat-x 0 0;\r\n	margin-bottom: 4px;\r\n	padding: 0 5px;\r\n	clear: both;\r\n}\r\n\r\n.panel {\r\n	margin-bottom: 4px;\r\n	padding: 0 10px;\r\n	background-color: #f3f3f3;\r\n	color: #3f3f3f;\r\n}\r\n\r\n.post {\r\n	padding: 0 10px;\r\n	margin-bottom: 4px;\r\n	background-repeat: no-repeat;\r\n	background-position: 100% 0;\r\n}\r\n\r\n.post:target .content {\r\n	color: #000000;\r\n}\r\n\r\n.post:target h3 a {\r\n	color: #000000;\r\n}\r\n\r\n.bg1	{ background-color: #f7f7f7;}\r\n.bg2	{ background-color: #f2f2f2; }\r\n.bg3	{ background-color: #ebebeb; }\r\n\r\n.rowbg {\r\n	margin: 5px 5px 2px 5px;\r\n}\r\n\r\n.ucprowbg {\r\n	background-color: #e2e2e2;\r\n}\r\n\r\n.fieldsbg {\r\n	/*border: 1px #DBDEE2 solid;*/\r\n	background-color: #eaeaea;\r\n}\r\n\r\nspan.corners-top, span.corners-bottom, span.corners-top span, span.corners-bottom span {\r\n	font-size: 1px;\r\n	line-height: 1px;\r\n	display: block;\r\n	height: 5px;\r\n	background-repeat: no-repeat;\r\n}\r\n\r\nspan.corners-top {\r\n	background-image: none;\r\n	background-position: 0 0;\r\n	margin: 0 -5px;\r\n}\r\n\r\nspan.corners-top span {\r\n	background-image: none;\r\n	background-position: 100% 0;\r\n}\r\n\r\nspan.corners-bottom {\r\n	background-image: none;\r\n	background-position: 0 100%;\r\n	margin: 0 -5px;\r\n	clear: both;\r\n}\r\n\r\nspan.corners-bottom span {\r\n	background-image: none;\r\n	background-position: 100% 100%;\r\n}\r\n\r\n.headbg span.corners-bottom {\r\n	margin-bottom: -1px;\r\n}\r\n\r\n.post span.corners-top, .post span.corners-bottom, .panel span.corners-top, .panel span.corners-bottom, .navbar span.corners-top, .navbar span.corners-bottom {\r\n	margin: 0 -10px;\r\n}\r\n\r\n.rules span.corners-top {\r\n	margin: 0 -10px 5px -10px;\r\n}\r\n\r\n.rules span.corners-bottom {\r\n	margin: 5px -10px 0 -10px;\r\n}\r\n\r\n/* Horizontal lists\r\n----------------------------------------*/\r\nul.linklist {\r\n	display: block;\r\n	margin: 0;\r\n}\r\n\r\nul.linklist li {\r\n	display: block;\r\n	list-style-type: none;\r\n	float: left;\r\n	width: auto;\r\n	margin-right: 5px;\r\n	font-size: 1.1em;\r\n	line-height: 2.2em;\r\n}\r\n\r\nul.linklist li.rightside, p.rightside {\r\n	float: right;\r\n	margin-right: 0;\r\n	margin-left: 5px;\r\n	text-align: right;\r\n}\r\n\r\nul.navlinks {\r\n	padding-bottom: 1px;\r\n	margin-bottom: 1px;\r\n	border-bottom: 1px solid #FFFFFF;\r\n	font-weight: bold;\r\n}\r\n\r\nul.leftside {\r\n	float: left;\r\n	margin-left: 0;\r\n	margin-right: 5px;\r\n	text-align: left;\r\n}\r\n\r\nul.rightside {\r\n	float: right;\r\n	margin-left: 5px;\r\n	margin-right: -5px;\r\n	text-align: right;\r\n}\r\n\r\n/* Table styles\r\n----------------------------------------*/\r\ntable.table1 {\r\n	/* See tweaks.css */\r\n}\r\n\r\n#ucp-main table.table1 {\r\n	padding: 2px;\r\n}\r\n\r\ntable.table1 thead th {\r\n	font-weight: normal;\r\n	text-transform: uppercase;\r\n	color: #FFFFFF;\r\n	line-height: 1.3em;\r\n	font-size: 1em;\r\n	padding: 0 0 4px 3px;\r\n}\r\n\r\ntable.table1 thead th span {\r\n	padding-left: 7px;\r\n}\r\n\r\ntable.table1 tbody tr {\r\n	border: 1px solid #cfcfcf;\r\n}\r\n\r\ntable.table1 tbody tr:hover, table.table1 tbody tr.hover {\r\n	background-color: #f6f6f6;\r\n	color: #000;\r\n}\r\n\r\ntable.table1 td {\r\n	color: #6a6a6a;\r\n	font-size: 1.1em;\r\n}\r\n\r\ntable.table1 tbody td {\r\n	padding: 5px;\r\n	border-top: 1px solid #FAFAFA;\r\n}\r\n\r\ntable.table1 tbody th {\r\n	padding: 5px;\r\n	border-bottom: 1px solid #000000;\r\n	text-align: left;\r\n	color: #333333;\r\n	background-color: #FFFFFF;\r\n}\r\n\r\n/* Specific column styles */\r\ntable.table1 .name		{ text-align: left; }\r\ntable.table1 .posts		{ text-align: center !important; width: 7%; }\r\ntable.table1 .joined	{ text-align: left; width: 15%; }\r\ntable.table1 .active	{ text-align: left; width: 15%; }\r\ntable.table1 .mark		{ text-align: center; width: 7%; }\r\ntable.table1 .info		{ text-align: left; width: 30%; }\r\ntable.table1 .info div	{ width: 100%; white-space: nowrap; overflow: hidden; }\r\ntable.table1 .autocol	{ line-height: 2em; white-space: nowrap; }\r\ntable.table1 thead .autocol { padding-left: 1em; }\r\n\r\ntable.table1 span.rank-img {\r\n	float: right;\r\n	width: auto;\r\n}\r\n\r\ntable.info td {\r\n	padding: 3px;\r\n}\r\n\r\ntable.info tbody th {\r\n	padding: 3px;\r\n	text-align: right;\r\n	vertical-align: top;\r\n	color: #000000;\r\n	font-weight: normal;\r\n}\r\n\r\n.forumbg table.table1 {\r\n	margin: 0 -2px -1px -1px;\r\n}\r\n\r\n/* Misc layout styles\r\n---------------------------------------- */\r\n/* column[1-2] styles are containers for two column layouts \r\n   Also see tweaks.css */\r\n.column1 {\r\n	float: left;\r\n	clear: left;\r\n	width: 49%;\r\n}\r\n\r\n.column2 {\r\n	float: right;\r\n	clear: right;\r\n	width: 49%;\r\n}\r\n\r\n/* General classes for placing floating blocks */\r\n.left-box {\r\n	float: left;\r\n	width: auto;\r\n	text-align: left;\r\n}\r\n\r\n.right-box {\r\n	float: right;\r\n	width: auto;\r\n	text-align: right;\r\n}\r\n\r\ndl.details {\r\n	/*font-family: "Lucida Grande", Verdana, Helvetica, Arial, sans-serif;*/\r\n	font-size: 1.1em;\r\n}\r\n\r\ndl.details dt {\r\n	float: left;\r\n	clear: left;\r\n	width: 30%;\r\n	text-align: right;\r\n	color: #000000;\r\n	display: block;\r\n}\r\n\r\ndl.details dd {\r\n	margin-left: 0;\r\n	padding-left: 5px;\r\n	margin-bottom: 5px;\r\n	color: #828282;\r\n	float: left;\r\n	width: 65%;\r\n}\r\n\r\n/* Pagination\r\n---------------------------------------- */\r\n.pagination {\r\n	height: 1%; /* IE tweak (holly hack) */\r\n	width: auto;\r\n	text-align: right;\r\n	margin-top: 5px;\r\n	float: right;\r\n}\r\n\r\n.pagination span.page-sep {\r\n	display: none;\r\n}\r\n\r\nli.pagination {\r\n	margin-top: 0;\r\n}\r\n\r\n.pagination strong, .pagination b {\r\n	font-weight: normal;\r\n}\r\n\r\n.pagination span strong {\r\n	padding: 0 2px;\r\n	margin: 0 2px;\r\n	font-weight: normal;\r\n	color: #FFFFFF;\r\n	background-color: #bfbfbf;\r\n	border: 1px solid #bfbfbf;\r\n	font-size: 0.9em;\r\n}\r\n\r\n.pagination span a, .pagination span a:link, .pagination span a:visited, .pagination span a:active {\r\n	font-weight: normal;\r\n	text-decoration: none;\r\n	color: #747474;\r\n	margin: 0 2px;\r\n	padding: 0 2px;\r\n	background-color: #eeeeee;\r\n	border: 1px solid #bababa;\r\n	font-size: 0.9em;\r\n	line-height: 1.5em;\r\n}\r\n\r\n.pagination span a:hover {\r\n	border-color: #d2d2d2;\r\n	background-color: #d2d2d2;\r\n	color: #FFF;\r\n	text-decoration: none;\r\n}\r\n\r\n.pagination img {\r\n	vertical-align: middle;\r\n}\r\n\r\n/* Pagination in viewforum for multipage topics */\r\n.row .pagination {\r\n	display: block;\r\n	float: right;\r\n	width: auto;\r\n	margin-top: 0;\r\n	padding: 1px 0 1px 15px;\r\n	font-size: 0.9em;\r\n	background: none 0 50% no-repeat;\r\n}\r\n\r\n.row .pagination span a, li.pagination span a {\r\n	background-color: #FFFFFF;\r\n}\r\n\r\n.row .pagination span a:hover, li.pagination span a:hover {\r\n	background-color: #d2d2d2;\r\n}\r\n\r\n/* Miscellaneous styles\r\n---------------------------------------- */\r\n#forum-permissions {\r\n	float: right;\r\n	width: auto;\r\n	padding-left: 5px;\r\n	margin-left: 5px;\r\n	margin-top: 10px;\r\n	text-align: right;\r\n}\r\n\r\n.copyright {\r\n	padding: 5px;\r\n	text-align: center;\r\n	color: #555555;\r\n}\r\n\r\n.small {\r\n	font-size: 0.9em !important;\r\n}\r\n\r\n.titlespace {\r\n	margin-bottom: 15px;\r\n}\r\n\r\n.headerspace {\r\n	margin-top: 20px;\r\n}\r\n\r\n.error {\r\n	color: #bcbcbc;\r\n	font-weight: bold;\r\n	font-size: 1em;\r\n}\r\n\r\n.reported {\r\n	background-color: #f7f7f7;\r\n}\r\n\r\nli.reported:hover {\r\n	background-color: #ececec;\r\n}\r\n\r\ndiv.rules {\r\n	background-color: #ececec;\r\n	color: #bcbcbc;\r\n	padding: 0 10px;\r\n	margin: 10px 0;\r\n	font-size: 1.1em;\r\n}\r\n\r\ndiv.rules ul {\r\n	margin-left: 20px;\r\n}\r\n\r\np.rules {\r\n	background-color: #ececec;\r\n	background-image: none;\r\n	padding: 5px;\r\n}\r\n\r\np.rules img {\r\n	vertical-align: middle;\r\n}\r\n\r\np.rules a {\r\n	vertical-align: middle;\r\n	clear: both;\r\n}\r\n\r\n#top {\r\n	position: absolute;\r\n	top: -20px;\r\n}\r\n\r\n.clear {\r\n	display: block;\r\n	clear: both;\r\n	font-size: 1px;\r\n	line-height: 1px;\r\n	background: transparent;\r\n}\r\n/* proSilver Link Styles\r\n---------------------------------------- */\r\n\r\na:link	{ color: #898989; text-decoration: none; }\r\na:visited	{ color: #898989; text-decoration: none; }\r\na:hover	{ color: #d3d3d3; text-decoration: underline; }\r\na:active	{ color: #d2d2d2; text-decoration: none; }\r\n\r\n/* Coloured usernames */\r\n.username-coloured {\r\n	font-weight: bold;\r\n	display: inline !important;\r\n}\r\n\r\n/* Links on gradient backgrounds */\r\n#search-box a:link, .navbg a:link, .forumbg .header a:link, .forabg .header a:link, th a:link {\r\n	color: #FFFFFF;\r\n	text-decoration: none;\r\n}\r\n\r\n#search-box a:visited, .navbg a:visited, .forumbg .header a:visited, .forabg .header a:visited, th a:visited {\r\n	color: #FFFFFF;\r\n	text-decoration: none;\r\n}\r\n\r\n#search-box a:hover, .navbg a:hover, .forumbg .header a:hover, .forabg .header a:hover, th a:hover {\r\n	color: #ffffff;\r\n	text-decoration: underline;\r\n}\r\n\r\n#search-box a:active, .navbg a:active, .forumbg .header a:active, .forabg .header a:active, th a:active {\r\n	color: #ffffff;\r\n	text-decoration: none;\r\n}\r\n\r\n/* Links for forum/topic lists */\r\na.forumtitle {\r\n	font-family: "Trebuchet MS", Helvetica, Arial, Sans-serif;\r\n	font-size: 1.2em;\r\n	font-weight: bold;\r\n	color: #898989;\r\n	text-decoration: none;\r\n}\r\n\r\n/* a.forumtitle:visited { color: #898989; } */\r\n\r\na.forumtitle:hover {\r\n	color: #bcbcbc;\r\n	text-decoration: underline;\r\n}\r\n\r\na.forumtitle:active {\r\n	color: #898989;\r\n}\r\n\r\na.topictitle {\r\n	font-family: "Trebuchet MS", Helvetica, Arial, Sans-serif;\r\n	font-size: 1.2em;\r\n	font-weight: bold;\r\n	color: #898989;\r\n	text-decoration: none;\r\n}\r\n\r\n/* a.topictitle:visited { color: #d2d2d2; } */\r\n\r\na.topictitle:hover {\r\n	color: #bcbcbc;\r\n	text-decoration: underline;\r\n}\r\n\r\na.topictitle:active {\r\n	color: #898989;\r\n}\r\n\r\n/* Post body links */\r\n.postlink {\r\n	text-decoration: none;\r\n	color: #d2d2d2;\r\n	border-bottom: 1px solid #d2d2d2;\r\n	padding-bottom: 0;\r\n}\r\n\r\n.postlink:visited {\r\n	color: #bdbdbd;\r\n	border-bottom-style: dotted;\r\n	border-bottom-color: #666666;\r\n}\r\n\r\n.postlink:active {\r\n	color: #d2d2d2;\r\n}\r\n\r\n.postlink:hover {\r\n	background-color: #f6f6f6;\r\n	text-decoration: none;\r\n	color: #404040;\r\n}\r\n\r\n.signature a, .signature a:visited, .signature a:active, .signature a:hover {\r\n	border: none;\r\n	text-decoration: underline;\r\n	background-color: transparent;\r\n}\r\n\r\n/* Profile links */\r\n.postprofile a:link, .postprofile a:active, .postprofile a:visited, .postprofile dt.author a {\r\n	font-weight: bold;\r\n	color: #898989;\r\n	text-decoration: none;\r\n}\r\n\r\n.postprofile a:hover, .postprofile dt.author a:hover {\r\n	text-decoration: underline;\r\n	color: #d3d3d3;\r\n}\r\n\r\n\r\n/* Profile searchresults */	\r\n.search .postprofile a {\r\n	color: #898989;\r\n	text-decoration: none; \r\n	font-weight: normal;\r\n}\r\n\r\n.search .postprofile a:hover {\r\n	color: #d3d3d3;\r\n	text-decoration: underline; \r\n}\r\n\r\n/* Back to top of page */\r\n.back2top {\r\n	clear: both;\r\n	height: 11px;\r\n	text-align: right;\r\n}\r\n\r\na.top {\r\n	background: none no-repeat top left;\r\n	text-decoration: none;\r\n	width: {IMG_ICON_BACK_TOP_WIDTH}px;\r\n	height: {IMG_ICON_BACK_TOP_HEIGHT}px;\r\n	display: block;\r\n	float: right;\r\n	overflow: hidden;\r\n	letter-spacing: 1000px;\r\n	text-indent: 11px;\r\n}\r\n\r\na.top2 {\r\n	background: none no-repeat 0 50%;\r\n	text-decoration: none;\r\n	padding-left: 15px;\r\n}\r\n\r\n/* Arrow links  */\r\na.up		{ background: none no-repeat left center; }\r\na.down		{ background: none no-repeat right center; }\r\na.left		{ background: none no-repeat 3px 60%; }\r\na.right		{ background: none no-repeat 95% 60%; }\r\n\r\na.up, a.up:link, a.up:active, a.up:visited {\r\n	padding-left: 10px;\r\n	text-decoration: none;\r\n	border-bottom-width: 0;\r\n}\r\n\r\na.up:hover {\r\n	background-position: left top;\r\n	background-color: transparent;\r\n}\r\n\r\na.down, a.down:link, a.down:active, a.down:visited {\r\n	padding-right: 10px;\r\n}\r\n\r\na.down:hover {\r\n	background-position: right bottom;\r\n	text-decoration: none;\r\n}\r\n\r\na.left, a.left:active, a.left:visited {\r\n	padding-left: 12px;\r\n}\r\n\r\na.left:hover {\r\n	color: #d2d2d2;\r\n	text-decoration: none;\r\n	background-position: 0 60%;\r\n}\r\n\r\na.right, a.right:active, a.right:visited {\r\n	padding-right: 12px;\r\n}\r\n\r\na.right:hover {\r\n	color: #d2d2d2;\r\n	text-decoration: none;\r\n	background-position: 100% 60%;\r\n}\r\n/* proSilver Content Styles\r\n---------------------------------------- */\r\n\r\nul.topiclist {\r\n	display: block;\r\n	list-style-type: none;\r\n	margin: 0;\r\n}\r\n\r\nul.forums {\r\n	background: #f9f9f9 none repeat-x 0 0;\r\n}\r\n\r\nul.topiclist li {\r\n	display: block;\r\n	list-style-type: none;\r\n	color: #777777;\r\n	margin: 0;\r\n}\r\n\r\nul.topiclist dl {\r\n	position: relative;\r\n}\r\n\r\nul.topiclist li.row dl {\r\n	padding: 2px 0;\r\n}\r\n\r\nul.topiclist dt {\r\n	display: block;\r\n	float: left;\r\n	width: 50%;\r\n	font-size: 1.1em;\r\n	padding-left: 5px;\r\n	padding-right: 5px;\r\n}\r\n\r\nul.topiclist dd {\r\n	display: block;\r\n	float: left;\r\n	border-left: 1px solid #FFFFFF;\r\n	padding: 4px 0;\r\n}\r\n\r\nul.topiclist dfn {\r\n	/* Labels for post/view counts */\r\n	display: none;\r\n}\r\n\r\nul.topiclist li.row dt a.subforum {\r\n	background-image: none;\r\n	background-position: 0 50%;\r\n	background-repeat: no-repeat;\r\n	position: relative;\r\n	white-space: nowrap;\r\n	padding: 0 0 0 12px;\r\n}\r\n\r\n.forum-image {\r\n	float: left;\r\n	padding-top: 5px;\r\n	margin-right: 5px;\r\n}\r\n\r\nli.row {\r\n	border-top: 1px solid #FFFFFF;\r\n	border-bottom: 1px solid #8f8f8f;\r\n}\r\n\r\nli.row strong {\r\n	font-weight: normal;\r\n	color: #000000;\r\n}\r\n\r\nli.row:hover {\r\n	background-color: #f6f6f6;\r\n}\r\n\r\nli.row:hover dd {\r\n	border-left-color: #CCCCCC;\r\n}\r\n\r\nli.header dt, li.header dd {\r\n	line-height: 1em;\r\n	border-left-width: 0;\r\n	margin: 2px 0 4px 0;\r\n	color: #FFFFFF;\r\n	padding-top: 2px;\r\n	padding-bottom: 2px;\r\n	font-size: 1em;\r\n	font-family: Arial, Helvetica, sans-serif;\r\n	text-transform: uppercase;\r\n}\r\n\r\nli.header dt {\r\n	font-weight: bold;\r\n}\r\n\r\nli.header dd {\r\n	margin-left: 1px;\r\n}\r\n\r\nli.header dl.icon {\r\n	min-height: 0;\r\n}\r\n\r\nli.header dl.icon dt {\r\n	/* Tweak for headers alignment when folder icon used */\r\n	padding-left: 0;\r\n	padding-right: 50px;\r\n}\r\n\r\n/* Forum list column styles */\r\ndl.icon {\r\n	min-height: 35px;\r\n	background-position: 10px 50%;		/* Position of folder icon */\r\n	background-repeat: no-repeat;\r\n}\r\n\r\ndl.icon dt {\r\n	padding-left: 45px;					/* Space for folder icon */\r\n	background-repeat: no-repeat;\r\n	background-position: 5px 95%;		/* Position of topic icon */\r\n}\r\n\r\ndd.posts, dd.topics, dd.views {\r\n	width: 8%;\r\n	text-align: center;\r\n	line-height: 2.2em;\r\n	font-size: 1.2em;\r\n}\r\n\r\ndd.lastpost {\r\n	width: 25%;\r\n	font-size: 1.1em;\r\n}\r\n\r\ndd.redirect {\r\n	font-size: 1.1em;\r\n	line-height: 2.5em;\r\n}\r\n\r\ndd.moderation {\r\n	font-size: 1.1em;\r\n}\r\n\r\ndd.lastpost span, ul.topiclist dd.searchby span, ul.topiclist dd.info span, ul.topiclist dd.time span, dd.redirect span, dd.moderation span {\r\n	display: block;\r\n	padding-left: 5px;\r\n}\r\n\r\ndd.time {\r\n	width: auto;\r\n	line-height: 200%;\r\n	font-size: 1.1em;\r\n}\r\n\r\ndd.extra {\r\n	width: 12%;\r\n	line-height: 200%;\r\n	text-align: center;\r\n	font-size: 1.1em;\r\n}\r\n\r\ndd.mark {\r\n	float: right !important;\r\n	width: 9%;\r\n	text-align: center;\r\n	line-height: 200%;\r\n	font-size: 1.2em;\r\n}\r\n\r\ndd.info {\r\n	width: 30%;\r\n}\r\n\r\ndd.option {\r\n	width: 15%;\r\n	line-height: 200%;\r\n	text-align: center;\r\n	font-size: 1.1em;\r\n}\r\n\r\ndd.searchby {\r\n	width: 47%;\r\n	font-size: 1.1em;\r\n	line-height: 1em;\r\n}\r\n\r\nul.topiclist dd.searchextra {\r\n	margin-left: 5px;\r\n	padding: 0.2em 0;\r\n	font-size: 1.1em;\r\n	color: #333333;\r\n	border-left: none;\r\n	clear: both;\r\n	width: 98%;\r\n	overflow: hidden;\r\n}\r\n\r\n/* Container for post/reply buttons and pagination */\r\n.topic-actions {\r\n	margin-bottom: 3px;\r\n	font-size: 1.1em;\r\n	height: 28px;\r\n	min-height: 28px;\r\n}\r\ndiv[class].topic-actions {\r\n	height: auto;\r\n}\r\n\r\n/* Post body styles\r\n----------------------------------------*/\r\n.postbody {\r\n	padding: 0;\r\n	line-height: 1.48em;\r\n	color: #333333;\r\n	width: 76%;\r\n	float: left;\r\n	clear: both;\r\n}\r\n\r\n.postbody .ignore {\r\n	font-size: 1.1em;\r\n}\r\n\r\n.postbody h3.first {\r\n	/* The first post on the page uses this */\r\n	font-size: 1.7em;\r\n}\r\n\r\n.postbody h3 {\r\n	/* Postbody requires a different h3 format - so change it here */\r\n	font-size: 1.5em;\r\n	padding: 2px 0 0 0;\r\n	margin: 0 0 0.3em 0 !important;\r\n	text-transform: none;\r\n	border: none;\r\n	font-family: "Trebuchet MS", Verdana, Helvetica, Arial, sans-serif;\r\n	line-height: 125%;\r\n}\r\n\r\n.postbody h3 img {\r\n	/* Also see tweaks.css */\r\n	vertical-align: bottom;\r\n}\r\n\r\n.postbody .content {\r\n	font-size: 1.3em;\r\n}\r\n\r\n.search .postbody {\r\n	width: 68%\r\n}\r\n\r\n/* Topic review panel\r\n----------------------------------------*/\r\n#review {\r\n	margin-top: 2em;\r\n}\r\n\r\n#topicreview {\r\n	padding-right: 5px;\r\n	overflow: auto;\r\n	height: 300px;\r\n}\r\n\r\n#topicreview .postbody {\r\n	width: auto;\r\n	float: none;\r\n	margin: 0;\r\n	height: auto;\r\n}\r\n\r\n#topicreview .post {\r\n	height: auto;\r\n}\r\n\r\n#topicreview h2 {\r\n	border-bottom-width: 0;\r\n}\r\n\r\n/* Content container styles\r\n----------------------------------------*/\r\n.content {\r\n	min-height: 3em;\r\n	overflow: hidden;\r\n	line-height: 1.4em;\r\n	font-family: "Lucida Grande", "Trebuchet MS", Verdana, Helvetica, Arial, sans-serif;\r\n	font-size: 1em;\r\n	color: #333333;\r\n}\r\n\r\n.content h2, .panel h2 {\r\n	font-weight: normal;\r\n	color: #989898;\r\n	border-bottom: 1px solid #CCCCCC;\r\n	font-size: 1.6em;\r\n	margin-top: 0.5em;\r\n	margin-bottom: 0.5em;\r\n	padding-bottom: 0.5em;\r\n}\r\n\r\n.panel h3 {\r\n	margin: 0.5em 0;\r\n}\r\n\r\n.panel p {\r\n	font-size: 1.2em;\r\n	margin-bottom: 1em;\r\n	line-height: 1.4em;\r\n}\r\n\r\n.content p {\r\n	font-family: "Lucida Grande", "Trebuchet MS", Verdana, Helvetica, Arial, sans-serif;\r\n	font-size: 1.2em;\r\n	margin-bottom: 1em;\r\n	line-height: 1.4em;\r\n}\r\n\r\ndl.faq {\r\n	font-family: "Lucida Grande", Verdana, Helvetica, Arial, sans-serif;\r\n	font-size: 1.1em;\r\n	margin-top: 1em;\r\n	margin-bottom: 2em;\r\n	line-height: 1.4em;\r\n}\r\n\r\ndl.faq dt {\r\n	font-weight: bold;\r\n	color: #333333;\r\n}\r\n\r\n.content dl.faq {\r\n	font-size: 1.2em;\r\n	margin-bottom: 0.5em;\r\n}\r\n\r\n.content li {\r\n	list-style-type: inherit;\r\n}\r\n\r\n.content ul, .content ol {\r\n	margin-bottom: 1em;\r\n	margin-left: 3em;\r\n}\r\n\r\n.posthilit {\r\n	background-color: #f3f3f3;\r\n	color: #BCBCBC;\r\n	padding: 0 2px 1px 2px;\r\n}\r\n\r\n.announce, .unreadpost {\r\n	/* Highlight the announcements & unread posts box */\r\n	border-left-color: #BCBCBC;\r\n	border-right-color: #BCBCBC;\r\n}\r\n\r\n/* Post author */\r\np.author {\r\n	margin: 0 15em 0.6em 0;\r\n	padding: 0 0 5px 0;\r\n	font-family: Verdana, Helvetica, Arial, sans-serif;\r\n	font-size: 1em;\r\n	line-height: 1.2em;\r\n}\r\n\r\n/* Post signature */\r\n.signature {\r\n	margin-top: 1.5em;\r\n	padding-top: 0.2em;\r\n	font-size: 1.1em;\r\n	border-top: 1px solid #CCCCCC;\r\n	clear: left;\r\n	line-height: 140%;\r\n	overflow: hidden;\r\n	width: 100%;\r\n}\r\n\r\ndd .signature {\r\n	margin: 0;\r\n	padding: 0;\r\n	clear: none;\r\n	border: none;\r\n}\r\n\r\n/* Post noticies */\r\n.notice {\r\n	font-family: "Lucida Grande", Verdana, Helvetica, Arial, sans-serif;\r\n	width: auto;\r\n	margin-top: 1.5em;\r\n	padding-top: 0.2em;\r\n	font-size: 1em;\r\n	border-top: 1px dashed #CCCCCC;\r\n	clear: left;\r\n	line-height: 130%;\r\n}\r\n\r\n/* Jump to post link for now */\r\nul.searchresults {\r\n	list-style: none;\r\n	text-align: right;\r\n	clear: both;\r\n}\r\n\r\n/* BB Code styles\r\n----------------------------------------*/\r\n/* Quote block */\r\nblockquote {\r\n	background: #ebebeb none 6px 8px no-repeat;\r\n	border: 1px solid #dbdbdb;\r\n	font-size: 0.95em;\r\n	margin: 0.5em 1px 0 25px;\r\n	overflow: hidden;\r\n	padding: 5px;\r\n}\r\n\r\nblockquote blockquote {\r\n	/* Nested quotes */\r\n	background-color: #bababa;\r\n	font-size: 1em;\r\n	margin: 0.5em 1px 0 15px;	\r\n}\r\n\r\nblockquote blockquote blockquote {\r\n	/* Nested quotes */\r\n	background-color: #e4e4e4;\r\n}\r\n\r\nblockquote cite {\r\n	/* Username/source of quoter */\r\n	font-style: normal;\r\n	font-weight: bold;\r\n	margin-left: 20px;\r\n	display: block;\r\n	font-size: 0.9em;\r\n}\r\n\r\nblockquote cite cite {\r\n	font-size: 1em;\r\n}\r\n\r\nblockquote.uncited {\r\n	padding-top: 25px;\r\n}\r\n\r\n/* Code block */\r\ndl.codebox {\r\n	padding: 3px;\r\n	background-color: #FFFFFF;\r\n	border: 1px solid #d8d8d8;\r\n	font-size: 1em;\r\n}\r\n\r\ndl.codebox dt {\r\n	text-transform: uppercase;\r\n	border-bottom: 1px solid #CCCCCC;\r\n	margin-bottom: 3px;\r\n	font-size: 0.8em;\r\n	font-weight: bold;\r\n	display: block;\r\n}\r\n\r\nblockquote dl.codebox {\r\n	margin-left: 0;\r\n}\r\n\r\ndl.codebox code {\r\n	/* Also see tweaks.css */\r\n	overflow: auto;\r\n	display: block;\r\n	height: auto;\r\n	max-height: 200px;\r\n	white-space: normal;\r\n	padding-top: 5px;\r\n	font: 0.9em Monaco, "Andale Mono","Courier New", Courier, mono;\r\n	line-height: 1.3em;\r\n	color: #8b8b8b;\r\n	margin: 2px 0;\r\n}\r\n\r\n.syntaxbg		{ color: #FFFFFF; }\r\n.syntaxcomment	{ color: #000000; }\r\n.syntaxdefault	{ color: #bcbcbc; }\r\n.syntaxhtml		{ color: #000000; }\r\n.syntaxkeyword	{ color: #585858; }\r\n.syntaxstring	{ color: #a7a7a7; }\r\n\r\n/* Attachments\r\n----------------------------------------*/\r\n.attachbox {\r\n	float: left;\r\n	width: auto; \r\n	margin: 5px 5px 5px 0;\r\n	padding: 6px;\r\n	background-color: #FFFFFF;\r\n	border: 1px dashed #d8d8d8;\r\n	clear: left;\r\n}\r\n\r\n.pm-message .attachbox {\r\n	background-color: #f3f3f3;\r\n}\r\n\r\n.attachbox dt {\r\n	font-family: Arial, Helvetica, sans-serif;\r\n	text-transform: uppercase;\r\n}\r\n\r\n.attachbox dd {\r\n	margin-top: 4px;\r\n	padding-top: 4px;\r\n	clear: left;\r\n	border-top: 1px solid #d8d8d8;\r\n}\r\n\r\n.attachbox dd dd {\r\n	border: none;\r\n}\r\n\r\n.attachbox p {\r\n	line-height: 110%;\r\n	color: #666666;\r\n	font-weight: normal;\r\n	clear: left;\r\n}\r\n\r\n.attachbox p.stats\r\n{\r\n	line-height: 110%;\r\n	color: #666666;\r\n	font-weight: normal;\r\n	clear: left;\r\n}\r\n\r\n.attach-image {\r\n	margin: 3px 0;\r\n	width: 100%;\r\n	max-height: 350px;\r\n	overflow: auto;\r\n}\r\n\r\n.attach-image img {\r\n	border: 1px solid #999999;\r\n/*	cursor: move; */\r\n	cursor: default;\r\n}\r\n\r\n/* Inline image thumbnails */\r\ndiv.inline-attachment dl.thumbnail, div.inline-attachment dl.file {\r\n	display: block;\r\n	margin-bottom: 4px;\r\n}\r\n\r\ndiv.inline-attachment p {\r\n	font-size: 100%;\r\n}\r\n\r\ndl.file {\r\n	font-family: Verdana, Arial, Helvetica, sans-serif;\r\n	display: block;\r\n}\r\n\r\ndl.file dt {\r\n	text-transform: none;\r\n	margin: 0;\r\n	padding: 0;\r\n	font-weight: bold;\r\n	font-family: Verdana, Arial, Helvetica, sans-serif;\r\n}\r\n\r\ndl.file dd {\r\n	color: #666666;\r\n	margin: 0;\r\n	padding: 0;	\r\n}\r\n\r\ndl.thumbnail img {\r\n	padding: 3px;\r\n	border: 1px solid #666666;\r\n	background-color: #FFF;\r\n}\r\n\r\ndl.thumbnail dd {\r\n	color: #666666;\r\n	font-style: italic;\r\n	font-family: Verdana, Arial, Helvetica, sans-serif;\r\n}\r\n\r\n.attachbox dl.thumbnail dd {\r\n	font-size: 100%;\r\n}\r\n\r\ndl.thumbnail dt a:hover {\r\n	background-color: #EEEEEE;\r\n}\r\n\r\ndl.thumbnail dt a:hover img {\r\n	border: 1px solid #d2d2d2;\r\n}\r\n\r\n/* Post poll styles\r\n----------------------------------------*/\r\nfieldset.polls {\r\n	font-family: "Trebuchet MS", Verdana, Helvetica, Arial, sans-serif;\r\n}\r\n\r\nfieldset.polls dl {\r\n	margin-top: 5px;\r\n	border-top: 1px solid #e2e2e2;\r\n	padding: 5px 0 0 0;\r\n	line-height: 120%;\r\n	color: #666666;\r\n}\r\n\r\nfieldset.polls dl.voted {\r\n	font-weight: bold;\r\n	color: #000000;\r\n}\r\n\r\nfieldset.polls dt {\r\n	text-align: left;\r\n	float: left;\r\n	display: block;\r\n	width: 30%;\r\n	border-right: none;\r\n	padding: 0;\r\n	margin: 0;\r\n	font-size: 1.1em;\r\n}\r\n\r\nfieldset.polls dd {\r\n	float: left;\r\n	width: 10%;\r\n	border-left: none;\r\n	padding: 0 5px;\r\n	margin-left: 0;\r\n	font-size: 1.1em;\r\n}\r\n\r\nfieldset.polls dd.resultbar {\r\n	width: 50%;\r\n}\r\n\r\nfieldset.polls dd input {\r\n	margin: 2px 0;\r\n}\r\n\r\nfieldset.polls dd div {\r\n	text-align: right;\r\n	font-family: Arial, Helvetica, sans-serif;\r\n	color: #FFFFFF;\r\n	font-weight: bold;\r\n	padding: 0 2px;\r\n	overflow: visible;\r\n	min-width: 2%;\r\n}\r\n\r\n.pollbar1 {\r\n	background-color: #aaaaaa;\r\n	border-bottom: 1px solid #747474;\r\n	border-right: 1px solid #747474;\r\n}\r\n\r\n.pollbar2 {\r\n	background-color: #bebebe;\r\n	border-bottom: 1px solid #8c8c8c;\r\n	border-right: 1px solid #8c8c8c;\r\n}\r\n\r\n.pollbar3 {\r\n	background-color: #D1D1D1;\r\n	border-bottom: 1px solid #aaaaaa;\r\n	border-right: 1px solid #aaaaaa;\r\n}\r\n\r\n.pollbar4 {\r\n	background-color: #e4e4e4;\r\n	border-bottom: 1px solid #bebebe;\r\n	border-right: 1px solid #bebebe;\r\n}\r\n\r\n.pollbar5 {\r\n	background-color: #f8f8f8;\r\n	border-bottom: 1px solid #D1D1D1;\r\n	border-right: 1px solid #D1D1D1;\r\n}\r\n\r\n/* Poster profile block\r\n----------------------------------------*/\r\n.postprofile {\r\n	/* Also see tweaks.css */\r\n	margin: 5px 0 10px 0;\r\n	min-height: 80px;\r\n	color: #666666;\r\n	border-left: 1px solid #FFFFFF;\r\n	width: 22%;\r\n	float: right;\r\n	display: inline;\r\n}\r\n.pm .postprofile {\r\n	border-left: 1px solid #DDDDDD;\r\n}\r\n\r\n.postprofile dd, .postprofile dt {\r\n	line-height: 1.2em;\r\n	margin-left: 8px;\r\n}\r\n\r\n.postprofile strong {\r\n	font-weight: normal;\r\n	color: #000000;\r\n}\r\n\r\n.avatar {\r\n	border: none;\r\n	margin-bottom: 3px;\r\n}\r\n\r\n.online {\r\n	background-image: none;\r\n	background-position: 100% 0;\r\n	background-repeat: no-repeat;\r\n}\r\n\r\n/* Poster profile used by search*/\r\n.search .postprofile {\r\n	width: 30%;\r\n}\r\n\r\n/* pm list in compose message if mass pm is enabled */\r\ndl.pmlist dt {\r\n	width: 60% !important;\r\n}\r\n\r\ndl.pmlist dt textarea {\r\n	width: 95%;\r\n}\r\n\r\ndl.pmlist dd {\r\n	margin-left: 61% !important;\r\n	margin-bottom: 2px;\r\n}\r\n/* proSilver Button Styles\r\n---------------------------------------- */\r\n\r\n/* Rollover buttons\r\n   Based on: http://wellstyled.com/css-nopreload-rollovers.html\r\n----------------------------------------*/\r\n.buttons {\r\n	float: left;\r\n	width: auto;\r\n	height: auto;\r\n}\r\n\r\n/* Rollover state */\r\n.buttons div {\r\n	float: left;\r\n	margin: 0 5px 0 0;\r\n	background-position: 0 100%;\r\n}\r\n\r\n/* Rolloff state */\r\n.buttons div a {\r\n	display: block;\r\n	width: 100%;\r\n	height: 100%;\r\n	background-position: 0 0;\r\n	position: relative;\r\n	overflow: hidden;\r\n}\r\n\r\n/* Hide <a> text and hide off-state image when rolling over (prevents flicker in IE) */\r\n/*.buttons div span		{ display: none; }*/\r\n/*.buttons div a:hover	{ background-image: none; }*/\r\n.buttons div span			{ position: absolute; width: 100%; height: 100%; cursor: pointer;}\r\n.buttons div a:hover span	{ background-position: 0 100%; }\r\n\r\n/* Big button images */\r\n.reply-icon span	{ background: transparent none 0 0 no-repeat; }\r\n.post-icon span		{ background: transparent none 0 0 no-repeat; }\r\n.locked-icon span	{ background: transparent none 0 0 no-repeat; }\r\n.pmreply-icon span	{ background: none 0 0 no-repeat; }\r\n.newpm-icon span 	{ background: none 0 0 no-repeat; }\r\n.forwardpm-icon span 	{ background: none 0 0 no-repeat; }\r\n\r\n/* Set big button dimensions */\r\n.buttons div.reply-icon		{ width: {IMG_BUTTON_TOPIC_REPLY_WIDTH}px; height: {IMG_BUTTON_TOPIC_REPLY_HEIGHT}px; }\r\n.buttons div.post-icon		{ width: {IMG_BUTTON_TOPIC_NEW_WIDTH}px; height: {IMG_BUTTON_TOPIC_NEW_HEIGHT}px; }\r\n.buttons div.locked-icon	{ width: {IMG_BUTTON_TOPIC_LOCKED_WIDTH}px; height: {IMG_BUTTON_TOPIC_LOCKED_HEIGHT}px; }\r\n.buttons div.pmreply-icon	{ width: {IMG_BUTTON_PM_REPLY_WIDTH}px; height: {IMG_BUTTON_PM_REPLY_HEIGHT}px; }\r\n.buttons div.newpm-icon		{ width: {IMG_BUTTON_PM_NEW_WIDTH}px; height: {IMG_BUTTON_PM_NEW_HEIGHT}px; }\r\n.buttons div.forwardpm-icon	{ width: {IMG_BUTTON_PM_FORWARD_WIDTH}px; height: {IMG_BUTTON_PM_FORWARD_HEIGHT}px; }\r\n\r\n/* Sub-header (navigation bar)\r\n--------------------------------------------- */\r\na.print, a.sendemail, a.fontsize {\r\n	display: block;\r\n	overflow: hidden;\r\n	height: 18px;\r\n	text-indent: -5000px;\r\n	text-align: left;\r\n	background-repeat: no-repeat;\r\n}\r\n\r\na.print {\r\n	background-image: none;\r\n	width: 22px;\r\n}\r\n\r\na.sendemail {\r\n	background-image: none;\r\n	width: 22px;\r\n}\r\n\r\na.fontsize {\r\n	background-image: none;\r\n	background-position: 0 -1px;\r\n	width: 29px;\r\n}\r\n\r\na.fontsize:hover {\r\n	background-position: 0 -20px;\r\n	text-decoration: none;\r\n}\r\n\r\n/* Icon images\r\n---------------------------------------- */\r\n.sitehome, .icon-faq, .icon-members, .icon-home, .icon-ucp, .icon-register, .icon-logout,\r\n.icon-bookmark, .icon-bump, .icon-subscribe, .icon-unsubscribe, .icon-pages, .icon-search {\r\n	background-position: 0 50%;\r\n	background-repeat: no-repeat;\r\n	background-image: none;\r\n	padding: 1px 0 0 17px;\r\n}\r\n\r\n/* Poster profile icons\r\n----------------------------------------*/\r\nul.profile-icons {\r\n	padding-top: 10px;\r\n	list-style: none;\r\n}\r\n\r\n/* Rollover state */\r\nul.profile-icons li {\r\n	float: left;\r\n	margin: 0 6px 3px 0;\r\n	background-position: 0 100%;\r\n}\r\n\r\n/* Rolloff state */\r\nul.profile-icons li a {\r\n	display: block;\r\n	width: 100%;\r\n	height: 100%;\r\n	background-position: 0 0;\r\n}\r\n\r\n/* Hide <a> text and hide off-state image when rolling over (prevents flicker in IE) */\r\nul.profile-icons li span { display:none; }\r\nul.profile-icons li a:hover { background: none; }\r\n\r\n/* Positioning of moderator icons */\r\n.postbody ul.profile-icons {\r\n	float: right;\r\n	width: auto;\r\n	padding: 0;\r\n}\r\n\r\n.postbody ul.profile-icons li {\r\n	margin: 0 3px;\r\n}\r\n\r\n/* Profile & navigation icons */\r\n.email-icon, .email-icon a		{ background: none top left no-repeat; }\r\n.aim-icon, .aim-icon a			{ background: none top left no-repeat; }\r\n.yahoo-icon, .yahoo-icon a		{ background: none top left no-repeat; }\r\n.web-icon, .web-icon a			{ background: none top left no-repeat; }\r\n.msnm-icon, .msnm-icon a			{ background: none top left no-repeat; }\r\n.icq-icon, .icq-icon a			{ background: none top left no-repeat; }\r\n.jabber-icon, .jabber-icon a		{ background: none top left no-repeat; }\r\n.pm-icon, .pm-icon a				{ background: none top left no-repeat; }\r\n.quote-icon, .quote-icon a		{ background: none top left no-repeat; }\r\n\r\n/* Moderator icons */\r\n.report-icon, .report-icon a		{ background: none top left no-repeat; }\r\n.warn-icon, .warn-icon a			{ background: none top left no-repeat; }\r\n.edit-icon, .edit-icon a			{ background: none top left no-repeat; }\r\n.delete-icon, .delete-icon a		{ background: none top left no-repeat; }\r\n.info-icon, .info-icon a			{ background: none top left no-repeat; }\r\n\r\n/* Set profile icon dimensions */\r\nul.profile-icons li.email-icon		{ width: {IMG_ICON_CONTACT_EMAIL_WIDTH}px; height: {IMG_ICON_CONTACT_EMAIL_HEIGHT}px; }\r\nul.profile-icons li.aim-icon	{ width: {IMG_ICON_CONTACT_AIM_WIDTH}px; height: {IMG_ICON_CONTACT_AIM_HEIGHT}px; }\r\nul.profile-icons li.yahoo-icon	{ width: {IMG_ICON_CONTACT_YAHOO_WIDTH}px; height: {IMG_ICON_CONTACT_YAHOO_HEIGHT}px; }\r\nul.profile-icons li.web-icon	{ width: {IMG_ICON_CONTACT_WWW_WIDTH}px; height: {IMG_ICON_CONTACT_WWW_HEIGHT}px; }\r\nul.profile-icons li.msnm-icon	{ width: {IMG_ICON_CONTACT_MSNM_WIDTH}px; height: {IMG_ICON_CONTACT_MSNM_HEIGHT}px; }\r\nul.profile-icons li.icq-icon	{ width: {IMG_ICON_CONTACT_ICQ_WIDTH}px; height: {IMG_ICON_CONTACT_ICQ_HEIGHT}px; }\r\nul.profile-icons li.jabber-icon	{ width: {IMG_ICON_CONTACT_JABBER_WIDTH}px; height: {IMG_ICON_CONTACT_JABBER_HEIGHT}px; }\r\nul.profile-icons li.pm-icon		{ width: {IMG_ICON_CONTACT_PM_WIDTH}px; height: {IMG_ICON_CONTACT_PM_HEIGHT}px; }\r\nul.profile-icons li.quote-icon	{ width: {IMG_ICON_POST_QUOTE_WIDTH}px; height: {IMG_ICON_POST_QUOTE_HEIGHT}px; }\r\nul.profile-icons li.report-icon	{ width: {IMG_ICON_POST_REPORT_WIDTH}px; height: {IMG_ICON_POST_REPORT_HEIGHT}px; }\r\nul.profile-icons li.edit-icon	{ width: {IMG_ICON_POST_EDIT_WIDTH}px; height: {IMG_ICON_POST_EDIT_HEIGHT}px; }\r\nul.profile-icons li.delete-icon	{ width: {IMG_ICON_POST_DELETE_WIDTH}px; height: {IMG_ICON_POST_DELETE_HEIGHT}px; }\r\nul.profile-icons li.info-icon	{ width: {IMG_ICON_POST_INFO_WIDTH}px; height: {IMG_ICON_POST_INFO_HEIGHT}px; }\r\nul.profile-icons li.warn-icon	{ width: {IMG_ICON_USER_WARN_WIDTH}px; height: {IMG_ICON_USER_WARN_HEIGHT}px; }\r\n\r\n/* Fix profile icon default margins */\r\nul.profile-icons li.edit-icon	{ margin: 0 0 0 3px; }\r\nul.profile-icons li.quote-icon	{ margin: 0 0 0 10px; }\r\nul.profile-icons li.info-icon, ul.profile-icons li.report-icon	{ margin: 0 3px 0 0; }\r\n/* proSilver Control Panel Styles\r\n---------------------------------------- */\r\n\r\n\r\n/* Main CP box\r\n----------------------------------------*/\r\n#cp-menu {\r\n	float:left;\r\n	width: 19%;\r\n	margin-top: 1em;\r\n	margin-bottom: 5px;\r\n}\r\n\r\n#cp-main {\r\n	float: left;\r\n	width: 81%;\r\n}\r\n\r\n#cp-main .content {\r\n	padding: 0;\r\n}\r\n\r\n#cp-main h3, #cp-main hr, #cp-menu hr {\r\n	border-color: #bfbfbf;\r\n}\r\n\r\n#cp-main .panel p {\r\n	font-size: 1.1em;\r\n}\r\n\r\n#cp-main .panel ol {\r\n	margin-left: 2em;\r\n	font-size: 1.1em;\r\n}\r\n\r\n#cp-main .panel li.row {\r\n	border-bottom: 1px solid #cbcbcb;\r\n	border-top: 1px solid #F9F9F9;\r\n}\r\n\r\nul.cplist {\r\n	margin-bottom: 5px;\r\n	border-top: 1px solid #cbcbcb;\r\n}\r\n\r\n#cp-main .panel li.header dd, #cp-main .panel li.header dt {\r\n	color: #000000;\r\n	margin-bottom: 2px;\r\n}\r\n\r\n#cp-main table.table1 {\r\n	margin-bottom: 1em;\r\n}\r\n\r\n#cp-main table.table1 thead th {\r\n	color: #333333;\r\n	font-weight: bold;\r\n	border-bottom: 1px solid #333333;\r\n	padding: 5px;\r\n}\r\n\r\n#cp-main table.table1 tbody th {\r\n	font-style: italic;\r\n	background-color: transparent !important;\r\n	border-bottom: none;\r\n}\r\n\r\n#cp-main .pagination {\r\n	float: right;\r\n	width: auto;\r\n	padding-top: 1px;\r\n}\r\n\r\n#cp-main .postbody p {\r\n	font-size: 1.1em;\r\n}\r\n\r\n#cp-main .pm-message {\r\n	border: 1px solid #e2e2e2;\r\n	margin: 10px 0;\r\n	background-color: #FFFFFF;\r\n	width: auto;\r\n	float: none;\r\n}\r\n\r\n.pm-message h2 {\r\n	padding-bottom: 5px;\r\n}\r\n\r\n#cp-main .postbody h3, #cp-main .box2 h3 {\r\n	margin-top: 0;\r\n}\r\n\r\n#cp-main .buttons {\r\n	margin-left: 0;\r\n}\r\n\r\n#cp-main ul.linklist {\r\n	margin: 0;\r\n}\r\n\r\n/* MCP Specific tweaks */\r\n.mcp-main .postbody {\r\n	width: 100%;\r\n}\r\n\r\n/* CP tabbed menu\r\n----------------------------------------*/\r\n#tabs {\r\n	line-height: normal;\r\n	margin: 20px 0 -1px 7px;\r\n	min-width: 570px;\r\n}\r\n\r\n#tabs ul {\r\n	margin:0;\r\n	padding: 0;\r\n	list-style: none;\r\n}\r\n\r\n#tabs li {\r\n	display: inline;\r\n	margin: 0;\r\n	padding: 0;\r\n	font-size: 1em;\r\n	font-weight: bold;\r\n}\r\n\r\n#tabs a {\r\n	float: left;\r\n	background: none no-repeat 0% -35px;\r\n	margin: 0 1px 0 0;\r\n	padding: 0 0 0 5px;\r\n	text-decoration: none;\r\n	position: relative;\r\n	cursor: pointer;\r\n}\r\n\r\n#tabs a span {\r\n	float: left;\r\n	display: block;\r\n	background: none no-repeat 100% -35px;\r\n	padding: 6px 10px 6px 5px;\r\n	color: #828282;\r\n	white-space: nowrap;\r\n}\r\n\r\n#tabs a:hover span {\r\n	color: #bcbcbc;\r\n}\r\n\r\n#tabs .activetab a {\r\n	background-position: 0 0;\r\n	border-bottom: 1px solid #ebebeb;\r\n}\r\n\r\n#tabs .activetab a span {\r\n	background-position: 100% 0;\r\n	padding-bottom: 7px;\r\n	color: #333333;\r\n}\r\n\r\n#tabs a:hover {\r\n	background-position: 0 -70px;\r\n}\r\n\r\n#tabs a:hover span {\r\n	background-position:100% -70px;\r\n}\r\n\r\n#tabs .activetab a:hover {\r\n	background-position: 0 0;\r\n}\r\n\r\n#tabs .activetab a:hover span {\r\n	color: #000000;\r\n	background-position: 100% 0;\r\n}\r\n\r\n/* Mini tabbed menu used in MCP\r\n----------------------------------------*/\r\n#minitabs {\r\n	line-height: normal;\r\n	margin: -20px 7px 0 0;\r\n}\r\n\r\n#minitabs ul {\r\n	margin:0;\r\n	padding: 0;\r\n	list-style: none;\r\n}\r\n\r\n#minitabs li {\r\n	display: block;\r\n	float: right;\r\n	padding: 0 10px 4px 10px;\r\n	font-size: 1em;\r\n	font-weight: bold;\r\n	background-color: #f2f2f2;\r\n	margin-left: 2px;\r\n}\r\n\r\n#minitabs a {\r\n}\r\n\r\n#minitabs a:hover {\r\n	text-decoration: none;\r\n}\r\n\r\n#minitabs li.activetab {\r\n	background-color: #F9F9F9;\r\n}\r\n\r\n#minitabs li.activetab a, #minitabs li.activetab a:hover {\r\n	color: #333333;\r\n}\r\n\r\n/* UCP navigation menu\r\n----------------------------------------*/\r\n/* Container for sub-navigation list */\r\n#navigation {\r\n	width: 100%;\r\n	padding-top: 36px;\r\n}\r\n\r\n#navigation ul {\r\n	list-style:none;\r\n}\r\n\r\n/* Default list state */\r\n#navigation li {\r\n	margin: 1px 0;\r\n	padding: 0;\r\n	font-weight: bold;\r\n	display: inline;\r\n}\r\n\r\n/* Link styles for the sub-section links */\r\n#navigation a {\r\n	display: block;\r\n	padding: 5px;\r\n	margin: 1px 0;\r\n	text-decoration: none;\r\n	font-weight: bold;\r\n	color: #333;\r\n	background: #cfcfcf none repeat-y 100% 0;\r\n}\r\n\r\n#navigation a:hover {\r\n	text-decoration: none;\r\n	background-color: #c6c6c6;\r\n	color: #bcbcbc;\r\n	background-image: none;\r\n}\r\n\r\n#navigation #active-subsection a {\r\n	display: block;\r\n	color: #d3d3d3;\r\n	background-color: #F9F9F9;\r\n	background-image: none;\r\n}\r\n\r\n#navigation #active-subsection a:hover {\r\n	color: #d3d3d3;\r\n}\r\n\r\n/* Preferences pane layout\r\n----------------------------------------*/\r\n#cp-main h2 {\r\n	border-bottom: none;\r\n	padding: 0;\r\n	margin-left: 10px;\r\n	color: #333333;\r\n}\r\n\r\n#cp-main .panel {\r\n	background-color: #F9F9F9;\r\n}\r\n\r\n#cp-main .pm {\r\n	background-color: #FFFFFF;\r\n}\r\n\r\n#cp-main span.corners-top, #cp-menu span.corners-top {\r\n	background-image: none;\r\n}\r\n\r\n#cp-main span.corners-top span, #cp-menu span.corners-top span {\r\n	background-image: none;\r\n}\r\n\r\n#cp-main span.corners-bottom, #cp-menu span.corners-bottom {\r\n	background-image: none;\r\n}\r\n\r\n#cp-main span.corners-bottom span, #cp-menu span.corners-bottom span {\r\n	background-image: none;\r\n}\r\n\r\n/* Topicreview */\r\n#cp-main .panel #topicreview span.corners-top, #cp-menu .panel #topicreview span.corners-top {\r\n	background-image: none;\r\n}\r\n\r\n#cp-main .panel #topicreview span.corners-top span, #cp-menu .panel #topicreview span.corners-top span {\r\n	background-image: none;\r\n}\r\n\r\n#cp-main .panel #topicreview span.corners-bottom, #cp-menu .panel #topicreview span.corners-bottom {\r\n	background-image: none;\r\n}\r\n\r\n#cp-main .panel #topicreview span.corners-bottom span, #cp-menu .panel #topicreview span.corners-bottom span {\r\n	background-image: none;\r\n}\r\n\r\n/* Friends list */\r\n.cp-mini {\r\n	background-color: #f9f9f9;\r\n	padding: 0 5px;\r\n	margin: 10px 15px 10px 5px;\r\n}\r\n\r\n.cp-mini span.corners-top, .cp-mini span.corners-bottom {\r\n	margin: 0 -5px;\r\n}\r\n\r\ndl.mini dt {\r\n	font-weight: bold;\r\n	color: #676767;\r\n}\r\n\r\ndl.mini dd {\r\n	padding-top: 4px;\r\n}\r\n\r\n.friend-online {\r\n	font-weight: bold;\r\n}\r\n\r\n.friend-offline {\r\n	font-style: italic;\r\n}\r\n\r\n/* PM Styles\r\n----------------------------------------*/\r\n#pm-menu {\r\n	line-height: 2.5em;\r\n}\r\n\r\n/* PM Message history */\r\n.current {\r\n	color: #999999;\r\n}\r\n\r\n/* Defined rules list for PM options */\r\nol.def-rules {\r\n	padding-left: 0;\r\n}\r\n\r\nol.def-rules li {\r\n	line-height: 180%;\r\n	padding: 1px;\r\n}\r\n\r\n/* PM marking colours */\r\n.pmlist li.bg1 {\r\n	border: solid 3px transparent;\r\n	border-width: 0 3px;\r\n}\r\n\r\n.pmlist li.bg2 {\r\n	border: solid 3px transparent;\r\n	border-width: 0 3px;\r\n}\r\n\r\n.pmlist li.pm_message_reported_colour, .pm_message_reported_colour {\r\n	border-left-color: #bcbcbc;\r\n	border-right-color: #bcbcbc;\r\n}\r\n\r\n.pmlist li.pm_marked_colour, .pm_marked_colour {\r\n	border: solid 3px #ffffff;\r\n	border-width: 0 3px;\r\n}\r\n\r\n.pmlist li.pm_replied_colour, .pm_replied_colour {\r\n	border: solid 3px #c2c2c2;\r\n	border-width: 0 3px;	\r\n}\r\n\r\n.pmlist li.pm_friend_colour, .pm_friend_colour {\r\n	border: solid 3px #bdbdbd;\r\n	border-width: 0 3px;\r\n}\r\n\r\n.pmlist li.pm_foe_colour, .pm_foe_colour {\r\n	border: solid 3px #000000;\r\n	border-width: 0 3px;\r\n}\r\n\r\n.pm-legend {\r\n	border-left-width: 10px;\r\n	border-left-style: solid;\r\n	border-right-width: 0;\r\n	margin-bottom: 3px;\r\n	padding-left: 3px;\r\n}\r\n\r\n/* Avatar gallery */\r\n#gallery label {\r\n	position: relative;\r\n	float: left;\r\n	margin: 10px;\r\n	padding: 5px;\r\n	width: auto;\r\n	background: #FFFFFF;\r\n	border: 1px solid #CCC;\r\n	text-align: center;\r\n}\r\n\r\n#gallery label:hover {\r\n	background-color: #EEE;\r\n}\r\n/* proSilver Form Styles\r\n---------------------------------------- */\r\n\r\n/* General form styles\r\n----------------------------------------*/\r\nfieldset {\r\n	border-width: 0;\r\n	font-family: Verdana, Helvetica, Arial, sans-serif;\r\n	font-size: 1.1em;\r\n}\r\n\r\ninput {\r\n	font-weight: normal;\r\n	cursor: pointer;\r\n	vertical-align: middle;\r\n	padding: 0 3px;\r\n	font-size: 1em;\r\n	font-family: Verdana, Helvetica, Arial, sans-serif;\r\n}\r\n\r\nselect {\r\n	font-family: Verdana, Helvetica, Arial, sans-serif;\r\n	font-weight: normal;\r\n	cursor: pointer;\r\n	vertical-align: middle;\r\n	border: 1px solid #666666;\r\n	padding: 1px;\r\n	background-color: #FAFAFA;\r\n}\r\n\r\noption {\r\n	padding-right: 1em;\r\n}\r\n\r\noption.disabled-option {\r\n	color: graytext;\r\n}\r\n\r\ntextarea {\r\n	font-family: "Lucida Grande", Verdana, Helvetica, Arial, sans-serif;\r\n	width: 60%;\r\n	padding: 2px;\r\n	font-size: 1em;\r\n	line-height: 1.4em;\r\n}\r\n\r\nlabel {\r\n	cursor: default;\r\n	padding-right: 5px;\r\n	color: #676767;\r\n}\r\n\r\nlabel input {\r\n	vertical-align: middle;\r\n}\r\n\r\nlabel img {\r\n	vertical-align: middle;\r\n}\r\n\r\n/* Definition list layout for forms\r\n---------------------------------------- */\r\nfieldset dl {\r\n	padding: 4px 0;\r\n}\r\n\r\nfieldset dt {\r\n	float: left;	\r\n	width: 40%;\r\n	text-align: left;\r\n	display: block;\r\n}\r\n\r\nfieldset dd {\r\n	margin-left: 41%;\r\n	vertical-align: top;\r\n	margin-bottom: 3px;\r\n}\r\n\r\n/* Specific layout 1 */\r\nfieldset.fields1 dt {\r\n	width: 15em;\r\n	border-right-width: 0;\r\n}\r\n\r\nfieldset.fields1 dd {\r\n	margin-left: 15em;\r\n	border-left-width: 0;\r\n}\r\n\r\nfieldset.fields1 {\r\n	background-color: transparent;\r\n}\r\n\r\nfieldset.fields1 div {\r\n	margin-bottom: 3px;\r\n}\r\n\r\n/* Specific layout 2 */\r\nfieldset.fields2 dt {\r\n	width: 15em;\r\n	border-right-width: 0;\r\n}\r\n\r\nfieldset.fields2 dd {\r\n	margin-left: 16em;\r\n	border-left-width: 0;\r\n}\r\n\r\n/* Form elements */\r\ndt label {\r\n	font-weight: bold;\r\n	text-align: left;\r\n}\r\n\r\ndd label {\r\n	white-space: nowrap;\r\n	color: #333;\r\n}\r\n\r\ndd input, dd textarea {\r\n	margin-right: 3px;\r\n}\r\n\r\ndd select {\r\n	width: auto;\r\n}\r\n\r\ndd textarea {\r\n	width: 85%;\r\n}\r\n\r\n/* Hover effects */\r\nfieldset dl:hover dt label {\r\n	color: #000000;\r\n}\r\n\r\nfieldset.fields2 dl:hover dt label {\r\n	color: inherit;\r\n}\r\n\r\n#timezone {\r\n	width: 95%;\r\n}\r\n\r\n* html #timezone {\r\n	width: 50%;\r\n}\r\n\r\n/* Quick-login on index page */\r\nfieldset.quick-login {\r\n	margin-top: 5px;\r\n}\r\n\r\nfieldset.quick-login input {\r\n	width: auto;\r\n}\r\n\r\nfieldset.quick-login input.inputbox {\r\n	width: 15%;\r\n	vertical-align: middle;\r\n	margin-right: 5px;\r\n	background-color: #f3f3f3;\r\n}\r\n\r\nfieldset.quick-login label {\r\n	white-space: nowrap;\r\n	padding-right: 2px;\r\n}\r\n\r\n/* Display options on viewtopic/viewforum pages  */\r\nfieldset.display-options {\r\n	text-align: center;\r\n	margin: 3px 0 5px 0;\r\n}\r\n\r\nfieldset.display-options label {\r\n	white-space: nowrap;\r\n	padding-right: 2px;\r\n}\r\n\r\nfieldset.display-options a {\r\n	margin-top: 3px;\r\n}\r\n\r\n/* Display actions for ucp and mcp pages */\r\nfieldset.display-actions {\r\n	text-align: right;\r\n	line-height: 2em;\r\n	white-space: nowrap;\r\n	padding-right: 1em;\r\n}\r\n\r\nfieldset.display-actions label {\r\n	white-space: nowrap;\r\n	padding-right: 2px;\r\n}\r\n\r\nfieldset.sort-options {\r\n	line-height: 2em;\r\n}\r\n\r\n/* MCP forum selection*/\r\nfieldset.forum-selection {\r\n	margin: 5px 0 3px 0;\r\n	float: right;\r\n}\r\n\r\nfieldset.forum-selection2 {\r\n	margin: 13px 0 3px 0;\r\n	float: right;\r\n}\r\n\r\n/* Jumpbox */\r\nfieldset.jumpbox {\r\n	text-align: right;\r\n	margin-top: 15px;\r\n	height: 2.5em;\r\n}\r\n\r\nfieldset.quickmod {\r\n	width: 50%;\r\n	float: right;\r\n	text-align: right;\r\n	height: 2.5em;\r\n}\r\n\r\n/* Submit button fieldset */\r\nfieldset.submit-buttons {\r\n	text-align: center;\r\n	vertical-align: middle;\r\n	margin: 5px 0;\r\n}\r\n\r\nfieldset.submit-buttons input {\r\n	vertical-align: middle;\r\n	padding-top: 3px;\r\n	padding-bottom: 3px;\r\n}\r\n\r\n/* Posting page styles\r\n----------------------------------------*/\r\n\r\n/* Buttons used in the editor */\r\n#format-buttons {\r\n	margin: 15px 0 2px 0;\r\n}\r\n\r\n#format-buttons input, #format-buttons select {\r\n	vertical-align: middle;\r\n}\r\n\r\n/* Main message box */\r\n#message-box {\r\n	width: 80%;\r\n}\r\n\r\n#message-box textarea {\r\n	font-family: "Trebuchet MS", Verdana, Helvetica, Arial, sans-serif;\r\n	width: 100%;\r\n	font-size: 1.2em;\r\n	color: #333333;\r\n}\r\n\r\n/* Emoticons panel */\r\n#smiley-box {\r\n	width: 18%;\r\n	float: right;\r\n}\r\n\r\n#smiley-box img {\r\n	margin: 3px;\r\n}\r\n\r\n/* Input field styles\r\n---------------------------------------- */\r\n.inputbox {\r\n	background-color: #FFFFFF;\r\n	border: 1px solid #c0c0c0;\r\n	color: #333333;\r\n	padding: 2px;\r\n	cursor: text;\r\n}\r\n\r\n.inputbox:hover {\r\n	border: 1px solid #eaeaea;\r\n}\r\n\r\n.inputbox:focus {\r\n	border: 1px solid #eaeaea;\r\n	color: #4b4b4b;\r\n}\r\n\r\ninput.inputbox	{ width: 85%; }\r\ninput.medium	{ width: 50%; }\r\ninput.narrow	{ width: 25%; }\r\ninput.tiny		{ width: 125px; }\r\n\r\ntextarea.inputbox {\r\n	width: 85%;\r\n}\r\n\r\n.autowidth {\r\n	width: auto !important;\r\n}\r\n\r\n/* Form button styles\r\n---------------------------------------- */\r\ninput.button1, input.button2 {\r\n	font-size: 1em;\r\n}\r\n\r\na.button1, input.button1, input.button3, a.button2, input.button2 {\r\n	width: auto !important;\r\n	padding-top: 1px;\r\n	padding-bottom: 1px;\r\n	font-family: "Lucida Grande", Verdana, Helvetica, Arial, sans-serif;\r\n	color: #000;\r\n	background: #FAFAFA none repeat-x top;\r\n}\r\n\r\na.button1, input.button1 {\r\n	font-weight: bold;\r\n	border: 1px solid #666666;\r\n}\r\n\r\ninput.button3 {\r\n	padding: 0;\r\n	margin: 0;\r\n	line-height: 5px;\r\n	height: 12px;\r\n	background-image: none;\r\n	font-variant: small-caps;\r\n}\r\n\r\n/* Alternative button */\r\na.button2, input.button2, input.button3 {\r\n	border: 1px solid #666666;\r\n}\r\n\r\n/* <a> button in the style of the form buttons */\r\na.button1, a.button1:link, a.button1:visited, a.button1:active, a.button2, a.button2:link, a.button2:visited, a.button2:active {\r\n	text-decoration: none;\r\n	color: #000000;\r\n	padding: 2px 8px;\r\n	line-height: 250%;\r\n	vertical-align: text-bottom;\r\n	background-position: 0 1px;\r\n}\r\n\r\n/* Hover states */\r\na.button1:hover, input.button1:hover, a.button2:hover, input.button2:hover, input.button3:hover {\r\n	border: 1px solid #BCBCBC;\r\n	background-position: 0 100%;\r\n	color: #BCBCBC;\r\n}\r\n\r\ninput.disabled {\r\n	font-weight: normal;\r\n	color: #666666;\r\n}\r\n\r\n/* Topic and forum Search */\r\n.search-box {\r\n	margin-top: 3px;\r\n	margin-left: 5px;\r\n	float: left;\r\n}\r\n\r\n.search-box input {\r\n}\r\n\r\ninput.search {\r\n	background-image: none;\r\n	background-repeat: no-repeat;\r\n	background-position: left 1px;\r\n	padding-left: 17px;\r\n}\r\n\r\n.full { width: 95%; }\r\n.medium { width: 50%;}\r\n.narrow { width: 25%;}\r\n.tiny { width: 10%;}\r\n/* proSilver Style Sheet Tweaks\r\n\r\nThese style definitions are mainly IE specific \r\ntweaks required due to its poor CSS support.\r\n-------------------------------------------------*/\r\n\r\n* html table, * html select, * html input { font-size: 100%; }\r\n* html hr { margin: 0; }\r\n* html span.corners-top, * html span.corners-bottom { background-image: url("{T_THEME_PATH}/images/corners_left.gif"); }\r\n* html span.corners-top span, * html span.corners-bottom span { background-image: url("{T_THEME_PATH}/images/corners_right.gif"); }\r\n\r\ntable.table1 {\r\n	width: 99%;		/* IE < 6 browsers */\r\n	/* Tantek hack */\r\n	voice-family: "\\"}\\"";\r\n	voice-family: inherit;\r\n	width: 100%;\r\n}\r\nhtml>body table.table1 { width: 100%; }	/* Reset 100% for opera */\r\n\r\n* html ul.topiclist li { position: relative; }\r\n* html .postbody h3 img { vertical-align: middle; }\r\n\r\n/* Form styles */\r\nhtml>body dd label input { vertical-align: text-bottom; }	/* Align checkboxes/radio buttons nicely */\r\n\r\n* html input.button1, * html input.button2 {\r\n	padding-bottom: 0;\r\n	margin-bottom: 1px;\r\n}\r\n\r\n/* Misc layout styles */\r\n* html .column1, * html .column2 { width: 45%; }\r\n\r\n/* Nice method for clearing floated blocks without having to insert any extra markup (like spacer above)\r\n   From http://www.positioniseverything.net/easyclearing.html \r\n#tabs:after, #minitabs:after, .post:after, .navbar:after, fieldset dl:after, ul.topiclist dl:after, ul.linklist:after, dl.polls:after {\r\n	content: "."; \r\n	display: block; \r\n	height: 0; \r\n	clear: both; \r\n	visibility: hidden;\r\n}*/\r\n\r\n.clearfix, #tabs, #minitabs, fieldset dl, ul.topiclist dl, dl.polls {\r\n	height: 1%;\r\n	overflow: hidden;\r\n}\r\n\r\n/* viewtopic fix */\r\n* html .post {\r\n	height: 25%;\r\n	overflow: hidden;\r\n}\r\n\r\n/* navbar fix */\r\n* html .clearfix, * html .navbar, ul.linklist {\r\n	height: 4%;\r\n	overflow: hidden;\r\n}\r\n\r\n/* Simple fix so forum and topic lists always have a min-height set, even in IE6\r\n	From http://www.dustindiaz.com/min-height-fast-hack */\r\ndl.icon {\r\n	min-height: 35px;\r\n	height: auto !important;\r\n	height: 35px;\r\n}\r\n\r\n* html #search-box {\r\n	width: 25%;\r\n}\r\n\r\n/* Correctly clear floating for details on profile view */\r\n*:first-child+html dl.details dd {\r\n	margin-left: 30%;\r\n	float: none;\r\n}\r\n\r\n* html dl.details dd {\r\n	margin-left: 30%;\r\n	float: none;\r\n}\r\n/*  	\r\n--------------------------------------------------------------\r\nColours and backgrounds for common.css\r\n-------------------------------------------------------------- */\r\n\r\nhtml, body {\r\n	color: #b17601;\r\n	background-image: url({T_THEME_PATH}/images/sfondo.gif);\r\n	background-repeat: repeat-x;\r\n	background-attachment: fixed;\r\n	background-color: #F7C457;\r\n}\r\n\r\nh1 {\r\n	color: #FFFFFF;\r\n}\r\n\r\nh2 {\r\n	color: #28313F;\r\n}\r\n\r\nh3 {\r\n	border-bottom-color: #CCCCCC;\r\n	color: #916001;\r\n}\r\n\r\nhr {\r\n	border-color: #FFFFFF;\r\n	border-top-color: #CCCCCC;\r\n}\r\n\r\nhr.dashed {\r\n	border-top-color: #CCCCCC;\r\n}\r\n\r\n/* Search box\r\n--------------------------------------------- */\r\n\r\n#search-box {\r\n	color: #FFFFFF;\r\n}\r\n\r\n#search-box #keywords {\r\n	background-color: #FFF;\r\n}\r\n\r\n#search-box input {\r\n	border-color: #0075B0;\r\n}\r\n\r\n/* Round cornered boxes and backgrounds\r\n---------------------------------------- */\r\n.headerbar {\r\n	background-color: #b68117;\r\n	background-image: url("{T_THEME_PATH}/images/bg_header.gif");\r\n	color: #FFFFFF;\r\n}\r\n\r\n.navbar {\r\n	background-color: #f5b847;\r\n}\r\n\r\n.forabg {\r\n	background-color: #b78217;\r\n	background-image: url("{T_THEME_PATH}/images/bg_list.gif");\r\n}\r\n\r\n.forumbg {\r\n	background-color: #b68117;\r\n	background-image: url("{T_THEME_PATH}/images/bg_header.gif");\r\n}\r\n\r\n.panel {\r\n	background-color: #fbc27b;\r\n	color: #28313F;\r\n}\r\n\r\n.post:target .content {\r\n	color: #000000;\r\n}\r\n\r\n.post:target h3 a {\r\n	color: #000000;\r\n}\r\n\r\n.bg1	{ background-color: #e9e6e0; }\r\n.bg2	{ background-color: #f0eeea;  }\r\n.bg3	{ background-color: #f5b847; }\r\n\r\n.ucprowbg {\r\n	background-color: #DCDEE2;\r\n}\r\n\r\n.fieldsbg {\r\n	background-color: #E7E8EA;\r\n}\r\n\r\nspan.corners-top {\r\n	background-image: url("{T_THEME_PATH}/images/corners_left.png");\r\n}\r\n\r\nspan.corners-top span {\r\n	background-image: url("{T_THEME_PATH}/images/corners_right.png");\r\n}\r\n\r\nspan.corners-bottom {\r\n	background-image: url("{T_THEME_PATH}/images/corners_left.png");\r\n}\r\n\r\nspan.corners-bottom span {\r\n	background-image: url("{T_THEME_PATH}/images/corners_right.png");\r\n}\r\n\r\n\r\n/* Horizontal lists\r\n----------------------------------------*/\r\n\r\nul.navlinks {\r\n	border-bottom-color: #FFFFFF;\r\n}\r\n\r\n/* Table styles\r\n----------------------------------------*/\r\ntable.table1 thead th {\r\n	color: #FFFFFF;\r\n}\r\n\r\ntable.table1 tbody tr {\r\n	border-color: #BFC1CF;\r\n}\r\n\r\ntable.table1 tbody tr:hover, table.table1 tbody tr.hover {\r\n	background-color: #eae8e3;\r\n	color: #000;\r\n}\r\n\r\ntable.table1 td {\r\n	color: #b17601;\r\n}\r\n\r\ntable.table1 tbody td {\r\n	border-top-color: #FAFAFA;\r\n}\r\n\r\ntable.table1 tbody th {\r\n	border-bottom-color: #000000;\r\n	color: #333333;\r\n	background-color: #FFFFFF;\r\n}\r\n\r\ntable.info tbody th {\r\n	color: #000000;\r\n}\r\n\r\n/* Misc layout styles\r\n---------------------------------------- */\r\ndl.details dt {\r\n	color: #000000;\r\n}\r\n\r\ndl.details dd {\r\n	color: #b17601;\r\n}\r\n\r\n.sep {\r\n	color: #1198D9;\r\n}\r\n\r\n/* Pagination\r\n---------------------------------------- */\r\n\r\n.pagination span strong {\r\n	color: #FFFFFF;\r\n	background-color: #4692BF;\r\n	border-color: #4692BF;\r\n}\r\n\r\n.pagination span a, .pagination span a:link, .pagination span a:visited, .pagination span a:active {\r\n	color: #5C758C;\r\n	background-color: #ECEDEE;\r\n	border-color: #B4BAC0;\r\n}\r\n\r\n.pagination span a:hover {\r\n	border-color: #368AD2;\r\n	background-color: #368AD2;\r\n	color: #FFF;\r\n}\r\n\r\n/* Pagination in viewforum for multipage topics */\r\n.row .pagination {\r\n	background-image: url("{T_THEME_PATH}/images/icon_pages.gif");\r\n}\r\n\r\n.row .pagination span a, li.pagination span a {\r\n	background-color: #FFFFFF;\r\n}\r\n\r\n.row .pagination span a:hover, li.pagination span a:hover {\r\n	background-color: #368AD2;\r\n}\r\n\r\n/* Miscellaneous styles\r\n---------------------------------------- */\r\n\r\n.copyright {\r\n	color: #555555;\r\n}\r\n\r\n.error {\r\n	color: #dd9d1c;\r\n}\r\n\r\n.reported {\r\n	background-color: #F7ECEF;\r\n}\r\n\r\nli.reported:hover {\r\n	background-color: #ECD5D8 !important;\r\n}\r\n.sticky, .announce {\r\n	/* you can add a background for stickies and announcements*/\r\n}\r\n\r\ndiv.rules {\r\n	background-color: #ECD5D8;\r\n	color: #dd9d1c;\r\n}\r\n\r\np.rules {\r\n	background-color: #ECD5D8;\r\n	background-image: none;\r\n}\r\n\r\n/*  	\r\n--------------------------------------------------------------\r\nColours and backgrounds for links.css\r\n-------------------------------------------------------------- */\r\n\r\na:link	{ color: #916001; }\r\na:visited	{ color: #916001; }\r\na:hover	{ color: #8f5f00; }\r\na:active	{ color: #368AD2; }\r\n\r\n/* Links on gradient backgrounds */\r\n#search-box a:link, .navbg a:link, .forumbg .header a:link, .forabg .header a:link, th a:link {\r\n	color: #FFFFFF;\r\n}\r\n\r\n#search-box a:visited, .navbg a:visited, .forumbg .header a:visited, .forabg .header a:visited, th a:visited {\r\n	color: #FFFFFF;\r\n}\r\n\r\n#search-box a:hover, .navbg a:hover, .forumbg .header a:hover, .forabg .header a:hover, th a:hover {\r\n	color: #A8D8FF;\r\n}\r\n\r\n#search-box a:active, .navbg a:active, .forumbg .header a:active, .forabg .header a:active, th a:active {\r\n	color: #C8E6FF;\r\n}\r\n\r\n/* Links for forum/topic lists */\r\na.forumtitle {\r\n	color: #916001;\r\n}\r\n\r\n/* a.forumtitle:visited { color: #916001; } */\r\n\r\na.forumtitle:hover {\r\n	color: #dd9d1c;\r\n}\r\n\r\na.forumtitle:active {\r\n	color: #916001;\r\n}\r\n\r\na.topictitle {\r\n	color: #916001;\r\n}\r\n\r\n/* a.topictitle:visited { color: #368AD2; } */\r\n\r\na.topictitle:hover {\r\n	color: #dd9d1c;\r\n}\r\n\r\na.topictitle:active {\r\n	color: #916001;\r\n}\r\n\r\n/* Post body links */\r\n.postlink {\r\n	color: #368AD2;\r\n	border-bottom-color: #368AD2;\r\n}\r\n\r\n.postlink:visited {\r\n	color: #5D8FBD;\r\n	border-bottom-color: #666666;\r\n}\r\n\r\n.postlink:active {\r\n	color: #368AD2;\r\n}\r\n\r\n.postlink:hover {\r\n	background-color: #D0E4F6;\r\n	color: #0D4473;\r\n}\r\n\r\n.signature a, .signature a:visited, .signature a:active, .signature a:hover {\r\n	background-color: transparent;\r\n}\r\n\r\n/* Profile links */\r\n.postprofile a:link, .postprofile a:active, .postprofile a:visited, .postprofile dt.author a {\r\n	color: #916001;\r\n}\r\n\r\n.postprofile a:hover, .postprofile dt.author a:hover {\r\n	color: #8f5f00;\r\n}\r\n\r\n/* Profile searchresults */	\r\n.search .postprofile a {\r\n	color: #916001;\r\n}\r\n\r\n.search .postprofile a:hover {\r\n	color: #8f5f00;\r\n}\r\n\r\n/* Back to top of page */\r\na.top {\r\n	background-image: url("{IMG_ICON_BACK_TOP_SRC}");\r\n}\r\n\r\na.top2 {\r\n	background-image: url("{IMG_ICON_BACK_TOP_SRC}");\r\n}\r\n\r\n/* Arrow links  */\r\na.up		{ background-image: url("{T_THEME_PATH}/images/arrow_up.gif") }\r\na.down		{ background-image: url("{T_THEME_PATH}/images/arrow_down.gif") }\r\na.left		{ background-image: url("{T_THEME_PATH}/images/arrow_left.gif") }\r\na.right		{ background-image: url("{T_THEME_PATH}/images/arrow_right.gif") }\r\n\r\na.up:hover {\r\n	background-color: transparent;\r\n}\r\n\r\na.left:hover {\r\n	color: #368AD2;\r\n}\r\n\r\na.right:hover {\r\n	color: #368AD2;\r\n}\r\n\r\n\r\n/*  	\r\n--------------------------------------------------------------\r\nColours and backgrounds for content.css\r\n-------------------------------------------------------------- */\r\n\r\nul.forums {\r\n	background-color: #eef5f9;\r\n	background-image: url("{T_THEME_PATH}/images/gradient.gif");\r\n}\r\n\r\nul.topiclist li {\r\n	color: #c18102;\r\n}\r\n\r\nul.topiclist dd {\r\n	border-left-color: #FFFFFF;\r\n}\r\n\r\n.rtl ul.topiclist dd {\r\n	border-right-color: #fff;\r\n	border-left-color: transparent;\r\n}\r\n\r\nul.topiclist li.row dt a.subforum.read {\r\n	background-image: url("{IMG_SUBFORUM_READ_SRC}");\r\n}\r\n\r\nul.topiclist li.row dt a.subforum.unread {\r\n	background-image: url("{IMG_SUBFORUM_UNREAD_SRC}");\r\n}\r\n\r\nli.row {\r\n	border-top-color:  #FFFFFF;\r\n	border-bottom-color: #c78d19;\r\n}\r\n\r\nli.row strong {\r\n	color: #000000;\r\n}\r\n\r\nli.row:hover {\r\n	background-color: #F6F4D0;\r\n}\r\n\r\nli.row:hover dd {\r\n	border-left-color: #CCCCCC;\r\n}\r\n\r\n.rtl li.row:hover dd {\r\n	border-right-color: #CCCCCC;\r\n	border-left-color: transparent;\r\n}\r\n\r\nli.header dt, li.header dd {\r\n	color: #FFFFFF;\r\n}\r\n\r\n/* Forum list column styles */\r\nul.topiclist dd.searchextra {\r\n	color: #333333;\r\n}\r\n\r\n/* Post body styles\r\n----------------------------------------*/\r\n.postbody {\r\n	color: #333333;\r\n}\r\n\r\n/* Content container styles\r\n----------------------------------------*/\r\n.content {\r\n	color: #333333;\r\n}\r\n\r\n.content h2, .panel h2 {\r\n	color: #916001;\r\n	border-bottom-color:  #CCCCCC;\r\n}\r\n\r\ndl.faq dt {\r\n	color: #333333;\r\n}\r\n\r\n.posthilit {\r\n	background-color: #F3BFCC;\r\n	color: #dd9d1c;\r\n}\r\n\r\n/* Post signature */\r\n.signature {\r\n	border-top-color: #CCCCCC;\r\n}\r\n\r\n/* Post noticies */\r\n.notice {\r\n	border-top-color:  #CCCCCC;\r\n}\r\n\r\n/* BB Code styles\r\n----------------------------------------*/\r\n/* Quote block */\r\nblockquote {\r\n	background-color: #EBEADD;\r\n	background-image: url("{T_THEME_PATH}/images/quote.gif");\r\n	border-color:#DBDBCE;\r\n}\r\n\r\nblockquote blockquote {\r\n	/* Nested quotes */\r\n	background-color:#EFEED9;\r\n}\r\n\r\nblockquote blockquote blockquote {\r\n	/* Nested quotes */\r\n	background-color: #EBEADD;\r\n}\r\n\r\n/* Code block */\r\ndl.codebox {\r\n	background-color: #FFFFFF;\r\n	border-color: #C9D2D8;\r\n}\r\n\r\ndl.codebox dt {\r\n	border-bottom-color:  #CCCCCC;\r\n}\r\n\r\ndl.codebox code {\r\n	color: #2E8B57;\r\n}\r\n\r\n.syntaxbg		{ color: #FFFFFF; }\r\n.syntaxcomment	{ color: #FF8000; }\r\n.syntaxdefault	{ color: #0000BB; }\r\n.syntaxhtml		{ color: #000000; }\r\n.syntaxkeyword	{ color: #007700; }\r\n.syntaxstring	{ color: #DD0000; }\r\n\r\n/* Attachments\r\n----------------------------------------*/\r\n.attachbox {\r\n	background-color: #FFFFFF;\r\n	border-color:  #C9D2D8;\r\n}\r\n\r\n.pm-message .attachbox {\r\n	background-color: #F2F3F3;\r\n}\r\n\r\n.attachbox dd {\r\n	border-top-color: #C9D2D8;\r\n}\r\n\r\n.attachbox p {\r\n	color: #666666;\r\n}\r\n\r\n.attachbox p.stats {\r\n	color: #666666;\r\n}\r\n\r\n.attach-image img {\r\n	border-color: #999999;\r\n}\r\n\r\n/* Inline image thumbnails */\r\n\r\ndl.file dd {\r\n	color: #666666;\r\n}\r\n\r\ndl.thumbnail img {\r\n	border-color: #666666;\r\n	background-color: #FFFFFF;\r\n}\r\n\r\ndl.thumbnail dd {\r\n	color: #666666;\r\n}\r\n\r\ndl.thumbnail dt a:hover {\r\n	background-color: #EEEEEE;\r\n}\r\n\r\ndl.thumbnail dt a:hover img {\r\n	border-color: #368AD2;\r\n}\r\n\r\n/* Post poll styles\r\n----------------------------------------*/\r\n\r\nfieldset.polls dl {\r\n	border-top-color: #DCDEE2;\r\n	color: #666666;\r\n}\r\n\r\nfieldset.polls dl.voted {\r\n	color: #000000;\r\n}\r\n\r\nfieldset.polls dd div {\r\n	color: #FFFFFF;\r\n}\r\n\r\n.rtl .pollbar1, .rtl .pollbar2, .rtl .pollbar3, .rtl .pollbar4, .rtl .pollbar5 {\r\n	border-right-color: transparent;\r\n}\r\n\r\n.pollbar1 {\r\n	background-color: #AA2346;\r\n	border-bottom-color: #74162C;\r\n	border-right-color: #74162C;\r\n}\r\n\r\n.rtl .pollbar1 {\r\n	border-left-color: #74162C;\r\n}\r\n\r\n.pollbar2 {\r\n	background-color: #BE1E4A;\r\n	border-bottom-color: #8C1C38;\r\n	border-right-color: #8C1C38;\r\n}\r\n\r\n.rtl .pollbar2 {\r\n	border-left-color: #8C1C38;\r\n}\r\n\r\n.pollbar3 {\r\n	background-color: #D11A4E;\r\n	border-bottom-color: #AA2346;\r\n	border-right-color: #AA2346;\r\n}\r\n\r\n.rtl .pollbar3 {\r\n	border-left-color: #AA2346;\r\n}\r\n\r\n.pollbar4 {\r\n	background-color: #E41653;\r\n	border-bottom-color: #BE1E4A;\r\n	border-right-color: #BE1E4A;\r\n}\r\n\r\n.rtl .pollbar4 {\r\n	border-left-color: #BE1E4A;\r\n}\r\n\r\n.pollbar5 {\r\n	background-color: #F81157;\r\n	border-bottom-color: #D11A4E;\r\n	border-right-color: #D11A4E;\r\n}\r\n\r\n.rtl .pollbar5 {\r\n	border-left-color: #D11A4E;\r\n}\r\n\r\n/* Poster profile block\r\n----------------------------------------*/\r\n.postprofile {\r\n	color: #666666;\r\n	border-left-color: #FFFFFF;\r\n}\r\n\r\n.rtl .postprofile {\r\n	border-right-color: #FFFFFF;\r\n	border-left-color: transparent;\r\n}\r\n\r\n.pm .postprofile {\r\n	border-left-color: #DDDDDD;\r\n}\r\n\r\n.rtl .pm .postprofile {\r\n	border-right-color: #DDDDDD;\r\n	border-left-color: transparent;\r\n}\r\n\r\n.postprofile strong {\r\n	color: #000000;\r\n}\r\n\r\n.online {\r\n	background-image: url("{T_IMAGESET_LANG_PATH}/icon_user_online.gif");\r\n}\r\n\r\n/*  	\r\n--------------------------------------------------------------\r\nColours and backgrounds for buttons.css\r\n-------------------------------------------------------------- */\r\n\r\n/* Big button images */\r\n.reply-icon span	{ background-image: url("{IMG_BUTTON_TOPIC_REPLY_SRC}"); }\r\n.post-icon span		{ background-image: url("{IMG_BUTTON_TOPIC_NEW_SRC}"); }\r\n.locked-icon span	{ background-image: url("{IMG_BUTTON_TOPIC_LOCKED_SRC}"); }\r\n.pmreply-icon span	{ background-image: url("{IMG_BUTTON_PM_REPLY_SRC}") ;}\r\n.newpm-icon span 	{ background-image: url("{IMG_BUTTON_PM_NEW_SRC}") ;}\r\n.forwardpm-icon span	{ background-image: url("{IMG_BUTTON_PM_FORWARD_SRC}") ;}\r\n\r\na.print {\r\n	background-image: url("{T_THEME_PATH}/images/icon_print.gif");\r\n}\r\n\r\na.sendemail {\r\n	background-image: url("{T_THEME_PATH}/images/icon_sendemail.gif");\r\n}\r\n\r\na.fontsize {\r\n	background-image: url("{T_THEME_PATH}/images/icon_fontsize.gif");\r\n}\r\n\r\n/* Icon images\r\n---------------------------------------- */\r\n.sitehome						{ background-image: url("{T_THEME_PATH}/images/icon_home.gif"); }\r\n.icon-faq						{ background-image: url("{T_THEME_PATH}/images/icon_faq.gif"); }\r\n.icon-members					{ background-image: url("{T_THEME_PATH}/images/icon_members.gif"); }\r\n.icon-home						{ background-image: url("{T_THEME_PATH}/images/icon_home.gif"); }\r\n.icon-ucp						{ background-image: url("{T_THEME_PATH}/images/icon_ucp.gif"); }\r\n.icon-register					{ background-image: url("{T_THEME_PATH}/images/icon_register.gif"); }\r\n.icon-logout					{ background-image: url("{T_THEME_PATH}/images/icon_logout.gif"); }\r\n.icon-bookmark					{ background-image: url("{T_THEME_PATH}/images/icon_bookmark.gif"); }\r\n.icon-bump						{ background-image: url("{T_THEME_PATH}/images/icon_bump.gif"); }\r\n.icon-subscribe					{ background-image: url("{T_THEME_PATH}/images/icon_subscribe.gif"); }\r\n.icon-unsubscribe				{ background-image: url("{T_THEME_PATH}/images/icon_unsubscribe.gif"); }\r\n.icon-pages						{ background-image: url("{T_THEME_PATH}/images/icon_pages.gif"); }\r\n.icon-search					{ background-image: url("{T_THEME_PATH}/images/icon_search.gif"); }\r\n\r\n/* Profile & navigation icons */\r\n.email-icon, .email-icon a		{ background-image: url("{IMG_ICON_CONTACT_EMAIL_SRC}"); }\r\n.aim-icon, .aim-icon a			{ background-image: url("{IMG_ICON_CONTACT_AIM_SRC}"); }\r\n.yahoo-icon, .yahoo-icon a		{ background-image: url("{IMG_ICON_CONTACT_YAHOO_SRC}"); }\r\n.web-icon, .web-icon a			{ background-image: url("{IMG_ICON_CONTACT_WWW_SRC}"); }\r\n.msnm-icon, .msnm-icon a			{ background-image: url("{IMG_ICON_CONTACT_MSNM_SRC}"); }\r\n.icq-icon, .icq-icon a			{ background-image: url("{IMG_ICON_CONTACT_ICQ_SRC}"); }\r\n.jabber-icon, .jabber-icon a		{ background-image: url("{IMG_ICON_CONTACT_JABBER_SRC}"); }\r\n.pm-icon, .pm-icon a				{ background-image: url("{IMG_ICON_CONTACT_PM_SRC}"); }\r\n.quote-icon, .quote-icon a		{ background-image: url("{IMG_ICON_POST_QUOTE_SRC}"); }\r\n\r\n/* Moderator icons */\r\n.report-icon, .report-icon a		{ background-image: url("{IMG_ICON_POST_REPORT_SRC}"); }\r\n.edit-icon, .edit-icon a			{ background-image: url("{IMG_ICON_POST_EDIT_SRC}"); }\r\n.delete-icon, .delete-icon a		{ background-image: url("{IMG_ICON_POST_DELETE_SRC}"); }\r\n.info-icon, .info-icon a			{ background-image: url("{IMG_ICON_POST_INFO_SRC}"); }\r\n.warn-icon, .warn-icon a			{ background-image: url("{IMG_ICON_USER_WARN_SRC}"); } /* Need updated warn icon */\r\n\r\n/*  	\r\n--------------------------------------------------------------\r\nColours and backgrounds for cp.css\r\n-------------------------------------------------------------- */\r\n\r\n/* Main CP box\r\n----------------------------------------*/\r\n\r\n#cp-main h3, #cp-main hr, #cp-menu hr {\r\n	border-color: #A4B3BF;\r\n}\r\n\r\n#cp-main .panel li.row {\r\n	border-bottom-color: #B5C1CB;\r\n	border-top-color: #F9F9F9;\r\n}\r\n\r\nul.cplist {\r\n	border-top-color: #B5C1CB;\r\n}\r\n\r\n#cp-main .panel li.header dd, #cp-main .panel li.header dt {\r\n	color: #000000;\r\n}\r\n\r\n#cp-main table.table1 thead th {\r\n	color: #333333;\r\n	border-bottom-color: #333333;\r\n}\r\n\r\n#cp-main .pm-message {\r\n	border-color: #DBDEE2;\r\n	background-color: #FFFFFF;\r\n}\r\n\r\n/* CP tabbed menu\r\n----------------------------------------*/\r\n#tabs a {\r\n	background-image: url("{T_THEME_PATH}/images/bg_tabs1.gif");\r\n}\r\n\r\n#tabs a span {\r\n	background-image: url("{T_THEME_PATH}/images/bg_tabs2.gif");\r\n	color: #b17601;\r\n}\r\n\r\n#tabs a:hover span {\r\n	color: #dd9d1c;\r\n}\r\n\r\n#tabs .activetab a {\r\n	border-bottom-color: #f5b847;\r\n}\r\n\r\n#tabs .activetab a span {\r\n	color: #333333;\r\n}\r\n\r\n#tabs .activetab a:hover span {\r\n	color: #000000;\r\n}\r\n\r\n/* Mini tabbed menu used in MCP\r\n----------------------------------------*/\r\n#minitabs li {\r\n	background-color: #f0eeea;\r\n}\r\n\r\n#minitabs li.activetab {\r\n	background-color: #F9F9F9;\r\n}\r\n\r\n#minitabs li.activetab a, #minitabs li.activetab a:hover {\r\n	color: #333333;\r\n}\r\n\r\n/* UCP navigation menu\r\n----------------------------------------*/\r\n\r\n/* Link styles for the sub-section links */\r\n#navigation a {\r\n	color: #333;\r\n	background-color: #dfd7a5;\r\n	background-image: url("{T_THEME_PATH}/images/bg_menu.gif");\r\n}\r\n\r\n#navigation a:hover {\r\n	background-color: #dfd7a5;\r\n	color: #dd9d1c;\r\n}\r\n\r\n#navigation #active-subsection a {\r\n	color: #8f5f00;\r\n	background-color: #F9F9F9;\r\n	background-image: none;\r\n}\r\n\r\n#navigation #active-subsection a:hover {\r\n	color: #8f5f00;\r\n}\r\n\r\n/* Preferences pane layout\r\n----------------------------------------*/\r\n#cp-main h2 {\r\n	color: #333333;\r\n}\r\n\r\n#cp-main .panel {\r\n	background-color: #F9F9F9;\r\n}\r\n\r\n#cp-main .pm {\r\n	background-color: #FFFFFF;\r\n}\r\n\r\n#cp-main span.corners-top, #cp-menu span.corners-top {\r\n	background-image: url("{T_THEME_PATH}/images/corners_left2.gif");\r\n}\r\n\r\n#cp-main span.corners-top span, #cp-menu span.corners-top span {\r\n	background-image: url("{T_THEME_PATH}/images/corners_right2.gif");\r\n}\r\n\r\n#cp-main span.corners-bottom, #cp-menu span.corners-bottom {\r\n	background-image: url("{T_THEME_PATH}/images/corners_left2.gif");\r\n}\r\n\r\n#cp-main span.corners-bottom span, #cp-menu span.corners-bottom span {\r\n	background-image: url("{T_THEME_PATH}/images/corners_right2.gif");\r\n}\r\n\r\n/* Topicreview */\r\n#cp-main .panel #topicreview span.corners-top, #cp-menu .panel #topicreview span.corners-top {\r\n	background-image: url("{T_THEME_PATH}/images/corners_left.gif");\r\n}\r\n\r\n#cp-main .panel #topicreview span.corners-top span, #cp-menu .panel #topicreview span.corners-top span {\r\n	background-image: url("{T_THEME_PATH}/images/corners_right.gif");\r\n}\r\n\r\n#cp-main .panel #topicreview span.corners-bottom, #cp-menu .panel #topicreview span.corners-bottom {\r\n	background-image: url("{T_THEME_PATH}/images/corners_left.gif");\r\n}\r\n\r\n#cp-main .panel #topicreview span.corners-bottom span, #cp-menu .panel #topicreview span.corners-bottom span {\r\n	background-image: url("{T_THEME_PATH}/images/corners_right.gif");\r\n}\r\n\r\n/* Friends list */\r\n.cp-mini {\r\n	background-color: #eef5f9;\r\n}\r\n\r\ndl.mini dt {\r\n	color: #425067;\r\n}\r\n\r\n/* PM Styles\r\n----------------------------------------*/\r\n/* PM Message history */\r\n.current {\r\n	color: #999999 !important;\r\n}\r\n\r\n/* PM marking colours */\r\n.pmlist li.pm_message_reported_colour, .pm_message_reported_colour {\r\n	border-left-color: #dd9d1c;\r\n	border-right-color: #dd9d1c;\r\n}\r\n\r\n.pmlist li.pm_marked_colour, .pm_marked_colour {\r\n	border-color: #FF6600;\r\n}\r\n\r\n.pmlist li.pm_replied_colour, .pm_replied_colour {\r\n	border-color: #A9B8C2;\r\n}\r\n\r\n.pmlist li.pm_friend_colour, .pm_friend_colour {\r\n	border-color: #5D8FBD;\r\n}\r\n\r\npmlist li.pm_foe_colour, .pm_foe_colour {\r\n	border-color: #000000;\r\n}\r\n\r\n/* Avatar gallery */\r\n#gallery label {\r\n	background-color: #FFFFFF;\r\n	border-color: #CCC;\r\n}\r\n\r\n#gallery label:hover {\r\n	background-color: #EEE;\r\n}\r\n\r\n/*  	\r\n--------------------------------------------------------------\r\nColours and backgrounds for forms.css\r\n-------------------------------------------------------------- */\r\n\r\n/* General form styles\r\n----------------------------------------*/\r\nselect {\r\n	border-color: #666666;\r\n	background-color: #FAFAFA;\r\n}\r\n\r\nlabel {\r\n	color: #425067;\r\n}\r\n\r\noption.disabled-option {\r\n	color: graytext;\r\n}\r\n\r\n/* Definition list layout for forms\r\n---------------------------------------- */\r\ndd label {\r\n	color: #333;\r\n}\r\n\r\n/* Hover effects */\r\nfieldset dl:hover dt label {\r\n	color: #000000;\r\n}\r\n\r\nfieldset.fields2 dl:hover dt label {\r\n	color: inherit;\r\n}\r\n\r\n/* Quick-login on index page */\r\nfieldset.quick-login input.inputbox {\r\n	background-color: #F2F3F3;\r\n}\r\n\r\n/* Posting page styles\r\n----------------------------------------*/\r\n\r\n#message-box textarea {\r\n	color: #333333;\r\n}\r\n\r\n/* Input field styles\r\n---------------------------------------- */\r\n.inputbox {\r\n	background-color: #FFFFFF; \r\n	border-color: #B4BAC0;\r\n	color: #333333;\r\n}\r\n\r\n.inputbox:hover {\r\n	border-color: #11A3EA;\r\n}\r\n\r\n.inputbox:focus {\r\n	border-color: #11A3EA;\r\n	color: #0F4987;\r\n}\r\n\r\n/* Form button styles\r\n---------------------------------------- */\r\n\r\na.button1, input.button1, input.button3, a.button2, input.button2 {\r\n	color: #000;\r\n	background-color: #FAFAFA;\r\n	background-image: url("{T_THEME_PATH}/images/bg_button.gif");\r\n}\r\n\r\na.button1, input.button1 {\r\n	border-color: #666666;\r\n}\r\n\r\ninput.button3 {\r\n	background-image: none;\r\n}\r\n\r\n/* Alternative button */\r\na.button2, input.button2, input.button3 {\r\n	border-color: #666666;\r\n}\r\n\r\n/* <a> button in the style of the form buttons */\r\na.button1, a.button1:link, a.button1:visited, a.button1:active, a.button2, a.button2:link, a.button2:visited, a.button2:active {\r\n	color: #000000;\r\n}\r\n\r\n/* Hover states */\r\na.button1:hover, input.button1:hover, a.button2:hover, input.button2:hover, input.button3:hover {\r\n	border-color: #dd9d1c;\r\n	color: #dd9d1c;\r\n}\r\n\r\ninput.search {\r\n	background-image: url("{T_THEME_PATH}/images/icon_textbox_search.gif");\r\n}\r\n\r\ninput.disabled {\r\n	color: #666666;\r\n}\r\n');

-- --------------------------------------------------------

--
-- Struttura della tabella `phpbb_topics`
--

CREATE TABLE IF NOT EXISTS `phpbb_topics` (
  `topic_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `forum_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `icon_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `topic_attachment` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `topic_approved` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `topic_reported` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `topic_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `topic_poster` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `topic_time` int(11) unsigned NOT NULL DEFAULT '0',
  `topic_time_limit` int(11) unsigned NOT NULL DEFAULT '0',
  `topic_views` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `topic_replies` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `topic_replies_real` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `topic_status` tinyint(3) NOT NULL DEFAULT '0',
  `topic_type` tinyint(3) NOT NULL DEFAULT '0',
  `topic_first_post_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `topic_first_poster_name` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `topic_first_poster_colour` varchar(6) COLLATE utf8_bin NOT NULL DEFAULT '',
  `topic_last_post_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `topic_last_poster_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `topic_last_poster_name` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `topic_last_poster_colour` varchar(6) COLLATE utf8_bin NOT NULL DEFAULT '',
  `topic_last_post_subject` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `topic_last_post_time` int(11) unsigned NOT NULL DEFAULT '0',
  `topic_last_view_time` int(11) unsigned NOT NULL DEFAULT '0',
  `topic_moved_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `topic_bumped` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `topic_bumper` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `poll_title` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `poll_start` int(11) unsigned NOT NULL DEFAULT '0',
  `poll_length` int(11) unsigned NOT NULL DEFAULT '0',
  `poll_max_options` tinyint(4) NOT NULL DEFAULT '1',
  `poll_last_vote` int(11) unsigned NOT NULL DEFAULT '0',
  `poll_vote_change` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`topic_id`),
  KEY `forum_id` (`forum_id`),
  KEY `forum_id_type` (`forum_id`,`topic_type`),
  KEY `last_post_time` (`topic_last_post_time`),
  KEY `topic_approved` (`topic_approved`),
  KEY `forum_appr_last` (`forum_id`,`topic_approved`,`topic_last_post_id`),
  KEY `fid_time_moved` (`forum_id`,`topic_last_post_time`,`topic_moved_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=3 ;

--
-- Dump dei dati per la tabella `phpbb_topics`
--

INSERT INTO `phpbb_topics` (`topic_id`, `forum_id`, `icon_id`, `topic_attachment`, `topic_approved`, `topic_reported`, `topic_title`, `topic_poster`, `topic_time`, `topic_time_limit`, `topic_views`, `topic_replies`, `topic_replies_real`, `topic_status`, `topic_type`, `topic_first_post_id`, `topic_first_poster_name`, `topic_first_poster_colour`, `topic_last_post_id`, `topic_last_poster_id`, `topic_last_poster_name`, `topic_last_poster_colour`, `topic_last_post_subject`, `topic_last_post_time`, `topic_last_view_time`, `topic_moved_id`, `topic_bumped`, `topic_bumper`, `poll_title`, `poll_start`, `poll_length`, `poll_max_options`, `poll_last_vote`, `poll_vote_change`) VALUES
(2, 9, 0, 0, 1, 0, 'Famiglia Rossi', 57, 1355173113, 0, 9, 1, 1, 0, 0, 2, 'genitore2', '', 4, 58, 'genitore1', '', 'Famiglia Bianchi', 1355174726, 1355657563, 0, 0, 0, '', 0, 0, 1, 0, 0);

-- --------------------------------------------------------

--
-- Struttura della tabella `phpbb_topics_posted`
--

CREATE TABLE IF NOT EXISTS `phpbb_topics_posted` (
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `topic_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `topic_posted` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_id`,`topic_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dump dei dati per la tabella `phpbb_topics_posted`
--

INSERT INTO `phpbb_topics_posted` (`user_id`, `topic_id`, `topic_posted`) VALUES
(0, 0, 0),
(2, 2, 1),
(57, 2, 1),
(58, 2, 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `phpbb_topics_track`
--

CREATE TABLE IF NOT EXISTS `phpbb_topics_track` (
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `topic_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `forum_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `mark_time` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_id`,`topic_id`),
  KEY `topic_id` (`topic_id`),
  KEY `forum_id` (`forum_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Struttura della tabella `phpbb_topics_watch`
--

CREATE TABLE IF NOT EXISTS `phpbb_topics_watch` (
  `topic_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `notify_status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  KEY `topic_id` (`topic_id`),
  KEY `user_id` (`user_id`),
  KEY `notify_stat` (`notify_status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Struttura della tabella `phpbb_users`
--

CREATE TABLE IF NOT EXISTS `phpbb_users` (
  `user_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `user_type` tinyint(2) NOT NULL DEFAULT '0',
  `group_id` mediumint(8) unsigned NOT NULL DEFAULT '3',
  `user_permissions` mediumtext COLLATE utf8_bin NOT NULL,
  `user_perm_from` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `user_ip` varchar(40) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user_regdate` int(11) unsigned NOT NULL DEFAULT '0',
  `username` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `username_clean` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user_password` varchar(40) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user_passchg` int(11) unsigned NOT NULL DEFAULT '0',
  `user_pass_convert` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `user_email` varchar(100) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user_email_hash` bigint(20) NOT NULL DEFAULT '0',
  `user_birthday` varchar(10) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user_lastvisit` int(11) unsigned NOT NULL DEFAULT '0',
  `user_lastmark` int(11) unsigned NOT NULL DEFAULT '0',
  `user_lastpost_time` int(11) unsigned NOT NULL DEFAULT '0',
  `user_lastpage` varchar(200) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user_last_confirm_key` varchar(10) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user_last_search` int(11) unsigned NOT NULL DEFAULT '0',
  `user_warnings` tinyint(4) NOT NULL DEFAULT '0',
  `user_last_warning` int(11) unsigned NOT NULL DEFAULT '0',
  `user_login_attempts` tinyint(4) NOT NULL DEFAULT '0',
  `user_inactive_reason` tinyint(2) NOT NULL DEFAULT '0',
  `user_inactive_time` int(11) unsigned NOT NULL DEFAULT '0',
  `user_posts` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `user_lang` varchar(30) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user_timezone` decimal(5,2) NOT NULL DEFAULT '0.00',
  `user_dst` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `user_dateformat` varchar(30) COLLATE utf8_bin NOT NULL DEFAULT 'd M Y H:i',
  `user_style` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `user_rank` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `user_colour` varchar(6) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user_new_privmsg` int(4) NOT NULL DEFAULT '0',
  `user_unread_privmsg` int(4) NOT NULL DEFAULT '0',
  `user_last_privmsg` int(11) unsigned NOT NULL DEFAULT '0',
  `user_message_rules` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `user_full_folder` int(11) NOT NULL DEFAULT '-3',
  `user_emailtime` int(11) unsigned NOT NULL DEFAULT '0',
  `user_topic_show_days` smallint(4) unsigned NOT NULL DEFAULT '0',
  `user_topic_sortby_type` varchar(1) COLLATE utf8_bin NOT NULL DEFAULT 't',
  `user_topic_sortby_dir` varchar(1) COLLATE utf8_bin NOT NULL DEFAULT 'd',
  `user_post_show_days` smallint(4) unsigned NOT NULL DEFAULT '0',
  `user_post_sortby_type` varchar(1) COLLATE utf8_bin NOT NULL DEFAULT 't',
  `user_post_sortby_dir` varchar(1) COLLATE utf8_bin NOT NULL DEFAULT 'a',
  `user_notify` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `user_notify_pm` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `user_notify_type` tinyint(4) NOT NULL DEFAULT '0',
  `user_allow_pm` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `user_allow_viewonline` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `user_allow_viewemail` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `user_allow_massemail` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `user_options` int(11) unsigned NOT NULL DEFAULT '230271',
  `user_avatar` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user_avatar_type` tinyint(2) NOT NULL DEFAULT '0',
  `user_avatar_width` smallint(4) unsigned NOT NULL DEFAULT '0',
  `user_avatar_height` smallint(4) unsigned NOT NULL DEFAULT '0',
  `user_sig` mediumtext COLLATE utf8_bin NOT NULL,
  `user_sig_bbcode_uid` varchar(8) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user_sig_bbcode_bitfield` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user_from` varchar(100) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user_icq` varchar(15) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user_aim` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user_yim` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user_msnm` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user_jabber` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user_website` varchar(200) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user_occ` text COLLATE utf8_bin NOT NULL,
  `user_interests` text COLLATE utf8_bin NOT NULL,
  `user_actkey` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user_newpasswd` varchar(40) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user_form_salt` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user_new` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `user_reminded` tinyint(4) NOT NULL DEFAULT '0',
  `user_reminded_time` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username_clean` (`username_clean`),
  KEY `user_birthday` (`user_birthday`),
  KEY `user_email_hash` (`user_email_hash`),
  KEY `user_type` (`user_type`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=59 ;

--
-- Dump dei dati per la tabella `phpbb_users`
--

INSERT INTO `phpbb_users` (`user_id`, `user_type`, `group_id`, `user_permissions`, `user_perm_from`, `user_ip`, `user_regdate`, `username`, `username_clean`, `user_password`, `user_passchg`, `user_pass_convert`, `user_email`, `user_email_hash`, `user_birthday`, `user_lastvisit`, `user_lastmark`, `user_lastpost_time`, `user_lastpage`, `user_last_confirm_key`, `user_last_search`, `user_warnings`, `user_last_warning`, `user_login_attempts`, `user_inactive_reason`, `user_inactive_time`, `user_posts`, `user_lang`, `user_timezone`, `user_dst`, `user_dateformat`, `user_style`, `user_rank`, `user_colour`, `user_new_privmsg`, `user_unread_privmsg`, `user_last_privmsg`, `user_message_rules`, `user_full_folder`, `user_emailtime`, `user_topic_show_days`, `user_topic_sortby_type`, `user_topic_sortby_dir`, `user_post_show_days`, `user_post_sortby_type`, `user_post_sortby_dir`, `user_notify`, `user_notify_pm`, `user_notify_type`, `user_allow_pm`, `user_allow_viewonline`, `user_allow_viewemail`, `user_allow_massemail`, `user_options`, `user_avatar`, `user_avatar_type`, `user_avatar_width`, `user_avatar_height`, `user_sig`, `user_sig_bbcode_uid`, `user_sig_bbcode_bitfield`, `user_from`, `user_icq`, `user_aim`, `user_yim`, `user_msnm`, `user_jabber`, `user_website`, `user_occ`, `user_interests`, `user_actkey`, `user_newpasswd`, `user_form_salt`, `user_new`, `user_reminded`, `user_reminded_time`) VALUES
(1, 2, 1, '', 0, '', 1354998540, 'ciaomondo2', 'ciaomondo2', '$H$9mNxkbHfuXLaV9W7yBCqnNhEMAPM1p0', 1355166520, 0, '', 0, '', 1355165310, 0, 0, 'ucp.php?mode=logout', '', 0, 0, 0, 0, 0, 0, 0, 'en', '0.00', 0, 'd M Y H:i', 4, 0, '', 0, 0, 0, 0, -3, 0, 0, 't', 'd', 0, 't', 'a', 0, 1, 0, 1, 1, 1, 0, 230271, '', 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '0747ee117d779766', 0, 0, 0),
(2, 3, 5, 'zik0zjzik0zjzik0xs\nqlc4pi000000\nqlc4pi000000\n\n\n\nqlc4pi000000\nqlc4pi000000\nqlc4pi000000\nqlc4pi000000', 0, '::1', 1354998540, 'admin', 'admin', '$H$9vYlf.08zyxfLYgLSHYQHDVvcZshWQ1', 0, 0, 'a@tin.it', 8643458078, '', 1355657562, 0, 1355090936, 'viewtopic.php?f=9&t=2', '', 0, 0, 0, 0, 0, 0, 1, 'it', '0.00', 0, '|d/m/Y|, G:i', 4, 1, 'AA0000', 0, 0, 0, 0, -3, 0, 0, 't', 'd', 0, 't', 'a', 0, 1, 0, 1, 1, 1, 1, 230271, '', 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '97edb96c178635a2', 0, 0, 0),
(3, 2, 6, '', 0, '', 1354999187, 'AdsBot [Google]', 'adsbot [google]', '', 1354999187, 0, '', 0, '', 0, 1354999187, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 'it', '0.00', 0, '|d/m/Y|, G:i', 4, 0, '9E8DA7', 0, 0, 0, 0, -3, 0, 0, 't', 'd', 0, 't', 'a', 0, 1, 0, 1, 1, 1, 0, 230271, '', 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '7ea64bf6d37b7939', 0, 0, 0),
(4, 2, 6, '', 0, '', 1354999187, 'Alexa [Bot]', 'alexa [bot]', '', 1354999187, 0, '', 0, '', 0, 1354999187, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 'it', '0.00', 0, '|d/m/Y|, G:i', 4, 0, '9E8DA7', 0, 0, 0, 0, -3, 0, 0, 't', 'd', 0, 't', 'a', 0, 1, 0, 1, 1, 1, 0, 230271, '', 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1510ace753b0e65f', 0, 0, 0),
(5, 2, 6, '', 0, '', 1354999188, 'Alta Vista [Bot]', 'alta vista [bot]', '', 1354999188, 0, '', 0, '', 0, 1354999188, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 'it', '0.00', 0, '|d/m/Y|, G:i', 4, 0, '9E8DA7', 0, 0, 0, 0, -3, 0, 0, 't', 'd', 0, 't', 'a', 0, 1, 0, 1, 1, 1, 0, 230271, '', 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'cd78524a89180b8d', 0, 0, 0),
(6, 2, 6, '', 0, '', 1354999188, 'Ask Jeeves [Bot]', 'ask jeeves [bot]', '', 1354999188, 0, '', 0, '', 0, 1354999188, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 'it', '0.00', 0, '|d/m/Y|, G:i', 4, 0, '9E8DA7', 0, 0, 0, 0, -3, 0, 0, 't', 'd', 0, 't', 'a', 0, 1, 0, 1, 1, 1, 0, 230271, '', 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'dfa61f267414a981', 0, 0, 0),
(7, 2, 6, '', 0, '', 1354999188, 'Baidu [Spider]', 'baidu [spider]', '', 1354999188, 0, '', 0, '', 0, 1354999188, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 'it', '0.00', 0, '|d/m/Y|, G:i', 4, 0, '9E8DA7', 0, 0, 0, 0, -3, 0, 0, 't', 'd', 0, 't', 'a', 0, 1, 0, 1, 1, 1, 0, 230271, '', 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'b9ee112f5b797ea1', 0, 0, 0),
(8, 2, 6, '', 0, '', 1354999188, 'Bing [Bot]', 'bing [bot]', '', 1354999188, 0, '', 0, '', 0, 1354999188, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 'it', '0.00', 0, '|d/m/Y|, G:i', 4, 0, '9E8DA7', 0, 0, 0, 0, -3, 0, 0, 't', 'd', 0, 't', 'a', 0, 1, 0, 1, 1, 1, 0, 230271, '', 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'a4a670d93bd6235d', 0, 0, 0),
(9, 2, 6, '', 0, '', 1354999188, 'Exabot [Bot]', 'exabot [bot]', '', 1354999188, 0, '', 0, '', 0, 1354999188, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 'it', '0.00', 0, '|d/m/Y|, G:i', 4, 0, '9E8DA7', 0, 0, 0, 0, -3, 0, 0, 't', 'd', 0, 't', 'a', 0, 1, 0, 1, 1, 1, 0, 230271, '', 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'dd52d22c9b630320', 0, 0, 0),
(10, 2, 6, '', 0, '', 1354999189, 'FAST Enterprise [Crawler]', 'fast enterprise [crawler]', '', 1354999189, 0, '', 0, '', 0, 1354999189, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 'it', '0.00', 0, '|d/m/Y|, G:i', 4, 0, '9E8DA7', 0, 0, 0, 0, -3, 0, 0, 't', 'd', 0, 't', 'a', 0, 1, 0, 1, 1, 1, 0, 230271, '', 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '93916522318956bf', 0, 0, 0),
(11, 2, 6, '', 0, '', 1354999189, 'FAST WebCrawler [Crawler]', 'fast webcrawler [crawler]', '', 1354999189, 0, '', 0, '', 0, 1354999189, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 'it', '0.00', 0, '|d/m/Y|, G:i', 4, 0, '9E8DA7', 0, 0, 0, 0, -3, 0, 0, 't', 'd', 0, 't', 'a', 0, 1, 0, 1, 1, 1, 0, 230271, '', 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'c1233080a93d9f2a', 0, 0, 0),
(12, 2, 6, '', 0, '', 1354999189, 'Francis [Bot]', 'francis [bot]', '', 1354999189, 0, '', 0, '', 0, 1354999189, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 'it', '0.00', 0, '|d/m/Y|, G:i', 4, 0, '9E8DA7', 0, 0, 0, 0, -3, 0, 0, 't', 'd', 0, 't', 'a', 0, 1, 0, 1, 1, 1, 0, 230271, '', 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '20d35a84760a26c9', 0, 0, 0),
(13, 2, 6, '', 0, '', 1354999189, 'Gigabot [Bot]', 'gigabot [bot]', '', 1354999189, 0, '', 0, '', 0, 1354999189, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 'it', '0.00', 0, '|d/m/Y|, G:i', 4, 0, '9E8DA7', 0, 0, 0, 0, -3, 0, 0, 't', 'd', 0, 't', 'a', 0, 1, 0, 1, 1, 1, 0, 230271, '', 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'e509143bc4f7afc3', 0, 0, 0),
(14, 2, 6, '', 0, '', 1354999189, 'Google Adsense [Bot]', 'google adsense [bot]', '', 1354999189, 0, '', 0, '', 0, 1354999189, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 'it', '0.00', 0, '|d/m/Y|, G:i', 4, 0, '9E8DA7', 0, 0, 0, 0, -3, 0, 0, 't', 'd', 0, 't', 'a', 0, 1, 0, 1, 1, 1, 0, 230271, '', 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '18283fd8b1659151', 0, 0, 0),
(15, 2, 6, '', 0, '', 1354999190, 'Google Desktop', 'google desktop', '', 1354999190, 0, '', 0, '', 0, 1354999190, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 'it', '0.00', 0, '|d/m/Y|, G:i', 4, 0, '9E8DA7', 0, 0, 0, 0, -3, 0, 0, 't', 'd', 0, 't', 'a', 0, 1, 0, 1, 1, 1, 0, 230271, '', 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'c368068b66552c90', 0, 0, 0),
(16, 2, 6, '', 0, '', 1354999190, 'Google Feedfetcher', 'google feedfetcher', '', 1354999190, 0, '', 0, '', 0, 1354999190, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 'it', '0.00', 0, '|d/m/Y|, G:i', 4, 0, '9E8DA7', 0, 0, 0, 0, -3, 0, 0, 't', 'd', 0, 't', 'a', 0, 1, 0, 1, 1, 1, 0, 230271, '', 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'd50c6aad04c9c829', 0, 0, 0),
(17, 2, 6, '', 0, '', 1354999190, 'Google [Bot]', 'google [bot]', '', 1354999190, 0, '', 0, '', 0, 1354999190, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 'it', '0.00', 0, '|d/m/Y|, G:i', 4, 0, '9E8DA7', 0, 0, 0, 0, -3, 0, 0, 't', 'd', 0, 't', 'a', 0, 1, 0, 1, 1, 1, 0, 230271, '', 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '2de70a9f7288177a', 0, 0, 0),
(18, 2, 6, '', 0, '', 1354999190, 'Heise IT-Markt [Crawler]', 'heise it-markt [crawler]', '', 1354999190, 0, '', 0, '', 0, 1354999190, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 'it', '0.00', 0, '|d/m/Y|, G:i', 4, 0, '9E8DA7', 0, 0, 0, 0, -3, 0, 0, 't', 'd', 0, 't', 'a', 0, 1, 0, 1, 1, 1, 0, 230271, '', 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'e7df2916f2df1f95', 0, 0, 0),
(19, 2, 6, '', 0, '', 1354999191, 'Heritrix [Crawler]', 'heritrix [crawler]', '', 1354999191, 0, '', 0, '', 0, 1354999191, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 'it', '0.00', 0, '|d/m/Y|, G:i', 4, 0, '9E8DA7', 0, 0, 0, 0, -3, 0, 0, 't', 'd', 0, 't', 'a', 0, 1, 0, 1, 1, 1, 0, 230271, '', 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'f64de5a7d8db8bee', 0, 0, 0),
(20, 2, 6, '', 0, '', 1354999191, 'IBM Research [Bot]', 'ibm research [bot]', '', 1354999191, 0, '', 0, '', 0, 1354999191, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 'it', '0.00', 0, '|d/m/Y|, G:i', 4, 0, '9E8DA7', 0, 0, 0, 0, -3, 0, 0, 't', 'd', 0, 't', 'a', 0, 1, 0, 1, 1, 1, 0, 230271, '', 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '57fcd2e9e58468b4', 0, 0, 0),
(21, 2, 6, '', 0, '', 1354999191, 'ICCrawler - ICjobs', 'iccrawler - icjobs', '', 1354999191, 0, '', 0, '', 0, 1354999191, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 'it', '0.00', 0, '|d/m/Y|, G:i', 4, 0, '9E8DA7', 0, 0, 0, 0, -3, 0, 0, 't', 'd', 0, 't', 'a', 0, 1, 0, 1, 1, 1, 0, 230271, '', 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'c7f43f48432f92d7', 0, 0, 0),
(22, 2, 6, '', 0, '', 1354999191, 'ichiro [Crawler]', 'ichiro [crawler]', '', 1354999191, 0, '', 0, '', 0, 1354999191, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 'it', '0.00', 0, '|d/m/Y|, G:i', 4, 0, '9E8DA7', 0, 0, 0, 0, -3, 0, 0, 't', 'd', 0, 't', 'a', 0, 1, 0, 1, 1, 1, 0, 230271, '', 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'cc14f8a734d6d56d', 0, 0, 0),
(23, 2, 6, '', 0, '', 1354999192, 'Majestic-12 [Bot]', 'majestic-12 [bot]', '', 1354999192, 0, '', 0, '', 0, 1354999192, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 'it', '0.00', 0, '|d/m/Y|, G:i', 4, 0, '9E8DA7', 0, 0, 0, 0, -3, 0, 0, 't', 'd', 0, 't', 'a', 0, 1, 0, 1, 1, 1, 0, 230271, '', 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '63a96f473e00b489', 0, 0, 0),
(24, 2, 6, '', 0, '', 1354999192, 'Metager [Bot]', 'metager [bot]', '', 1354999192, 0, '', 0, '', 0, 1354999192, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 'it', '0.00', 0, '|d/m/Y|, G:i', 4, 0, '9E8DA7', 0, 0, 0, 0, -3, 0, 0, 't', 'd', 0, 't', 'a', 0, 1, 0, 1, 1, 1, 0, 230271, '', 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '0e8de7d9344f172e', 0, 0, 0),
(25, 2, 6, '', 0, '', 1354999192, 'MSN NewsBlogs', 'msn newsblogs', '', 1354999192, 0, '', 0, '', 0, 1354999192, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 'it', '0.00', 0, '|d/m/Y|, G:i', 4, 0, '9E8DA7', 0, 0, 0, 0, -3, 0, 0, 't', 'd', 0, 't', 'a', 0, 1, 0, 1, 1, 1, 0, 230271, '', 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1ef7206b53c3fb52', 0, 0, 0),
(26, 2, 6, '', 0, '', 1354999192, 'MSN [Bot]', 'msn [bot]', '', 1354999192, 0, '', 0, '', 0, 1354999192, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 'it', '0.00', 0, '|d/m/Y|, G:i', 4, 0, '9E8DA7', 0, 0, 0, 0, -3, 0, 0, 't', 'd', 0, 't', 'a', 0, 1, 0, 1, 1, 1, 0, 230271, '', 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'dc737d80522710eb', 0, 0, 0),
(27, 2, 6, '', 0, '', 1354999192, 'MSNbot Media', 'msnbot media', '', 1354999192, 0, '', 0, '', 0, 1354999192, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 'it', '0.00', 0, '|d/m/Y|, G:i', 4, 0, '9E8DA7', 0, 0, 0, 0, -3, 0, 0, 't', 'd', 0, 't', 'a', 0, 1, 0, 1, 1, 1, 0, 230271, '', 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '8a8e10f31c88b061', 0, 0, 0),
(28, 2, 6, '', 0, '', 1354999193, 'NG-Search [Bot]', 'ng-search [bot]', '', 1354999193, 0, '', 0, '', 0, 1354999193, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 'it', '0.00', 0, '|d/m/Y|, G:i', 4, 0, '9E8DA7', 0, 0, 0, 0, -3, 0, 0, 't', 'd', 0, 't', 'a', 0, 1, 0, 1, 1, 1, 0, 230271, '', 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'd53637dc823c89cc', 0, 0, 0),
(29, 2, 6, '', 0, '', 1354999193, 'Nutch [Bot]', 'nutch [bot]', '', 1354999193, 0, '', 0, '', 0, 1354999193, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 'it', '0.00', 0, '|d/m/Y|, G:i', 4, 0, '9E8DA7', 0, 0, 0, 0, -3, 0, 0, 't', 'd', 0, 't', 'a', 0, 1, 0, 1, 1, 1, 0, 230271, '', 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '46c3c9463028727f', 0, 0, 0),
(30, 2, 6, '', 0, '', 1354999193, 'Nutch/CVS [Bot]', 'nutch/cvs [bot]', '', 1354999193, 0, '', 0, '', 0, 1354999193, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 'it', '0.00', 0, '|d/m/Y|, G:i', 4, 0, '9E8DA7', 0, 0, 0, 0, -3, 0, 0, 't', 'd', 0, 't', 'a', 0, 1, 0, 1, 1, 1, 0, 230271, '', 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'd15b5de07e1d491f', 0, 0, 0),
(31, 2, 6, '', 0, '', 1354999193, 'OmniExplorer [Bot]', 'omniexplorer [bot]', '', 1354999193, 0, '', 0, '', 0, 1354999193, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 'it', '0.00', 0, '|d/m/Y|, G:i', 4, 0, '9E8DA7', 0, 0, 0, 0, -3, 0, 0, 't', 'd', 0, 't', 'a', 0, 1, 0, 1, 1, 1, 0, 230271, '', 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'e0a6ff8f6eb37aed', 0, 0, 0),
(32, 2, 6, '', 0, '', 1354999193, 'Online link [Validator]', 'online link [validator]', '', 1354999193, 0, '', 0, '', 0, 1354999193, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 'it', '0.00', 0, '|d/m/Y|, G:i', 4, 0, '9E8DA7', 0, 0, 0, 0, -3, 0, 0, 't', 'd', 0, 't', 'a', 0, 1, 0, 1, 1, 1, 0, 230271, '', 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'dc89004f839cb37e', 0, 0, 0),
(33, 2, 6, '', 0, '', 1354999194, 'psbot [Picsearch]', 'psbot [picsearch]', '', 1354999194, 0, '', 0, '', 0, 1354999194, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 'it', '0.00', 0, '|d/m/Y|, G:i', 4, 0, '9E8DA7', 0, 0, 0, 0, -3, 0, 0, 't', 'd', 0, 't', 'a', 0, 1, 0, 1, 1, 1, 0, 230271, '', 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'c637accf9b428a9a', 0, 0, 0),
(34, 2, 6, '', 0, '', 1354999194, 'Seekport [Bot]', 'seekport [bot]', '', 1354999194, 0, '', 0, '', 0, 1354999194, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 'it', '0.00', 0, '|d/m/Y|, G:i', 4, 0, '9E8DA7', 0, 0, 0, 0, -3, 0, 0, 't', 'd', 0, 't', 'a', 0, 1, 0, 1, 1, 1, 0, 230271, '', 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '8806f5ea318a44b4', 0, 0, 0),
(35, 2, 6, '', 0, '', 1354999194, 'Sensis [Crawler]', 'sensis [crawler]', '', 1354999194, 0, '', 0, '', 0, 1354999194, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 'it', '0.00', 0, '|d/m/Y|, G:i', 4, 0, '9E8DA7', 0, 0, 0, 0, -3, 0, 0, 't', 'd', 0, 't', 'a', 0, 1, 0, 1, 1, 1, 0, 230271, '', 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '8296d9d33322b456', 0, 0, 0),
(36, 2, 6, '', 0, '', 1354999194, 'SEO Crawler', 'seo crawler', '', 1354999194, 0, '', 0, '', 0, 1354999194, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 'it', '0.00', 0, '|d/m/Y|, G:i', 4, 0, '9E8DA7', 0, 0, 0, 0, -3, 0, 0, 't', 'd', 0, 't', 'a', 0, 1, 0, 1, 1, 1, 0, 230271, '', 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '188e32b1dbfb15ad', 0, 0, 0),
(37, 2, 6, '', 0, '', 1354999194, 'Seoma [Crawler]', 'seoma [crawler]', '', 1354999194, 0, '', 0, '', 0, 1354999194, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 'it', '0.00', 0, '|d/m/Y|, G:i', 4, 0, '9E8DA7', 0, 0, 0, 0, -3, 0, 0, 't', 'd', 0, 't', 'a', 0, 1, 0, 1, 1, 1, 0, 230271, '', 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'd8009da407e87c8a', 0, 0, 0),
(38, 2, 6, '', 0, '', 1354999194, 'SEOSearch [Crawler]', 'seosearch [crawler]', '', 1354999194, 0, '', 0, '', 0, 1354999194, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 'it', '0.00', 0, '|d/m/Y|, G:i', 4, 0, '9E8DA7', 0, 0, 0, 0, -3, 0, 0, 't', 'd', 0, 't', 'a', 0, 1, 0, 1, 1, 1, 0, 230271, '', 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'eaae5e681b45d340', 0, 0, 0),
(39, 2, 6, '', 0, '', 1354999195, 'Snappy [Bot]', 'snappy [bot]', '', 1354999195, 0, '', 0, '', 0, 1354999195, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 'it', '0.00', 0, '|d/m/Y|, G:i', 4, 0, '9E8DA7', 0, 0, 0, 0, -3, 0, 0, 't', 'd', 0, 't', 'a', 0, 1, 0, 1, 1, 1, 0, 230271, '', 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'ed10e989294d88ad', 0, 0, 0),
(40, 2, 6, '', 0, '', 1354999195, 'Steeler [Crawler]', 'steeler [crawler]', '', 1354999195, 0, '', 0, '', 0, 1354999195, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 'it', '0.00', 0, '|d/m/Y|, G:i', 4, 0, '9E8DA7', 0, 0, 0, 0, -3, 0, 0, 't', 'd', 0, 't', 'a', 0, 1, 0, 1, 1, 1, 0, 230271, '', 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1248a5ba2be17d43', 0, 0, 0),
(41, 2, 6, '', 0, '', 1354999195, 'Synoo [Bot]', 'synoo [bot]', '', 1354999195, 0, '', 0, '', 0, 1354999195, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 'it', '0.00', 0, '|d/m/Y|, G:i', 4, 0, '9E8DA7', 0, 0, 0, 0, -3, 0, 0, 't', 'd', 0, 't', 'a', 0, 1, 0, 1, 1, 1, 0, 230271, '', 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '84777858e0e45a06', 0, 0, 0),
(42, 2, 6, '', 0, '', 1354999195, 'Telekom [Bot]', 'telekom [bot]', '', 1354999195, 0, '', 0, '', 0, 1354999195, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 'it', '0.00', 0, '|d/m/Y|, G:i', 4, 0, '9E8DA7', 0, 0, 0, 0, -3, 0, 0, 't', 'd', 0, 't', 'a', 0, 1, 0, 1, 1, 1, 0, 230271, '', 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '83b0661a99dde85b', 0, 0, 0),
(43, 2, 6, '', 0, '', 1354999195, 'TurnitinBot [Bot]', 'turnitinbot [bot]', '', 1354999195, 0, '', 0, '', 0, 1354999195, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 'it', '0.00', 0, '|d/m/Y|, G:i', 4, 0, '9E8DA7', 0, 0, 0, 0, -3, 0, 0, 't', 'd', 0, 't', 'a', 0, 1, 0, 1, 1, 1, 0, 230271, '', 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'bed00ad1d52d6996', 0, 0, 0),
(44, 2, 6, '', 0, '', 1354999196, 'Voyager [Bot]', 'voyager [bot]', '', 1354999196, 0, '', 0, '', 0, 1354999196, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 'it', '0.00', 0, '|d/m/Y|, G:i', 4, 0, '9E8DA7', 0, 0, 0, 0, -3, 0, 0, 't', 'd', 0, 't', 'a', 0, 1, 0, 1, 1, 1, 0, 230271, '', 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'fca9527595fdef62', 0, 0, 0),
(45, 2, 6, '', 0, '', 1354999196, 'W3 [Sitesearch]', 'w3 [sitesearch]', '', 1354999196, 0, '', 0, '', 0, 1354999196, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 'it', '0.00', 0, '|d/m/Y|, G:i', 4, 0, '9E8DA7', 0, 0, 0, 0, -3, 0, 0, 't', 'd', 0, 't', 'a', 0, 1, 0, 1, 1, 1, 0, 230271, '', 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '36bfa7cc9d0e3ed5', 0, 0, 0),
(46, 2, 6, '', 0, '', 1354999196, 'W3C [Linkcheck]', 'w3c [linkcheck]', '', 1354999196, 0, '', 0, '', 0, 1354999196, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 'it', '0.00', 0, '|d/m/Y|, G:i', 4, 0, '9E8DA7', 0, 0, 0, 0, -3, 0, 0, 't', 'd', 0, 't', 'a', 0, 1, 0, 1, 1, 1, 0, 230271, '', 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '9957b28618d3b4df', 0, 0, 0),
(47, 2, 6, '', 0, '', 1354999196, 'W3C [Validator]', 'w3c [validator]', '', 1354999196, 0, '', 0, '', 0, 1354999196, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 'it', '0.00', 0, '|d/m/Y|, G:i', 4, 0, '9E8DA7', 0, 0, 0, 0, -3, 0, 0, 't', 'd', 0, 't', 'a', 0, 1, 0, 1, 1, 1, 0, 230271, '', 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '320ca0a77d82c427', 0, 0, 0),
(48, 2, 6, '', 0, '', 1354999196, 'WiseNut [Bot]', 'wisenut [bot]', '', 1354999196, 0, '', 0, '', 0, 1354999196, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 'it', '0.00', 0, '|d/m/Y|, G:i', 4, 0, '9E8DA7', 0, 0, 0, 0, -3, 0, 0, 't', 'd', 0, 't', 'a', 0, 1, 0, 1, 1, 1, 0, 230271, '', 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '9617c9f7db1b1f3e', 0, 0, 0),
(49, 2, 6, '', 0, '', 1354999197, 'YaCy [Bot]', 'yacy [bot]', '', 1354999197, 0, '', 0, '', 0, 1354999197, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 'it', '0.00', 0, '|d/m/Y|, G:i', 4, 0, '9E8DA7', 0, 0, 0, 0, -3, 0, 0, 't', 'd', 0, 't', 'a', 0, 1, 0, 1, 1, 1, 0, 230271, '', 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '19a55d5237e276ee', 0, 0, 0),
(50, 2, 6, '', 0, '', 1354999197, 'Yahoo MMCrawler [Bot]', 'yahoo mmcrawler [bot]', '', 1354999197, 0, '', 0, '', 0, 1354999197, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 'it', '0.00', 0, '|d/m/Y|, G:i', 4, 0, '9E8DA7', 0, 0, 0, 0, -3, 0, 0, 't', 'd', 0, 't', 'a', 0, 1, 0, 1, 1, 1, 0, 230271, '', 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '6ef4a79525d0dac4', 0, 0, 0),
(51, 2, 6, '', 0, '', 1354999197, 'Yahoo Slurp [Bot]', 'yahoo slurp [bot]', '', 1354999197, 0, '', 0, '', 0, 1354999197, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 'it', '0.00', 0, '|d/m/Y|, G:i', 4, 0, '9E8DA7', 0, 0, 0, 0, -3, 0, 0, 't', 'd', 0, 't', 'a', 0, 1, 0, 1, 1, 1, 0, 230271, '', 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '834daa7d8ddcc495', 0, 0, 0),
(52, 2, 6, '', 0, '', 1354999197, 'Yahoo [Bot]', 'yahoo [bot]', '', 1354999197, 0, '', 0, '', 0, 1354999197, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 'it', '0.00', 0, '|d/m/Y|, G:i', 4, 0, '9E8DA7', 0, 0, 0, 0, -3, 0, 0, 't', 'd', 0, 't', 'a', 0, 1, 0, 1, 1, 1, 0, 230271, '', 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '75aefc5af13b67aa', 0, 0, 0),
(53, 2, 6, '', 0, '', 1354999197, 'YahooSeeker [Bot]', 'yahooseeker [bot]', '', 1354999197, 0, '', 0, '', 0, 1354999197, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 'it', '0.00', 0, '|d/m/Y|, G:i', 4, 0, '9E8DA7', 0, 0, 0, 0, -3, 0, 0, 't', 'd', 0, 't', 'a', 0, 1, 0, 1, 1, 1, 0, 230271, '', 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '6872f262fe114cb4', 0, 0, 0),
(54, 0, 3, '', 0, '', 0, 'Genitore1', '', '$H$9gks7rwydvAle.osMJlLvdYv2MfzdP/', 1355029237, 0, '', 0, '', 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, '', '0.00', 0, 'd M Y H:i', 0, 0, '', 0, 0, 0, 0, -3, 0, 0, 't', 'd', 0, 't', 'a', 0, 1, 0, 1, 1, 1, 1, 230271, '', 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 1, 0, 0),
(56, 0, 2, '', 0, '::1', 1355162969, 'ciaomondo', 'ciaomondo', '$H$9hRJ0RE7VOMP3cWa2jQuP0YRIQoAdD0', 1355162969, 0, 'ciccio@tin.it', 123711018613, '', 1355163010, 1355162969, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 'it', '0.00', 0, '|d/m/Y|, G:i', 4, 0, '', 0, 0, 0, 0, -3, 0, 0, 't', 'd', 0, 't', 'a', 0, 1, 0, 1, 1, 1, 1, 230271, '', 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '4e0ddbcdf3ae7804', 1, 0, 0),
(57, 0, 2, '', 0, '::1', 1355169220, 'genitore2', 'genitore2', '$H$91eJ/ZuYJXYpb/fqq2jm.pIm1LnTmW.', 1355169220, 0, 'prova@hotmail.it', 128444149616, '', 1355174037, 1355169220, 1355173113, '', '', 0, 0, 0, 0, 0, 0, 1, 'it', '0.00', 0, '|d/m/Y|, G:i', 4, 0, '', 0, 0, 0, 0, -3, 0, 0, 't', 'd', 0, 't', 'a', 0, 1, 0, 1, 1, 1, 1, 230271, '', 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'e6d8a65c47a76ddc', 1, 0, 0),
(58, 0, 2, '', 0, '::1', 1355174541, 'genitore1', 'genitore1', '$H$9uAZ8WUI4Pneo/uiBglHVN0JSCO5ui1', 1355174541, 0, 'a@tic.it', 32536018108, '', 1355181902, 1355174541, 1355174726, '', '', 0, 0, 0, 0, 0, 0, 1, 'it', '0.00', 0, '|d/m/Y|, G:i', 4, 0, '', 0, 0, 0, 0, -3, 0, 0, 't', 'd', 0, 't', 'a', 0, 1, 0, 1, 1, 1, 1, 230271, '', 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '0502a3cdd7af31c5', 1, 0, 0);

-- --------------------------------------------------------

--
-- Struttura della tabella `phpbb_user_group`
--

CREATE TABLE IF NOT EXISTS `phpbb_user_group` (
  `group_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `group_leader` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `user_pending` tinyint(1) unsigned NOT NULL DEFAULT '1',
  KEY `group_id` (`group_id`),
  KEY `user_id` (`user_id`),
  KEY `group_leader` (`group_leader`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dump dei dati per la tabella `phpbb_user_group`
--

INSERT INTO `phpbb_user_group` (`group_id`, `user_id`, `group_leader`, `user_pending`) VALUES
(2, 2, 0, 0),
(4, 2, 0, 0),
(5, 2, 1, 0),
(6, 3, 0, 0),
(6, 4, 0, 0),
(6, 5, 0, 0),
(6, 6, 0, 0),
(6, 7, 0, 0),
(6, 8, 0, 0),
(6, 9, 0, 0),
(6, 10, 0, 0),
(6, 11, 0, 0),
(6, 12, 0, 0),
(6, 13, 0, 0),
(6, 14, 0, 0),
(6, 15, 0, 0),
(6, 16, 0, 0),
(6, 17, 0, 0),
(6, 18, 0, 0),
(6, 19, 0, 0),
(6, 20, 0, 0),
(6, 21, 0, 0),
(6, 22, 0, 0),
(6, 23, 0, 0),
(6, 24, 0, 0),
(6, 25, 0, 0),
(6, 26, 0, 0),
(6, 27, 0, 0),
(6, 28, 0, 0),
(6, 29, 0, 0),
(6, 30, 0, 0),
(6, 31, 0, 0),
(6, 32, 0, 0),
(6, 33, 0, 0),
(6, 34, 0, 0),
(6, 35, 0, 0),
(6, 36, 0, 0),
(6, 37, 0, 0),
(6, 38, 0, 0),
(6, 39, 0, 0),
(6, 40, 0, 0),
(6, 41, 0, 0),
(6, 42, 0, 0),
(6, 43, 0, 0),
(6, 44, 0, 0),
(6, 45, 0, 0),
(6, 46, 0, 0),
(6, 47, 0, 0),
(6, 48, 0, 0),
(6, 49, 0, 0),
(6, 50, 0, 0),
(6, 51, 0, 0),
(6, 52, 0, 0),
(6, 53, 0, 0),
(2, 57, 0, 0),
(2, 58, 0, 0),
(7, 58, 0, 0),
(2, 60, 0, 0),
(7, 60, 0, 0);

-- --------------------------------------------------------

--
-- Struttura della tabella `phpbb_warnings`
--

CREATE TABLE IF NOT EXISTS `phpbb_warnings` (
  `warning_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `post_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `log_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `warning_time` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`warning_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struttura della tabella `phpbb_words`
--

CREATE TABLE IF NOT EXISTS `phpbb_words` (
  `word_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `word` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `replacement` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`word_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struttura della tabella `phpbb_zebra`
--

CREATE TABLE IF NOT EXISTS `phpbb_zebra` (
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `zebra_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `friend` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `foe` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_id`,`zebra_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Struttura della tabella `possiede`
--

CREATE TABLE IF NOT EXISTS `possiede` (
  `retta` int(11) DEFAULT NULL,
  `extra` int(11) DEFAULT NULL,
  KEY `retta` (`retta`),
  KEY `extra` (`extra`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `possiede`
--

INSERT INTO `possiede` (`retta`, `extra`) VALUES
(1, 1),
(4, 2),
(3, 2),
(2, 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `programma_educativo_settimanale`
--

CREATE TABLE IF NOT EXISTS `programma_educativo_settimanale` (
  `id` int(11) NOT NULL,
  `settimana` varchar(50) DEFAULT NULL,
  `descrizione` varchar(100) DEFAULT NULL,
  `obiettivi` varchar(50) DEFAULT NULL,
  `psico_pedagogo` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `psico_pedagogo` (`psico_pedagogo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `programma_educativo_settimanale`
--

INSERT INTO `programma_educativo_settimanale` (`id`, `settimana`, `descrizione`, `obiettivi`, `psico_pedagogo`) VALUES
(1, '10-16/10/2012', 'Programma educativo X', 'X del bambino', 'DMLLFN71L12A333B'),
(2, '17-23/10/2012', 'Programma educativo Y', 'Y del bambino', 'DMLLFN71L12A333B'),
(3, '1-7/12/2012', 'Programma Educativo Z', 'Z del bambino', 'VRRMDD64T32A048N');

-- --------------------------------------------------------

--
-- Struttura della tabella `psico_pedagogo`
--

CREATE TABLE IF NOT EXISTS `psico_pedagogo` (
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

--
-- Dump dei dati per la tabella `psico_pedagogo`
--

INSERT INTO `psico_pedagogo` (`nome`, `cognome`, `codice_fiscale`, `telefono`, `email`, `data_di_nascita`, `comune_di_nascita`, `indirizzo_residenza`, `numero_classi`, `numero_civico_residenza`, `cap_residenza`, `comune_residenza`, `provincia_residenza`, `indirizzo_domicilio`, `numero_civico_domicilio`, `cap_domicilio`, `comune_domicilio`, `provincia_domicilio`, `cittadinanza`) VALUES
('Alfonso', 'D''Amelia', 'DMLLFN71L12A333B', '0899611333', 'adam@hotmail.it', '1971-11-13', 'Avellino (AV)', 'via Faraldo', 1, '3', '84084', 'Fisciano', 'SA', 'via Faraldo', '1', '84084', 'Fisciano', 'SA', 'Italiana'),
('Maddalena', 'Verrone', 'VRRMDD64T32A048N', '0895818293', 'mverrone@alice.it', '1964-11-15', 'Salerno (SA)', 'via Z', 2, '3', '84100', 'Salerno', 'SA', 'via Z', '2', '84100', 'Salerno', 'SA', 'Italiana');

-- --------------------------------------------------------

--
-- Struttura della tabella `questionario`
--

CREATE TABLE IF NOT EXISTS `questionario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `flag_rinuncia` varchar(50) DEFAULT NULL,
  `pathname` varchar(100) DEFAULT NULL,
  `periodo_inizio` date DEFAULT NULL,
  `periodo_fine` date DEFAULT NULL,
  `nome` varchar(50) DEFAULT NULL,
  `descrizione` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- Struttura della tabella `registro`
--

CREATE TABLE IF NOT EXISTS `registro` (
  `id` int(11) NOT NULL,
  `anno` varchar(50) DEFAULT NULL,
  `classe` int(11) DEFAULT NULL,
  `educatore_didattico` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `classe` (`classe`),
  KEY `educatore_didattico` (`educatore_didattico`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `registro`
--

INSERT INTO `registro` (`id`, `anno`, `classe`, `educatore_didattico`) VALUES
(1, '2012/2013', 1, 'SLLMRA90A29N830P	'),
(2, '2012/2013', 2, 'SSSLRL78B19B908X	'),
(3, '2012/2013', 3, 'TRSLNE99S30X203Y');

-- --------------------------------------------------------

--
-- Struttura della tabella `registro_tirocinante`
--

CREATE TABLE IF NOT EXISTS `registro_tirocinante` (
  `id` int(5) NOT NULL,
  `descrizione` varchar(50) DEFAULT NULL,
  `ore_totali` varchar(10) DEFAULT NULL,
  `valutazione` varchar(150) DEFAULT NULL,
  `attivita_tirocinante` int(5) DEFAULT NULL,
  `tirocinante` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `attivita_tirocinante` (`attivita_tirocinante`),
  KEY `tirocinante` (`tirocinante`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `registro_tirocinante`
--

INSERT INTO `registro_tirocinante` (`id`, `descrizione`, `ore_totali`, `valutazione`, `attivita_tirocinante`, `tirocinante`) VALUES
(1, 'Registro Tirocinante Davide Ciarmoli', '69', 'XY', 978786, 'CRMDVD90L12C888B'),
(2, 'Registro Tirocinante Cristina Mezzano', '6543', 'AXY', 978786, 'MZZCRS91L44X098Y');

-- --------------------------------------------------------

--
-- Struttura della tabella `responsabile_questionario`
--

CREATE TABLE IF NOT EXISTS `responsabile_questionario` (
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

--
-- Dump dei dati per la tabella `responsabile_questionario`
--

INSERT INTO `responsabile_questionario` (`nome`, `cognome`, `codice_fiscale`, `email`, `data_di_nascita`, `comune_di_nascita`, `telefono`, `indirizzo_residenza`, `numero_civico_residenza`, `cap_residenza`, `comune_residenza`, `provincia_residenza`, `indirizzo_domicilio`, `numero_civico_domicilio`, `cap_domicilio`, `comune_domicilio`, `provincia_domicilio`, `cittadinanza`) VALUES
('Arturo', 'De Santis', 'DSTRTR58L32A333B', 'ads@live.it', '1987-06-29', 'Salerno', '6789012345', 'via X', '69', '84100', 'Salerno', 'SA', 'Via X', '69 ', '84100', 'Salerno', 'SA', 'Italiana');

-- --------------------------------------------------------

--
-- Struttura della tabella `responsabile_tirocini`
--

CREATE TABLE IF NOT EXISTS `responsabile_tirocini` (
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

--
-- Dump dei dati per la tabella `responsabile_tirocini`
--

INSERT INTO `responsabile_tirocini` (`nome`, `cognome`, `codice_fiscale`, `email`, `data_di_nascita`, `comune_di_nascita`, `telefono`, `indirizzo_residenza`, `numero_civico_residenza`, `cap_residenza`, `comune_residenza`, `provincia_residenza`, `indirizzo_domicilio`, `numero_civico_domicilio`, `cap_domicilio`, `comune_domicilio`, `provincia_domicilio`, `cittadinanza`) VALUES
('Giovanni', 'De Blasi', 'DBSGVN66B12C761W', 'deblasi@unisa.it', '1966-02-12', 'Caserta', '0823445590', 'via De Gasperi', '12', '81100', 'Caserta', 'CE', 'via De Gasperi', '12', '81100', 'Caserta', 'CE', 'Italiana');

-- --------------------------------------------------------

--
-- Struttura della tabella `retta`
--

CREATE TABLE IF NOT EXISTS `retta` (
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

--
-- Dump dei dati per la tabella `retta`
--

INSERT INTO `retta` (`importoDovuto`, `id`, `genitore`, `descrizioneTassa`, `descrizioneRata`, `data`, `importoPagato`, `nome`) VALUES
(150, 1, 'CVLMRA69A23B333C', 'Ottobre2012', 'MENSILE', '2012-10-10', 300, 'Fiorenzo Assi'),
(630, 2, 'DBNGPP69A23B222C', 'Ottobre2012', 'MENSILE', '2013-12-21', 888, 'A B'),
(325, 3, 'DCSGVN74A23B224X', 'Ottobre2012', 'MENSILE', '2013-12-21', 346, 'C D'),
(250, 4, 'DFZNDR91L14A909D', 'Ottobre2012', 'MENSILE', '2013-12-21', 222, 'E F'),
(130, 5, 'DRGSNT81A26B045C', 'Ottobre2012', 'MENSILE', '2013-12-21', 253, 'G H'),
(469, 6, 'PSSSNN85L98A980I', 'Ottobre2012', 'MENSILE', '2013-12-21', 330, 'I J'),
(790, 7, 'VLLLRU83A24T928B', 'Ottobre2012', 'MENSILE', '2013-12-21', 120, 'K L');

-- --------------------------------------------------------

--
-- Struttura della tabella `richiesta`
--

CREATE TABLE IF NOT EXISTS `richiesta` (
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

--
-- Dump dei dati per la tabella `richiesta`
--

INSERT INTO `richiesta` (`id`, `tipo`, `menu_richiesto`, `orario_richiesto`, `allegato`, `genitore`, `servizio`) VALUES
(1, 'Variazione menu', 'Latte per intolleranti', '13.00', NULL, 'CVLMRA69A23B333C	', 1),
(2, 'Variazione menu', 'Menù per celiaci', '12.00', NULL, 'DBNGPP69A23B222C', 8);

-- --------------------------------------------------------

--
-- Struttura della tabella `richiesta_tirocinante`
--

CREATE TABLE IF NOT EXISTS `richiesta_tirocinante` (
  `id` int(5) NOT NULL,
  `descrizione` varchar(100) DEFAULT NULL,
  `data` date DEFAULT NULL,
  `ora_inizio` varchar(10) DEFAULT NULL,
  `ora_fine` varchar(10) DEFAULT NULL,
  `numero_tirocinanti` int(3) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `richiesta_tirocinante`
--

INSERT INTO `richiesta_tirocinante` (`id`, `descrizione`, `data`, `ora_inizio`, `ora_fine`, `numero_tirocinanti`) VALUES
(333455, 'Colloqui con i genitori', '2012-12-12', '16:00', '18:00', 5);

-- --------------------------------------------------------

--
-- Struttura della tabella `risposta_questionario`
--

CREATE TABLE IF NOT EXISTS `risposta_questionario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `valore` varchar(50) DEFAULT NULL,
  `genitore` varchar(50) DEFAULT NULL,
  `domanda` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `genitore` (`genitore`),
  KEY `domanda` (`domanda`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=500003 ;

-- --------------------------------------------------------

--
-- Struttura della tabella `schedulazione`
--

CREATE TABLE IF NOT EXISTS `schedulazione` (
  `data` date NOT NULL DEFAULT '2013-12-21',
  `tirocinante` varchar(50) NOT NULL DEFAULT '',
  `massimo` int(5) DEFAULT NULL,
  PRIMARY KEY (`data`,`tirocinante`),
  KEY `tirocinante` (`tirocinante`),
  KEY `massimo` (`massimo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `schedulazione`
--

INSERT INTO `schedulazione` (`data`, `tirocinante`, `massimo`) VALUES
('2012-12-06', 'MZZCRS91L44X098Y', 2);

-- --------------------------------------------------------

--
-- Struttura della tabella `servizio`
--

CREATE TABLE IF NOT EXISTS `servizio` (
  `orario_inizio` varchar(50) DEFAULT NULL,
  `orario_fine` varchar(50) DEFAULT NULL,
  `piano_pasto` varchar(50) DEFAULT NULL,
  `bambino` varchar(50) DEFAULT NULL,
  `orario_utente` int(11) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `bambino` (`bambino`),
  KEY `orario_utente` (`orario_utente`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

-- --------------------------------------------------------

--
-- Struttura della tabella `tirocinante`
--

CREATE TABLE IF NOT EXISTS `tirocinante` (
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
  KEY `contestazione` (`contestazione`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `tirocinante`
--

INSERT INTO `tirocinante` (`nome`, `cognome`, `codice_fiscale`, `telefono`, `email`, `data_di_nascita`, `comune_di_nascita`, `indirizzo_residenza`, `titolo_di_studi`, `ore_totali`, `ore_lavoro`, `personale_asilo`, `stato`, `matricola`, `giudizio_finale`, `numero_civico_residenza`, `cap_residenza`, `comune_residenza`, `provincia_residenza`, `indirizzo_domicilio`, `numero_civico_domicilio`, `cap_domicilio`, `comune_domicilio`, `provincia_domicilio`, `cittadinanza`, `tutor_esterno`, `disponibilita`, `contestazione`) VALUES
('Davide', 'Ciarmoli', 'CRMDVD90L12C888B', '0283039103', 'dciarmoli@yahoo.it', '1990-01-02', 'Benevento', 'Via XXIV Maggio', 'Laureanda in Scienze della Formazione Primaria', 300, 125, 'SNTNTN53N69B309D', 'Boh', '0512111111', 'fpiosp fs', '13', '82100', 'Benevento', 'BN', 'via XXIV Maggio', '13', '82100', 'Benevento', 'BN', 'Italiana', 'Roberta De Vita', 'XY', 1),
('Cristina', 'Mezzano', 'MZZCRS91L44X098Y', '0123456789', 'cmezz@live.it', '1991-12-11', 'Lacco Ameno', 'Via XYZ', 'Laureanda in Scienze della Formazione Primaria', 300, 150, 'BSLSVN62L12B099E', 'Boh', '6301818118', 'sdoifpnasfòhs ', '12', '84184', 'Lacco Ameno', 'NA', 'Via XYZ', '12', '84184', 'Lacco Ameno', 'NA', 'Italiana', 'Vacca Augusta', 'NO!', NULL);

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `account`
--
ALTER TABLE `account`
  ADD CONSTRAINT `account_ibfk_1` FOREIGN KEY (`responsabile_tirocini`) REFERENCES `responsabile_tirocini` (`codice_fiscale`),
  ADD CONSTRAINT `account_ibfk_2` FOREIGN KEY (`tirocinante`) REFERENCES `tirocinante` (`codice_fiscale`),
  ADD CONSTRAINT `account_ibfk_3` FOREIGN KEY (`educatore_didattico`) REFERENCES `educatore_didattico` (`codice_fiscale`);

--
-- Limiti per la tabella `attivita`
--
ALTER TABLE `attivita`
  ADD CONSTRAINT `attivita_ibfk_1` FOREIGN KEY (`nota`) REFERENCES `nota` (`titolo`);

--
-- Limiti per la tabella `bambino`
--
ALTER TABLE `bambino`
  ADD CONSTRAINT `bambino_ibfk_1` FOREIGN KEY (`cf_genitore_nonrichiedente`) REFERENCES `genitore` (`codice_fiscale`);

--
-- Limiti per la tabella `massimo`
--
ALTER TABLE `massimo`
  ADD CONSTRAINT `massimo_ibfk_1` FOREIGN KEY (`personale_asilo`) REFERENCES `personale_asilo` (`codice_fiscale`);

--
-- Limiti per la tabella `partecipa`
--
ALTER TABLE `partecipa`
  ADD CONSTRAINT `partecipa_ibfk_1` FOREIGN KEY (`evento`) REFERENCES `evento` (`id`);

--
-- Limiti per la tabella `personale_asilo`
--
ALTER TABLE `personale_asilo`
  ADD CONSTRAINT `personale_asilo_ibfk_1` FOREIGN KEY (`richiesta_tirocinante`) REFERENCES `richiesta_tirocinante` (`id`),
  ADD CONSTRAINT `personale_asilo_ibfk_2` FOREIGN KEY (`registro_tirocinante`) REFERENCES `registro_tirocinante` (`id`);

--
-- Limiti per la tabella `registro_tirocinante`
--
ALTER TABLE `registro_tirocinante`
  ADD CONSTRAINT `registro_tirocinante_ibfk_1` FOREIGN KEY (`attivita_tirocinante`) REFERENCES `attivita_tirocinante` (`id`),
  ADD CONSTRAINT `registro_tirocinante_ibfk_2` FOREIGN KEY (`tirocinante`) REFERENCES `tirocinante` (`codice_fiscale`),
  ADD CONSTRAINT `registro_tirocinante_ibfk_3` FOREIGN KEY (`tirocinante`) REFERENCES `tirocinante` (`codice_fiscale`);

--
-- Limiti per la tabella `risposta_questionario`
--
ALTER TABLE `risposta_questionario`
  ADD CONSTRAINT `risposta_questionario_ibfk_1` FOREIGN KEY (`domanda`) REFERENCES `domanda_questionario` (`id`) ON UPDATE CASCADE;

--
-- Limiti per la tabella `schedulazione`
--
ALTER TABLE `schedulazione`
  ADD CONSTRAINT `schedulazione_ibfk_1` FOREIGN KEY (`tirocinante`) REFERENCES `tirocinante` (`codice_fiscale`),
  ADD CONSTRAINT `schedulazione_ibfk_2` FOREIGN KEY (`massimo`) REFERENCES `massimo` (`id`);

--
-- Limiti per la tabella `tirocinante`
--
ALTER TABLE `tirocinante`
  ADD CONSTRAINT `tirocinante_ibfk_1` FOREIGN KEY (`contestazione`) REFERENCES `contestazione` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
