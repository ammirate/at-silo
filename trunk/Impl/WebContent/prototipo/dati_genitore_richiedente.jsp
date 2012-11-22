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
</td><td class="content" valign="top" bgcolor="#ffffff">
<table width="100%">
<tbody><tr>
<td>
<tbody><tr>
<td align="center" height="0" nowrap="true" class="stepprimohbar"><a href="dati_account.jsp">Dati account</a></td>
<td align="center" height="0" nowrap="true" class="stepprimoselhbar"><a href="dati_genitore_richiedente.jsp">Dati genitore richiedente</a></td>
<td align="center" height="0" nowrap="true" class="stepprimohbar"><a href="dati_genitore_nonrichiedente.jsp">Dati genitore non richiedente</a></td>
<td align="center" height="0" nowrap="true" class="stepprimohbar"><a href="sitauzione_familiare.jsp">Sitazione familiare</a></td>
<td align="center" height="0" nowrap="true" class=stepprimohbar"><a href="sitauzione_reddituale.jsp">Situazione reddituale</a></td>
</tr>
</tbody></table>
<table cellspacing="10" cellpadding="0" border="0" width="100%">
  <tbody>
    <tr>
      <td><table cellspacing="0" cellpadding="0" border="0">
        <tbody>
          <tr>
            <td class="tplTitolo">
            
            
            <form method="post" action="modules/forms/front/index/submit" class="form">
<fieldset>
<legend></legend>

<p>In qualita' di
  <select id="qualita" name="qualita">
    <option value="Seleziona">Seleziona</option>
    <option value="Padre">Padre</option>
    <option value="Madre">Madre</option>
    <option value="Tutore">Tutore</option>
    <option value="Affidatario">Affidatario</option>
  </select>
Cognome
  <input id="cognome" value="" name="cognome" size="25" maxlength="25" type="text">
  Nome <input id="nome" value="" name="nome"  size="25" maxlength="255" type="text">

  Nato/a a(*) 
  <input id="natoa" value="" name="natoa"  size="25" maxlength="255" type="text">
  Nato il><input id="natoil" value="" name="natoil"  size="25" maxlength="255" type="text">
Codice fiscale (*)
  <input id="cf" value="" name="cf"  size="25" maxlength="255" type="text">
Cittadinanza(*)
  <input id="cittadinanza" value="" name="cittadinanza"  size="25" maxlength="255" type="text">

  Residente a (*) 
  <input id="residente" value="" name="residente"  size="25" maxlength="255" type="text">
  Via/Piazza (*) <input id="via" value="" name="via"  size="25" maxlength="255" type="text">
  Numero civico<input id="num" value="" name="num"  size="25" maxlength="255" type="text">
  Telefono (*)<input id="tel" value="" name="tel"  size="25" maxlength="255" type="text">
  Cellulare (*) <input id="cell" value="" name="cell" class="required" size="25" maxlength="255" type="text">
  Fax<input id="fax" value="" name="fax" class="" size="25" maxlength="255" type="text">
Email (*)
  <input id="email" value="" name="email" size="25" maxlength="255" type="text">
Eventuale indirizzo domicilio (solo se diverso dalla residenza)
  Via/Piazza
  <input id="viadom" value="" name="viadom"  size="25" maxlength="255" type="text">

  Numero civico
  <input id="numdom" value="" name="numdom"  size="25" maxlength="255" type="text">
  Comune del domicilio</span><span class="star"></span>
  <input id="comunedom" value="" name="comunedom"  size="25" maxlength="255" type="text"></li>

