/*
 *-----------------------------------------------------------------
 * This file is licensed under GPL 3.0:
 * http://www.gnu.org/licenses/gpl-3.0.html
 *-----------------------------------------------------------------
 * FILE: TestDBBeans.java
 *-----------------------------------------------------------------
 * PROGETTO: Atsilo
 *-----------------------------------------------------------------
 * OWNER
 * giulio, 01/dic/2012
 * REVISION
 * <nome revisore>, <data revisione>
 *-----------------------------------------------------------------
 */

package atsilo.test.storage;

import static org.junit.Assert.*;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.BitSet;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;


import atsilo.storage.DBBeans;
import atsilo.storage.Database;

/**
 * Classe TestDBBeans
 * <Descrizione classe>
 * 
 * @author giulio
 * 
 */
public class TestDBBeans {
    private static final Logger LOG
            = Logger.getLogger(TestDBBeans.class.getName());
    private Database db;
    private DBMyUtente utenti;
    private DBMyTrasmissione trasmissioni;
    
    /**
     * @throws java.lang.Exception
     */
    @Before
    public void setUp() throws Exception {
        db = new Database();
        if (!db.apriConnessione()) {
            throw new RuntimeException("Connessione fallita");
        }
        DBUtil.execScript(db, "testDB.sql");
        utenti = new DBMyUtente(db);
        trasmissioni = new DBMyTrasmissione(db);
    }
    
    /**
     * @throws java.lang.Exception
     */
    @After
    public void tearDown() throws Exception {
        db.chiudiConnessione();
        utenti = null;
        trasmissioni = null;
    }
    
    @Test
    public void testInserisci() throws SQLException {
        MyUtente md = new MyUtente("Mario", "Draghi", "DRGMRA");
        assertTrue(utenti.inserisci(md));
        for (MyUtente u : utenti) {
            if (u.equals(md)) {
                return;
            }
        }
        fail("L'utente e' stato inserito, ma non e' presente nel DB");
    }
    
    @Test
    public void testUpdate() throws SQLException {
        MyUtente md = new MyUtente(null, null, "TTRI");
        MyUtente nu = new MyUtente("Tiberio", "Tombani", "TTNI");
        assertTrue(utenti.replace(md, nu));
        
        for (MyUtente u : utenti) {
            if (u.equals(md)) {
                fail("L'utente non e' stato rimosso");
            } else if (u.equals(nu)) {
                return;
            }
        }
        fail("Il nuovo utente non e' presente nel database");
    }
    
    @Test
    public void testDelete() throws SQLException {
        MyUtente md = new MyUtente(null, null, "TTRI");
        assertTrue(utenti.delete(md));
        
        for (MyUtente u : utenti) {
            if (u.getCf().equals("TTRI")) {
                fail("L'utente non e' stato realmente eliminato");
            }
        }
    }
    
    @Test
    public void testGetByCognome() {
        List<MyUtente> u = utenti.getByCognome("Timperi");
        assertEquals(u, Arrays.asList(new MyUtente("Tiberio", "Timperi", "TTRI")));
    }
    
    @Test
    public void testInsertWForeign() {
        MyTrasmissione t = new MyTrasmissione();
        t.setNome("Il \"Lotto\" alle otto");
        t.setUtente(new MyUtente(null, null, "TTRI"));
        
        assertTrue(trasmissioni.inserisci(t));
        assertContent(trasmissioni, Arrays.asList(
                new MyTrasmissione("Crack si gira", new MyUtente(null, null, "PPO")),
                new MyTrasmissione("Il \"Lotto\" alle otto", new MyUtente(null, null, "TTRI"))));
    }
    
    @Test
    public void testReplaceWForeign() {
        MyTrasmissione oldT = new MyTrasmissione();
        oldT.setNome("Crack si gira");
        oldT.setUtente(new MyUtente(null, null, "PPO"));
        
        MyTrasmissione newT = new MyTrasmissione();
        newT.setNome("Crack si gira");
        newT.setUtente(new MyUtente(null, null, "TTRI"));
        
        assertTrue(trasmissioni.replace(oldT, newT));
        assertContent(trasmissioni, Arrays.asList(
                new MyTrasmissione("Crack si gira", new MyUtente(null, null, "TTRI"))
                ));
    }
    
