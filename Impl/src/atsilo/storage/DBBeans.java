/*
 *-----------------------------------------------------------------
 * This file is licensed under GPL 3.0:
 * http://www.gnu.org/licenses/gpl-3.0.html
 *-----------------------------------------------------------------
 * FILE: NomeFile
 *-----------------------------------------------------------------
 * PROGETTO: Atsilo
 *-----------------------------------------------------------------
 * OWNER
 * Angelo Scafuro, data creazione
 * REVISION
 * nome revisore, data revisione
 *-----------------------------------------------------------------
 */

package atsilo.storage;

import java.beans.BeanInfo;
import java.beans.IntrospectionException;
import java.beans.Introspector;
import java.beans.PropertyDescriptor;
import java.lang.reflect.InvocationTargetException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.NoSuchElementException;
import java.util.Set;
import java.util.logging.Level;
import java.util.logging.Logger;

import atsilo.util.IterableOnlyOnce;

/**
 * Classe DBBeans contente i metodi delle operazioni piu' comuni su una tabella.
 * In particolare, DBBeans aiuta nell'inserimento, modifica e cancellazione di
 * beans dal database, e permette di iterare sugli elementi contenuti nella
 * tabella, tramite l'implementazione dell'interfaccia {@link Iterable}.<br/>
 * All'interno della documentazione, e' importante distinguere tra due aspetti:
 * <dl>
 * <dt>Nome dell'attributo/campo</dt>
 * <dd>Nome della proprieta' della classe Bean (nome della variabile);</dd>
 * <dt>Nome della colonna</dt>
 * <dd>Nome della colonna, come definita nella base di dati sottostante;</dd>
 * </dl>
 * 
 * <p>
 * Le classi che implementano questa devono fornire tre metodi:
 * <ul>
 * <li>{@link #getKeyFields()}</li>
 * <li>{@link #getMappingFields()}</li>
 * <li>{@link #creaBean(ResultSet)}</li>
 * </ul>
 * Tali metodi vengono utilizzati da DBBeans per mappare le proprieta' dei bean
 * su colonne del database e per permettere l'iterazione sui bean presenti.
 * </p>
 * 
 * <p>
 * <h6>Inserimento in tabella</h6>
 * L'inserimento in tabella e' possibile tramite il metodo
 * {@link #inserisci(Object) inserisci()}, che utilizza il mapping restituito da
 * {@link #getMappingFields()} per trasformare un bean in una riga della tabella
 * cui l'istanza di DBBeans e' associata.<br/>
 * Il metodo {@link #inserisci(Object) inserisci()} si limita a richiamare
 * {@link #inserisciCon(Object, Assegnazione...) inserisciCon()} passando
 * l'array restituito da {@link #creaAssegnazioni(Object) creaAssegnazioni()}.<br/>
 * In caso di necessita', e' possibile sovrascrivere {@link #inserisci(Object)
 * inserisci()} in modo da passare al metodo
 * {@link #inserisciCon(Object, Assegnazione...) inserisciCon()} un set di
 * assegnazioni specifico. Questo e' utile, ad esempio, per mappare le chiavi
 * esterne.<br/>
 * Se i parametri extra vengono calcolati allo stesso modo per tutti i metodi di
 * modifica (come e' di solito), e' anche possibile sovrascrivere
 * {@link #creaAssegnazioni(Object) creaAssegnazioni()}, che viene invocato da
 * tutti i metodi di modifica.<br/>
 * Si sconsiglia, invece, di estendere l'accessibilita' del metodo
 * {@link #inserisciCon(Object, Assegnazione...) inserisciCon()}
 * </p>
 * 
 * <p>
 * <h6>Modifica di una riga</h6>
 * La modifica di una riga esistente e' possibile tramite il metodo
 * {@link #replace(Object, Object) replace()}, che utilizza il mapping
 * restituito da {@link #getMappingFields()} per trasformare un bean in una riga
 * della tabella cui l'istanza di DBBeans e' associata.<br/>
 * Il metodo {@link #replace(Object, Object) replace()} si limita a richiamare
 * {@link #replaceCon(Object, Object, Assegnazione...) replaceCon()} passando
 * l'array restituito da {@link #creaAssegnazioni(Object) creaAssegnazioni()}.<br/>
 * In caso di necessita', e' possibile sovrascrivere
 * {@link #replace(Object, Object) replace()} in modo da passare al metodo
 * {@link #replaceCon(Object, Object, Assegnazione...) replaceCon()} un set di
 * assegnazioni specifico. Questo e' utile, ad esempio, per mappare le chiavi
 * esterne.<br/>
 * Se i parametri extra vengono calcolati allo stesso modo per tutti i metodi di
 * modifica (come e' di solito), e' anche possibile sovrascrivere
 * {@link #creaAssegnazioni(Object) creaAssegnazioni()}, che viene invocato da
 * tutti i metodi di modifica.<br/>
 * Si sconsiglia, invece, di estendere l'accessibilita' del metodo
 * {@link #replaceCon(Object, Object, Assegnazione...) replaceCon()}
 * </p>
 * 
 * <p>
 * <h6>Eliminazione di una riga</h6>
 * L'eliminazione di una riga esistente e' possibile tramite il metodo
 * {@link #delete(Object) delete()}, che utilizza il mapping restituito da
 * {@link #getMappingFields()} per generare una query di rimozione, basata sulla
 * chiave primaria, la cui costituzione e' restituita da {@link #getKeyFields()}
 * .
 * </p>
 * 
 * <p>
 * <h6>Iterazione sulla tabella</h6>
 * L'iterazione sui beans contenuti nella tabella e' possibile tramite il metodo
 * {@link #getAll()}, che restituisce un riferimento all'istanza di DBBeans su
 * cui e' invocato, o tramite l'istanza stessa, che implementa l'interfaccia
 * {@link Iterable}.<br/>
 * Durante l'iterazione, viene invocato il metodo {@link #creaBean(ResultSet)
 * creaBean()} per trasformare ciascuna riga della tabella nel bean associato.
 * </p>
 * 
 * <p>
 * <h6>Altri metodi</h6>
 * Oltre a quelli precedentemente citati, la classe fornisce altri metodi di
 * utilita', che permettono, per esempio, di verificare la presenza di un bean
 * all'interno della tabella o creare un {@link Iterable} o una {@link List} a
 * partire da un {@link ResultSet}.
 * </p>
 * 
 * @author Angelo G. Scafuro
 * 
 */
