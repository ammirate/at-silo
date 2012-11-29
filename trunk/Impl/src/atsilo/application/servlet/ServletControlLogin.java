package atsilo.application.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import atsilo.test.application.ControlLogin;

/**
 * Servlet implementation class ServletControlLogin
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
	    doPost(request,  response);// controllare se questa istruzione è corretta
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
            String site = new String("index_"+tipologia);
            
            
            if (login.getValoreLogin(username, password, tipologia)){
                response.setStatus(response.SC_MOVED_TEMPORARILY);
                response.setHeader("Location", site);    
            }
                
                
            
                
	   

	}

}
