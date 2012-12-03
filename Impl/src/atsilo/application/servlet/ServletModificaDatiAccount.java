package atsilo.application.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import atsilo.test.application.ControlDatiPersonali;
import atsilo.test.application.ControlLogin;

/**
 * Servlet implementation class ServletModificaDatiAccount
 */
@WebServlet("/ServletModificaDatiAccount")
public class ServletModificaDatiAccount extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ControlDatiPersonali cdp ;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletModificaDatiAccount() {
        cdp=cdp.getIstance();
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
	   //Prendo nome pagina chiamante
	    
	    String a = request.getRequestURI();
	    String[] b = a.split("/");
	    String nome_chiamante = b[b.length-1];
	    
	    
	    PrintWriter out = response.getWriter();
	    
            //i campi del form non possono essere nulli quindi non viene fatto nessun controllo
	    String username= request.getParameter("username");
            String password= request.getParameter("password");
            
            String tipologia_genitore;
            if (request.getParameter("tipologia_genitore") != null)// non è nullo solo per i genitori
                   tipologia_genitore= request.getParameter("tipologia_genitore");
            
            // Set response content type
            response.setContentType("text/html");
            // New location to be redirected
            String modifica_ok = new String("prototipo/index_"+nome_chiamante);//reindirizzo al chiamante della servlet
            String modifica_error = new String("");
            response.setStatus(response.SC_MOVED_TEMPORARILY);
            
            if (cdp.)){//setto dati account
                //reindirizzo verso index della tipologia di utente
                response.setHeader("Location", modifica_ok);    
            }
            
            else {  
                response.setHeader("Location", modifica_error);   
            }

        }

}