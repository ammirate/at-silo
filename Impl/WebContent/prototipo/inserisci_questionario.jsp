<%@
	include file="atsilo_files/header.jsp"
%>
<link rel="stylesheet" type="text/css" href="atsilo_files/toolTip/style.css" />

<script type="text/javascript" language="javascript" src="atsilo_files/toolTip/script.js"></script>
<script type="text/javascript" src="atsilo_files/questionari.js"></script>
<script type="text/javascript" src="atsilo_files/calendar.js"></script>
<table width="100%" cellspacing="0" cellpadding="0" border="0">
<tbody><tr>
<td class="breadcrumb " align="left"><p> </a></p>
  <p>&nbsp;</p></td>
</tr>
</tbody></table>
<%@
include file="atsilo_files/autoinclude_sidebar_giusta_tipologia.jsp"
 %>

<br>
<img width="209" border="0" alt="" height="1" src="atsilo_images/clearpixel.gif"></td><td class="content" valign="top" bgcolor="#ffffff">
<table width="100%">
<tbody><tr>
<td>
</td><td class="fasciadxvariabile"></td>
</tr>
</tbody></table>

<table cellspacing="10" cellpadding="0" border="0" width="100%" onload='set()'>
<tbody><tr>
<td class="tplHeader">

<h2 align=center >Inserisci nuovo Questionario</h2>
<br><br>
<form action="http://localhost:8080/Atsilo/servletControlQuestionario" method="POST" >
<div id=formdomande>
	<H2>Titolo Questionario:</H2> <input type=text name="titolo" size=100 style="height: 25px; font-size: 22px; font-family: Times; font-weight: bold;"><br><br><BR><BR>
	<div id=datachooser2 >
		<table>
			<tr>
				<td><b>Data Inizio: </b>	<td><input type=text name=dataIn onclick="Calendar.show(this, '%d/%m/%Y', true)" onfocus="Calendar.show(this, '%d/%m/%Y', true)" onblur="Calendar.hide()" />
			<tr>
				<td><b>Data Fine: </b> <td><input type=text name=dataOu onclick="Calendar.show(this, '%d/%m/%Y', true)" onfocus="Calendar.show(this, '%d/%m/%Y', true)" onblur="Calendar.hide()" />	
		</table>
		</div>
	<br><br><br><br>
	
	
	<b>Descrizione:</b>
	
	<br><br>
	<textarea rows="10" cols="80" name=descrizione></textarea><br><br>
	<div>
	<br><br>
	<fieldset>
		<table id="parah0">
			<tr><td><h3>Domanda: </h3><td><input type=text name=domanda0  size=80>
			<tr><td> Opzione  <td> <input type=text name=opzione0[] >
		</table>
		<br><br>
		<Select name=tipo0 onchange="abilitaAdd(this.value, this.name, 0)">
	
		<option value=1 >Selezione Multipla</option>
		<option value=2>Selezione Unica</option>
		<option value=3 selected>Risposta Aperta</option>
		</Select>
	<input type=button id='addCampo0' disabled = disabled value="Aggiungi Campo" onclick="display('parah0', 0);">
	</fieldset>
	
	</div>
	
	<br><br>
</div>
	<input type=button value="Aggiungi Domanda" onclick="addDomanda()">
	
	<center><input type=submit value="Crea Questionario" onclick="return controlData();"></center>
</form>
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