    @Test
    public void testDeleteWForeign() {
        MyTrasmissione t = new MyTrasmissione();
        t.setNome("Crack si gira");
        t.setUtente(new MyUtente(null, null, "PPO"));
        
        assertTrue(trasmissioni.delete(t));
        List<MyTrasmissione> l = Arrays.asList();
        assertContent(trasmissioni, l);
    }
    
    @Test
    public void testInsertWeak() {
        MyWeakEntity we = new MyWeakEntity(21, new MyUtente(null, null, "PPO"));
        DBMyWeakEntity man = new DBMyWeakEntity(db);
        
        assertTrue(man.inserisci(we));
        
        for (MyWeakEntity ent : man) {
            if (ent.equals(we)) {
                return;
            }
        }
        fail("La WeakEntity e' stata inserita, ma non e' presente nel DB");
    }
    
    @Test
    public void testUpdateWeakNoKey() {
        MyWeakEntity oldWe = new MyWeakEntity(18, new MyUtente(null, null, "TTRI"));
        MyWeakEntity we = new MyWeakEntity(36, new MyUtente(null, null, "TTRI"));
        DBMyWeakEntity man = new DBMyWeakEntity(db);
        
        assertTrue(man.replace(oldWe, we));
        
        for (MyWeakEntity ent : man) {
            if (ent.equals(we)) {
                return;
            }
        }
        fail("La WeakEntity e' stata modificata, ma non e' presente nel DB");
    }
    
    @Test
    public void testUpdateWeakKey() {
        MyWeakEntity oldWe = new MyWeakEntity(18, new MyUtente(null, null, "TTRI"));
        MyWeakEntity we = new MyWeakEntity(18, new MyUtente(null, null, "PPO"));
        DBMyWeakEntity man = new DBMyWeakEntity(db);
        
        assertTrue(man.replace(oldWe, we));
        
        for (MyWeakEntity ent : man) {
            if (ent.equals(we)) {
                return;
            }
        }
        fail("La WeakEntity e' stata modificata, ma non e' presente nel DB");
    }
    
    @Test
    public void testDeleteWeak() {
        MyWeakEntity we = new MyWeakEntity(36, new MyUtente(null, null, "TTRI"));
        DBMyWeakEntity man = new DBMyWeakEntity(db);
        
        assertTrue(man.delete(we));
        
        assertContent(man, Arrays.asList(new MyWeakEntity[0]));
    }
    
    @Test
    public void testInsertAInc() {
        AutoIncrementingEntity aie = new AutoIncrementingEntity(
                "'mmocc 'a chi t'e' mmuort");
        
        DBAutoIncrementingEntity dba = new DBAutoIncrementingEntity(db);
        
        assertTrue(dba.inserisci(aie));
        
        assertFalse(aie.getId() == 0);
    }
    
    @Test
    public void testInsertRemoveAInc() {
        testInsertAInc();
        DBAutoIncrementingEntity dba = new DBAutoIncrementingEntity(db);

        AutoIncrementingEntity aie = dba.getAll().iterator().next();
        
        assertTrue(dba.delete(aie));
        
        assertFalse(dba.getAll().iterator().hasNext());
    }
    
    @Test
    public void testInsertEditAInc() {
        testInsertAInc();
        DBAutoIncrementingEntity dba = new DBAutoIncrementingEntity(db);

        AutoIncrementingEntity aie = dba.getAll().iterator().next();
        
        AutoIncrementingEntity naie = new AutoIncrementingEntity(120, "mammt");
        assertTrue(dba.replace(aie, naie));
        
        assertContent(dba, Arrays.asList(naie));
    }
    
