<%@
	include file="atsilo_files/header.jsp"%>
<%@ page import="atsilo.application.*,atsilo.entity.*,java.sql.*"%>


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
include file="atsilo_files/autoinclude_sidebar_giusta_tipologia.jsp"%>
<img width="209" border="0" alt="" height="1"
	src="atsilo_images/clearpixel.gif">
</td>
<td class="content" valign="top" bgcolor="#ffffff"><h2><em>Graduatoria Ammessi</em></h2><table
		cellspacing="10" cellpadding="0" border="0" width="100%">
		<tbody>
			<tr>
				<td><table border="0">
						<tbody>
							<tr>
								<td class="tplTitolo">
								
<table class="tabella_form">
<%
	ControlGestioneBando crt = ControlGestioneBando.getIstance();
	if (crt.getGraduatoriaIdonei() == null) {
		out.print("<h1>Non si è ancora concluso il bando o la graduatoria non è ancora disponibile</h1>");
	}

	else if (crt.getGraduatoriaIdonei().size() == 0) {
		out.print("<h1>Non ci sono domande da mostrare");
	} else if(crt.getGraduatoriaIdonei().size()>0) {
		int n = crt.getGraduatoriaIdonei().size();
		int k=1;
		java.util.List<DomandaIscrizione> l = crt.getGraduatoriaIdonei();
		for(int i=0;i<n;i++){
			out.append("<tr><td>")
			.append(""+k)
			.append("</td><td>")
			.append(crt.getGraduatoriaIdonei().get(i).getBambino().getNome())
			.append("</td><td>")
			.append(crt.getGraduatoriaIdonei().get(i).getBambino().getCognome())
			.append("</td><td>")
			.append(""+crt.getGraduatoriaIdonei().get(i).getPunteggio())
			.append("</td></tr>");
		k++;
		}
	}
%>

</table>

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
</html></html>