package atsilo.application.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import test.storage.TestDBBeans;

import atsilo.entity.Account;
import atsilo.exception.DBConnectionException;
import atsilo.exception.GenitoreException;
import atsilo.test.application.ControlDatiPersonali;

/*
 *-----------------------------------------------------------------
 * This file is licensed under GPL 3.0:
 * http://www.gnu.org/licenses/gpl-3.0.html
 *-----------------------------------------------------------------
 * FILE: ServeletControlTirocinantiInserisci.java
 *-----------------------------------------------------------------
 * PROGETTO: Atsilo
 *-----------------------------------------------------------------
 * OWNER
 * Angelo G. Scafuro, 02/12/2012 (non responsabile)
 *-----------------------------------------------------------------
 */

/**
 * Servlet implementation class RegistrazioneAccount
 */
@WebServlet("/ServletRegistrazioneAccount")
public class ServletRegistrazioneAccount extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ControlDatiPersonali controlDatiPersonali;
    private static final Logger LOG = Logger.getLogger("global");
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletRegistrazioneAccount() {
        
        controlDatiPersonali=controlDatiPersonali.getIstance();
    }
    
    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter pw = response.getWriter();
        pw.println("");
        pw.println("");
        pw.println("");
        pw.println("<h1>Control Login</h1><br>This servlet should not be accessed this way.");
        pw.println("");
    }
    
    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        
        
        //prende in input tutti i parametri utili per la creazione dell'account
        String cf= request.getParameter("cf");
        String cognome_richiedente= request.getParameter("cognome");
        String  nome_richiedente= request.getParameter("nome");
        String email_richidente= request.getParameter("indirizzo_email");
        String tel_richiedente= request.getParameter("numero_cellulare");
        String  tipologia_genitore_richiedente= request.getParameter("tipologia");
        java.sql.Date data_nascita = null;
        
        //creazione account utente ed entità genitore associata
        
        
        
            try {
                if (controlDatiPersonali.createUtente(cf) && controlDatiPersonali.setDatiGenitore(null, nome_richiedente, cognome_richiedente, cf, email_richidente, null, tel_richiedente, null, null, -1, -1, null, null, null, -1, -1, null, null, null, null, null, null, null, null, null, null, null)){
                    
                        //creazione account ed entità andata a buon fine
                        //autologin nel sistema
                        
                        
                        // Set response content type
                        response.setContentType("text/html");
                        // New location to be redirected
                        String login_ok = new String("prototipo/dati_account_genitore.jsp");
                        response.setStatus(response.SC_MOVED_TEMPORARILY);
                        
                        Account newAccount=controlDatiPersonali.getAccount(cf);//account appena creato
                        
                        
                        //Setto le variabili di sessione
                        HttpSession sessione = request.getSession();
                        sessione.setAttribute("username", newAccount.getUserName());
                        String tipologia="genitore";//tipologia utente che accede al sistema,nel caso della registrazione nuovo utente è sempre un genitore
                        sessione.setAttribute("tipologia_utente", tipologia);//setto variabile di sessione che indica la tipologia di utente connesso
                        
                        //reindirizzo verso index della tipologia di utente
                        response.setHeader("Location", login_ok);    
                      
                }//fine if creo account    
                else {  
                    String login_error = new String("prototipo/registrazione_account.jsp");
                    response.setHeader("Location", login_error);   
                }
            } catch (GenitoreException e) {
                // TODO Blocco di catch autogenerato
                LOG.log(Level.SEVERE, "<Descrizione del problema>", e);
            } catch (DBConnectionException e) {
                // TODO Blocco di catch autogenerato
                LOG.log(Level.SEVERE, "<Descrizione del problema>", e);
            }

    }
}
