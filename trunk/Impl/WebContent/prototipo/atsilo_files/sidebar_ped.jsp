<%
//sessione gia' dichiarata nell'header
//la variabile homepage sarà il riferimento al tasto home dell'header
sessione.setAttribute("homepage", "index_psicopedagoga.jsp");
%>
<%
//controllo se questa tipologia utente ha accesso alle pagine in cui e' inclusa questa sidebar
if (!tipologia.equals("psicopedagogo") )
		response.sendRedirect("index_psicopedagogo.jsp");
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
<td align="left" class="menuprimosel">&nbsp;<b>Area Utente</b></td>
</tr>
<tr>
<td class="menusecondo">&nbsp;<a class="linkmenusecondo" href="../account_educatore.jsp">Dati Account</a></td>
</tr>
<tr>
<td class="menusecondo">&nbsp;<a class="linkmenusecondo" href="../logout.jsp">Logout</a></td>
</tr>
</tbody></table>
<table class="lineadivisoria" width="100%" cellspacing="0" cellpadding="0" border="0">
<tbody><tr>
</tr>
</tbody></table>
<table class="lineadivisoria" width="100%" cellspacing="0" cellpadding="0" border="0">
<tbody><tr>
<td align="left" class="menuprimosel">&nbsp;<b>Programma Didattico</b></td>
</tr>
<tr>
<td class="menusecondo">&nbsp;<a class="linkmenusecondo" href="../inserisci_programma.jsp">Inserisci</a></td>
</tr>
<tr>
<tr>
<td class="menusecondo">&nbsp;<a class="linkmenusecondo" href="../modifica_programma.jsp">Modifica</a></td>
</tr>
<tr>
<td class="menusecondo">&nbsp;<a class="linkmenusecondo" href="../cancella_programma.jsp">Cancella</a></td>
</tr>
<tr>
<td class="menusecondo">&nbsp;<a class="linkmenusecondo" href="../storico_registro_ped.jsp">Storico Registro</a></td>
</tr>
</tbody></table>
<table class="lineadivisoria" width="100%" cellspacing="0" cellpadding="0" border="0">
<tbody><tr>
</tr>
</tbody></table>
<table class="lineadivisoria" width="100%" cellspacing="0" cellpadding="0" border="0">
<tbody><tr>
<td align="left" class="menuprimosel">&nbsp;<b>Gestione Eventi</b></td>
</tr>
<tr>
<td class="menusecondo">&nbsp;<a class="linkmenusecondo" href="eventi.jsp">Visualizza Eventi</a></td>
</tr>
</tbody></table>