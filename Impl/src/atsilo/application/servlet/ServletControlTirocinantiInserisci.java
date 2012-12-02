package atsilo.application.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import atsilo.application.ControlTirocinante;
import atsilo.entity.PersonaleAsilo;
import atsilo.entity.Tirocinante;

/**
 * Servlet implementation class ServletControlOrarioModifica
 */
@WebServlet("/ServletControlTirocinantiInserisci")
public class ServletControlTirocinantiInserisci extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ControlTirocinante tirocinante;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletControlTirocinantiInserisci() {
           tirocinante = tirocinante.getInstance();
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
	    String nome= request.getParameter("nome");
            String cognome= request.getParameter("cognome");
            String cf= request.getParameter("cf");
            String telefono = request.getParameter("telefono");
            String email = request.getParameter("email");
            String giorno = request.getParameter("giorno");
            String mese = request.getParameter("mese");
            String anno = request.getParameter("anno");
            int gg = Integer.parseInt(giorno);
            int mm = Integer.parseInt(mese);
            int yyyy = Integer.parseInt(anno);
            String comuneNascita= request.getParameter("comunenascita");
            String indirizzo = request.getParameter("indirizzo");
            String titolo = request.getParameter("titolo");
            String ore = request.getParameter("orelavoro");
            int oreLavoro = Integer.parseInt(ore);
            PersonaleAsilo p = new PersonaleAsilo();
            /* Soluzione Reale : Metodo del ControlPersonaleAsilo : public PersonaleAsilo cercaPersonale(String codiceFiscale);
             * ControlPersonaleAsilo p = ControlPersonaleAsilo.getIstance();
             * String codiceFiscalePersonale = request.getParameter("cfPers");
             * PersonaleAsilo pers = p.cercaPersonale(codiceFiscalePersonale);
             * Inserire pers nel costruttore di tirocinante.
             */
            Date d = new Date(gg, mm, yyyy);
            
            Tirocinante t = new Tirocinante(d, nome, cognome, cf, email, comuneNascita, telefono, indirizzo, 0 , oreLavoro, p);
            tirocinante.inserisciTirocinante(t);
            out.print("Inserimento completato con successo");
            
	}
}
