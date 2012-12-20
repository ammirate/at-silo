<%@
	include file="atsilo_files/header.jsp"%>
<%@ page import="atsilo.application.*,atsilo.entity.*"%>

<%
	if  (request.getParameter("successo") != null && !temp_nome_chiamante.equals("lista_punteggio.jsp") ) { 
		if (request.getParameter("successo").equals("y")) {
			out.print("<script type=text/javascript>alert('Modifica salvata con successo')</script>");
		}
		else {
			out.print("<script type=text/javascript>alert('Modifica fallita')</script>");
		}
	}
%>

<table width="100%" cellspacing="0" cellpadding="0" border="0">
	<tbody>
		<tr>
			<td class="breadcrumb " align="left"><p>
					</a>
				</p>
				<p>&nbsp;</p></td>
		</tr>
	</tbody>
</table>
<%@
include file="atsilo_files/sidebar_impiegato_bando.jsp"%>
<img width="209" border="0" alt="" height="1"
	src="atsilo_images/clearpixel.gif">
</td>
<td class="content" valign="top" bgcolor="#ffffff"><table
		cellspacing="10" cellpadding="0" border="0" width="100%">
		<tbody>
			<tr>
				<td><table border="0">
						<tbody>
							<tr>
								<td class="tplTitolo">
<form action="http://localhost:8080/Atsilo/prototipo/invia_punteggio.jsp" method="post">
<table class="tabella_form">

<%
ControlGestioneBando crt = ControlGestioneBando.getIstance();
int n = crt.getDomandeInAttesaDiPunteggio().size();
if(n==0){
	out.print("<h1>Non sono presenti domande in attesa di valutazione</h1>");
}
else
{
	out.print("<tr><td>#</td><td>Nome</td><td>Cognome</td><td>Data Nascita</td></tr>");
	for(int i=0;i<n;i++){

		out.append("<tr><td><input type='radio' name='domanda' value='")
			.append(""+crt.getDomandeInAttesaDiPunteggio().get(i).getId())
			.append("' />")
			.append("</td><td>")
			.append(crt.getDomandeInAttesaDiPunteggio().get(i).getBambino().getNome())
			.append("</td><td>")
			.append(crt.getDomandeInAttesaDiPunteggio().get(i).getBambino().getCognome())
			.append("</td><td>")
			.append(crt.getDomandeInAttesaDiPunteggio().get(i).getBambino().getDataNascita().toString())
			.append("</td><td></tr>");
	}


%>
</table>
<input type="submit" value="Invia" id="inv" name="invia" /><input type="reset" value="Cancella" />
<% } %>
</form>
								</td>
							</tr>
						</tbody>
					</table></td>
			</tr>
			<tr>
				<td><table cellspacing="0" cellpadding="0" border="0">
						<tbody>
							<tr>
								<td><table width="598" cellspacing="0" cellpadding="0"
										border="0">
									</table></td>
							</tr>
							<tr>
								<td><img border="0" alt="" height="20" width="1"
									src="atsilo_files/clearpixel.gif" /></td>
							</tr>
						</tbody>
					</table></td>
			</tr>

		</tbody>
	</table></td>
<td class="fasciadxvariabile"></td>
</tr>
<%@
include file="atsilo_files/footer.jsp"%>






</body>
</html>