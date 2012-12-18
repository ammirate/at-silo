package atsilo.application.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import atsilo.application.ControlDatiPersonali;
import atsilo.entity.Account;
import atsilo.exception.DBConnectionException;
import atsilo.exception.GenitoreException;
import atsilo.storage.DBAccount;
import atsilo.stub.application.StubControlDatiPersonali;
import atsilo.test.storage.TestDBBeans;

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
        
        controlDatiPersonali=ControlDatiPersonali.getIstance();
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
        pw.println("<h1>Registrazione Account</h1><br>This servlet should not be accessed this way.");
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
        
        
        if (controlDatiPersonali.createAccount(cf, nome_richiedente, cognome_richiedente, email_richidente, tel_richiedente, tipologia_genitore_richiedente)){
            
           
            //creazione account ed entità genitore andata a buon fine
            //autologin nel sistema
            
            
            // Set response content type
            response.setContentType("text/html");
            // New location to be redirected
            String login_ok = new String("prototipo/dati_account_genitore.jsp");
            response.setStatus(response.SC_MOVED_TEMPORARILY);
            
            Account newAccount = null;
            try {
                newAccount = controlDatiPersonali.getAccount(cf);
            } catch (SQLException e) {
               
                LOG.log(Level.SEVERE, "ServletRegistrazioneAccount: Errore sql", e);
            }//account appena creato
      
            //Setto le variabili di sessione
            HttpSession sessione = request.getSession();
            if (newAccount!=null){// controllo se account creato non è nullo
                sessione.setAttribute("username", newAccount.getUserName());
                String tipologia="genitore";//tipologia utente che accede al sistema,nel caso della registrazione nuovo utente è sempre un genitore
                sessione.setAttribute("tipologia_utente", tipologia);//setto variabile di sessione che indica la tipologia di utente connesso
               
                //reindirizzo verso index della tipologia di utente
                response.setHeader("Location", login_ok);    
           
            }
        }//fine if creo account    
        else{
        response.setContentType("text/html");
        String login_error = new String("prototipo/registrazione_account.jsp?successo=failed");
        response.setHeader("Location", login_error);   
        response.setStatus(response.SC_MOVED_TEMPORARILY); 
        }
        
        
    }
}
