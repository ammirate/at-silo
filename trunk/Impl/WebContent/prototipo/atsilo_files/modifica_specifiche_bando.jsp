<%@ page import="atsilo.application.*,atsilo.entity.*";%>
<%
	String dataInizioBando = "";
	String dataFineBando = "";
	ControlGestioneBando crtBando = ControlGestioneBando.getIstance();
	Bando band = crtBando.getBando();
	if((band.getDataFine() != null)){
		dataInizioBando = band.getDataInizio();
	}
	if((band.getDataFine() != null)){
		dataFineBando = band.getDataFine();
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