<%@page import="java.sql.Date"%>
<%@
	include file="atsilo_files/header.jsp"
%>
<%@page import="atsilo.entity.*"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>

<%@page import="atsilo.application.*"%>
<script type="text/javascript" src="atsilo_files/validatorQuest.js"></script>
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
<h2 align=center >Compila Questionario</h2>

<%
	int id;
	String cf="";
	try {
		id = Integer.parseInt(request.getParameter("id"));
	}
	catch (Exception e) {
		id = -1;
	}
	try {
		cf = request.getParameter("codfis");
	}
	catch (Exception e) {
		
	}
	Questionario quest = null;
	ControlQuestionario q = ControlQuestionario.getIstance();
	quest = q.caricaQuestionarioDaCompilare(id, cf);
	List<RispostaQuestionario> l = quest.getRispostePrecaricate();
	
	if (quest == null) {
		out.println("<center> <img width=200 height=200 src = atsilo_images/errore.jpg><br><br><h2>Nessun questionario corrispondente</h2></center><br><br>");
	}
	else {

		out.println("<form action=\"http://localhost:8080/Atsilo/ControlCompilaQuestionario\" method='POST' name=formBello>");
		out.println("<div id=formdomande>");

		out.println("<H2>Titolo Questionario: " + quest.getNome()+ "</h2><br><br><BR><BR>");
		out.println("Descrizione del questionario: \t<br><br><p style=\"border: 1px solid black; height: 100px\">"
				+ quest.getDescrizione() + "</p><br><br>");
		for (int i = 0; i < quest.getDomande().size(); i++) {
			System.out.println("prova jsp"+quest.getDomande().size());
			String resp = "";
			for (int j = l.size()-1; j>=0; j--) {
				System.out.println("prova jsp2 "+l.size());
				DomandaQuestionario domanda = new DomandaQuestionario();
				domanda.setId(l.get(j).getIdDomanda());
				DomandaQuestionario domanda_corrente = quest.getDomande().get(i);
				if(q.domandaIsEqual(domanda, domanda_corrente))
				{
					resp = l.get(j).getValore();
					break;
				}
			}
			out.println("<br><br><fieldset>");
			out.println("<table id='parah"+i+"'>");
			out.println("<tr><td><h3>Domanda </h3><td><h3>"
					+ quest.getDomande().get(i).getDescrizione()
					+ "'</h3></td></tr>");
			out.println("<input type=hidden name='domanda"+i+"' value = '" + quest.getDomande().get(i).getId() + "'>");
			quest.getDomande().get(i).getCampi().size();
			for (int j = 0; j < quest.getDomande().get(i).getCampi().size(); j++) {
				
				
				if(quest.getDomande().get(i).getCampi().get(j).getTipo().equals("radio") || quest.getDomande().get(i).getCampi().get(j).getTipo().equals("checkbox")) {
					if(quest.getDomande().get(i).getCampi().get(j).getDescrizione().equals(resp)) 
						out.println("<tr><td colspan=2><input  checked=checked type=\""+quest.getDomande().get(i).getCampi().get(j).getTipo() +"\" name=\"opzione" + quest.getDomande().get(i).getId() + "\" value = '" + quest.getDomande().get(i).getCampi().get(j).getDescrizione() + "' >" + quest.getDomande().get(i).getCampi().get(j).getDescrizione() + "</td></tr>");
					else
						out.println("<tr><td colspan=2><input  type=\""+quest.getDomande().get(i).getCampi().get(j).getTipo() +"\" name=\"opzione" + quest.getDomande().get(i).getId() + "\" value = '" + quest.getDomande().get(i).getCampi().get(j).getDescrizione() + "' >" + quest.getDomande().get(i).getCampi().get(j).getDescrizione() + "</td></tr>");

				}
				else
					out.println("<tr><td colspan=2><input  type=\"text\" name=\"opzione" + quest.getDomande().get(i).getId() + "["+j+"]\" value = '" + resp + "' >" + quest.getDomande().get(i).getCampi().get(j).getDescrizione() + "</td></tr>");

			}
			out.println("</table><br><br>");
			out.println("</fieldset><br><br>");
		}

		if(cf!=null) {
		//	this.precaricaRisp();
			out.println("<input type=hidden name=codfis value='"+cf+"'>");
			out.println("<input type=hidden name=questID value='"+quest.getId()+"'>");

			out.println("<center><input type=button  onclick=\"prova()\" value=\"Sottometti Questionario\"></center>");
		
		}
		else 
		{
			out.println("<center><input type=button disabled='disabled' value=\"Sottometti Questionario\"></center>");
		}

		out.println("</form>");
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