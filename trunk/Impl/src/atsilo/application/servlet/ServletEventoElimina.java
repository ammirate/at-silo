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
@WebServlet("/ServletEventoElimina")
public class ServletEventoElimina extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ControlEvento crt;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletEventoElimina() {
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
        String idEvn = request.getParameter("evento");
        Evento evn = new Evento();
        evn.setId(Integer.parseInt(idEvn));
        crt.eliminaEvento(evn);
        response.setStatus(response.SC_MOVED_TEMPORARILY);
        response.setHeader("Location", "prototipo/lista_evento.jsp?"+"successo=y");
        
    }
}
