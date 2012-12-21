<%@page import="java.sql.Date"%>
<%@page import="atsilo.entity.*"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*" %>
<%@page import="atsilo.application.ControlQuestionario"%>

<%@
	include file="atsilo_files/header.jsp"
%>
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

<table cellspacing="10" cellpadding="0" border="0" width="100%">
<tbody><tr>
<td class="tplHeader">
<h2 align=center >Modifica Questionario</h2>
<br><br>

<%
	int id;
	try {
		id = Integer.parseInt(request.getParameter("id"));
	}
	catch (Exception e) {
		id = -1;
	}
	Questionario quest = null;
	ControlQuestionario q = ControlQuestionario.getIstance();
	try {
		quest = q.caricaQuestionarioDaCompilare(id, "DFZNDR91L14A909D");
	}
	catch (SQLException s) {	
			response.sendRedirect("lista_questionari.jsp?error=1");
	}
	if (quest == null) {
		out.println("<center> <img width=200 height=200 src = atsilo_images/errore.jpg><br><br><h2>Nessun questionario corrispondente</h2></center><br><br>");
	}
	else {

		out.println("<form action=\"http://localhost:8080/Atsilo/servletControlQuestionario\" method='POST' >");
		out.println("<div id=formdomande>");

		out.println("<H2>Titolo Questionario:</H2><input type=text name=\"titolo\" value = '" + quest.getNome()+ "' size=100 style=\"height: 25px; font-size: 22px; font-family: Times; font-weight: bold;\"><br><br><BR><BR>");
		
	%>
	<div id=datachooser2 >
		<table>
			<tr>
				<td><b>Data Inizio: </b>	<td><input type=text value='<% out.print(quest.getPeriodo_inizioString()); %>' name=dataIn onclick="Calendar.show(this, '%d/%m/%Y', true)" onfocus="Calendar.show(this, '%d/%m/%Y', true)" onblur="Calendar.hide()" />
			<tr>
				<td><b>Data Fine: </b> <td><input type=text value='<% out.print(quest.getPeriodo_fineString());%>' name=dataOu onclick="Calendar.show(this, '%d/%m/%Y', true)" onfocus="Calendar.show(this, '%d/%m/%Y', true)" onblur="Calendar.hide()" />	
		</table>
	</div>
	<br><br><br><br>
	<%	
		
		out.println("<b>Descrizione</b>: \t<br><br><textarea rows=\"10\" cols=\"80\" name=descrizione>"
				+ quest.getDescrizione() + "</textarea><br><br>");
	 
		for (int i = 0; i < quest.getDomande().size(); i++) {
			out.println("<div id='domanda_header"+i+"'>");
			out.println("<br><br><fieldset onMouseOver=\"set('parah"+i+"')\">");
			out.println("<table id='parah"+i+"' >");
			out.println("<tr><td><h3>Domanda</h3></td><td><input type=text size = 80 name='domanda"+i+"' value='"
					+ quest.getDomande().get(i).getDescrizione()
					+ "'></td></tr>");
			for (int j = 0; j < quest.getDomande().get(i).getCampi()
					.size(); j++) {
				out.println("<tr><td>Opzione</td><td><input type=text name='opzione"
						+ (i)
						+ "[]' value='"
						+ quest.getDomande().get(i).getCampi().get(j)
								.getDescrizione() + "'></td></tr>");
			}
			out.println("</table><br><br>");
			String 	type = "<Select name='tipo"+i+"' onchange='abilitaAdd(this.value, this.name, "+i+")'> <option value=1>Selezione Multipla</option><option value=2>Selezione Unica</option><option value=3>Risposta Aperta</option></Select>";
			if(quest.getDomande().get(i).getCampi().get(0).getTipo().equals("radio"))
				 type = "<Select  name='tipo"+i+"'	 onchange='abilitaAdd(this.value, this.name, "+i+")'> <option value=1>Selezione Multipla</option><option selected=selected value=2>Selezione Unica</option><option value=3 >Risposta Aperta</option></Select><input type=button value='Aggiungi Campo ' id='addCampo"+i+"'	onclick=\"display('parah"+i+"', " + i +");\">";
			 else if (quest.getDomande().get(i).getCampi().get(0).getTipo().equals("checkbox"))
				 type = "<Select name='tipo"+i+"'	onchange='abilitaAdd(this.value, this.name, "+i+")'> <option  value=1 selected=selected>Selezione Multipla</option><option  value=2>Selezione Unica</option><option value=3 >Risposta Aperta</option></Select><input type=button value='Aggiungi Campo ' id='addCampo"+i+"' onclick=\"display('parah"+i+"', " + i +");\">";
			 else if (quest.getDomande().get(i).getCampi().get(0).getTipo().equals("text"))
				 type = "<Select name='tipo"+i+"'	onchange='abilitaAdd(this.value, this.name, "+i+")'> <option value=1>Selezione Multipla</option><option  value=2>Selezione Unica</option><option selected=selected value=3>Risposta Aperta</option></Select><input type=button disabled = disabled value='Aggiungi Campo ' id='addCampo"+i+"' onclick=\"display('parah"+i+"', " + i +");\">";
			if(i!=0)
				type+="<input type=button value='Elimina Domanda' onClick='eliminaDomanda("+ i+")'>";

			out.println( type);
			out.println("</fieldset></div><br><br>");
		}
		out.println("<script type=\"text/javascript\">setv("+quest.getDomande().size()+")</script>");
		out.println("</div><input type=button value=\"Aggiungi Domanda\" onclick=\"addDomanda()\"><br><br>");
		out.println("<center><input type=submit value='Modifica Questionario' onclick='return controlData()' ></center>");
		out.println("<input type=hidden name=action value=modify>");
		out.println("<input type=hidden name=identificativo value='"+quest.getId()+"'>");

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