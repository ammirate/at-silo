package atsilo.application.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import atsilo.test.application.ControlLogin;

/**
 * Servlet implementation class ServletControlLogin
 * 
 * @author Angelo G. Scafuro
 * 
 * @version 1.0
 */
@WebServlet("/ServletControlLogin")
public class ServletControlLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ControlLogin login ;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletControlLogin() {
         login = login.getInstance();
        
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
            String username= request.getParameter("username_login");
            String password= request.getParameter("pswd_login");
            String tipologia= request.getParameter("tipologiaUtente");
            
            // Set response content type
            response.setContentType("text/html");
            // New location to be redirected
            String login_ok = new String("prototipo/index_"+tipologia+".jsp");
            String login_error = new String("prototipo/login.jsp");
            response.setStatus(response.SC_MOVED_TEMPORARILY);
            
            if (login.getValoreLogin(username, password, tipologia)){
                
                response.setHeader("Location", login_ok);    
            }
            
            else {  
                response.setHeader("Location", login_error);   
            }

	}

}
