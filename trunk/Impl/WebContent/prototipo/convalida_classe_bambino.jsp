<%@
 include file="atsilo_files/header.jsp" %>
<%@ page import="atsilo.application.*,atsilo.entity.*"%>

<%
	if ((request.getParameter("successo")) != null) {
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
include file="atsilo_files/sidebar_delegato.jsp"%>
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
								
<form action="http://localhost:8080/Atsilo/ServletConvalidaClasseBambino" method="post">
<% 
%>
<table class="tabella_form">

<%
ControlClassi crt = ControlClassi.getIstance();
int i=0;
int n= crt.bambiniConClasseDaConvalidare().size();
if(n == 0){
	out.print("<h1> Non è presente nessuna classe da convalidare</h1>");
}
else{
String input = "<input type='checkbox' name='classi' value='";
String endInput = "' />";
for(i=0;i<n;i++){
	String id = ""+crt.bambiniConClasseDaConvalidare().get(i).getClasse();
	out.append("<tr><td>")
		.append(input)
		.append(crt.bambiniConClasseDaConvalidare().get(i).getCodiceFiscale()+"_"+id)
		.append(endInput)
		.append("Bambino : <b>")
		.append(crt.bambiniConClasseDaConvalidare().get(i).getNome()+" "+crt.bambiniConClasseDaConvalidare().get(i).getCognome()+" "+crt.getClasseById(Integer.parseInt(id)).getSezione())
		.append("</b></td></tr>");
}
%>
</table>
<input type="submit" value="Convalida" id="conv" name="submit" /> <input type="submit" value="Riggetta" id="conv" name="submit" />
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