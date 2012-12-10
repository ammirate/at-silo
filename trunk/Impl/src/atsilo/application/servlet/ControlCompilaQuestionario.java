package atsilo.application.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import atsilo.application.ControlQuestionario;
import atsilo.entity.Questionario;
import atsilo.entity.RispostaQuestionario;
import atsilo.exception.DBConnectionException;
import atsilo.exception.QuestionarioException;

/**
 * Servlet implementation class ControlCompilaQuestionario
 */
@WebServlet("/ControlCompilaQuestionario")
public class ControlCompilaQuestionario extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ControlCompilaQuestionario() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	       response.setContentType("text/html");
	            PrintWriter pw = response.getWriter();
	            pw.println("");
	            pw.println("");
	            pw.println("");
	            pw.println("<h1>Control Questionario</h1><br>This servlet should not be accessed this way.");
	            pw.println("");

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	        List<RispostaQuestionario> listR = new ArrayList<RispostaQuestionario>();
	        ControlQuestionario q = ControlQuestionario.getIstance();
	        String codfis = request.getParameter("codfis");
	        int id = Integer.parseInt(request.getParameter("questID"));
	        Questionario quest = null;
	        try {
	           quest = q.getQuestionario(id);
	        } catch (SQLException e1) {
	            // TODO Blocco di catch autogenerato
	            return;
	        }
	        int i = 0;
	        while(true) {
	            try {
	                String d = request.getParameter("domanda" + i );
	                if(d==null) break;
	                String[] r = request.getParameterValues("opzione" + i);
	                for(int j = 0; j<r.length; j++) {
	                    RispostaQuestionario resp = new RispostaQuestionario(j, r[j], id, codfis);
	                    listR.add(resp);
	                }
	            }
	            catch (Exception e)
	            {
	                System.out.println("Eccezione");
	                break;
	            }
	            i++;
	            
	        }
	        try {
                q.compilaQuestionario(quest.getId(), listR, codfis);
                for(int f = 0; f<listR.size(); f++) {
                  System.out.println(listR.get(f).getValore());
                }
            } catch (DBConnectionException e) {
                // TODO Blocco di catch autogenerato
//                LOG.log(Level.SEVERE, "<Descrizione del problema>", e);
            } catch (QuestionarioException e) {
                // TODO Blocco di catch autogenerato
//                LOG.log(Level.SEVERE, "<Descrizione del problema>", e);
            }
	   }

}