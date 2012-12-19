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
  	//istanzio tutte le variabili 
  	
 	 	String comuneNascita="";
 	 	String telefono="";
 	 	String cittadinanza="";
 	 	String indirizzoResidenza="";
 	 	String numeroCivicoResidenza ="";
 	 	String capResidenza="";
 	 	String comuneResidenza="";
 	 	String provinciaResidenza ="";
 	 	String indirizzoDomicilio="";
 	 	String numeroCivicoDomicilio ="";
 	 	String capDomicilio="";
 	 	String comuneDomicilio ="";
 	 	String provinciaDomicilio="";
 	 	String rapportoParentela="";
 	 	
 	 	String dipendentePresso="";
 	 	String rapportiAteneoSalerno="";
 	 	String rapportiComuneFisciano="";
 	 	
 	if (genitore.getComuneNascita() != null)
 		comuneNascita = genitore.getComuneNascita();
 	if (genitore.getTelefono() != null)
 		telefono = genitore.getTelefono();
 	if (genitore.getcittadinanza() != null)
 		cittadinanza = genitore.getcittadinanza();
 	if (genitore.getIndirizzoResidenza() != null)
 		indirizzoResidenza = genitore.getIndirizzoResidenza();
 	if (genitore.getNumeroCivicoResidenza() != null)
 		numeroCivicoResidenza = genitore.getNumeroCivicoResidenza();
 	if (genitore.getCapResidenza() != null)
 		capResidenza = genitore.getCapResidenza();
 	if (genitore.getComuneResidenza() != null)
 		comuneResidenza = genitore.getComuneResidenza();
 	if (genitore.getProvinciaResidenza() != null)
 		provinciaResidenza = genitore.getProvinciaResidenza();
 	if (genitore.getIndirizzoDomicilio() != null)
 		indirizzoDomicilio = genitore.getIndirizzoDomicilio();
 	if (genitore.getNumeroCivicoDomicilio() != null)
 		numeroCivicoDomicilio = genitore.getNumeroCivicoDomicilio();
 	if (genitore.getCapDomicilio() != null)
 		capDomicilio = genitore.getCapDomicilio();
 	if (genitore.getComuneDomicilio() != null)
 		comuneDomicilio = genitore.getComuneDomicilio();
 	if (genitore.getProvinciaDomicilio() != null)
 		provinciaDomicilio = genitore.getProvinciaDomicilio();
 	if (genitore.getRapportoParentela() != null)
 		rapportoParentela = genitore.getRapportoParentela();

 	if (genitore.getDipendentePresso() != null)
 		dipendentePresso = genitore.getDipendentePresso();
 	if (genitore.getRapportiAteneoSalerno() != null)
 		rapportiAteneoSalerno = genitore.getRapportiAteneoSalerno();
 	if (genitore.getRapportiComuneFisciano() != null)
 		rapportiComuneFisciano = genitore.getRapportiComuneFisciano();
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
    <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td colspan="3">&nbsp;</td>
  </tr>
  <tr>
    <td colspan="4">Compilare solo i campi che interessano:</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td colspan="3">&nbsp;</td>
  </tr>
  <tr>
    <td>Dipendente presso</td>
    <td colspan="3"><input id="dipendente_presso" value="<%=numeroCivicoDomicilio%>" name="dipendente_presso"  size="25" maxlength="5" type="text" />
      </td>
  </tr>
  <tr>
    <td colspan="2">Motivare i rapporti con l'ateneo di Salerno</td>
    <td><textarea readonly="readonly" name="rapporti_ateneo_salerno_richiedente" id="rapporti_ateneo_salerno_richiedente" cols="45" rows="5" ><%=rapportiAteneoSalerno%></textarea></td>
  </tr>
  <tr>
    <td colspan="2">Motivare i rapporti con il Comune Di Fisciano</td>
    <td colspan="3"><textarea readonly="readonly" name="rapporti_comune_fisciano_richiedente" id="rapporti_comune_fisciano_richiedente" cols="45" rows="5" ><%=rapportiComuneFisciano%></textarea></td>
  </tr>
    <tr>
    <td>&nbsp;</td>
    <td colspan="3">&nbsp;</td>
  </tr>
   <td></td>
       	 	<td><input type="submit" name="bottone_submit" id="bottone_submit" value="Modifica" onClick="return settaAttributi(this)"/>
                <input type="reset" name="reset" value="Annulla" />
            </td>
          </tr>
</table>
</form>