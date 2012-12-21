package atsilo.application.servlet;


import java.awt.List;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import atsilo.application.ControlQuestionario;
import atsilo.entity.CampoDomandaQuestionario;
import atsilo.entity.DomandaQuestionario;
import atsilo.entity.Questionario;
import atsilo.exception.DBConnectionException;
import atsilo.exception.QuestionarioException;

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
	    pw.println("<h1>Control Questionario</h1><br>This servlet should not be accessed this way.");
	    pw.println("");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    // TODO Auto-generated method stub
	    //Inserisci questionario 
	    String[] dataI=null, dataF=null;
	    int id = 0;
	    try {
	        dataI = request.getParameter("dataIn").split("/");
	        dataF = request.getParameter("dataOu").split("/");
	        id = Integer.parseInt(request.getParameter("identificativo"));
	    }
	    catch(Exception e) {
	        
	    }
	    Calendar c = Calendar.getInstance();
	    c.set(Integer.parseInt(dataI[2]), Integer.parseInt(dataI[1])-1, Integer.parseInt(dataI[0]));
	    Date din = new Date(c.getTimeInMillis());
	    c.set(Integer.parseInt(dataF[2]), Integer.parseInt(dataF[1])-1, Integer.parseInt(dataF[0]));
            Date don  = new Date(c.getTimeInMillis());
	    ControlQuestionario q = null;
	    q= ControlQuestionario.getIstance();
            DomandaQuestionario d = null;
            CampoDomandaQuestionario cdq = null;
            ArrayList<DomandaQuestionario> domande = new ArrayList<DomandaQuestionario>();
            ArrayList<CampoDomandaQuestionario> campi = new ArrayList<CampoDomandaQuestionario>();
            
            String titoloQuestionario = request.getParameter("titolo");
            String descrizione = request.getParameter("descrizione");
            Questionario quest = new Questionario(descrizione, "false", titoloQuestionario,id, din, don);
            String domanda= "";
            int x = 0;
            while(true) {
                try {
                    domanda = request.getParameter("domanda"+x);
                    if (domanda==null) break;
                }
                catch (Exception e) {
                    break;
                } 
                d=new DomandaQuestionario(0,0,domanda, null);
                int sent=0;
                
                String[] opzione = request.getParameterValues("opzione"+x+"[]");
                String tipo = request.getParameter("tipo"+x);
                if (tipo.equals("1")) tipo = "checkbox";
                else if (tipo.equals("2")) tipo = "radio";
                else if (tipo.equals("3")) tipo = "text";
                ArrayList<CampoDomandaQuestionario> c1 = new ArrayList<CampoDomandaQuestionario>();
                for(int i = 0; i<opzione.length; i++) {
                    CampoDomandaQuestionario campo =new CampoDomandaQuestionario(tipo, opzione[i], opzione[i], x);
                    c1.add(campo);
                  
                    if(campo.getDescrizione().equals(""))
                    {
                        sent++;
                    }
                    if(c1.size()>1)
                    {
                        sent=0;
                    }
                }

                if(domanda.equals(""))
                { 
                   sent++;
                }
                if(sent==0)
                {
                    d.setCampi(c1);
                    quest.aggiungiDomanda(d);
                }
                x++;
            }
           
            try { 
            if(request.getParameter("action").equals("modify"))
            {
                System.out.println(quest.getId());
                q.modificaQuestionario(quest.getId(), quest);
                response.sendRedirect("prototipo/lista_questionari.jsp?success=2");   
                
            }   
            else {
                q.inserisciQuestionario(quest);
                response.sendRedirect("prototipo/lista_questionari.jsp?success=1");   
            }}
            catch (Exception e) {
                try {
                    q.inserisciQuestionario(quest);
                    response.sendRedirect("prototipo/lista_questionari.jsp?success=1");   
                } catch (DBConnectionException e1) {
                    // TODO Blocco di catch autogenerato
//                    LOG.log(Level.SEVERE, "<Descrizione del problema>", e1);
                } catch (QuestionarioException e1) {
                    // TODO Blocco di catch autogenerato
//                    LOG.log(Level.SEVERE, "<Descrizione del problema>", e1);

                }
            }
	}
}
