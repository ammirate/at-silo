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
import atsilo.exception.ClasseException;
import atsilo.exception.DBConnectionException;

/**
 * Servlet implementation class ServletControlBandoIM
 */
@WebServlet("/ServletControlClasseIns")
public class ServletControlClasseIns extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ControlClassi crt;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletControlClasseIns() {
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
        String sezione = (String) request.getParameter("classe");
        try {
            
           if((crt.inserisciClasse(sezione, null)) != false){
               response.setStatus(response.SC_MOVED_TEMPORARILY);
               response.setHeader("Location", "prototipo/inserisci_classe.jsp?"+"successo=y");
           }
        } catch (DBConnectionException e) {
            response.setStatus(response.SC_MOVED_TEMPORARILY);
            response.setHeader("Location", "prototipo/errore.html");
        } catch (ClasseException e) {
            response.setStatus(response.SC_MOVED_TEMPORARILY);
            response.setHeader("Location", "prototipo/errore.html");
            
        }  
        
    }
}
