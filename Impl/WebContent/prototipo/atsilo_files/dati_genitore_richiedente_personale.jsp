<%@ page import="atsilo.application.*,atsilo.entity.*"
 %>
 <% 
	//ControlDatiPersonali cdt= ControlDatiPersonali.getIstance();//istruzioni presenti nella pagina dati_genitore_richiedente
 	//Utente utente=cdt.getUtenteFromUsername(username);//istruzioni presenti nella pagina dati_genitore_richiedente
	Genitore genitore=cdt.getDatiGenitore(utente.getCodiceFiscale());
 	String cognome=genitore.getCognome();
 	String nome=genitore.getNome();
 	String codiceFiscale=genitore.getCodiceFiscale();
 	String dataNascita="dataNascita";
 	String comuneNascita=genitore.getComuneNascita(); 
 	String telefono=genitore.getTelefono();
 	String cittadinanza=genitore.getcittadinanza();
 	String indirizzoResidenza=genitore.getIndirizzoResidenza();
 	String numeroCivicoResidenza=genitore.getNumeroCivicoResidenza();
 	String capResidenza=genitore.getCapResidenza();
 	String comuneResidenza=genitore.getComuneResidenza();
 	String provinciaResidenza=genitore.getProvinciaResidenza();
 	String indirizzoDomicilio=genitore.getIndirizzoDomicilio();
 	String numeroCivicoDomicilio=genitore.getNumeroCivicoDomicilio();
 	String capDomicilio=genitore.getCapDomicilio();
 	String comuneDomicilio=genitore.getComuneDomicilio();
 	String provinciaDomicilio=genitore.getProvinciaDomicilio();
 	String statusLavorativo=genitore.getStatusLavorativo();
 	String scadenzaContratto="scadenzaContratto";
 	String rapportoParentela=genitore.getRapportoParentela();


 %>
<form id="dati_bando" name="dati_bando" action="" method="post" >
<input name="chiamante" type="hidden" id="chiamante" value="genitore">
<table border="0" cellspacing="0" >
  <tr>
    <td>In qualita' di</td>
    <td><select id="rapportoParentela" name="rapportoParentela">
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
    <td><input name="comuneNascita" type="text" id="comuneNascita" value="<%=dataNascita %>"  size="25" maxlength="25" readonly="readonly"></td>
    <td>Nato il</td>
    <td><input name="dataNascita" type="text" id="dataNascita" value="<%=dataNascita%>"  size="25" maxlength="10" readonly="readonly"></td>
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
   
    <td>&nbsp;</td>
    <td>&nbsp;</td>
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
  <td colspan="4"><select id="status_lavorativo" name="status_lavorativo"  readonly="readonly" >
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
</select></td>
  </tr>
  <tr>
    <td colspan="3">Scadenza del contratto (solo per assegnisti, borsisti, dottorandi o contrattisti)</td>
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

