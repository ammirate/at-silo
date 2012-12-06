<form id="dati_bando" name="dati_bando" action="" method="post" >
<table border="0" cellspacing="0">
  <tr>
    <td>In qualita' di</td>
    <td><select id="rapporto_parentela" name="rapporto_parentela">
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
    <td><input id="codice_fiscale_genitore_richiedente" value="" name="codice_fiscale_genitore_richiedente"  size="25" maxlength="16" type="text" /></td>
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