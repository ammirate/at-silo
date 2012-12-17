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
import atsilo.exception.BandoException;
import atsilo.exception.DBConnectionException;

/**
 * Servlet implementation class ServletControlBandoIM
 */
@WebServlet("/ServletControlBandoIM")
public class ServletControlBandoIM extends HttpServlet {
	private static final long serialVersionUID = 1L;
        private ControlGestioneBando crt;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletControlBandoIM() {
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
	    String dataInizioBando = (String) request.getParameter("iniziobando");
	    String dataFineBando = (String) request.getParameter("finebando");
	    String dataInizioPresentazione = (String) request.getParameter("iniziopresentazione");
	    String dataFinePresentazione = (String) request.getParameter("finepresentazione");
	    String dataFineRinuncia = (String) request.getParameter("finerinuncia");
	    int posti = Integer.parseInt( (String) request.getParameter("postidisp"));
	    try {
            if((crt.modificaBando(dataInizioBando, dataFineBando, dataInizioPresentazione, dataFinePresentazione, dataFineRinuncia, posti)) != false){
            response.setStatus(response.SC_MOVED_TEMPORARILY);
            response.setHeader("Location", "prototipo/specifiche_bando.jsp?"+"successo=y");
            }
            else{
                response.setStatus(response.SC_MOVED_TEMPORARILY);
                response.setHeader("Location", "prototipo/specifiche_bando.jsp?"+"successo=n"); 
            }
        } catch (BandoException e) {
            response.setStatus(response.SC_MOVED_TEMPORARILY);
            response.setHeader("Location", "prototipo/errore.html");
        }

	}
}
