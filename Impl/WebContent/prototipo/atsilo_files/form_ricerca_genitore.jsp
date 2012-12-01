<!-- form per la ricerca dati di un genutire da parte del personale -->
<form>
<table border="0" cellspacing="0">
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
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
     <td>Cognome bambino</td>
    <td> <input id="cognome_b" value="" name="cognome_b" size="25" maxlength="25" type="text"></td>
    <td>Nome bambino</td>
    <td> <input id="nome_b" value="" name="nome_b" size="25" maxlength="50" type="text"></td>
  </tr>
  <!-- Mostra campi cf solo se chiamante non fa parte della categoria dei genitore -->
  
  <% 
  if (!tipologia.equals("genitore")) { 
 
  
   out.println("<tr>");
   out.println("  <td>Codice fiscale</td>");
   out.println(" <td> <input id='cf' value='' name='cf' size='25' maxlength='25' type='text'></td>");
   out.println(" <td>Codice fiscale bambino</td>");
   out.println(" <td> <input id='cf_b' value='' name='cf_b' size='25' maxlength='25' type='text'></td>");
   out.println("</tr>");
   }%>
    <!-- Fine campo opzionalee -->
    
  <tr>
    <td>Residente a</td>
    <td><input id="residente_a" value="" name="residente_a"  size="25" maxlength="25" type="text" /></td>
    <td>Via/Piazza</td>
    <td><input id="residente_via" value="" name="residente_via"  size="25" maxlength="25" type="text" /></td>
  </tr>
  <tr>
    <td>CAP</td>
    <td><input id="residente_cap" value="" name="residente_cap"  size="5" maxlength="5" type="text" /></td>
      <td>Provincia</td>
    <td><input id="residente_provincia" value="" name="residente_provincia"  size="2" maxlength="2" type="text" /></td>

 </tr>
 <tr>
    <td>E-mail</td>
    <td><input id="email" value="" name="email"  size="25" maxlength="25" type="text" /></td>
    <td>Telefono</td>
    <td><input id="telefono" value="" name="telefono"  size="25" maxlength="25" type="text" /></td>
  </tr>

  
  <tr>
    <td colspan="2"><select name="tipologia_appartenenza" id="tipologia_appartenenza">
      <option selected="selected">Selezionare la tipologia di appartenenza</option>
      <option value="personale_docente">Personale Docente</option>
      <option value="personale_tecnico_amministrativo">Personale Tecnico amministrativo </option>
      <option value="titolare_assegno_di_ricerca">Titolare di assegno di ricerca </option>
       <option value="titolare_contratto_a_tempo_determinato">Titolare di contratto a tempo determinato  </option>
       <option value="dottorando">Dottorando </option>
        <option value="titolare_borsa_di_studio">Titolare borsa di studio </option>
    </select></td>
    <td colspan="2"><select name="classe_appratenenza" id="classe_appratenenza">
     <option selected="selected">Selezionare la classe di appartenenza</option>
      <option value="classe1">Classe1</option>
    </select></td>
  </tr>
   
  <tr>
    <td>&nbsp;</td>
  </tr>
   <tr>
     <td colspan="4"><input value="Ricerca" name="ricerca" type="submit" />
     <input value="Annulla" name="annulla" type="reset" />
     </td>
    
  </tr>
</table>
</form>