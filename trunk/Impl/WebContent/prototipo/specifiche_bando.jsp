<%@
	include file="atsilo_files/header.jsp"%>
<%@
	include file="atsilo_files/modifica_specifiche_bando.jsp"%>


<script type="text/javascript">
	function cambiaValori(slf){
		document.getElementById("im_bando").setAttribute("action","http://localhost:8080/Atsilo/ServletControlBandoIM");
		document.getElementById("inizioB").removeAttribute("readonly");
		document.getElementById("fineB").removeAttribute("readonly");
		document.getElementById("inizioP").removeAttribute("readonly");
		document.getElementById("fineP").removeAttribute("readonly");
		document.getElementById("postiD").removeAttribute("readonly");
		document.getElementById("fineR").removeAttribute("readonly");
		document.getElementById("mod").setAttribute("value","Salva");
		slf.onClick=null;
		return false;
	}
</script>


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
								<td class="tplTitolo"><form name="bando" id="im_bando"
										action="" method="post">
										<table class="tabelle_form">
											<tr>
												<td>Data inizio bando</td>
												<td><input name="iniziobando" type="text" id="inizioB"
													maxlength="16" value="<%=dataInizioBando%>" readonly="readonly"  /></td>
											</tr>
											<tr>
												<td>Data fine bando</td>
												<td><input name="finebando" type="text" id="fineB"
													maxlength="20" value="<%=dataFineBando%>" readonly="readonly" /></td>
											</tr>
											<tr>
											<tr>
												<td>Data inizio presentazione rinuncia</td>
												<td><input name="iniziopresentazione" type="text"
													id="inizioP" maxlength="16"  value="<%=dataInizioPresentazione%>" readonly="readonly" /></td>
											</tr>
											<tr>
												<td>Data fine presentazione rinuncia</td>
												<td><input name="finepresentazione" type="text"
													id="fineP" maxlength="20" value="<%=dataFinePresentazione%>" readonly="readonly" /></td>
											</tr>
											<tr>
												<td>Data fine rinuncia</td>
												<td><input name="finerinuncia" type="text" id="fineR" value="<%=dataFineRinuncia%>"
													 readonly="readonly" /></td>
											</tr>
											<tr>
												<td>Posti disponibili</td>
												<td><input name="postidisp" type="text" id="postiD"
													size="7" maxlength="4" value="<%=posti%>" readonly="readonly" /></td>
											</tr>
											<tr>
												<td>&nbsp;</td>
												<td>&nbsp;</td>
											</tr>
											<td></td>
											<td><input type="submit" name="modifica" id="mod"
												value="Modifica" onClick="return cambiaValori(this)" /></td>
											</tr>

										</table>
									</form></td>
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