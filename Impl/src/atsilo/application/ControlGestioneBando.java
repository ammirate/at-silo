/**
 *-----------------------------------------------------------------
 * This file is licensed under GPL 3.0:
 * http://www.gnu.org/licenses/gpl-3.0.html
 *-----------------------------------------------------------------
 * FILE: ControlGestioneBando.java
 *-----------------------------------------------------------------
 * PROGETTO: Atsilo
 *-----------------------------------------------------------------
 * OWNER
 * Bottiglieri Gianfranco, 25/11/2012 
 * REVISION
 * nome revisore, data revisione
 *-----------------------------------------------------------------
 **/
package atsilo.application;

import atsilo.entity.Bambino;
import atsilo.entity.Bando;
import atsilo.entity.DomandaIscrizione;
import atsilo.entity.Genitore;
import atsilo.exception.BandoException;
import atsilo.exception.DBConnectionException;
import atsilo.storage.DBBambino;
import atsilo.storage.DBGenitore;
import atsilo.storage.Database;
import atsilo.storage.DBBando;
import atsilo.storage.DBDomandaIscrizione;
import atsilo.util.AtsiloConstants;

import java.sql.Date;
import java.sql.SQLException;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;


/*
 *-----------------------------------------------------------------
 * This file is licensed under GPL 3.0:
 * http://www.gnu.org/licenses/gpl-3.0.html
 *-----------------------------------------------------------------
 * FILE: ControlGestioneBando.java
 *-----------------------------------------------------------------
 * PROGETTO: Atsilo
 *-----------------------------------------------------------------
 * OWNER
 * Gianfranco Bottiglieri, 27/11/2012
 *-----------------------------------------------------------------
 */

public class ControlGestioneBando {
    private static final ControlGestioneBando INSTANCE = new ControlGestioneBando();
    private static final Logger LOG = Logger.getLogger("global");
    
    private ControlGestioneBando() {
    }
    
    public boolean bandoAperto() throws SQLException
    {
        Database db= new Database();
        DBBando dbb = new DBBando(db);
        db.apriConnessione();
        Bando b = dbb.getBando();
        String inizio = b.getDataInizioBando();
        String fine = b.getDataFineBando();
        String[] ggmmaa_inizio = inizio.split("-");
        String[] ggmmaa_fine = fine.split("-");
        Date data_inizio = new Date(Integer.parseInt(ggmmaa_inizio[0])-1900,
                Integer.parseInt(ggmmaa_inizio[1])-1,
                Integer.parseInt( ggmmaa_inizio[2]));
        Date data_fine = new Date(Integer.parseInt(ggmmaa_fine[0])-1900,Integer.parseInt(ggmmaa_fine[1])-1,Integer.parseInt(ggmmaa_fine[2]));
        Date now = new Date(System.currentTimeMillis());
        
        return (now.before(data_fine) && now.after(data_inizio));
    }
    
    /**
     * Restituisce una domanda dato un suo id con tutti i bean contenuti settati.
     * @param id L'id della domanda da ricercare.
     * @return
     */
    public DomandaIscrizione getDomandaIscrizioneById(int id)
    {
        Database db = new Database();
        DBDomandaIscrizione dbdi = new DBDomandaIscrizione(db);
        DBGenitore dbg = new DBGenitore(db);
        DBBambino dbb = new DBBambino(db);
        db.apriConnessione();
        
        try {
            DomandaIscrizione di = dbdi.ricercaDomandaDaId(id);
            
            //Riempio i bean semivuoti (hanno solo i CF)
            Bambino b = di.getBambino();
            di.setBambino(dbb.ricercaBambinoPerCodFiscale(b.getCodiceFiscale()));
            
            Genitore gr = di.getGenitore();
            di.setGenitore(dbg.getGenitorePerCF(gr.getCodiceFiscale()));
            
            
            return di;
        } catch (SQLException e) {
            // TODO Blocco di catch autogenerato
            LOG.log(Level.SEVERE, "Impossibile ricercare domande. Causato da: "+e.getMessage(), e);
        }
        finally {
            db.chiudiConnessione();
        }
        return null;
    }
    
    /**
     * Classe DomandaEtaComparator
     * Comparator per ordinare domande di iscrizione per età.
     * 
     * @author Alfonso
     *
     */
    private class DomandaEtaComparator implements Comparator<DomandaIscrizione>
    {
        