public abstract class DBBeans<B> implements Iterable<B>,DBBeansInterface<B> {

    /**
     * Array utilizzato da {@link #creaAssegnazioni(Object) creaAssegnazioni()}
     * per denotare la non-necessita' di effettuare assegnazioni extra.
     */
    protected static final Assegnazione[] NESSUNA_ASSEGNAZIONE = new Assegnazione[0];
    
    private static final String MAYBE_CORRUPT
            = "Il database potrebbe essere stato corrotto";
    private static final String AND = " AND ";
    private static final String WHERE = " WHERE ";
    private static final String COMMA = ", ";
    private static final String EQL = " = ?";
    private static final String SPECIAL_FIELD_PREFIX = "-";

    
    private static final Logger LOG = Logger
            .getLogger(Logger.GLOBAL_LOGGER_NAME);
    
    protected final Tabella tabella;
    private final Database db;
    
    // Effettivamente immutabili, una volta inizializzate
    private Map<String, PropertyDescriptor> props = null;
    private Map<String, Integer> meta = null;
    private PreparedStatement insertStmt = null;
    private PreparedStatement updateStmt = null;
    private PreparedStatement removeStmt = null;
    private PreparedStatement selectStmt = null;
    private PreparedStatement checkStmt = null;
    
    
    /**
     * Metodo costruttore
     * 
     * @param nomeTabella
     *            nome reale della relativa tabella del database
     * @param database
     *            connessione al database
     */
    public DBBeans(String nomeTabella, Database database) {
        tabella = new Tabella(nomeTabella, database);
        db = tabella.getDatabase();
    }
    
    /**
     * Restituisce il database con la relativa connessione
     * 
     * @return oggetto database con relativa connessione
     */
    protected final Database getDatabase() {
        return db;
    }
    
