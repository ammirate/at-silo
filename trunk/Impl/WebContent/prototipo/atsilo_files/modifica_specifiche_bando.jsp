<%@ page import="atsilo.application.*,atsilo.entity.*"%>
<%

	String dataInizioBando = "";
	String dataFineBando = "";
	ControlGestioneBando crtBando = ControlGestioneBando.getIstance();
	if((crtBando.getBando().getDataInizio() != null)){
		dataInizioBando = crtBando.getBando().getDataInizio();
	}
	if((crtBando.getBando().getDataFine() != null)){
		dataFineBando = crtBando.getBando().getDataFine();
	}
	
%>

<%!
String readOnly="readonly='readonly'";
String  action="";
String nome_bottone="Modifica";
	//metodo invocato alla pressione del tasto modifica
	public void CambiaValoriForm() {
			readOnly="";
			action="http://localhost:8080/Atsilo/ServletModificaBando";
			nome_bottone="Salva";
	}
%>