<%@
	include file="atsilo_files/header.jsp"
%>
<table width="100%" cellspacing="0" cellpadding="0" border="0">
<tbody><tr>
<td class="breadcrumb " align="left"><p> </a></p>
  <p>&nbsp;</p></td>
</tr>
</tbody></table>
<%@
include file="atsilo_files/sidebar_genitore.jsp"
 %>
<img width="209" border="0" alt="" height="1" src="atsilo_images/clearpixel.gif">
<td class="content" valign="top" bgcolor="#ffffff">

<%@
include file="atsilo_files/sidebar_top_genitore.jsp"
 %>
<!--Dati genitore non richiedente-->
<%@ page import="atsilo.test.application.*,atsilo.entity.*"
 %>
 <% 
	ControlDatiPersonali cdt= ControlDatiPersonali.getIstance();
 	Utente utente=cdt.getUtenteFromUsername(username);
	Genitore genitore=cdt.getDatiGenitoreFromCF(utente.getCodiceFiscale());
 	String cognome=genitore.getCognome();
 	String nome=genitore.getNome();
 	String codiceFiscale=genitore.getCodiceFiscale();
 	String dataNascita="dataNascita";
 	String comuneNascita=genitore.getComuneNascita(); 
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
 	String rapportoParentela=genitore.getRapportoParentela();
	
	String condizioneLavorativa=genitore.getCondizioneLavorativa();
 	String tipoContratto=genitore.getTipoContratto();
 	String sedeDiLavoro=genitore.getDipendentePresso();


 %>
<form>
<input name="chiamante" type="hidden" id="chiamante" value="genitore_non_richiedente">
<table  width="100%" border="0" cellspacing="0">
  <tr>
    <td>In qualita' di</td>
    <td><select id="qualita" name="qualita">
    <option value="Seleziona">Seleziona</option>
    <option value="Padre">Padre</option>
    <option value="Madre">Madre</option>
    <option value="Tutore" selected>Tutore</option>
    <option value="Affidatario">Affidatario</option>
  </select></td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>Cognome</td>
    <td> <input id="cognome_genitore_non_richiedente" value="<%=cognome%>" name="cognome_genitore_non_richiedente" size="25" maxlength="25" type="text"></td>
    <td>Nome</td>
    <td> <input id="nome_genitore_non_richiedente" value="<%=nome%>" name="nome_genitore_non_richiedente" size="25" maxlength="50" type="text"></td>
  </tr>
  <tr>
    <td>Nato/a a</td>
    <td><input id="comune_nascita_genitore_non_richiedente" value="<%=comuneNascita%>" name="comune_nascita_genitore_non_richiedente"  size="25" maxlength="25" type="text"></td>
    <td>Nato il</td>
    <td><input id="dataNascita_genitore_non_richiedente" value="<%=dataNascita%>" name="dataNascita_genitore_non_richiedente"  size="25" maxlength="10" type="text"></td>
  </tr>
  <tr>
    <td>Codice Fiscale</td>
    <td><input id="codice_fiscale_genitore_non_richiedente" value="<%=codiceFiscale%>" name="codice_fiscale_genitore_non_richiedente"  size="25" maxlength="16" type="text" /></td>
    <td>Cittadinanza</td>
    <td><input id="cittadinanza_genitore_non_richiedente" value="<%=cittadinanza%>" name="cittadinanza_genitore_non_richiedente"  size="25" maxlength="25" type="text" /></td>
  </tr>
  <tr>
    <td>Residente a</td>
    <td><input id="comune_residenza_genitore_non_richiedente" value="<%=comuneResidenza%>" name="comune_residenza_genitore_non_richiedente"  size="25" maxlength="25" type="text" /></td>
    <td>Via/Piazza</td>
    <td><input id="indirizzo_residenza_genitore_non_richiedente" value="<%=indirizzoResidenza%>" name="indirizzo_residenza_genitore_non_richiedente"  size="25" maxlength="25" type="text" /></td>
  </tr>
  <tr>
    <td>Numero civico</td>
    <td><input id="numero_civico_residenza_genitore_non_richiedente" value="<%=numeroCivicoResidenza%>" name="numero_civico_residenza_genitore_non_richiedente"  size="25" maxlength="5" type="text" /></td>
    <td>CAP</td>
    <td><input id="cap_residenza_genitore_non_richiedente" value="<%=capResidenza%>" name="cap_residenza_genitore_non_richiedente"  size="5" maxlength="5" type="text" /></td>
  <tr>
    <td>Provincia</td>
    <td><input id="provincia_residenza_genitore_non_richiedente" value="<%=provinciaResidenza%>" name="provincia_residenza_genitore_non_richiedente"  size="2" maxlength="2" type="text" /></td>
   
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
   
    <tr>
      <td colspan="4"><p>&nbsp;</p>
      <p>Compilare i campi sottostanti solo se il domicilio &egrave; diverso dalla residenza</p></td></tr>
  
  
    <td>Domiciliato a</td>
    <td><input id="comune_domicilio_genitore_non_richiedente" value="<%=comuneDomicilio%>" name="comune_domicilio_genitore_non_richiedente"  size="25" maxlength="25" type="text" /></td>
    <td>Via/Piazza</td>
    <td><input id="indirizzo_domicilio_genitore_non_richiedente" value="<%=indirizzoDomicilio%>" name="indirizzo_domicilio_genitore_non_richiedente"  size="25" maxlength="25" type="text" /></td>
  </tr>
  <tr>
    <td>Numero civico</td>
    <td><input id="numero_civico_domicilio_genitore_non_richiedente" value="" name="numero_civico_domicilio_genitore_non_richiedente"  size="25" maxlength="5" type="text" /></td>
    <td>CAP</td>
    <td><input id="cap_domicilio_genitore_non_richiedente" value="" name="cap_domicilio_genitore_non_richiedente"  size="5" maxlength="5" type="text" /></td>
  <tr>
    <td>Provincia</td>
    <td><input id="provincia_domicilio_genitore_non_richiedente" value="<%=provinciaDomicilio%>" name="provincia_domicilio_genitore_non_richiedente"  size="2" maxlength="2" type="text" /></td>
    </
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
    <td>Condizione lavorativa</td>
    <td> <input id="condizione_lavorativa_genitore_non_richiedente" value="<%=condizioneLavorativa%>" name="condizione_lavorativa_genitore_non_richiedente" size="25" maxlength="25" type="text"></td>
    <td>Tipo contratto</td>
    <td> <select id="tipo_contratto_genitore_non_richiedente" name="tipo_contratto_genitore_non_richiedente">
    <option value="Seleziona">Seleziona</option>
    <option value="A tempo pieno">A tempo pieno</option>
    <option value="Part time">Part time</option>
    </select>
    </td>
  </tr>
  <tr>
    <td >Sede di lavoro</td>
    <td colspan="4"><input id="rapporto_parentela_genitore_non_richiedente" value="<%=sedeDiLavoro%>" name="rapporto_parentela_genitore_non_richiedente"  size="50" maxlength="150" type="text"></td>

  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
   <tr>
     <td colspan="4"><input value="Salva Dati" name="salva_dati" type="submit" />
     <input value="Modifica Dati" name="modifica_dati" type="submit" />
     </td>
    
  </tr>
</table>
</form>

</td><!--Chiudi content -->


<%@
include file="atsilo_files/footer.jsp"
 %>
</body>
</html>