    /**
     * Verifica che il contenuto del database coincida con quello indicato
     * @param man       Manager della tabella
     * @param content   Contenuto richiesto
     */
    public static <T> void assertContent(DBBeans<T> man, List<T> content) {
        int verified = 0;
        BitSet found = new BitSet(content.size());
        int i;
        
        for (T elt : man.getAll()) {
            for (i = 0; i < content.size(); ++i) {
                if (content.get(i).equals(elt)) {
                    found.set(i);
                    verified += 1;
                    break;
                }
            }
            if (i == content.size()) {
                fail("L'elemento " + elt.toString()
                        + " e' presente nel database,"
                        + "ma non era richiesto");
            }
        }
        
        if (verified < content.size()) {
            List<T> missing = new ArrayList<T>(content.size() - verified);
            for (i = 0; i < content.size(); ++i) {
                if (!found.get(i)) {
                    missing.add(content.get(i));
                }
            }
            fail("I seguenti elementi non sono stati trovati: "
                        + missing.toString());
        }
    }
    
    public static final class MyUtente {
        private String nome;
        private String cognome;
        private String cf;
        
        
        public MyUtente() {
            
        }
        
        /**
         * @param nome
         * @param cognome
         * @param cf
         */
        public MyUtente(String nome, String cognome, String cf) {
            super();
            this.nome = nome;
            this.cognome = cognome;
            this.cf = cf;
        }
        
        /**
         * @return nome
         */
        public String getNome() {
            return nome;
        }
        
        /**
         * @param nome
         *            nuovo nome
         */
        public void setNome(String nome) {
            this.nome = nome;
        }
        
        /**
         * @return cognome
         */
        public String getCognome() {
            return cognome;
        }
        
        /**
         * @param cognome
         *            nuovo cognome
         */
        public void setCognome(String cognome) {
            this.cognome = cognome;
        }
        
        /**
         * @return cf
         */
        public String getCf() {
            return cf;
        }
        
        /**
         * @param cf
         *            nuovo cf
         */
        public void setCf(String cf) {
            this.cf = cf;
        }

        /**
         * @see java.lang.Object#hashCode()
         */
        @Override
        public int hashCode() {
            final int prime = 31;
            int result = 1;
            result = prime * result + ((cf == null) ? 0 : cf.hashCode());
            result = prime * result
                    + ((cognome == null) ? 0 : cognome.hashCode());
            result = prime * result + ((nome == null) ? 0 : nome.hashCode());
            return result;
        }

        /**
         * @see java.lang.Object#equals(java.lang.Object)
         */
        @Override
        public boolean equals(Object obj) {
            if (this == obj)
                return true;
            if (obj == null)
                return false;
            if (getClass() != obj.getClass())
                return false;
            MyUtente other = (MyUtente) obj;
            if (cf == null) {
                if (other.cf != null)
                    return false;
            } else if (!cf.equals(other.cf))
                return false;
            if (cognome == null) {
                if (other.cognome != null)
                    return false;
            } else if (!cognome.equals(other.cognome))
                return false;
            if (nome == null) {
                if (other.nome != null)
                    return false;
            } else if (!nome.equals(other.nome))
                return false;
            return true;
        }

        /**
         * @see java.lang.Object#toString()
         */
        @Override
        public String toString() {
            return "MyUtente [nome=" + nome + ", cognome=" + cognome + ", cf="
                    + cf + "]";
        }
    }
    
    public static final class MyTrasmissione {
        private String nome;
        private MyUtente utente;
        
        
        public MyTrasmissione() {
            
        }
        
        /**
         * @param nome
         * @param utente
         */
        public MyTrasmissione(String nome, MyUtente utente) {
            super();
            this.nome = nome;
            this.utente = utente;
        }
        
        
        /**
         * @return nome
         */
        public String getNome() {
            return nome;
        }
        
        
        /**
         * @param nome
         *            nuovo nome
         */
        public void setNome(String nome) {
            this.nome = nome;
        }
        
        
        /**
         * @return utente
         */
        public MyUtente getUtente() {
            return utente;
        }
        
        
        /**
         * @param utente
         *            nuovo utente
         */
        public void setUtente(MyUtente utente) {
            this.utente = utente;
        }

