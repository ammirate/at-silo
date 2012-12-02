<%
//controllo se utente può visualizzare pagina

	if (!tipologia.equals("genitore") )
		response.sendRedirect("errore_accesso.html");
%>