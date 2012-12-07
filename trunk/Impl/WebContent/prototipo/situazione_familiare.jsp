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
<img width="209" border="0" alt="" height="1" src="atsilo_images/clearpixel.gif"></td><td class="content" valign="top" bgcolor="#ffffff">
<%@
include file="atsilo_files/sidebar_top_bambino.jsp"
 %>
  <form>
  <table width="100%" border="0" cellspacing="0">
    <tr>
    <td colspan="4"><label for="altrifisglinido_1">Selezionare il figlio per il quale si vogliono inserire le informazioni</label>
      <br></td>
      
  </tr>
  <tr>
  <td colspan="2"><select name="select">
    <option>Selezionare il nome del bambino</option>
  </select></td>
     <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp; </td></tr>
  <tr>
    <td colspan="4">Il/la bambino/a per la/il quale si chiede l'iscrizione &egrave; in situazione di disabilit&agrave; (allegare, in busta chiusa, diagnosi funzionale del servizio di Neuro Psichiatria Infantile, ovvero certificazione ex L. 104/92 di presa in carico dell'Asl)</td>
  </tr>
  <tr>
    <td colspan="2">
    <input name="disabile" id="disabile_1" value="No" checked="checked" type="radio"> No
     <input name="disabile" id="disabile_2" value="Si" type="radio"> Si   </td>
    
  </tr>
    <tr>
    <td colspan="4">Il padre/la madre &agrave; in situazione di invalidit&agrave; riconosciuta (con invalidit&agrave; pari o superiore a 2/3 ai sensi dell'art. 3 Legge 104/92 o malattia permanente con grave riduzione delle funzioni psico/fisiche allegare in busta chiusa certificazione dell'Asl</td>
  </tr>
  <tr>
    <td colspan="2">
    <input name="disabile" id="disabile_1" value="No" checked="checked" type="radio"> No
     <input name="disabile" id="disabile_2" value="Si" type="radio"> Si   </td>
  </tr>
      <tr>
    <td colspan="2">Il padre/la madre &egrave; genitore solo</td>
     <td colspan="2">
    <input name="disabile" id="disabile_1" value="No" checked="checked" type="radio"> No
     <input name="disabile" id="disabile_2" value="Si" type="radio"> Si   </td>
  </tr>
  <tr>
    <td colspan="4" ><p>vedova/o 
      <input id="vedovo" name="vedovo" type="checkbox">
    </p>
      <p>
        nubile
        <input id="vedovo" name="vedovo" type="checkbox">
      </p>
      <p>
        separato/divorziato con affido del minore
        <input id="vedovo" name="vedovo" type="checkbox">
      </p>
      <p>
        genitore solo con figlio non riconosciuto dall'altro genitore
        <input id="vedovo" name="vedovo" type="checkbox">
      </p>
      <p>genitore solo con figlio riconosciuto dall'altro genitore che non contribuisce n&egrave; all'educazione, n&egrave; al mantenimento, in possesso di dichiarazione di "affido esclusivo"
        <input id="vedovo" name="vedovo" type="checkbox">
      </p></td>
   
  </tr>
  
  
  <tr>
    <td>&nbsp; </td>
    <td></td>
  </tr>
  <tr>
    <td colspan="4"><label for="altriinvalidi_1">Altri componenti il nucleo familiare (figli) con disabilit&agrave;/invalidit&agrave; (allegare, in busta chiusa, certificazione dell'Asl) </label>
      <br></td>
  </tr>
  <tr>
    <td colspan="2">
    <input name="disabile" id="disabile_1" value="No" checked="checked" type="radio"> No
     <input name="disabile" id="disabile_2" value="Si" type="radio"> Si   </td>
  </tr>
  <tr>
    <td colspan="2">ALTRE CONDIZIONI RILEVANTI AI FINI DEL PUNTEGGIO</td>
    <td colspan="1"><textarea name="altre_condizioni" cols="50" rows="5"></textarea></td>
  </tr>
    <tr>
    <td colspan="2">&nbsp;</td>
    <td colspan="2"></td>
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

</html>