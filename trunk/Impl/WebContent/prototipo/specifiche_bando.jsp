<%@
	include file="atsilo_files/header.jsp"%>
<%@
	include file="atsilo_files/modifica_specifiche_bando.jsp"%>


<script type="text/javascript">	
	function checkDate(name, field) {
		var date = field.value;
		var reg = /^([0-9]{4})\-(0[1-9]|1[012])\-(0[1-9]|[12][0-9]|3[01])/;
		
		var m = date.match(reg);
		
		if (m == null) {
			alert('Campo ' + name + ': rispettare il formato YYYY-MM-DD inserendo una data corretta');
			return false;
		}
		

		var anno = parseInt(m[1]);
		var bisestile = (anno % 4 == 0 && (anno % 100 != 0 || anno % 400 == 0));

		var giorni_nel_mese = {
			11:30,
			4:30,
			6:30,
			9:30,
			2:(bisestile) ? 29 : 28,
			//Tutti gli altri ne han 31
		};
		
		var mesi = ["", "Gennaio", "Febbraio", "Marzo", "Aprile", "Maggio", "Giugno", "Luglio", "Agosto", "Settembre", "Ottobre", "Novembre", "Dicembre"];
		
		m[1] = parseInt(m[1]);
		m[2] = parseInt(m[2]);
		m[3] = parseInt(m[3]);
		
		if (giorni_nel_mese[m[2]] && m[3] > giorni_nel_mese[m[2]]) {
			alert('Campo ' + name + ': il mese di ' + mesi[m[2]] + ' non ha il giorno ' + m[3]);
			return false;
		}
		
		return true;
	}
	
	function checkForm(){
		var campi = ["inizioB", "fineB", "inizioP", "fineP", "fineR"];
	 	
		for (var i in campi) {
			if (!checkDate(campi[i], document.getElementById(campi[i]))) {
				return false;
			}
		}

	}
	
	function cambiaValori(){
		
		var change = "<form name='bando' id='im_bando' action='<%=request.getContextPath()%>/ServletControlBandoIM' method='post'> <table class='tabelle_form'> <tr> <td>Data inizio bando</td> <td><input name='iniziobando' type='text' id='inizioB' maxlength='16' value= '<%=dataInizioBando%>' /></td> </tr> <tr> <td>Data fine bando</td> <td> <input name='finebando' type='text' id='fineB' maxlength='20' value='<%=dataFineBando%>'/></td> </tr> <tr> <tr> <td>Data inizio presentazione rinuncia</td> <td><input name='iniziopresentazione' type='text' id='inizioP' maxlength='16' value='<%=dataInizioPresentazione%>'/></td> </tr> <tr> <td>Data fine presentazione rinuncia</td> <td><input name='finepresentazione' type='text' id='fineP' maxlength='20' value='<%=dataFinePresentazione%>'/></td> </tr> <tr> <td>Data fine rinuncia</td> <td><input name='finerinuncia' type='text' id='fineR' value='<%=dataFineRinuncia%>'/></td></tr><tr><td>Posti disponibili</td><td><input name='postidisp' type='text' id='postiD' size='7' maxlength='4' value='<%=posti%>' onkeypress='return isNumberKey(event)'  /></td> </tr><tr> <td>&nbsp;</td> <td>&nbsp;</td> </tr> <td></td> <td><input type='submit' name='salva' id='mod' value='Salva' onClick='return checkForm()'/></td> </tr> </table> </form>"
		
		document.getElementById("formdisplay").innerHTML = change;
		return false;
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
	if  (request.getParameter("successo") != null && !temp_nome_chiamante.equals("specifiche_bando.jsp") ) { 
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
											<td><input type="button" name="modifica" id="mod"
												value="Modifica" onClick="return cambiaValori();" /></td>
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