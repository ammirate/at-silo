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
    <td> <input id="nome_richiedente" value="" name="nome_richiedente" size="25" maxlength="50" type="text"></td>
  </tr>
  <tr>
    <td>Nato/a a</td>
    <td><input id="comune_nascita_richiedente" value="" name="comune_nascita_richiedente"  size="25" maxlength="25" type="text"></td>
    <td>Nato il</td>
    <td><input id="data_nascita_richiedente" value="" name="data_nascita_richiedente"  size="25" maxlength="10" type="text"></td>
  </tr>
  <tr>
    <td>Codice Fiscale</td>
    <td><input id="cf_richiedente" value="" name="cf_richiedente"  size="25" maxlength="16" type="text" /></td>
    <td>Cittadinanza</td>
    <td><input id="cittadinanza_richiedente" value="" name="cittadinanza_richiedente"  size="25" maxlength="25" type="text" /></td>
  </tr>
  <tr>
    <td>Residente a</td>
    <td><input id="comune_residenza_richiedente" value="" name="comune_residenza_richiedente"  size="25" maxlength="25" type="text" /></td>
    <td>Via/Piazza</td>
    <td><input id="indirizzo_residenza_richiedente" value="" name="indirizzo_residenza_richiedente"  size="25" maxlength="25" type="text" /></td>
  </tr>
  <tr>
    <td>Numero civico</td>
    <td><input id="numero_civico_residenza_richiedente" value="" name="numero_civico_residenza_richiedente"  size="25" maxlength="5" type="text" /></td>
    <td>CAP</td>
    <td><input id="cap_residenza_richiedente" value="" name="cap_residenza_richiedente"  size="5" maxlength="5" type="text" /></td>
  <tr>
    <td>Provincia</td>
    <td><input id="provincia_residenza_richiedente" value="" name="provincia_residenza_richiedente"  size="2" maxlength="2" type="text" /></td>
   
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
   
    <tr>
      <td colspan="4"><p>&nbsp;</p>
      <p>Compilare i campi sottostanti solo se il domicilio &egrave; diverso dalla residenza</p></td></tr>
  </tr>
  
    <td>Domiciliato a</td>
    <td><input id="comune_domicilio_richiedente" value="" name="comune_domicilio_richiedente"  size="25" maxlength="25" type="text" /></td>
    <td>Via/Piazza</td>
    <td><input id="indirizzo_domicilio_richiedente" value="" name="indirizzo_domicilio_richiedente"  size="25" maxlength="25" type="text" /></td>
  </tr>
  <tr>
    <td>Numero civico</td>
    <td><input id="civico_domicilio_richiedente" value="" name="civico_domicilio_richiedente"  size="25" maxlength="5" type="text" /></td>
    <td>CAP</td>
    <td><input id="cap_domicilio_richiedente" value="" name="cap_domicilio_richiedente"  size="5" maxlength="5" type="text" /></td>
  <tr>
    <td>Provincia</td>
    <td><input id="provincia_domicilio_richiedente" value="" name="provincia_domicilio_richiedente"  size="2" maxlength="2" type="text" /></td>
    </
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
    <td colspan="3"><input id="diepndente_presso" value="" name="diepndente_presso"  size="25" maxlength="5" type="text" />
      </td>
  </tr>
  <tr>
    <td colspan="2">Motivare i rapporti con l'ateneo di Salerno</td>
    <td><textarea name="rapporti_ateneo_salerno_richiedente" id="rapporti_ateneo_salerno_richiedente" cols="45" rows="5"></textarea></td>
  </tr>
  <tr>
    <td colspan="2">Motivare i rapporti con il Comune Di Fisciano</td>
    <td colspan="3"><textarea name="rapporti_comune_fisciano_richiedente" id="rapporti_comune_fisciano_richiedente" cols="45" rows="5"></textarea></td>
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