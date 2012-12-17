<%@ page language="java"  contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" session="true"%>
<!--<-%@ page errorPage="errore_accesso.html" %>-->

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<% 
	//setto variabili di sessione
	HttpSession sessione = request.getSession();
	String username=(String)sessione.getAttribute("username");
	String tipologia=(String)sessione.getAttribute("tipologia_utente");
	//sessione.setAttribute("homepage", "index_impiegato.jsp");
	String homepage=(String)sessione.getAttribute("homepage");
	
	String a = request.getRequestURI();
    String[] b = a.split("/");
    String temp_nome_chiamante = b[b.length-1];
    sessione.setAttribute("nome_pagina_chiamante", temp_nome_chiamante);
	
	//controllo se utente ha effettuato il login
	//se username non settato 
	/*
	if (username.isEmpty() )
		response.sendRedirect("errore_accesso.htm");
	*/


if(temp_nome_chiamante.equals("account_educatore.jsp"))
	out.println("<title>Account Educatore</title>");
else if(temp_nome_chiamante.equals("attivita_odierna.jsp"))
	out.println("<title>Attivit&agrave; Odierna</title>");
else if (temp_nome_chiamante.equals("registro_presenze.jsp"))
	out.println("<title>Registro Presenze</title>");
else if (temp_nome_chiamante.equals("storico_registro.jsp"))
	out.println("<title>Storico Registro</title>");
else if (temp_nome_chiamante.equals("visualizza_questionari.jsp"))
	out.println("<title>Visualizza Questionari</title>");
else if (temp_nome_chiamante.equals("index_psicopedagoga.jsp"))
	out.println("<title>Area Psicopedagogo</title>");
else if (temp_nome_chiamante.equals("inserisci_programma.jsp"))
	out.println("<title>Inserisci programma didattico</title>");
else if (temp_nome_chiamante.equals("modifica_programma.jsp"))
	out.println("<title>Modifica programma didattico</title>");	
else if (temp_nome_chiamante.equals("cancella_programma.jsp"))
	out.println("<title>Cancella programma didattico</title>");
else if (temp_nome_chiamante.equals("storico_registro_ped.jsp"))
	out.println("<title>Storico Registro Psicopedagogo</title>");
else if (temp_nome_chiamante.equals("storico_pagamenti.jsp"))
	out.println("<title>Storico Pagamenti</title>");
else if (temp_nome_chiamante.equals("fattura_mensile.jsp"))
	out.println("<title>Fattura Mensile</title>");
else if (temp_nome_chiamante.equals("servizi_attivi.jsp"))
	out.println("<title>Servizi Attivi</title>");
else if (temp_nome_chiamante.equals("modifica_orario.jsp"))
	out.println("<title>Modifica Orario</title>");
else if (temp_nome_chiamante.equals("modifica_pasti.jsp"))
	out.println("<title>Modifica Pasti</title>");
else if (temp_nome_chiamante.equals("stato_pagamenti.jsp"))
	out.println("<title>Stato Pagamenti</title>");
else if (temp_nome_chiamante.equals("fattura_pagamenti.jsp"))
	out.println("<title>Fattura Pagamenti</title>");
else if (temp_nome_chiamante.equals("registro_pagamenti.jsp"))
	out.println("<title>Registra Pagamento</title>");
else if (temp_nome_chiamante.equals("extra.jsp"))
	out.println("<title>Extra</title>");
else if (temp_nome_chiamante.equals("modifica_orario_servizio.jsp"))
	out.println("<title>Modifica Orario</title>");
else if (temp_nome_chiamante.equals("modifica_piano_pasto.jsp"))
	out.println("<title>Modifica Piano Pasto</title>");
else if (temp_nome_chiamante.equals("visualizza_orario_servizi.jsp"))
	out.println("<title>Visualizza Orario</title>");
else if (temp_nome_chiamante.equals("approva_richieste.jsp"))
	out.println("<title>Approva Richieste</title>");
else if (temp_nome_chiamante.equals("visualizza_tirocinanti.jsp"))
	out.println("<title>Visualizza Tirocinanti</title>");
else if (temp_nome_chiamante.equals("richieste_tirocinanti.jsp"))
	out.println("<title>Richiedi Tirocinante</title>");
else if (temp_nome_chiamante.equals("inserimento_giudizio_tirocinante.jsp"))
	out.println("<title>Giudizio Tirocinante</title>");	
else if (temp_nome_chiamante.equals("inserisci_tirocinante.jsp"))
	out.println("<title>Inserisci Tirocinante</title>");	
else if (temp_nome_chiamante.equals("modifica_tirocinante.jsp"))
	out.println("<title>Modifica Tirocinante</title>");	
