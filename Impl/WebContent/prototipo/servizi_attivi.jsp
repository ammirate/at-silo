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
include file="atsilo_files/sidebar_genitore.jsp"
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

	Seleziona il bambino per il quale vuoi mostrare i servizi :<br />
	<select style="width:150px;" name="figli">
	<option selected value="0">Seleziona</option>
	<option value="1" onclick="visualizza()">Figlio1</option>
	<option value="2">Figlio2</option>
	</select><br /><br />
	<div id="f1" style="visibility: hidden;">
	<table class="tabella">
	
	<tr>
	<td>Nome</td><td>Cognome</td><td>Piano Pasto</td><td>Orario Inzio</td><td>Orario Fine</td>
	</tr>
	
	<tr>
	<td>NOME</td><td>COGNOME</td><td>CLASSICO</td><td>8:00</td><td>15:00</td>
	</tr>
	
	<tr>
	<td>NOME</td><td>COGNOME</td><td>CLASSICO</td><td>8:00</td><td>15:00</td>
	</tr>
	
	</table>
</div>
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
<td class="bottom" width="209">&nbsp;2012 © Unisa</td><td align="right" class="bottom"></td>
</tr>
</tbody></table>


</body>
</html>