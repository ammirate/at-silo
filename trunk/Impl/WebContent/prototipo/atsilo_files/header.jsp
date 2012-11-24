<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%
String a = request.getRequestURI();
String[] b = a.split("/");
String nf = b[b.length-1];
if(nf.equals("account_educatore.jsp"))
	out.println("<title>Account Educatore</title>");
else if(nf.equals("attivita_odierna.jsp"))
	out.println("<title>Attivit&agrave; Odierna</title>");
else if (nf.equals("registro_presenze.jsp"))
	out.println("<title>Registro Presenze</title>");
else if (nf.equals("storico_registro.jsp"))
	out.println("<title>Storico Registro</title>");
else if (nf.equals("visualizza_questionari.jsp"))
	out.println("<title>Visualizza Questionari</title>");
else if (nf.equals("index_psicopedagoga.jsp"))
	out.println("<title>Area Psicopedagogo</title>");
else if (nf.equals("inserisci_programma.jsp"))
	out.println("<title>Inserisci programma didattico</title>");
else if (nf.equals("modifica_programma.jsp"))
	out.println("<title>Modifica programma didattico</title>");	
else if (nf.equals("cancella_programma.jsp"))
	out.println("<title>Cancella programma didattico</title>");
else if (nf.equals("storico_registro_ped.jsp"))
	out.println("<title>Storico Registro Psicopedagogo</title>");
else if (nf.equals("storico_pagamenti.jsp"))
	out.println("<title>Storico Pagamenti</title>");
else if (nf.equals("fattura_mensile.jsp"))
	out.println("<title>Fattura Mensile</title>");
else if (nf.equals("servizi_attivi.jsp"))
	out.println("<title>Servizi Attivi</title>");
else if (nf.equals("modifica_orario.jsp"))
	out.println("<title>Modifica Orario</title>");
else if (nf.equals("modifica_pasti.jsp"))
	out.println("<title>Modifica Pasti</title>");

%>
<!-- Contents -->
	<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
	<meta http-equiv="Content-Language" content="it" />
	<meta name="description" content="Sistema @silo per la gestione Asilo Nido Aziendale "Roberto Mazzetti - Università Degli Studi Di Salerno/>	
    <meta name="keywords" content="@asilo atsilo at_silo università degli studi di salerno fisciano asilo nido aziendale" />
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
	<link type="text/css" href="atsilo_files/personalizzazioni.css" rel="stylesheet"><!-- Stili personalizzati -->
	<script type="text/javascript" src="atsilo_files/calendar.js"></script>
</head>


<body>
<table class="header" width="100%" cellspacing="0" cellpadding="0" border="0">
<tbody><tr>
<td align="left"><img src="atsilo_images/testata.jpg" align="middle" alt="" border="0"></td>
</tr>
</tbody></table>
<table class="percorsopagina1" width="100%" cellspacing="0" cellpadding="0" border="0">
<tbody><tr>
<td align="center" height="0" nowrap="true" class="menuprimoselhbar"><a href="index_educacatore.html">Home</a></td>
<td align="center" height="0" nowrap="true" class="menuprimohbar"><a href="forum/index.html">Forum</a></td>
<td align="center" height="0" nowrap="true" class="menuprimohbar"><a href="ricerca_utente.html">Ricerca utente</a></td>
<td align="center" height="0" nowrap="true" class="menuprimohbar"><a href="faq.html">FAQ</a></td>
</tr>
</tbody></table>