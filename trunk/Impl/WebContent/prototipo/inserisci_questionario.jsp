<%@
	include file="atsilo_files/header.jsp"
%>
<script type="text/javascript">
<!--

var arrInput = new Array(0);
  var arrInputValue = new Array(0);
v=1;
function addInput(id) {
  //arrInput.push(createInput(arrInput.length));
  arrInput.push(arrInput.length);
  //arrInputValue.push(arrInputValue.length);
  display(id);
}

function display(id) {
//  document.getElementById('parah').innerHTML="";
 // for (intI=0;intI<arrInput.length;intI++) {
    document.getElementById(id).innerHTML+="<tr><td> Opzione <td> <input type=text name=opzione"+v+"[]>";
  //}
}
function addDomanda() {
	  //arrInput.push(createInput(arrInput.length));
	  arrInput.push(arrInput.length);
	  //arrInputValue.push(arrInputValue.length);
	  arrInputValue.push("");
	  displayD(v);
	  v++;
	}

	function displayD(v) {
	//  document.getElementById('parah').innerHTML="";
	 // for (intI=0;intI<arrInput.length;intI++) {
		 var nome = "parah" + v;
	    document.getElementById('domanda').innerHTML+="<br><br><fieldset><table id="+nome+"><tr><td><h3>Domanda: </h3><td><input type=text name='domanda"+v+"' size=80><tr><td> Opzione  <td> <input type=text name=opzione"+v+"[] ></table><br><br><input type=button value='Aggiungi Campo' onclick=\"addInput('"+nome+"');\"></fieldset>";
	  //}
	}


// -->
</script>
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

<h2 align=center >Inserisci nuovo Questionario</h2>
<br><br>
<form action="http://localhost:8080/Atsilo/servletControlQuestionario" method="POST">
	<H2>Titolo Questionario:</H2> <input type=text name="titolo" size=100 style="height: 25px; font-size: 22px; font-family: Times; font-weight: bold;"><br><br><BR><BR>
	Descrizione:<br>
	<textarea rows="10" cols="80" name=descrizione></textarea><br><br>
	<div id=domanda>
	<fieldset>
		<table id="parah">
			<tr><td><h3>Domanda: </h3><td><input type=text name=domanda size=80>
			<tr><td> Opzione  <td> <input type=text name=opzione1[] >
		</table>
		<br><br>
		<Select name=tipo>
		<option>Seleziona</option>
		<option value=1>Selezione Multipla</option>
		<option value=2>Selezione Unica</option>
		<option value=3>Risposta Aperta</option>
		</Select>
	<input type=button value="Aggiungi Campo" onclick="display('parah');">
		
	</fieldset>
	</div>
	<br><br>
	<input type=button value="Aggiungi Domanda" onclick="addDomanda()">
	<center><input type=submit value="Crea Questionario"></center>
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
<td class="bottom" width="209">&nbsp;2012 © Unisa</td><td align="right" class="bottom"></td>
</tr>
</tbody></table>


</body>
</html>