    /**
     * Restituisce una mappa dei metadati, nella forma
     * {@literal <colonna, indice_colonna>}, secondo l'ordinamento restituito da
     * {@code tabella.getMetadati().keySet().iterator()}. La mappa, una volta
     * creata, viene mantenuta in memoria.
     * 
     * @return Mappa dei metadati. La mappa restituita e' immutabile.
     */
    private Map<String, Integer> getMetadati() {
        if (meta == null) {
            Map<String, Integer> tblMeta = tabella.getMetadati();
            meta = new HashMap<String, Integer>(tblMeta);
            
            int i = 1;
            for (String s : tblMeta.keySet()) {
                meta.put(s, i);
                i += 1;
            }
        }
        return meta;
    }
    
    private Map<String, PropertyDescriptor> getProps(B bean) {
        if (props == null) {
            BeanInfo info;
            try {
                info = Introspector.getBeanInfo(bean.getClass());
            } catch (IntrospectionException e) {
                // Questo non dovrebbe mai accadere
                throw new IllegalArgumentException(
                        "Sembra che l'oggetto passato non sia un bean", e);
            }
            PropertyDescriptor[] campi = info.getPropertyDescriptors();
            Map<String, PropertyDescriptor> res
                    = new HashMap<String, PropertyDescriptor>(2 * campi.length);
            
            for (PropertyDescriptor campo : campi) {
                res.put(campo.getName(), campo);
            }
            
            props = Collections.unmodifiableMap(res);
        }
        return props;
    }
    
    /**
     * Metodo che legge un campo di nome nomeCampo da un oggetto Java realBean
     * 
     * @param realBean
     *            Oggetto da cui leggere il campo
     * @param nomeCampo
     *            nome del campo
     * @return valore del campo dell'oggetto passato.
     */
    protected final Object getFieldFromBean(B realBean, String nomeCampo) {
        PropertyDescriptor descr = getProps(realBean).get(nomeCampo);
        
        if (nomeCampo.startsWith(SPECIAL_FIELD_PREFIX)) {
            //Sara' settato da creaAssegnazioni
            return null;
        } else if (descr == null) {
            throw new RuntimeException(String.format(
                    "Campo '%1$s' inesistente", nomeCampo));
        } else {
            try {
                return descr.getReadMethod().invoke(realBean);
            } catch (InvocationTargetException e) {
                // Questo non dovrebbe mai accadere
                throw new RuntimeException(e);
            } catch (IllegalArgumentException e) {
                // Questo non dovrebbe mai accadere
                throw new RuntimeException(e);
            } catch (IllegalAccessException e) {
                // Questo non dovrebbe mai accadere
                throw new RuntimeException(e);
            }
        }
    }
    
    /**
     * Metodo che scrive un campo di nome nomeCampo in un oggetto Java realBean
     * 
     * @param realBean
     *            Oggetto in cui scrivere il campo
     * @param nomeCampo
     *            nome del campo
     * @param value
     *            valore da assegnare al campo
     */
    protected final void setFieldIntoBean(B realBean, String nomeCampo, Object value) {
        PropertyDescriptor descr = getProps(realBean).get(nomeCampo);
        
        if (nomeCampo.startsWith(SPECIAL_FIELD_PREFIX)) {
            //Impossibile settare chiavi esterne
            LOG.warning("Impossibile settare chiavi esterne");
            return;
        } else if (descr == null) {
            throw new RuntimeException(String.format(
                    "Campo '%1$s' inesistente", nomeCampo));
        } else {
            try {
                descr.getWriteMethod().invoke(realBean, value);
            } catch (InvocationTargetException e) {
                // Questo non dovrebbe mai accadere
                throw new RuntimeException(e);
            } catch (IllegalArgumentException e) {
                // Questo non dovrebbe mai accadere
                throw new RuntimeException(e);
            } catch (IllegalAccessException e) {
                // Questo non dovrebbe mai accadere
                throw new RuntimeException(e);
            }
        }
    }
    
    private String fieldToCol(Map<String, String> map, String fieldName) {
        String res = map.get(fieldName);
        assert !fieldName.contains("_")
                : fieldName + " non e' un nome di proprieta' valido."
                + " Probabilmente, getMappingFields e' stata implementata male.";
        
        if (res != null) {
            assert res.toLowerCase().equals(res) : res
                    + " non e' un nome di colonna valido."
                    + " Probabilmente, getMappingFields e' stata implementata male.";
        }
        return res;
    }
    
