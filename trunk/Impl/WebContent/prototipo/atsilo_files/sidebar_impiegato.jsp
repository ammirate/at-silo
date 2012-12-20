<%
//sessione gia' dichiarata nell'header
//la variabile homepage sarà il riferimento al tasto home dell'header
sessione.setAttribute("homepage", "index_impiegato_asilo.jsp");
%>
<%
//controllo se questa tipologia utente ha accesso alle pagine in cui e' inclusa questa sidebar
if (!tipologia.equals("impiegato_asilo") )
		response.sendRedirect("index_impiegato_asilo.jsp");
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
<td class="menusecondo">&nbsp;<a class="linkmenusecondo" href="account_impiegato.jsp">Dati Account</a></td>
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
<td align="left" class="menuprimosel">&nbsp;<b>Gestione Iscritti</b></td>
</tr>
<tr>
<td class="menusecondo">&nbsp;<a class="linkmenusecondo" href="inserisci_iscritto.jsp">Inserisci </a></td>
</tr>
<tr>
<td class="menusecondo">&nbsp;<a class="linkmenusecondo" href="modifica_iscritto.jsp">Modifica </a></td>
</tr>
<tr>
<td class="menusecondo">&nbsp;<a class="linkmenusecondo" href="cancella_iscritto.jsp">Cancella </a></td>
</tr>
<tr>
<td class="menusecondo">&nbsp;<a class="linkmenusecondo" href="lista_domanda_confermata.jsp">Convalida Iscrizione </a></td>
</tr>
</tbody></table>
<table class="lineadivisoria" width="100%" cellspacing="0" cellpadding="0" border="0">
<tbody><tr>
</tr>
</tbody></table>
<table class="lineadivisoria" width="100%" cellspacing="0" cellpadding="0" border="0">
<tbody><tr>
<td align="left" class="menuprimosel">&nbsp;<b>Gestione Personale</b></td>
</tr>
<tr>
<td class="menusecondo">&nbsp;<a class="linkmenusecondo" href="inserisci_personale.jsp">Inserisci</a></td>
</tr>
<tr>
<td class="menusecondo">&nbsp;<a class="linkmenusecondo" href="modifica_personale.jsp">Modifica</a></td>
</tr>
<tr>
<td class="menusecondo">&nbsp;<a class="linkmenusecondo" href="licenzia.jsp">Licenzia</a></td>
</tr>
</tbody></table>
<table class="lineadivisoria" width="100%" cellspacing="0" cellpadding="0" border="0">
<tbody><tr>
<td align="left" class="menuprimosel">&nbsp;<b>Gestione Pagamenti</b></td>
</tr>
<tr>
<td class="menusecondo">&nbsp;<a class="linkmenusecondo" href="stato_pagamenti.jsp">Stato Pagamenti</a></td>
</tr>
<tr>
<td class="menusecondo">&nbsp;<a class="linkmenusecondo" href="fatture_pagamenti.jsp">Fatture Pagamenti</a></td>
</tr>
<tr>
<td class="menusecondo">&nbsp;<a class="linkmenusecondo" href="registra_pagamenti.jsp">Registro Pagamenti</a></td>
</tr>
<tr>
<td class="menusecondo">&nbsp;<a class="linkmenusecondo" href="extra.jsp">Extra</a></td>
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


<table class="lineadivisoria" width="100%" cellspacing="0" cellpadding="0" border="0">
<tbody><tr>
<td align="left" class="menuprimosel">&nbsp;<b>Gestione Servizi</b></td>
</tr>
<tr>
<td class="menusecondo">&nbsp;<a class="linkmenusecondo" href="visualizza_orario_servizi.jsp">Visualizza Orario</a></td>
</tr>
<tr>
<td class="menusecondo">&nbsp;<a class="linkmenusecondo" href="modifica_orario_serivizo.jsp">Modifica Orario</a></td>
</tr>
<tr>
<td class="menusecondo">&nbsp;<a class="linkmenusecondo" href="modifica_piano_pasto.jsp">Modifica Piano Pasto</a></td>
</tr>
<tr>
<td class="menusecondo">&nbsp;<a class="linkmenusecondo" href="approva_richieste.jsp">Approva Richieste</a></td>
</tr>
<tr>
<td align="left" class="menuprimosel">&nbsp;<b>Gestione Graduatorie</b></td>
</tr>
<tr>
<td class="menusecondo">&nbsp;<a class="linkmenusecondo" href="graduatoria_ammessi.jsp">Graduatoria Amessi</a></td>
<tr>
<td class="menusecondo">&nbsp;<a class="linkmenusecondo" href="graduatoria_rifiutati.jsp">Graduatoria Rifiutati</a></td>
</tr>
</tbody></table>
<table class="lineadivisoria" width="100%" cellspacing="0" cellpadding="0" border="0">
<tbody><tr>
<td align="left" class="menuprimosel">&nbsp;<b>Gestione Classi</b></td>
</tr>
<tr>
<td class="menusecondo">&nbsp;<a class="linkmenusecondo" href="inserisci_classe.jsp">Inserisci Classe</a></td>
</tr>
<tr>
<td class="menusecondo">&nbsp;<a class="linkmenusecondo" href="assegna_classe.jsp">Assegna Classe</a></td>
</tr>
<tr>
<td class="menusecondo">&nbsp;<a class="linkmenusecondo" href="cancella_classe.jsp">Cancella Classe</a></td>
</tr>
</tbody></table>
<table class="lineadivisoria" width="100%" cellspacing="0" cellpadding="0" border="0">
<tbody><tr>
<td align="left" class="menuprimosel">&nbsp;<b>Gestione Tirocinanti</b></td>
</tr>

<tr>
<td class="menusecondo">&nbsp;<a class="linkmenusecondo" href="visualizza_tirocinanti.jsp">Visualizza</a></td>
</tr>
<tr>
<td class="menusecondo">&nbsp;<a class="linkmenusecondo" href="richieste_tirocinanti.jsp">Richieste</a></td>
</tr>
<tr>
<td class="menusecondo">&nbsp;<a class="linkmenusecondo" href="inserimento_giudizio_tirocinante.jsp">Inserimento Giudizio</a></td>
</tr>
</tbody></table>
<table class="lineadivisoria" width="100%" cellspacing="0" cellpadding="0" border="0">
<tbody><tr>
<td align="left" class="menuprimosel">&nbsp;<b>Registro Tirocinanti</b></td>
</tr>
<tr>
<td class="menusecondo">&nbsp;<a class="linkmenusecondo" href="inserisci_attivita_tirocinante.jsp">Inserisci Attivit&agrave;</a></td>
</tr>
<tr>
<td class="menusecondo">&nbsp;<a class="linkmenusecondo" href="modifica_attivita_tirocinante.jsp">Modifica Attivit&agrave;</a></td>
</tr>
<tr>
<td class="menusecondo">&nbsp;<a class="linkmenusecondo" href="elimina_attivita_tirocinante.jsp">Elimina Attivit&agrave;</a></td>
</tr>
</tbody></table>