        /**
         * @see java.util.Comparator#compare(java.lang.Object, java.lang.Object)
         */
        @Override
        public int compare(DomandaIscrizione o1, DomandaIscrizione o2) {
            // TODO Scheletro generato automaticamente
            Date d0 = o1.getBambino().getDataNascita();
            Date d1 = o2.getBambino().getDataNascita();
            
            if(d0.before(d1))
            {
                return -1;
            }
            else if(d0.compareTo(d1)==0)
            {
                return 0;
            }
            else
            {
                return 1;
            }
        }
        
    }
    
    /**
     * Restituisce la graduatoria degliidonei dell'ultimo bando.
     * @return la lista se il bando è concluso e se non c'è alcuna domanda senza punteggio, altrimenti null.
     */
    public List<DomandaIscrizione> getGraduatoriaIdonei()
    {
        Database db = new Database();
        DBDomandaIscrizione dbdi = new DBDomandaIscrizione(db);
        DBGenitore dbg = new DBGenitore(db);
        DBBambino dbb = new DBBambino(db);
        DBBando dbbando = new DBBando(db);
        db.apriConnessione();
        
        try {
            Bando bando = dbbando.getBando();
            List<DomandaIscrizione> daAssegnare = dbdi.ricercaDomandeNonEscluseSenzaPunteggio();
            if(!daAssegnare.isEmpty())
            {
                //Non mostriamo le graduatorie.. dobbiamo ancora terminare di assegnare i punteggi a tutte
                //le domande
                return null;
            }
            String inizio = bando.getDataInizioBando();
            int posti = bando.getPostiDisponibili();
            Date now = new Date(System.currentTimeMillis());
            int numero_posti = bando.getPostiDisponibili();
            String fine = bando.getDataFineBando();
            String[] ggmmaa_fine = fine.split("-");
            Date data_fine = new Date(Integer.parseInt(ggmmaa_fine[0])-1900,Integer.parseInt(ggmmaa_fine[1])-1,Integer.parseInt(ggmmaa_fine[2]));
            if(now.after(data_fine))
            {
                List<DomandaIscrizione> ldi = dbdi.ricercaDomandeConPunteggioInIntervalloDiConsegna(inizio, fine);
                for(DomandaIscrizione dom : ldi)
                {
                    //Riempio i bean semivuoti (hanno solo i CF)
                    Bambino b = dom.getBambino();
                    dom.setBambino(dbb.ricercaBambinoPerCodFiscale(b.getCodiceFiscale()));
                    
                    Genitore gr = dom.getGenitore();
                    dom.setGenitore(dbg.getGenitorePerCF(gr.getCodiceFiscale()));
                }
                
                return ldi.subList(0, Math.min(posti, ldi.size()));
            }
            else
            {
                return null;
            }
        } catch (SQLException e) {
            // TODO Blocco di catch autogenerato
            LOG.log(Level.SEVERE, "Impossibile ricercare domande. Causato da: "+e.getMessage(), e);
        }
        finally {
            db.chiudiConnessione();
        }
        return null;
    }
    
