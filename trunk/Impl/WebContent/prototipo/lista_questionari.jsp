
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
<div class="titolopagina">Benvenuto XXX</div>
</td><td class="fasciadxvariabile"></td>
</tr>
</tbody></table>

<table cellspacing="10" cellpadding="0" border="0" width="100%">
<tbody><tr>
<td class="tplHeader">
<table>
<tr>
	<th>N°</th><th>Titolo Questionario</th><th>Data Inizio</th><th>Data Fine</th><th>Opzioni</th>
</tr>

<%
	boolean g = false;
	String cf ="";
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
			//		q.eliminaQuestionario(id);
			out.println("<script type='text/javascript'>alert('Questionario eliminato con successo')</script>");
		}
	} catch (Exception e) {
	}
	try {
		if (request.getParameter("type").equals("genitore")) {
			g=true;
			cf = request.getParameter("cf");
		}
	} catch (Exception e) {
	}
	
	Questionario quest1 = new Questionario("questa è una prova", "no",
			"linda è antipatica?", 10, null, null);

	Calendar c = Calendar.getInstance();
	c.set(2012, 10, 14);
	quest1.setPeriodo_inizio(new Date(c.getTimeInMillis()));
	c.set(2012, 10, 20);
	quest1.setPeriodo_fine(new Date(c.getTimeInMillis()));

	Questionario quest2 = new Questionario("questa è una prova2", "no",
			"giulio è antipatico?", 12, null, null);
	c.set(2012, 12, 14);
	quest2.setPeriodo_inizio(new Date(c.getTimeInMillis()));
	c.set(2012, 12, 18);

	quest2.setPeriodo_fine(new Date(c.getTimeInMillis()));

	List<Questionario> list = new ArrayList<Questionario>();
	list.add(quest1);
	list.add(quest2);
	
//	list = q.getAllQuestionari();
//	if(g)	list = q.getQuestionariDaCompilare(cf);
	
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
		out.println("<tr><td align=center>"
				+ (i + 1)
				+ "<td>"
				+ list.get(i).getNome()
				+ "<td align=center>"
				+ datainizio
				+ "<td align=center>"
				+ datafine);
		if (g) {
			out.print("<td align=center><a href='visualizza_questionari.jsp?id="
					+ list.get(i).getId()
					+ "&codfis="+cf+"'><img src='atsilo_images/visualizza.gif'></a></tr>");
		}
		else {
				out.print("<td align=center style='padding: 10px'><a href='modifica_questionario.jsp?id="
				+ list.get(i).getId()
				+ "'><img src='atsilo_images/modifica.png'></a><a href='lista_questionari.jsp?action=cancel&id="
				+ list.get(i).getId()
				+ "'><img src='atsilo_images/cancella.png'></a><a href='visualizza_questionari.jsp?id="
				+ list.get(i).getId()
				+ "'><img src='atsilo_images/visualizza.gif'></a></tr>");
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