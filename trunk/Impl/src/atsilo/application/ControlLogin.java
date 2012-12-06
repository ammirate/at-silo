/*
 *-----------------------------------------------------------------
 * This file is licensed under GPL 3.0:
 * http://www.gnu.org/licenses/gpl-3.0.html
 *-----------------------------------------------------------------
 * FILE: ControlLogin.java
 *-----------------------------------------------------------------
 * PROGETTO: Atsilo
 *-----------------------------------------------------------------
 * OWNER
 * Marco Parisi, data 27/11/2012
 * REVISION
 * nome revisore, data revisione
 *-----------------------------------------------------------------
 */

package atsilo.application;

import java.sql.SQLException;

import javax.security.auth.login.LoginException;

import atsilo.entity.Account;
import atsilo.entity.Utente;
import atsilo.exception.DBConnectionException;
import atsilo.storage.*;


/**
 * 
 * @author Marko
 * 
 */
public class ControlLogin {
    private static ControlLogin control;
    private DBAccount dbAccount;
    private DBGenitore dbGenitore;
    private DBPersonaleAsilo dbPersonaleAsilo;
    private DBPsicopedagogo dbPsicopedagogo;
    private DBResponsabileQuestionario dbResponsabileQuestionario;
    private DBEducatoreDidattico dbEducatoreDidattico;
    private DBEventPlanner dbEventPlanner;
    private DBTirocinante dbTirocinante;
    
    
    private ControlLogin() throws DBConnectionException {
        control = new ControlLogin();
        
    }
    
    /**
     * Classe che prende in input username e password e controlla se è presente
     * nel database in caso positivo restituisce account appartenente in caso
     * negativo lancia un'eccezione
     * 
     * @param username
     * @param password
     * @return
     * @throws DBConnectionException
     * @throws LoginException
     */
    Account getValoreLogin(String username, String password, String tipo)
            throws DBConnectionException, LoginException {
        // Come prima cosa, bisogna creare un'istanza di database e aprire una
        // connessione
        Database db = new Database();
        if (!db.apriConnessione()) {
            throw new DBConnectionException("Connessione fallita");
        }
        
        // Quindi, si possono creare tutti i gestori di tabelle necessari
        try {
            dbAccount = new DBAccount(db);
            Account account = new Account();
            try {
                account = dbAccount.ricercaPerUsername(username);
                
                if (account == null) {
                    throw new LoginException(
                            "Username o Password o Tipologia Errata");
                }
                
                else {
                    
                    if (account.getPassWord().compareTo(password) == 0)
                        return account;
                    
                    else {
                        if (tipo.compareTo("genitore") == 0)
                            if ((dbGenitore.ricercaGenitoreCf(account
                                    .getOwner().getCodiceFiscale())) != null)
                                return account;
                            else
                                throw new LoginException(
                                        "Username o Password o Tipologia Errata");
                        else if (tipo.compareTo("personale_esilo") == 0)
                            if ((dbPersonaleAsilo
                                    .ricercaPersonaleAsiloPerCF(account
                                            .getOwner().getCodiceFiscale())) != null)
                                return account;
                            else
                                throw new LoginException(
                                        "Username o Password o Tipologia Errata");
                        else if (tipo.compareTo("psicopedagogo") == 0)
                            if ((dbPsicopedagogo.ricercaPsicopedagogoCf(account
                                    .getOwner().getCodiceFiscale())) != null)
                                return account;
                            else
                                throw new LoginException(
                                        "Username o Password o Tipologia Errata");
                        else if (tipo.compareTo("resposabile_questionario") == 0)
                            if ((dbResponsabileQuestionario
                                    .ricercaResponsabileQuestionarioPerCF(account
                                            .getOwner().getCodiceFiscale())) != null)
                                return account;
                            else
                                throw new LoginException(
                                        "Username o Password o Tipologia Errata");
                        else if (tipo.compareTo("educatore_didattico") == 0)
                            if ((dbEducatoreDidattico
                                    .ricercaEducatoreDidatticoPerCf(account
                                            .getOwner().getCodiceFiscale())) != null)
                                return account;
                            else
                                throw new LoginException(
                                        "Username o Password o Tipologia Errata");
                        else if (tipo.compareTo("event_planner") == 0)
                            if ((dbEventPlanner
                                    .ricercaEventPlannerPerCF(account
                                            .getOwner().getCodiceFiscale())) != null)
                                
                                return account;
                            else
                                throw new LoginException(
                                        "Username o Password o Tipologia Errata");
                        else if (tipo.compareTo("tirocinante") == 0)
                            if ((dbTirocinante.ricercaTirocinantePerCF(account
                                    .getOwner().getCodiceFiscale())) != null)
                                
                                return account;
                            else
                                throw new LoginException(
                                        "Username o Password o Tipologia Errata");
                        else
                            throw new LoginException(
                                    "Username o Password o Tipologia Errata");
                        
                        
                    }
                }
            } catch (SQLException e) {
                
                throw new DBConnectionException("Connessione fallita");
            }
        } finally {
            /*
             * Alla fine dell'interazione, prima di uscire dal metodo, bisogna
             * chiudere la connessione.
             */
            db.chiudiConnessione();
        }
    }
    
    /**
     * @param account
     * @return
     */
    
    
    public static ControlLogin getInstance() {
        
        return control;
    }
}
