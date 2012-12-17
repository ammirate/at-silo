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
@WebServlet("/ServletConvalidaClasseBambino")
public class ServletConvalidaClasseBambino extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ControlClassi crt;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletConvalidaClasseBambino() {
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
        if(request.getParameter("classi") != null){
            Database db = new Database();
            DBBambino dbbamb = new DBBambino(db);
            db.apriConnessione();
            String[] classiSelezionate;
            classiSelezionate = request.getParameterValues("classi");
            String res[];
            String submit = request.getParameter("submit");
            for(int i=0;i<classiSelezionate.length;i++){
                res = classiSelezionate[i].split("_");
                String cf = res[0];
                int id = Integer.parseInt(res[1]);
                if(submit.compareTo("Convalida") == 0){
                    try {
                        Bambino bamb = dbbamb.ricercaBambinoPerCodFiscale(cf);
                        crt.confermaBambinoNellaClasse(id, bamb);
                    } catch (SQLException e) {
                        response.setStatus(response.SC_MOVED_TEMPORARILY);
                        response.setHeader("Location", "prototipo/errore.html"); 
                    } catch (BambinoException e) {
                        response.setStatus(response.SC_MOVED_TEMPORARILY);
                        response.setHeader("Location", "prototipo/errore.html"); 
                    } catch (DBConnectionException e) {
                        response.setStatus(response.SC_MOVED_TEMPORARILY);
                        response.setHeader("Location", "prototipo/errore.html"); 
                    }
                }else if(submit.compareTo("Riggetta") == 0){
                    try {
                        Bambino bamb = dbbamb.ricercaBambinoPerCodFiscale(cf);
                        crt.rigettaBambinoNellaClasse(id, bamb);
                    } catch (SQLException e) {
                        response.setStatus(response.SC_MOVED_TEMPORARILY);
                        response.setHeader("Location", "prototipo/errore.html"); 
                    } catch (BambinoException e) {
                        response.setStatus(response.SC_MOVED_TEMPORARILY);
                        response.setHeader("Location", "prototipo/errore.html"); 
                    } catch (DBConnectionException e) {
                        response.setStatus(response.SC_MOVED_TEMPORARILY);
                        response.setHeader("Location", "prototipo/errore.html"); 
                    }
                }
                else{
                    response.setStatus(response.SC_MOVED_TEMPORARILY);
                    response.setHeader("Location", "prototipo/errore.html"); 
                }
            }
            response.setStatus(response.SC_MOVED_TEMPORARILY);
            response.setHeader("Location", "prototipo/convalida_classe_bambino.jsp?"+"successo=y"); 
        }
    }
}
