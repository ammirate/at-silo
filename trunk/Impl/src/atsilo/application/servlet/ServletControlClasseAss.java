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
import atsilo.storage.DBBambino;
import atsilo.storage.Database;

/**
 * Servlet implementation class ServletControlBandoIM
 */
@WebServlet("/ServletControlClasseAss")
public class ServletControlClasseAss extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ControlClassi crt;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletControlClasseAss() {
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
        String lun =request.getParameter("lunghezzaLista");
        int lista = Integer.parseInt(lun);
        for(int i=0;i<lista;i++){
            String cf= request.getParameter(""+i);
            if(Integer.parseInt(request.getParameter(cf+"_"+i)) > 0){
                String classe = request.getParameter(cf+"_"+i);
                Database db = new Database();
                DBBambino dbbamb = new DBBambino(db);
                db.apriConnessione();
                try {
                    Bambino b = dbbamb.ricercaBambinoPerCodFiscale(cf);
                    crt.inserisciBambinoNellaClasse(Integer.parseInt(classe), b);
                } catch (NumberFormatException e) {
                    response.setStatus(response.SC_MOVED_TEMPORARILY);
                    response.setHeader("Location", "prototipo/errore.html");
                } catch (BambinoException e) {
                    response.setStatus(response.SC_MOVED_TEMPORARILY);
                    response.setHeader("Location", "prototipo/errore.html");
                } catch (DBConnectionException e) {
                    response.setStatus(response.SC_MOVED_TEMPORARILY);
                    response.setHeader("Location", "prototipo/errore.html");
                } catch (SQLException e) {
                    response.setStatus(response.SC_MOVED_TEMPORARILY);
                    response.setHeader("Location", "prototipo/errore.html");
                }
            }  
        }
        response.setStatus(response.SC_MOVED_TEMPORARILY);
        response.setHeader("Location", "prototipo/assegna_classe.jsp?"+"successo=y"); 
    }
}
