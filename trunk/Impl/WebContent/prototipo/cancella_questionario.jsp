
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="atsilo.application.ControlQuestionario"%>
<%@page import="atsilo.entity.*" %>
<%@page import="java.util.*" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Cancella Questionario</title>
<!-- Contents -->
	<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
	<meta http-equiv="Content-Language" content="it" />
	<meta name="description" content="Sistema @silo per la gestione Asilo Nido Aziendale "Roberto Mazzetti - UniversitÃ  Degli Studi Di Salerno/>	
    <meta name="keywords" content="@asilo atsilo at_silo universitÃ  degli studi di salerno fisciano asilo nido aziendale" />
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
</head>


<body>
<table class="header" width="100%" cellspacing="0" cellpadding="0" border="0">
<tbody><tr>
<td align="left"><img src="atsilo_images/testata.jpg" align="middle" alt="" border="0"></td>
</tr>
</tbody></table>
<table class="percorsopagina1" width="100%" cellspacing="0" cellpadding="0" border="0">
<tbody><tr>
<td align="center" height="0" nowrap="true" class="menuprimoselhbar"><a href="index_delegato_rettore.html">Home</a></td>
<td align="center" height="0" nowrap="true" class="menuprimohbar"><a href="forum/index.html">Forum</a></td>
<td align="center" height="0" nowrap="true" class="menuprimohbar"><a href="forum/ricerca_utente.html">Ricerca utente</a></td>
<td align="center" height="0" nowrap="true" class="menuprimohbar"><a href="faq.html">FAQ</a></td>
</tr>
</tbody></table>
<table width="100%" cellspacing="0" cellpadding="0" border="0">
<tbody><tr>
<td class="breadcrumb " align="left"><p> </a></p>
  <p>&nbsp;</p></td>
</tr>
</tbody></table>
<table class="colonnasx" width="100%" cellspacing="0" cellpadding="0" border="0">
<tbody><tr>
<td valign="top" class="colonnasx" width="209">
<table class="lineadivisoria" width="100%" cellspacing="0" cellpadding="0" border="0">
<tbody><tr>
<td class="top_menu_sx">
<div class="user">

<p></p>
</div>
<div class="vista_menu">
</div>
</td>
</tr>
</tbody></table>
<table class="lineadivisoria" width="100%" cellspacing="0" cellpadding="0" border="0">
<tbody><tr>
<td align="left" class="menuprimosel">&nbsp;<b>'Area Utente</b></td>
</tr>
<tr>
<td class="menusecondo">&nbsp;<a class="linkmenusecondo" href="account_educatore.html">Dati Account</a></td>
</tr>
<tr>
<td class="menusecondo">&nbsp;<a class="linkmenusecondo" href="logout.jsp">Logout</a></td>
</tr>
</tbody></table>
<table class="lineadivisoria" width="100%" cellspacing="0" cellpadding="0" border="0">
<tbody><tr>
</tr>
</tbody></table>
<table class="lineadivisoria" width="100%" cellspacing="0" cellpadding="0" border="0">
  <tbody><tr>
</tr>
</tbody></table>
<table class="lineadivisoria" width="100%" cellspacing="0" cellpadding="0" border="0">
<tbody><tr>
<td align="left" class="menuprimosel">&nbsp;<b>Questionari</b></td>
</tr>
<tr>
<td class="menusecondo">&nbsp;<a class="linkmenusecondo" href="visualizza_questionari.html">Visualizza</a></td>
</tr>
<tr>
<td class="menusecondo">&nbsp;<a class="linkmenusecondo" href="inserisci_questionario.html">Inserisci</a></td>
</tr>
<tr>
<td class="menusecondo">&nbsp;<a class="linkmenusecondo" href="modifica_questionario.html">Modifica</a></td>
</tr>
<tr>
<td class="menusecondo">&nbsp;<a class="linkmenusecondo" href="cancella_questionario.html">Cancella</a></td>
</tr>
</tbody></table>

<br>
<img width="209" border="0" alt="" height="1" src="atsilo_images/clearpixel.gif"></td><td class="content" valign="top" bgcolor="#ffffff">
<table width="100%">
<tbody><tr>
<td>
<div class="titolopagina">Benvenuto XXX</div>
</td><td class="fasciadxvariabile"></td>
</tr>
</tbody></table>

<table cellspacing="10" cellpadding="0" border="0" width="100%">
<tbody><tr>
<td class="tplHeader">
<table>
<tr>
	<th>N°</th><th>Titolo Questionario</th><th>Data Inizio</th><th>Data Fine</th><th>Opzioni</th>
</tr>

<%
	Questionario quest1 = new Questionario("questa è una prova", "no", "linda è antipatica?", 10, null, null);
	Questionario quest2 = new Questionario("questa è una prova2", "no", "giulio è antipatico?", 12, null, null);
//	ControlQuestionario q = null;
//	q=q.getIstance();
	List<Questionario> list = new ArrayList<Questionario>();
	list.add(quest1);
	list.add(quest2);
			//q.getAllQuestionari();
	if(list.size()==0) out.println("<tr><td colspan=5>Non sono presenti Questionari in archivio.</td></tr>");
	for(int i=0; i<list.size(); i++)
	{
		out.println("<tr><td>"+i+"<td>"+list.get(i).getNome()+"<td>" + list.get(i).getPeriodo_inizio() + "<td>" + list.get(i).getPeriodo_fine() + "<td align=center style='padding: 10px'><a href='modifica_questionario.jsp?id="+list.get(i).getId()+"'><img src='atsilo_images/modifica.png'></a><a href='cancella_questionario.jsp?id="+list.get(i).getId()+"'><img src='atsilo_images/cancella.png'></a></tr>");
	}
%>
</table>
<p><strong><br />
</strong></p>
<p>&nbsp;</p></td>
</tr>
<tr>
<td>
<table cellspacing="0" cellpadding="0" border="0">
<tbody><tr>
<td class="tplTitolo"><b></b></td>
</tr>
</tbody></table>
</td>
</tr>
<tr>
<td>
<table cellspacing="0" cellpadding="0" border="0">
<tbody><tr>
<td>
<table width="598" cellspacing="0" cellpadding="0" border="0"></table>
</td>
</tr>
<tr>
<td><img border="0" alt="" height="20" width="1" src="atsilo_files/clearpixel.gif"></td>
</tr>
</tbody></table>
</td>
</tr>
<tr>
<td class="tplHeader"></td>
</tr>
</tbody></table>
</td><td class="fasciadxvariabile"></td>
</tr>
<tr>
<td class="bottom" width="209">&nbsp;2012 Â© Unisa</td><td align="right" class="bottom"></td>
</tr>
</tbody></table>


</body>
</html>