Provincia del domicilio <input id="provdom" value="" name="provdom"  size="25" maxlength="255" type="text">
CAP<<input id="cap" value="" name="cap"  size="25" maxlength="255" type="text">
<div align="center"><strong>DICHIARA<br>
(barrare la casella che interessa)</strong></div>
Indicare il proprio status lavorativo
<select id="status" name="status">
<option value="Selezionare">Selezionare</option>
<option value="di essere dipendente di ruolo in qualità di personale tecnico-amministrativo a tempo pieno dell'UniSa">di essere dipendente di ruolo in qualità di personale tecnico-amministrativo a tempo pieno dell'UniSa</option>
<option value="di essere dipendente di ruolo in qualità di personale tecnico-amministrativo a tempo parziale dell'UniSa;">di essere dipendente di ruolo in qualità di personale tecnico-amministrativo a tempo parziale dell'UniSa;</option>
<option value="di essere docente a tempo pieno dell'Università degli Studi di Salerno; ">di essere docente a tempo pieno dell'Università degli Studi di Salerno; </option>
<option value="di essere docente a tempo definito dell'Università degli Studi di Salerno; ">di essere docente a tempo definito dell'Università degli Studi di Salerno; </option>
<option value="di essere ricercatore a tempo pieno dell'Università degli Studi di Salerno;">di essere ricercatore a tempo pieno dell'Università degli Studi di Salerno;</option>
<option value="di essere ricercatore a tempo definito dell'Università degli Studi di Salerno;">di essere ricercatore a tempo definito dell'Università degli Studi di Salerno;</option>
<option value="di essere titolare di assegni di ricerca presso l'Università degli Studi di Salerno;">di essere titolare di assegni di ricerca presso l'Università degli Studi di Salerno;</option>
<option value="di essere titolare di contratto a tempo determinato presso l'Università degli Studi di Salerno;">di essere titolare di contratto a tempo determinato presso l'Università degli Studi di Salerno;</option>
<option value="di essere dottorando presso l'Università degli Studi di Salerno;">di essere dottorando presso l'Università degli Studi di Salerno;</option>
<option value="di essere titolare di borsa di studio post laurea o post doc presso l'Università degli Studi di Salerno;">di essere titolare di borsa di studio post laurea o post doc presso l'Università degli Studi di Salerno;</option><
option value="di essere studente regolarmente iscritto e frequentante Corsi di studio di I o II ciclo dell'UniSa;">di essere studente regolarmente iscritto e frequentante Corsi di studio di I o II ciclo dell'UniSa;</option>
<option value="di essere dipendente di ruolo in qualità di personale tecnico-amministrativo a tempo pieno dell'UniSa;">di essere dipendente di ruolo in qualità di personale tecnico-amministrativo a tempo pieno dell'UniSa;</option>
</select>
scadenza del contratto (solo per assegnisti, borsisti, dottorandi o contrattisti)
<input id="scadenzastatus" value="" name="scadenzastatus" class="" size="25" maxlength="255" type="text">
<strong>CHIEDE L'ISCRIZIONE AL NIDO PER IL/LA PROPRIO/A BAMBINO/A:</strong></div></div></li><li class="radio">
già iscritto e frequentante per l'anno educativo precedente<input name="giaiscritto" id="giaiscritto_1" value="No" checked="checked" type="radio"> No <input name="giaiscritto" id="giaiscritto_2" value="Si" type="radio"> Si 
 (*)<input id="cognomebimbo" value="" name="cognomebimbo" size="25" maxlength="255" type="text">NomE*<input id="nomebimbo" value="" name="nomebimbo" class="required" size="25" maxlength="255" type="text">
