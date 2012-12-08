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
import atsilo.storage.DBAccount;
import atsilo.storage.DBEducatoreDidattico;
import atsilo.storage.DBGenitore;
import atsilo.storage.DBPersonaleAsilo;
import atsilo.storage.DBPsicopedagogo;
import atsilo.storage.DBResponsabileQuestionario;
import atsilo.storage.DBTirocinante;
import atsilo.storage.Database;
import atsilo.stub.storage.*;



/**
 * 
 * @author Marko,Fabio Napoli
 */
public class ControlLogin {
    private static ControlLogin control = new ControlLogin();
    private DBAccount dbAccount;
    private DBGenitore dbGenitore;
    private DBPersonaleAsilo dbPersonaleAsilo;
    private DBPsicopedagogo dbPsicopedagogo;
    private DBResponsabileQuestionario dbResponsabileQuestionario;
    private DBEducatoreDidattico dbEducatoreDidattico;
    private DBTirocinante dbTirocinante;
    
    
    private ControlLogin(){
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
    public Account getValoreLogin(String username, String password, String tipo)
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
            dbGenitore = new DBGenitore(db);
            dbPersonaleAsilo = new DBPersonaleAsilo(db);
            dbPsicopedagogo = new DBPsicopedagogo(db);
            dbResponsabileQuestionario = new DBResponsabileQuestionario(db);
            dbEducatoreDidattico = new DBEducatoreDidattico(db);
            dbTirocinante = new DBTirocinante(db);
            
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
                            if ((dbGenitore.getGenitorePerCF(account
                                    .getOwner().getCodiceFiscale())) != null)
                                return account;
                            else
                                throw new LoginException(
                                        "Username o Password o Tipologia Errata");
                        else if (tipo.compareTo("personale_asilo") == 0)
                            if ((dbPersonaleAsilo
                                    .getPersonaleAsiloPerCF(account
                                            .getOwner().getCodiceFiscale())) != null)
                                return account;
                            else
                                throw new LoginException(
                                        "Username o Password o Tipologia Errata");
                        else if (tipo.compareTo("psicopedagogo") == 0)
                            if ((dbPsicopedagogo.getPsicopedagogoPerCF(account
                                    .getOwner().getCodiceFiscale())) != null)
                                return account;
                            else
                                throw new LoginException(
                                        "Username o Password o Tipologia Errata");
                        else if (tipo.compareTo("resposabile_questionario") == 0)
                            if ((dbResponsabileQuestionario
                                    .getResponsabileQuestionarioPerCF(account
                                            .getOwner().getCodiceFiscale())) != null)
                                return account;
                            else
                                throw new LoginException(
                                        "Username o Password o Tipologia Errata");
                        else if (tipo.compareTo("educatore_didattico") == 0)
                            if ((dbEducatoreDidattico
                                    .getEducatoreDidatticoPerCF(account
                                            .getOwner().getCodiceFiscale())) != null)
                                return account;
                            else
                                throw new LoginException(
                                        "Username o Password o Tipologia Errata");
                        else if (tipo.compareTo("tirocinante") == 0)
                            if ((dbTirocinante.getTirocinantePerCF(account
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