        /**
         * @see java.lang.Object#hashCode()
         */
        @Override
        public int hashCode() {
            final int prime = 31;
            int result = 1;
            result = prime * result + ((nome == null) ? 0 : nome.hashCode());
            result = prime * result
                    + ((utente == null) ? 0 : utente.hashCode());
            return result;
        }

        /**
         * @see java.lang.Object#equals(java.lang.Object)
         */
        @Override
        public boolean equals(Object obj) {
            if (this == obj)
                return true;
            if (obj == null)
                return false;
            if (getClass() != obj.getClass())
                return false;
            MyTrasmissione other = (MyTrasmissione) obj;
            if (nome == null) {
                if (other.nome != null)
                    return false;
            } else if (!nome.equals(other.nome))
                return false;
            if (utente == null) {
                if (other.utente != null)
                    return false;
            } else if (!utente.equals(other.utente))
                return false;
            return true;
        }

        /**
         * @see java.lang.Object#toString()
         */
        @Override
        public String toString() {
            return "MyTrasmissione [nome=" + nome + ", utente=" + utente + "]";
        }
    }
    
    public static final class DBMyUtente extends DBBeans<MyUtente> {
        private static Map<String, String> MAPPING = null;
        private static List<String> KEY = null;
        
        
        /**
         * @param nomeTabella
         * @param database
         */
        public DBMyUtente(Database database) {
            super("Utente", database);
        }
        
        /**
         * @see atsilo.storage.DBBeans#getMappingFields()
         */
        @Override
        protected Map<String, String> getMappingFields() {
            if (MAPPING == null) {
                Map<String, String> res = new HashMap<String, String>();
                res.put("nome", "nome");
                res.put("cognome", "cognome");
                res.put("cf", "cf");
                
                MAPPING = Collections.unmodifiableMap(res);
            }
            return MAPPING;
        }
        
        /*
         * (non-Javadoc)
         * 
         * @see atsilo.storage.DBBeans#getKeyFields()
         */
        @Override
        protected List<String> getKeyFields() {
            if (KEY == null) {
                KEY = Collections.unmodifiableList(Arrays.asList("cf"));
            }
            return KEY;
        }
        
        /**
         * @see atsilo.storage.DBBeans#creaBean(java.sql.ResultSet)
         */
        @Override
        protected MyUtente creaBean(ResultSet r) throws SQLException {
            MyUtente res = new MyUtente();
            res.setCf(r.getString("cf"));
            res.setNome(r.getString("nome"));
            res.setCognome(r.getString("cognome"));
            return res;
        }
        
        public MyUtente getUtenteByTrasmissione(MyTrasmissione t) {
            try {
                PreparedStatement stmt = tabella
                        .prepareStatement("SELECT * FROM Utente WHERE CF = ?");
                
                try {
                    stmt.setString(1, t.getUtente().getCf());
                    
                    ResultSet rSet = stmt.executeQuery();
                    try {
                    if (rSet.next()) {
                        t.setUtente(creaBean(rSet));
                        return t.getUtente();
                    } else {
                        return null;
                    }
                    }finally{
                        rSet.close();
                    }
                } finally {
                    stmt.close();
                }
            } catch (SQLException e) {
                LOG.log(Level.SEVERE, null, e);
                return null;
            }
        }
        
        public List<MyUtente> getByCognome(String cognome) {
            try {
                PreparedStatement stmt = tabella
                        .prepareStatement("SELECT * FROM Utente WHERE Cognome = ?");
                
                try {
                    stmt.setString(1, cognome);
                    return creaList(stmt.executeQuery());
                } finally {
                    stmt.close();
                }
            } catch (SQLException e) {
                LOG.log(Level.SEVERE, null, e);
                return null;
            }
        }
    }
    
    public static final class DBMyTrasmissione extends DBBeans<MyTrasmissione> {
        private static Map<String, String> MAPPING = null;
        private static List<String> KEY = null;
        
        
        /**
         * @param nomeTabella
         * @param database
         */
        public DBMyTrasmissione(Database database) {
            super("Trasmissione", database);
        }
        
