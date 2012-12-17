-- phpMyAdmin SQL Dump
-- version 3.2.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generato il: 17 dic, 2012 at 10:27 PM
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
('a.defazio', 'andreadf', 'DFZNDR91L14A909D', NULL, NULL, NULL, NULL, NULL, NULL),
('a.desantis', 'arturods', NULL, NULL, NULL, 'DSTRTR58L32A333B', NULL, NULL, NULL),
('a.senatore', 'antonellas', NULL, 'SNTNTN53N69B309D', NULL, NULL, NULL, NULL, NULL),
('c.mezzano', 'cristinam', NULL, NULL, NULL, NULL, NULL, 'MZZCRS91L44X098Y', NULL),
('d.ciarmoli', 'davidec', NULL, NULL, NULL, NULL, NULL, 'CRMDVD90L12C888B', NULL),
('d.crisi', 'domenicoc', NULL, 'CRSDMN64L12T019Y', NULL, NULL, NULL, NULL, NULL),
('d.tranfa', 'domenicot', NULL, 'TRNDMN64L12T048Y', NULL, NULL, NULL, NULL, NULL),
('e.teresi', 'elenat', NULL, NULL, NULL, NULL, NULL, NULL, 'TRSLNE99S30X203Y'),
('g.deblasi', 'giovannidb', NULL, NULL, NULL, NULL, 'DBSGVN66B12C761W', NULL, NULL),
('g.delbuono', 'giuseppedb', 'DBNGPP69A23B222C', NULL, NULL, NULL, NULL, NULL, NULL),
('g.dicostanzo', 'giovannadc', 'DCSGVN74A23B224X', NULL, NULL, NULL, NULL, NULL, NULL),
('l.sessa', 'lorellas', NULL, NULL, NULL, NULL, NULL, NULL, 'SSSLRL78B19B908X'),
('l.vella', 'laurav', 'VLLLRU83A24T928B', NULL, NULL, NULL, NULL, NULL, NULL),
('m.chiavelli', 'mauroc', 'CVLMRA69A23B333C', NULL, NULL, NULL, NULL, NULL, NULL),
('m.sisillo', 'mauros', NULL, NULL, NULL, NULL, NULL, NULL, 'SLLMRA90A29N830P'),
('m.verrone', 'maddalenav', NULL, NULL, 'VRRMDD64T32A048N', NULL, NULL, NULL, NULL),
('s.buselli', 'silvanab', NULL, 'BSLSVN62L12B099E', NULL, NULL, NULL, NULL, NULL),
('s.delregno', 'santodr', 'DRGSNT81A26B045C', NULL, NULL, NULL, NULL, NULL, NULL),
('s.passaro', 'susannap', 'PSSSNN85L98A980I', NULL, NULL, NULL, NULL, NULL, NULL),
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

--
-- Dump dei dati per la tabella `assenza`
--

INSERT INTO `assenza` (`bambino`, `data`) VALUES
('CVLRRA12A23B333C', '2012-11-06'),
('DFZGNN12L14A909D', '2012-09-10');

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

--
-- Dump dei dati per la tabella `attivita`
--

