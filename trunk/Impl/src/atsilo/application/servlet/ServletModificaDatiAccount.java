package atsilo.application.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import atsilo.test.application.ControlDatiPersonali;
import atsilo.test.application.ControlLogin;

/*
 *-----------------------------------------------------------------
 * This file is licensed under GPL 3.0:
 * http://www.gnu.org/licenses/gpl-3.0.html
 *-----------------------------------------------------------------
 * FILE: ServeletModificaDatiAccount.java
 *-----------------------------------------------------------------
 * PROGETTO: Atsilo
 *-----------------------------------------------------------------
 * OWNER
 * Angelo G. Scafuro, 03/12/2012 (non responsabile)
 *-----------------------------------------------------------------
 */

/**
 * Servlet implementation class ServletModificaDatiAccount
 */
@WebServlet("/ServletModificaDatiAccount")
public class ServletModificaDatiAccount extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ControlDatiPersonali cdp ;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletModificaDatiAccount() {
        cdp=cdp.getIstance();
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
	   //Prendo nome pagina chiamante
	    
	    
	    
	    PrintWriter out = response.getWriter();
	    HttpSession sessione = request.getSession();
	    String nome_pagina_chiamante=((String)sessione.getAttribute("nome_pagina_chiamante"));
	    
            //i campi del form non possono essere nulli quindi non viene fatto nessun controllo
	    String username= request.getParameter("username");
	    String password;
	    if ( request.getParameter("password").equals("******"))
	        password=null;//quando password e' null non verra' fatto l'update
	    else
	        password= request.getParameter("password");//l'utente vuole cambiare la password
	    String email=request.getParameter("email");
            
            String tipologia_genitore=null;
            if (request.getParameter("tipologia_genitore") != null)// account genitore ha il parametro tipologia di genitore
                   tipologia_genitore= request.getParameter("tipologia_genitore");
            
            // Set response content type
            response.setContentType("text/html");
            // New location to be redirected
            String modifica_ok = new String("prototipo/index_"+nome_pagina_chiamante+"?successo=ok");//reindirizzo al chiamante della servlet
            String modifica_error = new String("prototipo/index_"+nome_pagina_chiamante+"?successo=failed");
            response.setStatus(response.SC_MOVED_TEMPORARILY);
            
            if (cdp.updateAccount(username, password, email, tipologia_genitore)){//setto dati account
                //reindirizzo verso index della tipologia di utente
                response.setHeader("Location", "prototipo/dati_account_genitore.jsp");    
            }
            
            else {  
                //response.setHeader("Location", modifica_error);   
            }

        }

}