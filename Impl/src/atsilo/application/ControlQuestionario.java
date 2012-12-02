package atsilo.application;

import java.sql.Date;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import test.storage.StubCampoDomandaQuestionario;
import test.storage.StubDomandaQuestionario;
import test.storage.StubQuestionario;
import test.storage.StubRispostaQuestionario;
import atsilo.entity.CampoDomandaQuestionario;
import atsilo.entity.CompilaQuestionario;
import atsilo.entity.DomandaQuestionario;
import atsilo.entity.Genitore;
import atsilo.entity.Questionario;
import atsilo.entity.RispostaQuestionario;
import atsilo.exception.DBConnectionException;
import atsilo.exception.QuestionarioException;
import atsilo.storage.DBCampoDomandaQuestionario;
import atsilo.storage.DBCompilaQuestionario;
import atsilo.storage.DBDomandaQuestionario;
import atsilo.storage.DBGenitore;
import atsilo.storage.DBQuestionario;
import atsilo.storage.DBRispostaQuestionario;
import atsilo.storage.Database;

/**
 * Class that control and manages a questionnaire
 *
 * @author Antonio Cesarano
 */
public class ControlQuestionario {

    private static final ControlQuestionario INSTANCE = new ControlQuestionario();   
    
    
    /**
     * Contructor
     */
    private ControlQuestionario() {}
    
    
    /**
     * Adds a new questionnaire in the database
     * @param questionario is the questionnaire to add
     * @return true if the questionnaire was added correctly, else false
     */
    public void inserisciQuestionario(Questionario questionario) throws DBConnectionException, QuestionarioException {
       
        Database db = new Database();
        DBQuestionario storage = new DBQuestionario(db);

        
        if(!db.apriConnessione())
            throw new DBConnectionException("Connessione al DB fallita");
        try{
            
            if(!storage.inserisci(questionario))
                throw new QuestionarioException("Inserimento fallito");
        }
        finally{
            db.chiudiConnessione();
        }
    }
    
    
    
    
    
    
    
    /**
     * Deletes a quiestionnaire from the database
     * @param id is the quiestionnaire identificative
     * @return the questionnaire deleted
     */
    public void eliminaQuestionario(int id) throws DBConnectionException, QuestionarioException {

        Database db = new Database();
        DBQuestionario storage = new DBQuestionario(db);
        Questionario toReturn;
        
        if(!db.apriConnessione())
            throw new DBConnectionException("Connessione al DB fallita");
        try{
            
            if(!storage.delete(storage.getQuestionario(id)) );
                throw new QuestionarioException("Questionario inesistente");
        } catch (SQLException e) {
            throw new QuestionarioException("Impossibile eliminare il questionario. OPS this is embarrassing XD");
        }
        finally{
            db.chiudiConnessione();
        }
    }
    
    
    /**
     * Substitutes the questionnaire questions list with a new quiestions list
     * @param idQquestionario is the quiestionnaire identificative
     * @param domande is the new quistions list to add
     * @return true if the list was substituted correctly, else false
     */
    public void modificaQuestionario(int idQuestionario, Questionario newQuestionario) throws DBConnectionException,
                                                                               QuestionarioException {
        Database db = new Database();
        DBQuestionario storage = new DBQuestionario(db);
        
        if(!db.apriConnessione())
            throw new DBConnectionException("Connessione al DB fallita");
        try{
            try {
                if(!storage.replace(storage.getQuestionario(idQuestionario), newQuestionario))
                    throw new QuestionarioException("Inserimento domande nel questionario fallito");
            } catch (SQLException e) {
                new QuestionarioException("Impossibile scrivere nel Database");
            }
        }
        finally{
            db.chiudiConnessione();
        }
    }
    
    
    /**
     * Changes the questionnaire start date
     * @param newData is the new start date
     * @return true if the date was set correctly, else false
     */
    public void spostaDataInizio(int idQuestionario, Date newData) throws DBConnectionException,
                                                                               QuestionarioException {
        Database db = new Database();
        DBQuestionario storage = new DBQuestionario(db);

        if(!db.apriConnessione())
            throw new DBConnectionException("Connessione al DB fallita");
        try{
            
                Questionario q = storage.getQuestionario(idQuestionario);
                q.setPeriodo_inizio(newData);
                //sostituisco il questionario con la nuova data
                if(!storage.replace(storage.getQuestionario(idQuestionario), q))
                    throw new QuestionarioException("Operazione fallita");
         }
        catch (SQLException e) {
                throw new QuestionarioException("Impossibile modificare la data di inizio del questionario");   
        } 
        finally{
            db.chiudiConnessione();
        }
    }
    
    
    /**
     * Changes the questionnaire end date
     * @param newData is the new end date
     * @return true if the date was set correctly, else false
     */
    public void spostaDataFine(int idQuestionario, Date newData) throws DBConnectionException,
                                                                           QuestionarioException {
        Database db = new Database();
        DBQuestionario storage = new DBQuestionario(db);

        
        if(!db.apriConnessione())
            throw new DBConnectionException("Connessione al DB fallita");
        try{
            
            Questionario q = storage.getQuestionario(idQuestionario);
            q.setPeriodo_fine(newData);
            //sostituisco il questionario con la nuova data
            if(!storage.replace(storage.getQuestionario(idQuestionario), q))
                throw new QuestionarioException("Operazione fallita");
     }
    catch (SQLException e) {
            throw new QuestionarioException("Impossibile modificare la data di fine del questionario");   
    } 
        finally{
            db.chiudiConnessione();
        }
    }
    
    
    
    
    
