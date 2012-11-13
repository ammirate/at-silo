--
-- Database: `atsilo`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `ACCOUNT`
--

CREATE TABLE IF NOT EXISTS `ACCOUNT` (
  `username` varchar(50)  NOT NULL,
  `password` varchar(256)  DEFAULT NULL,
  `genitore` varchar(50)  DEFAULT NULL,
  `personale_asilo` varchar(50)  DEFAULT NULL,
  `psico_pedagogo` varchar(50)  DEFAULT NULL,
  `responsabile_questionario` varchar(50)  DEFAULT NULL,
  PRIMARY KEY (`username`),
  KEY `genitore` (`genitore`),
  KEY `personale_asilo` (`PERSONALE_ASILO`),
  KEY `psico_pedagogo` (`PSICO_PEDAGOGO`),
  KEY `responsabile_questionario` (`RESPONSABILE_QUESTIONARIO`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ;

--
-- Dump dei dati per la tabella `ACCOUNT`
--


-- --------------------------------------------------------

--
-- Struttura della tabella `ASSENZA`
--

CREATE TABLE IF NOT EXISTS `ASSENZA` (
  `bambino` varchar(50)  DEFAULT NULL,
  `data` date DEFAULT NULL,
  KEY `bambino` (`BAMBINO`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ;

--
-- Dump dei dati per la tabella `ASSENZA`
--


-- --------------------------------------------------------

--
-- Struttura della tabella `ATTIVITA`
--

CREATE TABLE IF NOT EXISTS `ATTIVITA` (
  `titolo` varchar(50)  NOT NULL,
  `descrizione` varchar(100)  DEFAULT NULL,
  `categoria` varchar(50)  DEFAULT NULL,
  `programma_educativo_settimanale` int(11) DEFAULT NULL,
  `registro` int(11) DEFAULT NULL,
  PRIMARY KEY (`titolo`),
  KEY `programma_educativo_settimanale` (`PROGRAMMA_EDUCATIVO_SETTIMANALE`),
  KEY `registro` (`REGISTRO`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ;

--
-- Dump dei dati per la tabella `ATTIVITA`
--


-- --------------------------------------------------------

--
-- Struttura della tabella `BAMBINO`
--

CREATE TABLE IF NOT EXISTS `BAMBINO` (
  `nome` varchar(50)  DEFAULT NULL,
  `cognome` varchar(50)  DEFAULT NULL,
  `codice_fiscale` varchar(50)  NOT NULL,
  `data_di_nascita` date DEFAULT NULL,
  `indirizzo` varchar(50)  DEFAULT NULL,
  `categoria_appartenenza` varchar(50)  DEFAULT NULL,
  `genitore` varchar(50)  DEFAULT NULL,
  `classe` int(11) DEFAULT NULL,
  PRIMARY KEY (`codice_fiscale`),
  KEY `classe` (`CLASSE`),
  KEY `genitore` (`GENITORE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ;

--
-- Dump dei dati per la tabella `BAMBINO`
--


-- --------------------------------------------------------

--
-- Struttura della tabella `BANDO`
--

CREATE TABLE IF NOT EXISTS `BANDO` (
  `id` int(11) NOT NULL,
  `data_inizio` date DEFAULT NULL,
  `data_fine` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ;

--
-- Dump dei dati per la tabella `BANDO`
--


-- --------------------------------------------------------

--
-- Struttura della tabella `CAMPO_DOMANDA_QUESTIONARIO`
--

CREATE TABLE IF NOT EXISTS `CAMPO_DOMANDA_QUESTIONARIO` (
  `domanda_questionario` int(11) DEFAULT NULL,
  `tipo` varchar(50)  DEFAULT NULL,
  `descrizione` varchar(100)  DEFAULT NULL,
  `valore` varchar(50)  DEFAULT NULL,
  `risposta_questionario` int(11) DEFAULT NULL,
  KEY `domanda_questionario` (`DOMANDA_QUESTIONARIO`),
  KEY `risposta_questionario` (`RISPOSTA_QUESTIONARIO`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ;

--
-- Dump dei dati per la tabella `CAMPO_DOMANDA_QUESTIONARIO`
--


-- --------------------------------------------------------

--
-- Struttura della tabella `CLASSE`
--

CREATE TABLE IF NOT EXISTS `CLASSE` (
  `id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ;

--
-- Dump dei dati per la tabella `CLASSE`
--


-- --------------------------------------------------------

--
-- Struttura della tabella `COMPILA`
--

CREATE TABLE IF NOT EXISTS `COMPILA` (
  `questionario` int(11) DEFAULT NULL,
  `genitore` varchar(50)  DEFAULT NULL,
  KEY `questionario` (`QUESTIONARIO`),
  KEY `genitore` (`GENITORE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ;

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
  `punteggio` varchar(50)  DEFAULT NULL,
  `genitore` varchar(50)  DEFAULT NULL,
  `servizio` int(11) DEFAULT NULL,
  `bambino` varchar(50)  DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `genitore` (`GENITORE`),
  KEY `bambino` (`BAMBINO`),
  KEY `servizio` (`SERVIZIO`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ;

--
-- Dump dei dati per la tabella `DOMANDA_ISCRIZIONE`
--


-- --------------------------------------------------------

--
-- Struttura della tabella `DOMANDA_QUESTIONARIO`
--

CREATE TABLE IF NOT EXISTS `DOMANDA_QUESTIONARIO` (
  `id` int(11) DEFAULT NULL,
  `descrizione` varchar(100)  DEFAULT NULL,
  `questionario` int(11) DEFAULT NULL,
  KEY `questionario` (`QUESTIONARIO`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ;

--
-- Dump dei dati per la tabella `DOMANDA_QUESTIONARIO`
--


-- --------------------------------------------------------

--
-- Struttura della tabella `EDUCATORE_DIDATTICO`
--

CREATE TABLE IF NOT EXISTS `EDUCATORE_DIDATTICO` (
  `nome` varchar(50)  DEFAULT NULL,
  `cognome` varchar(50)  DEFAULT NULL,
  `codice_fiscale` varchar(50)  NOT NULL,
  `titolo_di_studi` varchar(50)  DEFAULT NULL,
  PRIMARY KEY (`codice_fiscale`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ;

--
-- Dump dei dati per la tabella `EDUCATORE_DIDATTICO`
--


-- --------------------------------------------------------

--
-- Struttura della tabella `EVENTO`
--

CREATE TABLE IF NOT EXISTS `EVENTO` (
  `nome` varchar(50)  NOT NULL DEFAULT '',
  `data` date NOT NULL DEFAULT '0000-00-00',
  `descrizione` varchar(100)  DEFAULT NULL,
  `personale_asilo` varchar(50)  DEFAULT NULL,
  `psico_pedagogo` varchar(50)  DEFAULT NULL,
  `educatore_didattico` varchar(50)  DEFAULT NULL,
  PRIMARY KEY (`nome`,`data`),
  KEY `personale_asilo` (`PERSONALE_ASILO`),
  KEY `psico_pedagogo` (`PSICO_PEDAGOGO`),
  KEY `educatore_didattico` (`EDUCATORE_DIDATTICO`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ;

--
-- Dump dei dati per la tabella `EVENTO`
--


-- --------------------------------------------------------

--
-- Struttura della tabella `EXTRA`
--

CREATE TABLE IF NOT EXISTS `EXTRA` (
  `id` int(11) NOT NULL,
  `importo` float DEFAULT NULL,
  `data_inizio` date DEFAULT NULL,
  `data_fine` date DEFAULT NULL,
  `descrizione` varchar(100)  DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ;

--
-- Dump dei dati per la tabella `EXTRA`
--


-- --------------------------------------------------------

--
-- Struttura della tabella `FATTURA`
--

CREATE TABLE IF NOT EXISTS `FATTURA` (
  `id` int(11) NOT NULL,
  `descrizione` varchar(100)  DEFAULT NULL,
  `personale_asilo` varchar(50)  DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `personale_asilo` (`PERSONALE_ASILO`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ;

--
-- Dump dei dati per la tabella `FATTURA`
--


-- --------------------------------------------------------

--
-- Struttura della tabella `FEEDBACK`
--

CREATE TABLE IF NOT EXISTS `FEEDBACK` (
  `id` int(11) NOT NULL,
  `descrizione` varchar(100)  DEFAULT NULL,
  `personale_asilo` varchar(50)  DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `personale_asilo` (`PERSONALE_ASILO`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ;

--
-- Dump dei dati per la tabella `FEEDBACK`
--


-- --------------------------------------------------------

--
-- Struttura della tabella `GENITORE`
--

CREATE TABLE IF NOT EXISTS `GENITORE` (
  `nome` varchar(50)  DEFAULT NULL,
  `cognome` varchar(50)  DEFAULT NULL,
  `codice_fiscale` varchar(50)  NOT NULL,
  `telefono` varchar(50)  DEFAULT NULL,
  `email` varchar(50)  DEFAULT NULL,
  `data_di_nascita` date DEFAULT NULL,
  `comune_di_nascita` varchar(50)  DEFAULT NULL,
  `indirizzo_residenza` varchar(50)  DEFAULT NULL,
  `tipo` varchar(50)  DEFAULT NULL,
  PRIMARY KEY (`codice_fiscale`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ;

--
-- Dump dei dati per la tabella `GENITORE`
--


-- --------------------------------------------------------

--
-- Struttura della tabella `INSEGNA`
--

CREATE TABLE IF NOT EXISTS `INSEGNA` (
  `educatore_didattico` varchar(50)  DEFAULT NULL,
  `classe` int(11) DEFAULT NULL,
  KEY `educatore_didattico` (`EDUCATORE_DIDATTICO`),
  KEY `classe` (`CLASSE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ;

--
-- Dump dei dati per la tabella `INSEGNA`
--


-- --------------------------------------------------------

--
-- Struttura della tabella `MENU_MENSA`
--

CREATE TABLE IF NOT EXISTS `MENU_MENSA` (
  `categoria_bambino` varchar(50)  DEFAULT NULL,
  `tipologia` varchar(50)  DEFAULT NULL,
  `primo_piatto` varchar(50)  DEFAULT NULL,
  `secondo_piatto` varchar(50)  DEFAULT NULL,
  `frutta` varchar(50)  DEFAULT NULL,
  `data` date DEFAULT NULL,
  `id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ;

--
-- Dump dei dati per la tabella `MENU_MENSA`
--


-- --------------------------------------------------------

--
-- Struttura della tabella `ORARIO_UTENTE`
--

CREATE TABLE IF NOT EXISTS `ORARIO_UTENTE` (
  `id` int(11) NOT NULL,
  `data_inizio` date DEFAULT NULL,
  `data_fine` date DEFAULT NULL,
  `descrizione` varchar(100)  DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ;

--
-- Dump dei dati per la tabella `ORARIO_UTENTE`
--


-- --------------------------------------------------------

--
-- Struttura della tabella `PARTECIPA`
--

CREATE TABLE IF NOT EXISTS `PARTECIPA` (
  `evento_data` date DEFAULT NULL,
  `evento_nome` varchar(50)  DEFAULT NULL,
  `classe` int(11) DEFAULT NULL,
  KEY `evento_data` (`EVENTO_DATA`),
  KEY `evento_nome` (`EVENTO_NOME`),
  KEY `classe` (`CLASSE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ;

--
-- Dump dei dati per la tabella `PARTECIPA`
--


-- --------------------------------------------------------

--
-- Struttura della tabella `PERSONALE_ASILO`
--

CREATE TABLE IF NOT EXISTS `PERSONALE_ASILO` (
  `nome` varchar(50)  DEFAULT NULL,
  `cognome` varchar(50)  DEFAULT NULL,
  `codice_fiscale` varchar(50)  NOT NULL,
  `categoria_appartenenza` varchar(50)  DEFAULT NULL,
  `email` varchar(50)  DEFAULT NULL,
  PRIMARY KEY (`codice_fiscale`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ;

--
-- Dump dei dati per la tabella `PERSONALE_ASILO`
--


-- --------------------------------------------------------

--
-- Struttura della tabella `POSSIEDE`
--

CREATE TABLE IF NOT EXISTS `POSSIEDE` (
  `retta` int(11) DEFAULT NULL,
  `extra` int(11) DEFAULT NULL,
  KEY `retta` (`RETTA`),
  KEY `extra` (`EXTRA`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ;

--
-- Dump dei dati per la tabella `POSSIEDE`
--


-- --------------------------------------------------------

--
-- Struttura della tabella `PROGRAMMA_EDUCATIVO_SETTIMANALE`
--

CREATE TABLE IF NOT EXISTS `PROGRAMMA_EDUCATIVO_SETTIMANALE` (
  `id` int(11) NOT NULL,
  `settimana` varchar(50)  DEFAULT NULL,
  `descrizione` varchar(100)  DEFAULT NULL,
  `obiettivi` varchar(50)  DEFAULT NULL,
  `psico_pedagogo` varchar(50)  DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `psico_pedagogo` (`PSICO_PEDAGOGO`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ;

--
-- Dump dei dati per la tabella `PROGRAMMA_EDUCATIVO_SETTIMANALE`
--


-- --------------------------------------------------------

--
-- Struttura della tabella `PSICO_PEDAGOGO`
--

CREATE TABLE IF NOT EXISTS `PSICO_PEDAGOGO` (
  `nome` varchar(50)  DEFAULT NULL,
  `cognome` varchar(50)  DEFAULT NULL,
  `codice_fiscale` varchar(50)  NOT NULL,
  `telefono` varchar(50)  DEFAULT NULL,
  `email` varchar(50)  DEFAULT NULL,
  `data_di_nascita` date DEFAULT NULL,
  `comune_di_nascita` varchar(50)  DEFAULT NULL,
  `indirizzo_residenza` varchar(50)  DEFAULT NULL,
  `titolo_di_studi` varchar(50)  DEFAULT NULL,
  `numero_classi` varchar(50)  DEFAULT NULL,
  PRIMARY KEY (`codice_fiscale`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ;

--
-- Dump dei dati per la tabella `PSICO_PEDAGOGO`
--


-- --------------------------------------------------------

--
-- Struttura della tabella `QUESTIONARIO`
--

CREATE TABLE IF NOT EXISTS `QUESTIONARIO` (
  `id` int(11) NOT NULL,
  `flag_rinuncia` varchar(50)  DEFAULT NULL,
  `pathname` varchar(100)  DEFAULT NULL,
  `periodo_inizio` varchar(50)  DEFAULT NULL,
  `periodo_fine` varchar(50)  DEFAULT NULL,
  `nome` varchar(50)  DEFAULT NULL,
  `descrizione` varchar(100)  DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ;

--
-- Dump dei dati per la tabella `QUESTIONARIO`
--


-- --------------------------------------------------------

--
-- Struttura della tabella `REGISTRO`
--

CREATE TABLE IF NOT EXISTS `REGISTRO` (
  `classe` int(11) DEFAULT NULL,
  `anno` varchar(50)  DEFAULT NULL,
  `educatore_didattico` varchar(50)  DEFAULT NULL,
  `id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `classe` (`CLASSE`),
  KEY `educatore_didattico` (`EDUCATORE_DIDATTICO`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ;

--
-- Dump dei dati per la tabella `REGISTRO`
--


-- --------------------------------------------------------

--
-- Struttura della tabella `RESPONSABILE_QUESTIONARIO`
--

CREATE TABLE IF NOT EXISTS `RESPONSABILE_QUESTIONARIO` (
  `nome` varchar(50)  DEFAULT NULL,
  `cognome` varchar(50)  DEFAULT NULL,
  `codice_fiscale` varchar(50)  NOT NULL,
  `email` varchar(50)  DEFAULT NULL,
  PRIMARY KEY (`codice_fiscale`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ;

--
-- Dump dei dati per la tabella `RESPONSABILE_QUESTIONARIO`
--


-- --------------------------------------------------------

--
-- Struttura della tabella `RETTA`
--

CREATE TABLE IF NOT EXISTS `RETTA` (
  `importo` varchar(50)  DEFAULT NULL,
  `id` int(11) NOT NULL,
  `genitore` varchar(50)  DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `genitore` (`GENITORE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ;

--
-- Dump dei dati per la tabella `RETTA`
--


-- --------------------------------------------------------

--
-- Struttura della tabella `RICHIESTA`
--

CREATE TABLE IF NOT EXISTS `RICHIESTA` (
  `id` int(11) NOT NULL,
  `tipo` varchar(50)  DEFAULT NULL,
  `menu_richiesto` varchar(50)  DEFAULT NULL,
  `orario_richiesto` varchar(50)  DEFAULT NULL,
  `allegato` varchar(100)  DEFAULT NULL,
  `genitore` varchar(50)  DEFAULT NULL,
  `servizio` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `genitore` (`GENITORE`),
  KEY `servizio` (`SERVIZIO`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ;

--
-- Dump dei dati per la tabella `RICHIESTA`
--


-- --------------------------------------------------------

--
-- Struttura della tabella `RISPOSTA_QUESTIONARIO`
--

CREATE TABLE IF NOT EXISTS `RISPOSTA_QUESTIONARIO` (
  `id` int(11) NOT NULL,
  `valore` varchar(50)  DEFAULT NULL,
  `questionario` int(11) DEFAULT NULL,
  `genitore` varchar(50)  DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `questionario` (`QUESTIONARIO`),
  KEY `genitore` (`GENITORE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ;

--
-- Dump dei dati per la tabella `RISPOSTA_QUESTIONARIO`
--


-- --------------------------------------------------------

--
-- Struttura della tabella `SERVIZIO`
--

CREATE TABLE IF NOT EXISTS `SERVIZIO` (
  `orario_inizio` varchar(50)  DEFAULT NULL,
  `orario_fine` varchar(50)  DEFAULT NULL,
  `piano_pasto` varchar(50)  DEFAULT NULL,
  `bambino` varchar(50)  DEFAULT NULL,
  `orario_utente` int(11) DEFAULT NULL,
  `id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `bambino` (`BAMBINO`),
  KEY `orario_utente` (`ORARIO_UTENTE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ;

--
-- Dump dei dati per la tabella `SERVIZIO`
--


-- --------------------------------------------------------

--
-- Struttura della tabella `TIROCINANTE`
--

CREATE TABLE IF NOT EXISTS `TIROCINANTE` (
  `nome` varchar(50)  DEFAULT NULL,
  `cognome` varchar(50)  DEFAULT NULL,
  `codice_fiscale` varchar(50)  NOT NULL,
  `telefono` varchar(50)  DEFAULT NULL,
  `email` varchar(50)  DEFAULT NULL,
  `data_di_nascita` date DEFAULT NULL,
  `comune_di_nascita` varchar(50)  DEFAULT NULL,
  `indirizzo_residenza` varchar(50)  DEFAULT NULL,
  `titolo_di_studi` varchar(50)  DEFAULT NULL,
  `ore_totali` int(11) DEFAULT NULL,
  `ore_lavoro` int(11) DEFAULT NULL,
  `personale_asilo` varchar(50)  DEFAULT NULL,
  PRIMARY KEY (`codice_fiscale`),
  KEY `personale_asilo` (`personale_asilo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ;

--
-- Dump dei dati per la tabella `TIROCINANTE`
--

