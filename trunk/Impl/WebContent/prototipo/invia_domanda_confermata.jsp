<%@
 include file="atsilo_files/header.jsp" %>
<%@ page import="atsilo.application.*,atsilo.entity.*"%>



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
								
<form action="http://localhost:8080/Atsilo/ServletDomandaIscrizioneConvalida" method="post">
<% 
%>
<table class="tabella_form">

<%
ControlIscrizione crt = ControlIscrizione.getIstance();
String domanda = request.getParameter("domanda");
DomandaIscrizione dom = crt.getDomandaIscrizione(Integer.parseInt(domanda));

out.append("<tr colspan=3><td>")
	.append("Certificato malattie virali conseguite")
	.append("</td></tr>")
	.append("<tr><td>")
	.append("<input type='radio' value='Consegnato' name='cMalattie' />Consegnato</td>")
	.append("<td><input type='radio' value='NonConsegnato' name='cMalattie' />Rifiuta la consegna</td>")
	.append("<td><input type='radio' value='InAttesa' name='cMalattie' />In attesa di consegna</td></tr>")
    .append("<tr colspan=3><td>")
	.append("Liberatoria per il trattamento dei dati personali")
	.append("</td></tr>")
	.append("<tr><td>")
	.append("<input type='radio' value='Consegnato' name='cPrivacy' />Consegnato</td>")
	.append("<td><input type='radio' value='NonConsegnato' name='cPrivacy' />Rifiuta la consegna</td>")
	.append("<td><input type='radio' value='InAttesa' name='cPrivacy' />In attesa di consegna</td></tr>")
	.append("<tr colspan=3><td>")
	.append("Certificati delle vaccinazioni conseguite")
	.append("</td></tr>")
	.append("<tr><td>")
	.append("<input type='radio' value='Consegnato' name='cVaccino' />Consegnato</td>")
	.append("<td><input type='radio' value='NonConsegnato' name='cVaccino' />Rifiuta la consegna</td>")
	.append("<td><input type='radio' value='InAttesa' name='cVaccino' />In attesa di consegna</td></tr>");
out.print("<input type='hidden' value='"+dom.getBambino().getCodiceFiscale()+"_"+dom.getId()+"' name='cf_id' />");


%>
</table>
<input type="submit" value="Convalida" id="conv" name="submit" />

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