    /**
     * Metodo che legge i valori di tutti i campi di un oggetto Java realBean
     * 
     * @param realBean
     *            Oggetto da cui leggere i campi
     * @return Mappa da nomi di colonne a valori dei campi
     */
    protected final Map<String, Object> getFieldsFromBean(B realBean) {
        Map<String, PropertyDescriptor> descr = getProps(realBean);
        Map<String, Object> res = new HashMap<String, Object>();
        Map<String, String> mapping = getMappingFields();
        String colName;
        Object propVal;
        
        for (Map.Entry<String, PropertyDescriptor> p : descr.entrySet()) {
            colName = fieldToCol(mapping, p.getKey());
            
            if (colName != null) {
                try {
                    propVal = p.getValue().getReadMethod().invoke(realBean);
                } catch (IllegalArgumentException e) {
                    // Questo non dovrebbe mai accadere
                    throw new RuntimeException(e);
                } catch (IllegalAccessException e) {
                    // Questo non dovrebbe mai accadere
                    throw new RuntimeException(e);
                } catch (InvocationTargetException e) {
                    // Questo non dovrebbe mai accadere
                    throw new RuntimeException(e);
                }
                res.put(colName, propVal);
            }
        }
        
        return res;
    }
    
    /**
     * @return
     * @throws SQLException
     */
    private PreparedStatement getInsertStmt() throws SQLException {
        if (insertStmt == null) {
            StringBuilder query = new StringBuilder("INSERT INTO ");
            query.append(tabella.getNomeTabella()).append("(");
            
            // Elenca i nomi delle colonne
            for (String s : tabella.getMetadati().keySet()) {
                query.append(s);
                query.append(COMMA);
            }
            query.setLength(query.length() - COMMA.length());
            query.append(") VALUES (");
            
            // Inserisci parametri
            for (int i = tabella.getMetadati().size(); i > 1; --i) {
                query.append("?").append(COMMA);
            }
            query.append("?)");
            
            insertStmt = db.prepareStatement(query.toString());
        }
        return insertStmt;
    }
    
    /**
     * Inserisce un bean nella tabella del database, utilizzando i valori
     * forniti in input, oltre al mapping restituito da
     * {@link #getMappingFields()}.
     * 
     * @param realBean
     *            bean da inserire nel database
     * @param fixVals
     *            valori predefiniti per le colonne
     * @return Booleano che rappresenta l'esito dell'operazione
     */
    protected final boolean inserisciCon(B realBean, Assegnazione... fixVals) {
        try {
            PreparedStatement stmt = getInsertStmt();
            
            // Inserisci i parametri nella query
            Map<String, Object> values = getFieldsFromBean(realBean);
            Map<String, Integer> meta = getMetadati();
            
            for (Map.Entry<String, Integer> ent : meta.entrySet()) {
                String col = ent.getKey();
                Object val = values.get(col);
                tabella.setParam(stmt, ent.getValue(), col, val);
            }
            
            /*
             * Inserisci i parametri predefiniti passati in input In questo
             * modo, i valori di fixVals sostituiranno eventuali valori
             * preesistenti, assumendo la precedenza
             */
            for (Assegnazione a : fixVals) {
                Integer colid = meta.get(a.colonna);
                if (colid == null) {
                    throw new IllegalArgumentException("No such column: " + a.colonna);
                }
                
                tabella.setParam(stmt, colid, a.colonna, a.valore);
            }
            int res = stmt.executeUpdate();
            
            if (res == 1) {
                ResultSet rs = stmt.getGeneratedKeys();
                if (rs.next()) {
                    //Sono state generate delle chiavi automatiche
                    /*
                     * XXX istruzioni pericolose
                     * MySQL restituisce un'unica colonna GENERATED_KEY
                     * quindi, assumo che quella corrisponda al campo 'id',
                     * a patto che questo valga 0 o null.
                     */
                    Object o = getFieldFromBean(realBean, "id");
                    if (o == null || (o instanceof Integer && ((Integer)o) == 0)) {
                        setFieldIntoBean(realBean, "id", ((Number)rs.getObject(1)).intValue());
                    } else {
                        LOG.warning("Impossibile individuare il campo autogenerato");
                    }
                }
                rs.close();
                return true;
            } else {
                return false;
            }
        } catch (SQLException ex) {
            Database.logSQLException(LOG, Level.SEVERE, ex);
            return false;
        }
    }
    
