<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="atsilo.util.AtsiloConstants,atsilo.application.*,atsilo.entity.*, java.sql.*"%>
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
include file="atsilo_files/autoinclude_sidebar_giusta_tipologia.jsp"%>
<img width="209" border="0" alt="" height="1" src="atsilo_images/clearpixel.gif"></td><td class="content" valign="top" bgcolor="#ffffff">
<table width="100%">
<tbody><tr>
<td>
<form action="http://localhost:8080/Atsilo/ServletEventoInserisci" method="post" enctype="multipart/form-data" >
<%
String data = request.getParameter("data");
ControlClassi crtClass = ControlClassi.getIstance();

%>
<fildset><legend>Inserisci Evento</legend>
<table>
<tr>
<td>Nome :</td><td> <input type="text" name="nome" value="" /></td>
</tr>
<tr>
<td>Data :</td><td>  <input type"text" name="data" value="<%= data %>" readonly="readonly" /></td>
</tr>
<tr>
<td>CC :</td><td>  <input type="text" name="cc"  /></td>
</tr>
<tr>
<td>Tipo :</td><td>  <input type="text" name="tipo"  /></td>
</tr>
<tr>
<td>Descrizione :</td><td><textarea rows="4" cols="50" name="desc"> </textarea></td>
</tr>
</table>
<br />Classi Associate all'evento<br>
<% 
int lun = crtClass.getClassi().size();
for(int i=0; i<lun ;i++){
	out.append("<input type='checkbox' name='classe' value='")
		.append(""+crtClass.getClassi().get(i).getId())
		.append("' />"+crtClass.getClassi().get(i).getSezione())
		.append("<br />");
}
%>
<br />
Carica Allegato :  <input type="file" name="file" />
<input type="hidden" name="tipologia" value="<%= tipologia %>" />
<input type="hidden" name="user" value="<%= username %>" />
</fildset>
	<input type="submit" value="Inserisci Evento" name="inserisci" /> 
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