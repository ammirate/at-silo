package atsilo.application.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import atsilo.application.*;
import atsilo.entity.*;
import atsilo.exception.ClasseException;
import atsilo.exception.DBConnectionException;
import atsilo.exception.InserimentoDatiException;
import atsilo.exception.UtenteException;
import atsilo.util.AtsiloConstants;

/**
 * Servlet implementation class ServletControlBandoIM
 */
@WebServlet("/ServletEventoInserisci")
public class ServletEventoInserisci extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ControlEvento crt;
    private ControlClassi crtClass;
    private ControlDatiPersonali crtPers;
    private static final Logger LOG = Logger.getLogger("global");
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletEventoInserisci() {
        crt = crt.getIstance();
        crtClass = crtClass.getIstance();
        crtPers = crtPers.getIstance();
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
        try {
            String descrizione = request.getParameter("desc");
            String dataIntera = request.getParameter("data");
            String nome = request.getParameter("nome");
            String tipo = request.getParameter("tipo");
            String cC = request.getParameter("cc");
            String elencoClassi[] = request.getParameterValues("classe");
            String YYYYMMDD[];
            YYYYMMDD = dataIntera.split("/");
            Date data = new Date(Integer.parseInt(YYYYMMDD[2])-1900, Integer.parseInt(YYYYMMDD[1])-1, Integer.parseInt(YYYYMMDD[0]));
            String tipologia = request.getParameter("tipologia");
            String username = request.getParameter("user");
            EventPlanner pers = null;
            if(tipologia.compareTo(AtsiloConstants.CAT_IMP_ASILO) == 0){
              pers = (PersonaleAsilo)  crtPers.getPersonaleAsiloFromUsername(username);
            }
            if(tipologia.compareTo(AtsiloConstants.CAT_PSICOPEDAGOGO) == 0){
               pers = (Psicopedagogo)  crtPers.getPsicoPedagogoFromUsername(username);
            }
            if(tipologia.compareTo(AtsiloConstants.CAT_EDUCATORE) == 0){
               pers = (EducatoreDidattico)  crtPers.getEducatoreDidatticoFromUsername(username);
             }
 
            
            Evento nuovoEvn = new Evento(descrizione, nome, cC, data, tipo, pers, null);
            if(elencoClassi!=null)
            {
                List<Classe> classi = new ArrayList<Classe>();
                for(int k=0; k<elencoClassi.length;k++){
                   classi.add(crtClass.getClasseById(Integer.parseInt(elencoClassi[k])));
                }
                nuovoEvn.setClassi(classi);
            }
            crt.inserisciEvento(nuovoEvn);
            response.setStatus(response.SC_MOVED_TEMPORARILY);
            response.setHeader("Location", "prototipo/lista_evento.jsp?"+"successo=y&year="+(nuovoEvn.getData().getYear()+1900)+"&month="+(nuovoEvn.getData().getMonth())+"&day="+nuovoEvn.getData().getDate());     
            
         
        } catch (NumberFormatException e) {
            response.setStatus(response.SC_MOVED_TEMPORARILY);
            response.setHeader("Location", "prototipo/errore.html"); 
            LOG.log(Level.SEVERE, getServletName()+e.getMessage(), e);
        } catch (SQLException e) {
            response.setStatus(response.SC_MOVED_TEMPORARILY);
            response.setHeader("Location", "prototipo/errore.html"); 
            LOG.log(Level.SEVERE, getServletName()+e.getMessage(), e);
        } catch (DBConnectionException e) {
            response.setStatus(response.SC_MOVED_TEMPORARILY);
            response.setHeader("Location", "prototipo/errore.html"); 
            LOG.log(Level.SEVERE, getServletName()+e.getMessage(), e);
        } catch (ClasseException e) {
            response.setStatus(response.SC_MOVED_TEMPORARILY);
            response.setHeader("Location", "prototipo/errore.html"); 
            LOG.log(Level.SEVERE, getServletName()+e.getMessage(), e);
        } catch (UtenteException e) {
            response.setStatus(response.SC_MOVED_TEMPORARILY);
            response.setHeader("Location", "prototipo/errore.html");
            LOG.log(Level.SEVERE, getServletName()+e.getMessage(), e);
        } catch (InserimentoDatiException e) {
            response.setStatus(response.SC_MOVED_TEMPORARILY);
            response.setHeader("Location", "prototipo/errore.html");
            LOG.log(Level.SEVERE, getServletName()+e.getMessage(), e);
        } catch (Exception e) {
            response.setStatus(response.SC_MOVED_TEMPORARILY);
            response.setHeader("Location", "prototipo/errore.html");
            LOG.log(Level.SEVERE, getServletName()+e.getMessage(), e);
        }
        
    }
}