    /**
     * Inserisce un beans nella relativa tabella del database
     * 
     * @param realBean
     *            beans da inserire nel database
     * @return true in caso di inserimento riuscito false altrimenti
     */
    public boolean inserisci(B realBean) {
        return inserisciCon(realBean, creaAssegnazioni(realBean));
    }
    
    /**
     * @return
     */
    private PreparedStatement getUpdateStmt() throws SQLException {
        if (updateStmt == null) {
            final Set<String> cols = tabella.getMetadati().keySet();
            final Map<String, String> mapping = getMappingFields();
            final List<String> key = getKeyFields();
            
            StringBuilder query = new StringBuilder("UPDATE ");
            query.append(tabella.getNomeTabella()).append(" SET ");
            
            // Elenca tutti i campi
            for (String col : cols) {
                query.append(col).append(EQL).append(COMMA);
            }
            query.setLength(query.length() - COMMA.length());
            
            query.append(WHERE);
            /*
             * Elenca le colonne della chiave e aggiungi i parametri alla query
             */
            for (String s : key) {
                query.append(fieldToCol(mapping, s)).append(EQL).append(AND);
            }
            query.setLength(query.length() - AND.length());
            
            updateStmt = db.prepareStatement(query.toString());
        }
        
        return updateStmt;
    }
    
    private void setKeyFields(PreparedStatement stmt, int startingFrom, B bean,
            Map<String, String> mapping, List<String> keyFields,
            Assegnazione[] fixVals) throws SQLException {
        Assegnazione[] oldAss = creaAssegnazioni(bean);
        for (String k : getKeyFields()) {
            if (k.startsWith(SPECIAL_FIELD_PREFIX)) {
                String target = fieldToCol(mapping, k);
                for (Assegnazione ass : oldAss) {
                    if (ass.colonna.equals(target)) {
                        tabella.setParam(stmt, startingFrom, target, ass.valore);
                    }
                }
            } else {
                tabella.setParam(stmt, startingFrom, mapping.get(k),
                        getFieldFromBean(bean, k));
            }
            startingFrom += 1;
        }
    }
    
    /**
     * Modifica un bean nella tabella del database, utilizzando i valori forniti
     * in input, oltre al mapping restituito da {@link #getMappingFields()}.
     * 
     * @param realBean
     *            bean da rimpiazzare
     * @param newRealBean
     *            nuovo bean che sostituira' il suo corrispondente nel database
     * @param fixVals
     *            valori predefiniti per le colonne
     * @return Booleano che rappresenta l'esito dell'operazione
     */
    protected final boolean replaceCon(B realBean, B newRealBean,
            Assegnazione... fixVals) {
        
        Map<String, Object> newFields = getFieldsFromBean(newRealBean);
        Map<String, String> mapping = getMappingFields();
        Map<String, Integer> meta = getMetadati();
        
        try {
            PreparedStatement stmt = getUpdateStmt();
            int i = 1;
            
            // Imposta i nuovi valori
            for (String col : tabella.getMetadati().keySet()) {
                tabella.setParam(stmt, i, col, newFields.get(col));
                i += 1;
            }
            
            // Setta i parametri relativi alla chiave
            setKeyFields(stmt, i, realBean, mapping, getKeyFields(),
                    creaAssegnazioni(realBean));
            
            /*
             * Inserisci i parametri predefiniti passati in input In questo
             * modo, i valori di fixVals sostituiranno eventuali valori
             * preesistenti, assumendo la precedenza
             */
            for (Assegnazione a : fixVals) {
                i = meta.get(a.colonna);
                tabella.setParam(stmt, i, a.colonna, a.valore);
            }
            
            i = stmt.executeUpdate();
            switch (i) {
            case 0:
                return false;
            case 1:
                return true;
            default:
                LOG.log(Level.SEVERE,
                        "La query \"{0}\" ha modificato {1} righe."
                                + MAYBE_CORRUPT, new Object[] { stmt, i });
                
                /*
                 * Restituisci false, per far notare che c'e' qualcosa che non
                 * va.
                 */
                return false;
            }
            
        } catch (SQLException e) {
            Database.logSQLException(LOG, Level.SEVERE, e);
            return false;
        }
    }
    
