<%@
	include file="atsilo_files/header.jsp"
%>

<table width="100%" cellspacing="0" cellpadding="0" border="0">
<tbody><tr>
<td class="breadcrumb " align="left"><p> </a></p>
  <p>&nbsp;</p></td>
</tr>
</tbody></table>
<%@
include file="atsilo_files/sidebar_scienzeformazione.jsp"
 %>
 

<br>
<img width="209" border="0" alt="" height="1" src="atsilo_images/clearpixel.gif"></td><td class="content" valign="top" bgcolor="#ffffff">
<table width="100%">
<tbody><tr>
<td>
<div class="titolopagina">Benvenuto XXX</div>
</td><td class="fasciadxvariabile"></td>
</tr>
</tbody></table>

<!-- INIZIO PAGINA JSP/HTML -->

<form action="<%=request.getContextPath()%>/ServletControlTirocinantiInserisci" method="post">
Inserisci un Tirocinante<br />
	<table class="tabelle_form">
	<tr>
	<td>Nome</td><td><input type="text" name="nome"/></td>
	</tr>
	<tr>
	<td>Cognome</td><td><input type="text" name="cognome"/></td>
	</tr>
	<tr>
	<td>Codice Fiscale</td><td><input type="text" name="cf"/></td>
	</tr>
	<tr>
	<td>Telefono</td><td><input type="text" name="telefono"/></td>
	</tr>
	<tr>
	<td>Email</td><td><input type="text" name="email"/></td>
	</tr>
	<tr>
	<td>Data di Nascita</td><td><input type="text" name="giorno"/ value="GG" size="2">/<input type="text" name="mese"/ value="MM" size="2">/<input type="text" name="anno"/ value="YYYY" size="4"></td>
	</tr>
	<tr>
	<td>Comune di Nascita</td><td><input type="text" name="comunenascita"/></td>
	</tr>
	<tr>
	<td>Indirizzo di Residenza</td><td><input type="text" name="indirizzo"/></td>
	</tr>
	<tr>
	<td>Titolo di Studi</td><td><input type="text" name="titolo"/></td>
	</tr>
	<tr>
	<td>Ore Lavoro</td><td><input type="text" name="orelavoro"/></td>
	</tr>	
	
	
	</table>
<input type="submit" value="Salva" /><input type="reset" value="Annulla" />


</form>

<!-- FINE PAGINA JSP/HTML -->

<table cellspacing="10" cellpadding="0" border="0" width="100%">
<tbody><tr>
<td class="tplHeader">


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
<td class="bottom" width="209">&nbsp;2012 &copy; Unisa</td><td align="right" class="bottom"></td>
</tr>
</tbody></table>


</body>
</html>