<%@
	include file="atsilo_files/header_dinamico.jsp"
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

<form>
<table border="0" cellspacing="0">
  <tr>
    <td>In qualita' di</td>
    <td><select id="qualita" name="qualita">
    <option value="Seleziona">Seleziona</option>
    <option value="Padre">Padre</option>
    <option value="Madre">Madre</option>
    <option value="Tutore">Tutore</option>
    <option value="Affidatario">Affidatario</option>
  </select></td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>Cognome</td>
    <td> <input id="cognome" value="" name="cognome" size="25" maxlength="25" type="text"></td>
    <td>Nome</td>
    <td> <input id="nome" value="" name="nome" size="25" maxlength="50" type="text"></td>
  </tr>
  <tr>
    <td>Nato/a a</td>
    <td><input id="natoa" value="" name="natoa"  size="25" maxlength="25" type="text"></td>
    <td>Nato il</td>
    <td><input id="natoil" value="" name="natoil"  size="25" maxlength="10" type="text"></td>
  </tr>
  <tr>
    <td>Codice Fiscale</td>
    <td><input id="codice_fiscale" value="" name="codice_fiscale"  size="25" maxlength="16" type="text" /></td>
    <td>Cittadinanza</td>
    <td><input id="cittadinanza" value="" name="cittadinanza"  size="25" maxlength="25" type="text" /></td>
  </tr>
  <tr>
    <td>Residente a</td>
    <td><input id="residente_a" value="" name="residente_a"  size="25" maxlength="25" type="text" /></td>
    <td>Via/Piazza</td>
    <td><input id="residente_via" value="" name="residente_via"  size="25" maxlength="25" type="text" /></td>
  </tr>
  <tr>
    <td>Numero civico</td>
    <td><input id="residente_numero_civico" value="" name="residente_numero_civico"  size="25" maxlength="5" type="text" /></td>
    <td>CAP</td>
    <td><input id="residente_cap" value="" name="residente_cap"  size="5" maxlength="5" type="text" /></td>
  <tr>
    <td>Provincia</td>
    <td><input id="residente_provincia" value="" name="residente_provincia"  size="2" maxlength="2" type="text" /></td>
   
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
   
    <tr>
      <td colspan="4"><p>&nbsp;</p>
      <p>Compilare i campi sottostanti solo se il domicilio &egrave; diverso dalla residenza</p></td></tr>
  </tr>
  
    <td>Domiciliato a</td>
    <td><input id="domiciliato_a" value="" name="domiciliato_a"  size="25" maxlength="25" type="text" /></td>
    <td>Via/Piazza</td>
    <td><input id="domicilio_via" value="" name="domicilio_via"  size="25" maxlength="25" type="text" /></td>
  </tr>
  <tr>
    <td>Numero civico</td>
    <td><input id="domicilio_numero_civico" value="" name="domicilio_numero_civico"  size="25" maxlength="5" type="text" /></td>
    <td>CAP</td>
    <td><input id="domicilio_cap" value="" name="domicilio_cap"  size="5" maxlength="5" type="text" /></td>
  <tr>
    <td>Provincia</td>
    <td><input id="domicilio_provincia" value="" name="domicilio_provincia"  size="2" maxlength="2" type="text" /></td>
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
    <td> <input id="condizione_lavorativa" value="" name="condizione_lavorativa" size="25" maxlength="25" type="text"></td>
    <td>Tipo contratto</td>
    <td> <select id="contratto" name="contratto">
    <option value="Seleziona">Seleziona</option>
    <option value="A tempo pieno">A tempo pieno</option>
    <option value="Part time">Part time</option>
    </select>
    </td>
  </tr>
  <tr>
    <td >Sede di lavoro</td>
    <td colspan="4"><input id="sede_lavoro_genitore_non_richiedente" value="" name="sede_lavoro_genitore_non_richiedente"  size="50" maxlength="150" type="text"></td>

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