    /**
     * Search a questionnaire by name
     * @param nome is the questionnaire name
     * @return a questionnaire
     */
    public List<Questionario> ricercaQuestionario(String nome) throws DBConnectionException, QuestionarioException {
        Database db = new Database();
        DBQuestionario storage = new DBQuestionario(db);

        List<Questionario> toReturn;
        
        if(!db.apriConnessione())
            throw new DBConnectionException("Connessione al DB fallita");
        try{
            toReturn = storage.ricercaQuestionariPerNome(nome);
            if(toReturn== null || toReturn.isEmpty())
                throw new QuestionarioException("Nessun questionario con nome"+nome);
            return toReturn;
        } 
        catch (SQLException e) {
            throw new DBConnectionException("Ricerca fallita");
        } 
        finally{
            db.chiudiConnessione();
        }
    }
    
    
    

    
    /**
     * Insert a answers list in a questionnaire. Every answer correspond to its question.
     * @param questionario is the questionnaire compiled
     * @param risposte is a answers list
     * @return true if the list was added correctly, else false
     * @throws DBConnectionException 
     * @throws QuestionarioException 
     */
    public void compilaQuestionario(int idQuestionario, List<RispostaQuestionario> risposte, Genitore chiCompila) throws DBConnectionException, QuestionarioException{
        Database db = new Database();    
        DBQuestionario storage = new DBQuestionario(db);
        DBRispostaQuestionario storageRisposte = new DBRispostaQuestionario(db);
        DBGenitore storageGenitore = new DBGenitore(db);
        DBCompilaQuestionario storageCompila = new DBCompilaQuestionario(db);
       
        
        if(!db.apriConnessione())
            throw new DBConnectionException("Connessione al DB fallita");
        try{
            if(risposte.isEmpty())
                throw new QuestionarioException("risposte non valide");
            
       
            try {
                    Questionario questionario = storage.getQuestionario(idQuestionario);
                    questionario.compila(risposte, chiCompila);
                    storage.inserisci(questionario);   
                    //aggiungere questionario a genitore
                    //aggiungere genitore a questionario
                    chiCompila.aggiungiQuestionarioCompilato(questionario);
                    
                    
                    //
                    //inserisce il questionario compilato nel database
                    //
                    CompilaQuestionario c = new CompilaQuestionario(idQuestionario, chiCompila.getCodiceFiscale());
                    storageCompila.inserisci(c);

            } catch (SQLException e) {
                
            }
            
            
        }
        finally{
            db.chiudiConnessione();
        }
    }
    
    
    /**
     * Gets all the questionnaires not yet compiled by a 
     * parent from all questionnaires compilable
     * @param genitore is the parent
     * @return a questionnaires list
     * @throws QuestionarioException 
     */
    public List<Questionario> getQuestionariDaCompilare(Genitore genitore) throws DBConnectionException, QuestionarioException {
        Database db = new Database();
        DBQuestionario storage = new DBQuestionario(db);
        
        List<Questionario> toReturn = new ArrayList<Questionario>();
        
        if(!db.apriConnessione())
            throw new DBConnectionException("Connessione al DB fallita");
        try{
            
            toReturn = storage.visualizzaQuestionariCompilabili();
            for(Questionario q: toReturn)
                if(!q.isCompilatoDa(genitore))
                    toReturn.remove(q);
            
            return toReturn;
        } 
        catch (SQLException e){
            throw new QuestionarioException("Errore caricamento questionari");
        }
        finally{
            db.chiudiConnessione();
        }
    }
    

    
    /**
     * This method has to be called when you want a full questionnaire
     * @param genitore is who has to fill the questionnaire
     * @param genitore is the parent for whom the method loads the questionnaires
     * @return a full questionnaire with all questions and all question fields
     * @throws DBConnectionException
     * @throws SQLException 
     */
    public Questionario caricaQuestionarioDaCompilare(int idQuestionario, Genitore genitore) throws DBConnectionException, SQLException{
        Database db = new Database();
        DBQuestionario storage = new DBQuestionario(db);
        DBDomandaQuestionario storageDomande= new DBDomandaQuestionario(db);
        DBCampoDomandaQuestionario storageCampi = new DBCampoDomandaQuestionario(db);
                
        if(!db.apriConnessione())
            throw new DBConnectionException("Connessione al DB fallita");
        try{
            Questionario toReturn = storage.getQuestionario(idQuestionario);
            //setto le domande del questionario
            List<DomandaQuestionario> domande = storageDomande.getDomandeQuestionario(idQuestionario);
            toReturn.setDomande(domande);
            
            //setto i campi per ogni domanda
            for(DomandaQuestionario d : domande){
                List<CampoDomandaQuestionario> campi = storageCampi.getCampiDomandaQuestionario(d.getId());
                d.setCampi(campi);
            }
            //dovrei ancora caricare le risposte delle domande
            return toReturn;
            
        }
        finally{
            db.chiudiConnessione();
        }
    }
    
    
    
