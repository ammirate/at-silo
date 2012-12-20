package atsilo.application.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import atsilo.application.*;
import atsilo.entity.Classe;
import atsilo.entity.Evento;
import atsilo.exception.ClasseException;
import atsilo.exception.DBConnectionException;

/**
 * Servlet implementation class ServletControlBandoIM
 */
@WebServlet("/ServletEventoModifica")
public class ServletEventoModifica extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ControlEvento crt;
    private ControlClassi crtClass;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletEventoModifica() {
        crt = crt.getIstance();
        crtClass = crtClass.getIstance();
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
        String id= request.getParameter("oldevento");
        Evento oldEvn;
        try {
            oldEvn = crt.getEventoPerId(Integer.parseInt(id));
            String descrizione = request.getParameter("desc");
            String dataIntera = request.getParameter("data");
            String nome = request.getParameter("nome");
            String tipo = request.getParameter("tipo");
            String cC = request.getParameter("cc");
            String elencoClassi[] = request.getParameterValues("classe");
            String YYYYMMDD[];
            YYYYMMDD = dataIntera.split("/");
            Date data = new Date(Integer.parseInt(YYYYMMDD[2])-1900, Integer.parseInt(YYYYMMDD[1])-1, Integer.parseInt(YYYYMMDD[0]));
            Evento nuovoEvn = new Evento(descrizione, nome, cC, data, tipo, oldEvn.getOrganizzatore(), oldEvn.getPath());
            nuovoEvn.setId(Integer.parseInt(id));
            List<Classe> classi = new ArrayList<Classe>();
            for(int k=0; k<elencoClassi.length;k++){
               classi.add(crtClass.getClasseById(Integer.parseInt(elencoClassi[k])));
            }
            nuovoEvn.setClassi(classi);
            if(crt.modificaEvento(oldEvn, nuovoEvn) == true){
                response.setStatus(response.SC_MOVED_TEMPORARILY);
                response.setHeader("Location", "prototipo/lista_evento.jsp?"+"successo=y&year="+(nuovoEvn.getData().getYear()+1900)+"&month="+(nuovoEvn.getData().getMonth())+"&day="+nuovoEvn.getData().getDate());     
                 
            }
            else{
                response.setStatus(response.SC_MOVED_TEMPORARILY);
                response.setHeader("Location", "prototipo/errore.html"); 
            }
        } catch (NumberFormatException e) {
            response.setStatus(response.SC_MOVED_TEMPORARILY);
            response.setHeader("Location", "prototipo/errore.html"); 
        } catch (SQLException e) {
            response.setStatus(response.SC_MOVED_TEMPORARILY);
            response.setHeader("Location", "prototipo/errore.html"); 
        } catch (DBConnectionException e) {
            response.setStatus(response.SC_MOVED_TEMPORARILY);
            response.setHeader("Location", "prototipo/errore.html"); 
        } catch (ClasseException e) {
            response.setStatus(response.SC_MOVED_TEMPORARILY);
            response.setHeader("Location", "prototipo/errore.html"); 
        }
        
    }
}
