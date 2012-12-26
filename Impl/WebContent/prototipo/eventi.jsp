<%@
	include file="atsilo_files/header.jsp" %>

<%
 Date dataCorrente = new Date(System.currentTimeMillis());
  int anno = dataCorrente.getYear();
  anno += 1900;
  int mese = dataCorrente.getMonth();
%>




<script type="text/javascript" src="atsilo_files/CalendarDisplay110.js"></script>
<script type="text/javascript">


calendarTry = new CalendarDisplay();
calendarTry.setNavigationOn("calendarTry");
calendarTry.setOpenOn();
calendarTry.setAutoCloseOn();
calendarTry.setLinkOn("fillInFields");
calendarTry.setDayFormat(calendarTry.TWO_LETTER);
	
function calendarOpener(frm)
{
	var m = frm.month.options[frm.month.selectedIndex].value;
	var d = frm.day.value;
	var y = frm.year.value;
	var showMonth = true;
	calendarTry.createMonth(m, d, y);
	
}

function fillInFields(month, day, year)
{
	document.frmCalendar.month.selectedIndex = month;
	document.frmCalendar.day.value = day;
	document.frmCalendar.year.value = year;
}

function inviaData(){
	document.getElementById("frm").setAttribute("action","<%=request.getContextPath()%>/prototipo/lista_evento.jsp");
	document.getElementById("frm").setAttribute("method","post");
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
include file="atsilo_files/autoinclude_sidebar_giusta_tipologia.jsp"%>
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

<form id="frm" name="frmCalendar">
<table border="1" cellpadding="5" cellspacing="0">
	<tr>
		<td>Mese</td>
		<td>Giorno (1-31)</td>
		<td>Anno (es. 2012)</td>
	</tr>
	<tr>
		<td align="center">
			<select name="month">
			<%if (mese == 0){%>
				<option value="0" selected>Gennaio</option>
			<%}else{ %>
			<option value="0" >Gennaio</option>
			<%} %>
			<%if (mese == 1){%>
				<option value="1" selected>Febbraio</option>
			<%}else{ %>
			<option value="1" >Febbraio</option>
			<%} %>
			<%if (mese == 2){%>
				<option value="2" selected>Marzo</option>
			<%}else{ %>
			<option value="2" >Marzo</option>
			<%} %>
			<%if (mese == 3){%>
				<option value="3" selected>Aprile</option>
			<%}else{ %>
			<option value="3" >Aprile</option>
			<%} %>
			<%if (mese == 4){%>
				<option value="4" selected>Maggio</option>
			<%}else{ %>
			<option value="4" >Maggio</option>
			<%} %>
			<%if (mese == 5){%>
				<option value="5" selected>Giugno</option>
			<%}else{ %>
			<option value="5" >Giugno</option>
			<%} %>
			<%if (mese == 6){%>
				<option value="6" selected>Luglio</option>
			<%}else{ %>
			<option value="6" >Luglio</option>
			<%} %>
			<%if (mese == 7){%>
				<option value="7" selected>Agosto</option>
			<%}else{ %>
			<option value="7" >Agosto</option>
			<%} %>
			<%if (mese == 8){%>
				<option value="8" selected>Settembre</option>
			<%}else{ %>
			<option value="8" >Settembre</option>
			<%} %>
			<%if (mese == 9){%>
				<option value="9" selected>Ottobre</option>
			<%}else{ %>
			<option value="9" >Ottobre</option>
			<%} %>
			<%if (mese == 10){%>
				<option value="10" selected>Novembre</option>
			<%}else{ %>
			<option value="10" >Novembre</option>
			<%} %>
			<%if (mese == 11){%>
				<option value="11" selected>Dicembre</option>
			<%}else{ %>
			<option value="11" >Dicembre</option>
			<%} %>
			</select>
		</td>
		<td align="center"><input type="text" name="day" size="3" readonly="readonly"/></td>
		<td align="center"><input type="text" name="year" size="5" value="<%= anno %>" readonly="readonly" /></td>
	</tr>

	<tr>
		<td colspan="3" align="center">
		<input type="button" value="Apri Calendario" onclick="calendarOpener(this.form);" /> <input type="submit" onclick="inviaData()" value="Invia" name="invia" />
		</td>
	</tr>
</table>
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