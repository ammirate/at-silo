
<%@ page language="java"  contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" session="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<script type="text/javascript">
function ControllaForm(){
	  var f = document.forms[0];
	  var n = f.elements.length;
	  
	  for(var i = 0; i < n; i++){
	    if(f.elements[i].value == ''){
	       alert('Errore: compilare tutti i campi');
	      return false;
	    }
	  }
	}

</script>
<%
	if  (request.getParameter("successo") != null && !temp_nome_chiamante.equals("registrazione_account.jsp") ) { 
		if (request.getParameter("successo").equals("failed")) {
			out.print("<script type=text/javascript>alert('Errore creazione nuovo account')</script>");
		}
	}
%>	

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!-- Contents -->
	<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
	<meta http-equiv="Content-Language" content="it" />
	<meta name="description" content="Sistema @silo per la gestione Asilo Nido Aziendale "Roberto Mazzetti - Universit&agrave; Degli Studi Di Salerno/>	
    <meta name="keywords" content="@asilo atsilo at_silo universit&agrave; degli studi di salerno fisciano asilo nido aziendale" />
    <title>Registrazione Account</title>
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
<td align="center" height="0" nowrap="true" class="menuprimoselhbar"><a href="#">Home</a></td>
<td align="center" height="0" nowrap="true" class="menuprimohbar"><a href="forum/index.html">Forum</a></td>
<td align="center" height="0" nowrap="true" class="menuprimohbar"><a href="faq.html">FAQ</a></td>
</tr>
</tbody></table>
<table width="100%" cellspacing="0" cellpadding="0" border="0">
  <tbody>
    <tr>
      <td class="breadcrumb " align="left"><p> </a></p>
        <p>&nbsp;</p></td>
    </tr>
  </tbody>
</table>
<%@
include file="atsilo_files/sidebar_index.jsp"
 %>
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
    
    	

<form method="post" name="creazione_account" action="http://localhost:8080/Atsilo/ServletRegistrazioneAccount" OnSubmit="return ControllaForm(this)">
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
       	 	</td>
          </tr>
           <tr> 
        	<td>Numero Cellulare</td>
       	 	<td><input name="num_cellulare" type="text" id="num_cellulare" maxlength="15"  /></td>
          </tr>
          <tr> 
        	<td>Selezionare profilo di appartenenza</td>
       	 	<td><select name="tipologia">
       	 	  <option value="personale_studenti" selected="selected">Personale e studenti dell'Ateneo</option>
       	 	  <option value="residenti_fisciano">Residenti nel Comune di Fisciano</option>
       	 	  <option value="altro">Altre tipologie di utenze</option>
            </select></td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td><strong>N.B. A questo indirizzo di posta elettronica verranno inviate le credenziali di accesso</strong></td></tr>
          <tr> 
        	<td></td>
       	 	<td><input type="submit" name="invia" value="Registrati"" />
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
<td class="tplTitolo"><b> </b></td>
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
</td>
<%@
include file="atsilo_files/footer.jsp"
 %>


</body>
</html>