    /**
     * Restituisce la graduatoria degli esclusi dell'ultimo bando.
     * @return la lista se il bando è concluso e se non c'è alcuna domanda senza punteggio, altrimenti null.
     */
    public List<DomandaIscrizione> getGraduatoriaEsclusi()
    {
        Database db = new Database();
        DBDomandaIscrizione dbdi = new DBDomandaIscrizione(db);
        DBGenitore dbg = new DBGenitore(db);
        DBBambino dbb = new DBBambino(db);
        DBBando dbbando = new DBBando(db);
        db.apriConnessione();
        
        try {
            List<DomandaIscrizione> daAssegnare = dbdi.ricercaDomandeNonEscluseSenzaPunteggio();
            if(!daAssegnare.isEmpty())
            {
                //Non mostriamo le graduatorie.. dobbiamo ancora terminare di assegnare i punteggi a tutte
                //le domande
                return null;
            }
            Bando bando = dbbando.getBando();
            String inizio = bando.getDataInizioBando();
            int posti = bando.getPostiDisponibili();
            Date now = new Date(System.currentTimeMillis());
            String fine = bando.getDataFineBando();
            String[] ggmmaa_fine = fine.split("-");
            Date data_fine = new Date(Integer.parseInt(ggmmaa_fine[0])-1900,Integer.parseInt(ggmmaa_fine[1])-1,Integer.parseInt(ggmmaa_fine[2]));
            if(now.after(data_fine))
            {
                
                List<DomandaIscrizione> buoniMaFuori = dbdi.ricercaDomandeConPunteggioInIntervalloDiConsegna(inizio, fine);
                for(DomandaIscrizione dom : buoniMaFuori)
                {
                    //Riempio i bean semivuoti (hanno solo i CF)
                    Bambino b = dom.getBambino();
                    dom.setBambino(dbb.ricercaBambinoPerCodFiscale(b.getCodiceFiscale()));
                    
                    Genitore gr = dom.getGenitore();
                    dom.setGenitore(dbg.getGenitorePerCF(gr.getCodiceFiscale()));
                }
                //Prendo gli ultimi [posti] candidati che sono fuori dagli ammessi ma che hanno punteggio
                if(buoniMaFuori.size()<=posti)
                {
                    //i buoni sono meno o tanti quanti i posti disponibili, nessuno è fuori
                    buoniMaFuori.clear();
                }
                else
                {
                    //gli aventi punteggio sono più dei posti. 
                    buoniMaFuori=buoniMaFuori.subList(posti, buoniMaFuori.size());
                }
                List<DomandaIscrizione> ldi = dbdi.ricercaDomandeEscluseInIntervalloDiConsegna(inizio, fine);
                for(DomandaIscrizione dom : ldi)
                {
                    //Riempio i bean semivuoti (hanno solo i CF)
                    Bambino b = dom.getBambino();
                    dom.setBambino(dbb.ricercaBambinoPerCodFiscale(b.getCodiceFiscale()));
                    
                    Genitore gr = dom.getGenitore();
                    dom.setGenitore(dbg.getGenitorePerCF(gr.getCodiceFiscale()));
                }
                //aggiungo gli esclusi agli ammessi che non hanno punteggio sufficiente
                buoniMaFuori.addAll(ldi);
                return buoniMaFuori;
            }
            else
            {
                return null;
            }
        } catch (SQLException e) {
            // TODO Blocco di catch autogenerato
            LOG.log(Level.SEVERE, "Impossibile ricercare domande. Causato da: "+e.getMessage(), e);
        }
        finally {
            db.chiudiConnessione();
        }
        return null;
    }
    
    /**
     * Ricerca tutte le domande in attesa di assegnazione punteggio.
     * @return
     */
    public List<DomandaIscrizione> getDomandeInAttesaDiPunteggio()
    {
        Database db = new Database();
        DBDomandaIscrizione dbdi = new DBDomandaIscrizione(db);
        DBGenitore dbg = new DBGenitore(db);
        DBBambino dbb = new DBBambino(db);
        db.apriConnessione();
        
        try {
            List<DomandaIscrizione> ldi = dbdi.ricercaDomandeNonEscluseSenzaPunteggio();
            DomandaEtaComparator comp = new DomandaEtaComparator();
            //Riordina per età dei bambini
            Collections.sort(ldi, comp);
            for(DomandaIscrizione dom : ldi)
            {
                //Riempio i bean semivuoti (hanno solo i CF)
                Bambino b = dom.getBambino();
                dom.setBambino(dbb.ricercaBambinoPerCodFiscale(b.getCodiceFiscale()));
                
                Genitore gr = dom.getGenitore();
                dom.setGenitore(dbg.getGenitorePerCF(gr.getCodiceFiscale()));
            }
            
            return ldi;
        } catch (SQLException e) {
            // TODO Blocco di catch autogenerato
            LOG.log(Level.SEVERE, "Impossibile ricercare domande. Causato da: "+e.getMessage(), e);
        }
        finally {
            db.chiudiConnessione();
        }
        return null;
    }
    /**
     * 
     * inserisce il punteggio nella domanda passata in input
     * 
     * @param iscrizione
     *            la domanda di iscrizione non può essere null
     * @param punteggio
     *            punteggio deve essere negativo
     * @return
     * @throws DBConnectionException
     * @throws BandoException
     * @throws SQLException
     */
    public boolean inserisciPunteggio(DomandaIscrizione iscrizione,
            int punteggio) throws BandoException
            {
        Database db = new Database();
        if (!db.apriConnessione()) {
            throw new BandoException("Connessione Fallita");
        }
        try {
            
            DBDomandaIscrizione dbDomandaIscrizione = new DBDomandaIscrizione(db);
            DomandaIscrizione domandaDaModificare;
            
            try {
                domandaDaModificare = dbDomandaIscrizione.ricercaDomandaDaId(iscrizione.getId());
                domandaDaModificare.setPunteggio(punteggio);
                domandaDaModificare.setStato_convalidazione(AtsiloConstants.STATO_DOMANDA_SECONDO_STEP);
                dbDomandaIscrizione.replace(iscrizione, domandaDaModificare);
            } catch (SQLException e) 
            {
                throw new BandoException("Connessione Fallita");
            }
            return true;
        } finally {
            db.chiudiConnessione();
        }
            }
    
