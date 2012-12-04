<%@ page import="atsilo.test.application.*,atsilo.entity.*";
 %>
 <% 
	ControlDatiPersonali cdt= ControlDatiPersonali.getIstance();
 	Utente utente=cdt.getUtenteFromUsername(username);
 	String email=utente.getEmail();
 	String tipologia_genitore=cdt.getDatiGenitore(utente.getCodiceFiscale()).getTipo();
 	

 %>
 <%!
 	String readOnly="readonly='readonly'";
	String  action="";
	String nome_bottone="Modifica";
 	
	//metodo invocato alla pressione del tasto modifica
	void CambioValoriForm(){
		readOnly=" ";
		action="http://localhost:8080/Atsilo/ServletModificaDatiAccount";
		nome_bottone="Salva";
	}
 %>