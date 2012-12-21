<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" %>
<%@page import="atsilo.util.AtsiloConstants"%>
<%String a = request.getRequestURI();
    String[] b = a.split("/");
    String temp_nome_chiamante = b[b.length-1];
	%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>@silo</title>
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
    <meta name="Author" content="Angelo G. Scafuro" />
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
<td align="center" height="0" nowrap="true" class="menuprimoselhbar"><a href="#">Home</a></td>
<td align="center" height="0" nowrap="true" class="menuprimohbar"><a href="forum/index.html">Forum</a></td>
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
<td align="left" class="menuprimosel">&nbsp;<b>'Area utente</b></td>
</tr>
<tr>
<td class="menusecondo">&nbsp;<a class="linkmenusecondo" href="registrazione.html">Registrazione</a></td>
</tr>
<tr>
<td class="menusecondo">&nbsp;<a class="linkmenusecondo" href="login.jsp">Login</a></td>
</tr>
<tr>
<td class="menusecondo">&nbsp;<a class="linkmenusecondo" href="password_dimenticata.html">Password dimenticata</a></td>
</tr>
</tbody></table>
<table class="lineadivisoria" width="100%" cellspacing="0" cellpadding="0" border="0">
<tbody><tr>
</tr>
</tbody></table>

<br>
<img width="209" border="0" alt="" height="1" src="atsilo_images/clearpixel.gif"></td><td class="content" valign="top" bgcolor="#ffffff">
<table width="100%">
<tbody><tr>
<td>
<div class="titolopagina">Accesso ai servizi dell'Asilo nido</div>
</td><td class="fasciadxvariabile"></td>
</tr>
</tbody></table>
<table cellspacing="10" cellpadding="0" border="0" width="100%">
<tbody><tr>
<td class="tplHeader">
<%
	if  (request.getParameter("successo") != null ) { 
		if (request.getParameter("successo").equals("failed")) {
			out.print("<script type=text/javascript>alert('Controlla le credenziali di accesso');window.location='"+temp_nome_chiamante+"';</script>");
		}
	}
%>	
<div id="formLogin">
 <form id="login" name="login" method="post" action="http://localhost:8080/Atsilo/ServletControlLogin">
  <p>
    Username
    <input type="text" name="username_login">
  </p>
  <p>
    Password
    <input  type="password" name="pswd_login">
  </p>
  <p>
    Tipologia utente
    <select name="tipologiaUtente">
      <option value="<% out.print(AtsiloConstants.CAT_GENITORE); %>" selected="selected">Genitore</option>
      <option value="<% out.print(AtsiloConstants.CAT_IMP_ASILO); %>">Impiegato Asilo</option>
      <option value="<% out.print(AtsiloConstants.CAT_IMP_DIR_STUDIO); %>">Impiegato Diritto allo studio</option>
      <option value="<% out.print(AtsiloConstants.CAT_EDUCATORE); %>">Educatore</option>
      <option value="<% out.print(AtsiloConstants.CAT_PSICOPEDAGOGO); %>">Psicopedagogo</option>
      <option value="<% out.print(AtsiloConstants.CAT_RESP_SCIENTIFICO); %>">Resp. Scienze Formazione</option>
      <option value="<% out.print(AtsiloConstants.CAT_RESP_QUEST); %>">Responsabile del Questionario</option>
       <option value="<% out.print(AtsiloConstants.CAT_DIRETTORE); %>">Direttore</option>
       <option value="<% out.print(AtsiloConstants.CAT_DELEGATO_RETTORE); %>">Delegato Rettore</option>
    </select>
  </p>
  <p>
    <input name="invia" type="submit" value="Accedi" ">
  </p>
</form>
</div>
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
<td class="bottom" width="209">&nbsp;2012 &copy; Unisa</td><td align="right" class="bottom"></td>
</tr>
</tbody></table>


</body>
</html>