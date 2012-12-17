package atsilo.application.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import atsilo.application.*;
import atsilo.entity.Bambino;
import atsilo.exception.BambinoException;
import atsilo.exception.ClasseException;
import atsilo.exception.DBConnectionException;
import atsilo.exception.DomandaIscrizioneException;
import atsilo.exception.InserimentoDatiException;
import atsilo.storage.DBBambino;
import atsilo.storage.Database;

/**
 * Servlet implementation class ServletControlBandoIM
 */
@WebServlet("/ServletDomandaIscrizioneConvalida")
public class ServletDomandaIscrizioneConvalida extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ControlIscrizione crt;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletDomandaIscrizioneConvalida() {
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
        String cf_id = request.getParameter("cf_id");
        String temp[];
        temp = cf_id.split("_");
        String cf = temp[0];
        int id = Integer.parseInt(temp[1]);
        String cMalattie = request.getParameter("cMalattie");
        String cPrivacy = request.getParameter("cPrivacy");
        String cVaccino = request.getParameter("cVaccino");
        try {
            crt.aggiornaCertificati(cf, cPrivacy, cVaccino, cMalattie);
            crt.convalidaIscrizione(id);
        } catch (DomandaIscrizioneException e) {
            response.setStatus(response.SC_MOVED_TEMPORARILY);
            response.setHeader("Location", "prototipo/errore.html"); 
        } catch (InserimentoDatiException e) {
            response.setStatus(response.SC_MOVED_TEMPORARILY);
            response.setHeader("Location", "prototipo/errore.html"); 
        } catch (DBConnectionException e) {
            response.setStatus(response.SC_MOVED_TEMPORARILY);
            response.setHeader("Location", "prototipo/errore.html"); 
        } catch (SQLException e) {
            response.setStatus(response.SC_MOVED_TEMPORARILY);
            response.setHeader("Location", "prototipo/errore.html"); 
        }
        
        response.setStatus(response.SC_MOVED_TEMPORARILY);
        response.setHeader("Location", "prototipo/lista_domanda_confermata.jsp?"+"successo=y"); 
    }
    
}
