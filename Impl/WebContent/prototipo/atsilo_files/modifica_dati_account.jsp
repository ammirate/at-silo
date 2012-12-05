<%@ page import="atsilo.test.application.*,atsilo.entity.*"
 %>
 <% 
	ControlDatiPersonali cdt= ControlDatiPersonali.getIstance();
 	Utente utente=cdt.getUtenteFromUsername(username);
 	String email=utente.getEmail();
 	String tipologia_utente;
 	if (tipologia.equals("genitore")) //se la pagina dati account e' di un genitore bisogna inserire nel form la tipologia del genitore
 		tipologia_utente=cdt.getDatiGenitore(utente.getCodiceFiscale()).getTipo();
 	else{ //in questo caso verra' inserita nel form la tipologia di persoanle
 		tipologia_utente=tipologia;//la variabile di sessione tipologia utente, che contiene il tipo di personale
 	}

 %>
 <%!
 	String readOnly="readonly='readonly'";
	String  action="";
	String nome_bottone="Modifica";
 	
	//metodo invocato alla pressione del tasto modifica
	void cambioValoriForm(){
		readOnly=" ";
		action="http://localhost:8080/Atsilo/ServletModificaDatiAccount";
		nome_bottone="Salva";
	}
 %>