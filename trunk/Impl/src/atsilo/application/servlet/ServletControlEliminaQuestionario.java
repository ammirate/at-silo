package atsilo.application.servlet;


import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import atsilo.application.ControlQuestionario;
import atsilo.exception.DBConnectionException;
import atsilo.exception.QuestionarioException;
/**
 * Servlet implementation class ServletControlEliminaQuestionario
 */
@WebServlet("/ServletControlEliminaQuestionario")
public class ServletControlEliminaQuestionario extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletControlEliminaQuestionario() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
            int id = Integer.parseInt(request.getParameter("idquest"));
            ControlQuestionario q = null;
            q=ControlQuestionario.getIstance();
            try {
                q.eliminaQuestionario(id);
                response.sendRedirect("prototipo/lista_questionari.jsp?success=3");   

            } catch (DBConnectionException e) {
                // TODO Blocco di catch autogenerato
//                LOG.log(Level.SEVERE, "<Descrizione del problema>", e);
            } catch (QuestionarioException e) {
                // TODO Blocco di catch autogenerato
//                LOG.log(Level.SEVERE, "<Descrizione del problema>", e);
            }
            response.sendRedirect("prototipo/lista_questionari.jsp?success=failed");   

            
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	    response.setContentType("text/html");
            PrintWriter pw = response.getWriter();
            pw.println("");
            pw.println("");
            pw.println("");
            pw.println("<h1>Control Questionario</h1><br>This servlet should not be accessed this way.");
            pw.println("");
	}

}