        /**
         * @see atsilo.storage.DBBeans#getMappingFields()
         */
        @Override
        protected Map<String, String> getMappingFields() {
            if (MAPPING == null) {
                Map<String, String> res = new HashMap<String, String>();
                res.put("nome", "nome");
                
                MAPPING = Collections.unmodifiableMap(res);
            }
            return MAPPING;
        }
        
        /*
         * (non-Javadoc)
         * 
         * @see atsilo.storage.DBBeans#getKeyFields()
         */
        @Override
        protected List<String> getKeyFields() {
            if (KEY == null) {
                KEY = Collections.unmodifiableList(Arrays.asList("nome"));
            }
            return KEY;
        }
        
        /**
         * @see atsilo.storage.DBBeans#creaBean(java.sql.ResultSet)
         */
        @Override
        protected MyTrasmissione creaBean(ResultSet r) throws SQLException {
            MyTrasmissione res = new MyTrasmissione();
            res.setNome(r.getString("nome"));
            res.setUtente(new MyUtente());
            res.getUtente().setCf(r.getString("utente"));
            return res;
        }
        
        /**
         * @see atsilo.storage.DBBeans#creaAssegnazioni(java.lang.Object)
         */
        @Override
        protected atsilo.storage.DBBeans.Assegnazione[] creaAssegnazioni(
                MyTrasmissione bean) {
            return Assegnazione.catena(
                    "utente", bean.getUtente().getCf());
        }
    }
    
    public static class MyWeakEntity {
        private int aVal;
        private MyUtente utente;
        
        /**
         * @param aVal
         * @param utente
         */
        public MyWeakEntity(int aVal, MyUtente utente) {
            super();
            this.aVal = aVal;
            this.utente = utente;
        }
        
        /**
         * 
         */
        public MyWeakEntity() {
            super();
        }

        /**
         * @return aVal
         */
        public int getaVal() {
            return aVal;
        }

        /**
         * @param aVal nuovo aVal
         */
        public void setaVal(int aVal) {
            this.aVal = aVal;
        }

        /**
         * @return utente
         */
        public MyUtente getUtente() {
            return utente;
        }

        /**
         * @param utente nuovo utente
         */
        public void setUtente(MyUtente utente) {
            this.utente = utente;
        }

        /**
         * @see java.lang.Object#hashCode()
         */
        @Override
        public int hashCode() {
            final int prime = 31;
            int result = 1;
            result = prime * result + aVal;
            result = prime * result
                    + ((utente == null) ? 0 : utente.hashCode());
            return result;
        }

        /**
         * @see java.lang.Object#equals(java.lang.Object)
         */
        @Override
        public boolean equals(Object obj) {
            if (this == obj)
                return true;
            if (obj == null)
                return false;
            if (getClass() != obj.getClass())
                return false;
            MyWeakEntity other = (MyWeakEntity) obj;
            if (aVal != other.aVal)
                return false;
            if (utente == null) {
                if (other.utente != null)
                    return false;
            } else if (!utente.equals(other.utente))
                return false;
            return true;
        }
    }

    private static class DBMyWeakEntity extends DBBeans<MyWeakEntity> {
        /**
         * @param nomeTabella
         * @param database
         */
        public DBMyWeakEntity(Database database) {
            super("WeakEntity", database);
        }

        private static Map<String, String> MAPPING = null;
        private static List<String> KEY = null;
        
        /**
         * @see atsilo.storage.DBBeans#getMappingFields()
         */
        @Override
        protected Map<String, String> getMappingFields() {
            if (MAPPING == null) {
                Map<String, String> mapping = new HashMap<String, String>();
                mapping.put("aVal", "a_val");
                mapping.put("-utente", "utente");
                MAPPING = Collections.unmodifiableMap(mapping);
            }
            return MAPPING;
        }

        /**
         * @see atsilo.storage.DBBeans#getKeyFields()
         */
        @Override
        protected List<String> getKeyFields() {
            if (KEY == null) {
                KEY = Arrays.asList("-utente");
            }
            return KEY;
        }