else if (temp_nome_chiamante.equals("approva_tirocinante.jsp"))
	out.println("<title>Approva Tirocinante</title>");	
else if (temp_nome_chiamante.equals("inserisci_fascia_oraria.jsp"))
	out.println("<title>Inserisci Fascia Oraria</title>");	
else if (temp_nome_chiamante.equals("modifica_fascia_oraria.jsp"))
	out.println("<title>Modifica Fascia Oraria</title>");	
else if (temp_nome_chiamante.equals("cancella_fascia_oraria.jsp"))
	out.println("<title>Cancella Fascia Oraria</title>");	
else if (temp_nome_chiamante.equals("inserisci_classe.jsp"))
	out.println("<title>Inserisci Classe</title>");	
else if (temp_nome_chiamante.equals("cancella_classe.jsp"))
	out.println("<title>Cancella Classe</title>");	
else if (temp_nome_chiamante.equals("assegna_classe.jsp"))
	out.println("<title>Assegna Classe</title>");
else if (temp_nome_chiamante.equals("lista_punteggio.jsp"))
	out.println("<title>Lista Punteggi</title>");	
else if (temp_nome_chiamante.equals("index_delegato.jsp"))
	out.println("<title>Area Delegato Rettore</title>");
else if (temp_nome_chiamante.equals("convalida_classe_bambino.jsp"))
	out.println("<title>Convalida Classe</title>");	
else if (temp_nome_chiamante.equals("invia_domanda_confermata.jsp"))
	out.println("<title>Invia Conferma</title>");	
else if (temp_nome_chiamante.equals("lista_domanda_confermata.jsp"))
	out.println("<title>Lista Domande</title>");
else if (temp_nome_chiamante.equals("graduatoria_ammessi.jsp"))
	out.println("<title>Graduatoria Ammessi</title>");	
else if (temp_nome_chiamante.equals("graduatoria_rifiutati.jsp"))
	out.println("<title>Graduatoria Rifiutati</title>");	
%>
<!-- Contents -->
	<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
	<meta http-equiv="Content-Language" content="it" />
	<meta name="description" content="Sistema @silo per la gestione Asilo Nido Aziendale "Roberto Mazzetti - Universit&agrave; Degli Studi Di Salerno/>	
    <meta name="keywords" content="@asilo atsilo at_silo universit&agrave; degli studi di salerno fisciano asilo nido aziendale" />
<!-- imCustomHead -->
	<meta http-equiv="Expires" content="0" />
	<meta name="Resource-Type" content="document" />
	<meta name="Distribution" content="global" />
	<meta name="Robots" content="index, follow" />
	<meta name="Revisit-After" content="21 days" />
	<meta name="Rating" content="general" />
	<!-- Others -->
	<meta http-equiv="ImageToolbar" content="False" />
	<meta name="MSSmartTagsPreventParsing" content="True" />
	<link rel="Shortcut Icon" href="atsilo_files/favicon.ico" type="image/x-icon" />
    <!-- Res -->
	<link type="text/css" href="atsilo_files/template.css" rel="stylesheet">
	<link type="text/css" href="atsilo_files/unisa.css" rel="stylesheet">
	<link type="text/css" href="atsilo_files/personalizzazioni.css" rel="stylesheet">
	<link rel="stylesheet" href="atsilo_files/docs/styleditor.css" type="text/css">

	
</head>


<body>
<table class="header" width="100%" cellspacing="0" cellpadding="0" border="0">
<tbody><tr>
<td align="left"><img src="atsilo_images/testata.jpg" align="middle" alt="" border="0"></td>
</tr>
</tbody></table>
<table class="percorsopagina1" width="100%" cellspacing="0" cellpadding="0" border="0">
<tbody><tr>
<td align="center" height="0" nowrap="true" class="menuprimoselhbar"><a href="<% out.print(homepage);%>">Home</a></td>
<td align="center" height="0" nowrap="true" class="menuprimohbar"><a href="forum/index.html">Forum</a></td>
<td align="center" height="0" nowrap="true" class="menuprimohbar"><a href="ricerca_utente.jsp">Ricerca utente</a></td>
<td align="center" height="0" nowrap="true" class="menuprimohbar"><a href="faq.html">FAQ</a></td>

<!--Cambia immagine da notifica_off a notifica_on a seconda di se ci sono o meno nuove comunicazioni da leggere -->

<td align="center" height="0" nowrap="true" ><a href="comunicazioni.jsp"><img src="atsilo_images/notifica_off.gif" height="35"></a></td>
</tr>
</tbody></table>