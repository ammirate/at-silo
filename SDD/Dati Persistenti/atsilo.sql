--
-- Database: `atsilo`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `ACCOUNT`
--

CREATE TABLE IF NOT EXISTS `ACCOUNT` (
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `stato` varchar(20) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `ACCOUNT`
--


-- --------------------------------------------------------

--
-- Struttura della tabella `ASSENZA`
--

CREATE TABLE IF NOT EXISTS `ASSENZA` (
  `bambino` varchar(15) DEFAULT NULL,
  `data` date DEFAULT NULL,
  KEY `bambino` (`bambino`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `ASSENZA`
--


-- --------------------------------------------------------

--
-- Struttura della tabella `ATTIVITA`
--

CREATE TABLE IF NOT EXISTS `ATTIVITA` (
  `titolo` varchar(20) NOT NULL,
  `descrizione` varchar(20) NOT NULL,
  `categoria` varchar(20) NOT NULL,
  PRIMARY KEY (`titolo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `ATTIVITA`
--


-- --------------------------------------------------------

--
-- Struttura della tabella `BAMBINO`
--

CREATE TABLE IF NOT EXISTS `BAMBINO` (
  `nome` varchar(20) NOT NULL,
  `cognome` varchar(30) NOT NULL,
  `codice_fiscale` varchar(15) NOT NULL,
  `data_di_nascita` date NOT NULL,
  `comune_di_nascita` varchar(20) NOT NULL,
  `indirizzo` varchar(20) NOT NULL,
  PRIMARY KEY (`codice_fiscale`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `BAMBINO`
--


-- --------------------------------------------------------

--
-- Struttura della tabella `BANDO`
--

CREATE TABLE IF NOT EXISTS `BANDO` (
  `id` int(11) NOT NULL,
  `data_inizio` date NOT NULL,
  `data_fine` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `BANDO`
--


-- --------------------------------------------------------

--
-- Struttura della tabella `CAMPO_DOMANDA_QUESTIONARIO`
--

CREATE TABLE IF NOT EXISTS `CAMPO_DOMANDA_QUESTIONARIO` (
  `domanda_questionario` int(11) DEFAULT NULL,
  `tipo` varchar(20) DEFAULT NULL,
  `descrizione` varchar(20) DEFAULT NULL,
  `valore` varchar(20) DEFAULT NULL,
  KEY `domanda_questionario` (`domanda_questionario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `CAMPO_DOMANDA_QUESTIONARIO`
--


-- --------------------------------------------------------

--
-- Struttura della tabella `CLASSE`
--

CREATE TABLE IF NOT EXISTS `CLASSE` (
  `id` varchar(5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `CLASSE`
--


-- --------------------------------------------------------

--
-- Struttura della tabella `COMPILA`
--

CREATE TABLE IF NOT EXISTS `COMPILA` (
  `questionario` int(11) DEFAULT NULL,
  `genitore` varchar(15) DEFAULT NULL,
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
  `data_presentazione` date DEFAULT NULL,
  `id` int(11) NOT NULL DEFAULT '0',
  `punteggio` int(11) DEFAULT NULL,
  `posizione` varchar(2) DEFAULT NULL,
  `genitore` varchar(15) DEFAULT NULL,
  `bambino` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `genitore` (`genitore`),
  KEY `bambino` (`bambino`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `DOMANDA_ISCRIZIONE`
--


-- --------------------------------------------------------

--
-- Struttura della tabella `DOMANDA_QUESTIONARIO`
--

CREATE TABLE IF NOT EXISTS `DOMANDA_QUESTIONARIO` (
  `id` int(11) NOT NULL,
  `descrizione` varchar(20) DEFAULT NULL,
  `questionario` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `questionario` (`questionario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `DOMANDA_QUESTIONARIO`
--


-- --------------------------------------------------------

--
-- Struttura della tabella `EDUCATORE_DIDATTICO`
--

CREATE TABLE IF NOT EXISTS `EDUCATORE_DIDATTICO` (
  `nome` varchar(20) NOT NULL,
  `cognome` varchar(30) NOT NULL,
  `codice_fiscale` varchar(15) NOT NULL,
  `titolo_di_studi` varchar(25) NOT NULL,
  PRIMARY KEY (`codice_fiscale`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `EDUCATORE_DIDATTICO`
--


-- --------------------------------------------------------

--
-- Struttura della tabella `EVENTO`
--

CREATE TABLE IF NOT EXISTS `EVENTO` (
  `nome` varchar(20) NOT NULL,
  `data` date NOT NULL,
  `descrizione` varchar(30) NOT NULL,
  `classe` varchar(20) NOT NULL,
  PRIMARY KEY (`nome`,`data`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `EVENTO`
--


-- --------------------------------------------------------

--
-- Struttura della tabella `EXTRA`
--

CREATE TABLE IF NOT EXISTS `EXTRA` (
  `importo` float NOT NULL,
  `descrizione` varchar(30) NOT NULL,
  `id` varchar(5) NOT NULL,
  `data_inizio` date NOT NULL,
  `data_fine` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `EXTRA`
--


-- --------------------------------------------------------

--
-- Struttura della tabella `FATTURA`
--

CREATE TABLE IF NOT EXISTS `FATTURA` (
  `id` int(11) NOT NULL,
  `descrizione` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
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
  `descrizione` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `FEEDBACK`
--


-- --------------------------------------------------------

--
-- Struttura della tabella `GENITORE`
--

CREATE TABLE IF NOT EXISTS `GENITORE` (
  `nome` varchar(20) NOT NULL,
  `cognome` varchar(30) NOT NULL,
  `codice_fiscale` varchar(15) NOT NULL,
  `telefono` varchar(10) NOT NULL,
  `email` varchar(40) NOT NULL,
  `data_di_nascita` date NOT NULL,
  `comune_di_nascita` varchar(20) NOT NULL,
  `indirizzo_residenza` varchar(20) NOT NULL,
  `categoria_appartenenza` varchar(20) NOT NULL,
  PRIMARY KEY (`codice_fiscale`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `GENITORE`
--


-- --------------------------------------------------------

--
-- Struttura della tabella `INSEGNA`
--

CREATE TABLE IF NOT EXISTS `INSEGNA` (
  `educatore_didattico` varchar(15) DEFAULT NULL,
  `classe` varchar(5) DEFAULT NULL,
  KEY `educatore_didattico` (`educatore_didattico`),
  KEY `classe` (`classe`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `INSEGNA`
--


-- --------------------------------------------------------

--
-- Struttura della tabella `MENU_MENSA`
--

CREATE TABLE IF NOT EXISTS `MENU_MENSA` (
  `categoria_bambino` varchar(15) NOT NULL,
  `tipologia` varchar(15) NOT NULL,
  `primo_piatto` varchar(15) NOT NULL,
  `secondo_piatto` varchar(15) NOT NULL,
  `contorno` varchar(15) NOT NULL,
  `frutta` varchar(15) NOT NULL,
  `data` date NOT NULL,
  `id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `MENU_MENSA`
--


-- --------------------------------------------------------

--
-- Struttura della tabella `ORARIO_UTENTE`
--

CREATE TABLE IF NOT EXISTS `ORARIO_UTENTE` (
  `id` int(11) NOT NULL,
  `orario_inizio` varchar(20) NOT NULL,
  `orario_fine` varchar(20) NOT NULL,
  `descrizione` int(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `ORARIO_UTENTE`
--


-- --------------------------------------------------------

--
-- Struttura della tabella `PARTECIPA`
--

CREATE TABLE IF NOT EXISTS `PARTECIPA` (
  `evento_nome` varchar(20) DEFAULT NULL,
  `evento_data` date DEFAULT NULL,
  `classe` varchar(5) DEFAULT NULL,
  KEY `evento_nome` (`evento_nome`),
  KEY `evento_data` (`evento_data`),
  KEY `classe` (`classe`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `PARTECIPA`
--


-- --------------------------------------------------------

--
-- Struttura della tabella `PERSONALE_ASILO`
--

CREATE TABLE IF NOT EXISTS `PERSONALE_ASILO` (
  `nome` varchar(20) NOT NULL,
  `cognome` varchar(30) NOT NULL,
  `codice_fiscale` varchar(15) NOT NULL,
  `categoria_appartenenza` varchar(20) NOT NULL,
  PRIMARY KEY (`codice_fiscale`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `PERSONALE_ASILO`
--


-- --------------------------------------------------------

--
-- Struttura della tabella `PROGRAMMA_EDUCATIVO_SETTIMANALE`
--

CREATE TABLE IF NOT EXISTS `PROGRAMMA_EDUCATIVO_SETTIMANALE` (
  `settimana` varchar(15) NOT NULL,
  `descrizion` varchar(15) NOT NULL,
  `obiettivi` varchar(15) NOT NULL,
  `id` varchar(5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `PROGRAMMA_EDUCATIVO_SETTIMANALE`
--


-- --------------------------------------------------------

--
-- Struttura della tabella `PSICO_PEDAGOGO`
--

CREATE TABLE IF NOT EXISTS `PSICO_PEDAGOGO` (
  `nome` varchar(20) NOT NULL,
  `cognome` varchar(30) NOT NULL,
  `codice_fiscale` varchar(15) NOT NULL,
  `telefono` varchar(10) NOT NULL,
  `email` varchar(40) NOT NULL,
  `data_di_nascita` date NOT NULL,
  `comune_di_nascita` varchar(20) NOT NULL,
  `indirizzo_residenza` varchar(20) NOT NULL,
  `titolo_di_studi` varchar(25) NOT NULL,
  `numero_classi` varchar(2) NOT NULL,
  PRIMARY KEY (`codice_fiscale`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `PSICO_PEDAGOGO`
--


-- --------------------------------------------------------

--
-- Struttura della tabella `QUESTIONARIO`
--

CREATE TABLE IF NOT EXISTS `QUESTIONARIO` (
  `id` int(11) NOT NULL,
  `flag_rinuncia` varchar(20) NOT NULL,
  `pathname` varchar(20) NOT NULL,
  `periodo_inizio` varchar(20) NOT NULL,
  `periodo_fine` varchar(20) NOT NULL,
  `nome` varchar(20) NOT NULL,
  `descrizione` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `QUESTIONARIO`
--


-- --------------------------------------------------------

--
-- Struttura della tabella `REGISTRO`
--

CREATE TABLE IF NOT EXISTS `REGISTRO` (
  `classe` varchar(5) DEFAULT NULL,
  `anno` varchar(9) DEFAULT NULL,
  KEY `classe` (`classe`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `REGISTRO`
--


-- --------------------------------------------------------

--
-- Struttura della tabella `RESPONSABILE_QUESTIONARI`
--

CREATE TABLE IF NOT EXISTS `RESPONSABILE_QUESTIONARI` (
  `nome` varchar(20) NOT NULL,
  `cognome` varchar(30) NOT NULL,
  `codice_fiscale` varchar(15) NOT NULL,
  PRIMARY KEY (`codice_fiscale`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `RESPONSABILE_QUESTIONARI`
--


-- --------------------------------------------------------

--
-- Struttura della tabella `RETTA`
--

CREATE TABLE IF NOT EXISTS `RETTA` (
  `importo` float NOT NULL,
  `extra` varchar(20) NOT NULL,
  `id` varchar(5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `RETTA`
--


-- --------------------------------------------------------

--
-- Struttura della tabella `RICHIESTA`
--

CREATE TABLE IF NOT EXISTS `RICHIESTA` (
  `id` int(11) NOT NULL,
  `tipo` varchar(20) NOT NULL,
  `menu_richiesto` varchar(20) NOT NULL,
  `orario_richiesto` varchar(20) NOT NULL,
  `allegato` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `RICHIESTA`
--


-- --------------------------------------------------------

--
-- Struttura della tabella `RISPOSTA_QUESTIONARIO`
--

CREATE TABLE IF NOT EXISTS `RISPOSTA_QUESTIONARIO` (
  `id` int(11) NOT NULL,
  `valore` varchar(20) DEFAULT NULL,
  `questionario` int(11) DEFAULT NULL,
  `genitore` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `questionario` (`questionario`),
  KEY `genitore` (`genitore`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `RISPOSTA_QUESTIONARIO`
--


-- --------------------------------------------------------

--
-- Struttura della tabella `SERVIZIO`
--

CREATE TABLE IF NOT EXISTS `SERVIZIO` (
  `orario_inizio` varchar(20) DEFAULT NULL,
  `orario_fine` varchar(20) DEFAULT NULL,
  `piano_pasto` varchar(20) DEFAULT NULL,
  `bambino` varchar(15) DEFAULT NULL,
  KEY `bambino` (`bambino`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `SERVIZIO`
--


-- --------------------------------------------------------

--
-- Struttura della tabella `TIROCINANTE`
--

CREATE TABLE IF NOT EXISTS `TIROCINANTE` (
  `nome` varchar(20) NOT NULL,
  `cognome` varchar(30) NOT NULL,
  `codice_fiscale` varchar(15) NOT NULL,
  `telefono` varchar(10) NOT NULL,
  `email` varchar(40) NOT NULL,
  `data_di_nascita` date NOT NULL,
  `comune_di_nascita` varchar(20) NOT NULL,
  `indirizzo_residenza` varchar(20) NOT NULL,
  `titolo_di_studi` varchar(25) NOT NULL,
  `ore_totali` int(11) NOT NULL,
  `ore_lavoro` int(11) NOT NULL,
  PRIMARY KEY (`codice_fiscale`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `TIROCINANTE`
--

