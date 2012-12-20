<%@
	include file="atsilo_files/header.jsp"%>
<%@ page import="atsilo.application.*,atsilo.entity.*"%>

<%
	if   (request.getParameter("successo") != null && !temp_nome_chiamante.equals("assegna_classe.jsp") ) { 
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
include file="atsilo_files/sidebar_impiegato.jsp"%>

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
<form action="http://localhost:8080/Atsilo/ServletControlClasseAss" method="post">
<table class="tabella_form">

<%
ControlClassi crt = ControlClassi.getIstance();
int i=0;
int n= crt.bambiniSenzaClasse().size();
if(n==0){
	out.print("<h1>Non ci sono bambini sprovvisti di classe</h1>");
}
else{
%>
<tr>
<td>Nome</td><td>Cognome</td><td>Codice Fiscale</td><td>Classe</td>
</tr>
<%	
String id = "";
for(i=0;i<n;i++){
	out.append("<tr><td>")
		.append(crt.bambiniSenzaClasse().get(i).getNome())
		.append("</td><td>")
		.append(crt.bambiniSenzaClasse().get(i).getCognome())
		.append("</td><td>")
		.append(crt.bambiniSenzaClasse().get(i).getCodiceFiscale())
		.append("</td><td>")
		.append("<select name='")
		.append(crt.bambiniSenzaClasse().get(i).getCodiceFiscale())
		.append("_"+i)
		.append("' size='1' >")
		.append("<option value='-5' SELECTED>Seleziona Classe</option>");
	for(int k=0; k< crt.getClassi().size();k++){
		id = ""+ crt.getClassi().get(k).getId();
		out.append("<option value='")
		.append(id)
		.append("'>")
		.append(crt.getClassi().get(k).getSezione())
		.append("</option>");
	}
	out.append("</select></td></tr>");
	out.append("<input type='hidden' name='"+i+"' value='"+crt.bambiniSenzaClasse().get(i).getCodiceFiscale()+"' />");
}
%>
</table>
<input type="hidden" name="lunghezzaLista" value="<%= n %>" />
<input type="submit" value="Invia" id="invia" name="invia" /><input type="reset" value="Cancella" id="cancella" name="cancella" />
<%} %>
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