    /**
     * Sostituisce un beans con un nuovo beans.
     * 
     * @param realBean
     *            beans presente nel databse
     * @param newRealBean
     *            nuovo bean che sostituira' il suo corrispondente nel database
     * @return esito dell'operazione
     */
    public boolean replace(B realBean, B newRealBean) {
        return replaceCon(realBean, newRealBean, creaAssegnazioni(newRealBean));
    }
    
    /**
     * @return
     */
    private PreparedStatement getRemoveStmt() throws SQLException {
        if (removeStmt == null) {
            final Map<String, String> mapping = getMappingFields();
            final List<String> key = getKeyFields();
            
            StringBuilder query = new StringBuilder("DELETE FROM ");
            query.append(tabella.getNomeTabella()).append(WHERE);
            
            /*
             * Elenca le colonne della chiave e aggiungi i parametri alla query
             */
            for (String s : key) {
                query.append(fieldToCol(mapping, s)).append(EQL).append(AND);
            }
            query.setLength(query.length() - AND.length());
            
            removeStmt = db.prepareStatement(query.toString());
        }
        
        return removeStmt;
    }
    
    /**
     * Cancella una beans dal database
     * 
     * @param realBean
     *            bean da cancellare
     * @return true in caso di successo false altrimenti
     */
    public boolean delete(B realBean) {
        try {
            PreparedStatement stmt = getRemoveStmt();
            
            setKeyFields(stmt, 1, realBean, getMappingFields(), getKeyFields(),
                    creaAssegnazioni(realBean));
            
            int res = stmt.executeUpdate();
            switch (res) {
            case 0:
                return false;
            case 1:
                return true;
            default:
                LOG.log(Level.SEVERE,
                        "La query \"{0}\" ha cancellato {1} righe."
                                + MAYBE_CORRUPT, new Object[] { stmt, res });
                
                /*
                 * Restituisci false, per far notare che c'e' qualcosa che non
                 * va.
                 */
                return false;
            }
            
        } catch (SQLException e) {
            Database.logSQLException(LOG, Level.SEVERE, e);
            return false;
        }
    }
    
    /**
     * @return
     * @throws SQLException
     */
    private PreparedStatement getSelectStmt() throws SQLException {
        if (selectStmt == null) {
            selectStmt = db.prepareStatement("SELECT * FROM "
                    + tabella.getNomeTabella());
        }
        return selectStmt;
    }
    
    /**
     * Restituisce tutti gli elementi di una tabella
     * 
     * @return lista di tutti i record relativi alla tabella del beans
     */
    public Iterable<B> getAll() {
        return this;
    }
    
    @Override
    public Iterator<B> iterator() {
        try {
            PreparedStatement stmt = getSelectStmt();
            return new RSWrapper(stmt.executeQuery());
        } catch (SQLException ex) {
            Database.logSQLException(LOG, Level.SEVERE, ex);
            return ((List<B>) Collections.EMPTY_LIST).iterator();
        }
    }
    
    /**
     * Avvolge un ResultSet in una collezione che puo' essere iterata una sola
     * volta.
     * 
     * Questo metodo e' utile per restituire collezioni iterabili in risposta a
     * query complesse. L'iteratore restituito provvede da solo alla chiusura
     * del ResultSet, una volta completata l'iterazione.
     * 
     * @param rs
     *            ResultSet
     * @return Collezione iterabile una sola volta.
     */
    protected final Iterable<B> iteraResultSet(ResultSet rs) {
        return new IterableOnlyOnce<B>(new RSWrapper(rs));
    }
    
    /**
     * Crea una lista a partire da un ResultSet
     * 
     * @param rs
     *            ResultSet. Il ResultSet passato viene chiuso.
     * @return Lista contenente i risultati del ResultSet
     */
    protected final List<B> creaList(ResultSet rs) {
        return creaList(iteraResultSet(rs));
    }
    
