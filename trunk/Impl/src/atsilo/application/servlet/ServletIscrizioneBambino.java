package atsilo.application.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import atsilo.application.ControlDatiPersonali;
import atsilo.application.ControlIscrizione;
import atsilo.exception.AccountException;
import atsilo.exception.BambinoException;
import atsilo.exception.DBConnectionException;
import atsilo.exception.DomandaIscrizioneException;
import atsilo.exception.GenitoreException;
import atsilo.exception.InserimentoDatiException;
import atsilo.exception.ServizioException;
import atsilo.exception.UtenteException;

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
 * Angelo G. Scafuro, 18/12/2012 (non responsabile)
 *-----------------------------------------------------------------
 */

/**
 * Servlet implementation class ServletIscrizioneBambino
 */
@WebServlet("/ServletIscrizioneBambino")
public class ServletIscrizioneBambino extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ControlIscrizione controlIscrizione;
    private static final Logger LOG = Logger.getLogger("global");
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletIscrizioneBambino() {
        controlIscrizione=ControlIscrizione.getIstance();
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
        pw.println("<h1>Iscrizione Bambino</h1><br>This servlet should not be accessed this way.");
        pw.println("");
        
    }
    
    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        HttpSession sessione = request.getSession();
        String nome_pagina_chiamante=((String)sessione.getAttribute("nome_pagina_chiamante"));
        String username_utente=((String)sessione.getAttribute("username"));
        
        //setto tutte le variabili a null in modo che, se non vengono passate alla servlet,non vengono modificate (null indica al metodo di non fare update su quel campo) 
        
        //variabili domanda completa finale
        String servizio_selezionato=null;
        if ( request.getParameter("servizio_selezionato")!=null)
            servizio_selezionato= request.getParameter("servizio_selezionato");
        String vaccinazioni=null;
        if ( request.getParameter("servizio_selezionato")!=null)
            vaccinazioni=request.getParameter("servizio_selezionato");
        String malattie_contratte=null;
        if ( request.getParameter("malattie_contratte")!=null)
            malattie_contratte=request.getParameter("malattie_contratte");
        
        
        //variabile bambino selezionato
        String select_bambini=null;
        if ( request.getParameter("select_bambini")!=null)
            select_bambini=request.getParameter("select_bambini");
        
        //gestione richieste
        
        String pagina_destinazione = "";
        
        if ( request.getParameter("chiamante").equals("pre_iscrizione")){//se chiamante è la pagina presenta pre iscrizone 
            try {
                if  (controlIscrizione.presentaDomandaIscrizionePrimoStep(select_bambini))
                    pagina_destinazione = new String("prototipo/"+nome_pagina_chiamante+"?successo=ok");//reindirizzo al chiamante della servlet
                else 
                    pagina_destinazione = new String("prototipo/"+nome_pagina_chiamante+"?successo=failed");
            } catch (DBConnectionException e) {
                // TODO Blocco di catch autogenerato
                LOG.log(Level.SEVERE, "<Descrizione del problema>", e);
            } catch (AccountException e) {
                // TODO Blocco di catch autogenerato
                LOG.log(Level.SEVERE, "<Descrizione del problema>", e);
            } catch (InserimentoDatiException e) {
                // TODO Blocco di catch autogenerato
                LOG.log(Level.SEVERE, "<Descrizione del problema>", e);
            } catch (UtenteException e) {
                // TODO Blocco di catch autogenerato
                LOG.log(Level.SEVERE, "<Descrizione del problema>", e);
            } catch (GenitoreException e) {
                // TODO Blocco di catch autogenerato
                LOG.log(Level.SEVERE, "<Descrizione del problema>", e);
            } catch (SQLException e) {
                // TODO Blocco di catch autogenerato
                LOG.log(Level.SEVERE, "<Descrizione del problema>", e);
            } catch (DomandaIscrizioneException e) {
                // TODO Blocco di catch autogenerato
                LOG.log(Level.SEVERE, "<Descrizione del problema>", e);
            } catch (BambinoException e) {
                // TODO Blocco di catch autogenerato
                LOG.log(Level.SEVERE, "<Descrizione del problema>", e);
            }
            if ( request.getParameter("chiamante").equals("iscrizione_completa")){//se chiamante è la pagina iscrizione finale
                try {
                    if  (controlIscrizione.inserisciDatiDomandaIscrizioneFinale(select_bambini, null, malattie_contratte, vaccinazioni, servizio_selezionato))
                        pagina_destinazione = new String("prototipo/"+nome_pagina_chiamante+"?successo=ok");//reindirizzo al chiamante della servlet
                    else 
                        pagina_destinazione = new String("prototipo/"+nome_pagina_chiamante+"?successo=failed");
                } catch (DomandaIscrizioneException e) {
                    // TODO Blocco di catch autogenerato
                    LOG.log(Level.SEVERE, "<Descrizione del problema>", e);
                } catch (DBConnectionException e) {
                    // TODO Blocco di catch autogenerato
                    LOG.log(Level.SEVERE, "<Descrizione del problema>", e);
                } catch (InserimentoDatiException e) {
                    // TODO Blocco di catch autogenerato
                    LOG.log(Level.SEVERE, "<Descrizione del problema>", e);
                } catch (SQLException e) {
                    // TODO Blocco di catch autogenerato
                    LOG.log(Level.SEVERE, "<Descrizione del problema>", e);
                } catch (ServizioException e) {
                    // TODO Blocco di catch autogenerato
                    LOG.log(Level.SEVERE, "<Descrizione del problema>", e);
                }
                
                
            }
        }
        
        
    }
    
}
