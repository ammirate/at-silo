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
 <form id="dati_bando" name="dati_bando" action="" method="post" >
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
    <input name="bambino_disabile" id="bambino_disabile" value="false" checked="checked" type="radio"> No
     <span id="bambino_disabile">
     <input name="bambino_disabile" id="bambino_disabile" value="true" type="radio"> 
     Si   </span></td>
    
  </tr>
    <tr>
    <td colspan="4">Il padre/la madre &agrave; in situazione di invalidit&agrave; riconosciuta (con invalidit&agrave; pari o superiore a 2/3 ai sensi dell'art. 3 Legge 104/92 o malattia permanente con grave riduzione delle funzioni psico/fisiche allegare in busta chiusa certificazione dell'Asl</td>
  </tr>
  <tr>
    <td colspan="2" id="genitore_invalido">
    <input name="genitore_invalido" id="genitore_invalido" value="false" checked="checked" type="radio"> No
     <input name="genitore_invalido" id="genitore_invalido" value="true" type="radio"> Si   </td>
  </tr>
      <tr>
    <td colspan="2">Il padre/la madre &egrave; genitore solo</td>
     <td colspan="2">
    <span id="genitore_solo">
    <input name="genitore_solo" id="genitore_solo" value="false" checked="checked" type="radio"> 
    No</span>
    <input name="genitore_solo" id="genitore_solo" value="true" type="radio"> Si   </td>
  </tr>
  <tr>
    <td colspan="4" ><p>vedova/o 
      <input id="vedovo" name="vedovo" type="checkbox">
    </p>
      <p>
        nubile
        <input id="nubile" name="nubile" type="checkbox">
      </p>
      <p>
        separato/divorziato con affido del minore
        <input id="separato" name="separato" type="checkbox">
      </p>
      <p>
        genitore solo con figlio non riconosciuto dall'altro genitore
        <input id="figlio_non_riconosciuto" name="figlio_non_riconosciuto" type="checkbox">
      </p>
      <p>genitore solo con figlio riconosciuto dall'altro genitore che non contribuisce n&egrave; all'educazione, n&egrave; al mantenimento, in possesso di dichiarazione di "affido esclusivo"
        <input id="affido_esclusivo" name="affido_esclusivo" type="checkbox">
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
    <input name="altri_figli_disabili" id="altri_figli_disabili" value="false" checked="checked" type="radio"> No
     <input name="altri_figli_disabili" id="altri_figli_disabili" value="true" type="radio"> Si   </td>
  </tr>
  <tr>
    <td colspan="2">ALTRE CONDIZIONI RILEVANTI AI FINI DEL PUNTEGGIO</td>
    <td colspan="1"><textarea name="altre_condizioni_calcolo_punteggio" cols="50" rows="5" readonly="readonly"></textarea></td>
  </tr>
    <tr>
    <td colspan="2">&nbsp;</td>
    <td colspan="2"></td>
  </tr>
   <tr>
     <td></td>
       	 	<td><input type="submit" name="bottone_submit" id="bottone_submit" value="Modifica" onClick="return settaAttributi(this)"/>
                <input type="reset" name="reset" value="Annulla" />
            </td>
          </tr>
</table>
 
</form>

</td><!--Chiudi content -->


<%@
include file="atsilo_files/footer.jsp"
 %>

</html>