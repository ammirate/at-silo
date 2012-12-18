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
    <td>&nbsp;</td>
  </tr>
   <td></td>
       	 	<td><input type="submit" name="bottone_submit" id="bottone_submit" value="Modifica" onClick="return settaAttributi(this)"/>
                <input type="reset" name="reset" value="Annulla" />
            </td>
          </tr>
    
  </tr>
</table>
</form>