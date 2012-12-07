package atsilo.application.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import atsilo.entity.Account;
import atsilo.entity.Beans;
import atsilo.exception.DBConnectionException;
import atsilo.exception.GenitoreException;
import atsilo.test.application.ControlDatiPersonali;

/*
 *-----------------------------------------------------------------
 * This file is licensed under GPL 3.0:
 * http://www.gnu.org/licenses/gpl-3.0.html
 *-----------------------------------------------------------------
 * FILE: ServletCompilazioneDatiBando.java
 *-----------------------------------------------------------------
 * PROGETTO: Atsilo
 *-----------------------------------------------------------------
 * OWNER
 * Angelo G. Scafuro, 06/12/2012 (non responsabile)
 *-----------------------------------------------------------------
 */

/**
 * Servlet implementation class ServletCompilazioneDatiBando
 */
@WebServlet("/ServletCompilazioneDatiBando")
public class ServletCompilazioneDatiBando extends HttpServlet {
        private static final long serialVersionUID = 1L;
        private ControlDatiPersonali controlDatiPersonali ;
        private static final Logger LOG = Logger.getLogger("global");
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletCompilazioneDatiBando() {
        controlDatiPersonali=ControlDatiPersonali.getIstance();
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
            HttpSession sessione = request.getSession();
            String nome_pagina_chiamante=((String)sessione.getAttribute("nome_pagina_chiamante"));
            String username_utente=((String)sessione.getAttribute("username"));
            
            //setto tutte le variabili a null in modo che, se non vengono passate alla servlet,non vengono modificate (null indica al metodo di non fare update su quel campo) 
            
            //variabili utente -genitore richiedente
             Date dataNascita=null;
             if ( request.getParameter("data_nascita_richiedente")!=null){
                 dataNascita=new Date(01, 01, 01);
             }
             String nome=null;
             if ( request.getParameter("nome_richiedente")!=null)
                 nome=request.getParameter("nome_richiedente");
             String cognome=null;
             if ( request.getParameter("cognome_richiedente")!=null)
                 cognome=request.getParameter("cognome_richiedente");
             String codiceFiscale=null;
             if ( request.getParameter("cf_richiedente")!=null)
                 codiceFiscale= request.getParameter("cf_richiedente");
             String email=null;
             if ( request.getParameter("email_richiedente")!=null)
                 email=request.getParameter("email_richiedente");
             String comuneNascita=null;
             if ( request.getParameter("comune_nascita_richiedente")!=null)
                 comuneNascita=request.getParameter("comune_nascita_richiedente");
             String telefono=null;
             if ( request.getParameter("telefono_richiedente")!=null)
                 telefono= request.getParameter("telefono_richiedente");
             String cittadinanza=null;
             if ( request.getParameter("cittadinanza_richiedente")!=null)
                 cittadinanza=request.getParameter("cittadinanza_richiedente");
             String indirizzoResidenza=null;
             if ( request.getParameter("indirizzo_residenza_richiedente")!=null)
                 indirizzoResidenza=request.getParameter("indirizzo_residenza_richiedente");
             String numeroCivicoResidenza=null;
             if ( request.getParameter("numero_civico_residenza_richiedente")!=null)
                 numeroCivicoResidenza=request.getParameter("numero_civico_residenza_richiedente");
             String capResidenza=null;
             if ( request.getParameter("cap_residenza_richiedente")!=null)
                 capResidenza=request.getParameter("cap_residenza_richiedente");
             String comuneResidenza=null;
             if ( request.getParameter("comune_residenza_richiedente")!=null)
                 comuneResidenza=request.getParameter("comune_residenza_richiedente");
             String provinciaResidenza=null;
             if ( request.getParameter("provincia_residenza_richiedente")!=null)
                 provinciaResidenza=request.getParameter("provincia_residenza_richiedente");
             String indirizzoDomicilio=null;
             if ( request.getParameter("indirizzo_domicilio_richiedente")!=null)
                 indirizzoDomicilio=request.getParameter("indirizzo_domicilio_richiedente");
             String numeroCivicoDomicilio=null;
             if ( request.getParameter("civico_domicilio_richiedente")!=null)
                 numeroCivicoDomicilio=request.getParameter("civico_domicilio_richiedente");
             String capDomicilio=null;
             if ( request.getParameter("cap_domicilio_richiedente")!=null)
                 capDomicilio=request.getParameter("cap_domicilio_richiedente");
             String comuneDomicilio=null;
             if ( request.getParameter("comune_domicilio_richiedente")!=null)
                 comuneDomicilio=request.getParameter("comune_domicilio_richiedente");
             String provinciaDomicilio=null;
             if ( request.getParameter("provincia_domicilio_richiedente")!=null)
                 provinciaDomicilio=request.getParameter("provincia_domicilio_richiedente");
           
             //variabili genitore -genitore richiedente
             String tipologia_genitore=null;
             if (request.getParameter("tipologia_genitore") != null)
                 tipologia_genitore=request.getParameter("tipologia_genitore");
             String dipendente_presso_richiedente=null;
             if (request.getParameter("dipendente_presso_richiedente") != null)
                 dipendente_presso_richiedente=request.getParameter("dipendente_presso_richiedente");
             String rapporti_ateneo_salerno=null;
             if (request.getParameter("rapporti_ateneo_salerno_richiedente") != null)
                 rapporti_ateneo_salerno=request.getParameter("rapporti_ateneo_salerno_richiedente");
             String rapporti_comune_fisciano=null;
             if (request.getParameter("rapporti_comune_fisciano_richiedente") != null)
                 rapporti_comune_fisciano=request.getParameter("rapporti_comune_fisciano_richiedente");
             String status_lavorativo=null;
             if (request.getParameter("status_lavorativo_richiedente") != null)
                 status_lavorativo=request.getParameter("status_lavorativo_richiedente");
             Date scadenza_contratto=null;
             if (request.getParameter("scadenza_contratto_richiedente") != null)
                 request.getParameter("scadenza_contratto_richiedente");
             String categoria_appartenenza=null;
             if (request.getParameter("categoria_appartenenza_richiedente") != null)
                 categoria_appartenenza=request.getParameter("categoria_appartenenza_richiedente");
             String rapporto_parentela=null;
             if (request.getParameter("rapporto_parentela_richiedente") != null)
                 rapporto_parentela=request.getParameter("rapporto_parentela_richiedente");
             
             //variabili utente -genitore non richiedente
             Date dataNascita_genitore_non_richiedente=null;
             if ( request.getParameter("dataNascita_genitore_non_richiedente")!=null){
                 request.getParameter("dataNascita_genitore_non_richiedente");
             }
             String nome_genitore_non_richiedente=null;
             if ( request.getParameter("nome_genitore_non_richiedente")!=null)
                 nome_genitore_non_richiedente=request.getParameter("nome_genitore_non_richiedente");
             String cognome_genitore_non_richiedente;
             if ( request.getParameter("cognome_genitore_non_richiedente")!=null)
                 cognome_genitore_non_richiedente=request.getParameter("cognome_genitore_non_richiedente");
             String codice_fiscale_genitore_non_richiedente=null;
             if ( request.getParameter("codice_fiscale_genitore_non_richiedente")!=null)
                 codice_fiscale_genitore_non_richiedente=request.getParameter("codice_fiscale_genitore_non_richiedente");
             String comune_nascita_genitore_non_richiedente=null;
             if ( request.getParameter("comune_nascita_genitore_non_richiedente")!=null)
                 comune_nascita_genitore_non_richiedente=request.getParameter("comune_nascita_genitore_non_richiedente");
             String telefono_genitore_non_richiedente=null;
             if ( request.getParameter("telefono_genitore_non_richiedente")!=null)
                 telefono_genitore_non_richiedente= request.getParameter("telefono_genitore_non_richiedente");
             String cittadinanza_genitore_non_richiedente=null;
             if ( request.getParameter("cittadinanza_genitore_non_richiedente")!=null)
                 cittadinanza_genitore_non_richiedente=request.getParameter("cittadinanza_genitore_non_richiedente");
             String indirizzo_residenza_genitore_non_richiedente=null;
             if ( request.getParameter("indirizzo_residenza_genitore_non_richiedente")!=null)
                 indirizzo_residenza_genitore_non_richiedente=request.getParameter("indirizzo_residenza_genitore_non_richiedente");
             String numero_civico_residenza_genitore_non_richiedente=null;
             if ( request.getParameter("numero_civico_residenza_genitore_non_richiedente")!=null)
                 numero_civico_residenza_genitore_non_richiedente=request.getParameter("numero_civico_residenza_genitore_non_richiedente");
             String cap_residenza_genitore_non_richiedente=null;
             if ( request.getParameter("cap_residenza_genitore_non_richiedente")!=null)
                 cap_residenza_genitore_non_richiedente= request.getParameter("cap_residenza_genitore_non_richiedente");
             String comune_residenza_genitore_non_richiedente=null;
             if ( request.getParameter("comune_residenza_genitore_non_richiedente")!=null)
                 comune_residenza_genitore_non_richiedente=request.getParameter("comune_residenza_genitore_non_richiedente");
             String provincia_residenza_genitore_non_richiedente=null;
             if ( request.getParameter("provincia_residenza_genitore_non_richiedente")!=null)
                 provincia_residenza_genitore_non_richiedente=request.getParameter("provincia_residenza_genitore_non_richiedente");
             String indirizzo_domicilio_genitore_non_richiedente=null;
             if ( request.getParameter("indirizzo_domicilio_genitore_non_richiedente")!=null)
                 indirizzo_domicilio_genitore_non_richiedente=request.getParameter("indirizzo_domicilio_genitore_non_richiedente");
             String numero_civico_domicilio_genitore_non_richiedente=null;
             if ( request.getParameter("numero_civico_domicilio_genitore_non_richiedente")!=null)
                 numero_civico_domicilio_genitore_non_richiedente= request.getParameter("numero_civico_domicilio_genitore_non_richiedente");
             String cap_domicilio_genitore_non_richiedente=null;
             if ( request.getParameter("cap_domicilio_genitore_non_richiedente")!=null)
                 cap_domicilio_genitore_non_richiedente=request.getParameter("cap_domicilio_genitore_non_richiedente");
             String comune_domicilio_genitore_non_richiedente=null;
             if ( request.getParameter("comune_domicilio_genitore_non_richiedente")!=null)
                 comune_domicilio_genitore_non_richiedente=request.getParameter("comune_domicilio_genitore_non_richiedente");
             String provincia_domicilio_genitore_non_richiedente=null;
             if ( request.getParameter("provincia_domicilio_genitore_non_richiedente")!=null)
                 provincia_domicilio_genitore_non_richiedente=request.getParameter("provincia_domicilio_genitore_non_richiedente");
           
             //variabili genitore -genitore non richiedente
           
             String dipendente_presso_gentore_non_richiedente=null;
             if ( request.getParameter("dipendente_presso_gentore_non_richiedente")!=null)
                 dipendente_presso_gentore_non_richiedente=request.getParameter("dipendente_presso_gentore_non_richiedente");
             String condizione_lavorativa_genitore_non_richiedente=null;
             if ( request.getParameter("condizione_lavorativa_genitore_non_richiedente")!=null)
                 condizione_lavorativa_genitore_non_richiedente=request.getParameter("condizione_lavorativa_genitore_non_richiedente");
             Date tipo_contratto_genitore_non_richiedente=null;
             if ( request.getParameter("tipo_contratto_genitore_non_richiedente")!=null)
                 request.getParameter("tipo_contratto_genitore_non_richiedente");
             String sede_lavoro_genitore_non_richiedente=null;
             if ( request.getParameter("sede_lavoro_genitore_non_richiedente")!=null)
                 sede_lavoro_genitore_non_richiedente=request.getParameter("sede_lavoro_genitore_non_richiedente");
             String rapporto_parentela_genitore_non_richiedente=null;
             if ( request.getParameter("rapporto_parentela_genitore_non_richiedente")!=null)
                 rapporto_parentela_genitore_non_richiedente=request.getParameter("rapporto_parentela_genitore_non_richiedente");
             
             //variabili bambino
             Date data_nascita_bambino;
             if ( request.getParameter("data_nascita_bambino")!=null){
                 request.getParameter("data_nascita_bambino");
             }
             String nome_bambino=null;
             if ( request.getParameter("nome_bambino")!=null)
                 nome_bambino=request.getParameter("nome_bambino");
             String cognome_bambino=null;
             if ( request.getParameter("cognome_bambino")!=null)
                 cognome_bambino=request.getParameter("cognome_bambino");
             String codice_fiscale_bambino=null;
             if ( request.getParameter("codice_fiscale_bambino")!=null)
                 codice_fiscale_bambino=request.getParameter("codice_fiscale_bambino");
             String comune_nascita_bambino=null;
             if ( request.getParameter("comune_nascita_bambino")!=null)
                 comune_nascita_bambino= request.getParameter("comune_nascita_bambino");
             String cittadinanza_bambino=null;
             if ( request.getParameter("cittadinanza_bambino")!=null)
                 cittadinanza_bambino=request.getParameter("cittadinanza_bambino");
             String indirizzo_residenza_bambino=null;
             if ( request.getParameter("indirizzo_residenza_bambino")!=null)
                 indirizzo_residenza_bambino=request.getParameter("indirizzo_residenza_bambino");
             String numero_civico_residenza_bambino=null;
             if ( request.getParameter("numero_civico_residenza_bambino")!=null)
                 numero_civico_residenza_bambino=request.getParameter("numero_civico_residenza_bambino");
             String cap_residenza_bambino=null;
             if ( request.getParameter("cap_residenza_bambino")!=null)
                 cap_residenza_bambino= request.getParameter("cap_residenza_bambino");
             String comune_residenza_bambino=null;
             if ( request.getParameter("comune_residenza_bambino")!=null)
                 comune_residenza_bambino= request.getParameter("comune_residenza_bambino");
             String provincia_residenza_bambino=null;
             if ( request.getParameter("provincia_residenza_bambino")!=null)
                 provincia_residenza_bambino=request.getParameter("provincia_residenza_bambino");
             String indirizzo_domicilio_bambino=null;
             if ( request.getParameter("indirizzo_domicilio_bambino")!=null)
                 indirizzo_domicilio_bambino=request.getParameter("indirizzo_domicilio_bambino");
             String numero_civico_domicilio_bambino=null;
             if ( request.getParameter("numero_civico_domicilio_bambino")!=null)
                 numero_civico_domicilio_bambino=request.getParameter("numero_civico_domicilio_bambino");
             String cap_domicilio_bambino=null;
             if ( request.getParameter("cap_domicilio_bambino")!=null)
                 cap_domicilio_bambino=request.getParameter("cap_domicilio_bambino");
             String comune_domicilio_bambino=null;
             if ( request.getParameter("comune_domicilio_bambino")!=null)
                 comune_domicilio_bambino=request.getParameter("comune_domicilio_bambino");
             String provincia_domicilio_bambino=null;
             if ( request.getParameter("provincia_domicilio_bambino")!=null)
                 provincia_domicilio_bambino=request.getParameter("provincia_domicilio_bambino");
             String categoria_appartenenza_bambino=null;
             if ( request.getParameter("categoria_appartenenza_bambino")!=null)
                 categoria_appartenenza_bambino=request.getParameter("categoria_appartenenza_bambino");
             int classe;
             if ( request.getParameter("classe")!=null)
                 classe=Integer.parseInt(request.getParameter("classe"));
            
          
            
            try {
                if (controlDatiPersonali.setDatiGenitore(username_utente,dataNascita_genitore_non_richiedente, nome_bambino, cognome_bambino, codiceFiscale, email, comuneNascita, telefono_genitore_non_richiedente, cittadinanza_bambino, indirizzoResidenza, numeroCivicoResidenza, capResidenza, comuneResidenza, provinciaResidenza, indirizzoDomicilio, numeroCivicoDomicilio, capDomicilio, comuneDomicilio, provinciaDomicilio, null, null, null, dipendente_presso_richiedente, rapporti_ateneo_salerno, rapporti_comune_fisciano, status_lavorativo, scadenza_contratto, categoria_appartenenza,rapporto_parentela)){

                        // Set response content type
                        response.setContentType("text/html");
                        // New location to be redirected
                        response.setStatus(response.SC_MOVED_TEMPORARILY);
                        String modifica_ok = new String("prototipo/"+nome_pagina_chiamante+"?successo=ok");//reindirizzo al chiamante della servlet

                        
                        //reindirizzo verso index della tipologia di utente
                        response.setHeader("Location", modifica_ok);    
                      
                }//fine if   
                else {  
                    String modifica_error = new String("prototipo/"+nome_pagina_chiamante+"?successo=failed");
                    response.setHeader("Location", modifica_error);   
                }
            } catch (GenitoreException e) {
                // TODO Blocco di catch autogenerato
                LOG.log(Level.SEVERE, getServletName()+" Errore inserimento genitore", e);
            } catch (DBConnectionException e) {
                // TODO Blocco di catch autogenerato
                LOG.log(Level.SEVERE,getServletName()+ " Errore connessione database", e);
            }

    }
}