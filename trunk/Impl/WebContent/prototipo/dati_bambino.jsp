<%@
	include file="atsilo_files/header.jsp"%>
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
include file="atsilo_files/sidebar_genitore.jsp"%>
<img width="209" border="0" alt="" height="1"
	src="atsilo_images/clearpixel.gif">
</td>
<td class="content" valign="top" bgcolor="#ffffff"><%@
include
		file="atsilo_files/sidebar_top_bambino.jsp"%>
	<%@ page import="atsilo.application.*,atsilo.entity.*,java.util.*"%>
	<%
		// setto select bambino
			ControlDatiPersonali cdt= ControlDatiPersonali.getIstance();
		   	Utente utente=cdt.getValoriUtente(username);
		  	Genitore genitore_richiedente=cdt.getDatiGenitore(utente.getCodiceFiscale());//genitore richiedente
		  	List<Bambino> figli= new ArrayList<Bambino>();
		  	figli= cdt.getFigli(genitore_richiedente.getCodiceFiscale()); //lista dei figli
	%> 
     <script>
		function submitForm() {
			document.forms[0].submit();
		}
	</script>
       <!--Script per resettare campi --> 
  <script>
  function resetForm(){
 
  }
  </script>
     <%
 	//setta campi form una volta selezionato il nome del bambino
 	  String cfb=null;
 		String cognome="";
 		String nome="";
 		String codiceFiscale="";
 		String gg="" ;
		String mm="" ;
		String aa="" ;
  	    String comuneNascita=""; 
 		String cittadinanza=""; 
 		
 	 if (request.getParameter("select_bambini")!=null)
 	  cfb=(String)request.getParameter("select_bambini");
 	  cdt=ControlDatiPersonali.getIstance();
 	 Genitore genitore=new Genitore();
 	 
 	 if (cfb!=null && ! cfb.equals("null")){ 
 		Bambino bambino_selezionato=new Bambino();
    	bambino_selezionato=cdt.getDatiBambino(cfb);
 		cognome=bambino_selezionato.getCognome(); 
 		nome=bambino_selezionato.getNome();
 		codiceFiscale=bambino_selezionato.getCodiceFiscale(); 
 		Date tempDataNascita=bambino_selezionato.getDataNascita();
 		if (tempDataNascita != null) {
 			gg = tempDataNascita.toString().substring(8, 10);
 			mm = tempDataNascita.toString().substring(5, 7);
 			aa = tempDataNascita.toString().substring(0, 4);
 		}
  	    comuneNascita=bambino_selezionato.getComuneNascita(); 
 		cittadinanza=bambino_selezionato.getcittadinanza(); 

 	 }
 %> <!--Script per gestire i form --> <!--Script per gestire i form -->
	<script type="text/javascript">
		function settaAttributi(slf) {
			document
					.getElementById("dati_bando")
					.setAttribute("action",
							"http://localhost:8080/Atsilo/ServletCompilazioneDatiBando");
			document.getElementById("bottone_submit").setAttribute("value",
					"Salva");
			document.getElementById("bottone_submit").setAttribute("onClick",
					"return  controlloAndSubmit(this)");		
			var f = document.forms[0];
			var n = f.elements.length;
			for ( var i = 1; i < n; i++)
				document.forms[0].elements[i].removeAttribute("readonly");
				document.getElementById("bott_calendario").disabled=false;
				document.getElementById("select_bambini").removeAttribute(
					"onChange", "");//evito di fare submit del form tramite onChange		
				document.getElementById("select_bambini").setAttribute("readonly",
					"readonly");
				document.getElementById('select_bambini').options[0]=new Option("Aggiungi Bambino",null,true);
					
					
			//slf.onclick = null;
			return false;
		}
	</script>
    <script>
	function controlloAndSubmit(slf){
		if ( (document.getElementById("codice_fiscale_bambino").value).length!=16)
			alert("Controllare la correttezza dei campi");
		else
		document.forms[0].submit();
	}
		
	</script>
     <!--gestione calendar-->
 <script type="text/javascript" src="atsilo_files/CalendarDisplay110.js"></script>
<script type="text/javascript">
calendarTry = new CalendarDisplay();
calendarTry.setNavigationOn("calendarTry");
calendarTry.setOpenOn();
calendarTry.setAutoCloseOn();
calendarTry.setLinkOn("fillInFields");
calendarTry.setDayFormat(calendarTry.TWO_LETTER);
	
