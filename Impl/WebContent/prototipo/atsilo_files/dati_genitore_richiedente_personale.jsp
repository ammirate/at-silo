<%@page import="atsilo.util.AtsiloConstants"%>
<%@ page import="atsilo.application.*,atsilo.entity.*,java.sql.Date"
 %>
 <%
 	//ControlDatiPersonali cdt= ControlDatiPersonali.getIstance();//istruzioni presenti nella pagina dati_genitore_richiedente
  	//Utente utente=cdt.getUtenteFromUsername(username);//istruzioni presenti nella pagina dati_genitore_richiedente
 	Genitore genitore=cdt.getDatiGenitore(utente.getCodiceFiscale());
  	String cognome=genitore.getCognome();
  	String nome=genitore.getNome();
  	String codiceFiscale=genitore.getCodiceFiscale();
  	Date tempDataNascita=genitore.getDataNascita();
  	String gg="";
  	String mm="";
  	String aa="";
 	if (tempDataNascita != null) {
 		gg = tempDataNascita.toString().substring(8, 10);
 		mm = tempDataNascita.toString().substring(5, 7);
 		aa = tempDataNascita.toString().substring(0, 4);
 	}
 	String comuneNascita = genitore.getComuneNascita();
 	String telefono = genitore.getTelefono();
 	String cittadinanza = genitore.getcittadinanza();
 	String indirizzoResidenza = genitore.getIndirizzoResidenza();
 	String numeroCivicoResidenza = genitore.getNumeroCivicoResidenza();
 	String capResidenza = genitore.getCapResidenza();
 	String comuneResidenza = genitore.getComuneResidenza();
 	String provinciaResidenza = genitore.getProvinciaResidenza();
 	String indirizzoDomicilio = genitore.getIndirizzoDomicilio();
 	String numeroCivicoDomicilio = genitore.getNumeroCivicoDomicilio();
 	String capDomicilio = genitore.getCapDomicilio();
 	String comuneDomicilio = genitore.getComuneDomicilio();
 	String provinciaDomicilio = genitore.getProvinciaDomicilio();
 	int statusLavorativo = genitore.getStatusLavorativo();
 	Date annoScadenzaContratto=genitore.getScadenzaContratto();
 	String scadenzaContratto="";
 	if(annoScadenzaContratto!=null)
	{
 		scadenzaContratto=annoScadenzaContratto.toString();
		scadenzaContratto=scadenzaContratto.substring(0, 4);
	}
 	String rapportoParentela = genitore.getRapportoParentela();
 %>
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

