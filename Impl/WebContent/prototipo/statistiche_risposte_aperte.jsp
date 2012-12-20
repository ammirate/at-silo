<%@page import="atsilo.exception.QuestionarioException"%>
<%@page import="java.sql.Date"%>
<%@page import="atsilo.entity.*"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*" %>
<%@page import="atsilo.application.ControlQuestionario"%>

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

<table cellspacing="10" cellpadding="0" border="0" width="100%">
<tbody><tr>
<td class="tplHeader">
<h2 align=center >Statistiche Risposte Aperte</h2>
<br><br>
<%
	int idDomanda=0, idQuestionario=0;
	try {
		idDomanda = Integer.parseInt(request.getParameter("idDomanda"));
		idQuestionario = Integer.parseInt(request.getParameter(("idQuestionario")));
	}
	catch (Exception e) {}
	out.println("ID Domanda: " + idDomanda + "<br>");
	out.println("ID Questionario: " + idQuestionario + "<br>");

%>

