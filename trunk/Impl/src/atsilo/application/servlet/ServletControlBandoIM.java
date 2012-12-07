package atsilo.application.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import atsilo.test.application.ControlGestioneBandoTest;

/**
 * Servlet implementation class ServletControlBandoIM
 */
@WebServlet("/ServletControlBandoIM")
public class ServletControlBandoIM extends HttpServlet {
	private static final long serialVersionUID = 1L;
        private ControlGestioneBandoTest crt;
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
	    String success = "successo=ok";
	    String dataInizio = (String) request.getParameter("iniziobando");
	    String dataFine = (String) request.getParameter("finebando");
	    crt.modificaBando(dataInizio, dataFine);
	    response.setStatus(response.SC_MOVED_TEMPORARILY);
	    
	    response.setHeader("Location", "prototipo/specifiche_bando.jsp?"+success);
	}

}
