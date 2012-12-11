<%@ page import="atsilo.application.*,atsilo.entity.*"
 %>
 <%
 	// I dati account pe tutti gli utenti sono:
    	// Username: username dell'utente che, una volta creato, non può essere cambiato ma può essere visualizzato
    	// Password: non può essere visualizzata ma può essere cambiata
    	// Email:può essere visualizzata e cambiata
    	//tipologia genitore che specifica la tipologia del genitore nel caso l'utente fosse un genitore
    	
   	ControlDatiPersonali cdt= ControlDatiPersonali.getIstance();
    	Utente utente=cdt.getValoriUtente(username);//restituisce l'utente associato a quello username. (Utente generalizza le varie tipologie di utenti)
    	String email=utente.getEmail();
    	String tipologia_utente="";
    	if (tipologia.equals("genitore")) //se la pagina dati account e' di un genitore bisogna inserire nel form la tipologia del genitore
    		tipologia_utente=cdt.getDatiGenitore(utente.getCodiceFiscale()).getTipo();
 %>
