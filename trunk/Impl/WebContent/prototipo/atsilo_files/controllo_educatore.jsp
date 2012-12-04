<%
//da includere in tutte le pagine della tipologia educatore
//controllo se utente può visualizzare pagina educatore

	if (!tipologia.equals("educatore") )
		response.sendRedirect("index_educatore.jsp");
%>