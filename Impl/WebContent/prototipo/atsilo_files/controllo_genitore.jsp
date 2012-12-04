<%
//da includere in tutte le pagine della tipologia genitore
//controllo se utente può visualizzare pagina genitore

	if (!tipologia.equals("genitore") )
		response.sendRedirect("index_genitore.jsp");
%>