    /**
     * Metodo che esclude una domanda dalla graduatoria.
     * Setta il punteggio a -1 e lo stato della domanda a rifiutata.
     * @param iscrizione L'iscrizione da modificare.
     * @param notaEsclusione Stringa contenente il motivo dell'esclusione
     * @return
     * @throws BandoException
     */
    public boolean escludiDomanda(DomandaIscrizione iscrizione,String notaEsclusione) throws BandoException
    {
        Database db = new Database();
        if (!db.apriConnessione()) {
            throw new BandoException("Connessione Fallita");
        }
        try {
            
            DBDomandaIscrizione dbDomandaIscrizione = new DBDomandaIscrizione(db);
            DomandaIscrizione domandaDaModificare;
            
            try {
                domandaDaModificare = dbDomandaIscrizione.ricercaDomandaDaId(iscrizione.getId());
                domandaDaModificare.setStato_convalidazione(AtsiloConstants.STATO_DOMANDA_RIFIUTATA);
                domandaDaModificare.setNotaEsclusione(notaEsclusione);
                domandaDaModificare.setPunteggio(-1);
                dbDomandaIscrizione.replace(iscrizione, domandaDaModificare);
            } catch (SQLException e) 
            {
                throw new BandoException("Connessione Fallita");
            }
            return true;
        } finally {
            db.chiudiConnessione();
        }
    }
    
    public boolean modificaBando(String inizioBando, String fineBando,
            String inizioPresentazione, String finePresentazione,
            String fineRinuncia, int posti) throws BandoException {
        
        Database db = new Database();
        if (!db.apriConnessione()) {
            throw new BandoException("Connessione Fallita");
        }
        try {
            
            DBBando dbBando = new DBBando(db);
            try {
                Bando bandoDaModificare;
                Bando bando=dbBando.getBando();
                
                
                if ( bando== null) {
                    bandoDaModificare = new Bando(1, inizioBando, fineBando,
                            inizioPresentazione, finePresentazione, fineRinuncia,
                            posti, null);
                    dbBando.inserisci(bandoDaModificare);
                    return true;
                } else {
                    bandoDaModificare = new Bando(1, inizioBando, fineBando,
                            inizioPresentazione, finePresentazione, fineRinuncia,
                            posti, null);
                    dbBando.replace(bando, bandoDaModificare);
                    
                    return true;
                }
            } catch (SQLException e) {
                throw new BandoException("Connessione Fallita");
            }
        } finally {
            db.chiudiConnessione();
        }
    }
    
    public boolean modificaPath(String path) throws BandoException{
        
        Database db = new Database();
        
        if (!db.apriConnessione()) {
            throw new BandoException("Connessione Fallita");
        }
        try {
            DBBando dbBando = new DBBando(db);
            
            try {
                if (dbBando.getBando() == null) {
                    throw new BandoException("Bando non presente impossibile modificare/o inserire il path");
                } else {
                    
                    Bando bando = dbBando.getBando();
                    bando.setPath(path);
                    dbBando.replace(dbBando.getBando(), bando);
                    return true;
                }
            } catch (SQLException e) {
                throw new BandoException("Connessione Fallita");
            }
        } finally {
            db.chiudiConnessione();
        }
    }
    /**
     * 
     * @return
     * @throws DBConnectionException
     */
    public Bando getBando() throws BandoException
    {
        Database db = new Database();
        
        if (!db.apriConnessione()) 
        {
            throw new BandoException("Connessione Fallita");
        }
        try {
            DBBando dbBando = new DBBando(db);
            return dbBando.getBando();   
        } catch (SQLException e) 
        {
            throw new BandoException("Connessione Fallita");
        }
        finally {
            db.chiudiConnessione();
        }
    }
    
    public static ControlGestioneBando getIstance() {
        return INSTANCE;
    }
}