<form id="dati_bando" name="dati_bando" action="" method="post" >
<input name="chiamante" type="hidden" id="chiamante" value="genitore">
<table border="0" cellspacing="0" >
  <tr>
    <td>In qualita' di</td>
    <td><select id="rapportoParentela" name="rapportoParentela" disabled="disabled">
				   <%
				     out.append("<option value='null' selected>Seleziona</option>");
							  if (rapportoParentela != null && rapportoParentela.equals("Padre"))
						        out.append("<option value='Padre' selected>Padre</option>");
							  else
								  out.append("<option value='Padre' >Padre</option>");
							  if (rapportoParentela != null && rapportoParentela.equals("Madre"))
							        out.print("<option value='Madre' selected>Madre</option>");
							  else
								  out.append("<option value='Madre' >Madre</option>");
							  if (rapportoParentela != null && rapportoParentela.equals("Tutore"))
								  out.append("<option value='Tutore' selected>Tutore</option>");
							  else
								  out.append("<option value='Tutore' >Tutore</option>");
							  if (rapportoParentela != null && rapportoParentela.equals("Affidatario"))
								  out.append("<option value='Affidatario' selected>Affidatario</option>");
							  else
								  out.append("<option value='Affidatario' >Affidatario</option>");
		
				   %>
				</select></td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>Cognome</td>
    <td> <input name="cognome" type="text" id="cognome" value="<%=cognome %>" size="25" maxlength="25" readonly="readonly"></td>
    <td>Nome</td>
    <td> <input name="nome" type="text" id="nome" value="<%=nome %>" size="25" maxlength="50" readonly="readonly"></td>
  </tr>
  <tr>
    <td>Nato/a a</td>
    <td><input name="comuneNascita" type="text" id="comuneNascita" value="<%=comuneNascita%>"  size="25" maxlength="25" readonly="readonly"></td>
    <td>Nato il</td>
    <td>
    <input name="day" type="text" id="day" value="<%=gg%>"  size="2" maxlength="2" readonly="readonly"><input name="month" type="text" id="month" value="<%=mm%>"  size="2" maxlength="2" readonly="readonly"><input name="year" type="text" id="year" value="<%=aa%>"  size="4" maxlength="4" readonly="readonly"><input name="bott_calendario" type="button" id="bott_calendario" onclick="calendarOpenerN(this.form);" value="..." disabled="disabled" /> 
    </td>
  </tr>
  <tr>
    <td>Codice Fiscale</td>
    <td><input name="codiceFiscale" type="text" id="codiceFiscale" value="<%=codiceFiscale %>"  size="25" maxlength="16" readonly="readonly" /></td>
    <td>Cittadinanza</td>
    <td><input name="cittadinanza" type="text" id="cittadinanza" value="<%=cittadinanza %>"  size="25" maxlength="25" readonly="readonly" /></td>
  </tr>
  <tr>
    <td>Residente a</td>
    <td><input name="comuneResidenza" type="text" id="comuneResidenza" value="<%=comuneResidenza%>"  size="25" maxlength="25" readonly="readonly" /></td>
    <td>Via/Piazza</td>
    <td><input name="indirizzoResidenza" type="text" id="indirizzoResidenza" value="<%=indirizzoResidenza%>"  size="25" maxlength="25" readonly="readonly" /></td>
  </tr>
  <tr>
    <td>Numero civico</td>
    <td><input name="numeroCivicoResidenza" type="text" id="numeroCivicoResidenza" value="<%=numeroCivicoResidenza %>"  size="25" maxlength="5" readonly="readonly" /></td>
    <td>CAP</td>
    <td><input name="capResidenza" type="text" id="capResidenza" value="<%=capResidenza %>"  size="5" maxlength="5" readonly="readonly" /></td>
  <tr>
    <td>Provincia</td>
    <td><input id="provinciaResidenza" value="<%=provinciaResidenza %>" name="provinciaResidenza"  size="2" maxlength="2" type="text" /></td>
   
     <td>Telefono</td>
    <td><input name="telefono" type="text" id="telefono" value="<%=telefono %>"  size="25" maxlength="15" readonly="readonly" /></td>
  </tr>
   
    <tr>
      <td colspan="4"><p>&nbsp;</p>
      <p>Compilare i campi sottostanti solo se il domicilio &egrave; diverso dalla residenza</p></td></tr>
  </tr>
  
    <td>Domiciliato a</td>
    <td><input name="domiciliato_a" type="text" id="domiciliato_a" value="<%=comuneDomicilio%>"  size="25" maxlength="25" readonly="readonly" /></td>
    <td>Via/Piazza</td>
    <td><input name="indirizzoDomicilio" type="text" id="indirizzoDomicilio" value="<%=comuneDomicilio%>"  size="25" maxlength="25" readonly="readonly" /></td>
  </tr>
  <tr>
    <td>Numero civico</td>
    <td><input name="numeroCivicoDomicilio" type="text" id="numeroCivicoDomicilio" value="<%=numeroCivicoDomicilio%>"  size="25" maxlength="5" readonly="readonly" /></td>
    <td>CAP</td>
    <td><input name="capDomicilio" type="text" id="capDomicilio" value="<%=capDomicilio%>"  size="5" maxlength="5" readonly="readonly" /></td>
  <tr>
    <td>Provincia</td>
    <td><input name="provinciaDomicilio" type="text" id="provinciaDomicilio" value="<%=provinciaDomicilio%>"  size="2" maxlength="2" readonly="readonly" /></td>
    </tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td colspan="2"> Indicare status lavorativo</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
  <td colspan="4"><select id="status_lavorativo" name="status_lavorativo"  disabled >
  <%
				     out.append("<option value='-1' selected>Selezionare</option>");
  							String selected="";
							  if (statusLavorativo >0 && statusLavorativo==1)
								  selected="selected";
						       out.append("<option value='1' "+selected+" >"+AtsiloConstants.STATUS_LAVORATIVO_1+"");
						      
						      selected="";
							  if (statusLavorativo >0  && statusLavorativo==2)
								  selected="selected";
							  out.append("<option value='2' "+selected+" >"+AtsiloConstants.STATUS_LAVORATIVO_2+"");
							  
							  selected="";
							  if (statusLavorativo >0  && statusLavorativo==3)
								  selected="selected";
							  out.append("<option value='3' "+selected+" >"+AtsiloConstants.STATUS_LAVORATIVO_3+"");
							  
							  selected="";
							  if (statusLavorativo >0  && statusLavorativo==4)
								  selected="selected";
							  out.append("<option value='4' "+selected+" >"+AtsiloConstants.STATUS_LAVORATIVO_4+"");
							  
							  selected="";
							  if (statusLavorativo >0  && statusLavorativo==5)
								  selected="selected";
							  out.append("<option value='5' "+selected+" >"+AtsiloConstants.STATUS_LAVORATIVO_5+"");
							  
							  selected="";
							  if (statusLavorativo >0  && statusLavorativo==6)
								  selected="selected";
							  out.append("<option value='6' "+selected+" >"+AtsiloConstants.STATUS_LAVORATIVO_6+"");
							  
							  selected="";
							  if (statusLavorativo >0  && statusLavorativo==7)
								  selected="selected";
							  out.append("<option value='7' "+selected+" >"+AtsiloConstants.STATUS_LAVORATIVO_7+"");
							  
							  selected="";
							  if (statusLavorativo >0  && statusLavorativo==8)
								  selected="selected";
							  out.append("<option value='8' "+selected+" >"+AtsiloConstants.STATUS_LAVORATIVO_8+"");
							  
							  selected="";
							  if (statusLavorativo >0  && statusLavorativo==9)
								  selected="selected";
							  out.append("<option value='9' "+selected+" >"+AtsiloConstants.STATUS_LAVORATIVO_9+"");
							  
							  selected="";
							  if (statusLavorativo >0  && statusLavorativo==10)
								  selected="selected";
							  out.append("<option value='10' "+selected+" >"+AtsiloConstants.STATUS_LAVORATIVO_10+"");
							  
							  selected="";
							  if (statusLavorativo >0  && statusLavorativo==11)
								  selected="selected";
							  out.append("<option value='11' "+selected+" >"+AtsiloConstants.STATUS_LAVORATIVO_11+"");
							  
							  selected="";
							  if (statusLavorativo >0  && statusLavorativo==12)
								  selected="selected";
							  out.append("<option value='12' "+selected+" >"+AtsiloConstants.STATUS_LAVORATIVO_12+"");
							  
							  
							  
							 
	 
		
				   %>
  
  
  <!--  
  
    <option value="null">Selezionare</option>
