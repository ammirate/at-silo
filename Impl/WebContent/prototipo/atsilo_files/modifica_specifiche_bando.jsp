<%@ page import="atsilo.application.*,atsilo.entity.*"%>

<%
	String dataInizioBando = "";
	String dataFineBando = "";
	String dataInizioPresentazione = "";
	String dataFinePresentazione = "";
	String dataFineRinuncia = "";
	int posti = 0;

	ControlGestioneBando crtBando = ControlGestioneBando.getIstance();
	if ((crtBando.getBando() != null)) {
		if ((crtBando.getBando().getDataInizioBando() != null)) {
			dataInizioBando = crtBando.getBando().getDataInizioBando();
		}
		if ((crtBando.getBando().getDataFineBando() != null)) {
			dataFineBando = crtBando.getBando().getDataFineBando();
		}
		if ((crtBando.getBando().getDataInizioPresentazioneRinuncia() != null)) {
			dataInizioPresentazione = crtBando.getBando()
					.getDataInizioPresentazioneRinuncia();
		}
		if ((crtBando.getBando().getDataInizioPresentazioneRinuncia() != null)) {
			dataInizioPresentazione = crtBando.getBando()
					.getDataInizioPresentazioneRinuncia();
		}
		if ((crtBando.getBando().getDataFinePresentazioneRinuncia() != null)) {
			dataFinePresentazione = crtBando.getBando()
					.getDataFinePresentazioneRinuncia();
		}
		if ((crtBando.getBando().getDataFineRinuncia() != null)) {
			dataFineRinuncia = crtBando.getBando()
					.getDataFineRinuncia();
		}
		posti = crtBando.getBando().getPostiDisponibili();
	}
%>
