package atsilo.application.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import atsilo.entity.Account;
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
	    
	    //setto tutte le variabili, che conterranno i valori inseriti nei form
	    String cf="";
	    String nome_richiedente="";
	    String cognome_richiedente="";
	    String email_richidente="";
	    String cell_richiedente="";
	    String tipologia_genitore_richiedente="";
	    
	    //prende in input tutti i parametri utili per la creazione dell'account
            cf= request.getParameter("cf");
            cognome_richiedente= request.getParameter("cognome");
            nome_richiedente= request.getParameter("nome");
            email_richidente= request.getParameter("indirizzo_email");
            cell_richiedente= request.getParameter("numero_cellulare");
            tipologia_genitore_richiedente= request.getParameter("tipologia");
            
            //creo account
            if (controlDatiPersonali.createUtente(cf)){
                
                //creazione account andata a buon fine
                //autologin del sistema

            
                // Set response content type
                response.setContentType("text/html");
                // New location to be redirected
                String login_ok = new String("prototipo/dati_account_genitore.jsp");
                
                response.setStatus(response.SC_MOVED_TEMPORARILY);
                
                String tipologia="genitore";//Viene creato esclusivamente un account per questa tipologia
                
                Account newAccount=controlDatiPersonali.getAccount(cf);
                
                
                    //Setto le variabili di sessione
                    HttpSession sessione = request.getSession();
                    sessione.setAttribute("username", newAccount.getUserName());
                    sessione.setAttribute("tipologia_utente", tipologia);
                    //reindirizzo verso index della tipologia di utente
                    response.setHeader("Location", login_ok);    
                
            }//fine if creo account
            
            else {  
                String login_error = new String("prototipo/registrazione_account.jsp");
                response.setHeader("Location", login_error);   
            }
            

        }

}
