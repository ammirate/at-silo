<%@
	include file="atsilo_files/header.jsp"%>
<%@
	include file="atsilo_files/modifica_specifiche_bando.jsp"%>


<script type="text/javascript">
	function cambiaValori(){
		
		var change = "<form name='bando' id='im_bando' action='http://localhost:8080/Atsilo/ServletControlBandoIM' method='post'> <table class='tabelle_form'> <tr> <td>Data inizio bando</td> <td><input name='iniziobando' type='text' id='inizioB' maxlength='16' value= '<%=dataInizioBando%>' /></td> </tr> <tr> <td>Data fine bando</td> <td> <input name='finebando' type='text' id='fineB' maxlength='20' value='<%=dataFineBando%>'/></td> </tr> <tr> <tr> <td>Data inizio presentazione rinuncia</td> <td><input name='iniziopresentazione' type='text' id='inizioP' maxlength='16' value='<%=dataInizioPresentazione%>'/></td> </tr> <tr> <td>Data fine presentazione rinuncia</td> <td><input name='finepresentazione' type='text' id='fineP' maxlength='20' value='<%=dataFinePresentazione%>'/></td> </tr> <tr> <td>Data fine rinuncia</td> <td><input name='finerinuncia' type='text' id='fineR' value='<%=dataFineRinuncia%>'/></td></tr><tr><td>Posti disponibili</td><td><input name='postidisp' type='text' id='postiD' size='7' maxlength='4' value='<%=posti%>' onkeypress='return isNumberKey(event)'  /></td> </tr><tr> <td>&nbsp;</td> <td>&nbsp;</td> </tr> <td></td> <td><input type='submit' name='salva' id='mod' value='Salva' onClick='return checkForm()'/></td> </tr> </table> </form>"
		
		document.getElementById("formdisplay").innerHTML = change;
	}
	
	function checkForm(){
	    var reg = /^[0-9]{4}\-(0[1-9]|1[012])\-(0[1-9]|[12][0-9]|3[01])/;
		var inizioB = String(document.getElementById("inizioB").value);
		var fineB = String(document.getElementById("fineB").value);
		var inizioP = String(document.getElementById("inizioP").value);
		var fineP = String(document.getElementById("fineP").value);
		var fineR = String(document.getElementById("fineR").value);
		
		 if((reg.test(inizioB))== false){
			 alert('rispettare il formato YYYY-MM-DD inserendo una data corretta');
			 return false;
		 }
		 if((reg.test(fineB))== false){
			 alert('rispettare il formato YYYY-MM-DD inserendo una data corretta');
			 return false;
		 }
		 if((reg.test(inizioP))== false){
			 alert('rispettare il formato YYYY-MM-DD inserendo una data corretta');
			 return false;
		 }
		 if((reg.test(fineP))== false){
			 alert('rispettare il formato YYYY-MM-DD inserendo una data corretta');
			 return false;
		 }
		 if((reg.test(fineR))== false){
			 alert('rispettare il formato YYYY-MM-DD inserendo una data corretta');
			 return false;
		 }
	}
    function isNumberKey(evt)
    {
       var charCode = (evt.which) ? evt.which : event.keyCode
       if (charCode > 31 && (charCode < 48 || charCode > 57))
          return false;

       return true;
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
								<td class="tplTitolo">
								<div id="formdisplay">
								<form name="bando" id="im_bando"
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
												value="Modifica" onClick="cambiaValori()" /></td>
											</tr>

										</table>
									</form>
									</div>
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