INSERT INTO `attivita` (`titolo`, `descrizione`, `categoria`, `programma_educativo_settimanale`, `registro`, `path`, `nota`) VALUES
('Attività X1', 'X1', 'X', 1, 1, '.../Attività X1', 'Nota X1'),
('Attività X2', 'X2', 'X', 1, 1, '.../Attività X2', 'Nota X2'),
('Attività Y1', 'Y1', 'Y', 2, 2, '.../Attività Y1', 'Nota Y1'),
('Attività Y2', 'Y2', 'Y', 2, 2, '.../Attività Y2', 'Nota Y2'),
('Attività Z1', 'Z1', 'Z', 3, 3, '.../Attività Z1', 'Nota Z1'),
('Attività Z2', 'Z2', 'Z', 3, 3, '.../Attività Z2', 'Nota Z2');

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
  `iscrizione_classe` enum('Assegnato','NonAssegnato','ClasseDaConvalidare') DEFAULT 'NonAssegnato',
  PRIMARY KEY (`codice_fiscale`),
  KEY `classe` (`classe`),
  KEY `genitore` (`genitore`),
  KEY `cf_genitore_nonrichiedente` (`cf_genitore_nonrichiedente`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `bambino`
--

INSERT INTO `bambino` (`nome`, `cognome`, `codice_fiscale`, `data_di_nascita`, `indirizzo_residenza`, `categoria_appartenenza`, `genitore`, `classe`, `cittadinanza`, `comune_di_nascita`, `numero_civico_residenza`, `cap_residenza`, `comune_residenza`, `provincia_residenza`, `indirizzo_domicilio`, `numero_civico_domicilio`, `cap_domicilio`, `comune_domicilio`, `provincia_domicilio`, `cf_genitore_nonrichiedente`, `iscrizione_classe`) VALUES
('Aurora', 'Chiavelli', 'CVLRRA12A23B333C', '2012-09-07', 'via Roma', 'Lattanti', 'CVLMRA69A23B333C', 1, 'Italiana', 'Salerno', '2', '84084', NULL, 'SA', 'via Roma', '2', '84084', 'Fisciano', 'SA', 'DCSGVN74A23B224X', 'ClasseDaConvalidare'),
('Luca', 'Del Buono', 'DBNLCU11A23B222C', '2011-12-30', 'via degli Ulivi', 'Semisvezzati', 'DBNGPP69A23B222C', 1, 'Italiana', 'Roma', '16', '00100', 'Roma', 'RM', 'via degli Ulivi', '16', '00100', 'Roma', 'RM', 'VCCMRU84T19A222B', ''),
('Maria', 'Del Buono', 'DBNMRA11A23B222C', '2010-11-17', 'via degli Ulivi, 16 - 00100 Roma', 'Svezzati', 'DBNGPP69A23B222C', 2, 'Italiana', 'Roma', '16', '00100', 'Roma', 'RM', 'via degli Ulivi', '16', '00100', 'Roma', 'RM', 'VCCMRU84T19A222B', ''),
('Gennaro', 'De Fazio', 'DFZGNN12L14A909D', '2012-09-11', 'via delle X', 'Lattanti', 'DFZNDR91L14A909D', 2, 'Italiana', 'Salerno', '69', '84078', 'Vallo della Lucania', 'SA', 'via delle X', '69', '84084', 'Vallo della Lucania', 'SA', 'MRTLRU83A24T928B', ''),
('Candida', 'Del Regno', 'DRGCND10A26B045C', '2010-11-01', 'via delle Y', 'Svezzati', 'DRGSNT81A26B045C', 3, 'Italiana', 'Avellino', '10', '83100', 'Avellino', 'AV', 'via delle Y', '10', '83100', 'Avellino', 'AV', 'CLLFDR88X11C999X', ''),
('Luigi', 'Mascia', 'MSCLGU12A24T928B', '2012-10-16', 'piazza Risorgimento', 'Lattanti', 'VLLLRU83A24T928B', 2, 'Italiana', 'Benevento', '1', '82100', 'Benevento', 'BN', 'piazza Risorgimento', '1', '82100', 'Benevento', 'BN', NULL, ''),
('Marco', 'Pilato', 'PLTMRC11A23B224X	', '2011-11-08', 'via Ferreria', 'Semisvezzati', 'DCSGVN74A23B224X', 3, 'Italiana', 'Salerno', '12', '84081', 'Baronissi', 'SA', 'via Ferreria', '12', '84081', 'Baronissi', 'SA', NULL, ''),
('Matteo', 'Scalo', 'SCLMTT12L98A980I', '2012-01-31', 'piazza Malta', 'Semisvezzati', 'PSSSNN85L98A980I', 1, 'Italiana', 'Salerno', '23', '84100', 'Salerno', 'SA', 'piazza Malta', '23', '84100', 'Salerno', 'SA', NULL, ''),
('Annalisa', 'Scalo', 'SCLNNA11L98A980I', '2011-11-22', 'piazza Malta', 'Svezzati', 'PSSSNN85L98A980I', 3, 'Italiana', 'Salerno', '23', '84100', 'Salerno', 'SA', 'piazza Malta', '23', '84100', 'Salerno', 'SA', NULL, '');

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
(1, '2012-11-01', '2012-11-30', '2013-12-21', '2013-12-21', '2013-12-21', 60, '.../Bando X'),
(2, '2011-11-01', '2012-11-30', '2013-12-21', '2013-12-21', '2013-12-21', 60, '.../Bando Y');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

--
-- Dump dei dati per la tabella `campo_domanda_questionario`
--

INSERT INTO `campo_domanda_questionario` (`domanda_questionario`, `tipo`, `descrizione`, `valore`, `id`) VALUES
(1, 'radio', 'Lattante', 'Lattante', 1),
(1, 'radio', 'Semi-divezzi', 'Semi-divezzi', 2),
(1, 'radio', 'Divezzi', 'Divezzi', 3),
(2, 'radio', 'Part-time senza pranzo', 'Part-time senza pranzo', 4),
(2, 'radio', 'Part-time con pranzo', 'Part-time con pranzo', 5),
(2, 'radio', 'Full-time', 'Full-time', 6),
(4, 'int', 'Anno di nascita della madre', NULL, 7),
(4, 'int', 'Anno di nascita del padre', NULL, 8),
(5, 'int', 'Numero dei componenti della famiglia', NULL, 9),
(6, 'tipo X', 'Domanda X', NULL, 10),
(7, 'tipo Y', 'Domanda Y', NULL, 11),
(8, 'tipo Z', 'Domanda Z', NULL, 12),
(9, 'tipo ABC', 'Domanda ABC', NULL, 13);

-- --------------------------------------------------------

--
-- Struttura della tabella `classe`
--

CREATE TABLE IF NOT EXISTS `classe` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sezione` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dump dei dati per la tabella `classe`
--

INSERT INTO `classe` (`id`, `sezione`) VALUES
(1, '1A');

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

--
-- Dump dei dati per la tabella `compila`
--


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
  `stato_domanda` varchar(50) DEFAULT 'DomandaNonCompilata',
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
  `stato_convalidazione` enum('DomandaNonCompilata','DomandaInviataInAttesaDiGraduatoria','DomandaRifiutata','IscrizioneConfermataInAttesaDiAltriDati','DomandaNonInviata','DomandaAccettata') DEFAULT 'DomandaNonCompilata',
  `cf_genitore_non_richiedente` varchar(16) DEFAULT NULL,
  `vaccinazioni` varchar(300) DEFAULT NULL,
  `malattie_infettive` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `genitore` (`genitore`),
  KEY `bambino` (`bambino`),
  KEY `servizio` (`servizio`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dump dei dati per la tabella `domanda_iscrizione`
--

INSERT INTO `domanda_iscrizione` (`id`, `nota_esclusione`, `data_presentazione`, `punteggio`, `posizione`, `genitore`, `servizio`, `bambino`, `stato_domanda`, `certificato_malattie`, `certificato_vaccinazioni`, `certificato_privacy`, `bambino_disabile`, `genitore_invalido`, `genitore_solo`, `genitore_vedovo`, `genitore_nubile`, `genitore_separato`, `figlio_non_riconosciuto`, `affido_esclusivo`, `altri_componenti_disabili`, `condizioni_calcolo_punteggio`, `isee`, `stato_convalidazione`, `cf_genitore_non_richiedente`, `vaccinazioni`, `malattie_infettive`) VALUES
(1, NULL, '2012-07-19', 99, 1, 'CVLMRA69A23B333C', 1, 'CVLRRA12A23B333C', 'Approvata', 'Consegnato', 'Consegnato', 'Consegnato', 0, 0, 0, 0, 0, 0, 0, 0, 0, 'sdfdsds', 5220, 'DomandaNonCompilata', NULL, 'asfdasfads', 'sdCDFas'),
(2, NULL, '2012-08-13', 97, 2, 'DBNGPP69A23B222C', 7, 'DBNLCU11A23B222C', 'Approvata', 'Consegnato', 'Consegnato', 'Consegnato', 0, 0, 0, 0, 0, 0, 0, 0, 0, 'sTARS TRE', 17122, 'DomandaNonCompilata', NULL, 'sdafdsa', 'dsafwertew '),
(3, NULL, '2012-08-13', 95, 3, 'DBNGPP69A23B222C', 8, 'DBNMRA11A23B222C', 'Approvata', 'Consegnato', 'Consegnato', 'Consegnato', 0, 0, 0, 0, 0, 0, 0, 0, 0, 'fae EWVF92', 17122, NULL, NULL, 'afv asdf', 'ewrewrew'),
(4, NULL, '2012-11-01', 92, 4, 'DFZNDR91L14A909D', 2, 'DFZGNN12L14A909D', 'Approvata', 'Consegnato', 'Consegnato', 'Consegnato', 0, 0, 0, 0, 0, 0, 0, 0, 0, ' Seve ESSE sa', 35323, 'DomandaNonCompilata', NULL, 'asDSGHF', 'WERTYU'),
(5, NULL, '2012-06-12', 90, 5, 'DRGSNT81A26B045C', 5, 'DRGCND10A26B045C', 'Approvata', 'Consegnato', 'Consegnato', 'Consegnato', 0, 0, 0, 0, 0, 0, 0, 0, 0, 'dfghjk', 43892, 'DomandaNonCompilata', NULL, 'sddfasfd', 'erewrnerte'),
(6, NULL, '2012-09-25', 88, 6, 'VLLLRU83A24T928B', 6, 'MSCLGU12A24T928B', 'Approvata', 'Consegnato', 'Consegnato', 'Consegnato', 0, 0, 1, 1, 0, 0, 0, 0, 0, 'aevmovejpivejmpi', 34523, 'DomandaNonCompilata', NULL, 'earveasb', 'tvosijf p'),
(7, NULL, '2012-08-01', 84, 7, 'DCSGVN74A23B224X', 9, 'PLTMRC11A23B224X ', 'Approvata', 'Consegnato', 'Consegnato', 'Consegnato', 0, 0, 1, 1, 0, 0, 0, 0, 0, 'facfeaafcse', 23423, 'DomandaNonCompilata', NULL, 'dsfa uiopas', 'dofiha '),
(8, NULL, '2012-08-28', 73, 8, 'PSSSNN85L98A980I', 4, 'SCLMTT12L98A980I', 'Approvata', 'Consegnato', 'Consegnato', 'Consegnato', 0, 0, 1, 1, 0, 0, 0, 0, 0, 'eaEV', 72353, 'DomandaNonCompilata', NULL, 'dfap disj ', 'repij ar'),
(9, 'asd', '2012-08-28', 10, 9, 'PSSSNN85L98A980I', 3, 'SCLNNA11L98A980I', 'Approvata', 'Consegnato', 'Consegnato', 'Consegnato', 0, 0, 1, 1, 0, 0, 0, 0, 0, '', 72353, 'DomandaAccettata', NULL, NULL, NULL);

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

--
-- Dump dei dati per la tabella `domanda_questionario`
--

INSERT INTO `domanda_questionario` (`id`, `descrizione`, `questionario`) VALUES
(1, 'Sezione di appartenenza del bambino', 1),
(2, 'Regime di frequenza del bambino', 1),
(4, 'Anno di nascita dei genitori', 1),
(5, 'Numero dei componenti della famiglia', 1),
(6, 'Domanda X', 2),
(7, 'Domanda Y', 2),
(8, 'Domanda Z', 2);

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
  `descrizione` varchar(100) DEFAULT NULL,
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

--
-- Dump dei dati per la tabella `evento`
--

INSERT INTO `evento` (`id`, `nome`, `data`, `descrizione`, `personale_asilo`, `psico_pedagogo`, `educatore_didattico`, `path`, `tipo`, `cc`) VALUES
(1, 'Gita X', '2012-11-21', 'Gita a X', NULL, 'SSSLRL78B19B908X', NULL, '.../Programma Gita X', 'Viaggio d''istruzione', NULL),
(2, 'Recita Y', '2012-11-30', 'Recita su Y', NULL, 'VRRMDD64T32A048N', NULL, '.../Programma Recita Y', 'Rappresentazione teatrale', NULL);

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
  `status_lavorativo` varchar(300) DEFAULT NULL,
  `scadenza_contratto` date DEFAULT NULL,
  `condizione_lavorativa` varchar(50) DEFAULT NULL,
  `tipo_contratto` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`codice_fiscale`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `genitore`
--

INSERT INTO `genitore` (`nome`, `cognome`, `codice_fiscale`, `telefono`, `email`, `data_di_nascita`, `comune_di_nascita`, `indirizzo_residenza`, `tipo`, `categoria_appartenenza`, `cittadinanza`, `comune_residenza`, `numero_civico_residenza`, `cap_residenza`, `provincia_residenza`, `comune_domicilio`, `indirizzo_domicilio`, `numero_civico_domicilio`, `cap_domicilio`, `provincia_domicilio`, `dipendente_presso`, `rapporti_ateneo_salerno`, `rapporti_comune_fisciano`, `rapporto_parentela`, `status_lavorativo`, `scadenza_contratto`, `condizione_lavorativa`, `tipo_contratto`) VALUES
('Federica', 'Cella', 'CLLFDR88X11C999X', '0823120345', 'fcella@y.it', '1988-12-28', 'Verona', 'via delle Y', NULL, NULL, 'Italiana', 'Avellino', '10', '83100', 'AV', 'Avellino', 'via delle Y', '10', '83100', 'AV', 'fsfsf', 'weè08u9arep', '4w3''985n043p ', 'Madre', 'sjoifd', '2012-12-13', 'ertyui', '30984n2'),
('Mauro', 'Chiavelli', 'CVLMRA69A23B333C', '0899601239', 'mchiav@hotmail.it', '1969-11-20', 'Pontecagnano', 'via Roma', 'residenti_fisciano', 'ISCRITTO', 'Italiana', 'Fisciano', '2', '84084', 'SA', 'Fisciano', 'via Roma', '2', '84084', 'SA', 'Agenzia X', 'Nessun rapporto precedente', 'Residente del comune di Fisciano', 'Padre', 'Impiegato', '2013-12-21', 'X', 'Tempo indeterminato'),
('Giuseppe', 'Del Buono', 'DBNGPP69A23B222C', '0612345678', 'gdb@msn.it', '1969-11-06', 'Roma', 'via degli Ulivi', 'personale', 'ISCRITTO', 'Italiana', 'Roma', '16', '00100', 'RM', 'Roma', 'via degli Ulivi', '16', '00100', 'RM', 'asd', 'Gne gne gne', 'Bla bla bla.', 'Padre', 'EEEH!', '2013-12-21', ':3', 'X'),
('Giovanna', 'Di Costanzo', 'DCSGVN74A23B224X', '0899601239	', 'gds@hotmail.it', '1974-12-30', 'Barano d''Ischia', 'via Roma', '', '', 'Fisciano', 'via Roma', '2', '84084', 'SA', 'Fisciano', 'via Roma', '2', '84084', 'SA', 'X', 'XYZ', 'ABCDE', 'Madre', 'BLABLABLA', '2013-12-26', 'Non lo so ', 'BUH!'),
('Andrea', 'De Fazio', 'DFZNDR91L14A909D', '0894215524', 'adf@msn.com', '1991-11-22', 'Vallo della Lucania', 'via delle X', 'personale_studenti', 'ISCRITTO', 'Italiana', 'Vallo della Lucania', '69', '84084', 'SA', 'Vallo della Lucania', 'via delle X', '69', '84084', 'SA', 'A X', 'sojf dsiluhfd l', 'eouia LORHE TWPOIW ', 'Padre', 'sfdpio ', '2013-12-28', 'Mamama', 'LReoiuw'),
('Santo', 'Del Regno', 'DRGSNT81A26B045C', '0823120345', 'sdr@msn.com', '1981-10-04', 'Avellino', 'via delle Y', 'altro', 'ISCRITTO', 'Italiana', 'Avellino', '10', '83100', 'AV', 'Avellino', 'via delle Y', '10', '83100', 'AV', 'P X A B', 'sepoifjsp', 'oiurabp ouhs òa', 'Padre', 'gu', '2013-12-21', 'asd', 'rotfl'),
('Laura', 'Martini', 'MRTLRU83A24T928B', '0819718200', 'lauram@yahoo.it', '1983-03-21', 'Napoli', 'piazza Risorgimento', 'personale_studenti', 'ISCRITTO', 'Italiana', 'Napoli', '1', '07082', 'NA', 'Napoli', 'piazza Risorgimento', '1', '07802', 'NA', 'asi p', 'asd wpif yew', 'WTF?', 'Madre', 'bla bla', '2013-04-03', 'guuuu', 'XY'),
('Susanna', 'Passaro', 'PSSSNN85L98A980I', '0822334556', 'spassaro@virgilio.it', '1985-11-08', 'Salerno', 'piazza Malta', 'personale_studenti', 'ISCRITTO', 'Italiana', 'Salerno', '23', '84100', 'SA', 'Salerno', 'piazza Malta', '23', '84100', 'SA', 'aepr im0', 'gne gne gne', 'asd bla X', 'Madre', 'safd', '2013-12-26', 'qp08wr7 ', 'soòigdjf lera'),
('Maria', 'Vacca', 'VCCMRU84T19A222B', '0612345678', 'mvacca@X.it', '1984-12-12', 'Roma', 'via degli Ulivi', NULL, NULL, 'Italiana', 'Roma', '16', '00100', 'RM', 'Roma', 'via degli Ulivi', '16', '00100', 'RM', 'wi', 'sfis dfds', 'wpip enwsòf', 'Madre', 'soifnup', '2012-12-13', 'dsfadfs', 'qwe'),
('Laura', 'Vella', 'VLLLRU83A24T928B', '0829718235', 'laurav@yahoo.it', '1983-03-15', 'Cautano (BN)', 'piazza Risorgimento', 'personale', 'ISCRITTO', 'Italiana', 'Benevento', '1', '82100', 'BN', 'Benevento', 'piazza Risorgimento', '1', '82100', 'BN', 'sdf', 'weèitu0narepw', 'esp0itua òoij', 'Madre', 'EAR0PT8UB', '2013-12-21', 'seròaijo ', 'FEDLOL');

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

--
-- Dump dei dati per la tabella `partecipa`
--

INSERT INTO `partecipa` (`classe`, `evento`) VALUES
(2, 1),
(3, 1),
(1, 1),
(2, 2),
(3, 2);

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

--
-- Dump dei dati per la tabella `questionario`
--

INSERT INTO `questionario` (`id`, `flag_rinuncia`, `pathname`, `periodo_inizio`, `periodo_fine`, `nome`, `descrizione`) VALUES
(1, 'X', '.../Controllo qualità', '2012-12-06', '2012-12-20', 'Controllo qualità', 'QUESTIONARIO CONTROLLO QUALITA’ ASILO NIDO - GRADIMENTO DEI GENITORI'),
(2, 'X', '.../Questionario X', '2012-11-01', '2012-12-18', 'Questionario X', 'Questionario relativo a X');

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

--
-- Dump dei dati per la tabella `risposta_questionario`
--

INSERT INTO `risposta_questionario` (`id`, `valore`, `genitore`, `domanda`) VALUES
(500002, '5', 'Nobile Alessia', 5);

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

--
-- Dump dei dati per la tabella `servizio`
--

INSERT INTO `servizio` (`orario_inizio`, `orario_fine`, `piano_pasto`, `bambino`, `orario_utente`, `id`) VALUES
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