    /**
     * Restituisce l'unico risultato contenuto in un ResultSet
     * 
     * @param rs
     *            ResultSet
     * @return Unico risultato contenuto. False, se il ResultSet non contiene
     *         risultati.<br/>
     *         Una volta ottenuto il valore di ritorno, verificarne l'unicita'
     *         con {@code rs.isLast()}.
     */
    protected final B unicoRisultato(ResultSet rs) {
        try {
            if (rs.next()) {
                return creaBean(rs);
            } else {
                return null;
            }
        } catch (SQLException e) {
            Database.logSQLException(LOG, Level.SEVERE, e);
            return null;
        }
    }
    
    /**
     * Crea una lista a partire da una collezione iterabile
     * 
     * Questa implementazione ha tempo lineare.
     * 
     * @param <B>
     *            Tipo di lista restituito.
     * @param it
     *            Collezione iterabile
     * @return Lista equivalente alla collezione in input.
     */
    protected static final <B> List<B> creaList(Iterable<? extends B> it) {
        List<B> res = new ArrayList<B>();
        for (B b : it) {
            res.add(b);
        }
        return res;
    }
    
    private PreparedStatement getCheckStmt() throws SQLException {
        if (checkStmt == null) {
            StringBuilder query = new StringBuilder();
            query.append("SELECT * FROM ").append(tabella.getNomeTabella())
                    .append(WHERE);
            
            for (String s : tabella.getMetadati().keySet()) {
                query.append(s).append(EQL).append(AND);
            }
            query.setLength(query.length() - COMMA.length());
            
            checkStmt = tabella.prepareStatement(query.toString());
        }
        return checkStmt;
    }
    
    /**
     * Controlla se un bean si trova nella tabella del database, utilizzando i
     * valori forniti in input, oltre al mapping restituito da
     * {@link #getMappingFields()}.
     * 
     * @param bean
     *            bean da ricercare
     * @param fixVals
     *            valori predefiniti per le colonne
     * @return True se il bean si trova nel database. false altrimenti, o in
     *         caso di errore.
     */
    protected final boolean isInTableCon(B bean, Assegnazione... fixVals) {
        try {
            PreparedStatement stmt = getCheckStmt();
            Map<String, Integer> meta = getMetadati();
            Map<String, Object> vals = getFieldsFromBean(bean);
            
            // Imposta valori mappati
            for (Map.Entry<String, Integer> ent : getMetadati().entrySet()) {
                tabella.setParam(stmt, ent.getValue(), ent.getKey(),
                        vals.get(ent.getKey()));
            }
            
            /*
             * Inserisci i parametri predefiniti passati in input In questo
             * modo, i valori di fixVals sostituiranno eventuali valori
             * preesistenti, assumendo la precedenza
             */
            for (Assegnazione a : fixVals) {
                tabella.setParam(stmt, meta.get(a.colonna), a.colonna, a.valore);
            }
            
            return false;
        } catch (SQLException ex) {
            Database.logSQLException(LOG, Level.SEVERE, ex);
            return false;
        }
    }
    
    /**
     * Controlla se un bean si trova nella tabella del database
     * 
     * @param bean
     *            bean da ricercare
     * @return True se il bean si trova nel database. false altrimenti, o in
     *         caso di errore.
     */
    public boolean isInTable(B bean) {
        return isInTableCon(bean, creaAssegnazioni(bean));
    }
    
    /**
     * Metodo astratto che associa, per ogni Bean, in una mappa hash secondo lo
     * schema {@literal <variabileBean , colonnaDatabase>}.
     * 
     * @return Mappa da nomi di variabili a nomi di colonne
     */
    protected abstract Map<String, String> getMappingFields();
    
    /**
     * Restituisce la lista dei campi chiave nel database per questo bean.
     * 
     * @return Lista dei campi che compongono la chiave primaria della tabella.
     */
    protected abstract List<String> getKeyFields();
    
    /**
     * Crea un oggetto bean a partire da una riga di un {@link ResultSet}.
     * 
     * @param r
     *            ResultSet impostato su una riga Il metodo non dovrebbe
     *            invocare alcun modificatore sul ResultSet passato, ma
     *            limitarsi a usare i metodi getXXX.
     * @return Bean corrispondente alla riga passata
     * @throws SQLException
     *             se si verifica un'eccezione nel fetch dei dati
     */
    protected abstract B creaBean(ResultSet r) throws SQLException;
    