<option value="di essere dipendente di ruolo in qualit&agrave; di personale tecnico-amministrativo a tempo pieno dell'UniSa">di essere dipendente di ruolo in qualit&agrave; di personale tecnico-amministrativo a tempo pieno dell'UniSa</option>
      <option value="di essere dipendente di ruolo in qualit&agrave; di personale tecnico-amministrativo a tempo parziale dell'UniSa;">di essere dipendente di ruolo in qualit&agrave; di personale tecnico-amministrativo a tempo parziale dell'UniSa</option>
      <option value="di essere docente a tempo pieno dell'Universit&agrave; degli Studi di Salerno; ">di essere docente a tempo pieno dell'Universit&agrave; degli Studi di Salerno; </option>
      <option value="di essere docente a tempo definito dell'Universit&agrave; degli Studi di Salerno; ">di essere docente a tempo definito dell'Universit&agrave; degli Studi di Salerno; </option>
      <option value="di essere ricercatore a tempo pieno dell'Universit&agrave; degli Studi di Salerno;">di essere ricercatore a tempo pieno dell'Universit&agrave; degli Studi di Salerno</option>
      <option value="di essere ricercatore a tempo definito dell'Universit&agrave; degli Studi di Salerno;">di essere ricercatore a tempo definito dell'Universit&agrave; degli Studi di Salerno</option>
      <option value="di essere titolare di assegni di ricerca presso l'Universit&agrave; degli Studi di Salerno;">di essere titolare di assegni di ricerca presso l'Universit&agrave; degli Studi di Salerno</option>
      <option value="di essere titolare di contratto a tempo determinato presso l'Universit&agrave; degli Studi di Salerno;">di essere titolare di contratto a tempo determinato presso l'Universit&agrave; degli Studi di Salerno</option>
      <option value="di essere dottorando presso l'Universit&agrave; degli Studi di Salerno;">di essere dottorando presso l'Universit&agrave; degli Studi di Salerno</option>
      <option value="di essere titolare di borsa di studio post laurea o post doc presso l'Universit&agrave; degli Studi di Salerno;">di essere titolare di borsa di studio post laurea o post doc presso l'Universit&agrave; degli Studi di Salerno</option>
      <option value="di essere dipendente di ruolo in qualit&agrave; di personale tecnico-amministrativo a tempo pieno dell'UniSa;">di essere dipendente di ruolo in qualit&agrave; di personale tecnico-amministrativo a tempo pieno dell'UniSa</option>
      <option value="di essere studente regolarmente iscritto e frequentante Corsi di studio di I o II ciclo dell'UniSa;">di essere studente regolarmente iscritto e frequentante Corsi di studio di I o II ciclo dell'UniSa</option>
      -->
</select></td>
  </tr>
  <tr>
    <td colspan="3">Anno scadenza del contratto </td>
    <td><input name="scadenza_contratto_richiedente" type="text" id="scadenza_contratto_richiedente" value="<%=scadenzaContratto%>"  size="25" maxlength="5" readonly="readonly" /></td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
   <tr>
     <td></td>
       	 	<td><input type="submit" name="bottone_submit" id="bottone_submit" value="Modifica" onClick="return settaAttributi(this)"/>
                <input type="reset" name="reset" value="Annulla" />
            </td>
          </tr>
    
  </tr>
</table>
</form>