(*)<input id="natoabimbo" value="" name="natoabimbo" class="required" size="25" maxlength="255" type="text"></li><li class="text"><label for="natoilbimbo"><span class="label">Nato/a il</span><span class="star"> (*) </span></label><input id="natoilbimbo" value="" name="natoilbimbo" class="required" size="25" maxlength="255" type="text"></li><li class="text"><label for="cfbimbo"><span class="label">Codice fiscale</span><span class="star"> (*) </span></label><input id="cfbimbo" value="" name="cfbimbo" class="required" size="25" maxlength="255" type="text"></li><li class="text"><label for="cittadinanzabimbo"><span class="label">Cittadinanza</span><span class="star"> (*) </span></label><input id="cittadinanzabimbo" value="" name="cittadinanzabimbo" class="required" size="25" maxlength="255" type="text"></li><li class="text"><label for="residenza"><span class="label">Residenza</span><span class="star"> (*) </span></label><input id="residenza" value="" name="residenza" class="required" size="25" maxlength="255" type="text"></li><li class="text"><label for="viabimbo"><span class="label">Via/Piazza</span><span class="star"> (*) </span></label><input id="viabimbo" value="" name="viabimbo" class="required" size="25" maxlength="255" type="text"></li><li class="text"><label for="numbimbo"><span class="label">Numero civico</span><span class="star"></span></label><input id="numbimbo" value="" name="numbimbo" class="" size="25" maxlength="255" type="text"></li><li class="select"><label for="fasciautenza"><span class="label">PER LA SEGUENTE FASCIA DI UTENZA:</span><span class="star"></span></label><select id="fasciautenza" name="fasciautenza"><option value="Seleziona">Seleziona</option><option value="full time dalle ore 8,30 alle ore 16,30 comprensiva dei pasti">full time dalle ore 8,30 alle ore 16,30 comprensiva dei pasti</option><option value="part-time mattutina dalle ore 8,30 alle ore 13,30 comprensiva dei pasti">part-time mattutina dalle ore 8,30 alle ore 13,30 comprensiva dei pasti</option><option value="part-time mattutina dalle ore 8,30 alle ore 12,00 senza somministrazione del pasto">part-time mattutina dalle ore 8,30 alle ore 12,00 senza somministrazione del pasto</option><option value="part-time pomeridiana dalle ore 13,30 alle ore 16,30 senza somministrazione del pasto">part-time pomeridiana dalle ore 13,30 alle ore 16,30 senza somministrazione del pasto</option></select></li><li class="required_legend">(*) Campo Obbligatorio</li><li class="description"><div class="description"><div align="center"><strong>DATI ALTRO GENITORE NON RICHIEDENTE</strong></div></div></li><li class="select"><label for="altrogenitore"><span class="label">Altro genitore</span><span class="star"></span></label><select id="altrogenitore" name="altrogenitore"><option value="Seleziona">Seleziona</option><option value="Padre">Padre</option><option value="Madre">Madre</option></select></li><li class="text"><label for="cognomealtro"><span class="label">Cognome</span><span class="star"></span></label><input id="cognomealtro" value="" name="cognomealtro" class="" size="25" maxlength="255" type="text"></li><li class="text"><label for="nomealtro"><span class="label">Nome</span><span class="star"></span></label><input id="nomealtro" value="" name="nomealtro" class="" size="25" maxlength="255" type="text"></li><li class="text"><label for="natoaaltro"><span class="label">Nato/a a</span><span class="star"></span></label><input id="natoaaltro" value="" name="natoaaltro" class="" size="25" maxlength="255" type="text"></li><li class="text"><label for="natoilaltro"><span class="label">Nato/a il</span><span class="star"></span></label><input id="natoilaltro" value="" name="natoilaltro" class="" size="25" maxlength="255" type="text"></li><li class="text"><label for="cfaltro"><span class="label">Codice fiscale</span><span class="star"></span></label><input id="cfaltro" value="" name="cfaltro" class="" size="25" maxlength="255" type="text"></li><li class="text"><label for="cittadinanzaaltro"><span class="label">Cittadinanza</span><span class="star"></span></label><input id="cittadinanzaaltro" value="" name="cittadinanzaaltro" class="" size="25" maxlength="255" type="text"></li><li class="text"><label for="residenteaaltro"><span class="label">Residente a</span><span class="star"></span></label><input id="residenteaaltro" value="" name="residenteaaltro" class="" size="25" maxlength="255" type="text"></li><li class="text"><label for="viaaltro"><span class="label">Via/Piazza</span><span class="star"></span></label><input id="viaaltro" value="" name="viaaltro" class="" size="25" maxlength="255" type="text"></li><li class="text"><label for="numaltro"><span class="label">Numero civico</span><span class="star"></span></label><input id="numaltro" value="" name="numaltro" class="" size="25" maxlength="255" type="text"></li><li class="text"><label for="telaltro"><span class="label">Telefono</span><span class="star"></span></label><input id="telaltro" value="" name="telaltro" class="" size="25" maxlength="255" type="text"></li><li class="text"><label for="cellaltro"><span class="label">Cellulare</span><span class="star"></span></label><input id="cellaltro" value="" name="cellaltro" class="" size="25" maxlength="255" type="text"></li><li class="text"><label for="faxaltro"><span class="label">Fax</span><span class="star"></span></label><input id="faxaltro" value="" name="faxaltro" class="" size="25" maxlength="255" type="text"></li><li class="text"><label for="emailaltro"><span class="label">Email</span><span class="star"></span></label><input id="emailaltro" value="" name="emailaltro" class="" size="25" maxlength="255" type="text"></li><li class="description"><div class="description">Eventuale indirizzo domicilio (solo se diverso dalla residenza)</div></li><li class="text"><label for="viaaltrodom"><span class="label">Via/Piazza</span><span class="star"></span></label><input id="viaaltrodom" value="" name="viaaltrodom" class="" size="25" maxlength="255" type="text"></li><li class="text"><label for="numaltrodom"><span class="label">Numero civico</span><span class="star"></span></label><input id="numaltrodom" value="" name="numaltrodom" class="" size="25" maxlength="255" type="text"></li><li class="text"><label for="comaltrodom"><span class="label">Comune del domicilio</span><span class="star"></span></label><input id="comaltrodom" value="" name="comaltrodom" class="" size="25" maxlength="255" type="text"></li><li class="text"><label for="provaltrodom"><span class="label">Provincia del domicilio</span><span class="star"></span></label><input id="provaltrodom" value="" name="provaltrodom" class="" size="25" maxlength="255" type="text"></li><li class="text"><label for="capdom"><span class="label">CAP</span><span class="star"></span></label><input id="capdom" value="" name="capdom" class="" size="25" maxlength="255" type="text"></li><li class="text"><label for="lavoroconiuge"><span class="label">Condizione lavorativa del coniuge</span><span class="star"></span></label><input id="lavoroconiuge" value="" name="lavoroconiuge" class="" size="25" maxlength="255" type="text"></li><li class="radio"><label for="contrattoconiuge_1"><span class="label">Con contratto</span><span class="star"></span></label><div class="radio_group"><input name="contrattoconiuge" id="contrattoconiuge_1" value="A tempo pieno" checked="checked" type="radio"> A tempo pieno <input name="contrattoconiuge" id="contrattoconiuge_2" value="A tempo parziale" type="radio"> A tempo parziale </div></li><li class="text"><label for="sedealtro"><span class="label">Sede di lavoro</span><span class="star"></span></label><input id="sedealtro" value="" name="sedealtro" class="" size="25" maxlength="255" type="text"></li><li class="description"><div class="description"><div align="center"><strong>PARTICOLARI SITUAZIONI FAMILIARI (SOCIALI, SANITARIE)</strong></div></div></li><li class="description"><div class="description"></div></li><li class="radio"><label for="disabile_1"><span class="label">Il/la bambino/a per la/il quale si chiede l'iscrizione è in situazione di disabilità (allegare, in busta chiusa, diagnosi funzionale del servizio di Neuro Psichiatria Infantile, ovvero certificazione ex L. 104/92 di presa in carico dell'Asl)</span><span class="star"></span></label><div class="radio_group"><input name="disabile" id="disabile_1" value="No" checked="checked" type="radio"> No <input name="disabile" id="disabile_2" value="Si" type="radio"> Si </div></li><li class="radio"><label for="invalido_1"><span class="label">Il padre/la madre è in situazione di invalidità riconosciuta (con invalidità pari o superiore a 2/3 ai sensi dell'art. 3 Legge 104/92 o malattia permanente con grave riduzione delle funzioni psico/fisiche allegare in busta chiusa certificazione dell'Asl)</span><span class="star"></span></label><div class="radio_group"><input name="invalido" id="invalido_1" value="No" checked="checked" type="radio"> No <input name="invalido" id="invalido_2" value="Si" type="radio"> Si </div></li><li class="radio"><label for="solo_1"><span class="label">Il padre o la madre è genitore solo</span><span class="star"></span></label><div class="radio_group"><input name="solo" id="solo_1" value="No" checked="checked" type="radio"> No <input name="solo" id="solo_2" value="Si" type="radio"> Si </div></li><li class="checkbox"><label for="vedova"><span class="label">Vedova/o</span><span class="star"></span></label><input id="vedova" name="vedova" type="checkbox"></li><li class="checkbox"><label for="nubile"><span class="label">Nubile</span><span class="star"></span></label><input id="nubile" name="nubile" type="checkbox"></li><li class="checkbox"><label for="separato"><span class="label">Separato/Divorziato con affido del minore</span><span class="star"></span></label><input id="separato" name="separato" type="checkbox"></li><li class="checkbox"><label for="genitoresolo"><span class="label">Genitore solo con figlio non riconosciuto dall'altro genitore</span><span class="star"></span></label><input id="genitoresolo" name="genitoresolo" type="checkbox"></li><li class="description"><div class="description"></div></li><li class="checkbox"><label for="riconsociuto"><span class="label">Genitore solo con figlio riconosciuto dall'altro genitore che non contribuisce né all'educazione, né al mantenimento, in possesso di dichiarazione di "affido esclusivo"</span><span class="star"></span></label><input id="riconsociuto" name="riconsociuto" type="checkbox"></li><li class="radio"><label for="altricomponenti_1"><span class="label">Altri componenti il nucleo familiare (figli) con disabilità/invalidità (allegare, in busta chiusa, certificazione dell'Asl)</span><span class="star"></span></label><div class="radio_group"><input name="altricomponenti" id="altricomponenti_1" value="No" checked="checked" type="radio"> No <input name="altricomponenti" id="altricomponenti_2" value="Si" type="radio"> Si </div></li><li class="radio"><label for="contemporanea_1"><span class="label">Richiesta inserimento contemporaneo di più figli al nido</span><span class="star"></span></label><div class="radio_group"><input name="contemporanea" id="contemporanea_1" value="No" checked="checked" type="radio"> No <input name="contemporanea" id="contemporanea_2" value="Si" type="radio"> Si </div></li><li class="textarea"><label for="altrecondizioni"><span class="label">ALTRE CONDIZIONI RILEVANTI AI FINI DEL PUNTEGGIO</span><span class="star"></span></label><textarea id="altrecondizioni" name="altrecondizioni" rows="5" cols="40"></textarea></li><li class="description"><div class="description"><div align="center"><strong>SITUAZIONE REDDITUALE</strong></div></div></li><li class="description"><div class="description"><strong>ISEE</strong></div></li><li class="checkbox"><label for="isee2011"><span class="label">allego certificazione ISEE relativa all'anno 2011 rilasciata da un centro di assistenza fiscale (CAF)</span><span class="star"></span></label><input id="isee2011" name="isee2011" type="checkbox"></li><li class="text"><label for="euroisee"><span class="label">il cui indicatore ISEE è pari a Euro</span><span class="star"></span></label><input id="euroisee" value="" name="euroisee" class="" size="25" maxlength="255" type="text"></li><li class="checkbox"><label for="nonisee"><span class="label">NON ALLEGO certificazione ISEE relativa all'anno 2011</span><span class="star"></span></label><input id="nonisee" name="nonisee" type="checkbox"></li><li class="description"><div class="description">Allegati</div></li><li class="checkbox"><label for="allegato1"><span class="label">COPIA FRONTE/RETRO DEL DOCUMENTO DI RICONOSCIMENTO VALIDO DEL RICHIEDENTE;</span><span class="star"></span></label><input id="allegato1" name="allegato1" type="checkbox"></li><li class="description"><div class="description">INOLTRE,  <strong>(SOLO SE STUDENTE)</strong>:</div></li><li class="checkbox"><label for="allegati2"><span class="label">CERTIFICATO REGOLARE ISCRIZIONE ALL'A.A. 2011/12 CON L'INDICAZIONE DEGLI  ESAMI SUPERATI.</span><span class="star"></span></label><input id="allegati2" name="allegati2" type="checkbox"></li><li class="selected description"><div class="description"><strong>PRIMA DELL'INVIO DELLA DOMANDA SI RACCOMANDA DI CONTROLLARE L'ESATTA COMPILAZIONE DI TUTTI I CAMPI POICHE', DOPO L'INVIO, NON SARA' POSSIBILE EFFETTUARE ALCUNA MODIFICA</strong></div></li><li class="description"><div class="description"><strong>N.B.: Per completare l'invio della domanda è necessario inserire nel campo sottostante il codice così come appare nell'immagine che segue. Se la stessa non fosse correttamente visibile è possibile generare una nuova immagine con l'apposito pulsante.</strong><br></div></li><li class="buttons">
<input type="submit" value="Invia"><input type="reset" value="Annulla">
</li>

</fieldset>
</form>
            
            
            </td>
            </tr>
          </tbody>
        </table></td>
    </tr>
    <tr>
      <td><table cellspacing="0" cellpadding="0" border="0">
        <tbody>
          <tr>
            <td><table width="598" cellspacing="0" cellpadding="0" border="0">
            </table></td>
          </tr>
          <tr>
            <td><img border="0" alt="" height="20" width="1" src="atsilo_files/clearpixel.gif" /></td>
          </tr>
        </tbody>
      </table></td>
    </tr>
    <tr>
      <td class="tplHeader"></td>
    </tr>
  </tbody>
</table>
<p>&nbsp;</p></td><td class="fasciadxvariabile"></td>
</tr>
</tbody></table>
</td>
<td class="fasciadxvariabile"></td>
</tr>
<tr>
<td class="bottom" width="209">&nbsp;2012 © Unisa</td><td align="right" class="bottom"></td>
</tr>
</tbody></table>


</body>
</html>