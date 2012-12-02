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
include file="atsilo_files/sidebar_top_genitore.jsp"
 %>
<form>
  <table width="100%" border="0" cellspacing="0">

  <tr>
  	<td colspan="3">Allega certificazione ISEE relativa all'anno 2011 rilasciata da un centro di assistenza fiscale (CAF) </td>
    <td colspan="1" >
      <input id="vedovo" name="vedovo" type="checkbox">
</td>
   
  </tr>
  
  
  <tr>
    <td colspan="3"> il cui indicatore ISEE &egrave; pari a Euro </td>
    <td>
      <input name="isee" type="text" id="isee" maxlength="10" /></td>
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
  	<td colspan="3">&nbsp;</td>
    <td colspan="1" >
      <input id="vedovo" name="vedovo" type="checkbox">
</td>
   
  </tr>

  <tr>
    <td colspan="4">ALLEGATI<br>
      COPIA FRONTE/RETRO DEL DOCUMENTO DI RICONOSCIMENTO VALIDO DEL RICHIEDENTE (obbligatorio)<br>
      PRIMA DELL'INVIO DELLA DOMANDA SI RACCOMANDA DI CONTROLLARE L'ESATTA COMPILAZIONE DI TUTTI I CAMPI POICHE', DOPO L'INVIO, NON SARA' POSSIBILE EFFETTUARE ALCUNA MODIFICA<br>
      N.B.: Per completare l'invio della domanda &egrave; necessario inserire nel campo sottostante il codice così come appare nell'immagine che segue. Se la stessa non fosse correttamente visibile &egrave; possibile generare una nuova immagine con l'apposito pulsante.</td>
    
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



</body>
</html>