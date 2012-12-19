<%@page import="atsilo.application.*"%>
<%@page import="atsilo.entity.*"%>
<%@page import="java.util.*" %>

<%
//sessione gia' dichiarata nell'header
//la variabile homepage sarÃ  il riferimento al tasto home dell'header
sessione.setAttribute("homepage", "index_genitore.jsp");
%>
<%
//controllo se questa tipologia utente ha accesso alle pagine in cui e' inclusa questa sidebar
if (!tipologia.equals("genitore") )
		response.sendRedirect("index_genitore.jsp");
ControlDatiPersonali p = ControlDatiPersonali.getIstance();
String cf = (String) session.getAttribute("codFis");
%>


<table class="colonnasx" width="100%" cellspacing="0" cellpadding="0" border="0">
<tbody><tr>
<td valign="top" class="colonnasx" width="209">
<table class="lineadivisoria" width="100%" cellspacing="0" cellpadding="0" border="0">
<tbody><tr>
<td class="top_menu_sx">
<div class="user">

<p></p>
</div>
<div class="vista_menu">
</div>
</td>
</tr>
</tbody></table>
<table class="lineadivisoria" width="100%" cellspacing="0" cellpadding="0" border="0">
<tbody><tr>
<td align="left" class="menuprimosel">&nbsp;<b>'Area Utente</b></td>
</tr>
<tr>
<td class="menusecondo">&nbsp;<a class="linkmenusecondo" href="dati_account_genitore.jsp">Dati Account</a></td>
</tr>
<tr>
<td class="menusecondo">&nbsp;<a class="linkmenusecondo" href="dati_bambino.jsp">Dati Bambino</a></td>
</tr>
<tr>
<td class="menusecondo">&nbsp;<a class="linkmenusecondo" href="iscrizione.jsp">Iscrizione</a></td>
</tr>

<tr>
<td class="menusecondo">&nbsp;<a class="linkmenusecondo" href="logout.jsp">Logout</a></td>
</tr>
</tbody></table>
<table class="lineadivisoria" width="100%" cellspacing="0" cellpadding="0" border="0">
<tbody><tr>
</tr>
</tbody></table>
<table class="lineadivisoria" width="100%" cellspacing="0" cellpadding="0" border="0">
<tbody><tr>
<td align="left" class="menuprimosel">&nbsp;<b>Gestione Pagamenti</b></td>
</tr>
<tr>
<td class="menusecondo">&nbsp;<a class="linkmenusecondo" href="storico_pagamenti.html">Storico Pagamenti</a></td>
<tr>
<td class="menusecondo">&nbsp;<a class="linkmenusecondo" href="storico_pagamenti.jsp">Storico Pagamenti</a></td>

</tr>
<tr>
<td class="menusecondo">&nbsp;<a class="linkmenusecondo" href="fattura_mensile.jsp">Fattura Mensile</a></td>
</tr>
</tbody></table>
<table class="lineadivisoria" width="100%" cellspacing="0" cellpadding="0" border="0">
<tbody><tr>
</tr>
</tbody></table>
<table class="lineadivisoria" width="100%" cellspacing="0" cellpadding="0" border="0">
<tbody><tr>
<td align="left" class="menuprimosel">&nbsp;<b>Gestione Servizi</b></td>
</tr>
<tr>
<td class="menusecondo">&nbsp;<a class="linkmenusecondo" href="rinuncia_servizio.jsp">Rinuncia Servizio</a></td>
</tr>

<tr>
<td class="menusecondo">&nbsp;<a class="linkmenusecondo" href="servizi_attivi.jsp">Servizi Attivi</a></td>
</tr>
<tr>
<td class="menusecondo">&nbsp;<a class="linkmenusecondo" href="modifica_orario.jsp">Modifica Orario</a></td>
</tr>
<tr>
<td class="menusecondo">&nbsp;<a class="linkmenusecondo" href="modifica_pasti.jsp">Modifica Pasti</a></td>
</tr>
<tr>
<td class="menusecondo">&nbsp;<a class="linkmenusecondo" href="storico_attivita.html">Storico Attivit&agrave; </a></td>
</tr>

<% 
out.println("<tr><td class=\"menusecondo\">&nbsp;<a class=\"linkmenusecondo\" href=\"lista_questionari.jsp?type=genitore&cf="+ cf + "\">Compila Questionari </a></td></tr>");

%>

</tbody></table>
<table class="lineadivisoria" width="100%" cellspacing="0" cellpadding="0" border="0">
<tbody><tr>
<td align="left" class="menuprimosel">&nbsp;<b>Gestione Gradutorie</b></td>
</tr>
<tr>
<td class="menusecondo">&nbsp;<a class="linkmenusecondo" href="graduatoria_ammessi.jsp">Graduatoria Amessi</a></td>
<tr>
<td class="menusecondo">&nbsp;<a class="linkmenusecondo" href="graduatoria_rifiutati.jsp">Graduatoria Rifiutati</a></td>
</tr>

</tbody></table>