function calendarOpenerN()
	{
		var m = document.getElementById("month").value;
		var d = document.getElementById("day").value;
		var y = document.getElementById("year").value;
		var showMonth = true;
		if (m == ""|| d == "" || y == "")
			calendarTry.createMonth(0, 1, 1970);
		else
			calendarTry.createMonth(m - 1, d, y);
	}

	function fillInFields(month, day, year,c) {

		document.getElementById("month").value = month + 1;
		document.getElementById("day").value = day;
		document.getElementById("year").value = year;
	}

</script>
     <%
 	if ((request.getParameter("successo")) != null) {
 		if (request.getParameter("successo").equals("ok")) {
 			out.print("<script type=text/javascript>alert('Modifica effettuata con successo')</script>");
 		} else {
 			out.print("<script type=text/javascript>alert('Modifica fallita. Compila correttamente i campi')</script>");
 		}
 	}
 %>
	<form id="dati_bando" name="dati_bando" action="" method="post">
		<input name="chiamante" type="hidden" id="chiamante" value="bambino">
		<table width="80%" border="0" cellspacing="0">
			<tr>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td colspan="4"><label for="altrifisglinido_1">Selezionare
						il figlio dall'elenco se si vogliono modificare i suoi dati, altrimenti cliccare su modifica per aggiungere un nuovo bambino.</label><br></td>

			</tr>
			<tr>
				<td colspan="2"><select name="select_bambini" id="select_bambini"
							onfocus="popolaSelect(this)" onchange="submitForm()">
							<% out.print("<option value='null' >Selezionare Bambino</option>");
						String selected="";
						if(figli!=null)
						{
							  for (int i=0;i<figli.size();i++){
								  if (figli.get(i).getCodiceFiscale().equals(cfb))
									  selected="selected";
							  out.print("<option value='"+figli.get(i).getCodiceFiscale()+"'"+selected+" >"+figli.get(i).getNome()+"</option>");
							  }
						}
						%>
						</select></td>
				<td>&nbsp;</td>
			</tr>
			<tr>
			<tr>
				<td>Cognome</td>
				<td><input name="cognome_bambino" type="text"
					id="cognome_bambino" value="<%=cognome%>" size="25" maxlength="25"
					readonly="readonly"></td>
				<td>Nome</td>
				<td><input name="nome_bambino" type="text" id="nome_bambino"
					value="<%=nome%>" size="25" maxlength="50" readonly="readonly"></td>
			</tr>
			<tr>
				<td>Nato/a a</td>
				<td><input name="comune_nascita_bambino" type="text"
					id="comune_nascita_bambino" value="<%=comuneNascita%>" size="25" maxlength="25"
					readonly="readonly"></td>
				<td>Nato il</td>
    <td>
    <input name="day" type="text" id="day" value="<%=gg%>"  size="2" maxlength="2" readonly="readonly"><input name="month" type="text" id="month" value="<%=mm%>"  size="2" maxlength="2" readonly="readonly"><input name="year" type="text" id="year" value="<%=aa%>"  size="4" maxlength="4" readonly="readonly"><input name="bott_calendario" type="button" id="bott_calendario" onclick="calendarOpenerN(this.form);" value="..." disabled="disabled" /> 
    </td>
			</tr>
			<tr>
				<td>Codice Fiscale</td>
				<td><input name="codice_fiscale_bambino" type="text"
					id="codice_fiscale_bambino" value="<%=codiceFiscale%>" size="25" maxlength="16"
					readonly="readonly" /></td>
				<td>Cittadinanza</td>
				<td><input name="cittadinanza_bambino" type="text"
					id="cittadinanza_bambino" value="<%=cittadinanza%>" size="25" maxlength="25"
					readonly="readonly" /></td>
			</tr>
			<tr>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td></td>
				<td><input type="button" name="bottone_submit"
					id="bottone_submit" value="Modifica"
					onClick="return settaAttributi(this)" /> <input type="reset"
					name="reset" value="Annulla" /></td>
			</tr>
		</table>

	</form></td>
<!--Chiudi content -->


<%@
include file="atsilo_files/footer.jsp"%>