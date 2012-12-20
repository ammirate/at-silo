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
<h2 align=center >Statistiche Questionario</h2>
<br><br>

<%
	int id;

	StatisticheQuestionario stat = new StatisticheQuestionario();
	ControlQuestionario q = ControlQuestionario.getIstance();
	try {
		id = Integer.parseInt(request.getParameter("id"));
	}
	catch (Exception e) {
		id = -1;
	}
	
	Questionario quest = q.caricaQuestionarioDaCompilare(id, "DFZNDR91L14A909D");
	stat = q.getStatistische(id);
	if (quest == null) {
		out.println("<center> <img width=200 height=200 src = atsilo_images/errore.jpg><br><br><h2>Nessun questionario corrispondente</h2></center><br><br>");
	}
	else {
		out.println("<H2 align=center>Titolo Questionario: " + quest.getNome()+ "</h2><br><br><BR><BR>");
		out.println("Descrizione del questionario: \t<br><br><p style=\"border: 1px solid black; height: 100px\">"
				+ quest.getDescrizione() + "</p><br><br>");
		for (int i = 0; i < quest.getDomande().size(); i++) {
			out.println("<br><br><fieldset>");
			out.println("<h3>Domanda:  "
					+ quest.getDomande().get(i).getDescrizione()
					+ "'</h3>");
			out.println("<table><tr><th style='text-align: left'>Opzione<th>Grafico<th>Percentuale</tr>");
			out.println("<input type=hidden name='domanda"+i+"' value = '" + quest.getDomande().get(i).getId() + "'>");
			for (int j = 0; j < quest.getDomande().get(i).getCampi().size(); j++) {
				Integer p = stat.getPercentualiFromCampo(quest.getDomande().get(i).getId(), quest.getDomande().get(i).getCampi().get(j).getId());
				out.println("<tr><td width=500>" + quest.getDomande().get(i).getCampi().get(j).getDescrizione() + "</td>");
				if(p==null ) {
					out.println("<td colspan = 2><a href=\"statistiche_risposte_aperte.jsp?idDomanda="+quest.getDomande().get(i).getId()+"&idQuestionario="+quest.getId()+"\">Clicca qui per queste statistiche</a></td></tr>");
				}
				else
				{
					out.println("<td width=200><div style='background-color: red; width: "+(p*100)+"%; height: 20px'></div><td width=100 align=center>"+(p*100)+"%</tr>");

				}
			}
			out.println("</table><br><br>");
			out.println("</fieldset><br><br>");
		}
	
	}
%>
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