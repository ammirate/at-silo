<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" %>
<% String messaggio=""; %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>@silo</title>
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
<td class="menusecondosel">&nbsp;<a class="linkmenusecondo" href="registrazione.html">Registrazione</a></td>
</tr>
<tr>
<td class="menusecondo">&nbsp;<a class="linkmenusecondo" href="login.html">Login</a></td>
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
	<div id="FormCreazioneAccount">
    
    	<form name="creazione_account" action="" method="post">
        <table class="tabelle_form">
          <tr> 
        	<td>Codice Fiscale</td>
       	 	<td><input name="cf" type="text" maxlength="16"  /></td>
          </tr>
          <tr> 
        	<td>Cognome</td>
       	 	<td><input name="cognome" type="text" id="cognome" maxlength="20"  /></td>
          </tr>
          <tr> 
        	<td>Nome</td>
       	 	<td><input name="nome" type="text" id="nome" maxlength="25"  /></td>
          </tr>
          <tr> 
        	<td>Indirizzo email</td>
       	 	<td><input name="indirizzo_email" type="text" id="indirizzo_email"  />
       	 	*</td>
          </tr>
           <tr> 
        	<td>Numero Cellulare</td>
       	 	<td><input name="num_cellulare" type="text" id="num_cellulare" maxlength="15"  /></td>
          </tr>
          <tr> 
        	<td>Selezionare profilo di appartenenza</td>
       	 	<td><select>
       	 	  <option value="personale" selected="selected">Personale e studenti dell'Ateneo</option>
       	 	  <option value="fisciano">Residenti nel Comune di Fisciano</option>
       	 	  <option value="altri">Altre tipologie di utenze</option>
            </select></td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td><strong>N.B. A questo indirizzo di posta elettronica verranno inviate le credenziali di accesso</strong></td></tr>
          <tr> 
        	<td></td>
       	 	<td><input type="submit" name="invia" value="Registrati"  onclick="parent.location.href='dati_account.jsp'" />
                <input type="reset" name="reset" value="Reset" />
            </td>
          </tr>
          
         </table>
        </form>
        
    </div>



</td>
</tr>
<tr>
<td>
<table cellspacing="0" cellpadding="0" border="0">
<tbody><tr>
<td class="tplTitolo"><b> <%=messaggio %></b></td>
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
<td class="bottom" width="209">&nbsp;2012 © Unisa</td><td align="right" class="bottom"></td>
</tr>
</tbody></table>
<% RegistrazioneUtente() %>

</body>
</html>