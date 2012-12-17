<%
//sessione gia' dichiarata nell'header
//la variabile homepage sarà il riferimento al tasto home dell'header
sessione.setAttribute("homepage", "index_delegato_rettore.jsp");
%>
<%
//controllo se questa tipologia utente ha accesso alle pagine in cui e' inclusa questa sidebar
if (!tipologia.equals("delegato_rettore") )
		response.sendRedirect("index_delegato_rettore.jsp");
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
<td class="menusecondo">&nbsp;<a class="linkmenusecondo" href="#">Dati Account</a></td>
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
</tr>
</tbody></table>
<table class="lineadivisoria" width="100%" cellspacing="0" cellpadding="0" border="0">
<tbody><tr>
<td align="left" class="menuprimosel">&nbsp;<b>Gestione Bambini</b></td>
</tr>
<tr>
<td class="menusecondo">&nbsp;<a class="linkmenusecondo" href="convalida_classe_bambino.jsp">Convalida Classe</a></td>
</tr>

</tbody></table>
