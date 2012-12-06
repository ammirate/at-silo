-- phpMyAdmin SQL Dump
-- version 3.2.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generato il: 06 dic, 2012 at 04:11 PM
-- Versione MySQL: 5.1.44
-- Versione PHP: 5.3.1

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `atsilo`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `ACCOUNT`
--

CREATE TABLE IF NOT EXISTS `ACCOUNT` (
  `username` varchar(50) NOT NULL,
  `password` varchar(256) DEFAULT NULL,
  `genitore` varchar(50) DEFAULT NULL,
  `personale_asilo` varchar(50) DEFAULT NULL,
  `psico_pedagogo` varchar(50) DEFAULT NULL,
  `responsabile_questionario` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`username`),
  KEY `genitore` (`genitore`),
  KEY `personale_asilo` (`personale_asilo`),
  KEY `psico_pedagogo` (`psico_pedagogo`),
  KEY `responsabile_questionario` (`responsabile_questionario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `ACCOUNT`
--

INSERT INTO `ACCOUNT` (`username`, `password`, `genitore`, `personale_asilo`, `psico_pedagogo`, `responsabile_questionario`) VALUES
('a.damelia', 'alfonsoda', NULL, NULL, 'DMLLFN71L12A333B', NULL),
('a.defazio', 'andreadf', 'DFZNDR91L14A909D', NULL, NULL, NULL),
('a.desantis', 'arturods', NULL, NULL, NULL, 'DSTRTR58L32A333B'),
('a.senatore', 'antonellas', NULL, 'SNTNTN53N69B309D', NULL, NULL),
('d.tranfa', 'domenicot', NULL, 'TRNDMN64L12T048Y	', NULL, NULL),
('g.delbuono', 'giuseppedb', 'DBNGPP69A23B222C', NULL, NULL, NULL),
('g.dicostanzo', 'giovannadc', 'DCSGVN74A23B224X', NULL, NULL, NULL),
('l.vella', 'laurav', 'VLLLRU83A24T928B', NULL, NULL, NULL),
('m.chiavelli', 'mauroc', 'CVLMRA69A23B333C', NULL, NULL, NULL),
('m.verrone', 'maddalenav', NULL, NULL, 'VRRMDD64T32A048N', NULL),
('s.buselli', 'silvanab', NULL, 'BSLSVN62L12B099E', NULL, NULL),
('s.delregno', 'santodr', 'DRGSNT81A26B045C', NULL, NULL, NULL),
('s.passaro', 'susannap', 'PSSSNN85L98A980I', NULL, NULL, NULL),
('v.mars', 'veronicam', NULL, 'MRSVRN90A32B235B', NULL, NULL);

-- --------------------------------------------------------

--
-- Struttura della tabella `ASSENZA`
--

CREATE TABLE IF NOT EXISTS `ASSENZA` (
  `bambino` varchar(50) DEFAULT NULL,
  `data` date DEFAULT NULL,
  KEY `bambino` (`bambino`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `ASSENZA`
--

INSERT INTO `ASSENZA` (`bambino`, `data`) VALUES
('CVLRRA12A23B333C', '2012-11-06'),
('DFZGNN12L14A909D', '2012-09-10');

-- --------------------------------------------------------

--
-- Struttura della tabella `ATTIVITA`
--

CREATE TABLE IF NOT EXISTS `ATTIVITA` (
  `titolo` varchar(50) NOT NULL,
  `descrizione` varchar(100) DEFAULT NULL,
  `categoria` varchar(50) DEFAULT NULL,
  `programma_educativo_settimanale` int(11) DEFAULT NULL,
  `registro` int(11) DEFAULT NULL,
  `path` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`titolo`),
  KEY `programma_educativo_settimanale` (`programma_educativo_settimanale`),
  KEY `registro` (`registro`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `ATTIVITA`
--

INSERT INTO `ATTIVITA` (`titolo`, `descrizione`, `categoria`, `programma_educativo_settimanale`, `registro`, `path`) VALUES
('Attività X1', 'X1', 'X', 1, 1, NULL),
('Attività X2', 'X2', 'X', 1, 1, NULL),
('Attività Y1', 'Y1', 'Y', 2, 2, NULL),
('Attività Y2', 'Y2', 'Y', 2, 2, NULL),
('Attività Z1', 'Z1', 'Z', 3, 3, NULL),
('Attività Z2', 'Z2', 'Z', 3, 3, NULL);

-- --------------------------------------------------------

--
-- Struttura della tabella `BAMBINO`
--

CREATE TABLE IF NOT EXISTS `BAMBINO` (
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
  PRIMARY KEY (`codice_fiscale`),
  KEY `classe` (`classe`),
  KEY `genitore` (`genitore`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `BAMBINO`
--

INSERT INTO `BAMBINO` (`nome`, `cognome`, `codice_fiscale`, `data_di_nascita`, `indirizzo_residenza`, `categoria_appartenenza`, `genitore`, `classe`, `cittadinanza`, `comune_di_nascita`, `numero_civico_residenza`, `cap_residenza`, `comune_residenza`, `provincia_residenza`, `indirizzo_domicilio`, `numero_civico_domicilio`, `cap_domicilio`, `comune_domicilio`, `provincia_domicilio`) VALUES
('Aurora', 'Chiavelli', 'CVLRRA12A23B333C', '2012-09-07', 'via Roma, 2 - Fisciano (SA)', 'Lattanti', 'CVLMRA69A23B333C', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('Luca', 'Del Buono', 'DBNLCU11A23B222C', '2011-12-30', 'via degli Ulivi, 16 - 00100 Roma', 'Semisvezzati', 'DBNGPP69A23B222C', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('Maria', 'Del Buono', 'DBNMRA11A23B222C', '2010-11-17', 'via degli Ulivi, 16 - 00100 Roma', 'Svezzati', 'DBNGPP69A23B222C', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('Gennaro', 'De Fazio', 'DFZGNN12L14A909D', '2012-09-11', 'via delle X, 69 - Vallo della Lucania (SA)', 'Lattanti', 'DFZNDR91L14A909D', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('Candida', 'Del Regno', 'DRGCND10A26B045C', '2010-11-01', 'via delle Y, 10 - Avellino (AV)', 'Svezzati', 'DRGSNT81A26B045C', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('Luigi', 'Mascia', 'MSCLGU12A24T928B', '2012-10-16', 'piazza Risorgimento, 1 - Benevento (BN)', 'Lattanti', 'VLLLRU83A24T928B', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('Marco', 'Pilato', 'PLTMRC11A23B224X	', '2011-11-08', 'via Ferreria, 12 - Baronissi (SA)', 'Semisvezzati', 'DCSGVN74A23B224X', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('Matteo', 'Scalo', 'SCLMTT12L98A980I', '2012-01-31', 'piazza Malta, 23 - Salerno (SA)	', 'Semisvezzati', 'PSSSNN85L98A980I', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('Annalisa', 'Scalo', 'SCLNNA11L98A980I', '2011-11-22', 'piazza Malta, 23 - Salerno (SA)	', 'Svezzati', 'PSSSNN85L98A980I', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Struttura della tabella `BANDO`
--

CREATE TABLE IF NOT EXISTS `BANDO` (
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
-- Dump dei dati per la tabella `BANDO`
--

INSERT INTO `BANDO` (`id`, `data_inizio_bando`, `data_fine_bando`, `data_inizio_presentazione_rinuncia`, `data_fine_presentazione_rinuncia`, `data_fine_rinuncia`, `posti_disponibili`, `path`) VALUES
(1, '2012-11-01', '2012-11-30', '0000-00-00', '0000-00-00', '0000-00-00', 0, NULL),
(2, '2011-11-01', '2012-11-30', '0000-00-00', '0000-00-00', '0000-00-00', 0, NULL);

-- --------------------------------------------------------

--
-- Struttura della tabella `CAMPO_DOMANDA_QUESTIONARIO`
--

CREATE TABLE IF NOT EXISTS `CAMPO_DOMANDA_QUESTIONARIO` (
  `domanda_questionario` int(11) DEFAULT NULL,
  `tipo` varchar(50) DEFAULT NULL,
  `descrizione` varchar(100) DEFAULT NULL,
  `valore` varchar(50) DEFAULT NULL,
  `risposta_questionario` int(11) DEFAULT NULL,
  KEY `domanda_questionario` (`domanda_questionario`),
  KEY `risposta_questionario` (`risposta_questionario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `CAMPO_DOMANDA_QUESTIONARIO`
--

INSERT INTO `CAMPO_DOMANDA_QUESTIONARIO` (`domanda_questionario`, `tipo`, `descrizione`, `valore`, `risposta_questionario`) VALUES
(1, 'radio', 'Lattante', 'Lattante', NULL),
(1, 'radio', 'Semi-divezzi', 'Semi-divezzi', NULL),
(1, 'radio', 'Divezzi', 'Divezzi', NULL),
(2, 'radio', 'Part-time senza pranzo', 'Part-time senza pranzo', NULL),
(2, 'radio', 'Part-time con pranzo', 'Part-time con pranzo', NULL),
(2, 'radio', 'Full-time', 'Full-time', NULL),
(4, 'int', 'Anno di nascita della madre', NULL, NULL),
(4, 'int', 'Anno di nascita del padre', NULL, NULL),
(5, 'int', 'Numero dei componenti della famiglia', NULL, NULL),
(6, 'tipo X', 'Domanda X', NULL, NULL),
(7, 'tipo Y', 'Domanda Y', NULL, NULL),
(8, 'tipo Z', 'Domanda Z', NULL, NULL),
(9, 'tipo ABC', 'Domanda ABC', NULL, NULL);

-- --------------------------------------------------------

--
-- Struttura della tabella `CLASSE`
--

CREATE TABLE IF NOT EXISTS `CLASSE` (
  `id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `CLASSE`
--

INSERT INTO `CLASSE` (`id`) VALUES
(1),
(2),
(3),
(4);

-- --------------------------------------------------------

--
-- Struttura della tabella `COMPILA`
--

CREATE TABLE IF NOT EXISTS `COMPILA` (
  `questionario` int(11) DEFAULT NULL,
  `genitore` varchar(50) DEFAULT NULL,
  KEY `questionario` (`questionario`),
  KEY `genitore` (`genitore`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `COMPILA`
--


-- --------------------------------------------------------

--
-- Struttura della tabella `DOMANDA_ISCRIZIONE`
--

CREATE TABLE IF NOT EXISTS `DOMANDA_ISCRIZIONE` (
  `id` int(11) NOT NULL,
  `data_presentazione` date DEFAULT NULL,
  `punteggio` int(50) DEFAULT NULL,
  `posizione` int(50) DEFAULT NULL,
  `genitore` varchar(50) DEFAULT NULL,
  `servizio` int(11) DEFAULT NULL,
  `bambino` varchar(50) DEFAULT NULL,
  `stato_domanda` varchar(50) DEFAULT NULL,
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
  PRIMARY KEY (`id`),
  KEY `genitore` (`genitore`),
  KEY `bambino` (`bambino`),
  KEY `servizio` (`servizio`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `DOMANDA_ISCRIZIONE`
--

INSERT INTO `DOMANDA_ISCRIZIONE` (`id`, `data_presentazione`, `punteggio`, `posizione`, `genitore`, `servizio`, `bambino`, `stato_domanda`, `certificato_malattie`, `certificato_vaccinazioni`, `certificato_privacy`, `bambino_disabile`, `genitore_invalido`, `genitore_solo`, `genitore_vedovo`, `genitore_nubile`, `genitore_separato`, `figlio_non_riconosciuto`, `affido_esclusivo`, `altri_componenti_disabili`, `condizioni_calcolo_punteggio`, `isee`) VALUES
(1, '2012-07-19', 94, 1, 'CVLMRA69A23B333C', 1, 'CVLRRA12A23B333C', '', '', '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0),
(2, '2012-08-13', 93, 2, 'DBNGPP69A23B222C', 7, 'DBNLCU11A23B222C', '', '', '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0),
(3, '2012-08-13', 94, 3, 'DBNGPP69A23B222C', 8, 'DBNMRA11A23B222C', '', '', '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0),
(4, '2012-11-01', 91, 4, 'DFZNDR91L14A909D', 2, 'DFZGNN12L14A909D', '', '', '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0),
(5, '2012-06-12', 90, 5, 'DRGSNT81A26B045C', 5, 'DRGCND10A26B045C', '', '', '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0),
(6, '2012-09-25', 88, 6, 'VLLLRU83A24T928B', 6, 'MSCLGU12A24T928B', '', '', '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0),
(7, '2012-08-01', 85, 7, 'DCSGVN74A23B224X', 9, 'PLTMRC11A23B224X ', '', '', '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0),
(8, '2012-08-28', 79, 8, 'PSSSNN85L98A980I', 4, 'SCLMTT12L98A980I', '', '', '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0),
(9, '2012-08-28', 79, 9, 'PSSSNN85L98A980I', 3, 'SCLNNA11L98A980I', '', '', '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0);

-- --------------------------------------------------------

--
-- Struttura della tabella `DOMANDA_QUESTIONARIO`
--

CREATE TABLE IF NOT EXISTS `DOMANDA_QUESTIONARIO` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descrizione` varchar(100) DEFAULT NULL,
  `questionario` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `questionario` (`questionario`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dump dei dati per la tabella `DOMANDA_QUESTIONARIO`
--

INSERT INTO `DOMANDA_QUESTIONARIO` (`id`, `descrizione`, `questionario`) VALUES
(1, 'Sezione di appartenenza del bambino', 1),
(2, 'Regime di frequenza del bambino', 1),
(4, 'Anno di nascita dei genitori', 1),
(5, 'Numero dei componenti della famiglia', 1),
(6, 'Domanda X', 2),
(7, 'Domanda Y', 2),
(8, 'Domanda Z', 2);

-- --------------------------------------------------------

--
-- Struttura della tabella `EDUCATORE_DIDATTICO`
--

CREATE TABLE IF NOT EXISTS `EDUCATORE_DIDATTICO` (
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
-- Dump dei dati per la tabella `EDUCATORE_DIDATTICO`
--

INSERT INTO `EDUCATORE_DIDATTICO` (`nome`, `cognome`, `codice_fiscale`, `titolo_di_studi`, `data_di_nascita`, `telefono`, `email`, `comune_di_nascita`, `indirizzo_residenza`, `numero_civico_residenza`, `cap_residenza`, `comune_residenza`, `provincia_residenza`, `cittadinanza`, `indirizzo_domicilio`, `numero_civico_domicilio`, `cap_domicilio`, `comune_domicilio`, `provincia_domicilio`) VALUES
('Mauro', 'Sisillo', 'SLLMRA90A29N830P', 'Laurea in Lettere', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0', '0', '', ''),
('Lorella', 'Sessa', 'SSSLRL78B19B908X', 'Laurea in Scienze della Formazione', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0', '0', '', ''),
('Elena', 'Teresi', 'TRSLNE99S30X203Y', 'Laurea in Matematica', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0', '0', '', '');

-- --------------------------------------------------------

--
-- Struttura della tabella `EVENTO`
--

CREATE TABLE IF NOT EXISTS `EVENTO` (
  `nome` varchar(50) NOT NULL DEFAULT '',
  `data` date NOT NULL DEFAULT '0000-00-00',
  `descrizione` varchar(100) DEFAULT NULL,
  `personale_asilo` varchar(50) DEFAULT NULL,
  `psico_pedagogo` varchar(50) DEFAULT NULL,
  `educatore_didattico` varchar(50) DEFAULT NULL,
  `path` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`nome`,`data`),
  KEY `personale_asilo` (`personale_asilo`),
  KEY `psico_pedagogo` (`psico_pedagogo`),
  KEY `educatore_didattico` (`educatore_didattico`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `EVENTO`
--

INSERT INTO `EVENTO` (`nome`, `data`, `descrizione`, `personale_asilo`, `psico_pedagogo`, `educatore_didattico`, `path`) VALUES
('Gita X', '2012-11-21', 'Gita a X', '', 'SSSLRL78B19B908X', NULL, NULL),
('Recita Y', '2012-11-30', 'Recita su Y', NULL, 'VRRMDD64T32A048N', NULL, NULL);

-- --------------------------------------------------------

--
-- Struttura della tabella `EXTRA`
--

CREATE TABLE IF NOT EXISTS `EXTRA` (
  `id` int(11) NOT NULL,
  `importo` float DEFAULT NULL,
  `data_inizio` date DEFAULT NULL,
  `data_fine` date DEFAULT NULL,
  `descrizione` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `EXTRA`
--

INSERT INTO `EXTRA` (`id`, `importo`, `data_inizio`, `data_fine`, `descrizione`) VALUES
(1, 15, '2012-11-01', '2012-11-30', 'Mantenimento bambino fuori orario'),
(2, 120, '2012-07-01', '2012-07-31', 'Servizio di intrattenimento optional');

-- --------------------------------------------------------

--
-- Struttura della tabella `FATTURA`
--

CREATE TABLE IF NOT EXISTS `FATTURA` (
  `id` int(11) NOT NULL,
  `descrizione` varchar(100) DEFAULT NULL,
  `personale_asilo` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `personale_asilo` (`personale_asilo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `FATTURA`
--


-- --------------------------------------------------------

--
-- Struttura della tabella `FEEDBACK`
--

CREATE TABLE IF NOT EXISTS `FEEDBACK` (
  `id` int(11) NOT NULL,
  `descrizione` varchar(100) DEFAULT NULL,
  `personale_asilo` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `personale_asilo` (`personale_asilo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `FEEDBACK`
--

INSERT INTO `FEEDBACK` (`id`, `descrizione`, `personale_asilo`) VALUES
(1, 'Feedback X', 'MRSVRN90A32B235B'),
(2, 'Feedback Y', 'TRNDMN64L12T048Y');

-- --------------------------------------------------------

--
-- Struttura della tabella `GENITORE`
--

CREATE TABLE IF NOT EXISTS `GENITORE` (
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
  PRIMARY KEY (`codice_fiscale`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `GENITORE`
--

INSERT INTO `GENITORE` (`nome`, `cognome`, `codice_fiscale`, `telefono`, `email`, `data_di_nascita`, `comune_di_nascita`, `indirizzo_residenza`, `tipo`, `categoria_appartenenza`, `cittadinanza`, `comune_residenza`, `numero_civico_residenza`, `cap_residenza`, `provincia_residenza`, `comune_domicilio`, `indirizzo_domicilio`, `numero_civico_domicilio`, `cap_domicilio`, `provincia_domicilio`, `dipendente_presso`, `rapporti_ateneo_salerno`, `rapporti_comune_fisciano`, `rapporto_parentela`, `status_lavorativo`, `scadenza_contratto`) VALUES
('Mauro', 'Chiavelli', 'CVLMRA69A23B333C', '0899601239', 'mchiav@hotmail.it', '1969-11-20', 'Pontecagnano (SA)', 'via Roma, 2 - Fisciano (SA)', 'RESIDENTE', 'ISCRITTO', '', '', '0', '0', '', '', '', '0', '0', '', '', '', '', '', '', '0000-00-00'),
('Giuseppe', 'Del Buono', 'DBNGPP69A23B222C', '0612345678', 'gdb@msn.it', '1969-11-06', 'Roma', 'via degli Ulivi, 16 - 00100 Roma', 'INSEGNANTE', 'ISCRITTO', '', '', '0', '0', '', '', '', '0', '0', '', '', '', '', '', '', '0000-00-00'),
('Giovanna', 'Di Costanzo', 'DCSGVN74A23B224X', '0828123456', 'gds@hotmail.it', '1974-12-30', 'Barano d''Ischia (NA)', 'via Ferreria, 12 - Baronissi (SA)', 'INSEGNANTE', 'ISCRITTO', '', '', '0', '0', '', '', '', '0', '0', '', '', '', '', '', '', '0000-00-00'),
('Andrea', 'De Fazio', 'DFZNDR91L14A909D', '0894215524', 'adf@msn.com', '1991-11-22', 'Vallo della Lucania (SA)', 'via delle X, 69 - Vallo della Lucania (SA)', 'STUDENTE', 'ISCRITTO', '', '', '0', '0', '', '', '', '0', '0', '', '', '', '', '', '', '0000-00-00'),
('Santo', 'Del Regno', 'DRGSNT81A26B045C', '0823120345', 'sdr@msn.com', '1981-10-04', 'Avellino (AV)', 'via delle Y, 10 - Avellino (AV)', 'NON-RESIDENTE', 'ISCRITTO', '', '', '0', '0', '', '', '', '0', '0', '', '', '', '', '', '', '0000-00-00'),
('Susanna', 'Passaro', 'PSSSNN85L98A980I', '0822334556', 'spassaro@virgilio.it', '1985-11-08', 'Salerno', 'piazza Malta, 23 - Salerno (SA)', 'STUDENTE', 'ISCRITTO', '', '', '0', '0', '', '', '', '0', '0', '', '', '', '', '', '', '0000-00-00'),
('Laura', 'Vella', 'VLLLRU83A24T928B', '0829718235', 'laurav@yahoo.it', '1983-03-15', 'Cautano (BN)', 'piazza Risorgimento, 1 - Benevento (BN)', 'INSEGNANTE', 'ISCRITTO', '', '', '0', '0', '', '', '', '0', '0', '', '', '', '', '', '', '0000-00-00');

-- --------------------------------------------------------

--
-- Struttura della tabella `INSEGNA`
--

CREATE TABLE IF NOT EXISTS `INSEGNA` (
  `educatore_didattico` varchar(50) DEFAULT NULL,
  `classe` int(11) DEFAULT NULL,
  KEY `educatore_didattico` (`educatore_didattico`),
  KEY `classe` (`classe`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `INSEGNA`
--

INSERT INTO `INSEGNA` (`educatore_didattico`, `classe`) VALUES
('1', 1),
('1', 2),
('1', 3),
('2', 1),
('2', 2),
('2', 3),
('3', 1),
('3', 2),
('3', 3);

-- --------------------------------------------------------

--
-- Struttura della tabella `MENU_MENSA`
--

CREATE TABLE IF NOT EXISTS `MENU_MENSA` (
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
-- Dump dei dati per la tabella `MENU_MENSA`
--

INSERT INTO `MENU_MENSA` (`categoria_bambino`, `tipologia`, `primo_piatto`, `secondo_piatto`, `frutta`, `data`, `id`, `contorno`) VALUES
('Svezzati', 'Carne', 'Pasta al ragù', 'Cotoletta di pollo', 'Banana', '2012-11-08', 1, NULL),
('Svezzati', 'Pesce', 'Pasta al pomodoro', 'Bastoncini di merluzzo', 'Pera', '2012-11-22', 2, NULL);

-- --------------------------------------------------------

--
-- Struttura della tabella `ORARIO_UTENTE`
--

CREATE TABLE IF NOT EXISTS `ORARIO_UTENTE` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data_inizio` date DEFAULT NULL,
  `data_fine` date DEFAULT NULL,
  `descrizione` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dump dei dati per la tabella `ORARIO_UTENTE`
--

INSERT INTO `ORARIO_UTENTE` (`id`, `data_inizio`, `data_fine`, `descrizione`) VALUES
(1, '2012-11-01', '2012-11-30', 'X'),
(2, '2012-09-17', '2012-09-30', 'Y');

-- --------------------------------------------------------

--
-- Struttura della tabella `PARTECIPA`
--

CREATE TABLE IF NOT EXISTS `PARTECIPA` (
  `evento_data` date DEFAULT NULL,
  `evento_nome` varchar(50) DEFAULT NULL,
  `classe` int(11) DEFAULT NULL,
  KEY `evento_data` (`evento_data`),
  KEY `evento_nome` (`evento_nome`),
  KEY `classe` (`classe`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `PARTECIPA`
--

INSERT INTO `PARTECIPA` (`evento_data`, `evento_nome`, `classe`) VALUES
('2012-11-21', 'Gita X', 2),
('2012-11-30', 'Recita Y', 3),
('2012-11-21', 'Gita X', 1),
('2012-11-30', 'Recita Y', 2),
('2012-11-21', 'Gita X', 3);

-- --------------------------------------------------------

--
-- Struttura della tabella `PERSONALE_ASILO`
--

CREATE TABLE IF NOT EXISTS `PERSONALE_ASILO` (
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
  PRIMARY KEY (`codice_fiscale`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `PERSONALE_ASILO`
--

INSERT INTO `PERSONALE_ASILO` (`nome`, `cognome`, `codice_fiscale`, `categoria_appartenenza`, `email`, `data_di_nascita`, `comune_di_nascita`, `telefono`, `indirizzo_residenza`, `numero_civico_residenza`, `cap_residenza`, `comune_residenza`, `provincia_residenza`, `indirizzo_domicilio`, `numero_civico_domicilio`, `cap_domicilio`, `comune_domicilio`, `provincia_domicilio`, `cittadinanza`) VALUES
('Silvana', 'Buselli', 'BSLSVN62L12B099E', 'IMPIEGATO SEGRETERIA', 'sbuselli@yahoo.it', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('Veronica', 'Mars', 'MRSVRN90A32B235B', 'IMPIEGATO SEGRETERIA', 'vmars@libero.it', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('Antonella', 'Senatore', 'SNTNTN53N69B309D', 'DIRETTORE', 'asenatore@yahoo.it', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('Domenico', 'Tranfa', 'TRNDMN64L12T048Y', 'IMPIEGATO SEGRETERIA', 'dtranfa@yahoo.it', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Struttura della tabella `POSSIEDE`
--

CREATE TABLE IF NOT EXISTS `POSSIEDE` (
  `retta` int(11) DEFAULT NULL,
  `extra` int(11) DEFAULT NULL,
  KEY `retta` (`retta`),
  KEY `extra` (`extra`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `POSSIEDE`
--

INSERT INTO `POSSIEDE` (`retta`, `extra`) VALUES
(1, 1),
(4, 2),
(3, 2),
(2, 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `PROGRAMMA_EDUCATIVO_SETTIMANALE`
--

CREATE TABLE IF NOT EXISTS `PROGRAMMA_EDUCATIVO_SETTIMANALE` (
  `id` int(11) NOT NULL,
  `settimana` varchar(50) DEFAULT NULL,
  `descrizione` varchar(100) DEFAULT NULL,
  `obiettivi` varchar(50) DEFAULT NULL,
  `psico_pedagogo` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `psico_pedagogo` (`psico_pedagogo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `PROGRAMMA_EDUCATIVO_SETTIMANALE`
--

INSERT INTO `PROGRAMMA_EDUCATIVO_SETTIMANALE` (`id`, `settimana`, `descrizione`, `obiettivi`, `psico_pedagogo`) VALUES
(1, '10-16/10/2012', 'Programma educativo X', 'X del bambino', 'DMLLFN71L12A333B'),
(2, '17-23/10/2012', 'Programma educativo Y', 'Y del bambino', 'DMLLFN71L12A333B'),
(3, '1-7/12/2012', 'Programma Educativo Z', 'Z del bambino', 'VRRMDD64T32A048N');

-- --------------------------------------------------------

--
-- Struttura della tabella `PSICO_PEDAGOGO`
--

CREATE TABLE IF NOT EXISTS `PSICO_PEDAGOGO` (
  `nome` varchar(50) DEFAULT NULL,
  `cognome` varchar(50) DEFAULT NULL,
  `codice_fiscale` varchar(50) NOT NULL,
  `telefono` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `data_di_nascita` date DEFAULT NULL,
  `comune_di_nascita` varchar(50) DEFAULT NULL,
  `indirizzo_residenza` varchar(50) DEFAULT NULL,
  `numero_classi` varchar(50) DEFAULT NULL,
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
-- Dump dei dati per la tabella `PSICO_PEDAGOGO`
--

INSERT INTO `PSICO_PEDAGOGO` (`nome`, `cognome`, `codice_fiscale`, `telefono`, `email`, `data_di_nascita`, `comune_di_nascita`, `indirizzo_residenza`, `numero_classi`, `numero_civico_residenza`, `cap_residenza`, `comune_residenza`, `provincia_residenza`, `indirizzo_domicilio`, `numero_civico_domicilio`, `cap_domicilio`, `comune_domicilio`, `provincia_domicilio`, `cittadinanza`) VALUES
('Alfonso', 'D''Amelia', 'DMLLFN71L12A333B', '0899611333', 'adam@hotmail.it', '1971-11-13', 'Avellino (AV)', 'via Faraldo, 3 - Fisciano (SA)', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('Maddalena', 'Verrone', 'VRRMDD64T32A048N', '0895818293', 'mverrone@alice.it', '1964-11-15', 'Salerno (SA)', 'via Z, 3 - Salerno (SA)', '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Struttura della tabella `QUESTIONARIO`
--

CREATE TABLE IF NOT EXISTS `QUESTIONARIO` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `flag_rinuncia` varchar(50) DEFAULT NULL,
  `pathname` varchar(100) DEFAULT NULL,
  `periodo_inizio` date DEFAULT NULL,
  `periodo_fine` date DEFAULT NULL,
  `nome` varchar(50) DEFAULT NULL,
  `descrizione` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dump dei dati per la tabella `QUESTIONARIO`
--

INSERT INTO `QUESTIONARIO` (`id`, `flag_rinuncia`, `pathname`, `periodo_inizio`, `periodo_fine`, `nome`, `descrizione`) VALUES
(1, NULL, NULL, '2012-12-06', '2012-12-20', 'Controllo qualità', 'QUESTIONARIO CONTROLLO QUALITA’ ASILO NIDO - GRADIMENTO DEI GENITORI'),
(2, NULL, NULL, '2012-11-01', '2012-12-18', 'Questionario X', 'Questionario relativo a X');

-- --------------------------------------------------------

--
-- Struttura della tabella `REGISTRO`
--

CREATE TABLE IF NOT EXISTS `REGISTRO` (
  `classe` int(11) DEFAULT NULL,
  `anno` varchar(50) DEFAULT NULL,
  `educatore_didattico` varchar(50) DEFAULT NULL,
  `id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `classe` (`classe`),
  KEY `educatore_didattico` (`educatore_didattico`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `REGISTRO`
--

INSERT INTO `REGISTRO` (`classe`, `anno`, `educatore_didattico`, `id`) VALUES
(1, '2012/2013', '1', 1),
(2, '2012/2013', '2', 2),
(3, '2012/2013', '3', 3),
(4, '2012/2013', NULL, 4);

-- --------------------------------------------------------

--
-- Struttura della tabella `RESPONSABILE_QUESTIONARIO`
--

CREATE TABLE IF NOT EXISTS `RESPONSABILE_QUESTIONARIO` (
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
-- Dump dei dati per la tabella `RESPONSABILE_QUESTIONARIO`
--

INSERT INTO `RESPONSABILE_QUESTIONARIO` (`nome`, `cognome`, `codice_fiscale`, `email`, `data_di_nascita`, `comune_di_nascita`, `telefono`, `indirizzo_residenza`, `numero_civico_residenza`, `cap_residenza`, `comune_residenza`, `provincia_residenza`, `indirizzo_domicilio`, `numero_civico_domicilio`, `cap_domicilio`, `comune_domicilio`, `provincia_domicilio`, `cittadinanza`) VALUES
('Arturo', 'De Santis', 'DSTRTR58L32A333B', 'ads@live.it', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Struttura della tabella `RETTA`
--

CREATE TABLE IF NOT EXISTS `RETTA` (
  `importo` varchar(50) DEFAULT NULL,
  `id` int(11) NOT NULL,
  `genitore` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `genitore` (`genitore`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `RETTA`
--

INSERT INTO `RETTA` (`importo`, `id`, `genitore`) VALUES
('150.00', 1, 'CVLMRA69A23B333C'),
('630.00', 2, 'DBNGPP69A23B222C'),
('325.00', 3, 'DCSGVN74A23B224X'),
('250.00', 4, 'DFZNDR91L14A909D'),
('130.00', 5, 'DRGSNT81A26B045C'),
('469.00', 6, 'PSSSNN85L98A980I'),
('790.00', 7, 'VLLLRU83A24T928B');

-- --------------------------------------------------------

--
-- Struttura della tabella `RICHIESTA`
--

CREATE TABLE IF NOT EXISTS `RICHIESTA` (
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
-- Dump dei dati per la tabella `RICHIESTA`
--

INSERT INTO `RICHIESTA` (`id`, `tipo`, `menu_richiesto`, `orario_richiesto`, `allegato`, `genitore`, `servizio`) VALUES
(1, 'Variazione menu', 'Latte per intolleranti', '13.00', NULL, 'CVLMRA69A23B333C	', 1),
(2, 'Variazione menu', 'Menù per celiaci', '12.00', NULL, 'DBNGPP69A23B222C', 8);

-- --------------------------------------------------------

--
-- Struttura della tabella `RISPOSTA_QUESTIONARIO`
--

CREATE TABLE IF NOT EXISTS `RISPOSTA_QUESTIONARIO` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `valore` varchar(50) DEFAULT NULL,
  `questionario` int(11) DEFAULT NULL,
  `genitore` varchar(50) DEFAULT NULL,
  `domanda` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `questionario` (`questionario`),
  KEY `genitore` (`genitore`),
  KEY `domanda` (`domanda`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dump dei dati per la tabella `RISPOSTA_QUESTIONARIO`
--


-- --------------------------------------------------------

--
-- Struttura della tabella `SERVIZIO`
--

CREATE TABLE IF NOT EXISTS `SERVIZIO` (
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

--
-- Dump dei dati per la tabella `SERVIZIO`
--

INSERT INTO `SERVIZIO` (`orario_inizio`, `orario_fine`, `piano_pasto`, `bambino`, `orario_utente`, `id`) VALUES
('9.00', '18.00', 'Sì', 'CVLRRA12A23B333C', 1, 1),
('9.00', '13.00', 'No', 'DFZGNN12L14A909D', 1, 2),
('9.00', '18.00', 'No', 'SCLNNA11L98A980I', 1, 3),
('9.00', '18.00', 'No', 'SCLMTT12L98A980I', 1, 4),
('9.00', '12.00', 'No', 'DRGCND10A26B045C', 2, 5),
('9.00', '15.00', 'Sì', 'MSCLGU12A24T928B', 2, 6),
('12.00', '18.00', 'Sì', 'DBNLCU11A23B222C', 1, 7),
('12.00', '18.00', 'Sì', 'DBNMRA11A23B222C', 1, 8),
('11.00', '16.00', 'Sì', 'PLTMRC11A23B224X ', 1, 9);

-- --------------------------------------------------------

--
-- Struttura della tabella `TIROCINANTE`
--

CREATE TABLE IF NOT EXISTS `TIROCINANTE` (
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
  PRIMARY KEY (`codice_fiscale`),
  KEY `personale_asilo` (`personale_asilo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `TIROCINANTE`
--

INSERT INTO `TIROCINANTE` (`nome`, `cognome`, `codice_fiscale`, `telefono`, `email`, `data_di_nascita`, `comune_di_nascita`, `indirizzo_residenza`, `titolo_di_studi`, `ore_totali`, `ore_lavoro`, `personale_asilo`, `stato`, `matricola`, `giudizio_finale`, `numero_civico_residenza`, `cap_residenza`, `comune_residenza`, `provincia_residenza`, `indirizzo_domicilio`, `numero_civico_domicilio`, `cap_domicilio`, `comune_domicilio`, `provincia_domicilio`, `cittadinanza`) VALUES
('Davide', 'Ciarmoli', 'CRMDVD90L12C888B', '0283039103', 'dciarmoli@yahoo.it', '1990-01-02', 'Benevento', 'Via XXIV Maggio, Benevento', 'Laureanda in Scienze della Formazione Primaria', 300, 125, 'SNTNTN53N69B309D', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('Cristina', 'Mezzano', 'MZZCRS91L44X098Y', '0123456789', 'cmezz@live.it', '1991-12-11', 'Lacco Ameno (NA)', 'Via XYZ, Ischia (NA)', 'Laureanda in Scienze della Formazione Primaria', 300, 150, 'BSLSVN62L12B099E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `RISPOSTA_QUESTIONARIO`
--
ALTER TABLE `RISPOSTA_QUESTIONARIO`
  ADD CONSTRAINT `risposta_questionario_ibfk_1` FOREIGN KEY (`domanda`) REFERENCES `domanda_questionario` (`id`) ON UPDATE CASCADE;
