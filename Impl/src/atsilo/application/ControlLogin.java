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
import atsilo.entity.PersonaleAsilo;
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
    
    
    private ControlLogin() {
    }
    
    /**
     * Classe che prende in input username e password e controlla se �
     * presente nel database in caso positivo restituisce account appartenente
     * in caso negativo lancia un'eccezione
     * 
     * @param username
     * @param password
     * @return
     * @throws DBConnectionException
     * @throws LoginException
     */
    public Account getValoreLogin(String username, String password, String tipo)
            throws LoginException {
        // Come prima cosa, bisogna creare un'istanza di database e aprire una
        // connessione
        Database db = new Database();
        if (!db.apriConnessione()) {
            throw new LoginException("Connessione fallita");
        }
        
        // Quindi, si possono creare tutti i gestori di tabelle necessari
        try {
            DBAccount dbAccount;
            DBGenitore dbGenitore;
            DBPersonaleAsilo dbPersonaleAsilo;
            DBPsicopedagogo dbPsicopedagogo;
            DBResponsabileQuestionario dbResponsabileQuestionario;
            DBEducatoreDidattico dbEducatoreDidattico;
            DBTirocinante dbTirocinante;
            dbAccount = new DBAccount(db);
            dbGenitore = new DBGenitore(db);//
            dbPersonaleAsilo = new DBPersonaleAsilo(db);
            dbPsicopedagogo = new DBPsicopedagogo(db);//
            dbResponsabileQuestionario = new DBResponsabileQuestionario(db);//
            dbEducatoreDidattico = new DBEducatoreDidattico(db);//
            dbTirocinante = new DBTirocinante(db);//
            
            Account account = new Account();
            try {
                account = dbAccount.ricercaPerUsername(username);
                if (account == null) 
                {throw new LoginException("Username o Password o Tipologia Errata");}
                else 
                    if (account.getPassWord().compareTo(password) == 0) 
                    {
                        String codiceFiscale = account.getOwner()
                                .getCodiceFiscale();
                        
                        /*       
                         * 
                         * */
                        if ((tipo.compareTo("genitore") == 0)) 
                        {
                            if((dbGenitore.getGenitorePerCF(codiceFiscale) != null))
                                return account;
                            else throw new LoginException("Username o Password o Tipologia Errata");
                        }
                        else 
                            if ((tipo.compareTo("educatore_didattico") == 0)) 
                            {
                                if ((dbEducatoreDidattico.getEducatoreDidatticoPerCF(codiceFiscale) != null))
                                    return account;
                                else throw new LoginException("Username o Password o Tipologia Errata");
                            }
                            else 
                                if ((tipo.compareTo("tirocinante") == 0)) 
                                {
                                    if ((dbTirocinante.getTirocinantePerCF(codiceFiscale) != null))
                                        return account;
                                    else throw new LoginException("Username o Password o Tipologia Errata");
                                    
                                }
                                else 
                                    if ((tipo.compareTo("responsabile_questionario") == 0)) 
                                    {
                                        if ((dbResponsabileQuestionario.getResponsabileQuestionarioPerCF(codiceFiscale) != null))
                                            return account;
                                        else throw new LoginException("Username o Password o Tipologia Errata");
                                    } 
                                    else 
                                        if ((tipo.compareTo("psicopedagogo") == 0)) 
                                        {
                                            if ((dbPsicopedagogo.getPsicopedagogoPerCF(codiceFiscale) != null))
                                                return account;
                                            else throw new LoginException("Username o Password o Tipologia Errata");
                                            
                                        }
                                        else { PersonaleAsilo utente = dbPersonaleAsilo.getPersonaleAsiloPerCF(codiceFiscale);
                                            
                                                if ((utente == null)) {throw new LoginException("Username o Password o Tipologia Errata");} 
                                                else if (tipo.compareTo(utente.getCategoriaAppartenenza()) == 0)
                                                    return account;
                                                    else throw new LoginException("Username o Password o Tipologia Errata");
                                            }                   
                    } else throw new LoginException("Username o Password o Tipologia Errata");
                
            } catch (SQLException e) {throw new LoginException("Connessione fallita");}
        } finally {db.chiudiConnessione();}
    }
    
    /**
     * @param account
     * @return
     */
    
    
    public static ControlLogin getInstance() {
        
        return control;
    }
}
