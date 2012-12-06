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
<div class="titolopagina">Benvenuto XXX</div>
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
	try {
		id = Integer.parseInt(request.getParameter("id"));
	}
	catch (Exception e) {
		id = -1;
	}
	/*Questionario quest = null;
	 ControlQuestionario q = null;
	q=q.getIstance();
	List<Questionario> list = q.getAllQuestionari();
	List<Questionario> list = new List<Questionario>();
	list.get(0).getDomande().get(0); */

	Questionario quest = null;
	Questionario quest1 = new Questionario("questa è una prova", "no", "linda è antipatica?", 10, null, null);
	Calendar c = Calendar.getInstance();
	c.set(2012, 10, 14);
	quest1.setPeriodo_inizio(new Date(c.getTimeInMillis()));
	c.set(2012, 10, 20);
	quest1.setPeriodo_fine(new Date(c.getTimeInMillis()));
	Questionario quest2 = new Questionario("questa è una prova2", "no", "giulio è antipatico?", 12, null, null);
	c.set(2012, 12, 14);
	quest2.setPeriodo_inizio(new Date(c.getTimeInMillis()));
	c.set(2012, 12, 18);
	quest2.setPeriodo_fine(new Date(c.getTimeInMillis()));
	List<Questionario> list = new ArrayList<Questionario>();
	List<DomandaQuestionario> d1 = new ArrayList<DomandaQuestionario>();
	List<CampoDomandaQuestionario> c1 = new ArrayList<CampoDomandaQuestionario>();
	c1.add(new CampoDomandaQuestionario("checkbox","bene","bene", "1"));
	c1.add(new CampoDomandaQuestionario("checkbox","male","male", "1"));
	c1.add(new CampoDomandaQuestionario("checkbox","malissimo","malissimo", "1"));
	c1.add(new CampoDomandaQuestionario("checkbox","non so","non so", "1"));
	List<CampoDomandaQuestionario> c2 = new ArrayList<CampoDomandaQuestionario>();
	c2.add(new CampoDomandaQuestionario("radio","bene","bene", "2"));
	c2.add(new CampoDomandaQuestionario("radio","male","male", "2"));
	c2.add(new CampoDomandaQuestionario("radio","malissimo","malissimo", "2"));
	c2.add(new CampoDomandaQuestionario("radio","non so","non so", "2"));
	d1.add(new DomandaQuestionario ("1",12,"Come ti trovi con i pm?", c1 ));
	d1.add(new DomandaQuestionario ("1",12,"Come li valuti i pm?", c2 ));
	quest2.setDomande(d1);
	list.add(quest1);
	list.add(quest2);
	for (int i = 0; i < list.size(); i++) {
		if (list.get(i).getId() == id) {
		quest = list.get(i);
		break;
		}
	}
	if (quest == null) {
		out.println("<center> <img width=200 height=200 src = atsilo_images/errore.jpg><br><br><h2>Nessun questionario corrispondente</h2></center><br><br>");
	}
	else {
			
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