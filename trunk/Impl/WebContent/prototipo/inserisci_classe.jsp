<%@
	include file="atsilo_files/header.jsp"%>
<%@ page import="atsilo.application.*,atsilo.entity.*"%>


<%
	if   {
		if (request.getParameter("successo").equals("y")) {
			out.print("<script type=text/javascript>alert('Modifica salvata con successo')</script>");
		}
		else {
			out.print("<script type=text/javascript>alert('Modifica fallita')</script>");
		}
	}
%>

<script type="text/javascript">
function checkForm(){
	var reg = /^([0-9]{1})([A-Z]{1})/;
	var stringa = String(document.getElementById("classe").value);
	if(stringa.match(reg) == null){
		alert("Rispettare il formato NumeroLettera per l'inserimento delle classi (es: 1A)");
		return false;
	}	
}


</script>

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
<form action="http://localhost:8080/Atsilo/ServletControlClasseIns" method="post">

Le seguenti classi sono già presenti : <br />
<%
	ControlClassi crt = ControlClassi.getIstance();
	int n=  crt.getClassi().size();
	for(int i=0; i<n;i++){
	out.print(crt.getClassi().get(i).getSezione()+", ");
	}
%>

<table class="tabella_form">
<tr>
<td>Sezione :</td><td><input type="text" name="classe" id="classe" /></td>
</tr>
</table>
<input type="submit" value="Salva" id="salva" name="salva" onclick= "return checkForm()"/> <input type="reset" value="cancella" />


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