        /**
         * @see atsilo.storage.DBBeans#creaBean(java.sql.ResultSet)
         */
        @Override
        protected MyWeakEntity creaBean(ResultSet r) throws SQLException {
            MyWeakEntity we = new MyWeakEntity();
            we.setaVal(r.getInt("a_val"));
            we.setUtente(new MyUtente());
            we.getUtente().setCf(r.getString("utente"));
            return we;
        }
        
        /**
         * @see atsilo.storage.DBBeans#creaAssegnazioni(java.lang.Object)
         */
        @Override
        protected atsilo.storage.DBBeans.Assegnazione[] creaAssegnazioni(
                MyWeakEntity bean) {
            return Assegnazione.catena("utente", bean.getUtente().getCf());
        }
    }

    public static class AutoIncrementingEntity {
        private int id;
        private String bestemmie;
        
        /**
         * @param id
         * @param bestemmie
         */
        AutoIncrementingEntity(int id, String bestemmie) {
            super();
            this.id = id;
            this.bestemmie = bestemmie;
        }
        
        /**
         * @param id
         * @param bestemmie
         */
        public AutoIncrementingEntity(String bestemmie) {
            this(0, bestemmie);
        }
        
        /**
         * @return id
         */
        public int getId() {
            return id;
        }
        /**
         * @param id nuovo id
         */
        public void setId(int id) {
            this.id = id;
        }
        /**
         * @return bestemmie
         */
        public String getBestemmie() {
            return bestemmie;
        }
        /**
         * @param bestemmie nuovo bestemmie
         */
        public void setBestemmie(String bestemmie) {
            this.bestemmie = bestemmie;
        }
        /**
         * @see java.lang.Object#hashCode()
         */
        @Override
        public int hashCode() {
            final int prime = 31;
            int result = 1;
            result = prime * result
                    + ((bestemmie == null) ? 0 : bestemmie.hashCode());
            result = prime * result + id;
            return result;
        }
        /**
         * @see java.lang.Object#equals(java.lang.Object)
         */
        @Override
        public boolean equals(Object obj) {
            if (this == obj)
                return true;
            if (obj == null)
                return false;
            if (getClass() != obj.getClass())
                return false;
            AutoIncrementingEntity other = (AutoIncrementingEntity) obj;
            if (bestemmie == null) {
                if (other.bestemmie != null)
                    return false;
            } else if (!bestemmie.equals(other.bestemmie))
                return false;
            if (id != other.id)
                return false;
            return true;
        }
        /**
         * @see java.lang.Object#toString()
         */
        @Override
        public String toString() {
            return "AutoIncrementingEntity [id=" + id + ", bestemmie="
                    + bestemmie + "]";
        }
    }

    private static class DBAutoIncrementingEntity extends DBBeans<AutoIncrementingEntity>{
        private static Map<String, String> MAPPING = null;
        private static List<String> KEY = null;
        
        /**
         * @param nomeTabella
         * @param database
         */
        public DBAutoIncrementingEntity(Database database) {
            super("AutoIncrementing", database);
        }

        private static Map<String, String> creaMapping() {
            if (MAPPING == null) {
                Map<String, String> t = new HashMap<String, String>();
                t.put("id", "id");
                t.put("bestemmie", "bestemmie");
                MAPPING = Collections.unmodifiableMap(t);
            }
            return MAPPING;
        }
        
        private static List<String> creaChiave() {
            if (KEY == null) {
                List<String> l = Arrays.asList("id");
                KEY = Collections.unmodifiableList(l);
            }
            return KEY;
        }
        
        /**
         * @see atsilo.storage.DBBeans#getMappingFields()
         */
        @Override
        protected Map<String, String> getMappingFields() {
            return creaMapping();
        }

        /**
         * @see atsilo.storage.DBBeans#getKeyFields()
         */
        @Override
        protected List<String> getKeyFields() {
            return creaChiave();
        }

        /**
         * @see atsilo.storage.DBBeans#creaBean(java.sql.ResultSet)
         */
        @Override
        protected AutoIncrementingEntity creaBean(ResultSet r)
                throws SQLException {
            return new AutoIncrementingEntity(r.getInt("id"), r.getString("bestemmie"));
        }
        
    }
}
