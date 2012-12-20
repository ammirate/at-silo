<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="atsilo.util.AtsiloConstants,atsilo.application.*,atsilo.entity.*, java.sql.*"%>
<%@
	include file="atsilo_files/header.jsp"
%>

<script type="text/javascript">

function checkDate(name, field) {
	var date = field.value;
	var reg = /^([0-9]{4})\-(0[1-9]|1[012])\-(0[1-9]|[12][0-9]|3[01])/;
	
	var m = date.match(reg);
	
	if (m == null) {
		alert('Campo ' + name + ': rispettare il formato YYYY-MM-DD inserendo una data corretta');
		return false;
	}
	

	var anno = parseInt(m[1]);
	var bisestile = (anno % 4 == 0 && (anno % 100 != 0 || anno % 400 == 0));

	var giorni_nel_mese = {
		11:30,
		4:30,
		6:30,
		9:30,
		2:(bisestile) ? 29 : 28,
		//Tutti gli altri ne han 31
	};
	
	var mesi = ["", "Gennaio", "Febbraio", "Marzo", "Aprile", "Maggio", "Giugno", "Luglio", "Agosto", "Settembre", "Ottobre", "Novembre", "Dicembre"];
	
	m[1] = parseInt(m[1]);
	m[2] = parseInt(m[2]);
	m[3] = parseInt(m[3]);
	
	if (giorni_nel_mese[m[2]] && m[3] > giorni_nel_mese[m[2]]) {
		alert('Campo ' + name + ': il mese di ' + mesi[m[2]] + ' non ha il giorno ' + m[3]);
		return false;
	}
	
	return true;
}

function checkForm(){
	var campi = ["inizioB", "fineB", "inizioP", "fineP", "fineR"];
 	
	for (var i in campi) {
		if (!checkDate(campi[i], document.getElementById(campi[i]))) {
			return false;
		}
	}

}

</script>


<table width="100%" cellspacing="0" cellpadding="0" border="0">
<tbody><tr>
<td class="breadcrumb " align="left"><p> </a></p>
  <p>&nbsp;</p></td>
</tr>
</tbody></table>
<%@
include file="atsilo_files/autoinclude_sidebar_giusta_tipologia.jsp"%>
<img width="209" border="0" alt="" height="1" src="atsilo_images/clearpixel.gif"></td><td class="content" valign="top" bgcolor="#ffffff">
<table width="100%">
<tbody><tr>
<td>
<form action="http://localhost:8080/Atsilo/ServletEventoModifica" method="post" >
<%
String idEvn = request.getParameter("evento");
int id = Integer.parseInt(idEvn);
ControlEvento crtEvn = ControlEvento.getIstance();
Evento oldEvn = crtEvn.getEventoPerId(id);
String data = request.getParameter("data");
ControlClassi crtClass = ControlClassi.getIstance();
%>
<fildset><legend>Modifica Evento</legend>
Nome : <input type="text" name="nome" value="<%= oldEvn.getNome() %>" />
<br />Data : <input type"text" name="data" value="<%= oldEvn.getData().toString() %>" onblur="return checkForm()"/>
<br />Descrizione : <input type="textarea" name="desc" value="<%= oldEvn.getDescrizione() %>" />
<br />Tipo : <input type="text" name="tipo" value="<%= oldEvn.getTipo() %>" />
<br />CC : <input type="text" name="cc" value="<%= oldEvn.getCC() %>" />
<% 
int lun = crtClass.getClassi().size();
for(int i=0; i<lun ;i++){
	out.append("<input type='checkbox' name='classe' value='")
		.append(""+crtClass.getClassi().get(i).getId())
		.append("' />"+crtClass.getClassi().get(i).getSezione())
		.append("<br />");
}
%>
<input type="hidden" name="oldevento" value="<%= oldEvn.getId() %>" />
</fildset>
	<input type="submit" value="Invia Modifica" name="modifica" /> 
</form>
</td><td class="fasciadxvariabile"></td>
</tr>
</tbody></table>

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