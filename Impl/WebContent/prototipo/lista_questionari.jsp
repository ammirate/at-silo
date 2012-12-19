
<%@page import="atsilo.exception.QuestionarioException"%>
<%@page import="atsilo.exception.DBConnectionException"%>
<%@page import="java.sql.Date"%>
<%@page import="atsilo.application.ControlQuestionario"%>
<%@page import="atsilo.entity.*" %>
<%@page import="java.util.*" %>
<%@page import="java.sql.*" %>

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

<%
try {
if(request.getParameter("success").equals("1")) {
	out.println("<div style='background: #b5f1af; width: 100%; height: 30px; text-align: center'>Questionario inserito con successo</div>");
}
}
catch (Exception e) {}
try {
if(request.getParameter("success").equals("2")) {
	out.println("<div style='background: #b5f1af; width: 100%; height: 30px; text-align: center'>Questionario modificato con successo</div>");
}
}
catch (Exception e) {}
try {
if(request.getParameter("success").equals("3")) {
	out.println("<div style='background: #b5f1af; width: 100%; height: 30px; text-align: center'>Questionario cancellato con successo</div>");
}
}
catch (Exception e) {}
try {
if(request.getParameter("success").equals("4")) {
	out.println("<div style='background: #b5f1af; width: 100%; height: 30px; text-align: center'>Questionario compilato con successo</div>");
}
}
catch (Exception e) {}
%>
<br><br><br>
<table cellspacing="10" cellpadding="0" border="0" width="100%">
<tbody><tr>
<td class="tplHeader">
<table>
<tr>
	<th>N°</th><th>Titolo Questionario</th><th>Data Inizio</th><th>Data Fine</th><th>Opzioni</th>
</tr>

<%
	
	boolean g = false;
	String cf = "";
	ControlQuestionario q = ControlQuestionario.getIstance();
	try {
		if (request.getParameter("error").equals("1")) {
			out.println("<script type='text/javascript'>alert('Errore: non puoi modificare questo questionario')</script>");
		}
	} catch (Exception e) {
	}
	try {
		if (request.getParameter("action").equals("cancel")) {
			int id = Integer.parseInt(request.getParameter("id"));
			try {
				q.eliminaQuestionario(id);
			} catch (DBConnectionException d) {
				out.println("<script type='text/javascript'>alert('Impossibile connettersi al database: Riprova più tardi')</script>");
			} catch (QuestionarioException qe) {
				out.println("<script type='text/javascript'>alert('Errore: il questionario non esiste')</script>");
			} catch (Exception e) {
				out.println("<script type='text/javascript'>alert('C'è stato un errore, riprova di nuovo')</script>");
			}
		}
	} catch (Exception e) {
	}
	try {
		if (request.getParameter("type").equals("genitore")) {
			g = true;
			cf = request.getParameter("cf");
		}
	} catch (Exception e) {
	}
	List<Questionario> list = null;
	if (g)
		list = q.getQuestionariDaCompilare(cf);
	else {
		list = q.getAllQuestionari();
	}
	if (list.size() == 0)
		out.println("<tr><td colspan=5>Non sono presenti Questionari in archivio.</td></tr>");
	String datainizio = "";
	String datafine = "";
	for (int i = 0; i < list.size(); i++) {
		datainizio = list.get(i).getPeriodo_inizio().toString();
		String[] dt = datainizio.split("-");
		datainizio = dt[2] + "/" + dt[1] + "/" + dt[0];
		datafine = list.get(i).getPeriodo_fine().toString();
		String[] df = datafine.split("-");
		datafine = df[2] + "/" + df[1] + "/" + df[0];
		out.println("<tr><td align=center>" + (i + 1) + "<td>"
				+ list.get(i).getNome() + "<td align=center>"
				+ datainizio + "<td align=center>" + datafine);
		if (g) {
			out.print("<td align=center><a href='visualizza_questionari.jsp?id="
					+ list.get(i).getId()
					+ "&codfis="
					+ cf
					+ "'><img src='atsilo_images/visualizza.gif'></a></tr>");
		} else {
			
			out.println("<td align=center style='padding: 10px'>");
			if (q.isEditable(list.get(i))) {
				out.println("<a href='modifica_questionario.jsp?id="
						+ list.get(i).getId()
						+ "'><img src='atsilo_images/modifica.png'></a><a href='lista_questionari.jsp?action=cancel&id="
						+ list.get(i).getId()
						+ "&success=3'><img src='atsilo_images/cancella.png'></a>");
			}
			out.println("<a href='visualizza_questionari.jsp?id="
					+ list.get(i).getId()
					+ "'><img src='atsilo_images/visualizza.gif'></a><a href='statistica_questionario.jsp?id="
					+ list.get(i).getId()
					+ "'><img src='atsilo_images/grafico.jpg' width=50 height=50></a>"
					+ "</tr>");
		}
	}
	
	
%>
</table>
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
<td class="bottom" width="209">&nbsp;2012 Â© Unisa</td><td align="right" class="bottom"></td>
</tr>
</tbody></table>


</body>
</html>