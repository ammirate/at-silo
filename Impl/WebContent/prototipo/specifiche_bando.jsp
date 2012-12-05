<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@
	include file="atsilo_files/header.jsp"%>
<%@
	include file="atsilo_files/modifica_specifiche_bando.jsp"%>
<%
	if ((request.getParameter("successo")) != null) {
		if (request.getParameter("successo").equals("ok")) {
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
								<td class="tplTitolo"><form name="creazione_account"
										action="" method="post">
										<table class="tabelle_form">
											<tr>
												<td>Data inizio bando</td>
												<td><input name="iniziobando" type="text" id="inzioB"
													maxlength="16" value="<%=dataInizioBando%>"  /></td>
											</tr>
											<tr>
												<td>Data fine bando</td>
												<td><input name="finebando" type="text" id="fineB"
													maxlength="20" value="<%=dataFineBando%>"  /></td>
											</tr>
											<tr>
											<tr>
												<td>Data inizio presentazione rinuncia</td>
												<td><input name="iniziopresentazione" type="text"
													id="inizioP" maxlength="16"  /></td>
											</tr>
											<tr>
												<td>Data fine presentazione rinuncia</td>
												<td><input name="finepresentazione" type="text"
													id="fineP" maxlength="20"  /></td>
											</tr>
											<tr>
												<td>Data fine rinuncia</td>
												<td><input name="finerinuncia" type="text" id="fineR"
													 /></td>
											</tr>
											<tr>
												<td>Posti disponibili</td>
												<td><input name="postidisp" type="text" id="postiD"
													size="7" maxlength="4"  /></td>
											</tr>
											<tr>
												<td>&nbsp;</td>
												<td>&nbsp;</td>
											</tr>
											<td></td>
											<td><input type="submit" name="modifica"
												value="" onclick="" /></td>
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