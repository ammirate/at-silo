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
<%
	int idDomanda=0, idQuestionario=0;
	String nome_domanda="";
	String nome_questionario="";
	try {
		
		idDomanda = Integer.parseInt(request.getParameter("idDomanda"));
		idQuestionario = Integer.parseInt(request.getParameter(("idQuestionario")));
		nome_domanda= request.getParameter("questionarioNome");
		ControlQuestionario controlQ = ControlQuestionario.getIstance();
		nome_questionario=controlQ.getQuestionario(idQuestionario).getNome();
	    DomandaQuestionario domanda =  controlQ.getDomanda(idDomanda);
		nome_domanda = domanda.getDescrizione();
		
	
	}
	catch (Exception e) {}

%>
<h1 align=center >Statistiche per il Questionario: <%  out.println(nome_questionario);%></h2>
<h2 align=left >Domanda:<% out.println(nome_domanda); %></h2>
<br><br>
<table width=100% >
<tr>
<td width=30% ><b><h3>Numero Risposta</h4></b></td>
<td width=70%><b><h3>Risposta</h4></b></td>
</tr>
<%
ControlQuestionario q = ControlQuestionario.getIstance();
List<String> risposte = q.getRisposteAperte(idDomanda);
if(risposte.size()==0)
{
	out.println("<tr><td>Attualmente non sono presenti risposte per questa domanda</td><td></td></tr>");
}
else{
	for(int i=0;i<risposte.size();i++)
	{
		int numDom =i+1;
		out.println("<tr>");
		out.println("<td >"+numDom+"</td>");
		out.println("<td >"+risposte.get(i)+"</td>");
		out.println("</tr>");
	}
}
out.println("</table>");
%>
</table>

<br><br>