    /**
     * Insert a new question in a questionnaire
     * @param idQuestionario is the questionnaire identifier
     * @param domanda is the question to add in the questionnaire
     * @throws DBConnectionException
     * @throws QuestionarioException
     */
    public void inserisciDomanda(int idQuestionario, DomandaQuestionario domanda) throws DBConnectionException, QuestionarioException{
        Database db = new Database();
        DBDomandaQuestionario storageDomanda = new DBDomandaQuestionario(db);

        
        if(!db.apriConnessione())
            throw new DBConnectionException("Connessione al DB fallita");
        try{
            if(!storageDomanda.inserisci(domanda))
                throw new QuestionarioException("Errore inserimento domanda in questionario");
        } 
        finally{
            db.chiudiConnessione();
        }
    }
    
    
    
    
    
    /**
     * Delete a question from a questionnaire
     * @param idDomanda is the question identifier
     * @throws DBConnectionException
     * @throws QuestionarioException
     */
    public void eliminaDomanda(String idDomanda) throws DBConnectionException, QuestionarioException{
        Database db = new Database();
        DBDomandaQuestionario storageDomanda = new DBDomandaQuestionario(db);

        
        if(!db.apriConnessione())
            throw new DBConnectionException("Connessione al DB fallita");
        try{
            try {
                storageDomanda.delete(storageDomanda.getDomanda(idDomanda));
            } catch (SQLException e) {
                throw new QuestionarioException("Impossibile rimuovere la domanda");
            }
        } 
        finally{
            db.chiudiConnessione();
        }
    
    }
    
    
    
    
    /**
     * Replace an old question with a new one
     * @param idVecchiaDomanda is the old question identifier
     * @param newDomanda is the new question 
     * @throws DBConnectionException
     * @throws QuestionarioException
     */
    public void modificaDomanda(String idVecchiaDomanda, DomandaQuestionario newDomanda) throws DBConnectionException, QuestionarioException{
        Database db = new Database();
        DBDomandaQuestionario storageDomanda = new DBDomandaQuestionario(db);

        
        if(!db.apriConnessione())
            throw new DBConnectionException("Connessione al DB fallita");
        try{
            try {
                if(!idVecchiaDomanda.equalsIgnoreCase(newDomanda.getId()) )
                    throw new SQLException();
                storageDomanda.replace(storageDomanda.getDomanda(idVecchiaDomanda), newDomanda);
                
            } catch (SQLException e) {
                throw new QuestionarioException("Impossibile rimuovere la domanda");
            }
        } 
        finally{
            db.chiudiConnessione();
        }
    }
   
    
    
    /**
     * Gets the statistics from a questionnaire
     * @param questionario is the questionnaire to analyze
     * @return the questionnaire statistics 
     */
    public List<String> getStatistische(String idQuestionario){
        return null;
    }
    
    
    
    public List<Questionario> getAllQuestionari() throws DBConnectionException{
        Database db = new Database();
        DBQuestionario storage = new DBQuestionario(db);

        Iterable<Questionario> iter;
        List<Questionario> toReturn = new ArrayList<Questionario>();
        
        if(!db.apriConnessione())
            throw new DBConnectionException("Connessione al DB fallita");
        try{
            iter = storage.getAll();
            while(iter.iterator().hasNext())
                toReturn.add(iter.iterator().next());
            return toReturn;
        } 
        finally{
            db.chiudiConnessione();
        }
    }
    
    

    
    /**
     * Gets the single istance of this class
     * @return a new ControlQuestionario
     */
    public ControlQuestionario getIstance(){
        return INSTANCE;
    }
    
}