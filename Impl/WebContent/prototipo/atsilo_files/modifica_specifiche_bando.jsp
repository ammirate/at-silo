<%@ page import="atsilo.test.application.*,atsilo.entity.*"%>
<%

	String dataInizioBando = "";
	String dataFineBando = "";
	ControlGestioneBandoTest crtBando = ControlGestioneBandoTest.getIstance();
	if(crtBando.getBando() != null){
		if(crtBando.getBando().getDataInizio() != null){
			dataInizioBando = crtBando.getBando().getDataInizio();
		}
		if(crtBando.getBando().getDataFine() != null){
			dataFineBando = crtBando.getBando().getDataFine();
		}
		
	}
	
%>

