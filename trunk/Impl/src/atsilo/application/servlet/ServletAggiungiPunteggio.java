package atsilo.application.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.SQLException;
import java.util.logging.Level;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import atsilo.application.*;
import atsilo.entity.Bambino;
import atsilo.entity.DomandaIscrizione;
import atsilo.exception.BambinoException;
import atsilo.exception.BandoException;
import atsilo.exception.ClasseException;
import atsilo.exception.DBConnectionException;
import atsilo.storage.DBBambino;
import atsilo.storage.Database;

/**
 * Servlet implementation class ServletControlBandoIM
 */
@WebServlet("/ServletAggiungiPunteggio")
public class ServletAggiungiPunteggio extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ControlClassi crt;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletAggiungiPunteggio() {
        crt = crt.getIstance();
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
        String invia =request.getParameter("invia");
        ControlGestioneBando crt = ControlGestioneBando.getIstance();
        String id = request.getParameter("domanda");
        int id2 = Integer.parseInt(id);
        DomandaIscrizione dom = crt.getDomandaIscrizioneById(id2);
        if(invia.compareTo("Invia Punteggio") == 0){
            String punteggio = request.getParameter("punteggio");
            int punt = Integer.parseInt(punteggio);
            try {
                crt.inserisciPunteggio(dom, punt);
            } catch (BandoException e) {
                response.setStatus(response.SC_MOVED_TEMPORARILY);
                response.setHeader("Location", "prototipo/errore.html"); 
            }
        }else if(invia.compareTo("Invia Motivazione") == 0){
            String motivo = request.getParameter("motivo");
            try {
                crt.escludiDomanda(dom, motivo);
            } catch (BandoException e) {
                response.setStatus(response.SC_MOVED_TEMPORARILY);
                response.setHeader("Location", "prototipo/errore.html");   
            }
        }else{
            response.setStatus(response.SC_MOVED_TEMPORARILY);
            response.setHeader("Location", "prototipo/errore.html");   
        }
       
        response.setStatus(response.SC_MOVED_TEMPORARILY);
        response.setHeader("Location", "prototipo/lista_punteggio.jsp?"+"successo=y"); 
    }
}
