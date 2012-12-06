<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" %>
    
    <% 
//distrugge la sessione
HttpSession sessione = request.getSession(); 
sessione.invalidate();
 
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>@silo</title>
<!-- Contents -->
	<meta http-equiv="refresh" content="1;url=index.html" />
	<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
	<meta http-equiv="Content-Language" content="it" />
	<meta name="description" content="Sistema @silo per la gestione Asilo Nido Aziendale "Roberto Mazzetti - Universit&agrave; Degli Studi Di Salerno/>	
    <meta name="keywords" content="@asilo atsilo at_silo universit&agrave; degli studi di salerno fisciano asilo nido aziendale" />

    <!-- Res -->
	<link type="text/css" href="atsilo_files/template.css" rel="stylesheet">
	<link type="text/css" href="atsilo_files/unisa.css" rel="stylesheet">
</head>


<body>
<table class="header" width="100%" cellspacing="0" cellpadding="0" border="0">
<tbody><tr>
<td align="left"><img src="atsilo_images/testata.jpg" align="middle" alt="" border="0"></td>
</tr>
</tbody></table>
<table class="percorsopagina1" width="100%" cellspacing="0" cellpadding="0" border="0">

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

</td>
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
<tbody>
<tr>
  <td>
  <table cellspacing="0" cellpadding="0" border="0">
  <tbody><tr>
  <td class="tplTitolo"><b>Disconnessione dal sistema in corso...</b></td>
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
<%@
include file="atsilo_files/footer.jsp"
 %>


</body>
</html>