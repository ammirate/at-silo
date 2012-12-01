

import java.awt.List;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import atsilo.application.ControlQuestionario;
import atsilo.entity.CampoDomandaQuestionario;
import atsilo.entity.DomandaQuestionario;
import atsilo.entity.Questionario;

/**
 * Servlet implementation class servletControlQuestionario
 */
@WebServlet("/servletControlQuestionario")
public class servletControlQuestionario extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public servletControlQuestionario() {
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
	    pw.println("<h1>Control Login</h1><br>This servlet should not be accessed this way.");
	    pw.println("");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	  //Inserisci questionario
	  ControlQuestionario q = null;
	          q.getIstance();
	  int i=1;
	
	  DomandaQuestionario d = null;
	  CampoDomandaQuestionario cdq = null;
	  ArrayList<DomandaQuestionario> domande = new ArrayList<DomandaQuestionario>();
          ArrayList<CampoDomandaQuestionario> campi = new ArrayList<CampoDomandaQuestionario>();

	  String titoloQuestionario = request.getParameter("titolo");
	  String descrizione = request.getParameter("descrizione");
	  Questionario quest = new Questionario(descrizione, "false", titoloQuestionario,0, null, null, null, null);
	  String domanda = request.getParameter("domanda");
	  d=new DomandaQuestionario(null, domanda, quest);
	  String[] opzione = request.getParameterValues("opzione1[]");
	  for(int c = 0; c<opzione.length; c++)
	  {
	      cdq = new CampoDomandaQuestionario();
	      cdq.setDomandaQuestionario(d);
	      cdq.setDescrizione(opzione[i]);
	      campi.add(cdq);
	  }
	  d.setCampi(campi);
	  domande.add(d);
	  while(true) {
	      System.out.println("domanda"+i);
	      if(request.getParameter("domanda"+i)==null) {
	          System.out.println("uscito");
	          break;
	      }
	      domanda = request.getParameter("domanda"+i);
	      d=new DomandaQuestionario(null, domanda, quest);
	      opzione = request.getParameterValues("opzione"+(i+1)+"[]");
	      for(int c = 0; c<opzione.length; c++)
	      {
	          cdq = new CampoDomandaQuestionario();
	          cdq.setDomandaQuestionario(d);
	          cdq.setDescrizione(opzione[c]);
	          campi.add(cdq);
	      }
	      d.setCampi(campi);
	      domande.add(d);
	      
	      
	      i++;
	  }
	  q.inserisciQuestionario(quest);
	}

}