    /**
     * Metodo utilizzato dagli altri metodi di DBBeans per ricavare le
     * assegnazioni predefinite relativamente a un bean.<br/>
     * Nella sua implementazione predefinita, questo metodo restituisce sempre
     * {@link #NESSUNA_ASSEGNAZIONE}. Le classi estendenti possono sovrascrivere
     * questo metodo per indicare in modo comodo delle assegnazioni predefinite
     * per tutti i metodi di modifica della base di dati.
     * 
     * @param bean
     *            Bean per cui valutare le assegnazioni
     * @return Array di assegnazioni
     */
    protected Assegnazione[] creaAssegnazioni(B bean) {
        return NESSUNA_ASSEGNAZIONE;
    }
    
    
    private final class RSWrapper implements Iterator<B> {
        private final ResultSet result;
        private B next;
        
        private RSWrapper(ResultSet result) {
            this.result = result;
        }
        
        /**
         * @see java.util.Iterator#hasNext()
         * @return true se e solo se next viene settato ad un valore non nullo
         */
        @Override
        public boolean hasNext() {
            if (next != null) {
                return true;
            }
            
            try {
                if (result.next()) {
                    next = creaBean(result);
                    return true;
                } else {
                    return false;
                }
            } catch (SQLException e) {
                Database.logSQLException(LOG, Level.SEVERE, e);
                
                // Impossibile eseguire altre operazioni
                return false;
            }
        }
        
        /**
         * @see java.util.Iterator#next()
         */
        @Override
        public B next() {
            if (next != null) {
                B res = next;
                next = null;
                return res;
            } else if (hasNext()) {
                return next();
            } else {
                throw new NoSuchElementException();
            }
        }
        
        /**
         * Operazione non supportata
         * 
         * @throws UnsupportedOperationException
         * @see java.util.Iterator#remove()
         */
        @Override
        public void remove() throws UnsupportedOperationException {
            throw new UnsupportedOperationException();
        }
    }
    
    protected static class Assegnazione {
        public final String colonna;
        public final Object valore;
        
        
        /**
         * Crea una nuova assegnazione di valore
         * 
         * @param colonna
         *            Nome della colonna
         * @param valore
         *            Valore della colonna
         */
        public Assegnazione(String colonna, Object valore) {
            this.colonna = colonna;
            this.valore = valore;
        }
        
        /**
         * Metodo ausiliario che crea un array di assegnazioni, a partire da una
         * lista di parametri, secondo lo schema {@literal colonna1, valore1,
         * ..., colonnaN, valoreN} .
         * 
         * Questo metodo e' stato progettato per semplificare le chiamate a
         * {@link DBBeans#inserisciCon(Object, Assegnazione...)}, con una
         * sintassi del tipo:
         * 
         * <pre>
         * inserisciCon(realBean, Assegnazione.catena(&quot;colonna1&quot;, valore1, &quot;colonna2&quot;,
         *         valore2, &quot;colonna3&quot;, valore3));
         * </pre>
         * 
         * che corrisponde alla sintassi classica:
         * 
         * <pre>
         *      inserisciCon(realBean,
         *              new Assegnazione("colonna1", valore1),
         *              new Assegnazione("colonna2", valore2),
         *              new Assegnazione("colonna3", valore3),
         *      );
         * </pre>
         * 
         * @param vals
         *            Colonne e valori da utilizzare.<br/>
         *            Gli elementi di indice pari (0-based) devono essere nomi
         *            di colonne<br/>
         *            Gli elementi di indice dispari (0-based) devono essere i
         *            valori da assegnare alla colonna il cui nome e' passato
         *            nell'elemento precedente della lista.
         * @return Array di assegnazioni
         * @throws IllegalArgumentException
         *             Se viene fornito un numero dispari di argomenti
         */
        public static Assegnazione[] catena(Object... vals)
                throws IllegalArgumentException {
            if (vals.length % 2 != 0) {
                throw new IllegalArgumentException(
                        "L'array di valori deve avere lunghezza pari");
            }
            
            Assegnazione[] res = new Assegnazione[vals.length / 2];
            for (int i = 0; i < vals.length; i += 2) {
                res[i / 2] = new Assegnazione(vals[i].toString(), vals[i + 1]);
            }
            
            return res;
        }
    }
}
